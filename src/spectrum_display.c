#include <stdlib.h>
#include <string.h>
#include <x68k/iocs.h>
#include "spectrum_display.h"

// 割り込みハンドラ向けグローバル変数
static SPECTRUM_DISPLAY_HANDLE* g_spectrum_display = NULL;
static SPECTRUM_STREAM_HANDLE* g_spectrum_stream = NULL;

//
//  spectrum analyzer freq labels
//
// 125Hz (0-15列)
static uint16_t band_label_100[] = {
  0x0000, 0x3770, 0x1140, 0x1770, 0x1410, 0x1770, 0x0000, 0x0000
};

// 250Hz (16-31列)
static uint16_t band_label_250[] = {
  0x0000, 0x3bb8, 0x0a28, 0x3ba8, 0x20a8, 0x3bb8, 0x0000, 0x0000
};

// 500Hz (32-47列)
static uint16_t band_label_500[] = {
  0x0000, 0x3bb8, 0x22b8, 0x3aa8, 0x0aa8, 0x3bb8, 0x0000, 0x0000
};

// 1KHz (48-63列)
static uint16_t band_label_1k[] = {
  0x0000, 0x3480, 0x1500, 0x1600, 0x1500, 0x1480, 0x0000, 0x0000
};

// 2KHz (64-79列)
static uint16_t band_label_2k[] = {
  0x0000, 0x3a40, 0x0a80, 0x3b00, 0x2280, 0x3a40, 0x0000, 0x0000
};

// 4KHz (80-95列)
static uint16_t band_label_4k[] = {
  0x0000, 0x2a40, 0x2a80, 0x3b00, 0x0a80, 0x0a40, 0x0000, 0x0000
};

// 8KHz (96-111列)
static uint16_t band_label_8k[] = {
  0x0000, 0x3a40, 0x2a80, 0x3b00, 0x2a80, 0x3a40, 0x0000, 0x0000
};

static uint16_t* band_labels[] = {
  band_label_100, band_label_250, band_label_500, 
  band_label_1k,  band_label_2k,  band_label_4k,  band_label_8k
};

