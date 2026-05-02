#ifndef __H_SPECTRUM__
#define __H_SPECTRUM__

#include <stdint.h>

#define NUM_BANDS (7)

#define MAX_METER_FRAMES (56 * 1800) // 最大 56Hz * 1800秒
#define PEAK_HOLD_FRAMES (56 * 2) // ピークホールドのフレーム数（約2秒）
#define VSYNC_55HZ (55458)
#define VSYNC_27HZ (27729)

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

  // --- フィルタ・基本設定 ---
  int32_t sample_rate;
  int16_t bps;
  FILTER_COEFFS* filter_coeffs_hi;
  FILTER_COEFFS* filter_coeffs_lo;
  BIQUAD_STATE bands_L[NUM_BANDS];
  BIQUAD_STATE bands_R[NUM_BANDS];
  
  // --- 制御パラメータ ---
  uint8_t display_scale; // メーターの最大高さ（240など）
  uint8_t fall_speed;    // メインバーの落下速度
  uint32_t resample_counter;

  // --- 解析ワークエリア (サンプル処理ごとに更新) ---
  // 1フレーム（1/56秒程度）の間で、そのバンドが到達した最大振幅を保持
  int32_t current_frame_max_L[NUM_BANDS]; 
  int32_t current_frame_max_R[NUM_BANDS];

  // --- 表示状態管理 (VSYNC周期で更新) ---
  // 現在画面に見えているメインバーの高さ
  uint8_t bar_height_L[NUM_BANDS];
  uint8_t bar_height_R[NUM_BANDS];

  // 現在画面に見えているピークドット（一番上の点）の高さ
  uint8_t peak_dot_height_L[NUM_BANDS];
  uint8_t peak_dot_height_R[NUM_BANDS];

  // ピークドットをその場に留めておく残りフレーム数
  uint8_t peak_dot_hold_cnt_L[NUM_BANDS];
  uint8_t peak_dot_hold_cnt_R[NUM_BANDS];

  // --- 保存用バッファ (VSYNC割り込み描画用) ---
  METER_VALUE* meter_values;       // メインバーの履歴
  METER_VALUE* meter_peak_values;  // ピークドットの履歴
  size_t meter_values_pos;         // 書き込み位置

} SPECTRUM_HANDLE;

int32_t spectrum_open(SPECTRUM_HANDLE* handle, int32_t sample_rate, int16_t bps, uint8_t display_scale, uint8_t fall_speed);
void spectrum_close(SPECTRUM_HANDLE* handle);
void spectrum_process(SPECTRUM_HANDLE* handle, const int16_t* pcm, size_t samples);

#endif