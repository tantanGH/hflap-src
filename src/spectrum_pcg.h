#ifndef __H_SPECTRUM_PCG__
#define __H_SPECTRUM_PCG__

#include <stddef.h>
#include <stdint.h>
#include "spectrum_stream.h"

#define NUM_SPECTRUM_MODES (16)
#define DEFAULT_SPECTRUM_MODE (6)       // 0-15のビットフラグで表示モードを指定

#define DEFAULT_BASE_XPOS (10)          // 16dot単位で指定
#define DEFAULT_BASE_YPOS (480)         // 1dot単位で指定

// スペクトラムメーターのハンドル構造体
typedef struct {

  SPECTRUM_STREAM_HANDLE* spectrum_stream;     // スペクトラムストリームのハンドル
  size_t meter_display_pos;                    // 事前にレンダリングされたメーター値の読み出し位置

  int16_t base_xpos;                    // 16dot単位で指定
  int16_t base_ypos;                    // 1dot単位で指定

  int16_t spectrum_mode;                // 現在の表示モード
  int16_t spectrum_mode_prev;           // 前回の表示モード（変化検出用）

} SPECTRUM_DISPLAY_HANDLE;

int32_t spectrum_display_open(SPECTRUM_DISPLAY_HANDLE* handle, SPECTRUM_STREAM_HANDLE* spectrum, int16_t xpos, int16_t ypos, int16_t mode);
void spectrum_display_close(SPECTRUM_DISPLAY_HANDLE* handle);
int32_t spectrum_display_start(SPECTRUM_DISPLAY_HANDLE* handle);
void spectrum_display_stop(SPECTRUM_DISPLAY_HANDLE* handle);
void spectrum_display_set_mode(SPECTRUM_DISPLAY_HANDLE* handle, int16_t mode);
void spectrum_display_next_mode(SPECTRUM_DISPLAY_HANDLE* handle);
void spectrum_display_prev_mode(SPECTRUM_DISPLAY_HANDLE* handle);
void spectrum_display_put_text(SPECTRUM_DISPLAY_HANDLE* handle, uint16_t x, uint16_t y, uint16_t color, uint16_t bold, const uint8_t* text);

#endif // __H_SPECTRUM_DISPLAY__