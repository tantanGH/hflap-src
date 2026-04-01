#include "cp932rsc.h"

const uint8_t cp932rsc_unknown_option[] = "未対応のオプションです。(%s)";
const uint8_t cp932rsc_too_many_files[] = "指定したFLACファイルの数が多すぎます。";
const uint8_t cp932rsc_file_open_error[] = "指定ファイルがオープンできませんでした。";
const uint8_t cp932rsc_file_read_error[] = "ファイル全体の読み込みができませんでした。";
const uint8_t cp932rsc_tag_read_error[] = "タグの読み込みができませんでした。";
const uint8_t cp932rsc_header_read_error[] = "ヘッダーの読み込みができませんでした。";
const uint8_t cp932rsc_himem_not_available[] = "ハイメモリドライバが組み込まれていません。";
const uint8_t cp932rsc_pcm8_not_available[] = "PCM8A/PCM8PPのいずれかを組み込む必要があります。";
const uint8_t cp932rsc_pcm8pp_not_available[] = "PCM8PPを組み込む必要があります。";
const uint8_t cp932rsc_himem_shortage[] = "ハイメモリエリアが不足しています。";
const uint8_t cp932rsc_mainmem_shortage[] = "メインメモリエリアが不足しています。";
const uint8_t cp932rsc_flac_decoder_init_error[] = "FLACデコーダーの初期化に失敗しました。";
const uint8_t cp932rsc_flac_decoder_setup_error[] = "FLACデコーダーのセットアップに失敗しました。";
const uint8_t cp932rsc_flac_bps_error[] = "16bit/24bitのFLACデータのみ対応しています。";
const uint8_t cp932rsc_flac_freq_error[] = "44.1/48.0/88.2/96.0kHzのFLACデータのみ対応しています。";
const uint8_t cp932rsc_flac_channel_error[] = "2ch stereoのFLACデータのみ対応しています。";
const uint8_t cp932rsc_flac_decode_error[] = "FLACのデコードに失敗しました。";
const uint8_t cp932rsc_buffer_underrun[] = "バッファアンダーランを検出しました。再バッファリングします。";
const uint8_t cp932rsc_mpu_type_68060[] = "このプログラムは68060専用です。";
const uint8_t cp932rsc_mpu_type_68030[] = "このプログラムは68030以上専用です。";
const uint8_t cp932rsc_not_flac_file[] = "FLACファイルではありません。";
const uint8_t cp932rsc_half_rate_mercury35[] = "ハーフレートでの再生にはMercury-UNIT V3.5以上が必要です。";
