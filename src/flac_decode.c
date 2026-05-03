#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <x68k/dos.h>
#include <x68k/iocs.h>
#include <himem.h>
#include <utf8_cp932.h>
#include <jpeg.h>
#include "flac_decode.h"

//
//  init flac decoder handle
//
int32_t flac_decode_init(FLAC_DECODE_HANDLE* decode) {

  int32_t rc = -1;

  // baseline
  decode->flac_data = NULL;
  decode->flac_data_len = 0;
  decode->flac_data_pos = 0;

  // continuous read
  decode->continuous_read_len = 0;
  decode->continuous_read_pos = 0;

  // tags
  decode->tag_vendor = NULL;
  decode->tag_title = NULL;
  decode->tag_artist = NULL;
  decode->tag_album = NULL;

  // sampling parameters
  decode->sample_rate = -1;
  decode->channels = -1;
  decode->bps = -1;
  decode->num_samples = 0;
  decode->resample_counter = 0;
  decode->pending_len = 0;

  // fx_flac
  decode->fx_flac_buffer = NULL;
  decode->fx_flac = NULL;

  // fx_flac init
  decode->fx_flac_buffer = himem_malloc(fx_flac_size(FLAC_MAX_BLOCK_SIZE, FLAC_MAX_CHANNEL_COUNT));
  if (decode->fx_flac_buffer == NULL) goto exit;
  decode->fx_flac = fx_flac_init(decode->fx_flac_buffer, FLAC_MAX_BLOCK_SIZE, FLAC_MAX_CHANNEL_COUNT);

  // decode buffers
  decode->samples_len = sizeof(int32_t) * FLAC_MAX_BLOCK_SIZE * FLAC_MAX_CHANNEL_COUNT;
  decode->samples = himem_malloc(decode->samples_len);
  if (decode->samples == NULL) goto exit;

  rc = 0;

exit:
  return rc;
}

//
//  close decoder handle
//
void flac_decode_close(FLAC_DECODE_HANDLE* decode) {

  if (decode->fx_flac != NULL) {
    decode->fx_flac = NULL;
  }

  if (decode->fx_flac_buffer != NULL) {
    himem_free(decode->fx_flac_buffer);
    decode->fx_flac_buffer = NULL;
  }

  if (decode->samples != NULL) {  
    himem_free(decode->samples);
    decode->samples = NULL;
  }

  if (decode->tag_vendor != NULL) {
    free(decode->tag_vendor);
    decode->tag_vendor = NULL;
  }
  if (decode->tag_title != NULL) {
    free(decode->tag_title);
    decode->tag_title = NULL;
  }
  if (decode->tag_artist != NULL) {
    free(decode->tag_artist);
    decode->tag_artist = NULL;
  }
  if (decode->tag_album != NULL) {
    free(decode->tag_album);
    decode->tag_album = NULL;
  }

}

//
//  get stream info
//
int32_t flac_decode_get_stream_info(FLAC_DECODE_HANDLE* decode, int32_t fd) {

  int32_t rc = -1;

  if (decode == NULL) goto exit;

  // ID3v2タグの読み飛ばし(もしあれば)
  uint8_t id3_header[10];
  size_t ret = _dos_read(fd, id3_header, 10);
  if (ret != 10) {
    return -1;
  }

  // ID3v2マジックナンバー確認
  if (!(id3_header[0] == 'I' && id3_header[1] == 'D' && id3_header[2] == '3')) {

    // ID3がない場合はファイルの先頭(0)から読み直し
    _dos_seek(fd, 0, 0); 

  } else {

    // ID3v2のタグサイズ計算 (Syncsafe Integer)
    // このサイズは「ヘッダの10バイトを含まない」サイズであることに注意
    uint32_t body_size = ((uint32_t)(id3_header[6] & 0x7f) << 21) |
                         ((uint32_t)(id3_header[7] & 0x7f) << 14) |
                         ((uint32_t)(id3_header[8] & 0x7f) << 7)  |
                         ((uint32_t)(id3_header[9] & 0x7f));

    // フッター(Footer)の有無を確認 (Bit 4 of flags)
    // ID3v2.4などで末尾にフッターがある場合はさらに10バイト存在する
    uint32_t footer_size = (id3_header[5] & 0x10) ? 10 : 0;

    // 結論：スキップすべきサイズは「ヘッダ(10) + ボディ(body_size) + フッター(footer_size)」
    // 拡張ヘッダ等はbody_sizeの中に含まれているため、個別にシークして解析する必要はない
    _dos_seek(fd, body_size + footer_size, 1);

  }

  // FLAC先頭のアイキャッチおよびSTREAMINFOの読み込み
  uint8_t flac_header[FLAC_STREAMINFO_SIZE];
  size_t flac_header_len = sizeof(flac_header);
  if (_dos_read(fd, flac_header, flac_header_len) != flac_header_len) goto exit;
  if (memcmp(flac_header, "fLaC", 4) != 0) goto exit;

  // obtain stream information
  uint32_t used_bytes = flac_header_len;
  uint32_t decoded_len = 0;
  fx_flac_state_t state = fx_flac_process(decode->fx_flac, flac_header, &used_bytes, NULL, &decoded_len);
  if (state == FLAC_ERR) goto exit;
  decode->sample_rate = fx_flac_get_streaminfo(decode->fx_flac, FLAC_KEY_SAMPLE_RATE);
  decode->channels = fx_flac_get_streaminfo(decode->fx_flac, FLAC_KEY_N_CHANNELS);
  decode->bps = fx_flac_get_streaminfo(decode->fx_flac, FLAC_KEY_SAMPLE_SIZE);
  decode->num_samples = fx_flac_get_streaminfo(decode->fx_flac, FLAC_KEY_N_SAMPLES);
  rc = 0;

exit:
  return rc;
}

