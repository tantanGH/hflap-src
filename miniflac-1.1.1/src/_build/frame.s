* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"frame.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_frame_init		
						
_miniflac_frame_init:				
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	clr.w 6(a3)				
						
	clr.b 4(a3)				
						
	clr.l (a3)				
						
	pea 12(a3)				
	jbsr _miniflac_frame_header_init	
	addq.l #4,sp				
						
	lea (42,a3),a3				
	move.l a3,8(sp)				
						
	move.l (sp)+,a3				
						
	jbra _miniflac_subframe_init		
						
	.data					
_?LC0:						
	.dc.b $66,$72,$61,$6d,$65,$2e,$63
	.dc.b $00				
_?LC1:						
	.dc.b $66,$72,$61,$6d,$65,$2d,$3e,$73
	.dc.b $74,$61,$74,$65,$20,$3d,$3d,$20
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52
	.dc.b $00				
_?LC2:						
	.dc.b $41,$73,$73,$65,$72,$74,$69,$6f
	.dc.b $6e,$20,$66,$61,$69,$6c,$65,$64
	.dc.b $3a,$20,$25,$73,$2c,$20,$66,$69
	.dc.b $6c,$65,$20,$25,$73,$2c,$20,$6c
	.dc.b $69,$6e,$65,$20,$25,$64,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_frame_sync		
						
_miniflac_frame_sync:				
	subq.l #4,sp				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	tst.l (a3)				
	jbne _?L12				
						
	move.l 16(sp),-(sp)			
	pea 12(a3)				
	jbsr _miniflac_frame_header_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3				
						
	tst.l 18(a3)				
	jbne _?L6				
						
	move.l 20(sp),a0			
	move.l 6(a0),d1				
						
	jbeq _?L8				
						
	move.l d1,18(a3)			
_?L6:						
						
	tst.b 27(a3)				
	jbne _?L7				
						
	move.l 20(sp),a0			
	move.b 10(a0),d1			
						
	jbeq _?L9				
						
	move.b d1,27(a3)			
_?L7:						
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.b 4(a3)				
						
	pea 42(a3)				
	move.l d0,8(sp)				
	jbsr _miniflac_subframe_init		
	addq.l #4,sp				
						
	move.l 4(sp),d0				
_?L3:						
						
	move.l (sp)+,a3				
	addq.l #4,sp				
	rts					
_?L9:						
						
	moveq #-9,d0				
						
	move.l (sp)+,a3				
	addq.l #4,sp				
	rts					
_?L8:						
						
	moveq #-8,d0				
						
	move.l (sp)+,a3				
	addq.l #4,sp				
	rts					
_?L12:						
						
	pea 25.w				
	pea _?LC0				
	pea _?LC1				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.data					
_?LC3:						
	.dc.b $62,$72,$2d,$3e,$62,$69,$74,$73
	.dc.b $20,$3d,$3d,$20,$30
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_frame_decode		
						
_miniflac_frame_decode:				
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a3			
	move.l 56(sp),a4			
	move.l 64(sp),a6			
						
	move.l (a3),d0				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L14				
	moveq #2,d4				
	cmp.l d0,d4				
	jbeq _?L15				
	tst.l d0				
	jbeq _?L71				
	moveq #-1,d0				
_?L13:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L75:						
						
	cmp.b #1,d0				
	jbeq _?L64				
