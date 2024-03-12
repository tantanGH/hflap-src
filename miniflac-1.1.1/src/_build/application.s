* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"application.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_application_init	
						
_miniflac_application_init:			
	move.l 4(sp),a0				
						
	clr.l (a0)				
						
	clr.l 4(a0)				
						
	clr.l 8(a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_application_read_id	
						
_miniflac_application_read_id:			
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	tst.l (a3)				
	jbeq _?L13				
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L13:						
						
	pea 32.w				
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L14				
						
	clr.l d0				
						
	move.l (sp)+,a3				
	rts					
_?L14:						
						
	pea 32.w				
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 16(sp)				
	jbeq _?L5				
						
	move.l 16(sp),a0			
	move.l d1,(a0)				
_?L5:						
						
	moveq #1,d0				
	move.l d0,(a3)				
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_miniflac_application_read_length
						
_miniflac_application_read_length:		
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	move.l (a3),d0				
						
	jbeq _?L16				
	subq.l #1,d0				
	jbeq _?L17				
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L16:						
						
	pea 32.w				
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L21				
						
	pea 32.w				
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,(a3)				
_?L17:						
						
	tst.l 16(sp)				
	jbeq _?L20				
						
	move.l 16(sp),a0			
	move.l 4(a3),(a0)			
_?L20:						
						
	moveq #1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L21:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_miniflac_application_read_data	
						
_miniflac_application_read_data:		
	movem.l d3/d4/a3/a4/a5/a6,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d3			
	move.l 36(sp),a4			
	move.l 40(sp),d4			
						
	move.l (a3),d0				
						
	jbeq _?L28				
	subq.l #1,d0				
	jbne _?L55				
_?L29:						
						
	move.l 4(a3),d1				
						
	cmp.l 8(a3),d1				
	jbls _?L32				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_read,a6		
	tst.l a4				
	jbeq _?L56				
_?L33:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L38				
_?L57:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
						
	cmp.l d0,d4				
	jbls _?L39				
						
	move.b d1,(a4,d0.l)			
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbhi _?L33				
_?L32:						
						
	tst.l 44(sp)				
	jbeq _?L41				
_?L58:						
						
	cmp.l d4,d1				
	jbcc _?L42				
	move.l d1,d4				
_?L42:						
						
	move.l 44(sp),a0			
	move.l d4,(a0)				
_?L41:						
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L55:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L39:						
						
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbls _?L32				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L57				
_?L38:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L56:						
						
	move.l a6,a4				
_?L35:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L38				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbhi _?L35				
						
	tst.l 44(sp)				
	jbne _?L58				
	jbra _?L41				
_?L28:						
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L38				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,(a3)				
	jbra _?L29				
						
						
