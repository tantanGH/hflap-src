* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"streammarker.c"		
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_streammarker_init	
						
_miniflac_streammarker_init:			
						
	move.l 4(sp),a0				
	clr.l (a0)				
						
	rts					
						
	.data					
_?LC0:						
	.dc.b $73,$74,$72,$65,$61,$6d,$6d,$61
	.dc.b $72,$6b,$65,$72,$2e,$63
	.dc.b $00				
_?LC1:						
	.dc.b $62,$72,$2d,$3e,$62,$69,$74,$73
	.dc.b $20,$3d,$3d,$20,$30
	.dc.b $00				
_?LC2:						
	.dc.b $41,$73,$73,$65,$72,$74,$69,$6f
	.dc.b $6e,$20,$66,$61,$69,$6c,$65,$64
	.dc.b $3a,$20,$25,$73,$2c,$20,$66,$69
	.dc.b $6c,$65,$20,$25,$73,$2c,$20,$6c
	.dc.b $69,$6e,$65,$20,$25,$64,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_streammarker_decode	
						
_miniflac_streammarker_decode:			
	movem.l a3/a4/a5,-(sp)			
	move.l 16(sp),a5			
	move.l 20(sp),a3			
						
	move.l (a5),d0				
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbeq _?L4				
	moveq #2,d1				
	cmp.l d0,d1				
	jbcs _?L5				
	tst.l d0				
	jbeq _?L6				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L23				
_?L12:						
						
	clr.l d0				
						
	movem.l (sp)+,a3/a4/a5			
	rts					
_?L5:						
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	subq.l #3,d0				
	jbne _?L24				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L12				
_?L26:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #67,d1				
	jbne _?L13				
						
	clr.l (a5)				
						
	tst.b 8(a3)				
	jbne _?L25				
						
	clr.b 9(a3)				
						
	clr.w 10(a3)				
						
	moveq #1,d0				
						
	movem.l (sp)+,a3/a4/a5			
	rts					
_?L24:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,a3/a4/a5			
	rts					
_?L23:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #76,d1				
	jbne _?L13				
						
	moveq #2,d1				
	move.l d1,(a5)				
_?L4:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L12				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #97,d1				
	jbne _?L13				
						
	moveq #3,d0				
	move.l d0,(a5)				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L12				
	jbra _?L26				
_?L6:						
						
	pea 8.w					
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L12				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbne _?L13				
						
	moveq #1,d0				
	move.l d0,(a5)				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L12				
	jbra _?L23				
_?L13:						
						
	moveq #-15,d0				
						
	movem.l (sp)+,a3/a4/a5			
	rts					
_?L25:						
						
	pea 68.w				
	pea _?LC0				
	pea _?LC1				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
						
