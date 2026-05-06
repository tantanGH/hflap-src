#include <stdlib.h>
#include <string.h>
#include <x68k/iocs.h>
#include "spectrum_pcg.h"

//
//  VDC IO Addresses
//
volatile static uint16_t* VDC_R0   = (uint16_t*)0xE82400;
volatile static uint16_t* VDC_R1   = (uint16_t*)0xE82500;
volatile static uint16_t* VDC_R2   = (uint16_t*)0xE82600;

//
//  GPIP IO Address
//
volatile static uint8_t* REG_GPIP = (uint8_t*)0xE88001;

#define WAIT_VSYNC   while(!(REG_GPIP[0] & 0x10))
#define WAIT_VBLANK    while(REG_GPIP[0] & 0x10)

//
//  BG / SP IO Addresses
//
volatile static uint16_t* PAL_BLK1   = (uint16_t*)0xE82220;
volatile static uint16_t* PAL_BLK2   = (uint16_t*)0xE82240;
volatile static uint16_t* PAL_BLK3   = (uint16_t*)0xE82260;
volatile static uint16_t* PAL_BLK4   = (uint16_t*)0xE82280;

volatile static uint16_t* SP_SCRL    = (uint16_t*)0xEB0000;
volatile static uint16_t* BG0_SCRL   = (uint16_t*)0xEB0800;
volatile static uint16_t* BG1_SCRL   = (uint16_t*)0xEB0804;
volatile static uint16_t* BG_CTRL    = (uint16_t*)0xEB0808;
volatile static uint16_t* SP_CTRL    = (uint16_t*)0xEB080A;

volatile static uint16_t* PCG        = (uint16_t*)0xEB8000;
volatile static uint16_t* PCG_127    = (uint16_t*)0xEBBF80;
volatile static uint16_t* BG_TEXT0   = (uint16_t*)0xEBC000;
volatile static uint16_t* BG_TEXT1   = (uint16_t*)0xEBE000;

//
//  Font Addresses
//
static const uint8_t* FONT_ADDR_8x8 = ((uint8_t*)0xF3A000);
#define FONT_BYTES_8x8    (8)
#define FONT_REGULAR      (0)
#define FONT_BOLD         (1)

// 8x8 normal font data
static struct iocs_fntbuf font_data_8x8[ 256 ];

// 8x8 bold font data
static struct iocs_fntbuf font_data_8x8_bold[ 256 ];

// original text palettes
static uint16_t original_text_palettes[ 4 ];