//
//  parse tags
//
int32_t flac_decode_parse_tags(FLAC_DECODE_HANDLE* decode, int32_t fd, int16_t brightness) {

  int32_t rc = -1;
  uint8_t* tag_body = NULL;

  for (;;) {

    uint8_t tag_header[4];
    if (_dos_read(fd, tag_header, 4) != 4) goto exit;

    uint8_t tag_type = tag_header[0];
    size_t tag_size = (tag_header[1] << 16) + (tag_header[2] << 8) + tag_header[3];

    if ((tag_type & 0x7f) == 4) {

      // タグボディ読み込み(メインメモリ)
      tag_body = malloc(tag_size);
      if (tag_body == NULL) goto exit;

      size_t read_size = 0;
      do {
        size_t len = _dos_read(fd, tag_body + read_size, tag_size - read_size);
        if (len == 0) break;
        read_size += len;
      } while (read_size < tag_size);

      size_t ofs = 0;

      // VORBIS_COMMENT
      uint32_t vendor_comment_size = tag_body[ofs] + (tag_body[ofs+1] << 8) + (tag_body[ofs+2] << 16) + (tag_body[ofs+3] << 24);
      ofs += 4;

      decode->tag_vendor = malloc(vendor_comment_size * 2);   // 念の為多めに
      utf8_to_cp932(decode->tag_vendor, vendor_comment_size * 2, tag_body + ofs, vendor_comment_size);
      ofs += vendor_comment_size;

      uint32_t num_comments = tag_body[ofs] + (tag_body[ofs+1] << 8) + (tag_body[ofs+2] << 16) + (tag_body[ofs+3] << 24);
      ofs += 4;

      for (uint32_t i = 0; i < num_comments; i++) {

        uint8_t tag_key[32];
        size_t comment_size = tag_body[ofs] + (tag_body[ofs+1] << 8) + (tag_body[ofs+2] << 16) + (tag_body[ofs+3] << 24);
        ofs += 4;

        for (uint32_t j = 0; j < comment_size && j < 31; j++) {
          if (tag_body[ofs + j] != '=') continue;
          int16_t epos = j;
          memcpy(tag_key, tag_body + ofs, epos);
          tag_key[epos] = '\0';
          size_t value_size = comment_size - epos - 1;
          if (value_size > 0) {
            if (strcasecmp(tag_key, "ARTIST") == 0) {
              if (decode->tag_artist != NULL) free(decode->tag_artist);
              decode->tag_artist = malloc(value_size * 2 + 1);
              utf8_to_cp932(decode->tag_artist, value_size * 2, tag_body + ofs + epos + 1, value_size);
            } else if (strcasecmp(tag_key, "ALBUM") == 0) {
              if (decode->tag_album != NULL) free(decode->tag_album);
              decode->tag_album = malloc(value_size * 2 + 1);
              utf8_to_cp932(decode->tag_album, value_size * 2, tag_body + ofs + epos + 1, value_size);
            } else if (strcasecmp(tag_key, "TITLE") == 0) {
              if (decode->tag_title != NULL) free(decode->tag_title);
              decode->tag_title = malloc(value_size * 2 + 1);
              utf8_to_cp932(decode->tag_title, value_size * 2, tag_body + ofs + epos + 1, value_size);
            }
          }
          break;
        }

        ofs += comment_size;

      }

      free(tag_body);
      tag_body = NULL;

    } else if (brightness > 0 && (tag_type & 0x7f) == 6) {

      // PICTUREブロックのヘッダ（PictureType:4 + MIME_Len:4）をまず読む
      uint8_t pic_head[8];
      if (_dos_read(fd, pic_head, 8) != 8) goto exit;

      uint32_t mime_type_size = (pic_head[4] << 24) | (pic_head[5] << 16) | (pic_head[6] << 8) | pic_head[7];

      // MIMEタイプを判定
      uint8_t mime_type[16];
      size_t check_len = (mime_type_size < 15) ? mime_type_size : 15;
      _dos_read(fd, mime_type, check_len);
      mime_type[check_len] = '\0';

      if (strcasecmp(mime_type, "image/jpeg") == 0) {

        // 残りのMIME文字列を読み飛ばす
        if (mime_type_size > check_len) _dos_seek(fd, mime_type_size - check_len, 1);

        // Descriptionサイズ以降、画像データサイズ直前までを読み進める
        uint8_t pic_info[28]; // DescLen:4 + Width:4 + Height:4 + Depth:4 + Colors:4 + DataLen:4
        // 注意：Description文字列自体を飛ばす必要がある
        uint8_t desc_len_buf[4];
        _dos_read(fd, desc_len_buf, 4);
        uint32_t desc_size = (desc_len_buf[0] << 24) | (desc_len_buf[1] << 16) | (desc_len_buf[2] << 8) | desc_len_buf[3];
        _dos_seek(fd, desc_size, 1); // 説明文をスキップ

        // 画像スペックとデータサイズを取得
        _dos_read(fd, pic_info, 20); // Width, Height, Depth, Colors, DataLen
        uint32_t picture_size = (pic_info[16] << 24) | (pic_info[17] << 16) | (pic_info[18] << 8) | pic_info[19];

        // ここで初めて画像データ本体のためのメモリを確保
        tag_body = malloc(picture_size);
        if (tag_body != NULL) {
          size_t read_size = 0;
          do {
            size_t len = _dos_read(fd, tag_body + read_size, picture_size - read_size);
            if (len == 0) break;
            read_size += len;
          } while (read_size < picture_size);        
          if (picture_size > 2 && tag_body[0] == 0xff && tag_body[1] == 0xd8) {
            JPEG jpg;
            jpeg_open(&jpg, brightness);
            jpeg_draw(&jpg, tag_body, picture_size, 0);
            jpeg_close(&jpg);
          }
          free(tag_body);
          tag_body = NULL;
        } else {
          _dos_seek(fd, picture_size, 1); // メモリ確保失敗時はスキップ
        }
      } else {
        // JPEG以外（PNG等）なら、残りのブロックサイズを一括シークで飛ばす
        // ここまでの既読分：8(pic_head) + mime_type_size
        _dos_seek(fd, tag_size - (8 + mime_type_size), 1);
      }
    } else {

      _dos_seek(fd, tag_size, 1);

    }

    if (tag_type & 0x80) {
      // ダミーの「最後のメタデータブロック（空）」ヘッダ
      // Bit 7(Last)=1, Type=0(StreamInfo), Length=0
      uint8_t dummy_end_header[4] = { 0x84, 0x00, 0x00, 0x00 };
      uint32_t used_bytes = 4;
      uint32_t decoded_len = 0;
      fx_flac_process(decode->fx_flac, dummy_end_header, &used_bytes, NULL, &decoded_len);
      break;
    }
  }

  rc = 0;

exit:

  if (tag_body != NULL) {
    free(tag_body);
    tag_body = NULL;
  }

  return rc;
}

