* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"oggheader.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_oggheader_init	
						
_miniflac_oggheader_init:			
						
	move.l 4(sp),a0				
	clr.l (a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_oggheader_decode	
						
_miniflac_oggheader_decode:			
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a3			
	move.l 20(sp),d3			
						
	moveq #7,d0				
	cmp.l (a3),d0				
	jbcs _?L4				
	move.l (a3),d0				
	add.l d0,d0				
	move.w _?L6(pc,d0.l),d0			
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L6:						
	.dc.w _?L13-_?L6			
	.dc.w _?L21-_?L6			
	.dc.w _?L22-_?L6			
	.dc.w _?L23-_?L6			
	.dc.w _?L24-_?L6			
	.dc.w _?L25-_?L6			
	.dc.w _?L26-_?L6			
	.dc.w _?L20-_?L6			
_?L26:						
	lea _miniflac_bitreader_fill_nocrc,a4	
_?L7:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.b d1				
	jbne _?L18				
						
	moveq #7,d0				
	move.l d0,(a3)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
_?L29:						
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_discard	
	addq.l #8,sp				
						
	clr.l (a3)				
_?L4:						
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L20:						
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L29				
_?L16:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L21:						
	lea _miniflac_bitreader_fill_nocrc,a4	
_?L12:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #70,d1				
	jbne _?L18				
						
	moveq #2,d0				
	move.l d0,(a3)				
_?L11:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #76,d1				
	jbne _?L18				
						
	moveq #3,d0				
	move.l d0,(a3)				
_?L10:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #65,d1				
	jbne _?L18				
						
	moveq #4,d0				
	move.l d0,(a3)				
_?L9:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #67,d1				
	jbne _?L18				
						
	moveq #5,d0				
	move.l d0,(a3)				
_?L8:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #1,d1				
	jbne _?L18				
						
	moveq #6,d0				
	move.l d0,(a3)				
	jbra _?L7				
_?L22:						
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbra _?L11				
_?L24:						
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbra _?L9				
_?L23:						
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbra _?L10				
_?L25:						
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbra _?L8				
_?L13:						
						
	pea 8.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L16				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #127,d1				
	jbne _?L19				
						
	moveq #1,d0				
	move.l d0,(a3)				
	jbra _?L12				
_?L18:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L19:						
						
	moveq #-18,d0				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
						
						