//
//  PCG patterns
//
static const uint16_t bar_patterns[] = {
  // 0: empty
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  
  // --- Color 1 (0x1) ---
  // 1: 1-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x1111, 0x1111, 0x1111, 0x1111, 0x1111, 0x1111, 0x0000, 0x0000,
  // 2: 1-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x1111, 0x1110, 0x1111, 0x1110, 0x1111, 0x1110, 0x0000, 0x0000,
  // 3: 1-both-left
  0x1111, 0x1111, 0x1111, 0x1111, 0x1111, 0x1111, 0x0000, 0x0000,
  0x1111, 0x1111, 0x1111, 0x1111, 0x1111, 0x1111, 0x0000, 0x0000,
  // 4: 1-both-right
  0x1111, 0x1110, 0x1111, 0x1110, 0x1111, 0x1110, 0x0000, 0x0000,
  0x1111, 0x1110, 0x1111, 0x1110, 0x1111, 0x1110, 0x0000, 0x0000,

  // --- Color 2 (0x2) ---
  // 5: 2-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x2222, 0x2222, 0x2222, 0x2222, 0x2222, 0x2222, 0x0000, 0x0000,
  // 6: 2-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x2222, 0x2220, 0x2222, 0x2220, 0x2222, 0x2220, 0x0000, 0x0000,
  // 7: 2-both-left
  0x2222, 0x2222, 0x2222, 0x2222, 0x2222, 0x2222, 0x0000, 0x0000,
  0x2222, 0x2222, 0x2222, 0x2222, 0x2222, 0x2222, 0x0000, 0x0000,
  // 8: 2-both-right
  0x2222, 0x2220, 0x2222, 0x2220, 0x2222, 0x2220, 0x0000, 0x0000,
  0x2222, 0x2220, 0x2222, 0x2220, 0x2222, 0x2220, 0x0000, 0x0000,

  // --- Color 3 (0x3) ---
  // 9: 3-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x3333, 0x3333, 0x3333, 0x3333, 0x3333, 0x3333, 0x0000, 0x0000,
  // 10: 3-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x3333, 0x3330, 0x3333, 0x3330, 0x3333, 0x3330, 0x0000, 0x0000,
  // 11: 3-both-left
  0x3333, 0x3333, 0x3333, 0x3333, 0x3333, 0x3333, 0x0000, 0x0000,
  0x3333, 0x3333, 0x3333, 0x3333, 0x3333, 0x3333, 0x0000, 0x0000,
  // 12: 3-both-right
  0x3333, 0x3330, 0x3333, 0x3330, 0x3333, 0x3330, 0x0000, 0x0000,
  0x3333, 0x3330, 0x3333, 0x3330, 0x3333, 0x3330, 0x0000, 0x0000,

  // --- Color 4 (0x4) ---
  // 13: 4-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x4444, 0x4444, 0x4444, 0x4444, 0x4444, 0x4444, 0x0000, 0x0000,
  // 14: 4-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x4444, 0x4440, 0x4444, 0x4440, 0x4444, 0x4440, 0x0000, 0x0000,
  // 15: 4-both-left
  0x4444, 0x4444, 0x4444, 0x4444, 0x4444, 0x4444, 0x0000, 0x0000,
  0x4444, 0x4444, 0x4444, 0x4444, 0x4444, 0x4444, 0x0000, 0x0000,
  // 16: 4-both-right
  0x4444, 0x4440, 0x4444, 0x4440, 0x4444, 0x4440, 0x0000, 0x0000,
  0x4444, 0x4440, 0x4444, 0x4440, 0x4444, 0x4440, 0x0000, 0x0000,

  // --- Color 5 (0x5) ---
  // 17: 5-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x5555, 0x5555, 0x5555, 0x5555, 0x5555, 0x5555, 0x0000, 0x0000,
  // 18: 5-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x5555, 0x5550, 0x5555, 0x5550, 0x5555, 0x5550, 0x0000, 0x0000,
  // 19: 5-both-left
  0x5555, 0x5555, 0x5555, 0x5555, 0x5555, 0x5555, 0x0000, 0x0000,
  0x5555, 0x5555, 0x5555, 0x5555, 0x5555, 0x5555, 0x0000, 0x0000,
  // 20: 5-both-right
  0x5555, 0x5550, 0x5555, 0x5550, 0x5555, 0x5550, 0x0000, 0x0000,
  0x5555, 0x5550, 0x5555, 0x5550, 0x5555, 0x5550, 0x0000, 0x0000,

  // --- Color 6 (0x6) ---
  // 21: 6-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x0000, 0x0000,
  // 22: 6-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x6666, 0x6660, 0x6666, 0x6660, 0x6666, 0x6660, 0x0000, 0x0000,
  // 23: 6-both-left
  0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x0000, 0x0000,
  0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x0000, 0x0000,
  // 24: 6-both-right
  0x6666, 0x6660, 0x6666, 0x6660, 0x6666, 0x6660, 0x0000, 0x0000,
  0x6666, 0x6660, 0x6666, 0x6660, 0x6666, 0x6660, 0x0000, 0x0000,

  // --- Color 7 (0x7) ---
  // 25: 7-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x7777, 0x7777, 0x7777, 0x7777, 0x7777, 0x7777, 0x0000, 0x0000,
  // 26: 7-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x7777, 0x7770, 0x7777, 0x7770, 0x7777, 0x7770, 0x0000, 0x0000,
  // 27: 7-both-left
  0x7777, 0x7777, 0x7777, 0x7777, 0x7777, 0x7777, 0x0000, 0x0000,
  0x7777, 0x7777, 0x7777, 0x7777, 0x7777, 0x7777, 0x0000, 0x0000,
  // 28: 7-both-right
  0x7777, 0x7770, 0x7777, 0x7770, 0x7777, 0x7770, 0x0000, 0x0000,
  0x7777, 0x7770, 0x7777, 0x7770, 0x7777, 0x7770, 0x0000, 0x0000,

  // --- Color 8 (0x8) ---
  // 29: 8-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x8888, 0x8888, 0x8888, 0x8888, 0x8888, 0x8888, 0x0000, 0x0000,
  // 30: 8-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x8888, 0x8880, 0x8888, 0x8880, 0x8888, 0x8880, 0x0000, 0x0000,
  // 31: 8-both-left
  0x8888, 0x8888, 0x8888, 0x8888, 0x8888, 0x8888, 0x0000, 0x0000,
  0x8888, 0x8888, 0x8888, 0x8888, 0x8888, 0x8888, 0x0000, 0x0000,
  // 32: 8-both-right
  0x8888, 0x8880, 0x8888, 0x8880, 0x8888, 0x8880, 0x0000, 0x0000,
  0x8888, 0x8880, 0x8888, 0x8880, 0x8888, 0x8880, 0x0000, 0x0000,

  // --- Color 9 (0x9) ---
  // 33: 9-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x9999, 0x9999, 0x9999, 0x9999, 0x9999, 0x9999, 0x0000, 0x0000,
  // 34: 9-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x9999, 0x9990, 0x9999, 0x9990, 0x9999, 0x9990, 0x0000, 0x0000,
  // 35: 9-both-left
  0x9999, 0x9999, 0x9999, 0x9999, 0x9999, 0x9999, 0x0000, 0x0000,
  0x9999, 0x9999, 0x9999, 0x9999, 0x9999, 0x9999, 0x0000, 0x0000,
  // 36: 9-both-right
  0x9999, 0x9990, 0x9999, 0x9990, 0x9999, 0x9990, 0x0000, 0x0000,
  0x9999, 0x9990, 0x9999, 0x9990, 0x9999, 0x9990, 0x0000, 0x0000,

  // --- Color A (0xA) ---
  // 37: A-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0x0000, 0x0000,
  // 38: A-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0xAAAA, 0xAAA0, 0xAAAA, 0xAAA0, 0xAAAA, 0xAAA0, 0x0000, 0x0000,
  // 39: A-both-left
  0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0x0000, 0x0000,
  0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0x0000, 0x0000,
  // 40: A-both-right
  0xAAAA, 0xAAA0, 0xAAAA, 0xAAA0, 0xAAAA, 0xAAA0, 0x0000, 0x0000,
  0xAAAA, 0xAAA0, 0xAAAA, 0xAAA0, 0xAAAA, 0xAAA0, 0x0000, 0x0000,

  // --- Color B (0xB) ---
  // 41: B-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0xBBBB, 0xBBBB, 0xBBBB, 0xBBBB, 0xBBBB, 0xBBBB, 0x0000, 0x0000,
  // 42: B-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0xBBBB, 0xBBB0, 0xBBBB, 0xBBB0, 0xBBBB, 0xBBB0, 0x0000, 0x0000,
  // 43: B-both-left
  0xBBBB, 0xBBBB, 0xBBBB, 0xBBBB, 0xBBBB, 0xBBBB, 0x0000, 0x0000,
  0xBBBB, 0xBBBB, 0xBBBB, 0xBBBB, 0xBBBB, 0xBBBB, 0x0000, 0x0000,
  // 44: B-both-right
  0xBBBB, 0xBBB0, 0xBBBB, 0xBBB0, 0xBBBB, 0xBBB0, 0x0000, 0x0000,
  0xBBBB, 0xBBB0, 0xBBBB, 0xBBB0, 0xBBBB, 0xBBB0, 0x0000, 0x0000,

  // --- Color C (0xC) ---
  // 45: C-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0xCCCC, 0xCCCC, 0xCCCC, 0xCCCC, 0xCCCC, 0xCCCC, 0x0000, 0x0000,
  // 46: C-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0xCCCC, 0xCCC0, 0xCCCC, 0xCCC0, 0xCCCC, 0xCCC0, 0x0000, 0x0000,
  // 47: C-both-left
  0xCCCC, 0xCCCC, 0xCCCC, 0xCCCC, 0xCCCC, 0xCCCC, 0x0000, 0x0000,
  0xCCCC, 0xCCCC, 0xCCCC, 0xCCCC, 0xCCCC, 0xCCCC, 0x0000, 0x0000,
  // 48: C-both-right
  0xCCCC, 0xCCC0, 0xCCCC, 0xCCC0, 0xCCCC, 0xCCC0, 0x0000, 0x0000,
  0xCCCC, 0xCCC0, 0xCCCC, 0xCCC0, 0xCCCC, 0xCCC0, 0x0000, 0x0000,

  // --- Color D (0xD) ---
  // 49: D-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0xDDDD, 0xDDDD, 0xDDDD, 0xDDDD, 0xDDDD, 0xDDDD, 0x0000, 0x0000,
  // 50: D-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0xDDDD, 0xDDD0, 0xDDDD, 0xDDD0, 0xDDDD, 0xDDD0, 0x0000, 0x0000,
  // 51: D-both-left
  0xDDDD, 0xDDDD, 0xDDDD, 0xDDDD, 0xDDDD, 0xDDDD, 0x0000, 0x0000,
  0xDDDD, 0xDDDD, 0xDDDD, 0xDDDD, 0xDDDD, 0xDDDD, 0x0000, 0x0000,
  // 52: D-both-right
  0xDDDD, 0xDDD0, 0xDDDD, 0xDDD0, 0xDDDD, 0xDDD0, 0x0000, 0x0000,
  0xDDDD, 0xDDD0, 0xDDDD, 0xDDD0, 0xDDDD, 0xDDD0, 0x0000, 0x0000,

  // --- Color E (0xE) ---
  // 53: E-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0xEEEE, 0xEEEE, 0xEEEE, 0xEEEE, 0xEEEE, 0xEEEE, 0x0000, 0x0000,
  // 54: E-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0xEEEE, 0xEEE0, 0xEEEE, 0xEEE0, 0xEEEE, 0xEEE0, 0x0000, 0x0000,
  // 55: E-both-left
  0xEEEE, 0xEEEE, 0xEEEE, 0xEEEE, 0xEEEE, 0xEEEE, 0x0000, 0x0000,
  0xEEEE, 0xEEEE, 0xEEEE, 0xEEEE, 0xEEEE, 0xEEEE, 0x0000, 0x0000,
  // 56: E-both-right
  0xEEEE, 0xEEE0, 0xEEEE, 0xEEE0, 0xEEEE, 0xEEE0, 0x0000, 0x0000,
  0xEEEE, 0xEEE0, 0xEEEE, 0xEEE0, 0xEEEE, 0xEEE0, 0x0000, 0x0000,

  // --- Color F (0xF) ---
  // 57: F-lower-left
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0x0000, 0x0000,
  // 58: F-lower-right
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0xFFFF, 0xFFF0, 0xFFFF, 0xFFF0, 0xFFFF, 0xFFF0, 0x0000, 0x0000,
  // 59: F-both-left
  0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0x0000, 0x0000,
  0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0x0000, 0x0000,
  // 60: F-both-right
  0xFFFF, 0xFFF0, 0xFFFF, 0xFFF0, 0xFFFF, 0xFFF0, 0x0000, 0x0000,
  0xFFFF, 0xFFF0, 0xFFFF, 0xFFF0, 0xFFFF, 0xFFF0, 0x0000, 0x0000
};

