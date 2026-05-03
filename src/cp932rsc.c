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
const uint8_t cp932rsc_spectrum_analyzer_init_error[] = "スペクトラムアナライザーの初期化に失敗しました。";
const uint8_t cp932rsc_spectrum_display_init_error[] = "スペクトラムディスプレイの初期化に失敗しました。";
const uint8_t cp932rsc_vsync_interrupt_error[] = "VSYNC割り込みの設定に失敗しました。";
const uint8_t cp932rsc_flac_decoder_init_error[] = "FLACデコーダーの初期化に失敗しました。";
const uint8_t cp932rsc_flac_decoder_setup_error[] = "FLACデコーダーのセットアップに失敗しました。";
const uint8_t cp932rsc_flac_bps_error[] = "16bit/24bitのFLACデータのみ対応しています。";
const uint8_t cp932rsc_flac_freq_error[] = "44.1/48.0/88.2/96.0kHzのFLACデータのみ対応しています。";
const uint8_t cp932rsc_flac_channel_error[] = "2ch stereoのFLACデータのみ対応しています。";
const uint8_t cp932rsc_flac_decode_error[] = "FLACのデコードに失敗しました。";
const uint8_t cp932rsc_mpu_type_68060[] = "このプログラムは68060専用です。";
const uint8_t cp932rsc_mpu_type_68030[] = "このプログラムは68030以上専用です。";
const uint8_t cp932rsc_not_flac_file[] = "FLACファイルではありません。";
const uint8_t cp932rsc_half_rate_mercury35[] = "ハーフレートでの再生にはMercury-UNIT V3.5以上が必要です。";

const uint8_t cp932rsc_buffer_underrun[] = "\r\nバッファアンダーランを検出しました。再バッファリングします。\r\n";

const uint8_t cp932rsc_erase_line[] = "\r\x1b[0K";
const uint8_t cp932rsc_erase_line_and_up[] = "\r\x1b[0K\x1bM";

const uint8_t cp932rsc_crlf[] = "\r\n";

const uint8_t cp932rsc_progress_normal[] = ">";
const uint8_t cp932rsc_progress_wait[] = "_";
const uint8_t cp932rsc_progress_under[] = "*";
const uint8_t cp932rsc_progress_last[] = "|";

const uint8_t cp932rsc_aborted[] = "\r\nAborted.\r\n";
const uint8_t cp932rsc_stopped[] = "\r\nStopped.\r\n";
const uint8_t cp932rsc_finished[] = "\r\nFinished.\r\n";
const uint8_t cp932rsc_canceled[] = "\r\x1b[KCanceled.\r\n";

const uint8_t cp932rsc_now_loading[] = "\rLoading FLAC file...\x1b[0K";
const uint8_t cp932rsc_now_loading_picture[] = "\rLoading tags and picture image...\x1b[0K";
const uint8_t cp932rsc_now_buffering[] = "\rNow buffering (%d/%d) ... [SHIFT] key to cancel.";
const uint8_t cp932rsc_now_playing[] = "\r\nNow playing ... push [ESC]/[Q] key to quit. [SPACE] to pause.\x1b[0K\r\n";

const uint8_t cp932rsc_flac_file_name[]   = "File name      : %s\r\n";
const uint8_t cp932rsc_flac_data_size[]   = "Data size      : %d [bytes]\r\n";
const uint8_t cp932rsc_flac_data_format[] = "Data format    : %s\r\n";
const uint8_t cp932rsc_pcm_driver[]       = "PCM driver     : %s (volume:%d)\r\n";
const uint8_t cp932rsc_flac_title[]       = "FLAC title     : %s\r\n";
const uint8_t cp932rsc_flac_artist[]      = "FLAC artist    : %s\r\n";
const uint8_t cp932rsc_flac_album[]       = "FLAC album     : %s\r\n";
const uint8_t cp932rsc_flac_vendor[]      = "FLAC vendor    : %s\r\n";
const uint8_t cp932rsc_flac_frequency[]   = "FLAC frequency : %d [Hz]\r\n";
const uint8_t cp932rsc_flac_channels[]    = "FLAC channels  : %s\r\n"; 
const uint8_t cp932rsc_flac_bit_depth[]   = "FLAC bit depth : %d [bits]\r\n";