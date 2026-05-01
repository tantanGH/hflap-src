#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "spectrum.h"
#include "himem.h"

// --- Coefficients for 11025 Hz ---
static const FILTER_COEFFS coeff11[] = {
{ 91, 0, -91, -7991, 3914 }, // 120Hz
{ 185, 0, -185, -7743, 3726 }, // 250Hz
{ 351, 0, -351, -7188, 3394 }, // 500Hz
{ 624, 0, -624, -5846, 2847 }, // 1000Hz
{ 952, 0, -952, -2627, 2192 }, // 2000Hz
{ 827, 0, -827, 4256, 2442 }, // 4000Hz
{ -2012, 0, 2012, 1864, 8120 }, // 8000Hz
};

// --- Coefficients for 12000 Hz ---
static const FILTER_COEFFS coeff12[] = {
{ 84, 0, -84, -8008, 3928 }, // 120Hz
{ 171, 0, -171, -7783, 3754 }, // 250Hz
{ 325, 0, -325, -7284, 3445 }, // 500Hz
{ 585, 0, -585, -6081, 2926 }, // 1000Hz
{ 918, 0, -918, -3178, 2261 }, // 2000Hz
{ 918, 0, -918, 3178, 2261 }, // 4000Hz
{ -1662, 0, 1662, 5758, 7421 }, // 8000Hz
};

// --- Coefficients for 22050 Hz ---
static const FILTER_COEFFS coeff22[] = {
{ 46, 0, -46, -8095, 4004 }, // 120Hz
{ 95, 0, -95, -7982, 3906 }, // 250Hz
{ 185, 0, -185, -7743, 3726 }, // 500Hz
{ 351, 0, -351, -7188, 3394 }, // 1000Hz
{ 624, 0, -624, -5846, 2847 }, // 2000Hz
{ 952, 0, -952, -2627, 2192 }, // 4000Hz
{ 827, 0, -827, 4256, 2442 }, // 8000Hz
};

// --- Coefficients for 24000 Hz ---
static const FILTER_COEFFS coeff24[] = {
{ 42, 0, -42, -8103, 4011 }, // 120Hz
{ 87, 0, -87, -8000, 3921 }, // 250Hz
{ 171, 0, -171, -7783, 3754 }, // 500Hz
{ 325, 0, -325, -7284, 3445 }, // 1000Hz
{ 585, 0, -585, -6081, 2926 }, // 2000Hz
{ 918, 0, -918, -3178, 2261 }, // 4000Hz
{ 918, 0, -918, 3178, 2261 }, // 8000Hz
};

// --- Coefficients for 44100 Hz (1.13) ---
static const FILTER_COEFFS coeff44[] = {
{ 23, 0, -23, -8144, 4050 }, // 120Hz
{ 48, 0, -48, -8091, 4000 }, // 250Hz
{ 95, 0, -95, -7982, 3906 }, // 500Hz
{ 185, 0, -185, -7743, 3726 }, // 1000Hz
{ 351, 0, -351, -7188, 3394 }, // 2000Hz
{ 624, 0, -624, -5846, 2847 }, // 4000Hz
{ 952, 0, -952, -2627, 2192 }, // 8000Hz
};

// --- Coefficients for 48000 Hz (1.13) ---
static const FILTER_COEFFS coeff48[] = {
{ 21, 0, -21, -8148, 4053 }, // 120Hz
{ 44, 0, -44, -8099, 4008 }, // 250Hz
{ 87, 0, -87, -8000, 3921 }, // 500Hz
{ 171, 0, -171, -7783, 3754 }, // 1000Hz
{ 325, 0, -325, -7284, 3445 }, // 2000Hz
{ 585, 0, -585, -6081, 2926 }, // 4000Hz
{ 918, 0, -918, -3178, 2261 }, // 8000Hz
};

