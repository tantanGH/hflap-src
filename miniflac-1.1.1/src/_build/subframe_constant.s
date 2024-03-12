* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"subframe_constant.c"		
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_subframe_constant_init
						
_miniflac_subframe_constant_init:		
						
	move.l 4(sp),a0				
	clr.l (a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_subframe_constant_decode
						
_miniflac_subframe_constant_decode:		
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l 16(sp),d3			
						
	clr.l d4				
	move.b 31(sp),d4			
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L15				
						
	clr.l d0				
						
	move.l (sp)+,d3				
	move.l (sp)+,d4				
	rts					
_?L15:						
						
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read_signed	
	addq.l #8,sp				
						
	tst.l 20(sp)				
	jbeq _?L6				
						
	tst.l 24(sp)				
	jbeq _?L6				
	move.l 20(sp),a0			
	move.l 24(sp),d0			
	lsl.l #2,d0				
	add.l a0,d0				
_?L7:						
						
	move.l d1,(a0)+				
						
	cmp.l a0,d0				
	jbne _?L7				
_?L6:						
						
	moveq #1,d0				
						
	move.l (sp)+,d3				
	move.l (sp)+,d4				
	rts					
						
						
