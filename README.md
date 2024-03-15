# hflap-src
HFLAP.X source code tree

---

HFLAP.X is using the following awesome software libraries:

- libfoxenflac (GPL2)

---

# libfoxenflac ― Tiny, heap-allocation free FLAC decoder written in C 

[![Build Status](https://travis-ci.org/astoeckel/libfoxenflac.svg?branch=master)](https://travis-ci.org/astoeckel/libfoxenflac)
[![Coverage Status](https://coveralls.io/repos/github/astoeckel/libfoxenflac/badge.svg)](https://coveralls.io/github/astoeckel/libfoxenflac)

`libfoxenflac` is a tiny FLAC ([Free Lossless Audio Codec](https://xiph.org/flac/))
decoder written in C99. It does not depend on any C library function,
including memory allocations. It provides a simple, state-machine based
interface that allows you to decode a FLAC stream from a sequence of arbitrarily
sized byte buffers. Depending on maximum number of channels and the maximum
block size, `libfoxenflac` requires between 40 kiB (FLAC Subset format,
stereo, up to 48000 kHz) and 2 MiB of memory (all standard-conformant FLAC
files).

This library is perfect for environments without runtime library, such as
embedded devices or Web Assembly (WASM).