// スペクトラムアナライザの初期化
int32_t spectrum_open(SPECTRUM_HANDLE* handle, int32_t sample_rate, int16_t bps, uint8_t display_scale, uint8_t fall_speed) {
  
  // サンプルレートに応じたフィルタ係数のテーブルを選択
  if (sample_rate == 44100 || sample_rate == 88200) {
    handle->filter_coeffs_hi = (FILTER_COEFFS*)coeff22;
    handle->filter_coeffs_lo = (FILTER_COEFFS*)coeff11;
  } else if (sample_rate == 48000 || sample_rate == 96000) {
    handle->filter_coeffs_hi = (FILTER_COEFFS*)coeff24;
    handle->filter_coeffs_lo = (FILTER_COEFFS*)coeff12;
  } else {
    return -1; // 対応していないサンプルレート
  }

  // サンプルレート・ビット深度の保存
  handle->sample_rate = sample_rate;
  handle->bps = bps;

  // バンドの状態初期化
  for (int16_t b = 0; b < NUM_BANDS; b++) {
    handle->bands_L[b].x1 = 0;
    handle->bands_L[b].x2 = 0;
    handle->bands_L[b].y1 = 0;
    handle->bands_L[b].y2 = 0;
    handle->bands_R[b].x1 = 0;
    handle->bands_R[b].x2 = 0;
    handle->bands_R[b].y1 = 0;
    handle->bands_R[b].y2 = 0;
  }

  // ピークホールド値の初期化
  for (int16_t b = 0; b < NUM_BANDS; b++) {
    handle->peak_value_L[b] = 0;
    handle->peak_value_R[b] = 0;
  }

  // ダウンサンプリング用のカウンタ初期化
  handle->resample_counter = 0;

  // 表示スケールの設定
  handle->display_scale = display_scale;

  // 落下速度の設定
  handle->fall_speed = fall_speed;

  // メーター値の初期化
  handle->meter_values_pos = 0;
  handle->meter_values = himem_malloc(sizeof(METER_VALUE) * MAX_METER_FRAMES);  // 最大 8バンド * 2チャンネル * 56Hz * 1800秒 (約3MB)
  if (handle->meter_values == NULL) {
    return -1; // メモリ確保失敗
  }
  memset(handle->meter_values, 0, sizeof(METER_VALUE) * MAX_METER_FRAMES);

  // 最終出力値の初期化
  for (int16_t b = 0; b < NUM_BANDS; b++) {
    handle->last_meter_L[b] = 0;
    handle->last_meter_R[b] = 0;
  }

  return 0; // 成功
}

// ハンドルのクローズとメモリ解放
void spectrum_close(SPECTRUM_HANDLE* handle) {
  if (handle->meter_values != NULL) {
    himem_free(handle->meter_values);
    handle->meter_values = NULL;
  }
}

static int32_t process_biquad(int32_t input, BIQUAD_STATE* s, const FILTER_COEFFS* coeffs) {
    // 32bitで計算
    int32_t acc;
    
    acc = (coeffs->b0 * input
           + coeffs->b1 * s->x1
           + coeffs->b2 * s->x2 
           - coeffs->a1 * s->y1
           - coeffs->a2 * s->y2) >> 12;

    int32_t out = acc;

    // 強烈なリミッター（16bit幅に閉じ込める）
    if (out > 32767) out = 32767;
    else if (out < -32768) out = -32768;

    s->x2 = s->x1; s->x1 = input;
    s->y2 = s->y1; s->y1 = out;

    return out;
}

