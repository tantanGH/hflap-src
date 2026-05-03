#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <x68k/iocs.h>

#ifdef __USE_PICOJPEG__
#include "picojpeg.h"
#endif

#include "jpeg.h"

#define CRTC_R00    ((volatile uint16_t *)0xE80000) // CRTC R00-R08 (Inside X68000 p232)
#define CRTC_R12    ((volatile uint16_t *)0xE80018) // CRTC R12 for scroll (Insite X68000 p197)
#define CRTC_R20    ((volatile uint16_t *)0xE80028) // CRTC R20 (Inside X68000 p234)
#define VDC_R0      ((volatile uint16_t*)0xE82400) // video controller (Inside X68000 p234) *R1 = p188
#define VDC_R2      ((volatile uint16_t*)0xE82600) // video controller (Inside X68000 p210)
#define PALETTE_REG ((volatile uint16_t*)0xE82000) // graphic palette (Inside X68000 p218)

#ifndef GPIP
#define GPIP ((volatile uint8_t*)0xE88001) // generic I/O port (Inside X68000 p81)
#endif

#ifndef WAIT_VDISP
#define WAIT_VDISP while (!(GPIP[0] & 0x10))
#define WAIT_VBLANK while (GPIP[0] & 0x10)
#endif

#define GVRAM ((uint16_t *)0xC00000)
#define MIN(x, y) ((x) < (y) ? (x) : (y))
#define MAX(x, y) ((x) > (y) ? (x) : (y))

//
//  Set CRTC to 768x512, 65536-color mode
//
void jpeg_crtmod_768x512_65536() {

  _iocs_g_clr_on();

  // Enter supervisor mode (return -1 if already in supervisor)
  int32_t usp = _iocs_b_super(0);

  // Wait for VSync
  WAIT_VDISP;
  WAIT_VBLANK;

  // Set CRTC screen parameters (768x512, 31kHz)
  // This is the maximum resolution, so we can always apply these settings in
  // this order.
  CRTC_R00[0] = 0x0089;
  CRTC_R00[1] = 0x000e;
  CRTC_R00[2] = 0x001c;
  CRTC_R00[3] = 0x007c;
  CRTC_R00[4] = 0x0237;
  CRTC_R00[5] = 0x0005;
  CRTC_R00[6] = 0x0028;
  CRTC_R00[7] = 0x0228;
  CRTC_R00[8] = 0x001b;

  // Configure CRTC memory and display mode
  CRTC_R20[0] = 0x0316; // memory mode 3
  VDC_R0[0] = 0x0003;   // memory mode 3
  VDC_R2[0] = 0x002f;   // sprite off, text on, graphic on (512x512)
  CRTC_R12[0] = 0;      // scroll position X
  CRTC_R12[1] = 0;      // scroll position Y
  CRTC_R12[2] = 0;      // scroll position X
  CRTC_R12[3] = 0;      // scroll position Y
  CRTC_R12[4] = 0;      // scroll position X
  CRTC_R12[5] = 0;      // scroll position Y
  CRTC_R12[6] = 0;      // scroll position X
  CRTC_R12[7] = 0;      // scroll position Y

  // Initialize palette registers
  int32_t ofs = 0;
  for (int32_t i = 0x0001; i <= 0x10000; i += 0x0202) {
    PALETTE_REG[ofs++] = (uint16_t)i;
    PALETTE_REG[ofs++] = (uint16_t)i;
  }

  // Return to user mode if necessary
  if (usp >= 0) _iocs_b_super(usp);
}

