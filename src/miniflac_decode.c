#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "himem.h"
#include "flac_decode.h"

//
//  init flac decoder handle
//
int32_t flac_decode_init(FLAC_DECODE_HANDLE* decode) {

  int32_t rc = -1;

  // baseline
  decode->flac_data = NULL;
  decode->flac_data_len = 0;

  // tags
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

  // miniflac
  memset(&(decode->miniflac), 0, sizeof(MINIFLAC));

  // decode buffers
  decode->samples = himem_malloc(sizeof(int32_t*) * FLAC_MAX_CHANNELS, 1);
  if (decode->samples == NULL) goto exit;

  for (int16_t i = 0; i < FLAC_MAX_CHANNELS; i++) {
    decode->samples[i] = himem_malloc(sizeof(int32_t) * FLAC_DECODE_BUFFER_LEN, 1);
    if (decode->samples[i] == NULL) goto exit;
  }

  rc = 0;

exit:
  return rc;
}

//
//  close decoder handle
//
void flac_decode_close(FLAC_DECODE_HANDLE* decode) {

  if (decode->samples != NULL) {
    for (int16_t i = 0; i < FLAC_MAX_CHANNELS; i++) {
      if (decode->samples[i] != NULL) {
        himem_free(decode->samples[i], 1);
        decode->samples[i] = NULL;
      }
    }
    himem_free(decode->samples, 1);
    decode->samples = NULL;
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
//  setup decode operation
//
int32_t flac_decode_setup(FLAC_DECODE_HANDLE* decode, void* flac_data, size_t flac_data_len) {

  int32_t rc = -1;

  // baseline
  decode->flac_data = flac_data;
  decode->flac_data_len = flac_data_len;
  decode->flac_data_pos = 0;

  // sampling parameters
  decode->sample_rate = -1;
  decode->channels = -1;
  decode->bps = -1;
  decode->num_samples = 0;
  decode->resample_counter = 0;

  // init miniflac decoder
  miniflac_init(&(decode->miniflac), MINIFLAC_CONTAINER_UNKNOWN);

  // sync
  MINIFLAC* decoder = &(decode->miniflac);
  uint32_t used_bytes = 0;
  if (miniflac_sync(decoder,
                    &(decode->flac_data[decode->flac_data_pos]),
                    decode->flac_data_len - decode->flac_data_pos,
                    &used_bytes) != MINIFLAC_OK) goto exit;
  decode->flac_data_pos += used_bytes;

  while (decoder->state == MINIFLAC_METADATA) {

    if (decoder->metadata.header.type == MINIFLAC_METADATA_STREAMINFO) {

      // sample rate
      uint32_t temp32;
      if (miniflac_streaminfo_sample_rate(decoder, 
                                          &(decode->flac_data[decode->flac_data_pos]), 
                                          decode->flac_data_len - decode->flac_data_pos,
                                          &used_bytes,
                                          &temp32) != MINIFLAC_OK) goto exit;                                
      decode->flac_data_pos += used_bytes;
      decode->sample_rate = temp32;

      // channels
      uint8_t temp8;
      if (miniflac_streaminfo_channels(decoder,
                                      &(decode->flac_data[decode->flac_data_pos]),
                                      decode->flac_data_len - decode->flac_data_pos,
                                      &used_bytes,
                                      &temp8) != MINIFLAC_OK) goto exit;
      decode->flac_data_pos += used_bytes;
      decode->channels = temp8;

      // bps (bit per sample)
      if (miniflac_streaminfo_bps(decoder,
                                  &(decode->flac_data[decode->flac_data_pos]),
                                  decode->flac_data_len - decode->flac_data_pos,
                                  &used_bytes,
                                  &temp8) != MINIFLAC_OK) goto exit;
      decode->flac_data_pos += used_bytes;
      decode->bps = temp8;

      // total samples
      uint64_t temp64;
      if (miniflac_streaminfo_total_samples(decoder,
                                            &(decode->flac_data[decode->flac_data_pos]),
                                            decode->flac_data_len - decode->flac_data_pos,
                                            &used_bytes,
                                            &temp64) != MINIFLAC_OK) goto exit;
      decode->flac_data_pos += used_bytes;
      decode->num_samples = temp64;

    }

    // sync
    if (miniflac_sync(decoder,
                      &(decode->flac_data[decode->flac_data_pos]),
                      decode->flac_data_len - decode->flac_data_pos,
                      &used_bytes) != MINIFLAC_OK) goto exit;
    decode->flac_data_pos += used_bytes;

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

  // used bytes
  uint32_t used_bytes = 0;

  // decoder
  MINIFLAC* decoder = &(decode->miniflac);

  for (;;) {

    size_t frame_len = 0;

    if (decode->pending_len > 0) {

      frame_len = decode->pending_len;
      decode->pending_len = 0;

    } else {
  
      if (miniflac_decode(decoder,
                          &(decode->flac_data[decode->flac_data_pos]),
                          decode->flac_data_len - decode->flac_data_pos,
                          &used_bytes,
                          decode->samples) != MINIFLAC_OK) break;
    
      decode->flac_data_pos += used_bytes;
      frame_len = decoder->frame.header.block_size;
    }

    if (decode_ofs * sizeof(int16_t) + frame_len * decoder->frame.header.channels * sizeof(int16_t) > decode_buffer_bytes) {
      // no more buffer space to write
      decode->pending_len = frame_len;
      break;
    }

    if (decoder->frame.header.bps == 16) {

      for (int32_t i = 0; i < frame_len; i++) {
        decode_buffer[ decode_ofs++ ] = decode->samples[1][i];
        decode_buffer[ decode_ofs++ ] = decode->samples[0][i];
      }

    } else if (decoder->frame.header.bps == 24) {

      for (int32_t i = 0; i < frame_len; i++) {
        decode_buffer[ decode_ofs++ ] = decode->samples[1][i] >> 8;
        decode_buffer[ decode_ofs++ ] = decode->samples[0][i] >> 8;
      }

    }

    if (miniflac_sync(decoder,
                      &(decode->flac_data[decode->flac_data_pos]),
                      decode->flac_data_len - decode->flac_data_pos,
                      &used_bytes) != MINIFLAC_OK) break;
    decode->flac_data_pos += used_bytes;
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

  // used bytes
  uint32_t used_bytes = 0;

  // decoder
  MINIFLAC* decoder = &(decode->miniflac);

  for (;;) {

    size_t frame_len = 0;

    if (decode->pending_len > 0) {

      frame_len = decode->pending_len;
      decode->pending_len = 0;

    } else {
  
      if (miniflac_decode(decoder,
                          &(decode->flac_data[decode->flac_data_pos]),
                          decode->flac_data_len - decode->flac_data_pos,
                          &used_bytes,
                          decode->samples) != MINIFLAC_OK) break;
    
      decode->flac_data_pos += used_bytes;
      frame_len = decoder->frame.header.block_size;
    }

    if (decode_ofs * sizeof(int16_t) + frame_len * sizeof(int16_t) > decode_buffer_bytes) {
      // no more buffer space to write
      decode->pending_len = frame_len;
      break;
    }

    if (decoder->frame.header.bps == 16) {

      for (int32_t i = 0; i < frame_len; i++) {

        // down sampling
        decode->resample_counter += resample_freq;
        if (decode->resample_counter < decode->sample_rate) {
          continue;
        }

        decode_buffer[ decode_ofs++ ] = ( decode->samples[0][i] + decode->samples[1][i] ) >> 4;
        decode->resample_counter -= decode->resample_counter;

      }

    } else if (decoder->frame.header.bps == 24) {

      for (int32_t i = 0; i < frame_len; i++) {

        // down sampling
        decode->resample_counter += resample_freq;
        if (decode->resample_counter < decode->sample_rate) {
          continue;
        }

        decode_buffer[ decode_ofs++ ] = ( decode->samples[0][i] + decode->samples[1][i] ) >> 12;
        decode->resample_counter -= decode->resample_counter;

      }

    }

    if (miniflac_sync(decoder,
                      &(decode->flac_data[decode->flac_data_pos]),
                      decode->flac_data_len - decode->flac_data_pos,
                      &used_bytes) != MINIFLAC_OK) break;
    decode->flac_data_pos += used_bytes;
  }

  // success
  rc = 0;

exit:

  // push resampled count
  *decoded_bytes = decode_ofs * sizeof(int16_t);

  return rc;
}

/*
//
//  decode MP3 stream with resampling
//
int32_t mp3_decode_resample(MP3_DECODE_HANDLE* decode, int16_t* resample_buffer, size_t resample_buffer_bytes, int16_t resample_freq, size_t* resampled_bytes) {

  // default return code
  int32_t rc = -1;

  // down sampling counter
  int32_t resample_ofs = 0;

  for (;;) {
    
    if (decode->current_mad_pcm == NULL) {

      int16_t result = mad_frame_decode(&(decode->mad_frame), &(decode->mad_stream));
      if (result == -1) {
        if (decode->mad_stream.error == MAD_ERROR_BUFLEN) {
          // MP3 EOF
          break;
        } else if (MAD_RECOVERABLE(decode->mad_stream.error)) {
          continue;
        } else {
          printf("error: %s\n", mad_stream_errorstr(&(decode->mad_stream)));
          goto exit;
        }
      }

      decode->mad_frame.options = decode->mp3_frame_options;
      mad_synth_frame(&(decode->mad_synth), &(decode->mad_frame));
      mad_timer_add(&(decode->mad_timer), decode->mad_frame.header.duration);

      decode->current_mad_pcm = &(decode->mad_synth.pcm);

      if (decode->mp3_sample_rate < 0) {
        decode->mp3_sample_rate = decode->current_mad_pcm->samplerate;
        decode->mp3_channels = decode->current_mad_pcm->channels;
      }

    } 

    MAD_PCM* pcm = decode->current_mad_pcm;
    if (resample_ofs * sizeof(int16_t) + ( pcm->length * 2 * pcm->channels ) > resample_buffer_bytes) {
      // no more buffer space to write
      break;
    }

    if (pcm->channels == 2) {

      for (int32_t i = 0; i < pcm->length; i++) {

        // down sampling
        decode->resample_counter += resample_freq;
        if (decode->resample_counter < pcm->samplerate) {
          continue;
        }

        // stereo to mono
        resample_buffer[ resample_ofs++ ] = ( scale_16bit(pcm->samples[0][i]) + scale_16bit(pcm->samples[1][i]) ) / 2 / 16;
        decode->resample_counter -= pcm->samplerate;

      }

    } else {

      for (int32_t i = 0; i < pcm->length; i++) {

        // down sampling
        decode->resample_counter += resample_freq;
        if (decode->resample_counter < pcm->samplerate) {
          continue;
        }
    
        resample_buffer[ resample_ofs++ ] = scale_12bit(pcm->samples[0][i]);
        decode->resample_counter -= pcm->samplerate;

      }

    }

    decode->current_mad_pcm = NULL;

  }

  // success
  rc = 0;

exit:

  // push resampled count
  *resampled_bytes = resample_ofs * sizeof(int16_t);

  return rc;
}

*/