* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"padding.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_padding_init		
						
_miniflac_padding_init:				
	move.l 4(sp),a0				
						
	clr.l (a0)				
						
	clr.l 4(a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_padding_read_length	
						
_miniflac_padding_read_length:			
	move.l 12(sp),a0			
						
	tst.l a0				
	jbeq _?L4				
						
	move.l 4(sp),a1				
	move.l (a1),(a0)			
_?L4:						
						
	moveq #1,d0				
	rts					
						
	.align	2				
	.globl	_miniflac_padding_read_data	
						
_miniflac_padding_read_data:			
	movem.l d3/d4/a3/a4/a5/a6,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d3			
	move.l 36(sp),a6			
	move.l 40(sp),d4			
						
	move.l (a3),d1				
						
	cmp.l 4(a3),d1				
	jbls _?L11				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
	tst.l a6				
	jbeq _?L29				
_?L12:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L13				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
						
	cmp.l d0,d4				
	jbls _?L18				
						
	move.b d1,(a6,d0.l)			
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	move.l (a3),d1				
						
	cmp.l d0,d1				
	jbhi _?L12				
_?L11:						
						
	tst.l 44(sp)				
	jbeq _?L22				
_?L20:						
						
	cmp.l d4,d1				
	jbcs _?L30				
						
	move.l 44(sp),a0			
	move.l d4,(a0)				
_?L22:						
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L29:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L13				
_?L31:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	move.l (a3),d1				
						
	cmp.l d0,d1				
	jbls _?L11				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L31				
_?L13:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L18:						
						
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	move.l (a3),d1				
						
	cmp.l d0,d1				
	jbhi _?L12				
						
	tst.l 44(sp)				
	jbne _?L20				
	jbra _?L22				
_?L30:						
						
	move.l d1,d4				
						
	move.l 44(sp),a0			
	move.l d4,(a0)				
	jbra _?L22				
						
						
