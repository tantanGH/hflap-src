# elf2x68k インストールパス
ifndef ELF2X68K_DIR
	ELF2X68K_DIR=/opt/homebrew/Cellar/elf2x68k/20260301
endif

# デフォルトサフィックスを削除
.SUFFIXES:

# バージョン
VERSION = 070

# 実行ファイル名
TARGET_FILE_000 = HFLAP.X
TARGET_FILE_030 = HFLAP030.X
TARGET_FILE_060 = HFLAP060.X

# ドキュメントファイル名
DOCUMENT_FILE = HFLAP.TXT

# 配布パッケージファイル名 
PACKAGE_FILE = ../HFLAP$(VERSION).ZIP

# 各種コマンド短縮名
CC = m68k-xelf-gcc
AS = m68k-xelf-as

# HAS to GAS コンバータ
HAS2GAS = python3 has2gas.py

# ヘッダ検索パス
INCLUDE_FLAGS = -I${ELF2X68K_DIR}/lib/gcc/m68k-elf/13.4.0/include \
				-I${ELF2X68K_DIR}/m68k-elf/include \
				-I../libs/libhimem/include \
				-I../libs/libj/include \
				-I../libs/libutf8/include \
				-I../libs/libjpeg/include \
				-I../libs/libpcm8a/include \
				-I../libs/libpcm8pp/include \
				-I../libs/libfoxenflac-x68k/include

# ライブラリ検索パス
LDFLAGS = -L../libs/libhimem/lib -L../libs/libj/lib -L../libs/libutf8/lib \
		  -L../libs/libjpeg/lib -L../libs/libpcm8a/lib -L../libs/libpcm8pp/lib \
		  -L../libs/libfoxenflac-x68k/lib

# *.c ソースファイル
C_SRCS = flac_decode.c main.c

# *.s ソースファイル
ASM_SRCS = cp932rsc.s

# *.h source files
HEADER_SRCS = cp932rsc.h keyboard.h flac_decode.h hflap.h

# リンク対象のライブラリファイル
LIBS_000 = -ldos -liocs -lhimem -lj -lutf8 -ljpeg -lpcm8a -lpcm8pp -lfoxenflac
LIBS_030 = -ldos -liocs -lhimem -lj -lutf8 -ljpeg -lpcm8a -lpcm8pp -lfoxenflac030
LIBS_060 = -ldos -liocs -lhimem -lj -lutf8 -ljpeg -lpcm8a -lpcm8pp -lfoxenflac060

# 中間ファイル生成用ディレクトリ
INTERMEDIATE_DIR_000 = _build000/elf2x68k
INTERMEDIATE_DIR_030 = _build030/elf2x68k
INTERMEDIATE_DIR_060 = _build060/elf2x68k

# オブジェクトファイル
OBJS_000 =	$(addprefix $(INTERMEDIATE_DIR_000)/,$(patsubst %.c,%.o,$(C_SRCS))) \
	    	$(addprefix $(INTERMEDIATE_DIR_000)/,$(patsubst %.s,%.o,$(ASM_SRCS)))
OBJS_030 =	$(addprefix $(INTERMEDIATE_DIR_030)/,$(patsubst %.c,%.o,$(C_SRCS))) \
	    	$(addprefix $(INTERMEDIATE_DIR_030)/,$(patsubst %.s,%.o,$(ASM_SRCS)))
OBJS_060 =	$(addprefix $(INTERMEDIATE_DIR_060)/,$(patsubst %.c,%.o,$(C_SRCS))) \
	    	$(addprefix $(INTERMEDIATE_DIR_060)/,$(patsubst %.s,%.o,$(ASM_SRCS)))

# コンパイルフラグ
COMMON_FLAGS_000 = -m68000 -O3 -msoft-float $(INCLUDE_FLAGS) -fno-defer-pop
CFLAGS_000 = $(COMMON_FLAGS_000) -DHFLAP
COMMON_FLAGS_030 = -m68030 -O3 -msoft-float $(INCLUDE_FLAGS) -fno-defer-pop
CFLAGS_030 = $(COMMON_FLAGS_030) -DHFLAP
COMMON_FLAGS_060 = -m68060 -O3 -msoft-float $(INCLUDE_FLAGS) -fno-defer-pop
CFLAGS_060 = $(COMMON_FLAGS_060) -DHFLAP