//
//  PCG patterns (stars)
//
static const uint16_t star_patterns[] = {
  // 96: 
  0x0c00, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  
  // 97: 
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x00e0, 0x0000, 0x0000, 0x0000, 0x0000,
  
  // 98: 
  0x0000, 0x0000, 0x0800, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,

  // 99: 
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0a00, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,  
};

//
//  PCG patterns (peak hold bar)
//
static const uint16_t peak_bar_patterns[] = {
  // 32x32 (sprite)
  0xFFFF, 0xFFFF, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,

  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,  

  0xFFFF, 0xFFF0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,

  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
};

//
//  spectrum analyzer freq labels
//
// 125Hz (0-15列)
static uint16_t band_label_100[] = {
  0x0000, 0x3770, 0x1140, 0x1770, 0x1410, 0x1770, 0x0000, 0x0000
};

// 250Hz (16-31列)
static uint16_t band_label_250[] = {
  0x0000, 0x3bb8, 0x0a28, 0x3ba8, 0x20a8, 0x3bb8, 0x0000, 0x0000
};

// 500Hz (32-47列)
static uint16_t band_label_500[] = {
  0x0000, 0x3bb8, 0x22a8, 0x3aa8, 0x0aa8, 0x3bb8, 0x0000, 0x0000
};

