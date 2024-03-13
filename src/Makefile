# この makefile は、msys や cygwin などの Unix 互換環境上で利用することを想定している。
# ビルドには xdev68k が必要。
# https://github.com/yosshin4004/xdev68k

# 必要な環境変数が定義されていることを確認する。
ifndef XDEV68K_DIR
	$(error ERROR : XDEV68K_DIR is not defined.)
endif

# デフォルトサフィックスを削除
.SUFFIXES:

# 各種コマンド短縮名
CXX = ${XDEV68K_DIR}/m68k-toolchain/bin/m68k-elf-g++
CC = ${XDEV68K_DIR}/m68k-toolchain/bin/m68k-elf-gcc
GAS2HAS = perl ${XDEV68K_DIR}/util/x68k_gas2has.pl -cpu 68030 -inc doscall.inc -inc iocscall.inc
RUN68 = ${XDEV68K_DIR}/run68/run68x
HAS = $(RUN68) ${XDEV68K_DIR}/x68k_bin/HAS060.X
HLK = $(RUN68) ${XDEV68K_DIR}/x68k_bin/hlk.r

# miniflac directory
MINIFLAC_DIR="../miniflac-1.1.1"

# 実行ファイル名
TARGET_FILE = HFLAP.X

# Document file
DOCUMENT_FILE = HFLAP.DOC

# Distribution package 
PACKAGE_FILE = ../HFLAP010.ZIP

# ヘッダ検索パス
INCLUDE_FLAGS = -I${XDEV68K_DIR}/include/xc -I${XDEV68K_DIR}/include/xdev68k -I${MINIFLAC_DIR}

# コンパイルフラグ
COMMON_FLAGS = -m68030 -O3 $(INCLUDE_FLAGS) -z-stack=8192
CFLAGS = $(COMMON_FLAGS) -Wno-builtin-declaration-mismatch -fcall-used-d2 -fcall-used-a2 \
    -fexec-charset=cp932 -fverbose-asm -fno-defer-pop

# *.c ソースファイル
#C_SRCS = himem.c crtc.c pcm8a.c pcm8pp.c mp3_decode.c picojpeg.c jpeg_decode.c main.c
C_SRCS = himem.c crtc.c pcm8a.c pcm8pp.c flac_decode.c main.c
# *.s ソースファイル
#ASM_SRCS = utf16_cp932.s cp932rsc.s
ASM_SRCS = cp932rsc.s

# *.h source files
#HEADER_SRCS = utf16_cp932.h cp932rsc.h himem.h crtc.h pcm8a.h pcm8pp.h mp3_decode.h picojpeg.h jpeg_decode.h hmp3p.h
HEADER_SRCS = cp932rsc.h himem.h crtc.h pcm8a.h pcm8pp.h flac_decode.h hflap.h

# リンク対象のライブラリファイル
LIBS =\
	${XDEV68K_DIR}/lib/xc/CLIB.L \
	${XDEV68K_DIR}/lib/xc/DOSLIB.L \
	${XDEV68K_DIR}/lib/xc/IOCSLIB.L \
	${XDEV68K_DIR}/lib/xc/FLOATFNC.L \
	${XDEV68K_DIR}/lib/m68k_elf/m68000/libgcc.a

# 中間ファイル生成用ディレクトリ
INTERMEDIATE_DIR = _build

# オブジェクトファイル
OBJS = $(addprefix $(INTERMEDIATE_DIR)/,$(patsubst %.c,%.o,$(C_SRCS))) \
	$(addprefix $(INTERMEDIATE_DIR)/,$(patsubst %.s,%.o,$(ASM_SRCS))) 

