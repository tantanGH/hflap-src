#ifndef __H_SPECTRUM_PCG__
#define __H_SPECTRUM_PCG__

#include <stddef.h>
#include <stdint.h>
#include "spectrum_stream.h"

#define NUM_SPECTRUM_PCG_MODES (3)
#define DEFAULT_SPECTRUM_PCG_MODE (0)       

#define BASE_XPOS_L (13)
#define BASE_XPOS_R (17)

#define BASE_YPOS_0 (24)
#define BASE_YPOS_1 (25)

#define PEAK_HOLD_BAR_BASE_YPOS  (212)

// スペクトラムメーターのハンドル構造体
typedef struct {

  SPECTRUM_STREAM_HANDLE* spectrum_stream;     // スペクトラムストリームのハンドル
  size_t meter_display_pos;                    // 事前にレンダリングされたメーター値の読み出し位置

  int16_t spectrum_mode;                // 現在の表示モード
  int16_t spectrum_mode_prev;           // 前回の表示モード（変化検出用）

} SPECTRUM_PCG_HANDLE;

int32_t spectrum_pcg_open(SPECTRUM_PCG_HANDLE* handle, SPECTRUM_STREAM_HANDLE* spectrum, int16_t mode);
void spectrum_pcg_close(SPECTRUM_PCG_HANDLE* handle);
int32_t spectrum_pcg_start(SPECTRUM_PCG_HANDLE* handle);
void spectrum_pcg_stop(SPECTRUM_PCG_HANDLE* handle);
void spectrum_pcg_set_mode(SPECTRUM_PCG_HANDLE* handle, int16_t mode);
void spectrum_pcg_next_mode(SPECTRUM_PCG_HANDLE* handle);
void spectrum_pcg_prev_mode(SPECTRUM_PCG_HANDLE* handle);
void spectrum_pcg_put_text(SPECTRUM_PCG_HANDLE* handle, uint16_t x, uint16_t y, uint16_t color, uint16_t bold, const uint8_t* text);

#endif // __H_SPECTRUM_PCG__