// 1KHz (48-63列)
static uint16_t band_label_1k[] = {
  0x0000, 0x3480, 0x1500, 0x1600, 0x1500, 0x1480, 0x0000, 0x0000
};

// 2KHz (64-79列)
static uint16_t band_label_2k[] = {
  0x0000, 0x3a40, 0x0a80, 0x3b00, 0x2280, 0x3a40, 0x0000, 0x0000
};

// 4KHz (80-95列)
static uint16_t band_label_4k[] = {
  0x0000, 0x2a40, 0x2a80, 0x3b00, 0x0a80, 0x0a40, 0x0000, 0x0000
};

// 8KHz (96-111列)
static uint16_t band_label_8k[] = {
  0x0000, 0x3a40, 0x2a80, 0x3b00, 0x2a80, 0x3a40, 0x0000, 0x0000
};

static uint16_t* band_labels[] = {
  band_label_100, band_label_250, band_label_500, 
  band_label_1k,  band_label_2k,  band_label_4k,  band_label_8k
};

//
//  global spectrum analyzer handle (PCG)
//

// 割り込みハンドラ向けグローバル変数
static volatile SPECTRUM_DISPLAY_HANDLE* g_spectrum_display = NULL;
static volatile SPECTRUM_STREAM_HANDLE* g_spectrum_stream = NULL;

#define PEAK_HOLD_BAR_BASE_YPOS  (212)