# オブジェクトファイル (miniflac)
OBJS2 = ${MINIFLAC_DIR}/src/_build/flacall.o
OBJS2a = ${MINIFLAC_DIR}/src/_build/*.o
OBJS2b = \
  ${MINIFLAC_DIR}/src/_build/application.o \
  ${MINIFLAC_DIR}/src/_build/bitreader.o \
  ${MINIFLAC_DIR}/src/_build/cuesheet.o \
  ${MINIFLAC_DIR}/src/_build/flac.o \
  ${MINIFLAC_DIR}/src/_build/frame.o \
  ${MINIFLAC_DIR}/src/_build/frameheader.o \
  ${MINIFLAC_DIR}/src/_build/metadata.o \
  ${MINIFLAC_DIR}/src/_build/metadataheader.o \
  ${MINIFLAC_DIR}/src/_build/ogg.o \
  ${MINIFLAC_DIR}/src/_build/oggheader.o \
  ${MINIFLAC_DIR}/src/_build/padding.o \
  ${MINIFLAC_DIR}/src/_build/picture.o \
  ${MINIFLAC_DIR}/src/_build/residual.o \
  ${MINIFLAC_DIR}/src/_build/seektable.o \
  ${MINIFLAC_DIR}/src/_build/subframe.o \
  ${MINIFLAC_DIR}/src/_build/subframe_constant.o \
  ${MINIFLAC_DIR}/src/_build/subframe_verbatim.o \
  ${MINIFLAC_DIR}/src/_build/subframe_fixed.o \
  ${MINIFLAC_DIR}/src/_build/subframe_lpc.o \
  ${MINIFLAC_DIR}/src/_build/subframeheader.o \
  ${MINIFLAC_DIR}/src/_build/streaminfo.o \
  ${MINIFLAC_DIR}/src/_build/streammarker.o \
  ${MINIFLAC_DIR}/src/_build/vorbiscomment.o \
  ${MINIFLAC_DIR}/src/_build/unpack.o

# HLK に入力するリンクリスト
HLK_LINK_LIST = $(INTERMEDIATE_DIR)/_lk_list.tmp

# デフォルトのターゲット
all : ${INTERMEDIATE_DIR}/$(TARGET_FILE)

# 中間生成物の削除
clean : 
	rm -f $(TARGET_FILE)
	rm -rf $(INTERMEDIATE_DIR)

# 実行ファイルの生成
#	HLK に長いパス文字を与えることは難しい。
#	回避策としてリンク対象ファイルを $(INTERMEDIATE_DIR) 以下にコピーし、
#	短い相対パスを用いてリンクを実行させる。
${INTERMEDIATE_DIR}/$(TARGET_FILE) : $(OBJS)
	mkdir -p $(INTERMEDIATE_DIR)
	rm -f $(HLK_LINK_LIST)
	@for FILENAME in $(OBJS) $(OBJS2); do\
		echo $$FILENAME >> $(HLK_LINK_LIST); \
        done
	@for FILENAME in $(LIBS); do\
		cp $$FILENAME $(INTERMEDIATE_DIR)/`basename $$FILENAME`; \
		echo $(INTERMEDIATE_DIR)/`basename $$FILENAME` >> $(HLK_LINK_LIST); \
        done
	$(HLK) -x -i $(HLK_LINK_LIST) -o ${INTERMEDIATE_DIR}/$(TARGET_FILE)
#	$(HLK) -i $(HLK_LINK_LIST) -o ${INTERMEDIATE_DIR}/$(TARGET_FILE)
	rm -f tmp*.\$$\$$\$$

# *.c ソースのコンパイル
$(INTERMEDIATE_DIR)/%.o : %.c Makefile $(HEADER_SRCS)
	mkdir -p $(INTERMEDIATE_DIR)
	$(CC) -S $(CFLAGS) -o $(INTERMEDIATE_DIR)/$*.m68k-gas.s $<
	$(GAS2HAS) -i $(INTERMEDIATE_DIR)/$*.m68k-gas.s -o $(INTERMEDIATE_DIR)/$*.s
	rm -f $(INTERMEDIATE_DIR)/$*.m68k-gas.s
	$(HAS) -e -u -w0 $(INCLUDE_FLAGS) $(INTERMEDIATE_DIR)/$*.s -o $(INTERMEDIATE_DIR)/$*.o

# *.s ソースのアセンブル
$(INTERMEDIATE_DIR)/%.o : %.s Makefile
	mkdir -p $(INTERMEDIATE_DIR)
	iconv -t cp932 $*.s > $(INTERMEDIATE_DIR)/$*.has
	$(HAS) -e -u -w0 $(INCLUDE_FLAGS) $(INTERMEDIATE_DIR)/$*.has -o $(INTERMEDIATE_DIR)/$*.o

package:
	zip -j ${PACKAGE_FILE} ${INTERMEDIATE_DIR}/${TARGET_FILE} ${DOCUMENT_FILE} 
