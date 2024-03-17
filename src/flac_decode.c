#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "himem.h"
#include "utf8_cp932.h"
#include "jpeg_decode.h"
#include "flac_decode.h"

//
//  utf-8 to cp932
//
static void convert_utf8_to_cp932(uint8_t* cp932_buffer, uint8_t* utf8_buffer, size_t utf8_bytes) {

  // CAUTION: utf8_buffer may be odd address and word access will fail on 68000 machines

  int16_t utf8_ofs = 0;
  int16_t cp932_ofs = 0;

  while (utf8_ofs < utf8_bytes) {
    uint8_t b0 = utf8_buffer[ utf8_ofs++ ];
    if (b0 <= 0x7f) {
      cp932_buffer[ cp932_ofs++ ] = b0;
    } else {
      uint16_t* code_map = NULL;
      int16_t code_map_len = 0;
      switch (b0) {
        case 0xc2: { code_map = utf8_to_cp932_c2; code_map_len = utf8_to_cp932_c2_len; break; }
        case 0xc3: { code_map = utf8_to_cp932_c3; code_map_len = utf8_to_cp932_c3_len; break; }
        case 0xce: { code_map = utf8_to_cp932_ce; code_map_len = utf8_to_cp932_ce_len; break; }
        case 0xcf: { code_map = utf8_to_cp932_cf; code_map_len = utf8_to_cp932_cf_len; break; }
        case 0xd0: { code_map = utf8_to_cp932_d0; code_map_len = utf8_to_cp932_d0_len; break; }
        case 0xd1: { code_map = utf8_to_cp932_d1; code_map_len = utf8_to_cp932_d1_len; break; }
        case 0xe2: { code_map = utf8_to_cp932_e2; code_map_len = utf8_to_cp932_e2_len; break; }
        case 0xe3: { code_map = utf8_to_cp932_e3; code_map_len = utf8_to_cp932_e3_len; break; }
        case 0xe4: { code_map = utf8_to_cp932_e4; code_map_len = utf8_to_cp932_e4_len; break; }
        case 0xe5: { code_map = utf8_to_cp932_e5; code_map_len = utf8_to_cp932_e5_len; break; }
        case 0xe6: { code_map = utf8_to_cp932_e6; code_map_len = utf8_to_cp932_e6_len; break; }
        case 0xe7: { code_map = utf8_to_cp932_e7; code_map_len = utf8_to_cp932_e7_len; break; }
        case 0xe8: { code_map = utf8_to_cp932_e8; code_map_len = utf8_to_cp932_e8_len; break; }
        case 0xe9: { code_map = utf8_to_cp932_e9; code_map_len = utf8_to_cp932_e9_len; break; }
        case 0xef: { code_map = utf8_to_cp932_ef; code_map_len = utf8_to_cp932_ef_len; break; }
      }
      if (code_map != NULL) {
        uint16_t key = 0;
        uint16_t value = 0;
        if (b0 <= 0xdf) {
          key = utf8_buffer[ utf8_ofs++ ];
        } else {
          key = utf8_buffer[ utf8_ofs ] * 256 + utf8_buffer[ utf8_ofs + 1 ];
          utf8_ofs += 2;
        }
        for (int16_t i = 0; i < code_map_len; i++) {
          if (code_map[ i * 2 ] == key) {
            value = code_map[ i * 2 + 1 ];
            break;
          }
        }
        if (value > 0) {
          cp932_buffer[ cp932_ofs++ ] = value / 256;
          cp932_buffer[ cp932_ofs++ ] = value & 0xff;
        }
      } else {
        cp932_buffer[ cp932_ofs++ ] = utf8_buffer[ utf8_ofs ];
      } 
    }
  }

  cp932_buffer[ cp932_ofs++ ] = '\0';

}