static void __attribute__((interrupt)) refresh_spectrum_analyzer() {

  // 追い越しチェック
  if (g_spectrum_display->meter_display_pos >= g_spectrum_stream->meter_values_pos) {
    return;
  }

  // 描画位置とモードをローカル変数にコピー
  int16_t xpos = g_spectrum_display->base_xpos;
  int16_t ypos = g_spectrum_display->base_ypos;
  int16_t spectrum_mode = g_spectrum_display->spectrum_mode;

  // 表示スケールをローカル変数にコピー
  int16_t scale = g_spectrum_stream->display_scale;

  // モード変化検出
  int16_t force_refresh = 0;

  // 描画するメーター値の位置を取得
  size_t meter_pos = g_spectrum_display->meter_display_pos;
  METER_VALUE* v = &g_spectrum_stream->meter_values[meter_pos];
  g_spectrum_display->meter_display_pos++;

  // 初回描画またはモード変化時は全描画
  if (meter_pos == 0 || force_refresh) {
    for (int16_t b = 0; b < SPECTRUM_NUM_BANDS; b++) {
      // 現在のメーター値
      uint8_t meter_value_L = v->meter_L[b];
      uint8_t meter_value_R = v->meter_R[b];
      // 描画X位置計算
      int16_t xL = 12 - b * 2;
      int16_t xR = 16 + b * 2; 
      for (int16_t m = 0; m <= v->meter_L[b]; m++) {
        // m=0,1 -> row=0, m=2,3 -> row=1... という関係にスライド
        int16_t row = m / 2;
        int16_t ty = 30 - row;
        volatile uint16_t* p0 = &BG_TEXT1[ (30 - row) * 64 + xL ];
        volatile uint16_t* p1 = &BG_TEXT1[ (31 + row) * 64 + xL ];
        // m=0 の時は強制的に「最初の色の下段(type_offset=1)」になるよう計算
        int16_t color_offset = (m / 2) * 4;
        int16_t type_offset = ((m % 2) == 0) ? 1 : 3; // 偶数(0,2,4...)ならlower, 奇数(1,3,5...)ならboth
        p0[0] = 0x100 + color_offset + type_offset;     // Left
        p0[1] = 0x100 + color_offset + type_offset + 1; // Right
        p1[0] = 0x8200 + color_offset + type_offset;     // Left
        p1[1] = 0x8200 + color_offset + type_offset + 1; // Right
      }
      for (int16_t m = 0; m <= v->meter_R[b]; m++) {
        int16_t row = m / 2;
        int16_t ty = 30 - row;
        volatile uint16_t* p0 = &BG_TEXT1[ (30 - row) * 64 + xR ];
        volatile uint16_t* p1 = &BG_TEXT1[ (31 + row) * 64 + xR ];
        int16_t color_offset = (m / 2) * 4; // 色ごとのオフセット
        int16_t type_offset = ((m % 2) == 0) ? 1 : 3; // 奇数ならlower, 偶数ならboth
        p0[0] = 0x100 + color_offset + type_offset;     // Left
        p0[1] = 0x100 + color_offset + type_offset + 1; // Right
        p1[0] = 0x8200 + color_offset + type_offset;     // Left
        p1[1] = 0x8200 + color_offset + type_offset + 1; // Right
      }  
    }
    return;
  }

// メインバー差分描画
  METER_VALUE* v0 = &g_spectrum_stream->meter_values[meter_pos-1];
  for (int16_t b = 0; b < SPECTRUM_NUM_BANDS; b++) {
    // 現在のメーター値
    uint8_t meter_value_L = v->meter_L[b];
    uint8_t meter_value_R = v->meter_R[b];
    // 前フレームのメーター値
    uint8_t meter_value_L0 = v0->meter_L[b];
    uint8_t meter_value_R0 = v0->meter_R[b];
    // 描画X位置計算
    int16_t xL = 12 - b * 2;
    int16_t xR = 16 + b * 2;
    // メーター値が変わっていたら更新
    if (meter_value_L > meter_value_L0) {
      for (int16_t m = meter_value_L0 + 1; m <= meter_value_L; m++) {
        int16_t row = m / 2;
        int16_t ty = 30 - row;
        volatile uint16_t* p0 = &BG_TEXT1[ (30 - row) * 64 + xL ];
        volatile uint16_t* p1 = &BG_TEXT1[ (31 + row) * 64 + xL ];
        int16_t color_offset = (m / 2) * 4; // 色ごとのオフセット
        int16_t type_offset = ((m % 2) == 0) ? 1 : 3; // 奇数ならlower, 偶数ならboth
        p0[0] = 0x100 + color_offset + type_offset;     // Left
        p0[1] = 0x100 + color_offset + type_offset + 1; // Right
        p1[0] = 0x8200 + color_offset + type_offset;     // Left
        p1[1] = 0x8200 + color_offset + type_offset + 1; // Right
      }
    } else {
      for (int16_t m = meter_value_L0; m > meter_value_L; m--) {
        
        if (m == 0) break; // m=0 (ベースライン) は絶対に消さない
        
        int16_t row = m / 2;
        int16_t ty = 30 - row;
        volatile uint16_t* p0 = &BG_TEXT1[ (30 - row) * 64 + xL ];
        volatile uint16_t* p1 = &BG_TEXT1[ (31 + row) * 64 + xL ];         
        // 消去しようとしている m が現在の値(meter_value_L)と同じ行を共有しているかチェック
        if (row == (meter_value_L / 2)) {
          // 例：m=1(上下段)を消して m=0(下段のみ)にする場合
          int16_t color_offset = row * 4;
          int16_t type_offset = 1; // 下段のみに書き換え
          p0[0] = 0x100 + color_offset + type_offset;
          p0[1] = 0x100 + color_offset + type_offset + 1;
          p1[0] = 0x8200 + color_offset + type_offset;
          p1[1] = 0x8200 + color_offset + type_offset + 1;
        } else {
          // それより上の行なら完全に消してOK
          p0[0] = 0x100;
          p0[1] = 0x100;
          p1[0] = 0x8200;
          p1[1] = 0x8200;
        }
      }
    }
    if (meter_value_R > meter_value_R0) {
      for (int16_t m = meter_value_R0 + 1; m <= meter_value_R; m++) {
        int16_t row = m / 2;
        int16_t ty = 30 - row;
        volatile uint16_t* p0 = &BG_TEXT1[ (30 - row) * 64 + xR ];
        volatile uint16_t* p1 = &BG_TEXT1[ (31 + row) * 64 + xR ];
        int16_t color_offset = (m / 2) * 4; // 色ごとのオフセット
        int16_t type_offset = ((m % 2) == 0) ? 1 : 3; // 奇数ならlower, 偶数ならboth
        p0[0] = 0x100 + color_offset + type_offset;     // Left
        p0[1] = 0x100 + color_offset + type_offset + 1; // Right
        p1[0] = 0x8200 + color_offset + type_offset;     // Left
        p1[1] = 0x8200 + color_offset + type_offset + 1; // Right
      }
    } else {
      for (int16_t m = meter_value_R0; m > meter_value_R; m--) {
        if (m == 0) break; // m=0 (ベースライン) は絶対に消さない
        
        int16_t row = m / 2;
        int16_t ty = 30 - row;
        volatile uint16_t* p0 = &BG_TEXT1[ (30 - row) * 64 + xR ];
        volatile uint16_t* p1 = &BG_TEXT1[ (31 + row) * 64 + xR ];

        // 消去しようとしている m が現在の値(meter_value_R)と同じ行を共有しているかチェック
        if (row == (meter_value_R / 2)) {
          // 例：m=1(上下段)を消して m=0(下段のみ)にする場合
          int16_t color_offset = row * 4;
          int16_t type_offset = 1; // 下段のみに書き換え
          p0[0] = 0x100 + color_offset + type_offset;
          p0[1] = 0x100 + color_offset + type_offset + 1;
          p1[0] = 0x8200 + color_offset + type_offset;
          p1[1] = 0x8200 + color_offset + type_offset + 1;
        } else {
          // それより上の行なら完全に消してOK
          p0[0] = 0x100;
          p0[1] = 0x100;
          p1[0] = 0x8200;
          p1[1] = 0x8200;
        }
      }
    }      
  }
  
  // peak hold 描画
  METER_VALUE* vp = &g_spectrum_stream->meter_peak_values[meter_pos];
  METER_VALUE* vp0 = &g_spectrum_stream->meter_peak_values[meter_pos-1];
  for (int16_t b = 0; b < SPECTRUM_NUM_BANDS; b++) {

    // 現在のピーク位置
    uint8_t meter_value_L = vp->meter_L[b];
    uint8_t meter_value_R = vp->meter_R[b];

    // 前回のピーク位置
    uint8_t meter_value_L0 = vp0->meter_L[b];
    uint8_t meter_value_R0 = vp0->meter_R[b];

    if (meter_value_L != meter_value_L0) {
      int16_t y = PEAK_HOLD_BAR_BASE_YPOS - meter_value_L * 4;
      SP_SCRL[ b * 2 * 4 + 1 ] = y;
    }

    if (meter_value_R != meter_value_R0) {
      int16_t y = PEAK_HOLD_BAR_BASE_YPOS - meter_value_R * 4;
      SP_SCRL[ b * 2 * 4 + 5 ] = y;
    }

  }

  // BG1スクロール
  BG1_SCRL[1] = 511 - (meter_pos / 2) % 512;
}