//
//  global spectrum analyzer handle
//
//   spectrum_mode:
//    bit0: bar color - 0:cyan 1:yellow
//    bit1: L-band reverse - 0:normal 1:re
//    bit2: peak hold - 0:no 1:yes
//    bit3: band label - 0:no 1:yes
//
static void __attribute__((interrupt)) refresh_spectrum_analyzer() {

  // 追い越しチェック
  if (g_spectrum_display->meter_display_pos >= g_spectrum_stream->meter_values_pos) {
    return;
  }

  // 描画位置とモードをローカル変数にコピー
  int16_t xpos = g_spectrum_display->base_xpos;
  int16_t ypos = g_spectrum_display->base_ypos;
  int16_t spectrum_mode = g_spectrum_display->spectrum_mode;

  // 表示スケールをローカル変数にコピー
  int16_t scale = g_spectrum_stream->display_scale;

  // モード変化検出
  int16_t force_refresh = 0;
  if (spectrum_mode != g_spectrum_display->spectrum_mode_prev) {
    // モードが変わっていたら全消去
    for (int16_t p = 0; p < 2; p++) {
      int16_t ofsL = xpos;
      int16_t ofsR = xpos + 15;
      for (int16_t b = 0; b < SPECTRUM_NUM_BANDS; b++) {
        uint16_t* pL = &(((uint16_t*)(p ? 0xe20000 : 0xe00000))[0x80 * ypos + 0x40 * 6 + ofsL]);
        uint16_t* pR = &(((uint16_t*)(p ? 0xe20000 : 0xe00000))[0x80 * ypos + 0x40 * 6 + ofsR]);
        for (int16_t m = 0; m < 6; m++) {
          *pL = 0x0000;  
          *pR = 0x0000;
          pL -= 0x40;   
          pR -= 0x40;
        }
        for (int16_t m = 0; m <= scale; m++) {
          *pL = 0x0000;  
          *pR = 0x0000;
          pL -= 0x80;   
          pR -= 0x80;
        }
        ofsL += 2;
        ofsR += 2;
      }
    }
    g_spectrum_display->spectrum_mode_prev = spectrum_mode;
    force_refresh = 1;
  }

  // TVRAMのベースアドレスと、描画するメーター値の位置を取得
  uint16_t* TVRAM0 = (uint16_t*)(spectrum_mode & 1 ? 0xe20000 : 0xe00000);
  uint16_t* TVRAM1 = (uint16_t*)(spectrum_mode & 1 ? 0xe00000 : 0xe20000);
  size_t meter_pos = g_spectrum_display->meter_display_pos++;
  METER_VALUE* v = &g_spectrum_stream->meter_values[meter_pos];
  METER_VALUE* vp = &g_spectrum_stream->meter_peak_values[meter_pos];

  // 初回描画またはモード変化時は全描画
  if (meter_pos == 1 || force_refresh) {
    for (int16_t b = 0; b < SPECTRUM_NUM_BANDS; b++) {
      int16_t ofsL = spectrum_mode & 2 ? xpos + 12 - b * 2 : xpos + b * 2;
      int16_t ofsR = xpos + 15 + b * 2;
      uint16_t* pL = &TVRAM0[0x80 * ypos + ofsL];
      uint16_t* pR = &TVRAM0[0x80 * ypos + ofsR];
      for (int16_t m = 0; m <= v->meter_L[b]; m++) {
        *pL = 0xffff;
        pL -= 0x80;     
      }
      for (int16_t m = 0; m <= v->meter_R[b]; m++) {
        *pR = 0xffff;
        pR -= 0x80;  
      }
      if (spectrum_mode & 4) { // peak hold
        TVRAM1[0x80 * (ypos - vp->meter_L[b]) + ofsL] = 0xffff;
        TVRAM1[0x80 * (ypos - vp->meter_R[b]) + ofsR] = 0xffff;
      }
      if (spectrum_mode & 8) { // band label
        for (int16_t i = 0; i < 6; i++) {
          TVRAM0[0x80 * ypos + 0x40 * i + ofsL] = band_labels[b][i];
          TVRAM0[0x80 * ypos + 0x40 * i + ofsR] = band_labels[b][i];
        }
      }
    }
    return;
  }

  // メインバー描画
  METER_VALUE* v0 = &g_spectrum_stream->meter_values[meter_pos-2];
  for (int16_t b = 0; b < SPECTRUM_NUM_BANDS; b++) {
    // 現在のメーター値
    uint8_t meter_value_L = v->meter_L[b];
    uint8_t meter_value_R = v->meter_R[b];
    // 前フレームのメーター値
    uint8_t meter_value_L0 = v0->meter_L[b];
    uint8_t meter_value_R0 = v0->meter_R[b];
    // 描画位置計算
    int16_t ofsL = spectrum_mode & 2 ? xpos + 12 - b * 2 : xpos + b * 2;
    int16_t ofsR = xpos + 15 + b * 2;
    uint16_t* pL = &TVRAM0[0x80 * (ypos - meter_value_L0) + ofsL];
    uint16_t* pR = &TVRAM0[0x80 * (ypos - meter_value_R0) + ofsR];
    // メーター値が変わっていたら更新
    if (meter_value_L > meter_value_L0) {
      for (int16_t m = meter_value_L0 + 1; m <= meter_value_L; m++) {
        pL -= 0x80;
        *pL = 0xffff; 
      }
    } else {
      for (int16_t m = meter_value_L0; m > meter_value_L; m--) {
        *pL = 0x0000;
        pL += 0x80;
      }
    }
    if (meter_value_R > meter_value_R0) {
      for (int16_t m = meter_value_R0 + 1; m <= meter_value_R; m++) {
        pR -= 0x80;
        *pR = 0xffff;
      }
    } else {
      for (int16_t m = meter_value_R0; m > meter_value_R; m--) {
        *pR = 0x0000;
        pR += 0x80;
      }
    }      
  }
  
  // peak hold 描画
  if (spectrum_mode & 4) {
    // 前フレームの描画位置取得
    METER_VALUE* vp0 = &g_spectrum_stream->meter_peak_values[meter_pos-2];
    for (int16_t b = 0; b < SPECTRUM_NUM_BANDS; b++) {
      // 現在のピーク位置
      uint8_t meter_value_L = vp->meter_L[b];
      uint8_t meter_value_R = vp->meter_R[b];
      // 前フレームのピーク位置
      uint8_t meter_value_L0 = vp0->meter_L[b];
      uint8_t meter_value_R0 = vp0->meter_R[b];
      // 描画位置計算
      int16_t ofsL = spectrum_mode & 2 ? xpos + 12 - b * 2 : xpos + b * 2;
      int16_t ofsR = xpos + 15 + b * 2;
      if (meter_value_L != meter_value_L0) {
        // 位置が変わっていたら更新
        TVRAM1[0x80 * (ypos - meter_value_L0) + ofsL] = 0x0000;
        TVRAM1[0x80 * (ypos - meter_value_L)  + ofsL] = 0xffff;
      }
      if (meter_value_R != meter_value_R0) {
        // 位置が変わっていたら更新
        TVRAM1[0x80 * (ypos - meter_value_R0) + ofsR] = 0x0000;
        TVRAM1[0x80 * (ypos - meter_value_R)  + ofsR] = 0xffff;
      }
    }
  }
}