//
//  init flac decoder handle
//
int32_t flac_decode_init(FLAC_DECODE_HANDLE* decode) {

  int32_t rc = -1;

  // baseline
  decode->flac_data = NULL;
  decode->flac_data_len = 0;

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
  decode->fx_flac_buffer = himem_malloc(fx_flac_size(FLAC_MAX_BLOCK_SIZE, FLAC_MAX_CHANNEL_COUNT), 1);
  if (decode->fx_flac_buffer == NULL) goto exit;
  decode->fx_flac = fx_flac_init(decode->fx_flac_buffer, FLAC_MAX_BLOCK_SIZE, FLAC_MAX_CHANNEL_COUNT);

  // decode buffers
  decode->samples_len = sizeof(int32_t) * FLAC_MAX_BLOCK_SIZE * FLAC_MAX_CHANNEL_COUNT;
  decode->samples = himem_malloc(decode->samples_len, 1);
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
    himem_free(decode->fx_flac_buffer, 1);
    decode->fx_flac_buffer = NULL;
  }

  if (decode->samples != NULL) {  
    himem_free(decode->samples, 1);
    decode->samples = NULL;
  }

  if (decode->tag_vendor != NULL) {
    himem_free(decode->tag_vendor, 1);
    decode->tag_vendor = NULL;
  }
  if (decode->tag_title != NULL) {
    himem_free(decode->tag_title, 1);
    decode->tag_title = NULL;
  }
  if (decode->tag_artist != NULL) {
    himem_free(decode->tag_artist, 1);
    decode->tag_artist = NULL;
  }
  if (decode->tag_album != NULL) {
    himem_free(decode->tag_album, 1);
    decode->tag_album = NULL;
  }

}

//
//  get skip offset (skip ID3v2 tags)
//
int32_t flac_decode_get_skip_offset(FLAC_DECODE_HANDLE* decode, FILE* fp) {

  // read the first 10 bytes of the FLAC file
  uint8_t flac_header[10];
  size_t ret = fread(flac_header, 1, 10, fp);
  if (ret != 10) {
    return -1;
  }

  // check if the file has an ID3v2 tag
  if (!(flac_header[0] == 'I' && flac_header[1] == 'D' && flac_header[2] == '3')) {
    return 0;
  }

  // extract the total tag size (syncsafe integer)
  uint32_t total_tag_size = ((flac_header[6] & 0x7f) << 21) | ((flac_header[7] & 0x7f) << 14) |
                            ((flac_header[8] & 0x7f) << 7)  | (flac_header[9] & 0x7f);

  // ID3v2 version
  int16_t id3v2_version = flac_header[3];
  if (id3v2_version < 0x03) {
    return total_tag_size + 10;     // does not support ID3v2.2 or before
  }

  // skip extended ID3v2 header
  if (flac_header[5] & (1<<6)) {
    uint8_t ext_header[6];
    fread(ext_header, 1, 6, fp);
    uint32_t ext_header_size = id3v2_version == 0x03 ? *((uint32_t*)(ext_header + 0)) :
                                ((ext_header[0] & 0x7f) << 21) | ((ext_header[1] & 0x7f) << 14) |
                                ((ext_header[2] & 0x7f) << 7)  | (ext_header[3] & 0x7f);
    fseek(fp, ext_header_size, SEEK_CUR);
    total_tag_size -= 6 + ext_header_size;
  }

  return 10 + total_tag_size;
}

