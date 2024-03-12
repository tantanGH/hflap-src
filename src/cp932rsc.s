  .align 2

  .globl _cp932rsc_unknown_option
  .globl _cp932rsc_too_many_files
  .globl _cp932rsc_file_open_error
  .globl _cp932rsc_tag_read_error
  .globl _cp932rsc_file_read_error
  .globl _cp932rsc_header_read_error
  .globl _cp932rsc_himem_not_available
  .globl _cp932rsc_pcm8_not_available
  .globl _cp932rsc_pcm8pp_not_available
  .globl _cp932rsc_himem_shortage
  .globl _cp932rsc_mainmem_shortage
  .globl _cp932rsc_flac_decoder_init_error
  .globl _cp932rsc_flac_decoder_setup_error
  .globl _cp932rsc_flac_bps_error
  .globl _cp932rsc_flac_freq_error
  .globl _cp932rsc_flac_channel_error
  .globl _cp932rsc_flac_decode_error
  .globl _cp932rsc_buffer_underrun
  .globl _cp932rsc_mpu_type
  .globl _cp932rsc_not_flac_file
  .globl _cp932rsc_half_rate_mercury35

  .data

_cp932rsc_unknown_option:
  .dc.b '未対応のオプションです。(%s)',$00

_cp932rsc_too_many_files:
  .dc.b '指定したFLACファイルの数が多すぎます。',$00

_cp932rsc_file_open_error:
  .dc.b '指定ファイルがオープンできませんでした。',$00

_cp932rsc_file_read_error:
  .dc.b 'ファイル全体の読み込みができませんでした。',$00

_cp932rsc_tag_read_error:
  .dc.b 'タグの読み込みができませんでした。',$00

_cp932rsc_header_read_error:
  .dc.b 'ヘッダーの読み込みができませんでした。',$00

_cp932rsc_himem_not_available:
  .dc.b 'ハイメモリドライバが組み込まれていません。',$00

_cp932rsc_pcm8_not_available:
  .dc.b 'PCM8A/PCM8PPのいずれかを組み込む必要があります。',$00

_cp932rsc_pcm8pp_not_available:
  .dc.b 'PCM8PPを組み込む必要があります。',$00

_cp932rsc_himem_shortage:
  .dc.b 'ハイメモリエリアが不足しています。',$00

_cp932rsc_mainmem_shortage:
  .dc.b 'メインメモリエリアが不足しています。',$00

_cp932rsc_flac_decoder_init_error:
  .dc.b 'FLACデコーダーの初期化に失敗しました。',$00

_cp932rsc_flac_decoder_setup_error:
  .dc.b 'FLACデコーダーのセットアップに失敗しました。',$00

_cp932rsc_flac_bps_error:
  .dc.b '16bit/24bitのFLACデータのみ対応しています。',$00

_cp932rsc_flac_freq_error:
  .dc.b '44.1kHz/48.0kHz/96.0kHzのFLACデータのみ対応しています。',$00

_cp932rsc_flac_channel_error:
  .dc.b '2ch stereoのFLACデータのみ対応しています。',$00

_cp932rsc_flac_decode_error:
  .dc.b 'FLACのデコードに失敗しました。',$00

_cp932rsc_buffer_underrun:
  .dc.b 'バッファアンダーランを検出しました。再バッファリングします。',$00

_cp932rsc_mpu_type:
  .dc.b 'このプログラムは68030以上専用です。',$00

_cp932rsc_not_flac_file:
  .dc.b 'FLACファイルではありません。',$00

_cp932rsc_half_rate_mercury35:
  .dc.b 'ハーフレートでの再生にはMercury-UNIT V3.5以上が必要です。',$00

  .end