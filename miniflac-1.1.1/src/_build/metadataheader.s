* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"metadataheader.c"		
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_metadata_header_init	
						
_miniflac_metadata_header_init:			
	move.l 4(sp),a0				
						
	clr.l (a0)				
						
	move.l #128,6(a0)			
						
	clr.w 4(a0)				
						
	clr.l 10(a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_metadata_header_decode
						
_miniflac_metadata_header_decode:		
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a3			
	move.l 20(sp),d3			
						
	move.l (a3),d0				
						
	moveq #1,d1				
	lea _miniflac_bitreader_fill,a4		
	cmp.l d0,d1				
	jbeq _?L4				
	moveq #2,d1				
	lea _miniflac_bitreader_fill,a4		
	cmp.l d0,d1				
	jbeq _?L5				
	tst.l d0				
	jbeq _?L6				
	moveq #1,d0				
_?L3:						
						
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L6:						
						
	pea 1.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill,a4		
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L8				
_?L9:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L22:						
	moveq #2,d0				
						
	move.l d0,6(a3)				
						
	moveq #2,d0				
	move.l d0,(a3)				
_?L5:						
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L9				
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,10(a3)			
						
	clr.l (a3)				
	moveq #1,d0				
	jbra _?L3				
_?L8:						
						
	clr.l (a3)				
						
	move.l #128,6(a3)			
						
	clr.w 4(a3)				
						
	clr.l 10(a3)				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,4(a3)				
						
	moveq #1,d0				
	move.l d0,(a3)				
_?L4:						
						
	pea 7.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L9				
						
	pea 7.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,5(a3)				
	cmp.b #6,d1				
	jbhi _?L10				
	and.l #255,d1				
	add.l d1,d1				
	move.w _?L13(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L13:						
	.dc.w _?L11-_?L13			
	.dc.w _?L18-_?L13			
	.dc.w _?L22-_?L13			
	.dc.w _?L16-_?L13			
	.dc.w _?L15-_?L13			
	.dc.w _?L14-_?L13			
	.dc.w _?L12-_?L13			
_?L10:						
	cmp.b #127,d1				
	jbne _?L32				
						
	moveq #127,d1				
	move.l d1,6(a3)				
						
	moveq #-12,d0				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L18:						
	moveq #1,d0				
						
	move.l d0,6(a3)				
						
	moveq #2,d0				
	move.l d0,(a3)				
	jbra _?L5				
_?L12:						
						
	moveq #6,d0				
						
	move.l d0,6(a3)				
						
	moveq #2,d0				
	move.l d0,(a3)				
	jbra _?L5				
_?L14:						
						
	moveq #5,d0				
						
	move.l d0,6(a3)				
						
	moveq #2,d0				
	move.l d0,(a3)				
	jbra _?L5				
_?L15:						
						
	moveq #4,d0				
						
	move.l d0,6(a3)				
						
	moveq #2,d0				
	move.l d0,(a3)				
	jbra _?L5				
_?L16:						
						
	moveq #3,d0				
						
	move.l d0,6(a3)				
						
	moveq #2,d0				
	move.l d0,(a3)				
	jbra _?L5				
_?L11:						
	clr.l d0				
						
	move.l d0,6(a3)				
						
	moveq #2,d0				
	move.l d0,(a3)				
	jbra _?L5				
_?L32:						
						
	move.l #128,6(a3)			
						
	moveq #-13,d0				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
						
						
