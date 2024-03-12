#!/bin/bash

if [ "${XDEV68K_DIR}" == "" ]; then
  echo "error: XDEV68K_DIR environment variable is not defined."
  exit 1
fi

CC=${XDEV68K_DIR}/m68k-toolchain/bin/m68k-elf-gcc
GAS2HAS="${XDEV68K_DIR}/util/x68k_gas2has.pl -cpu 68030 -inc doscall.inc -inc iocscall.inc"
RUN68=${XDEV68K_DIR}/run68/run68x
HAS=${XDEV68K_DIR}/x68k_bin/HAS060.X
AR=${XDEV68K_DIR}/x68k_bin/AR.X

INCLUDE_FLAGS="-I${XDEV68K_DIR}/include/xc -I${XDEV68K_DIR}/include/xdev68k"
COMMON_FLAGS="-m68030 -O3 ${INCLUDE_FLAGS} -z-stack=32768"
CFLAGS="${COMMON_FLAGS} -Wno-builtin-declaration-mismatch -fcall-used-d2 -fcall-used-a2 \
    -fexec-charset=cp932 -fverbose-asm -fno-defer-pop -DFPM_DEFAULT -D_TIME_T_DECLARED -D_CLOCK_T_DECLARED -Dwint_t=int \
		-DXDEV68K"

LIBS="${XDEV68K_DIR}/lib/xc/CLIB.L ${XDEV68K_DIR}/lib/xc/DOSLIB.L ${XDEV68K_DIR}/lib/xc/IOCSLIB.L ${XDEV68K_DIR}/lib/xc/FLOATFNC.L ${XDEV68K_DIR}/lib/m68k_elf/m68000/libgcc.a"

function do_compile() {
  pushd .
  cd $1
  rm -rf _build
  mkdir -p _build
  for c in $2; do
    echo "compiling ${c}.c in ${1}"
	  ${CC} -S ${CFLAGS} -o _build/${c}.m68k-gas.s ${c}.c
    if [ ! -f _build/${c}.m68k-gas.s ]; then
      return 1
    fi
	  perl ${GAS2HAS} -i _build/${c}.m68k-gas.s -o _build/${c}.s
	  rm -f _build/${c}.m68k-gas.s
	  ${XDEV68K_DIR}/run68/run68 ${HAS} -e -u -w0 ${INCLUDE_FLAGS} _build/${c}.s -o _build/${c}.o
    if [ ! -f _build/${c}.o ]; then
      return 1
    fi
  done
  popd
  return 0
}

function build_libmad() {
  do_compile . "application bitreader cuesheet debug flac frame frameheader metadata metadataheader \
  mflac ogg oggheader padding picture residual seektable streaminfo streammarker subframe_constant \
  subframe_fixed subframe_lpc subframe_verbatim subframe subframeheader unpack vorbiscomment"
}

build_libmad
