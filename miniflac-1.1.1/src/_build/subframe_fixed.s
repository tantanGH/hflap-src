* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"subframe_fixed.c"		
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_subframe_fixed_init	
						
_miniflac_subframe_fixed_init:			
	move.l 4(sp),a0				
						
	clr.l 4(a0)				
						
	clr.l (a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_subframe_fixed_decode	
						
_miniflac_subframe_fixed_decode:		
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 40(sp),a3			
	move.l 44(sp),d4			
	move.l 48(sp),a4			
	move.l 52(sp),d6			
	move.l 56(sp),d3			
	move.l 64(sp),d5			
	move.b d5,d7				
						
	and.l #255,d5				
	cmp.l 4(a3),d5				
	jbls _?L12				
						
	and.l #255,d3				
	lea _miniflac_bitreader_fill,a5		
						
	lea _miniflac_bitreader_read_signed,a6	
	tst.l a4				
	jbeq _?L41				
_?L7:						
						
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L8				
						
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
						
	move.l d1,(a4,d0.l*4)			
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	cmp.l d0,d5				
	jbhi _?L7				
_?L12:						
						
	move.l a4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	pea 4(a3)				
	move.l d4,-(sp)				
	move.l 80(sp),-(sp)			
	jbsr _miniflac_residual_decode		
	lea (24,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L42				
_?L3:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L41:						
						
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L8				
_?L43:						
						
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	cmp.l d5,d0				
	jbcc _?L12				
						
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L43				
_?L8:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L42:						
						
	tst.l a4				
	jbeq _?L3				
						
	cmp.b #3,d7				
	jbeq _?L15				
	jbhi _?L16				
	cmp.b #1,d7				
	jbeq _?L17				
	cmp.b #2,d7				
	jbne _?L3				
						
	moveq #2,d1				
	move.l d1,4(a3)				
						
	cmp.l d6,d1				
	jbcc _?L3				
_?L22:						
						
	lsl.l #2,d1				
						
	move.l (a4,d1.l),a0			
	sub.l -8(a4,d1.l),a0			
						
	move.l -4(a4,d1.l),d3			
	smi d2					
	extb.l d2				
	add.l d3,d3				
	addx.l d2,d2				
						
	add.l d3,a0				
	move.l a0,(a4,d1.l)			
						
	move.l 4(a3),d1				
	addq.l #1,d1				
	move.l d1,4(a3)				
						
	cmp.l d1,d6				
	jbls _?L3				
						
	lsl.l #2,d1				
						
	move.l (a4,d1.l),a0			
	sub.l -8(a4,d1.l),a0			
						
	move.l -4(a4,d1.l),d3			
	smi d2					
	extb.l d2				
	add.l d3,d3				
	addx.l d2,d2				
						
	add.l d3,a0				
	move.l a0,(a4,d1.l)			
						
	move.l 4(a3),d1				
	addq.l #1,d1				
	move.l d1,4(a3)				
						
	cmp.l d1,d6				
	jbhi _?L22				
	jbra _?L3				
_?L16:						
						
	cmp.b #4,d7				
	jbne _?L3				
						
	moveq #4,d1				
	move.l d1,4(a3)				
						
	cmp.l d6,d1				
	jbcc _?L3				
_?L24:						
						
	lsl.l #2,d1				
	lea (a4,d1.l),a0			
						
	move.l (a0),a1				
	sub.l -16(a4,d1.l),a1			
						
	move.l -4(a4,d1.l),d3			
	smi d2					
	extb.l d2				
	add.l d3,d3				
	addx.l d2,d2				
	add.l d3,d3				
	addx.l d2,d2				
						
	add.l d3,a1				
						
	move.l -12(a4,d1.l),d3			
	smi d2					
	extb.l d2				
	add.l d3,d3				
	addx.l d2,d2				
	add.l d3,d3				
	addx.l d2,d2				
						
	add.l d3,a1				
						
	move.l -8(a4,d1.l),d5			
	smi d4					
	extb.l d4				
	move.l d4,d2				
	move.l d5,d3				
	add.l d3,d3				
	addx.l d2,d2				
	add.l d5,d3				
	addx.l d4,d2				
	add.l d3,d3				
	addx.l d2,d2				
						
	sub.l d3,a1				
	move.l a1,(a0)				
						
	move.l 4(a3),d1				
	addq.l #1,d1				
	move.l d1,4(a3)				
						
	cmp.l d1,d6				
	jbls _?L3				
						
	lsl.l #2,d1				
	lea (a4,d1.l),a0			
						
	move.l (a0),a1				
	sub.l -16(a4,d1.l),a1			
						
	move.l -4(a4,d1.l),d3			
	smi d2					
	extb.l d2				
	add.l d3,d3				
	addx.l d2,d2				
	add.l d3,d3				
	addx.l d2,d2				
						
	add.l d3,a1				
						
	move.l -12(a4,d1.l),d3			
	smi d2					
	extb.l d2				
	add.l d3,d3				
	addx.l d2,d2				
	add.l d3,d3				
	addx.l d2,d2				
						
	add.l d3,a1				
						
	move.l -8(a4,d1.l),d5			
	smi d4					
	extb.l d4				
	move.l d4,d2				
	move.l d5,d3				
	add.l d3,d3				
	addx.l d2,d2				
	add.l d5,d3				
	addx.l d4,d2				
	add.l d3,d3				
	addx.l d2,d2				
						
	sub.l d3,a1				
	move.l a1,(a0)				
						
	move.l 4(a3),d1				
	addq.l #1,d1				
	move.l d1,4(a3)				
						
	cmp.l d1,d6				
	jbhi _?L24				
	jbra _?L3				
_?L15:						
						
	moveq #3,d2				
	move.l d2,4(a3)				
						
	cmp.l d6,d2				
	jbcc _?L3				
						
	moveq #3,d1				
_?L23:						
						
	lsl.l #2,d1				
	lea (a4,d1.l),a0			
						
	move.l -12(a4,d1.l),a1			
	add.l (a0),a1				
						
	move.l -4(a4,d1.l),d3			
	smi d2					
	extb.l d2				
	move.l d2,d4				
	move.l d3,d5				
	add.l d5,d5				
	addx.l d4,d4				
	add.l d5,d3				
	addx.l d4,d2				
						
	add.l d3,a1				
						
	move.l -8(a4,d1.l),d5			
	smi d4					
	extb.l d4				
	move.l d4,d2				
	move.l d5,d3				
	add.l d3,d3				
	addx.l d2,d2				
	add.l d5,d3				
	addx.l d4,d2				
						
	sub.l d3,a1				
	move.l a1,(a0)				
						
	move.l 4(a3),d1				
	addq.l #1,d1				
	move.l d1,4(a3)				
						
	cmp.l d1,d6				
	jbls _?L3				
						
	lsl.l #2,d1				
	lea (a4,d1.l),a0			
						
	move.l -12(a4,d1.l),a1			
	add.l (a0),a1				
						
	move.l -4(a4,d1.l),d3			
	smi d2					
	extb.l d2				
	move.l d2,d4				
	move.l d3,d5				
	add.l d5,d5				
	addx.l d4,d4				
	add.l d5,d3				
	addx.l d4,d2				
						
	add.l d3,a1				
						
	move.l -8(a4,d1.l),d5			
	smi d4					
	extb.l d4				
	move.l d4,d2				
	move.l d5,d3				
	add.l d3,d3				
	addx.l d2,d2				
	add.l d5,d3				
	addx.l d4,d2				
						
	sub.l d3,a1				
	move.l a1,(a0)				
						
	move.l 4(a3),d1				
	addq.l #1,d1				
	move.l d1,4(a3)				
						
	cmp.l d1,d6				
	jbhi _?L23				
	jbra _?L3				
_?L17:						
						
	moveq #1,d2				
	move.l d2,4(a3)				
						
	cmp.l d6,d2				
	jbcc _?L3				
						
	moveq #1,d1				
_?L21:						
						
	lsl.l #2,d1				
						
	move.l -4(a4,d1.l),d2			
	add.l d2,(a4,d1.l)			
						
	move.l 4(a3),d1				
	addq.l #1,d1				
	move.l d1,4(a3)				
						
	cmp.l d1,d6				
	jbls _?L3				
						
	lsl.l #2,d1				
						
	move.l -4(a4,d1.l),d2			
	add.l d2,(a4,d1.l)			
						
	move.l 4(a3),d1				
	addq.l #1,d1				
	move.l d1,4(a3)				
						
	cmp.l d1,d6				
	jbhi _?L21				
	jbra _?L3				
						
						
