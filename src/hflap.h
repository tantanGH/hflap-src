#ifndef __H_HFLAP__
#define __H_HFLAP__

#define VERSION "0.9.1 (2026/05/03)"

#define MAX_PATH_LEN (256)

#define FREAD_STAGING_BUFFER_BYTES (512*1024)
#define FREAD_CHUNK_BYTES (8*1024*1024)

#define CONTINUOUS_FLAC_BUFFER_BYTES (2*1024*1024)
#define CONTINUOUS_FLAC_CONTINUE_BYTES (512*1024)
#define CONTINUOUS_FLAC_DRAIN_BYTES (128*1024)

#define CHAIN_TABLE_BUFFER_BYTES    (15625*2*1*1)     // 15625Hz 16bit mono 1sec
#define CHAIN_TABLE_EX_BUFFER_BYTES (48000*2*2*1)     // 48000Hz 16bit stereo 1sec

#define DRIVER_NONE     (-1)
#define DRIVER_PCM8A    (0)
#define DRIVER_PCM8PP   (1)

#define DEFAULT_VOLUME  (6)
#define DEFAULT_BUFFERS (4)

#define NUM_SPECTRUM_MODES  (16)
#define SPECTRUM_SCALE      (48)
#define SPECTRUM_FALL_SPEED (1)
#define SPECTRUM_BASE_XPOS  (10)
#define SPECTRUM_BASE_YPOS  (240)

//
//  link array chain table
//
typedef struct {
    void* buffer;
    uint16_t buffer_len;
    void* next;
} CHAIN_TABLE;

//
//  extended link array chain table for pcm8pp
//
typedef struct {
    void* buffer;
    uint32_t buffer_len;
    void* next;
} CHAIN_TABLE_EX;

#endif