//
//  setup decode operation
//
int32_t flac_decode_setup(FLAC_DECODE_HANDLE* decode, void* flac_data, size_t flac_data_len, int16_t brightness, int16_t half_size) {

  int32_t rc = -1;

  // baseline
  decode->flac_data = flac_data;
  decode->flac_data_len = flac_data_len;
  decode->flac_data_pos = 0;

  // reset sampling parameters
  decode->sample_rate = -1;
  decode->channels = -1;
  decode->bps = -1;
  decode->num_samples = 0;
  decode->resample_counter = 0;

  // obtain sampling parameters
  fx_flac_state_t state;
  do {
    uint32_t used_bytes = decode->flac_data_len - decode->flac_data_pos;
    uint32_t decoded_len = decode->samples_len;
    state = fx_flac_process(decode->fx_flac, &(decode->flac_data[decode->flac_data_pos]), &used_bytes, decode->samples, &decoded_len);
    if (state == FLAC_ERR) goto exit;
    decode->flac_data_pos += used_bytes;
    //printf("setup pos %d\n", decode->flac_data_pos);
    //printf("%d %d %d\n",state, used_bytes, decoded_len);
  } while (state != FLAC_END_OF_METADATA);

  decode->sample_rate = fx_flac_get_streaminfo(decode->fx_flac, FLAC_KEY_SAMPLE_RATE);
  decode->channels = fx_flac_get_streaminfo(decode->fx_flac, FLAC_KEY_N_CHANNELS);
  decode->bps = fx_flac_get_streaminfo(decode->fx_flac, FLAC_KEY_SAMPLE_SIZE);
  decode->num_samples = fx_flac_get_streaminfo(decode->fx_flac, FLAC_KEY_N_SAMPLES);

  // obtain tags
  size_t tag_ofs = 4;

  for (;;) {

    uint8_t meta_type = decode->flac_data[tag_ofs];
    size_t meta_size = (decode->flac_data[tag_ofs+1] << 16) + (decode->flac_data[tag_ofs+2] << 8) + decode->flac_data[tag_ofs+3];

    tag_ofs += 4;

    if ((meta_type & 0x7f) == 4) {

      // VORBIS_COMMENT

      size_t vendor_comment_size = decode->flac_data[tag_ofs] + 
                                   (decode->flac_data[tag_ofs+1] << 8) +
                                   (decode->flac_data[tag_ofs+2] << 16) +
                                   (decode->flac_data[tag_ofs+3] << 24);

      tag_ofs += 4;

      decode->tag_vendor = himem_malloc(vendor_comment_size * 2, 1);
      convert_utf8_to_cp932(decode->tag_vendor, &(decode->flac_data[tag_ofs]), vendor_comment_size);
      
      tag_ofs += vendor_comment_size;

      size_t num_comments = decode->flac_data[tag_ofs] + 
                            (decode->flac_data[tag_ofs+1] << 8) +
                            (decode->flac_data[tag_ofs+2] << 16) +
                            (decode->flac_data[tag_ofs+3] << 24);

      tag_ofs += 4;

      for (int16_t i = 0; i < num_comments; i++) {

        uint8_t tag_key[] = "                ";

        size_t comment_size = decode->flac_data[tag_ofs] + 
                              (decode->flac_data[tag_ofs+1] << 8) +
                              (decode->flac_data[tag_ofs+2] << 16) +
                              (decode->flac_data[tag_ofs+3] << 24);

        tag_ofs += 4;

        for (int16_t j = 0; j < comment_size && j < 16; j++) {
          if (decode->flac_data[tag_ofs + j] != '=') continue;
          int16_t epos = j;
          memcpy(tag_key, &(decode->flac_data[tag_ofs]), epos);
          tag_key[epos] = '\0';
          size_t value_size = comment_size - epos - 1;
          //printf("tag_key=[%s], epos=%d, comment_size=%d, value_size=%d\n", tag_key, epos, comment_size, value_size);
          if (value_size > 0) {
            if (stricmp(tag_key, "ARTIST") == 0) {
              decode->tag_artist = himem_malloc(value_size * 2, 1);
              convert_utf8_to_cp932(decode->tag_artist, &(decode->flac_data[tag_ofs + epos + 1]), value_size);
            } else if (stricmp(tag_key, "ALBUM") == 0) {
              decode->tag_album = himem_malloc(value_size * 2, 1);
              convert_utf8_to_cp932(decode->tag_album, &(decode->flac_data[tag_ofs + epos + 1]), value_size);
            } else if (stricmp(tag_key, "TITLE") == 0) {
              decode->tag_title = himem_malloc(value_size * 2, 1);
              convert_utf8_to_cp932(decode->tag_title, &(decode->flac_data[tag_ofs + epos + 1]), value_size);
            }
          }
          break;
        }

        tag_ofs += comment_size;

      }

    } else if (brightness > 0 && (meta_type & 0x7f) == 6) {

      // PICTURE

      uint32_t picture_type = (decode->flac_data[tag_ofs] << 24) + 
                              (decode->flac_data[tag_ofs+1] << 16) +
                              (decode->flac_data[tag_ofs+2] << 8) +
                              decode->flac_data[tag_ofs+3];

      tag_ofs += 4;

      size_t mime_type_size = (decode->flac_data[tag_ofs] << 24) + 
                              (decode->flac_data[tag_ofs+1] << 16) +
                              (decode->flac_data[tag_ofs+2] << 8) +
                              decode->flac_data[tag_ofs+3];

      tag_ofs += 4;

      if (mime_type_size >= 10 && memcmp("image/jpeg", &(decode->flac_data[tag_ofs]), 10) == 0) {

        tag_ofs += mime_type_size;

        //printf("mime_type_size=%d\n", mime_type_size);

        size_t picture_desc_size = (decode->flac_data[tag_ofs] << 24) + 
                                   (decode->flac_data[tag_ofs+1] << 16) +
                                   (decode->flac_data[tag_ofs+2] << 8) +
                                   decode->flac_data[tag_ofs+3];

        //printf("picture_desc_size=%d\n", picture_desc_size);

        tag_ofs += 4 + picture_desc_size + 4 + 4 + 4 + 4;

        size_t picture_size = (decode->flac_data[tag_ofs] << 24) + 
                              (decode->flac_data[tag_ofs+1] << 16) +
                              (decode->flac_data[tag_ofs+2] << 8) +
                              decode->flac_data[tag_ofs+3];
      
        //printf("picture_size=%d\n", picture_size);

        tag_ofs += 4;

        uint8_t* picture_data = &(decode->flac_data[tag_ofs]);
        if (picture_size > 2 && picture_data[0] == 0xff && picture_data[1] == 0xd8) {
          JPEG_DECODE_HANDLE jpeg_decode;
          jpeg_decode_init(&jpeg_decode, brightness, half_size);
          if (jpeg_decode_exec(&jpeg_decode, picture_data, picture_size) != 0) {
//          printf("unsupported jpeg artwork format. (progressive JPEG?)\n");
          }
          jpeg_decode_close(&jpeg_decode);
        }

        tag_ofs += picture_size;

      } else {

        tag_ofs += meta_size - 8;

      }

    } else {

      tag_ofs += meta_size;

    }

    if (meta_type & 0x80) break;

  }

  rc = 0;

exit:
  return rc;
}

