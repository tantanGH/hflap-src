* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"residual.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_residual_init		
						
_miniflac_residual_init:			
	move.l 4(sp),a0				
						
	clr.l 14(a0)				
						
	clr.l 18(a0)				
						
	clr.l 22(a0)				
						
	clr.l 26(a0)				
						
	clr.l 30(a0)				
						
	clr.l (a0)				
						
	clr.w 4(a0)				
						
	clr.w 6(a0)				
						
	clr.l 8(a0)				
						
	clr.b 12(a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_residual_decode	
						
_miniflac_residual_decode:			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 40(sp),a3			
	move.l 44(sp),d3			
	move.l 48(sp),a5			
	move.l 56(sp),d4			
						
	moveq #6,d0				
	cmp.l (a3),d0				
	jbcs _?L4				
	move.l (a3),d0				
	add.l d0,d0				
	move.w _?L6(pc,d0.l),d0			
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L6:						
	.dc.w _?L12-_?L6			
	.dc.w _?L29-_?L6			
	.dc.w _?L30-_?L6			
	.dc.w _?L31-_?L6			
	.dc.w _?L8-_?L6				
	.dc.w _?L32-_?L6			
	.dc.w _?L28-_?L6			
_?L4:						
						
	clr.l 14(a3)				
						
	clr.l 18(a3)				
						
	clr.l 22(a3)				
						
	clr.l 26(a3)				
						
	clr.l 30(a3)				
						
	clr.l (a3)				
						
	clr.w 4(a3)				
						
	clr.w 6(a3)				
						
	clr.l 8(a3)				
						
	clr.b 12(a3)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L32:						
	lea _miniflac_bitreader_fill,a6		
						
	lea _miniflac_bitreader_read,a4		
_?L25:						
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
_?L23:						
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,d2				
	or.l d1,d2				
	jbne _?L38				
						
	addq.l #1,8(a3)				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L23				
_?L16:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L28:						
	lea _miniflac_bitreader_fill,a6		
_?L5:						
						
	clr.l d0				
	move.b 6(a3),d0				
	move.l d0,-(sp)				
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
						
	clr.l d0				
	move.b 6(a3),d0				
						
	move.l 8(a3),d1				
	move.l d1,d5				
	lsl.l d0,d5				
						
	move.l d0,-(sp)				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	or.l d5,d1				
						
	moveq #1,d0				
	and.l d1,d0				
						
	neg.l d0				
						
	lsr.l #1,d1				
						
	eor.l d1,d0				
						
	move.l d0,14(a3)			
						
	tst.l 60(sp)				
	jbeq _?L24				
						
	move.l (a5),d1				
						
	move.l 60(sp),a0			
	move.l d0,(a0,d1.l*4)			
_?L24:						
						
	addq.l #1,(a5)				
						
	clr.l 8(a3)				
						
	move.l 26(a3),d0			
	addq.l #1,d0				
	move.l d0,26(a3)			
						
	cmp.l 30(a3),d0				
	jbcs _?L18				
_?L20:						
						
	clr.l 26(a3)				
						
	move.l 18(a3),d0			
	addq.l #1,d0				
	move.l d0,18(a3)			
						
	cmp.l 22(a3),d0				
	jbcc _?L4				
						
	moveq #2,d0				
	move.l d0,(a3)				
_?L10:						
						
	clr.l d0				
	move.b 12(a3),d0			
	move.l d0,-(sp)				
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
						
	clr.l d0				
	move.b 12(a3),d0			
	move.l d0,-(sp)				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,d2				
	move.b d1,6(a3)				
						
	clr.l 26(a3)				
						
	clr.l d1				
	move.b 5(a3),d1				
						
	move.l 52(sp),d0			
	lsr.l d1,d0				
						
	move.l d0,30(a3)			
						
	tst.l 18(a3)				
	jbne _?L17				
						
	clr.l d1				
	move.b d4,d1				
	sub.l d1,d0				
	move.l d0,30(a3)			
_?L17:						
						
	clr.l d0				
	move.b 4(a3),d0				
						
	cmp.b _escape_codes(d0.l),d2		
	jbeq _?L39				
_?L18:						
						
	moveq #5,d0				
	move.l d0,(a3)				
						
	lea _miniflac_bitreader_read,a4		
	jbra _?L25				
_?L29:						
	lea _miniflac_bitreader_fill,a6		
_?L11:						
						
	pea 4.w					
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
						
	pea 4.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,5(a3)				
						
	and.l #255,d1				
						
	moveq #1,d0				
	lsl.l d1,d0				
						
	move.l d0,22(a3)			
						
	moveq #2,d1				
	move.l d1,(a3)				
	jbra _?L10				
_?L30:						
	lea _miniflac_bitreader_fill,a6		
	jbra _?L10				
_?L31:						
	lea _miniflac_bitreader_fill,a6		
_?L9:						
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,d0				
	move.b d1,7(a3)				
						
	moveq #4,d1				
	move.l d1,(a3)				
						
	lea _miniflac_bitreader_read_signed,a4	
	tst.l 60(sp)				
	jbeq _?L21				
_?L19:						
						
	and.l #255,d0				
	move.l d0,-(sp)				
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
						
	clr.l d0				
	move.b 7(a3),d0				
	move.l d0,-(sp)				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d1,14(a3)			
						
	move.l (a5),d0				
						
	move.l 60(sp),a0			
	move.l d1,(a0,d0.l*4)			
						
	addq.l #1,(a5)				
						
	move.l 26(a3),d0			
	addq.l #1,d0				
	move.l d0,26(a3)			
						
	cmp.l 30(a3),d0				
	jbcc _?L20				
						
	moveq #4,d0				
	move.l d0,(a3)				
						
	move.b 7(a3),d0				
						
	jbra _?L19				
_?L12:						
						
	pea 2.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill,a6		
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
						
	pea 2.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d0,d6				
	move.l d1,d7				
						
	clr.l d1				
	moveq #1,d2				
	sub.l d7,d2				
	subx.l d6,d1				
	jbcs _?L26				
						
	move.b d7,4(a3)				
						
	move.b d7,d2				
	addq.b #4,d2				
	move.b d2,12(a3)			
						
	clr.l 8(a3)				
						
	moveq #1,d0				
	move.l d0,(a3)				
	jbra _?L11				
_?L8:						
						
	move.b 7(a3),d0				
	lea _miniflac_bitreader_fill,a6		
						
	lea _miniflac_bitreader_read_signed,a4	
	tst.l 60(sp)				
	jbne _?L19				
_?L21:						
						
	and.l #255,d0				
	move.l d0,-(sp)				
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
						
	clr.l d0				
	move.b 7(a3),d0				
	move.l d0,-(sp)				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d1,14(a3)			
						
	addq.l #1,(a5)				
						
	move.l 26(a3),d0			
	addq.l #1,d0				
	move.l d0,26(a3)			
						
	cmp.l 30(a3),d0				
	jbcc _?L20				
						
	moveq #4,d2				
	move.l d2,(a3)				
						
	move.b 7(a3),d0				
	jbra _?L21				
_?L38:						
						
	moveq #6,d0				
	move.l d0,(a3)				
						
	jbra _?L5				
_?L39:						
						
	moveq #3,d2				
	move.l d2,(a3)				
						
	jbra _?L9				
_?L26:						
						
	moveq #-14,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
						
	.data					
						
						
_escape_codes:					
	.dc.b $0f,$1f				
						