// スペクトラムディスプレイの初期化と表示位置設定
int32_t spectrum_display_open(SPECTRUM_DISPLAY_HANDLE* handle, SPECTRUM_STREAM_HANDLE* stream, int16_t xpos, int16_t ypos, int16_t mode) {

  int32_t rc = -1;

  if (handle == NULL || stream == NULL) goto exit;

  handle->spectrum_stream = stream;
  handle->meter_display_pos = 0;
  handle->spectrum_mode = mode;
  handle->spectrum_mode_prev = mode;
  handle->base_xpos = xpos;
  handle->base_ypos = ypos;

  g_spectrum_display = handle;
  g_spectrum_stream = stream;

  _iocs_crtmod(14);
  _iocs_g_clr_on();
  
  // スーパーバイザ移行
  uint32_t usp = _iocs_b_super(0);

  // original text palettes
  for (int16_t i = 0; i < 4; i++) {
    original_text_palettes[i] = _iocs_tpalet(i, -1);
  }

  // SP:ON TX:OFF GR:OFF
  *VDC_R2 |= 0x40;                        

  // Priority TX > SP > GR
  *VDC_R1 = (*VDC_R1 & 0xff) | 0x1200;    
  
  // BG0スクロール位置初期化
  BG0_SCRL[0] = 0;
  BG0_SCRL[1] = 48;
  BG1_SCRL[0] = 0;
  BG1_SCRL[1] = 0;

  // スプライト全消去(128枚)
  for (int16_t i = 0; i < 128; i++) {
    SP_SCRL[ i * 4 + 3 ] = 0;               
  }

  // PCG定義(0~60,8x8)
  for (int16_t i = 0; i <= 60; i++) {
    memcpy((void*)PCG + i * 32, (void*)(&bar_patterns[i * 16]), 32);
  }
  
  // PCG定義(96~99,8x8)
  for (int16_t i = 0; i <= 4; i++) {
    memcpy((void*)PCG + 96 * 32 + i * 32, (void*)(&star_patterns[i * 16]), 32);
  }

  // PCG定義(127,16x16)
  for (int16_t i = 0; i <= 0; i++) {
    memcpy((void*)PCG_127 + i * 128, (void*)(&peak_bar_patterns[i * 64]), 128);
  }

  // パレットブロック1,2: アンバー
  int16_t palBaseColorR = 250;
  int16_t palBaseColorG = 155;
  int16_t palBaseColorB = 96;
  for (int16_t i = 0; i < 16; i++) {
    if (i == 0) {
      PAL_BLK1[i] = 0x0000;
    } else {
      int32_t ratio; 
      if (i < 8) {
        // 前半：急速に立ち上げる
        ratio = (i + 4) * 256 / 15; // 底上げしつつ急上昇
      } else {
        // 後半：ほぼ最大輝度で飽和
        ratio = 220 + (i * 2); // 256に近づけていく
      }
      if (ratio > 256) ratio = 256;

      uint16_t r = (palBaseColorR * 31 / 255 * ratio / 256);
      uint16_t g = (palBaseColorG * 31 / 255 * ratio / 256);
      uint16_t b = (palBaseColorB * 31 / 255 * ratio / 256);

      PAL_BLK1[i] = (g << 11) | (r << 6) | (b << 1) | 1;

      ratio *= 0.33;
      if (ratio > 256) ratio = 256;

      r = (palBaseColorR * 31 / 255 * ratio / 256);
      g = (palBaseColorG * 31 / 255 * ratio / 256);
      b = (palBaseColorB * 31 / 255 * ratio / 256);

      PAL_BLK2[i] = (g << 11) | (r << 6) | (b << 1) | 1;

    }
  }

  // パレットブロック3,4: ホワイト
  palBaseColorR = 255;
  palBaseColorG = 255;
  palBaseColorB = 255;
  for (int16_t i = 0; i < 16; i++) {
    if (i == 0) {
      PAL_BLK3[i] = 0x0000;
    } else {
      int32_t ratio = 256 * i / 16;
      if (ratio > 256) ratio = 256;

      uint16_t r = (palBaseColorR * 31 / 255 * ratio / 256);
      uint16_t g = (palBaseColorG * 31 / 255 * ratio / 256);
      uint16_t b = (palBaseColorB * 31 / 255 * ratio / 256);

      PAL_BLK3[i] = (g << 11) | (r << 6) | (b << 1) | 1;

      ratio *= 0.33;
      if (ratio > 256) ratio = 256;

      r = (palBaseColorR * 31 / 255 * ratio / 256);
      g = (palBaseColorG * 31 / 255 * ratio / 256);
      b = (palBaseColorB * 31 / 255 * ratio / 256);

      PAL_BLK4[i] = (g << 11) | (r << 6) | (b << 1) | 1;

    }
  }

  // バンド周波数の表示とピークホールドバー用スプライトの初期化
  WAIT_VSYNC;
  _iocs_tpalet(1, PAL_BLK1[15]);
  uint16_t* TVRAM0 = (uint16_t*)(0xe00000);
  for (int16_t b = 0; b < SPECTRUM_NUM_BANDS; b++) {
    int16_t ofsL = 6 - b;
    int16_t ofsR = 8 + b;
    for (int16_t i = 0; i < 6; i++) {
      int16_t ty = 0x40 * (200 + i);
      TVRAM0[ty + ofsL] = band_labels[b][i];
      TVRAM0[ty + ofsR] = band_labels[b][i];
    }

    SP_SCRL[ b * 2 * 4 + 0 ] = 16 + ofsL * 16;
    SP_SCRL[ b * 2 * 4 + 1 ] = PEAK_HOLD_BAR_BASE_YPOS;
    SP_SCRL[ b * 2 * 4 + 2 ] = 0x100 + 127;
    SP_SCRL[ b * 2 * 4 + 3 ] = 3;

    SP_SCRL[ b * 2 * 4 + 4 ] = 16 + ofsR * 16;
    SP_SCRL[ b * 2 * 4 + 5 ] = PEAK_HOLD_BAR_BASE_YPOS;
    SP_SCRL[ b * 2 * 4 + 6 ] = 0x100 + 127;
    SP_SCRL[ b * 2 * 4 + 7 ] = 3;
  }

  // パレットブロック2: 黄緑
//    for (int16_t i = 15; i >= 0; i--) {
//    PAL_BLK2[i] = ((210 * 32 / 256 * i / 15) << 11) | ((184 * 32 / 256 * i / 15) << 6) | ((0 * 32 / 256 * i / 15) << 1) | 1;
//  }

  // BG TEXT1クリア
  for (int16_t y = 0; y < 64; y++) {
    for (int16_t x = 0; x < 64; x++) {
      BG_TEXT1[ y * 64 + x ] = 0x100 + 0;
    }
  }

  // BG TEXT0は星を散りばめる
  srand(_iocs_ontime().sec);
  for (int16_t y = 0; y < 64; y++) {
    for (int16_t x = 0; x < 64; x++) {
      int32_t r = rand() % 100;
      if (r >= 4) {
        BG_TEXT0[ y * 64 + x ] = 0x300 + 0;
      } else {
        BG_TEXT0[ y * 64 + x ] = 0x300 + 96 + r;        
      }
    }
  }

//  *BG_CTRL = 0x203;   // SP/BG ON, BG0-BGTEXT1, BG0 ON 
//  *BG_CTRL = 0x219;   // SP/BG ON, BG1-BGTEXT1, BG0-BGTEXT0, BG1 ON, BG0 ON 
  *BG_CTRL = 0x20b;   // SP/BG ON, BG1-BGTEXT0, BG0-BGTEXT1, BG1 ON, BG0 ON 

  // 8x8 フォントの初期化
  for (int16_t i = 0; i < 256; i++) {

    // 8x8 regular font
    font_data_8x8[i].xl = 8;
    font_data_8x8[i].yl = 8;
    memcpy(font_data_8x8[i].buffer, FONT_ADDR_8x8 + FONT_BYTES_8x8 * i, FONT_BYTES_8x8);

    // 8x8 bold font
    font_data_8x8_bold[i].xl = 8;
    font_data_8x8_bold[i].yl = 8;
    memcpy(font_data_8x8_bold[i].buffer, FONT_ADDR_8x8 + FONT_BYTES_8x8 * i, FONT_BYTES_8x8);
    for (int16_t j = 0; j < FONT_BYTES_8x8; j++) {
      font_data_8x8_bold[i].buffer[j] |= ( font_data_8x8_bold[i].buffer[j] >> 1 ) & 0xff;
    }

  }

  rc = 0; // success

exit:

  if (usp != 0) _iocs_b_super(usp);

  return rc;
}