//
//  Mask the graphic screen to hide artifacts during JPEG decompression.
//  This uses Text Plane 2 as an opaque fill layer.
//
void jpeg_fill_text_masks() {

  // Set Palette 4 to color code 0x0001 (0b00000_00000_00000_1 = Luminance bit
  // only) to create an opaque black for the mask.
  _iocs_tpalet2(4, 0x0001);

  // Sync Palettes 5-7 with Palettes 1-3 to ensure the display remains
  // consistent when Plane 2 is active.
  _iocs_tpalet2(5, _iocs_tpalet2(1, -1));
  _iocs_tpalet2(6, _iocs_tpalet2(2, -1));
  _iocs_tpalet2(7, _iocs_tpalet2(3, -1));

  // Fill the entire screen using Text Plane 2.
  struct iocs_txfillptr txfil = {2, 0, 0, 768, 512, 0xffff};
  _iocs_txfill(&txfil);
}

//
//  When displaying 512x512 (64k colors) on a 768x512 screen, wrapping occurs.
//  To prevent this, adjust the horizontal scroll and clear the text mask
//  only for the center 512x512 area.
//
void jpeg_open_text_masks() {

  // Adjust horizontal scroll positions for all graphic planes.
  _iocs_scroll(0, 512 - 128, 0);
  _iocs_scroll(1, 512 - 128, 0);
  _iocs_scroll(2, 512 - 128, 0);
  _iocs_scroll(3, 512 - 128, 0);

  // Clear the center area of Text Plane 2.
  // The left and right margins remain masked with color code 0x0001
  // (near-black).
  struct iocs_txfillptr txfil = { 2, 128, 0, 512, 512, 0x0000 };
  _iocs_txfill(&txfil);
}

//
//  Reset text masks to the original state
//
void jpeg_reset_text_masks() {

    // Reset horizontal scroll positions for all graphic planes.
    _iocs_scroll(0, 0, 0);
    _iocs_scroll(1, 0, 0);
    _iocs_scroll(2, 0, 0);
    _iocs_scroll(3, 0, 0);

    // Clear full text plane 2
    struct iocs_txfillptr txfil = { 2, 0, 0, 768, 512, 0x0000 };
    _iocs_txfill(&txfil);

    // Reset text pallets
    _iocs_tpalet2(4,-2);
    _iocs_tpalet2(5,-2);
    _iocs_tpalet2(6,-2);
    _iocs_tpalet2(7,-2);

}

//
//  Workaround for a known bug in m68k-newlib's memcpy.
//  Large transfers (>32KB) to non-long word boundary address can fail
//
static inline void safe_memcpy(void *dst, const void *src, size_t len) {
  uint8_t *d = (uint8_t *)dst;
  const uint8_t *s = (const uint8_t *)src;
  while (len > 0) {
    // Chunk the transfer into safe 32KB blocks
    size_t chunk = (len > 0x8000) ? 0x8000 : len;
    memcpy(d, s, chunk);
    d += chunk;
    s += chunk;
    len -= chunk;
  }
}

//
//  Data fetch callback for the picojpeg library.
//  Provides JPEG data from an in-memory buffer.
//
static uint8_t pjpeg_need_bytes_callback(uint8_t *pBuf, uint8_t buf_size,
                                         uint8_t *pBytes_actually_read,
                                         void *pCallback_data) {

  uint32_t *jpeg_buffer_meta = (uint32_t *)pCallback_data;
  uint8_t *jpeg_buffer = (uint8_t *)(jpeg_buffer_meta[0]);
  uint32_t jpeg_buffer_bytes = jpeg_buffer_meta[1];
  uint32_t jpeg_buffer_ofs = jpeg_buffer_meta[2];

  uint32_t remain = jpeg_buffer_bytes - jpeg_buffer_ofs;
  uint32_t n = (buf_size < remain) ? buf_size : remain;

  if (n > 0) {
    safe_memcpy(pBuf, jpeg_buffer + jpeg_buffer_ofs, n);
  }

  *pBytes_actually_read = (unsigned char)n;
  jpeg_buffer_meta[2] += n;

  return 0;
}

