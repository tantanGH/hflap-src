#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stat.h>
#include <doslib.h>
#include <iocslib.h>

// devices
#include "keyboard.h"
#include "himem.h"
#include "crtc.h"

// resource
#include "cp932rsc.h"

// pcm driver
#include "pcm8a.h"
#include "pcm8pp.h"

// codec
#include "flac_decode.h"

// application
#include "hflap.h"

//
//  abort vectors
//
static uint32_t g_abort_vector1;
static uint32_t g_abort_vector2;

//
//  chain table top
//
static CHAIN_TABLE* g_init_chain_table = NULL;
static CHAIN_TABLE_EX* g_init_chain_table_ex = NULL;

//
//  original function key mode preservation
//
static int32_t g_funckey_mode = -1;

//
//  original pcm8pp frequency mode
//
static uint32_t g_original_pcm8pp_frequency_mode = 0;

// file read buffers
static void* fread_buffer = NULL;
static void* fread_staging_buffer = NULL;

//
//  abort vector handler
//
static void abort_application() {

  // resume abort vectors
  INTVCS(0xFFF1, (int8_t*)g_abort_vector1);
  INTVCS(0xFFF2, (int8_t*)g_abort_vector2);  

  // stop pcm8a
  if (pcm8a_isavailable()) {
    pcm8a_pause();
    pcm8a_stop();
  }

  // stop pcm8pp
  if (pcm8pp_isavailable()) {
    pcm8pp_pause();
    pcm8pp_stop();
    pcm8pp_set_frequency_mode(g_original_pcm8pp_frequency_mode);
  }

  // reclaim chain table buffers (pcm8a)
  if (pcm8a_isavailable()) {
    CHAIN_TABLE* rct = g_init_chain_table;
    while (rct != NULL) {
      if (rct->buffer != NULL) {
        himem_free(rct->buffer, 1);
      }
      CHAIN_TABLE* pre_rct = rct;
      rct = rct->next;
      himem_free(pre_rct, 1);
    }
    g_init_chain_table = NULL;
  }

  // reclaim chain table buffers (pcm8pp)
  if (pcm8pp_isavailable()) {
    CHAIN_TABLE_EX* rct = g_init_chain_table_ex;
    while (rct != NULL) {
      if (rct->buffer != NULL) {
        himem_free(rct->buffer, 1);
      }
      CHAIN_TABLE_EX* pre_rct = rct;
      rct = rct->next;
      himem_free(pre_rct, 1);
    }
    g_init_chain_table_ex = NULL;
  }

  // reclaim file read buffers
  if (fread_staging_buffer != NULL) {
    himem_free(fread_staging_buffer, 0);
    fread_staging_buffer = NULL;
  }
  if (fread_buffer != NULL) {
    himem_free(fread_buffer, 1);
    fread_buffer = NULL;
  }

  // cursor on
  C_CURON();

  // funckey mode
  if (g_funckey_mode >= 0) {
    C_FNKMOD(g_funckey_mode);
  }
  
  // flush key buffer
  KFLUSHIO(0xff);

  printf("Aborted.\n");

  exit(1);
}

//
//  get mpu type
//
static int32_t get_mpu_type() {

  int32_t mpu_type = 0;

  uint32_t rom_version = ((uint32_t)ROMVER()) >> 24;
  if (rom_version <= 0x12) goto exit;

  struct REGS in_regs = { 0 };
  struct REGS out_regs = { 0 };

  in_regs.d0 = 0xac;      // IOCS _SYS_STAT

  TRAP15(&in_regs, &out_regs);

  mpu_type = out_regs.d0 & 0xff;

exit:
  return mpu_type;
}

//
//  show help message
//
static void show_help_message() {
  printf("HFLAP.X - High Memory FLAC player for X680x0 version " VERSION " by tantan\n");
  printf("usage: hflap [options] <input-file.fla>\n");
  printf("options:\n");
  printf("     -l[n] ... loop count (none:endless, default:1)\n");
  printf("     -v<n> ... volume (1-15, default:%d)\n", DEFAULT_VOLUME);
//  printf("     -t<n> ... album art display brightness (1-100, default:off)\n");
  printf("     -b<n> ... buffer size [x 64KB] (3-32,default:%d)\n", DEFAULT_BUFFERS);
  printf("     -n    ... no progress bar\n");
  printf("     -s    ... use main memory for file reading (SCSI disk)\n");
  printf("     -h    ... show help message\n");
}