// スペクトラムディスプレイのクローズ
void spectrum_display_close(SPECTRUM_DISPLAY_HANDLE* handle) {
  if (handle == NULL) return;
  g_spectrum_display = NULL;
  g_spectrum_stream = NULL;

    // original text palettes
  for (int16_t i = 0; i < 4; i++) {
    _iocs_tpalet(i, original_text_palettes[i]);
  }
}

// スペクトラムメーターの描画開始(一時停止後の再開もここから)
int32_t spectrum_display_start(SPECTRUM_DISPLAY_HANDLE* handle) {
  if (handle == NULL) return -1;
  int32_t rc = _iocs_vdispst((uint8_t*)refresh_spectrum_analyzer, 0, 1);
  if (rc == 0) {
    _iocs_b_bpoke((uint8_t*)0xe88019,0x00);  // stop Timer-A  
    _iocs_b_bpoke((uint8_t*)0xe8801f,0x01);  // set Timer-A counter        
    _iocs_b_bpoke((uint8_t*)0xe88019,0x18);  // restart Timer-A    
  }
  return rc;
}

// スペクトラムメーターの描画停止
void spectrum_display_stop(SPECTRUM_DISPLAY_HANDLE* handle) {
  if (handle == NULL) return;
  _iocs_vdispst(NULL, 0, 0);
}