# デフォルトのターゲット
all : 000 030 060
000 : ${INTERMEDIATE_DIR_000}/$(TARGET_FILE_000)
030 : ${INTERMEDIATE_DIR_030}/$(TARGET_FILE_030)
060 : ${INTERMEDIATE_DIR_060}/$(TARGET_FILE_060)

# 中間生成物の削除
clean : 
	rm -f $(PACKAGE_FILE)
	rm -rf $(INTERMEDIATE_DIR_000)
	rm -rf $(INTERMEDIATE_DIR_030)
	rm -rf $(INTERMEDIATE_DIR_060)

# 実行ファイルの生成
${INTERMEDIATE_DIR_000}/$(TARGET_FILE_000) : $(OBJS_000)
	mkdir -p $(INTERMEDIATE_DIR_000)
	$(CC) $(COMMON_FLAGS_000) $(LDFLAGS) -o ${INTERMEDIATE_DIR_000}/${TARGET_FILE_000} $(OBJS_000) $(LIBS_000)
${INTERMEDIATE_DIR_030}/$(TARGET_FILE_030) : $(OBJS_030)
	mkdir -p $(INTERMEDIATE_DIR_030)
	$(CC) $(COMMON_FLAGS_030) $(LDFLAGS) -o ${INTERMEDIATE_DIR_030}/${TARGET_FILE_030} $(OBJS_030) $(LIBS_030)
${INTERMEDIATE_DIR_060}/$(TARGET_FILE_060) : $(OBJS_060)
	mkdir -p $(INTERMEDIATE_DIR_060)
	$(CC) $(COMMON_FLAGS_060) $(LDFLAGS) -o ${INTERMEDIATE_DIR_060}/${TARGET_FILE_060} $(OBJS_060) $(LIBS_060)

# *.c ソースのコンパイル
$(INTERMEDIATE_DIR_000)/%.o : %.c Makefile $(HEADER_SRCS)
	mkdir -p $(INTERMEDIATE_DIR_000)
	$(CC) $(CFLAGS_000) -c $*.c -o $(INTERMEDIATE_DIR_000)/$*.o
$(INTERMEDIATE_DIR_030)/%.o : %.c Makefile $(HEADER_SRCS)
	mkdir -p $(INTERMEDIATE_DIR_030)
	$(CC) $(CFLAGS_030) -c $*.c -o $(INTERMEDIATE_DIR_030)/$*.o
$(INTERMEDIATE_DIR_060)/%.o : %.c Makefile $(HEADER_SRCS)
	mkdir -p $(INTERMEDIATE_DIR_060)
	$(CC) $(CFLAGS_060) -c $*.c -o $(INTERMEDIATE_DIR_060)/$*.o

# *.s ソースのアセンブル
$(INTERMEDIATE_DIR_000)/%.o : %.s Makefile $(HEADER_SRCS)
	mkdir -p $(INTERMEDIATE_DIR_000)
	$(HAS2GAS) < $*.s > $(INTERMEDIATE_DIR_000)/$*.gas
	$(AS) -c $(INTERMEDIATE_DIR_000)/$*.gas -o $(INTERMEDIATE_DIR_000)/$*.o
$(INTERMEDIATE_DIR_030)/%.o : %.s Makefile $(HEADER_SRCS)
	mkdir -p $(INTERMEDIATE_DIR_030)
	$(HAS2GAS) < $*.s > $(INTERMEDIATE_DIR_030)/$*.gas
	$(AS) -c $(INTERMEDIATE_DIR_030)/$*.gas -o $(INTERMEDIATE_DIR_030)/$*.o
$(INTERMEDIATE_DIR_060)/%.o : %.s Makefile $(HEADER_SRCS)
	mkdir -p $(INTERMEDIATE_DIR_060)
	$(HAS2GAS) < $*.s > $(INTERMEDIATE_DIR_060)/$*.gas
	$(AS) -c $(INTERMEDIATE_DIR_060)/$*.gas -o $(INTERMEDIATE_DIR_060)/$*.o

# 配布用パッケージ作成
package:
	zip -j ${PACKAGE_FILE} ${DOCUMENT_FILE} ${INTERMEDIATE_DIR_000}/${TARGET_FILE_000} ${INTERMEDIATE_DIR_030}/${TARGET_FILE_030} ${INTERMEDIATE_DIR_060}/${TARGET_FILE_060} 