// スペクトラムディスプレイの初期化と表示位置設定
int32_t spectrum_display_open(SPECTRUM_DISPLAY_HANDLE* handle, SPECTRUM_STREAM_HANDLE* stream, int16_t xpos, int16_t ypos, int16_t mode) {

  int32_t rc = -1;

  if (handle == NULL || stream == NULL) goto exit;

  handle->spectrum_stream = stream;
  handle->meter_display_pos = 0;
  handle->spectrum_mode = mode;
  handle->spectrum_mode_prev = -1; // force refresh on first run
  handle->base_xpos = xpos;
  handle->base_ypos = ypos;

  g_spectrum_display = handle;
  g_spectrum_stream = stream;

  rc = 0; // success

  exit:
  return rc;
}

// スペクトラムディスプレイのクローズ
void spectrum_display_close(SPECTRUM_DISPLAY_HANDLE* handle) {
  if (handle == NULL) return;
  g_spectrum_display = NULL;
  g_spectrum_stream = NULL;
}

// スペクトラムメーターの描画開始(一時停止後の再開もここから)
int32_t spectrum_display_start(SPECTRUM_DISPLAY_HANDLE* handle) {
  if (handle == NULL) return -1;
  int32_t rc = _iocs_vdispst((uint8_t*)refresh_spectrum_analyzer, 0, 1);
  if (rc == 0) {
    _iocs_b_bpoke((uint8_t*)0xe88019,0x00);  // stop Timer-A  
    _iocs_b_bpoke((uint8_t*)0xe8801f,0x01);  // set Timer-A counter        
    _iocs_b_bpoke((uint8_t*)0xe88019,0x18);  // restart Timer-A    
  }
  return rc;
}

// スペクトラムメーターの描画停止
void spectrum_display_stop(SPECTRUM_DISPLAY_HANDLE* handle) {
  if (handle == NULL) return;
  _iocs_vdispst(NULL, 0, 0);
}

// スペクトラム表示モードの設定
void spectrum_display_set_mode(SPECTRUM_DISPLAY_HANDLE* handle, int16_t mode) {
  if (handle == NULL) return;
  handle->spectrum_mode = mode & NUM_SPECTRUM_MODES;
}

// スペクトラム表示モードの切り替え（次のモード）
void spectrum_display_next_mode(SPECTRUM_DISPLAY_HANDLE* handle) {
  if (handle == NULL) return;
  handle->spectrum_mode = (handle->spectrum_mode + 1) % NUM_SPECTRUM_MODES;
}

// スペクトラム表示モードの切り替え（前のモード）
void spectrum_display_prev_mode(SPECTRUM_DISPLAY_HANDLE* handle) {
  if (handle == NULL) return;
  handle->spectrum_mode = (handle->spectrum_mode - 1 + NUM_SPECTRUM_MODES) % NUM_SPECTRUM_MODES;
}