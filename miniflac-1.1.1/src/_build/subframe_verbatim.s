* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"subframe_verbatim.c"		
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_subframe_verbatim_init
						
_miniflac_subframe_verbatim_init:		
	move.l 4(sp),a0				
						
	clr.l 4(a0)				
						
	clr.l (a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_subframe_verbatim_decode
						
_miniflac_subframe_verbatim_decode:		
	movem.l d3/d4/d5/a3/a4/a5/a6,-(sp)	
	move.l 32(sp),a3			
	move.l 36(sp),d4			
	move.l 40(sp),a5			
	move.l 44(sp),d5			
	move.l 48(sp),d3			
						
	cmp.l 4(a3),d5				
	jbls _?L10				
						
	and.l #255,d3				
	lea _miniflac_bitreader_fill,a4		
						
	lea _miniflac_bitreader_read_signed,a6	
	tst.l a5				
	jbeq _?L18				
_?L6:						
						
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L7				
						
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
						
	move.l d1,(a5,d0.l*4)			
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	cmp.l d0,d5				
	jbhi _?L6				
_?L10:						
						
	clr.l 4(a3)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/a3/a4/a5/a6	
	rts					
_?L18:						
						
	move.l a6,a5				
						
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L7				
_?L19:						
						
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	cmp.l d5,d0				
	jbcc _?L10				
						
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L19				
_?L7:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/a3/a4/a5/a6	
	rts					
						
						