//
//  Initializes the JPEG handler state.
//  No dynamic memory allocation occurs; the caller provides the JPEG structure.
//
int32_t jpeg_open(JPEG *jpeg, int16_t brightness) {

  int32_t rc = -1;

  // Reset the initialization flag for the Color Look-Up Table (LUT)
  jpeg->color_table_initialized = 0;

  // Validate brightness range (0-100%)
  if (brightness < 0 || brightness > 100) {
    goto exit;
  }
  jpeg->brightness = brightness;

  rc = 0;

exit:
  return rc;
}

//
//  Closes the JPEG handler.
//  Currently, no cleanup is required as no heap memory is allocated.
//
void jpeg_close(JPEG *jpeg) {
  // Placeholder for future-proofing
}

//
//  Pre-calculates RGB555 color lookup tables (LUT) with brightness scaling.
//  Format for X68000 (Mode 3): GGGGG RRRRR BBBBB L (5 bits each + 1-bit
//  Luminance)
//
static void init_color_lookup_tables(JPEG *jpeg) {

  for (int16_t i = 0; i < 256; i++) {
    // Apply brightness scaling to the 8-bit color component
    // Note: (i * 32 * brightness / 100) >> 8 effectively scales the 0-255 value
    // to 0-31.
    uint32_t c = (uint32_t)(i * 32 * jpeg->brightness / 100) >> 8;

    // Construct the 16-bit color code.
    // The '+ 1' sets the Luminance bit to 1, ensuring the pixel is opaque.
    jpeg->rgb555_r[i] = (uint16_t)((c << 6) + 1);
    jpeg->rgb555_g[i] = (uint16_t)((c << 11) + 1);
    jpeg->rgb555_b[i] = (uint16_t)((c << 1) + 1);
  }

  jpeg->color_table_initialized = 1; // Mark LUT as ready
}

#ifdef __USE_PICOJPEG__
//
//  Render the JPEG with DDA scaling
//
static int32_t jpeg_render_scaled(JPEG *jpeg, pjpeg_image_info_t *image_info,
                                  uint32_t step_fp, int32_t ofs_x,
                                  int32_t ofs_y) {

  int32_t mcu_y = 0;
  int32_t mcu_x = 0;

  // Fixed-point source coordinates (16.16)
  // These track where we are in the original image
  uint32_t src_y_fp = 0;

  // Calculate how many destination pixels we can actually draw (clipping to
  // 512x512)
  int32_t start_gy = MAX(0, ofs_y);
  int32_t end_gy = MIN(511, ofs_y + ((image_info->m_height << 16) / step_fp));

  // For simplicity in this logic, we iterate over MCUs and
  // only draw pixels that map to the current MCU.
  for (;;) {
    uint8_t status = pjpeg_decode_mcu();
    if (status == PJPG_NO_MORE_BLOCKS)
      break;
    if (status != 0)
      return status;

    // Current MCU's boundary in original coordinates
    int32_t mcu_top = mcu_y * image_info->m_MCUHeight;
    int32_t mcu_left = mcu_x * image_info->m_MCUWidth;
    int32_t mcu_bottom = mcu_top + image_info->m_MCUHeight;
    int32_t mcu_right = mcu_left + image_info->m_MCUWidth;

    // Iterate through each 8x8 block within the MCU
    for (int32_t y = 0; y < image_info->m_MCUHeight; y += 8) {
      for (int32_t x = 0; x < image_info->m_MCUWidth; x += 8) {

        // Pointers to the 8x8 block in the picojpeg MCU buffer
        uint8_t src_block_ofs = (x * 8U) + (y * 16U);
        const uint8_t *pSrcR = image_info->m_pMCUBufR + src_block_ofs;
        const uint8_t *pSrcG = image_info->m_pMCUBufG + src_block_ofs;
        const uint8_t *pSrcB = image_info->m_pMCUBufB + src_block_ofs;

        // --- DDA Pixel Mapping Logic ---
        // In a true DDA, we should iterate over destination pixels (gy, gx)
        // and sample from the source. Since pjpeg gives us MCUs, we do the
        // reverse: Check which destination pixels fall into this 8x8 block.

        for (int32_t by = 0; by < 8; by++) {
          int32_t cur_src_y = mcu_top + y + by;
          if (cur_src_y >= image_info->m_height)
            break;

          // Calculate destination Y: (SourceY * 65536 / step_fp) + Offset
          int32_t gy = ofs_y + (int32_t)(((uint64_t)cur_src_y << 16) / step_fp);
          if (gy < 0 || gy > 511)
            continue;

          // Only process this row if it's the "first" source row to map to this
          // gy (Simple nearest-neighbor downsampling)
          int32_t prev_gy =
              ofs_y + (int32_t)(((uint64_t)(cur_src_y - 1) << 16) / step_fp);
          if (cur_src_y > 0 && gy == prev_gy)
            continue;

          uint16_t *vram_line = (uint16_t *)(GVRAM + (gy << 9));

          for (int32_t bx = 0; bx < 8; bx++) {
            int32_t cur_src_x = mcu_left + x + bx;
            if (cur_src_x >= image_info->m_width)
              break;

            int32_t gx =
                ofs_x + (int32_t)(((uint64_t)cur_src_x << 16) / step_fp);
            if (gx < 0 || gx > 511)
              continue;

            int32_t prev_gx =
                ofs_x + (int32_t)(((uint64_t)(cur_src_x - 1) << 16) / step_fp);
            if (cur_src_x > 0 && gx == prev_gx)
              continue;

            // Combined color from LUT
            uint8_t r = pSrcR[bx + by * 8];
            uint8_t g = pSrcG[bx + by * 8];
            uint8_t b = pSrcB[bx + by * 8];
            vram_line[gx] =
                jpeg->rgb555_g[g] | jpeg->rgb555_r[r] | jpeg->rgb555_b[b] | 1;
          }
        }
      }
    }

    if (++mcu_x == image_info->m_MCUSPerRow) {
      mcu_x = 0;
      mcu_y++;
    }
  }
  return 0;
}