//
//  setup decode operation
//
int32_t flac_decode_setup(FLAC_DECODE_HANDLE* decode, void* flac_data, size_t flac_data_len, size_t continuous_read_len) {

  int32_t rc = -1;

  // baseline
  decode->flac_data = flac_data;
  decode->flac_data_len = flac_data_len;
  decode->flac_data_pos = 0;

  // continuous read
  decode->continuous_read_len = continuous_read_len;
  decode->continuous_read_pos = 0;

  // reset sampling parameters
  decode->resample_counter = 0;
  decode->pending_len = 0;

  rc = 0;

exit:
  return rc;
}

//
//  decode flac stream
//
int32_t flac_decode_full(FLAC_DECODE_HANDLE* decode, int16_t* decode_buffer, size_t decode_buffer_bytes, size_t* decoded_bytes, SPECTRUM_STREAM_HANDLE* spectrum) {

  // default return code
  int32_t rc = -1;

  // decode counter
  int32_t decode_ofs = 0;

#ifdef __VERBOSE__
  uint32_t t0 = (_iocs_ontime()).sec;
#endif

  for (;;) {

    uint32_t used_bytes = decode->continuous_read_len > 0 ? decode->continuous_read_len - decode->continuous_read_pos : decode->flac_data_len - decode->flac_data_pos;
    uint32_t sample_len = (decode_buffer_bytes / sizeof(int16_t)) - decode_ofs;
    if (fx_flac_process(decode->fx_flac, 
                        &(decode->flac_data[decode->continuous_read_len > 0 ? decode->continuous_read_pos : decode->flac_data_pos]), 
                        &used_bytes, 
                        &(decode_buffer[decode_ofs]), 
                        &sample_len) == FLAC_ERR) goto exit;

    decode->flac_data_pos += used_bytes;

    if (spectrum != NULL) {
      spectrum_stream_process(spectrum, &(decode_buffer[decode_ofs]), sample_len / decode->channels);
    }

    if (decode->continuous_read_len > 0) decode->continuous_read_pos += used_bytes;
    decode_ofs += sample_len;

    // end of FLAC
    if (sample_len == 0) break;

    if (decode_ofs * sizeof(int16_t) + sample_len * decode->channels * sizeof(int16_t) > decode_buffer_bytes) {
      break;
    }

  }

  // success
  rc = 0;

exit:

  // push resampled count
  *decoded_bytes = decode_ofs * sizeof(int16_t);

#ifdef __VERBOSE__
  uint32_t t1 = (_iocs_ontime()).sec;
  printf("%d samples/sec\n",(int32_t)(decode_ofs * 100.0 / 2.0 / (t1 - t0)));
#endif

  return rc;
}