//
//  main
//
int32_t main(int32_t argc, uint8_t* argv[]) {

  // default return code
  int32_t rc = 1;

  // preserve abort vectors
  g_abort_vector1 = INTVCS(0xFFF1, (int8_t*)abort_application);
  g_abort_vector2 = INTVCS(0xFFF2, (int8_t*)abort_application);  

  // preserve function key mode
  g_funckey_mode = C_FNKMOD(-1);

  // command line options
  uint8_t* flac_file_name = NULL;
  int16_t playback_volume = DEFAULT_VOLUME;
  int16_t loop_count = 1;
  int16_t num_buffers = DEFAULT_BUFFERS;
  int16_t use_high_memory = 0;
  int16_t playback_driver = DRIVER_NONE;
  int16_t staging_file_read = 0;
  int16_t pic_brightness = 0;
  int16_t quiet_mode = 0;

  // total number of chains
  int32_t num_chains = 0;

  // exit error message
  uint8_t error_mes[ 256 ];
  error_mes[0] = '\0';
  
  // check mpu type
  if (get_mpu_type() < 3) {
    strcpy(error_mes, cp932rsc_mpu_type);
    goto exit;
  }

  // parse command line options
  for (int16_t i = 1; i < argc; i++) {
    if (argv[i][0] == '-' && strlen(argv[i]) >= 2) {
      if (argv[i][1] == 'v') {
        playback_volume = atoi(argv[i]+2);
        if (playback_volume < 1 || playback_volume > 15 || strlen(argv[i]) < 3) {
          show_help_message();
          goto exit;
        }
      } else if (argv[i][1] == 'l') {
        loop_count = atoi(argv[i]+2);
      } else if (argv[i][1] == 'b') {
        num_buffers = atoi(argv[i]+2);
        if (num_buffers < 3 || num_buffers > 32) {
          show_help_message();
          goto exit;
        }
      } else if (argv[i][1] == 's') {
        staging_file_read = 1;
      } else if (argv[i][1] == 'n') {
        quiet_mode = 1;
      } else if (argv[i][1] == 't') {
        pic_brightness = atoi(argv[i]+2);
        if (pic_brightness < 0 || pic_brightness > 100 || strlen(argv[i]) < 3) {
          show_help_message();
          goto exit;
        }
      } else if (argv[i][1] == 'h') {
        show_help_message();
        goto exit;
      } else {
        sprintf(error_mes, cp932rsc_unknown_option, argv[i]);
        goto exit;
      }
    } else {
      if (flac_file_name != NULL) {
        strcpy(error_mes, cp932rsc_too_many_files);
        goto exit;
      }
      flac_file_name = argv[i];
      if (strlen(flac_file_name) < 5 || stricmp(flac_file_name + strlen(flac_file_name) - 4, ".fla") != 0) {
        strcpy(error_mes, cp932rsc_not_flac_file);
        goto exit;
      }
    }
  }

  // flac file is specified?
  if (flac_file_name == NULL || strlen(flac_file_name) < 5) {
    show_help_message();
    goto exit;
  }

  // check himem availability
  if (himem_isavailable()) {
    use_high_memory = 1;
  } else {
    strcpy(error_mes, cp932rsc_himem_not_available);
    goto exit;
  }

  // check pcm8a/pcm8pp availability
  if (pcm8a_isavailable()) {
    playback_driver = DRIVER_PCM8A;
  } else if (pcm8pp_isavailable()) {
    playback_driver = DRIVER_PCM8PP;    
    g_original_pcm8pp_frequency_mode = pcm8pp_get_frequency_mode();   // preserve original pcm8pp frequency mode
  } else {
    strcpy(error_mes, cp932rsc_pcm8_not_available);
    goto exit;
  }

  // credit
  if (pic_brightness == 0) {
    printf("HFLAP.X - High Memory FLAC player for X680x0 version " VERSION " by tantan\n");
  }

  // reset PCM8A/PCM8PP
  if (playback_driver == DRIVER_PCM8A) {
    pcm8a_pause();
    pcm8a_stop();
  } else if (playback_driver == DRIVER_PCM8PP) {
    pcm8pp_pause();
    pcm8pp_stop();
  }

  // cursor off
  C_CUROFF();

  // enter supervisor mode if needed
  if (pic_brightness > 0) {
    B_SUPER(0);
  }

  // display flac attribute at first play
  int16_t first_play = 1;

loop:

  // init crtc if album art is required
  if (pic_brightness > 0) {

    G_CLR_ON();
    crtc_set_extra_mode(0);

    C_FNKMOD(3);    // function key display off
    C_CLS_AL();

    TPALET2(4, 0x0001);
    TPALET2(5, TPALET2(1,-1));
    TPALET2(6, TPALET2(2,-1));
    TPALET2(7, TPALET2(3,-1));

    struct TXFILLPTR txfil = { 2, 0, 0, 768, 512, 0xffff };
    TXFILL(&txfil);

  }

  // current chain table entries
  CHAIN_TABLE* cur_chain_table = NULL;
  CHAIN_TABLE_EX* cur_chain_table_ex = NULL;

  // file read pointer
  FILE* fp = NULL;

try:

  // init flac decoder
  FLAC_DECODE_HANDLE flac_decoder = { 0 };
  if (flac_decode_init(&flac_decoder) != 0) {
    strcpy(error_mes, cp932rsc_flac_decoder_init_error);
    goto catch;
  }

  // open input file
  fp = fopen(flac_file_name, "rb");
  if (fp == NULL) {
    strcpy(error_mes, cp932rsc_file_open_error);
    goto catch;
  }

  // obtain data content size
  fseek(fp, 0, SEEK_END);
  uint32_t flac_data_size = ftell(fp);
  fseek(fp, 0, SEEK_SET);

  // allocate file read buffer
  size_t fread_buffer_len = flac_data_size;
  fread_buffer = himem_malloc(fread_buffer_len, use_high_memory);
  if (fread_buffer == NULL) {
    strcpy(error_mes, cp932rsc_himem_shortage);
    goto catch;
  }

  // read whole flac file content into high memory
  printf("\rLoading FLAC file...\x1b[0K");
  if (staging_file_read) {
    // use staging buffer on main memory (for SCSI disk)
    fread_staging_buffer = himem_malloc(FREAD_STAGING_BUFFER_BYTES, 0);   // allocate in main memory
    if (fread_staging_buffer == NULL) {
      strcpy(error_mes, cp932rsc_mainmem_shortage);
      goto catch;
    }    
    size_t read_len = 0; 
    do {
      size_t len = fread(fread_staging_buffer, 1, FREAD_STAGING_BUFFER_BYTES, fp);
      memcpy(fread_buffer + read_len, fread_staging_buffer, len);
      read_len += len;
    } while (read_len < flac_data_size);
    himem_free(fread_staging_buffer, 0);
    fread_staging_buffer = NULL;
  } else {
    // direct load to high memory from VDISK/WindrvXM
    size_t read_len = 0; 
    do {
      size_t read_size = (flac_data_size - read_len) < FREAD_CHUNK_BYTES ? (flac_data_size - read_len) : FREAD_CHUNK_BYTES;
      size_t len = fread(fread_buffer + read_len, 1, read_size, fp);
      read_len += len;
    } while (read_len < flac_data_size);
  }
  fclose(fp);
  fp = NULL;
  printf("\r\x1b[0K");

  // check eye catch
  if (memcmp(fread_buffer, "fLaC", 4) != 0) {
    strcpy(error_mes, cp932rsc_not_flac_file);
    goto catch;
  }

  // setup flac decoder
  printf("\rLoading tags and picture image...\x1b[0K");
  if (flac_decode_setup(&flac_decoder, fread_buffer, flac_data_size, pic_brightness, 0) != 0) {
    strcpy(error_mes, cp932rsc_flac_decoder_setup_error);
    goto catch;
  }
  printf("\r\x1b[0K");

  // adjust scroll position
  if (pic_brightness > 0) {
    SCROLL(0, 512-128, 0);
    SCROLL(1, 512-128, 0);
    SCROLL(2, 512-128, 0);
    SCROLL(3, 512-128, 0);
    struct TXFILLPTR txfil = { 2, 128, 0, 512, 512, 0x0000 };
    TXFILL(&txfil);
  }

  // check bps
  if (flac_decoder.bps != 16 && flac_decoder.bps != 24) {
    strcpy(error_mes, cp932rsc_flac_bps_error);
    goto catch;
  }

  // check frequency
  if (flac_decoder.sample_rate != 44100 && flac_decoder.sample_rate != 48000) {
    strcpy(error_mes, cp932rsc_flac_freq_error);
    goto catch;
  }

  // check channels
  if (flac_decoder.channels != 2) {
    strcpy(error_mes, cp932rsc_flac_channel_error);
    goto catch;
  }

  // describe flac attributes
  if (first_play || pic_brightness > 0) {

    printf("\n");

    printf("File name      : %s\n", flac_file_name);
    printf("Data size      : %d [bytes]\n", flac_data_size);
    printf("Data format    : %s\n", "FLAC");

    printf("PCM driver     : %s (volume:%d)\n", 
              playback_driver == DRIVER_PCM8PP ? "PCM8PP" : 
              playback_driver == DRIVER_PCM8A  ? "PCM8A"  : "-", 
              playback_volume);

    printf("FLAC frequency : %d [Hz]\n", flac_decoder.sample_rate);
    printf("FLAC channels  : %s\n", flac_decoder.channels == 1 ? "mono" : "stereo");
    printf("FLAC bit depth : %d [bits]\n", flac_decoder.bps);
//    printf("FLAC length    : %ld [secs]\n", flac_decoder.num_samples);

    if (flac_decoder.tag_vendor != NULL) {
      printf("FLAC vendor    : %s\n", flac_decoder.tag_vendor);
    }
    if (flac_decoder.tag_title != NULL) {
      printf("FLAC title     : %s\n", flac_decoder.tag_title);
    }
    if (flac_decoder.tag_artist != NULL) {
      printf("FLAC artist    : %s\n", flac_decoder.tag_artist);
    }
    if (flac_decoder.tag_album != NULL) {
      printf("FLAC album     : %s\n", flac_decoder.tag_album);
    }

    printf("\n");

    first_play = 0;
  }

  // initial buffering
  int16_t end_flag = 0;
  for (int16_t i = 0; i < num_buffers; i++) {

    if (end_flag) break;

    printf("\rNow buffering (%d/%d) ... [SHIFT] key to cancel.", i+1, num_buffers);

    if (playback_driver == DRIVER_PCM8A) {

      // allocate a new chain table entry in high memory
      CHAIN_TABLE* ct = (CHAIN_TABLE*)himem_malloc(sizeof(CHAIN_TABLE), use_high_memory);
      if (ct == NULL) {
        strcpy(error_mes, cp932rsc_himem_shortage);
        goto catch;
      }

      // zero clear
      memset(ct, 0, sizeof(CHAIN_TABLE));

      // allocate pcm data buffer for this chain table entry
      ct->buffer = himem_malloc(CHAIN_TABLE_BUFFER_BYTES, use_high_memory);
      if (ct->buffer == NULL) {
        strcpy(error_mes, cp932rsc_himem_shortage);
        goto catch;
      }

      // decode flac stream into pcm data buffer as much as possible with resampling
      size_t decoded_bytes;
      if (flac_decode_resample(&flac_decoder, ct->buffer, CHAIN_TABLE_BUFFER_BYTES, 15625, &decoded_bytes) != 0) {
        strcpy(error_mes, cp932rsc_flac_decode_error);
        goto catch;      
      }

      // end of flac?
      if (decoded_bytes == 0) {
        himem_free(ct->buffer, use_high_memory);
        himem_free(ct, use_high_memory);
        end_flag = 1;
        break;
      }

      // decoded size (pcm8a requires length in bytes)
      ct->buffer_len = decoded_bytes;

      // global chain table top entry
      if (g_init_chain_table == NULL) {
        g_init_chain_table = ct;
      }

      // link the entry at the last
      if (cur_chain_table == NULL) {
        cur_chain_table = ct;
      } else {
        cur_chain_table->next = ct;
        cur_chain_table = ct;
      }

      num_chains++;

    }

    if (playback_driver == DRIVER_PCM8PP) {

      // allocate a new chain table entry in high memory
      CHAIN_TABLE_EX* ct = (CHAIN_TABLE_EX*)himem_malloc(sizeof(CHAIN_TABLE_EX), use_high_memory);
      if (ct == NULL) {
        strcpy(error_mes, cp932rsc_himem_shortage);
        goto catch;
      }

      // zero clear
      memset(ct, 0, sizeof(CHAIN_TABLE_EX));

      // allocate pcm data buffer for this chain table entry
      ct->buffer = himem_malloc(CHAIN_TABLE_EX_BUFFER_BYTES, use_high_memory);
      if (ct->buffer == NULL) {
        strcpy(error_mes, cp932rsc_himem_shortage);
        goto catch;
      }

      // decode flac stream into pcm data buffer as much as possible
      size_t decoded_bytes;
      if (flac_decode_full(&flac_decoder, ct->buffer, CHAIN_TABLE_EX_BUFFER_BYTES, &decoded_bytes) != 0) {
        strcpy(error_mes, cp932rsc_flac_decode_error);
        goto catch;      
      }

      // end of flac?
      if (decoded_bytes == 0) {
        himem_free(ct->buffer, use_high_memory);
        himem_free(ct, use_high_memory);
        end_flag = 1;
        break;
      }

      // decoded size (pcm8pp requires length in bytes)
      ct->buffer_len = decoded_bytes;

      // global chain table top entry
      if (g_init_chain_table_ex == NULL) {
        g_init_chain_table_ex = ct;
      }

      // link the entry at the last
      if (cur_chain_table_ex == NULL) {
        cur_chain_table_ex = ct;
      } else {
        cur_chain_table_ex->next = ct;
        cur_chain_table_ex = ct;
      }

      num_chains++;

    }

    // check shift key to exit
    if (B_SFTSNS() & 0x01) {
      printf("\r\x1b[KCanceled.\n");
      goto exit;
    }

  }

  // pcm8a channel mode
  int16_t pcm8a_volume = playback_volume;
  int16_t pcm8a_pan = 0x03;
  int16_t pcm8a_freq = 0x14;  // 16bit PCM
  uint32_t pcm8a_channel_mode = ( pcm8a_volume << 16 ) | ( pcm8a_freq << 8 ) | pcm8a_pan;

  if (playback_driver == DRIVER_PCM8A) {
      pcm8a_set_polyphonic_mode(1);     // must use polyphonic mode for 16bit PCM use
      pcm8a_play_linked_array_chain(0, pcm8a_channel_mode, g_init_chain_table);
  }

  // pcm8pp channel mode
  int32_t pcm_freq = flac_decoder.sample_rate;
  int16_t pcm_channels = flac_decoder.channels;
  int16_t pcm8pp_volume = playback_volume;
  int16_t pcm8pp_pan = 0x03;
  int16_t pcm8pp_freq = pcm_freq == 22050 && pcm_channels == 1 ? 0x0a :
                        pcm_freq == 24000 && pcm_channels == 1 ? 0x0b :
                        pcm_freq == 32000 && pcm_channels == 1 ? 0x0c :
                        pcm_freq == 44100 && pcm_channels == 1 ? 0x0d :
                        pcm_freq == 48000 && pcm_channels == 1 ? 0x0e :
                        pcm_freq == 22050 && pcm_channels == 2 ? 0x1a :
                        pcm_freq == 24000 && pcm_channels == 2 ? 0x1b :
                        pcm_freq == 32000 && pcm_channels == 2 ? 0x1c :
                        pcm_freq == 44100 && pcm_channels == 2 ? 0x1d : 
                        pcm_freq == 48000 && pcm_channels == 2 ? 0x1e : 0x1d;

  uint32_t pcm8pp_channel_mode = ( pcm8pp_volume << 16 ) | ( pcm8pp_freq << 8 ) | pcm8pp_pan;

  if (playback_driver == DRIVER_PCM8PP) {

    // start playback with pcm8pp extended linked array chain mode
    if ((pcm8pp_freq == 0x0e || pcm8pp_freq == 0x1e) && pcm8pp_get_frequency_mode() != 0x02) {
      pcm8pp_set_frequency_mode(0x02);    // 48kHz mode (stereo)
    } else if ((pcm8pp_freq == 0x0d || pcm8pp_freq == 0x1d) && pcm8pp_get_frequency_mode() != 0x01) {
      pcm8pp_set_frequency_mode(0x01);    // 44.1kHz mode (streo)
    }

    pcm8pp_play_ex_linked_array_chain(0, pcm8pp_channel_mode, 1, pcm_freq * 256, g_init_chain_table_ex);

  }

  printf("\r\x1b[0K\x1bM");
  printf("\nNow playing ... push [ESC]/[Q] key to quit. [SPACE] to pause.\x1b[0K\n");

  int16_t paused = 0;

  // dummy wait to make sure DMAC start (200 msec)
  for (int32_t t0 = ONTIME(); ONTIME() < t0 + 20;) {}

  int32_t block_counter_ofs = 0;
  int16_t buffer_delta = num_buffers;

  for (;;) {
   
    // check esc key to exit, space key to pause
    if (B_KEYSNS() != 0) {
      int16_t scan_code = B_KEYINP() >> 8;
      if (scan_code == KEY_SCAN_CODE_ESC || scan_code == KEY_SCAN_CODE_Q) {
        B_PRINT("\r\nStopped.");
        rc = 1;
        break;
      } else if (scan_code == KEY_SCAN_CODE_SPACE) {
        if (paused) {
          if (playback_driver == DRIVER_PCM8A) {
            pcm8a_resume();
          } else if (playback_driver == DRIVER_PCM8PP) {
            pcm8pp_resume();
          }
          paused = 0;
        } else {
          if (playback_driver == DRIVER_PCM8A) {
            pcm8a_pause();
          } else if (playback_driver == DRIVER_PCM8PP) {
            pcm8pp_pause();
          }
          paused = 1;
        }
      }
    }

    // exit if not playing
    if (!paused) {
      if ((playback_driver == DRIVER_PCM8A  && pcm8a_get_data_length(0)  == 0) ||
          (playback_driver == DRIVER_PCM8PP && pcm8pp_get_data_length(0) == 0)) {
        if (end_flag) { 
          B_PRINT("\r\nFinished.\r\n");
          rc = 0;
          break;
        } else {
          // in case playback is stopped but not reached to the end, buffer underrun is observed.
          printf("\n%s\n", cp932rsc_buffer_underrun);
        }
      }
    }

    // decode additional data
    if (!end_flag) {

      if (playback_driver == DRIVER_PCM8A) {

        // allocate the next chain table entry
        CHAIN_TABLE* ct = (CHAIN_TABLE*)himem_malloc(sizeof(CHAIN_TABLE), use_high_memory);
        if (ct == NULL) {
          strcpy(error_mes, cp932rsc_himem_shortage);
          goto catch;
        }

        // zero clear
        memset(ct, 0, sizeof(CHAIN_TABLE));

        // allocate pcm buffer for this chain table entry
        ct->buffer = himem_malloc(CHAIN_TABLE_BUFFER_BYTES, use_high_memory);
        if (ct->buffer == NULL) {
          strcpy(error_mes, cp932rsc_himem_shortage);
          goto catch;
        }

        // decode flac stream into pcm buffer
        size_t decoded_bytes;
        if (flac_decode_resample(&flac_decoder, ct->buffer, CHAIN_TABLE_BUFFER_BYTES, 15625, &decoded_bytes) != 0) {
          strcpy(error_mes, cp932rsc_flac_decode_error);
          goto catch;      
        }
        //printf("decoded %d\n", decoded_bytes);

        // end of flac?
        if (decoded_bytes == 0) {
          himem_free(ct->buffer, use_high_memory);
          himem_free(ct, use_high_memory);
          end_flag = 1;
          if (!quiet_mode) B_PRINT("|");
          continue;
        }

        // decoded byte length
        ct->buffer_len = decoded_bytes;

        // update current chain table entry pointer
        cur_chain_table->next = ct;
        cur_chain_table = ct;

        // number of total chains
        num_chains++;

        // in case any buffered chain is consumed, display '*'. Otherwise display '.'.
        void* cur_pcm8a_addr = pcm8a_get_access_address(0);
        int32_t block_counter = 0;
        CHAIN_TABLE* rct = g_init_chain_table;
        CHAIN_TABLE* resume_chain_table = NULL;
        while (rct != NULL) {
          if (rct->buffer <= cur_pcm8a_addr && cur_pcm8a_addr < (rct->buffer + rct->buffer_len * 2)) {
            resume_chain_table = rct;
            break;
          }
          block_counter++;
          rct = rct->next;
        }

        int16_t dt = num_chains - block_counter;
        if (dt >= buffer_delta) {
          if (!quiet_mode) B_PRINT(">");
        } else {
          if (!quiet_mode) B_PRINT("*");
          buffer_delta = dt;
        }

        // buffer underrun recovery
        if (pcm8a_get_data_length(0) == 0) {
          if ((num_chains - block_counter) > 6) {
            if (resume_chain_table != NULL) {  
              pcm8a_play_linked_array_chain(0, pcm8a_channel_mode, resume_chain_table);
              buffer_delta = num_chains - block_counter;
            }
          }
        }
      }

      if (playback_driver == DRIVER_PCM8PP) {

        // allocate the next chain table entry
        CHAIN_TABLE_EX* ct = (CHAIN_TABLE_EX*)himem_malloc(sizeof(CHAIN_TABLE_EX), use_high_memory);
        if (ct == NULL) {
          strcpy(error_mes, cp932rsc_himem_shortage);
          goto catch;
        }

        // zero clear
        memset(ct, 0, sizeof(CHAIN_TABLE_EX));

        // allocate pcm buffer for this chain table entry
        ct->buffer = himem_malloc(CHAIN_TABLE_EX_BUFFER_BYTES, use_high_memory);
        if (ct->buffer == NULL) {
          strcpy(error_mes, cp932rsc_himem_shortage);
          goto catch;
        }

        // decode flac stream into pcm buffer
        size_t decoded_bytes;
        if (flac_decode_full(&flac_decoder, ct->buffer, CHAIN_TABLE_EX_BUFFER_BYTES, &decoded_bytes) != 0) {
          strcpy(error_mes, cp932rsc_flac_decode_error);
          goto catch;      
        }

        // end of flac?
        if (decoded_bytes == 0) {
          himem_free(ct->buffer, use_high_memory);
          himem_free(ct, use_high_memory);
          end_flag = 1;
          if (!quiet_mode) B_PRINT("|");
          continue;
        }

        // decoded byte length
        ct->buffer_len = decoded_bytes;

        // update current chain table entry pointer
        cur_chain_table_ex->next = ct;
        cur_chain_table_ex = ct;

        // number of total chains
        num_chains++;

        // in case any buffered chain is consumed, display '*'. Otherwise display '.'.
        int16_t dt = num_chains - (block_counter_ofs + pcm8pp_get_block_counter(0));
        if (dt >= buffer_delta) {
          if (!quiet_mode) B_PRINT(">");
        } else {
          if (!quiet_mode) B_PRINT("*");
          buffer_delta = dt;
        }

        // buffer underrun recovery
        if (pcm8pp_get_data_length(0) == 0) {
          int32_t block_counter = pcm8pp_get_block_counter(0) + block_counter_ofs;
          if ((num_chains - block_counter) > 6) {
            CHAIN_TABLE_EX* resume_chain_table = g_init_chain_table_ex;
            for (int32_t i = 0; i < block_counter; i++) {
              resume_chain_table = resume_chain_table->next;
              if (resume_chain_table == NULL) break;
            }
            if (resume_chain_table != NULL) {  
              pcm8pp_play_ex_linked_array_chain(0, pcm8pp_channel_mode, 1, pcm_freq * 256, resume_chain_table);
              block_counter_ofs = block_counter;
              buffer_delta = num_chains - (block_counter_ofs + pcm8pp_get_block_counter(0));
            }
          }
        }

      }

    }

  }

catch:

  // stop pcm8a
  if (playback_driver == DRIVER_PCM8A) {
    pcm8a_pause();
    pcm8a_stop();
  }

  // stop pcm8pp
  if (playback_driver == DRIVER_PCM8PP) {
    pcm8pp_pause();
    pcm8pp_stop();
  }

  // dummy wait to make sure DMAC stop (200 msec)
  for (int32_t t0 = ONTIME(); ONTIME() < t0 + 20;) {}

  // close input file if still opened
  if (fp != NULL) {
    fclose(fp);
    fp = NULL;
  }

  // reclaim file read buffers
  if (fread_staging_buffer != NULL) {
    himem_free(fread_staging_buffer, 0);
    fread_staging_buffer = NULL;
  }
  if (fread_buffer != NULL) {
    himem_free(fread_buffer, use_high_memory);
    fread_buffer = NULL;
  }

  // close flac decoder
  flac_decode_close(&flac_decoder);

  // reclaim chain table buffers (pcm8a)
  if (playback_driver == DRIVER_PCM8A) {
    CHAIN_TABLE* rct = g_init_chain_table;
    while (rct != NULL) {
      if (rct->buffer != NULL) {
        himem_free(rct->buffer, 1);
      }
      CHAIN_TABLE* pre_rct = rct;
      rct = rct->next;
      himem_free(pre_rct, 1);
    }
    g_init_chain_table = NULL;
  }

  // reclaim chain table buffers (pcm8pp)
  if (playback_driver == DRIVER_PCM8PP) {
    CHAIN_TABLE_EX* rct = g_init_chain_table_ex;
    while (rct != NULL) {
      if (rct->buffer != NULL) {
        himem_free(rct->buffer, 1);
      }
      CHAIN_TABLE_EX* pre_rct = rct;
      rct = rct->next;
      himem_free(pre_rct, 1);
    }
    g_init_chain_table_ex = NULL;
  }

  // loop check
  if (rc == 0) {
    if (loop_count == 0 || --loop_count > 0) {
      B_PRINT("\r\n");
      goto loop;
    }
  }

  B_PRINT("\r\n");

exit:

  // screen clear
  if (pic_brightness > 0) {

    SCROLL(0, 0, 0);
    SCROLL(1, 0, 0);
    SCROLL(2, 0, 0);
    SCROLL(3, 0, 0);

    struct TXFILLPTR txfil = { 2, 0, 0, 768, 512, 0x0000 };
    TXFILL(&txfil);

    TPALET2(4,-2);
    TPALET2(5,-2);
    TPALET2(6,-2);
    TPALET2(7,-2);

    C_CLS_AL();
    G_CLR_ON();
  }

  // cursor on
  C_CURON();

  // function key mode
  if (g_funckey_mode >= 0) {
    C_FNKMOD(g_funckey_mode);
  }

  // resume abort vectors
  INTVCS(0xFFF1, (int8_t*)g_abort_vector1);
  INTVCS(0xFFF2, (int8_t*)g_abort_vector2);  

  // flush key buffer
  KFLUSHIO(0xff);

  // print error message
  if (error_mes[0] != '\0') {
    printf("error: %s\n", error_mes);
  }

  return rc;
}