// スペクトラム表示モードの設定
void spectrum_display_set_mode(SPECTRUM_DISPLAY_HANDLE* handle, int16_t mode) {
  if (handle == NULL) return;
  handle->spectrum_mode = mode & NUM_SPECTRUM_MODES;
}

// スペクトラム表示モードの切り替え（次のモード）
void spectrum_display_next_mode(SPECTRUM_DISPLAY_HANDLE* handle) {
  if (handle == NULL) return;
  handle->spectrum_mode = (handle->spectrum_mode + 1) % NUM_SPECTRUM_MODES;
}

// スペクトラム表示モードの切り替え（前のモード）
void spectrum_display_prev_mode(SPECTRUM_DISPLAY_HANDLE* handle) {
  if (handle == NULL) return;
  handle->spectrum_mode = (handle->spectrum_mode - 1 + NUM_SPECTRUM_MODES) % NUM_SPECTRUM_MODES;
}

// put text in 8x8 font
void spectrum_display_put_text(SPECTRUM_DISPLAY_HANDLE* handle, uint16_t x, uint16_t y, uint16_t color, uint16_t bold, const uint8_t* text) {

  uint32_t usp = _iocs_b_super(0);

  int16_t len = strlen(text);

  for (int16_t i = 0; i < len; i++) {
    struct iocs_fntbuf* font_data = (bold == FONT_BOLD) ? 
                                    &(font_data_8x8_bold[text[i]]) : 
                                    &(font_data_8x8[text[i]]);
    if (color & 0x01) {
      _iocs_tcolor(1);
      _iocs_textput(x + i * 8, y, font_data);
    }
    if (color & 0x02) {
      _iocs_tcolor(2);
      _iocs_textput(x + i * 8, y, font_data);    
    }
  }

  if (usp != 0) _iocs_b_super(usp);
}