_?L27:						
						
	move.l d1,-(sp)				
	clr.l d1				
	move.w 16(a3),d1			
	move.l d1,-(sp)				
						
	and.l #255,d0				
	lsl.l #2,d0				
						
	move.l (a6,d0.l),-(sp)			
	move.l a4,-(sp)				
	move.l a5,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	lea (20,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L13				
						
	move.l a5,-(sp)				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #4,sp				
						
	move.b 4(a3),d0				
	addq.b #1,d0				
	move.b d0,4(a3)				
						
	cmp.b 26(a3),d0				
	jbcs _?L20				
_?L29:						
						
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_align		
	addq.l #4,sp				
						
	move.w 10(a4),6(a3)			
						
	moveq #2,d1				
	move.l d1,(a3)				
_?L15:						
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L45				
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.w 6(a3),d1				
	jbne _?L46				
						
	move.l 24(a4),8(a3)			
						
	tst.l a6				
	jbeq _?L31				
						
	move.l 22(a3),d0			
	moveq #2,d1				
	cmp.l d0,d1				
	jbeq _?L32				
	moveq #3,d4				
	cmp.l d0,d4				
	jbeq _?L33				
	subq.l #1,d0				
	jbeq _?L72				
_?L31:						
						
	tst.b 8(a4)				
	jbne _?L73				
						
	clr.b 9(a4)				
						
	clr.w 10(a4)				
						
	clr.b 4(a3)				
						
	clr.l (a3)				
						
	pea 42(a3)				
	jbsr _miniflac_subframe_init		
	addq.l #4,sp				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L71:						
						
	move.l a4,-(sp)				
	pea 12(a3)				
	jbsr _miniflac_frame_header_decode	
	addq.l #8,sp				
						
	moveq #1,d5				
	cmp.l d0,d5				
	jbne _?L13				
						
	tst.l 18(a3)				
	jbne _?L17				
						
	move.l 60(sp),a0			
	move.l 6(a0),d0				
						
	jbeq _?L43				
						
	move.l d0,18(a3)			
_?L17:						
						
	tst.b 27(a3)				
	jbne _?L18				
						
	move.l 60(sp),a0			
	move.b 10(a0),d0			
						
	jbeq _?L44				
						
	move.b d0,27(a3)			
_?L18:						
						
	moveq #1,d0				
	move.l d0,(a3)				
						
	clr.b 4(a3)				
						
	pea 42(a3)				
	jbsr _miniflac_subframe_init		
	addq.l #4,sp				
_?L14:						
						
	move.b 4(a3),d0				
						
	cmp.b 26(a3),d0				
	jbcc _?L29				
						
	lea (42,a3),a5				
	move.l #_miniflac_subframe_decode,d3	
						
	move.l #_miniflac_subframe_init,d6	
	tst.l a6				
	jbeq _?L74				
_?L20:						
						
	clr.l d1				
	move.b 27(a3),d1			
						
	move.l 22(a3),d2			
						
	moveq #-3,d7				
	and.l d2,d7				
	subq.l #1,d7				
	jbeq _?L75				
						
	subq.l #2,d2				
	jbne _?L27				
						
	tst.b d0				
	jbne _?L27				
_?L64:						
						
	addq.l #1,d1				
	move.l d1,44(sp)			
	moveq #0,d1				
	not.b d1				
	and.l 44(sp),d1				
	jbra _?L27				
_?L45:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L74:						
						
	move.l d6,d4				
						
	clr.l d1				
	move.b 27(a3),d1			
						
	move.l 22(a3),d2			
						
	moveq #-3,d7				
	and.l d2,d7				
	subq.l #1,d7				
	jbeq _?L21				
_?L77:						
						
	subq.l #2,d2				
	jbeq _?L76				
_?L22:						
						
	move.l d1,-(sp)				
	clr.l d0				
	move.w 16(a3),d0			
	move.l d0,-(sp)				
	clr.l -(sp)				
	move.l a4,-(sp)				
	move.l a5,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	lea (20,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L13				
						
	move.l a5,-(sp)				
	move.l d4,a0				
	jbsr (a0)				
	addq.l #4,sp				
						
	move.b 4(a3),d0				
	addq.b #1,d0				
	move.b d0,4(a3)				
						
	cmp.b 26(a3),d0				
	jbcc _?L29				
						
	clr.l d1				
	move.b 27(a3),d1			
						
	move.l 22(a3),d2			
						
	moveq #-3,d7				
	and.l d2,d7				
	subq.l #1,d7				
	jbne _?L77				
_?L21:						
						
	cmp.b #1,d0				
	jbne _?L22				
						
	addq.l #1,d1				
	move.l d1,44(sp)			
	moveq #0,d1				
	not.b d1				
	and.l 44(sp),d1				
	jbra _?L22				
_?L76:						
						
	tst.b d0				
	jbne _?L22				
						
	addq.l #1,d1				
	move.l d1,44(sp)			
	moveq #0,d1				
	not.b d1				
	and.l 44(sp),d1				
	jbra _?L22				
_?L72:						
						
	move.w 16(a3),d0			
						
	jbeq _?L31				
	move.l (a6),a0				
	move.l 4(a6),a1				
	and.l #65535,d0				
	lsl.l #2,d0				
	add.l a0,d0				
_?L38:						
						
	move.l (a0)+,d6				
	sub.l (a1),d6				
	move.l d6,(a1)+				
						
	cmp.l a0,d0				
	jbeq _?L31				
						
	move.l (a0)+,d6				
	sub.l (a1),d6				
	move.l d6,(a1)+				
						
	cmp.l a0,d0				
	jbne _?L38				
	jbra _?L31				
_?L33:						
						
	move.w 16(a3),d0			
						
	jbeq _?L31				
	move.l (a6),a0				
	move.l 4(a6),a1				
	and.l #65535,d0				
	lsl.l #2,d0				
	lea (a0,d0.l),a2			
_?L40:						
						
	move.l (a1),d6				
						
	move.l d6,d3				
	smi d2					
	extb.l d2				
						
	move.l (a0),d1				
	smi d0					
	extb.l d0				
						
	add.l d1,d1				
	addx.l d0,d0				
						
	moveq #1,d4				
	and.l d6,d4				
	move.l d4,d7				
	smi d6					
	extb.l d6				
						
	move.l d6,d5				
	or.l d0,d5				
	move.l d5,36(sp)			
	or.l d1,d4				
	move.l d4,40(sp)			
						
	move.l 36(sp),d0			
	move.l 40(sp),d1			
	add.l d3,d1				
	addx.l d2,d0				
						
	lsr.l #1,d0				
	roxr.l #1,d1				
						
	move.l d1,(a0)+				
						
	move.l 36(sp),d0			
	move.l 40(sp),d1			
	sub.l d3,d1				
	subx.l d2,d0				
						
	lsr.l #1,d0				
	roxr.l #1,d1				
						
	move.l d1,(a1)+				
						
	cmp.l a2,a0				
	jbeq _?L31				
						
	move.l (a1),d6				
						
	move.l d6,d3				
	smi d2					
	extb.l d2				
						
	move.l (a0),d1				
	smi d0					
	extb.l d0				
						
	add.l d1,d1				
	addx.l d0,d0				
						
	moveq #1,d4				
	and.l d6,d4				
	move.l d4,d7				
	smi d6					
	extb.l d6				
						
	move.l d6,d5				
	or.l d0,d5				
	move.l d5,36(sp)			
	or.l d1,d4				
	move.l d4,40(sp)			
						
	move.l 36(sp),d0			
	move.l 40(sp),d1			
	add.l d3,d1				
	addx.l d2,d0				
						
	lsr.l #1,d0				
	roxr.l #1,d1				
						
	move.l d1,(a0)+				
						
	move.l 36(sp),d0			
	move.l 40(sp),d1			
	sub.l d3,d1				
	subx.l d2,d0				
						
	lsr.l #1,d0				
	roxr.l #1,d1				
						
	move.l d1,(a1)+				
						
	cmp.l a2,a0				
	jbne _?L40				
	jbra _?L31				
_?L32:						
						
	move.w 16(a3),d0			
						
	jbeq _?L31				
	move.l (a6),a0				
	move.l 4(a6),a1				
	and.l #65535,d0				
	lsl.l #2,d0				
	add.l a0,d0				
_?L39:						
						
	move.l (a0),d1				
	add.l (a1)+,d1				
	move.l d1,(a0)+				
						
	cmp.l d0,a0				
	jbeq _?L31				
						
	move.l (a0),d1				
	add.l (a1)+,d1				
	move.l d1,(a0)+				
						
	cmp.l d0,a0				
	jbne _?L39				
	jbra _?L31				
_?L46:						
						
	moveq #-3,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L44:						
						
	moveq #-9,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L43:						
						
	moveq #-8,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L73:						
						
	pea 123.w				
	pea _?LC0				
	pea _?LC3				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
						