//
//  decode flac stream
//
int32_t flac_decode_full(FLAC_DECODE_HANDLE* decode, int16_t* decode_buffer, size_t decode_buffer_bytes, size_t* decoded_bytes) {

  // default return code
  int32_t rc = -1;

  // decode counter
  int32_t decode_ofs = 0;

  for (;;) {

     uint32_t sample_len = decode->samples_len;

    if (decode->pending_len > 0) {

      sample_len = decode->pending_len;
      decode->pending_len = 0;

    } else {

      uint32_t used_bytes = decode->flac_data_len - decode->flac_data_pos;
      
      if (fx_flac_process(decode->fx_flac, 
                          &(decode->flac_data[decode->flac_data_pos]), 
                          &used_bytes, 
                          decode->samples, 
                          &sample_len) == FLAC_ERR) goto exit;

      decode->flac_data_pos += used_bytes;

    }

    // end of FLAC
    if (sample_len == 0) break;

    if (decode_ofs * sizeof(int16_t) + sample_len * decode->channels * sizeof(int16_t) > decode_buffer_bytes) {
      // no more buffer space to write
      decode->pending_len = sample_len;
      break;
    }

    if (decode->bps == 16) {

      for (int32_t i = 0; i < sample_len; i += 2) {
        decode_buffer[ decode_ofs++ ] = *((int16_t*)&(decode->samples[i]));
        decode_buffer[ decode_ofs++ ] = *((int16_t*)&(decode->samples[i+1]));
      }

    } else if (decode->bps == 24) {

      for (int32_t i = 0; i < sample_len; i += 2) {
//        decode_buffer[ decode_ofs++ ] = decode->samples[i] / 65536;
//        decode_buffer[ decode_ofs++ ] = decode->samples[i + 1] / 65536;
        decode_buffer[ decode_ofs++ ] = *((int16_t*)&(decode->samples[i]));
        decode_buffer[ decode_ofs++ ] = *((int16_t*)&(decode->samples[i+1]));
      }

    }

  }

  // success
  rc = 0;

exit:

  // push resampled count
  *decoded_bytes = decode_ofs * sizeof(int16_t);

  return rc;
}