/**
 * @brief Decodes and draws a JPEG image from memory to GVRAM.
 * * @param jpeg        Pointer to the initialized JPEG structure.
 * @param buffer      Pointer to the raw JPEG data (in-memory).
 * @param size        Size of the JPEG data in bytes.
 * @param scale_mode  Scaling: 0 for Auto-Fit, 1-100 for percentage scale.
 * @return 0 on success, or a negative error code on failure.
 */
int32_t jpeg_draw(JPEG *jpeg, uint8_t *buffer, size_t size,
                  int16_t scale_mode) {

  int32_t rc = -1;
  pjpeg_image_info_t image_info = {0};

  // Setup the data source for the internal callback
  uint32_t jpeg_buffer_meta[3];
  jpeg_buffer_meta[0] = (uint32_t)buffer;
  jpeg_buffer_meta[1] = (uint32_t)size;
  jpeg_buffer_meta[2] = 0; // Initialize offset

  // Initialize the decoder (Hiding picojpeg specifics here)
  rc = pjpeg_decode_init(&image_info, pjpeg_need_bytes_callback,
                         jpeg_buffer_meta, 0);
  if (rc != 0) {
    return rc; // Return picojpeg error code directly
  }

  // Ensure the Color Look-Up Table (LUT) is ready
  if (!jpeg->color_table_initialized) {
    init_color_lookup_tables(jpeg);
  }

  // Calculate scaling parameters (DDA steps and offsets)
  uint32_t step_fp;
  if (scale_mode <= 0) {

    // Auto-Fit Logic
    int32_t max_side = (image_info.m_width > image_info.m_height) 
                        ? image_info.m_width : image_info.m_height;

    if (max_side > 512) {
      step_fp = (max_side << 16) / 512;
    } else {
      step_fp = 1L << 16;
    }
    
  } else {
    // Percentage: Convert 1-100% to a fixed-point step
    // (e.g., 50% means we step 2.0 source pixels for every 1 destination pixel)
    step_fp = (100L << 16) / scale_mode;
  }

  // Calculate centered display dimensions
  int32_t draw_w = (image_info.m_width << 16) / step_fp;
  int32_t draw_h = (image_info.m_height << 16) / step_fp;
  int32_t ofs_x = (512 - draw_w) / 2;
  int32_t ofs_y = (512 - draw_h) / 2;

  // Enter supervisor mode (return -1 if already in supervisor)
  int32_t usp = _iocs_b_super(0);

  // Execute the rendering loop
  rc = jpeg_render_scaled(jpeg, &image_info, step_fp, ofs_x, ofs_y);

  // Return to user mode if necessary
  if (usp >= 0) _iocs_b_super(usp);

  return rc;
}
#endif

