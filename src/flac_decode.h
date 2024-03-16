#ifndef __H_FLAC_DECODE__
#define __H_FLAC_DECODE__

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stddef.h>

#include "flac.h"

typedef fx_flac_t FX_FLAC;

typedef struct {

  uint8_t* flac_data;
  size_t flac_data_len;
  size_t flac_data_pos;

  uint8_t* tag_vendor;
  uint8_t* tag_title;
  uint8_t* tag_artist;
  uint8_t* tag_album;

  uint32_t sample_rate;
  int32_t channels;
  int32_t bps;
  uint64_t num_samples;
  size_t resample_counter;

  int32_t* samples;
  size_t samples_len;
  size_t pending_len;

  void* fx_flac_buffer;
  FX_FLAC* fx_flac;

} FLAC_DECODE_HANDLE;

int32_t flac_decode_init(FLAC_DECODE_HANDLE* decode);
void flac_decode_close(FLAC_DECODE_HANDLE* decode);
int32_t flac_decode_get_skip_offset(FLAC_DECODE_HANDLE* decode, FILE* fp);
int32_t flac_decode_setup(FLAC_DECODE_HANDLE* decode, void* flac_data, size_t flac_data_len, int16_t brightness, int16_t half_size);
int32_t flac_decode_full(FLAC_DECODE_HANDLE* decode, int16_t* decode_buffer, size_t decode_buffer_bytes, size_t* decoded_bytes);
int32_t flac_decode_resample(FLAC_DECODE_HANDLE* decode, int16_t* resample_buffer, size_t resample_buffer_bytes, int16_t resample_freq, size_t* resampled_bytes);

#endif