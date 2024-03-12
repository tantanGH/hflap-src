* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"subframe_lpc.c"		
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_subframe_lpc_init	
						
_miniflac_subframe_lpc_init:			
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	clr.l 4(a3)				
						
	clr.w 8(a3)				
						
	clr.b 10(a3)				
						
	pea 128.w				
	clr.l -(sp)				
	pea 12(a3)				
	jbsr _memset				
	lea (12,sp),sp				
						
	clr.l (a3)				
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_miniflac_subframe_lpc_decode	
						
_miniflac_subframe_lpc_decode:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d3			
	move.l 60(sp),a6			
	move.l 68(sp),d4			
	move.l 76(sp),36(sp)			
	move.b 39(sp),40(sp)			
						
	clr.l d5				
	move.b 39(sp),d5			
	cmp.l 4(a4),d5				
	jbls _?L4				
						
	and.l #255,d4				
	lea _miniflac_bitreader_fill,a3		
						
	lea _miniflac_bitreader_read_signed,a5	
	tst.l a6				
	jbeq _?L7				
_?L5:						
						
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L11				
						
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 4(a4),d0				
						
	move.l d1,(a6,d0.l*4)			
						
	move.l 4(a4),d0				
	addq.l #1,d0				
	move.l d0,4(a4)				
						
	clr.l (a4)				
						
	cmp.l d0,d5				
	jbhi _?L5				
_?L9:						
						
	pea 4.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L11				
						
	pea 4.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
	move.b d1,8(a4)				
						
	moveq #1,d0				
	move.l d0,(a4)				
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L41				
_?L11:						
						
	clr.l d0				
_?L3:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L7:						
						
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L11				
						
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 4(a4),d0				
	addq.l #1,d0				
	move.l d0,4(a4)				
						
	clr.l (a4)				
						
	cmp.l d5,d0				
	jbcs _?L7				
	jbra _?L9				
_?L4:						
						
	move.l (a4),d0				
						
	jbeq _?L42				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L43				
						
	subq.l #2,d0				
	jbeq _?L15				
_?L18:						
						
	move.l a6,-(sp)				
	move.l d5,-(sp)				
	move.l 72(sp),-(sp)			
	pea 4(a4)				
	move.l d3,-(sp)				
	move.l 92(sp),-(sp)			
	jbsr _miniflac_residual_decode		
	lea (24,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3				
						
	tst.l a6				
	jbeq _?L3				
						
	cmp.l 64(sp),d5				
	jbcc _?L3				
						
	clr.l d4				
	move.b 9(a4),d4				
	move.l d4,40(sp)			
	clr.l d1				
	move.b 39(sp),d1			
	lsl.l #2,d1				
	lea (a6,d1.l),a0			
	move.l d5,d2				
	add.l #1073741823,d2			
	move.l d2,36(sp)			
	move.l 64(sp),a5			
	add.l #1073741823,a5			
	lea 12(a4,d1.l),a2			
						
	move.w #-32,a3				
	add.l d4,a3				
	moveq #31,d1				
	sub.l d4,d1				
	move.l d1,44(sp)			
_?L22:						
						
	clr.l d1				
	tst.l d5				
	jbeq _?L27				
	lea (12,a4),a1				
	move.l a0,a6				
						
	clr.l d2				
	clr.l d3				
_?L23:						
						
	move.l (a1)+,d4				
						
	move.l -(a6),d1				
	move.l d4,d7				
	muls.l d1,d6:d7				
						
	add.l d7,d3				
	addx.l d6,d2				
						
	cmp.l a2,a1				
	jbne _?L23				
						
	tst.l a3				
	jblt _?L24				
	move.l d2,d1				
	move.l a3,d4				
	asr.l d4,d1				
_?L27:						
						
	move.l (a0),d3				
	smi d2					
	extb.l d2				
						
	add.l d3,d1				
	move.l d1,(a0)+				
						
	addq.l #1,36(sp)			
	cmp.l 36(sp),a5				
	jbne _?L22				
_?L40:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L41:						
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read_signed	
	addq.l #8,sp				
						
	tst.l d0				
	jblt _?L44				
						
	move.b d1,9(a4)				
						
	moveq #2,d2				
	move.l d2,(a4)				
_?L15:						
						
	move.b 40(sp),d2			
	cmp.b 10(a4),d2				
	jbls _?L18				
	lea _miniflac_bitreader_fill,a3		
						
	lea _miniflac_bitreader_read_signed,a5	
_?L19:						
						
	clr.l d0				
	move.b 8(a4),d0				
	move.l d0,-(sp)				
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L11				
						
	clr.l d0				
	move.b 8(a4),d0				
	move.l d0,-(sp)				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b 10(a4),d0			
						
	move.b d0,d2				
	addq.b #1,d2				
	move.b d2,10(a4)			
	and.l #255,d0				
						
	move.l d1,12(a4,d0.l*4)			
						
	cmp.b 40(sp),d2				
	jbcs _?L19				
	jbra _?L18				
_?L24:						
						
	add.l d2,d2				
	move.l 44(sp),d1			
	lsl.l d1,d2				
	move.l d3,d1				
	move.l 40(sp),d4			
	lsr.l d4,d1				
	or.l d2,d1				
						
	move.l (a0),d3				
	smi d2					
	extb.l d2				
						
	add.l d3,d1				
	move.l d1,(a0)+				
						
	addq.l #1,36(sp)			
	cmp.l 36(sp),a5				
	jbne _?L22				
	jbra _?L40				
_?L44:						
						
	clr.l d1				
						
	move.b d1,9(a4)				
						
	moveq #2,d2				
	move.l d2,(a4)				
	jbra _?L15				
_?L42:						
	lea _miniflac_bitreader_fill,a3		
	jbra _?L9				
_?L43:						
	lea _miniflac_bitreader_fill,a3		
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L11				
	jbra _?L41				
						
						
