* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"subframeheader.c"		
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_subframe_header_init	
						
_miniflac_subframe_header_init:			
	move.l 4(sp),a0				
						
	clr.l (a0)				
						
	clr.l 4(a0)				
						
	clr.w 8(a0)				
						
	clr.b 10(a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_subframe_header_decode
						
_miniflac_subframe_header_decode:		
	movem.l d3/d4/d5/d6/d7/a3/a4/a5,-(sp)	
	move.l 36(sp),a3			
	move.l 40(sp),d3			
						
	move.l (a3),d0				
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill,a4		
	cmp.l d0,d1				
	jbeq _?L4				
	moveq #2,d2				
	cmp.l d0,d2				
	jbcs _?L5				
	tst.l d0				
	jbeq _?L6				
	lea _miniflac_bitreader_fill,a4		
						
	pea 6.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L35				
_?L9:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L5:						
	lea _miniflac_bitreader_fill,a4		
						
	subq.l #3,d0				
	jbne _?L9				
						
	lea _miniflac_bitreader_read,a5		
_?L19:						
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L9				
						
	addq.b #1,9(a3)				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	clr.l d4				
	moveq #1,d5				
	sub.l d1,d5				
	subx.l d0,d4				
	jbne _?L19				
_?L18:						
						
	clr.l (a3)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L35:						
						
	pea 6.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	clr.l d4				
	clr.l d5				
	moveq #0,d5				
	not.b d5				
	and.l d1,d5				
						
	move.b d1,10(a3)			
						
	move.l d4,d7				
	or.l d5,d7				
	jbne _?L13				
						
	moveq #1,d0				
	move.l d0,4(a3)				
						
	moveq #2,d4				
	move.l d4,(a3)				
_?L4:						
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L9				
						
	clr.b 9(a3)				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d0,d5				
	or.l d1,d5				
	jbeq _?L18				
						
	moveq #3,d6				
	move.l d6,(a3)				
						
	lea _miniflac_bitreader_read,a5		
	jbra _?L19				
_?L6:						
						
	pea 1.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill,a4		
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L9				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d0,d5				
	or.l d1,d5				
	jbne _?L21				
						
	moveq #1,d6				
	move.l d6,(a3)				
						
	pea 6.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L9				
	jbra _?L35				
_?L13:						
						
	clr.l d6				
	moveq #1,d7				
	sub.l d5,d7				
	subx.l d4,d6				
	jbeq _?L36				
						
	clr.l d6				
	clr.l d7				
	moveq #7,d7				
	not.b d7				
	and.l d1,d7				
	move.l d6,d0				
	or.l d7,d0				
	jbeq _?L23				
						
	clr.l d6				
	moveq #12,d7				
	sub.l d5,d7				
	subx.l d4,d6				
	jbcs _?L16				
						
	moveq #2,d7				
	move.l d7,4(a3)				
						
	subq.b #8,d1				
	move.b d1,8(a3)				
						
	moveq #2,d4				
	move.l d4,(a3)				
	jbra _?L4				
_?L36:						
						
	moveq #4,d7				
	move.l d7,4(a3)				
						
	moveq #2,d4				
	move.l d4,(a3)				
	jbra _?L4				
_?L16:						
						
	clr.l d4				
	clr.l d5				
	moveq #31,d5				
	not.b d5				
	and.l d1,d5				
	move.l d4,d0				
	or.l d5,d0				
	jbeq _?L23				
						
	moveq #3,d2				
	move.l d2,4(a3)				
						
	add.b #-31,d1				
	move.b d1,8(a3)				
						
	moveq #2,d4				
	move.l d4,(a3)				
	jbra _?L4				
_?L21:						
						
	moveq #-16,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L23:						
						
	moveq #-17,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
						
						