//
//  decode flac stream (half rate)
//
int32_t flac_decode_half(FLAC_DECODE_HANDLE* decode, int16_t* decode_buffer, size_t decode_buffer_bytes, size_t* decoded_bytes) {

  // default return code
  int32_t rc = -1;

  // decode counter
  int32_t decode_ofs = 0;

  for (;;) {

     uint32_t sample_len = decode->samples_len;

    if (decode->pending_len > 0) {

      sample_len = decode->pending_len;
      decode->pending_len = 0;

    } else {

      uint32_t used_bytes = decode->flac_data_len - decode->flac_data_pos;
      
      if (fx_flac_process(decode->fx_flac, 
                          &(decode->flac_data[decode->flac_data_pos]), 
                          &used_bytes, 
                          decode->samples, 
                          &sample_len) == FLAC_ERR) goto exit;

      decode->flac_data_pos += used_bytes;

    }

    // end of FLAC
    if (sample_len == 0) break;

    if (decode_ofs * sizeof(int16_t) + sample_len * decode->channels * sizeof(int16_t) / 2 > decode_buffer_bytes) {
      // no more buffer space to write
      decode->pending_len = sample_len;
      break;
    }

    if (decode->bps == 16) {

      for (int32_t i = 0; i < sample_len; i += 4) {
        decode_buffer[ decode_ofs++ ] = *((int16_t*)&(decode->samples[i]));
        decode_buffer[ decode_ofs++ ] = *((int16_t*)&(decode->samples[i+1]));
      }

    } else if (decode->bps == 24) {

      for (int32_t i = 0; i < sample_len; i += 4) {
        decode_buffer[ decode_ofs++ ] = *((int16_t*)&(decode->samples[i]));
        decode_buffer[ decode_ofs++ ] = *((int16_t*)&(decode->samples[i+1]));
      }

    }

  }

  // success
  rc = 0;

exit:

  // push resampled count
  *decoded_bytes = decode_ofs * sizeof(int16_t);

  return rc;
}

//
//  decode flac stream with resampling
//
int32_t flac_decode_resample(FLAC_DECODE_HANDLE* decode, int16_t* decode_buffer, size_t decode_buffer_bytes, int16_t resample_freq, size_t* decoded_bytes) {

  // default return code
  int32_t rc = -1;

  // decode counter
  int32_t decode_ofs = 0;

  for (;;) {

    uint32_t sample_len = decode->samples_len;

    if (decode->pending_len > 0) {

      sample_len = decode->pending_len;
      decode->pending_len = 0;

    } else {

      uint32_t used_bytes = decode->flac_data_len - decode->flac_data_pos;

      if (fx_flac_process(decode->fx_flac, 
                          &(decode->flac_data[decode->flac_data_pos]), 
                          &used_bytes, 
                          decode->samples, 
                          &sample_len) == FLAC_ERR) {
                            //printf("detected FLAC_ERR\n");
                            goto exit;
                          }

      decode->flac_data_pos += used_bytes;
      //printf("%d %d %d\n", decode->flac_data_pos, used_bytes, sample_len);

    }

    // end of FLAC
    if (sample_len == 0) break;

    if (decode_ofs * sizeof(int16_t) + sample_len * sizeof(int16_t) / 2 > decode_buffer_bytes) {
      // no more buffer space to write
      decode->pending_len = sample_len;
      //printf("no more buffer space.\n");
      break;
    }

    if (decode->bps == 16) {

      for (int32_t i = 0; i < sample_len; i += 2) {
        // down sampling
        decode->resample_counter += resample_freq;
        if (decode->resample_counter < decode->sample_rate) {
          continue;
        }
        int16_t lch = *((int16_t*)&(decode->samples[i])) / 16;      // 12bit
        int16_t rch = *((int16_t*)&(decode->samples[i+1])) / 16;    // 12bit
        decode_buffer[ decode_ofs++ ] = (lch + rch) / 2;
        decode->resample_counter -= decode->sample_rate;
      }

    } else if (decode->bps == 24) {

      for (int32_t i = 0; i < sample_len; i += 2) {
        // down sampling
        decode->resample_counter += resample_freq;
        if (decode->resample_counter < decode->sample_rate) {
          continue;
        }
        int16_t lch = *((int16_t*)&(decode->samples[i])) / 16;      // 12bit
        int16_t rch = *((int16_t*)&(decode->samples[i+1])) / 16;    // 12bit
        decode_buffer[ decode_ofs++ ] = (lch + rch) / 2;
//        decode_buffer[ decode_ofs++ ] = (decode->samples[i] / 65536 / 16 + decode->samples[i + 1] / 65536 / 16) / 2;
        decode->resample_counter -= decode->sample_rate;
      }

    }

  }

  // success
  rc = 0;

exit:

  // push resampled count
  *decoded_bytes = decode_ofs * sizeof(int16_t);

  return rc;
}
