* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"seektable.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_seektable_init	
						
_miniflac_seektable_init:			
	move.l 4(sp),a0				
						
	clr.l (a0)				
						
	clr.l 4(a0)				
						
	clr.l 8(a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_seektable_read_seekpoints
						
_miniflac_seektable_read_seekpoints:		
	move.l 4(sp),a0				
						
	tst.l (a0)				
	jbne _?L7				
						
	tst.l 12(sp)				
	jbeq _?L6				
						
	move.l 12(sp),a1			
	move.l 4(a0),(a1)			
_?L6:						
						
	moveq #1,d0				
						
	rts					
_?L7:						
						
	moveq #-1,d0				
						
	rts					
						
	.align	2				
	.globl	_miniflac_seektable_read_sample_number
						
_miniflac_seektable_read_sample_number:		
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	tst.l (a3)				
	jbne _?L13				
						
	move.l 8(a3),d0				
	cmp.l 4(a3),d0				
	jbeq _?L14				
						
	pea 64.w				
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L21				
						
	clr.l d0				
						
	move.l (sp)+,a3				
	rts					
_?L21:						
						
	pea 64.w				
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 16(sp)				
	jbeq _?L12				
						
	move.l 16(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L12:						
						
	moveq #1,d0				
	move.l d0,(a3)				
						
	move.l (sp)+,a3				
	rts					
_?L14:						
						
	moveq #2,d0				
						
	move.l (sp)+,a3				
	rts					
_?L13:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_miniflac_seektable_read_sample_offset
						
_miniflac_seektable_read_sample_offset:		
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	jbeq _?L23				
	subq.l #1,d0				
	jbne _?L35				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	pea 64.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L38				
_?L27:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L35:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L38:						
						
	pea 64.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 20(sp)				
	jbeq _?L28				
						
	move.l 20(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L28:						
						
	moveq #2,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L23:						
						
	move.l 8(a3),a0				
	cmp.l 4(a3),a0				
	jbeq _?L29				
						
	pea 64.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L27				
						
	pea 64.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,(a3)				
						
	pea 64.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L27				
	jbra _?L38				
_?L29:						
						
	moveq #2,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
						
	.align	2				
	.globl	_miniflac_seektable_read_samples
						
_miniflac_seektable_read_samples:		
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcc _?L40				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #2,d0				
	jbne _?L59				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L60				
_?L45:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L59:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L60:						
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 20(sp)				
	jbeq _?L46				
						
	move.l 20(sp),a0			
	move.w d1,(a0)				
_?L46:						
						
	addq.l #1,8(a3)				
						
	clr.l (a3)				
						
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L40:						
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbeq _?L43				
						
	move.l 8(a3),a0				
	cmp.l 4(a3),a0				
	jbeq _?L47				
						
	pea 64.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L45				
						
	pea 64.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,(a3)				
_?L43:						
						
	pea 64.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L45				
						
	pea 64.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,(a3)				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L45				
	jbra _?L60				
_?L47:						
						
	moveq #2,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
						
						