// PCMデータを処理してスペクトラムアナライザの値を更新
void spectrum_process(SPECTRUM_HANDLE* handle, const int16_t* pcm, size_t samples) {

  uint32_t accumulator = handle->resample_counter;
  uint32_t threshold = (handle->sample_rate == 44100 || handle->sample_rate == 88200) ? 44100000 : 48000000;
  const uint32_t vsync_step = handle->bps == 16 ? VSYNC_BPS16_HZ : VSYNC_BPS24_HZ; 

  for (size_t i = 0; i < samples; i++) {

    // 1. PCM取得（16bit signed）
    int32_t L = (int32_t)*pcm++;
    int32_t R = (int32_t)*pcm++;

    if ((i % 4) == 0) {
      // 2. 8つのフィルタを回す (120Hz, 250Hz, 500Hz, 1kHz)
      for (int b = 0; b < 4; b++) {

        // フィルタ実行
        int32_t outL = process_biquad(L, &handle->bands_L[b], &handle->filter_coeffs_lo[b]);
        int32_t outR = process_biquad(R, &handle->bands_R[b], &handle->filter_coeffs_lo[b]);

        // 絶対値(振幅)を取る
        if (outL < 0) outL = -outL;
        if (outR < 0) outR = -outR;

        // VSYNC区間内での最大値を保持(ピークホールド)
        if (outL > handle->peak_value_L[b]) handle->peak_value_L[b] = outL;
        if (outR > handle->peak_value_R[b]) handle->peak_value_R[b] = outR;
      }
    }

    if ((i % 2) == 0) {
      // 2. 8つのフィルタを回す (2kHz, 4kHz, 8kHz)
      for (int b = 4; b < NUM_BANDS; b++) {

        // フィルタ実行
        int32_t outL = process_biquad(L, &handle->bands_L[b], &handle->filter_coeffs_hi[b]);
        int32_t outR = process_biquad(R, &handle->bands_R[b], &handle->filter_coeffs_hi[b]);

        // 絶対値(振幅)を取る
        if (outL < 0) outL = -outL;
        if (outR < 0) outR = -outR;

        // VSYNC区間内での最大値を保持(ピークホールド)
        if (outL > handle->peak_value_L[b]) handle->peak_value_L[b] = outL;
        if (outR > handle->peak_value_R[b]) handle->peak_value_R[b] = outR;
      }
    }

    // 3. VSYNC同期判定（サンプルごとに1回加算）
    accumulator += vsync_step;
    if (accumulator >= threshold) {
      accumulator -= threshold;

      if (handle->meter_values_pos < MAX_METER_FRAMES) {
        METER_VALUE* v = &handle->meter_values[handle->meter_values_pos];
        
        for (int b = 0; b < NUM_BANDS; b++) {

          // 一旦 32bit で計算
          int32_t curL = ((int32_t)handle->peak_value_L[b] * handle->display_scale) >> 15;
          int32_t curR = ((int32_t)handle->peak_value_R[b] * handle->display_scale) >> 15;

          // display_scale を超えないようにリミッターをかける
          if (curL > handle->display_scale) curL = handle->display_scale;
          if (curR > handle->display_scale) curR = handle->display_scale;

          uint8_t current_L = (uint8_t)curL;
          uint8_t current_R = (uint8_t)curR;

          // --- 落下演出（ディケイ）ロジック ---
          // 左チャンネル
          if (current_L >= handle->last_meter_L[b]) {
            handle->last_meter_L[b] = current_L; // 上がる時は瞬時
          } else {
            if (handle->last_meter_L[b] > handle->fall_speed)
              handle->last_meter_L[b] -= handle->fall_speed; // ゆったり落とす
            else
              handle->last_meter_L[b] = 0;
          }

          // 右チャンネル
          if (current_R >= handle->last_meter_R[b]) {
            handle->last_meter_R[b] = current_R;
          } else {
            if (handle->last_meter_R[b] > handle->fall_speed)
              handle->last_meter_R[b] -= handle->fall_speed;
            else
              handle->last_meter_R[b] = 0;
          }

          // 最終的な値をバッファに書き込み
          v->meter_L[b] = handle->last_meter_L[b];
          v->meter_R[b] = handle->last_meter_R[b];

          // ピークリセット
          handle->peak_value_L[b] = 0;
          handle->peak_value_R[b] = 0;
        }
        handle->meter_values_pos++;
      }
    }
  }

  // 最後に蓄積されたカウンタをハンドルに戻す
  handle->resample_counter = accumulator;
}