//
//  decode flac stream with resampling
//
int32_t flac_decode_resample(FLAC_DECODE_HANDLE* decode, int16_t* decode_buffer, size_t decode_buffer_bytes, int16_t resample_freq, size_t* decoded_bytes, SPECTRUM_STREAM_HANDLE* spectrum) {

  // default return code
  int32_t rc = -1;

  // decode counter
  int32_t decode_ofs = 0;

  for (;;) {

    uint32_t used_bytes = decode->continuous_read_len > 0 ? decode->continuous_read_len - decode->continuous_read_pos : decode->flac_data_len - decode->flac_data_pos;
    uint32_t sample_len = decode->samples_len;

    if (fx_flac_process(decode->fx_flac, 
                        &(decode->flac_data[decode->continuous_read_len > 0 ? decode->continuous_read_pos : decode->flac_data_pos]), 
                        &used_bytes, 
                        decode->samples, 
                        &sample_len) == FLAC_ERR) goto exit;

    decode->flac_data_pos += used_bytes;

    if (spectrum != NULL) {
      spectrum_stream_process(spectrum, decode->samples, sample_len / decode->channels);
    }

    if (decode->continuous_read_len > 0) decode->continuous_read_pos += used_bytes;

    // end of FLAC
    if (sample_len == 0) break;

    uint32_t adjusted_sample_rate = decode->sample_rate > 48000 ? decode->sample_rate / 2 : decode->sample_rate;
    for (int32_t i = 0; i < sample_len; i += 2) {
      // down sampling
      decode->resample_counter += resample_freq;
      if (decode->resample_counter < adjusted_sample_rate) {
        continue;
      }
      int16_t lch = decode->samples[i] / 16;      // 12bit
      int16_t rch = decode->samples[i+1] / 16;    // 12bit
      decode_buffer[ decode_ofs++ ] = (lch + rch) / 2;
      decode->resample_counter -= adjusted_sample_rate;
    }

    if (decode_ofs * sizeof(int16_t) + sample_len * sizeof(int16_t) / (decode->sample_rate > 48000 ? 4 : 2) > decode_buffer_bytes) {
      // no more buffer space to write
      break;
    }

  }

  // success
  rc = 0;

exit:

  // push resampled count
  *decoded_bytes = decode_ofs * sizeof(int16_t);

  return rc;
}
