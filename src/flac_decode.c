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

    if (decode_ofs * sizeof(int16_t) + sample_len * decode->channels * sizeof(int16_t) > decode_buffer_bytes) {
      // no more buffer space to write
      decode->pending_len = sample_len;
      break;
    }

    if (decode->bps == 16) {

      for (int32_t i = 0; i < sample_len; i += 2) {
        decode_buffer[ decode_ofs++ ] = decode->samples[i] / 65536;
        decode_buffer[ decode_ofs++ ] = decode->samples[i + 1] / 65536;
      }

    } else if (decode->bps == 24) {

      for (int32_t i = 0; i < sample_len; i += 2) {
        decode_buffer[ decode_ofs++ ] = decode->samples[i] / 65536;
        decode_buffer[ decode_ofs++ ] = decode->samples[i + 1] / 65536;
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

    if (decode_ofs * sizeof(int16_t) + sample_len * sizeof(int16_t) > decode_buffer_bytes) {
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
        decode_buffer[ decode_ofs++ ] = ((decode->samples[i] / 65536 / 16 + decode->samples[i + 1]) / 65536 / 16) / 2;
        decode->resample_counter -= decode->sample_rate;
      }

    } else if (decode->bps == 24) {

      for (int32_t i = 0; i < sample_len; i += 2) {
        // down sampling
        decode->resample_counter += resample_freq;
        if (decode->resample_counter < decode->sample_rate) {
          continue;
        }
        decode_buffer[ decode_ofs++ ] = (decode->samples[i] / 65536 / 16 + decode->samples[i + 1] / 65536 / 16) / 2;
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
