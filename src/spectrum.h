#ifndef __H_SPECTRUM__
#define __H_SPECTRUM__

#include <stdint.h>

#define NUM_BANDS (7)

#define MAX_METER_FRAMES (56 * 1800) // 最大 56Hz * 1800秒

#define VSYNC_BPS16_HZ (55458)
#define VSYNC_BPS24_HZ (27729)

// フィルタ係数の構造体
typedef struct {
  int32_t b0, b1, b2, a1, a2;
} FILTER_COEFFS;

// biquadフィルタの状態構造体
typedef struct {
  int32_t x1, x2, y1, y2;
} BIQUAD_STATE;

// メーター値の構造体
typedef struct {
  uint8_t meter_L[NUM_BANDS];
  uint8_t meter_R[NUM_BANDS];
} METER_VALUE;

// スペクトラムアナライザのハンドル構造体
typedef struct {
  int32_t sample_rate; // サンプルレート
  int16_t bps; // ビット深度
  FILTER_COEFFS* filter_coeffs_hi; // フィルタ係数のテーブルへのポインタ
  FILTER_COEFFS* filter_coeffs_lo; // フィルタ係数のテーブルへのポインタ
  BIQUAD_STATE bands_L[NUM_BANDS]; // 左チャンネル用7バンド
  BIQUAD_STATE bands_R[NUM_BANDS]; // 右チャンネル用7バンド
  METER_VALUE* meter_values; // 表示用バッファ
  size_t meter_values_pos; // 表示用バッファの現在位置
  uint8_t display_scale; // メーター表示のスケール
  uint32_t resample_counter; // ダウンサンプリング用のカウンタ
  int32_t peak_value_L[NUM_BANDS]; // ピークホールド用の現在値
  int32_t peak_value_R[NUM_BANDS]; // ピークホールド用の現在値
  uint8_t fall_speed;      // 1フレームあたりの落下量
  uint8_t last_meter_L[NUM_BANDS]; // 前回のフレームの最終出力値
  uint8_t last_meter_R[NUM_BANDS]; // 前回のフレームの最終出力値 
} SPECTRUM_HANDLE;

int32_t spectrum_open(SPECTRUM_HANDLE* handle, int32_t sample_rate, int16_t bps, uint8_t display_scale, uint8_t fall_speed);
void spectrum_close(SPECTRUM_HANDLE* handle);
void spectrum_process(SPECTRUM_HANDLE* handle, const int16_t* pcm, size_t samples);

#endif