#ifdef __USE_STB_IMAGE__

#define STBI_NO_THREAD_LOCALS
#define STBI_NO_STDIO          // FILE* 関連を無効化
#define STBI_NO_SIMD           // m68kにはないので無効化
#define STBI_ONLY_JPEG
#define STB_IMAGE_IMPLEMENTATION

#include <himem.h>
#define STBI_MALLOC     himem_malloc
#define STBI_REALLOC    himem_realloc
#define STBI_FREE       himem_free 

#include "stb_image.h"

int32_t jpeg_draw(JPEG *jpeg, uint8_t *buffer, size_t size, int16_t scale_mode) {
    int w, h, channels;
    
    // 1. デコード（RGB 24bit形式で一括展開）
    // stbi_load_from_memory は内部で malloc を使うので、
    // 事前に十分なメインメモリを確保しておくことが前提です。
    uint8_t *img_data = stbi_load_from_memory(buffer, (int)size, &w, &h, &channels, 3);
    if (!img_data) {
        const char *reason = stbi_failure_reason();
        printf("JPEG Error: %s\n", reason); // これで「unsupported format」か「out of memory」かわかる
        return -1;
    }

    // 2. スケーリングパラメータの計算 (以前のロジックを流用)
    uint32_t step_fp;
    if (scale_mode <= 0) {
        int max_side = (w > h) ? w : h;
        step_fp = (max_side > 512) ? (max_side << 16) / 512 : (1L << 16);
    } else {
        step_fp = (100L << 16) / scale_mode;
    }

    int draw_w = ((uint32_t)w << 16) / step_fp;
    int draw_h = ((uint32_t)h << 16) / step_fp;
    int ofs_x = (512 - draw_w) / 2;
    int ofs_y = (512 - draw_h) / 2;

    if (!jpeg->color_table_initialized) init_color_lookup_tables(jpeg);

    // 3. VRAMへの転送（DDAスケーリング）
    int32_t usp = _iocs_b_super(0);

    for (int gy = 0; gy < draw_h; gy++) {
        int target_y = gy + ofs_y;
        if (target_y < 0 || target_y > 511) continue;

        uint16_t *vram_line = (uint16_t *)(GVRAM + (target_y << 9));
        
        // ソースの参照行を計算 (Fixed Point)
        uint32_t src_y = ((uint32_t)gy * step_fp) >> 16;
        if (src_y >= h) break;
        uint8_t *src_row = img_data + (src_y * w * 3);

        for (int gx = 0; gx < draw_w; gx++) {
            int target_x = gx + ofs_x;
            if (target_x < 0 || target_x > 511) continue;

            uint32_t src_x = ((uint32_t)gx * step_fp) >> 16;
            if (src_x >= w) break;

            uint8_t *p = src_row + (src_x * 3);
            vram_line[target_x] = jpeg->rgb555_r[p[0]] | 
                                  jpeg->rgb555_g[p[1]] | 
                                  jpeg->rgb555_b[p[2]] | 1;
        }
    }

    if (usp >= 0) _iocs_b_super(usp);

    // 4. 解放
    stbi_image_free(img_data);
    return 0;
}

#endif