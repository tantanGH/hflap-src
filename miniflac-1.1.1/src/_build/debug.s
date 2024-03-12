* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"debug.c"			
						
						
						
						
						
	.text					
	.data					
_?LC0:						

	.dc.b $00				
_?LC1:						
	.dc.b $25,$2a,$73,$61,$70,$70,$6c,$69
	.dc.b $63,$61,$74,$69,$6f,$6e,$20,$28
	.dc.b $25,$6c,$75,$20,$62,$79,$74,$65
	.dc.b $73,$29,$3a,$0a
	.dc.b $00				
_?LC2:						
	.dc.b $25,$2a,$73,$73,$74,$61,$74,$65
	.dc.b $3a,$20,$25,$73,$0a
	.dc.b $00				
_?LC3:						
	.dc.b $25,$2a,$73,$6c,$65,$6e,$3a,$20
	.dc.b $25,$75,$0a
	.dc.b $00				
_?LC4:						
	.dc.b $25,$2a,$73,$70,$6f,$73,$3a,$20
	.dc.b $25,$75,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_application	
						
_miniflac_dump_application:			
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a4			
	move.l 20(sp),d3			
						
	pea 12.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC1				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l (a4),d0				
	move.l _miniflac_application_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 4(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC3				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 8(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.data					
_?LC5:						
	.dc.b $25,$2a,$73,$63,$75,$65,$73,$68
	.dc.b $65,$65,$74,$20,$28,$25,$6c,$75
	.dc.b $20,$62,$79,$74,$65,$73,$29,$3a
	.dc.b $0a
	.dc.b $00				
_?LC6:						
	.dc.b $25,$2a,$73,$74,$72,$61,$63,$6b
	.dc.b $3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC7:						
	.dc.b $25,$2a,$73,$74,$72,$61,$63,$6b
	.dc.b $73,$3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC8:						
	.dc.b $25,$2a,$73,$70,$6f,$69,$6e,$74
	.dc.b $3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC9:						
	.dc.b $25,$2a,$73,$70,$6f,$69,$6e,$74
	.dc.b $73,$3a,$20,$25,$75,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_cuesheet		
						
_miniflac_dump_cuesheet:			
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a4			
	move.l 20(sp),d3			
						
	pea 12.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC5				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l (a4),d0				
	move.l _miniflac_cuesheet_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 4(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 8(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC6				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 9(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC7				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 10(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC8				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 11(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC9				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.data					
_?LC10:						
	.dc.b $25,$2a,$73,$70,$69,$63,$74,$75
	.dc.b $72,$65,$20,$28,$25,$6c,$75,$20
	.dc.b $62,$79,$74,$65,$73,$29,$3a,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_picture		
						
_miniflac_dump_picture:				
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a4			
	move.l 20(sp),d3			
						
	pea 12.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC10				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l (a4),d0				
	move.l _miniflac_picture_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 4(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC3				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 8(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.data					
_?LC11:						
	.dc.b $25,$2a,$73,$73,$65,$65,$6b,$74
	.dc.b $61,$62,$6c,$65,$20,$28,$25,$6c
	.dc.b $75,$20,$62,$79,$74,$65,$73,$29
	.dc.b $3a,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_seektable	
						
_miniflac_dump_seektable:			
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a4			
	move.l 20(sp),d3			
						
	pea 12.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC11				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l (a4),d0				
	move.l _miniflac_seektable_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 4(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC3				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 8(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.data					
_?LC12:						
	.dc.b $25,$2a,$73,$76,$6f,$72,$62,$69
	.dc.b $73,$5f,$63,$6f,$6d,$6d,$65,$6e
	.dc.b $74,$20,$28,$25,$6c,$75,$20,$62
	.dc.b $79,$74,$65,$73,$29,$3a,$0a
	.dc.b $00				
_?LC13:						
	.dc.b $25,$2a,$73,$74,$6f,$74,$3a,$20
	.dc.b $25,$75,$0a
	.dc.b $00				
_?LC14:						
	.dc.b $25,$2a,$73,$63,$75,$72,$3a,$20
	.dc.b $25,$75,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_vorbis_comment	
						
_miniflac_dump_vorbis_comment:			
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a4			
	move.l 20(sp),d3			
						
	pea 20.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC12				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l (a4),d0				
	move.l _miniflac_vorbis_comment_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 4(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC3				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 8(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 12(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC13				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 16(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC14				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.data					
_?LC15:						
	.dc.b $25,$2a,$73,$62,$69,$74,$72,$65
	.dc.b $61,$64,$65,$72,$20,$28,$25,$6c
	.dc.b $75,$20,$62,$79,$74,$65,$73,$29
	.dc.b $3a,$0a
	.dc.b $00				
_?LC16:						
	.dc.b $25,$2a,$73,$76,$61,$6c,$3a,$20
	.dc.b $30,$78,$25,$30,$38,$6c,$78,$0a
	.dc.b $00				
_?LC17:						
	.dc.b $25,$2a,$73,$62,$69,$74,$73,$3a
	.dc.b $20,$25,$75,$0a
	.dc.b $00				
_?LC18:						
	.dc.b $25,$2a,$73,$63,$72,$63,$38,$3a
	.dc.b $20,$25,$75,$0a
	.dc.b $00				
_?LC19:						
	.dc.b $25,$2a,$73,$63,$72,$63,$31,$36
	.dc.b $3a,$20,$25,$75,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_bitreader	
						
_miniflac_dump_bitreader:			
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a4			
	move.l 20(sp),d3			
						
	pea 28.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC15				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l 4(a4),-(sp)			
	move.l (a4),-(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC16				
	pea __iob+52				
	jbsr (a3)				
	lea (24,sp),sp				
						
	clr.l d0				
	move.b 8(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC17				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 9(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC18				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.w 10(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC19				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 12(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 16(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC3				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.data					
_?LC20:						
	.dc.b $25,$2a,$73,$66,$72,$61,$6d,$65
	.dc.b $5f,$68,$65,$61,$64,$65,$72,$20
	.dc.b $28,$25,$6c,$75,$20,$62,$79,$74
	.dc.b $65,$73,$29,$3a,$0a
	.dc.b $00				
_?LC21:						
	.dc.b $25,$2a,$73,$62,$6c,$6f,$63,$6b
	.dc.b $5f,$73,$69,$7a,$65,$5f,$72,$61
	.dc.b $77,$3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC22:						
	.dc.b $25,$2a,$73,$73,$61,$6d,$70,$6c
	.dc.b $65,$5f,$72,$61,$74,$65,$5f,$72
	.dc.b $61,$77,$3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC23:						
	.dc.b $25,$2a,$73,$63,$68,$61,$6e,$6e
	.dc.b $65,$6c,$5f,$61,$73,$73,$69,$67
	.dc.b $6e,$6d,$65,$6e,$74,$5f,$72,$61
	.dc.b $77,$3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC24:						
	.dc.b $25,$2a,$73,$62,$6c,$6f,$63,$6b
	.dc.b $69,$6e,$67,$5f,$73,$74,$72,$61
	.dc.b $74,$65,$67,$79,$3a,$20,$25,$75
	.dc.b $0a
	.dc.b $00				
_?LC25:						
	.dc.b $25,$2a,$73,$62,$6c,$6f,$63,$6b
	.dc.b $5f,$73,$69,$7a,$65,$3a,$20,$25
	.dc.b $75,$0a
	.dc.b $00				
_?LC26:						
	.dc.b $25,$2a,$73,$73,$61,$6d,$70,$6c
	.dc.b $65,$5f,$72,$61,$74,$65,$3a,$20
	.dc.b $25,$75,$0a
	.dc.b $00				
_?LC27:						
	.dc.b $25,$2a,$73,$63,$68,$61,$6e,$6e
	.dc.b $65,$6c,$5f,$61,$73,$73,$69,$67
	.dc.b $6e,$6d,$65,$6e,$74,$3a,$20,$25
	.dc.b $73,$0a
	.dc.b $00				
_?LC28:						
	.dc.b $25,$2a,$73,$63,$68,$61,$6e,$6e
	.dc.b $65,$6c,$73,$3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC29:						
	.dc.b $25,$2a,$73,$62,$70,$73,$3a,$20
	.dc.b $25,$75,$0a
	.dc.b $00				
_?LC30:						
	.dc.b $25,$2a,$73,$73,$61,$6d,$70,$6c
	.dc.b $65,$5f,$6e,$75,$6d,$62,$65,$72
	.dc.b $3a,$20,$25,$6c,$75,$0a
	.dc.b $00				
_?LC31:						
	.dc.b $25,$2a,$73,$66,$72,$61,$6d,$65
	.dc.b $5f,$6e,$75,$6d,$62,$65,$72,$3a
	.dc.b $20,$25,$75,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_frame_header	
						
_miniflac_dump_frame_header:			
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a4			
	move.l 20(sp),d3			
						
	pea 30.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC20				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l 26(a4),d0			
	move.l _miniflac_frame_header_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b (a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC21				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 1(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC22				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 2(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC23				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 3(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC24				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.w 4(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC25				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 6(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC26				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.l 10(a4),d0			
	move.l _miniflac_chassgn_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC27				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 14(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC28				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 15(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC29				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 20(a4),(sp)			
	move.l 16(a4),-(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC30				
	pea __iob+52				
	jbsr (a3)				
						
	lea (20,sp),sp				
	move.l 16(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC31				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 24(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC18				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.data					
_?LC32:						
	.dc.b $25,$2a,$73,$72,$65,$73,$69,$64
	.dc.b $75,$61,$6c,$20,$28,$25,$6c,$75
	.dc.b $20,$62,$79,$74,$65,$73,$29,$3a
	.dc.b $0a
	.dc.b $00				
_?LC33:						
	.dc.b $25,$2a,$73,$63,$6f,$64,$69,$6e
	.dc.b $67,$5f,$6d,$65,$74,$68,$6f,$64
	.dc.b $3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC34:						
	.dc.b $25,$2a,$73,$70,$61,$72,$74,$69
	.dc.b $74,$69,$6f,$6e,$5f,$6f,$72,$64
	.dc.b $65,$72,$3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC35:						
	.dc.b $25,$2a,$73,$72,$69,$63,$65,$5f
	.dc.b $70,$61,$72,$61,$6d,$65,$74,$65
	.dc.b $72,$3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC36:						
	.dc.b $25,$2a,$73,$72,$69,$63,$65,$5f
	.dc.b $73,$69,$7a,$65,$3a,$20,$25,$75
	.dc.b $0a
	.dc.b $00				
_?LC37:						
	.dc.b $25,$2a,$73,$6d,$73,$62,$3a,$20
	.dc.b $25,$75,$0a
	.dc.b $00				
_?LC38:						
	.dc.b $25,$2a,$73,$72,$69,$63,$65,$5f
	.dc.b $70,$61,$72,$61,$6d,$65,$74,$65
	.dc.b $72,$5f,$73,$69,$7a,$65,$3a,$20
	.dc.b $25,$75,$0a
	.dc.b $00				
_?LC39:						
	.dc.b $25,$2a,$73,$76,$61,$6c,$75,$65
	.dc.b $3a,$20,$25,$64,$0a
	.dc.b $00				
_?LC40:						
	.dc.b $25,$2a,$73,$70,$61,$72,$74,$69
	.dc.b $74,$69,$6f,$6e,$3a,$20,$25,$75
	.dc.b $0a
	.dc.b $00				
_?LC41:						
	.dc.b $25,$2a,$73,$70,$61,$72,$74,$69
	.dc.b $74,$69,$6f,$6e,$5f,$74,$6f,$74
	.dc.b $61,$6c,$3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC42:						
	.dc.b $25,$2a,$73,$72,$65,$73,$69,$64
	.dc.b $75,$61,$6c,$3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC43:						
	.dc.b $25,$2a,$73,$72,$65,$73,$69,$64
	.dc.b $75,$61,$6c,$5f,$74,$6f,$74,$61
	.dc.b $6c,$3a,$20,$25,$75,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_residual		
						
_miniflac_dump_residual:			
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a4			
	move.l 20(sp),d3			
						
	pea 34.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC32				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l (a4),d0				
	move.l _miniflac_residual_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 4(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC33				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 5(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC34				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 6(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC35				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 7(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC36				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 8(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC37				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 12(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC38				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 14(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC39				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 18(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC40				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 22(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC41				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 26(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC42				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 30(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC43				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.data					
_?LC44:						
	.dc.b $25,$2a,$73,$73,$75,$62,$66,$72
	.dc.b $61,$6d,$65,$5f,$68,$65,$61,$64
	.dc.b $65,$72,$20,$28,$25,$6c,$75,$20
	.dc.b $62,$79,$74,$65,$73,$29,$3a,$0a
	.dc.b $00				
_?LC45:						
	.dc.b $25,$2a,$73,$74,$79,$70,$65,$3a
	.dc.b $20,$25,$73,$0a
	.dc.b $00				
_?LC46:						
	.dc.b $25,$2a,$73,$6f,$72,$64,$65,$72
	.dc.b $3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC47:						
	.dc.b $25,$2a,$73,$77,$61,$73,$74,$65
	.dc.b $64,$5f,$62,$69,$74,$73,$3a,$20
	.dc.b $25,$75,$0a
	.dc.b $00				
_?LC48:						
	.dc.b $25,$2a,$73,$74,$79,$70,$65,$5f
	.dc.b $72,$61,$77,$3a,$20,$25,$75,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_subframe_header	
						
_miniflac_dump_subframe_header:			
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a4			
	move.l 20(sp),d3			
						
	pea 12.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC44				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l (a4),d0				
	move.l _miniflac_subframe_header_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.l 4(a4),d0				
	move.l _miniflac_subframe_header_type_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC45				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 8(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC46				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 9(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC47				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 10(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC48				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.data					
_?LC49:						
	.dc.b $25,$2a,$73,$73,$75,$62,$66,$72
	.dc.b $61,$6d,$65,$5f,$63,$6f,$6e,$73
	.dc.b $74,$61,$6e,$74,$20,$28,$25,$6c
	.dc.b $75,$20,$62,$79,$74,$65,$73,$29
	.dc.b $3a,$0a
	.dc.b $00				
_?LC50:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$43,$4f,$4e,$53,$54,$41
	.dc.b $4e,$54,$5f,$44,$45,$43,$4f,$44
	.dc.b $45
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_subframe_constant
						
_miniflac_dump_subframe_constant:		
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l 16(sp),d3			
						
	pea 4.w					
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC49				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l #_?LC50,(sp)			
	pea _?LC0				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.l (sp)+,d3				
	move.l (sp)+,a3				
	rts					
						
	.data					
_?LC51:						
	.dc.b $25,$2a,$73,$73,$75,$62,$66,$72
	.dc.b $61,$6d,$65,$5f,$76,$65,$72,$62
	.dc.b $61,$74,$69,$6d,$20,$28,$25,$6c
	.dc.b $75,$20,$62,$79,$74,$65,$73,$29
	.dc.b $3a,$0a
	.dc.b $00				
_?LC52:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$56,$45,$52,$42,$41,$54
	.dc.b $49,$4d,$5f,$44,$45,$43,$4f,$44
	.dc.b $45
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_subframe_verbatim
						
_miniflac_dump_subframe_verbatim:		
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l 16(sp),d3			
						
	pea 8.w					
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC51				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	pea _?LC52				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.l 12(sp),a0			
	move.l 4(a0),-(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.l (sp)+,d3				
	move.l (sp)+,a3				
	rts					
						
	.data					
_?LC53:						
	.dc.b $25,$2a,$73,$73,$75,$62,$66,$72
	.dc.b $61,$6d,$65,$5f,$66,$69,$78,$65
	.dc.b $64,$20,$28,$25,$6c,$75,$20,$62
	.dc.b $79,$74,$65,$73,$29,$3a,$0a
	.dc.b $00				
_?LC54:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$46,$49,$58,$45,$44,$5f
	.dc.b $44,$45,$43,$4f,$44,$45
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_subframe_fixed	
						
_miniflac_dump_subframe_fixed:			
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l 16(sp),d3			
						
	pea 8.w					
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC53				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	pea _?LC54				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.l 12(sp),a0			
	move.l 4(a0),-(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.l (sp)+,d3				
	move.l (sp)+,a3				
	rts					
						
	.data					
_?LC55:						
	.dc.b $25,$2a,$73,$73,$75,$62,$66,$72
	.dc.b $61,$6d,$65,$5f,$6c,$70,$63,$20
	.dc.b $28,$25,$6c,$75,$20,$62,$79,$74
	.dc.b $65,$73,$29,$3a,$0a
	.dc.b $00				
_?LC56:						
	.dc.b $25,$2a,$73,$70,$72,$65,$63,$69
	.dc.b $73,$69,$6f,$6e,$3a,$20,$25,$75
	.dc.b $0a
	.dc.b $00				
_?LC57:						
	.dc.b $25,$2a,$73,$73,$68,$69,$66,$74
	.dc.b $3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC58:						
	.dc.b $25,$2a,$73,$63,$6f,$65,$66,$66
	.dc.b $69,$63,$69,$65,$6e,$74,$73,$3a
	.dc.b $0a
	.dc.b $00				
_?LC59:						
	.dc.b $25,$2a,$73,$63,$6f,$65,$66,$66
	.dc.b $69,$63,$69,$65,$6e,$74,$73,$5b
	.dc.b $25,$75,$5d,$3a,$20,$25,$64,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_subframe_lpc	
						
_miniflac_dump_subframe_lpc:			
	movem.l d3/d4/a3/a4,-(sp)		
	move.l 20(sp),a3			
	move.l 24(sp),d4			
						
	pea 140.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d4,d0				
	move.l d0,-(sp)				
	pea _?LC55				
	pea __iob+52				
	lea _fprintf,a4				
	jbsr (a4)				
	lea (20,sp),sp				
						
	addq.b #2,d4				
						
	and.l #255,d4				
	move.l (a3),d0				
	move.l _miniflac_subframe_lpc_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a4)				
						
	lea (16,sp),sp				
	move.l 4(a3),(sp)			
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a4)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 8(a3),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC56				
	pea __iob+52				
	jbsr (a4)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 9(a3),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC57				
	pea __iob+52				
	jbsr (a4)				
						
	lea (16,sp),sp				
	move.l #_?LC0,(sp)			
	move.l d4,-(sp)				
	pea _?LC58				
	pea __iob+52				
	jbsr (a4)				
	lea (16,sp),sp				
						
	addq.l #1,d4				
	lea (12,a3),a3				
						
	clr.l d3				
_?L26:						
						
	move.l (a3)+,-(sp)			
	move.l d3,-(sp)				
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC59				
	pea __iob+52				
	jbsr (a4)				
	lea (24,sp),sp				
						
	addq.l #1,d3				
						
	moveq #32,d0				
	cmp.l d3,d0				
	jbne _?L26				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
						
	.data					
_?LC60:						
	.dc.b $25,$2a,$73,$73,$75,$62,$66,$72
	.dc.b $61,$6d,$65,$20,$28,$25,$6c,$75
	.dc.b $20,$62,$79,$74,$65,$73,$29,$3a
	.dc.b $0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_subframe		
						
_miniflac_dump_subframe:			
	movem.l d3/d4/a3/a4,-(sp)		
	move.l 20(sp),a4			
	move.l 24(sp),d3			
						
	pea 212.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC60				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.b d3,d4				
	addq.b #2,d4				
						
	and.l #255,d4				
	move.l (a4),d0				
	move.l _miniflac_subframe_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 4(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC29				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l d4,(sp)				
	pea 6(a4)				
	jbsr _miniflac_dump_subframe_header	
	addq.l #8,sp				
						
	pea 4.w					
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC49				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #4,d3				
						
	and.l #255,d3				
	pea _?LC50				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	pea 8.w					
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC51				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l #_?LC52,(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 26(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	pea 8.w					
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC53				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l #_?LC54,(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 34(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l d4,(sp)				
	pea 38(a4)				
	jbsr _miniflac_dump_subframe_lpc	
	addq.l #8,sp				
						
	move.l d4,24(sp)			
						
	lea (178,a4),a4				
	move.l a4,20(sp)			
						
	movem.l (sp)+,d3/d4/a3/a4		
						
	jbra _miniflac_dump_residual		
						
	.data					
_?LC61:						
	.dc.b $25,$2a,$73,$66,$72,$61,$6d,$65
	.dc.b $20,$28,$25,$6c,$75,$20,$62,$79
	.dc.b $74,$65,$73,$29,$3a,$0a
	.dc.b $00				
_?LC62:						
	.dc.b $25,$2a,$73,$63,$75,$72,$5f,$73
	.dc.b $75,$62,$66,$72,$61,$6d,$65,$3a
	.dc.b $20,$25,$75,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_frame		
						
_miniflac_dump_frame:				
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a3			
	move.l 20(sp),d3			
						
	pea 254.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC61				
	pea __iob+52				
	lea _fprintf,a4				
	jbsr (a4)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l (a3),d0				
	move.l _miniflac_frame_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a4)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 4(a3),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC62				
	pea __iob+52				
	jbsr (a4)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.w 6(a3),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC19				
	pea __iob+52				
	jbsr (a4)				
						
	lea (16,sp),sp				
	move.l d3,(sp)				
	pea 12(a3)				
	jbsr _miniflac_dump_frame_header	
	addq.l #8,sp				
						
	move.l d3,20(sp)			
						
	lea (42,a3),a3				
	move.l a3,16(sp)			
						
	movem.l (sp)+,d3/a3/a4			
						
	jbra _miniflac_dump_subframe		
						
	.data					
_?LC63:						
	.dc.b $25,$2a,$73,$73,$74,$72,$65,$61
	.dc.b $6d,$69,$6e,$66,$6f,$3a,$20,$28
	.dc.b $25,$6c,$75,$20,$62,$79,$74,$65
	.dc.b $73,$29,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_streaminfo	
						
_miniflac_dump_streaminfo:			
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a4			
	move.l 20(sp),d3			
						
	pea 12.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC63				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l (a4),d0				
	move.l _miniflac_streaminfo_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 4(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 6(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC26				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 10(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC29				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.data					
_?LC64:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4d,$45,$54,$41,$44,$41,$54
	.dc.b $41,$5f,$55,$4e,$4b,$4e,$4f,$57
	.dc.b $4e
	.dc.b $00				
_?LC65:						
	.dc.b $25,$2a,$73,$68,$65,$61,$64,$65
	.dc.b $72,$20,$28,$25,$6c,$75,$20,$62
	.dc.b $79,$74,$65,$73,$29,$3a,$0a
	.dc.b $00				
_?LC66:						
	.dc.b $25,$2a,$73,$69,$73,$5f,$6c,$61
	.dc.b $73,$74,$3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC67:						
	.dc.b $25,$2a,$73,$74,$79,$70,$65,$3a
	.dc.b $20,$25,$73,$20,$0a
	.dc.b $00				
_?LC68:						
	.dc.b $25,$2a,$73,$6c,$65,$6e,$67,$74
	.dc.b $68,$3a,$20,$25,$75,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_metadata_header	
						
_miniflac_dump_metadata_header:			
	movem.l d3/d4/a3/a4,-(sp)		
	move.l 20(sp),a4			
	move.l 24(sp),d3			
						
	pea 14.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC65				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	move.l 6(a4),d0				
						
	moveq #127,d1				
	cmp.l d0,d1				
	jbeq _?L38				
	cmp.l #128,d0				
	jbeq _?L39				
						
	move.l _miniflac_metadata_type_str(d0.l*4),d4
						
	and.l #255,d3				
	clr.l d0				
	move.b 4(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC66				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 5(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC48				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l d4,(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC67				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 10(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC68				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L39:						
						
	clr.l d4				
						
	and.l #255,d3				
	clr.l d0				
	move.b 4(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC66				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 5(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC48				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l d4,(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC67				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 10(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC68				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L38:						
						
	move.l #_?LC64,d4			
						
	and.l #255,d3				
	clr.l d0				
	move.b 4(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC66				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 5(a4),d0				
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC48				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l d4,(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC67				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 10(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC68				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
						
	.data					
_?LC69:						
	.dc.b $25,$2a,$73,$6d,$65,$74,$61,$64
	.dc.b $61,$74,$61,$20,$28,$25,$6c,$75
	.dc.b $20,$62,$79,$74,$65,$73,$29,$3a
	.dc.b $0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_metadata		
						
_miniflac_dump_metadata:			
	movem.l d3/d4/a3/a4,-(sp)		
	move.l 20(sp),a4			
	move.l 24(sp),d3			
						
	pea 110.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC69				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.b d3,d4				
	addq.b #2,d4				
						
	and.l #255,d4				
	move.l (a4),d0				
	move.l _miniflac_metadata_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 4(a4),(sp)			
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l d4,(sp)				
	pea 8(a4)				
	jbsr _miniflac_dump_metadata_header	
						
	addq.l #4,sp				
	move.l d4,(sp)				
	pea 22(a4)				
	jbsr _miniflac_dump_streaminfo		
						
	addq.l #4,sp				
	move.l d4,(sp)				
	pea 34(a4)				
	jbsr _miniflac_dump_vorbis_comment	
	addq.l #8,sp				
						
	pea 12.w				
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC10				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #4,d3				
						
	and.l #255,d3				
	move.l 54(a4),d0			
	move.l _miniflac_picture_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 58(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC3				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 62(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l d4,(sp)				
	pea 66(a4)				
	jbsr _miniflac_dump_cuesheet		
	addq.l #8,sp				
						
	pea 12.w				
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC11				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.l 78(a4),d0			
	move.l _miniflac_seektable_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 82(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC3				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 86(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	pea 12.w				
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC1				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.l 90(a4),d0			
	move.l _miniflac_application_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 94(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC3				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 98(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
						
	.data					
_?LC70:						
	.dc.b $25,$2a,$73,$73,$74,$72,$65,$61
	.dc.b $6d,$6d,$61,$72,$6b,$65,$72,$20
	.dc.b $28,$25,$6c,$75,$20,$62,$79,$74
	.dc.b $65,$73,$29,$3a,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_streammarker	
						
_miniflac_dump_streammarker:			
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l 16(sp),d3			
						
	pea 4.w					
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC70				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.l 12(sp),a0			
	move.l (a0),d0				
	move.l _miniflac_streammarker_state_str(d0.l*4),-(sp)
	pea _?LC0				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.l (sp)+,d3				
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_miniflac_dump_oggheader	
						
_miniflac_dump_oggheader:			
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l 16(sp),d3			
						
	pea 4.w					
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC65				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.l 12(sp),a0			
	move.l (a0),d0				
	move.l _miniflac_oggheader_state_str(d0.l*4),-(sp)
	pea _?LC0				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.l (sp)+,d3				
	move.l (sp)+,a3				
	rts					
						
	.data					
_?LC71:						
	.dc.b $25,$2a,$73,$6f,$67,$67,$20,$28
	.dc.b $25,$6c,$75,$20,$62,$79,$74,$65
	.dc.b $73,$29,$3a,$0a
	.dc.b $00				
_?LC72:						
	.dc.b $25,$2a,$73,$76,$65,$72,$73,$69
	.dc.b $6f,$6e,$3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC73:						
	.dc.b $25,$2a,$73,$68,$65,$61,$64,$65
	.dc.b $72,$74,$79,$70,$65,$3a,$20,$25
	.dc.b $75,$0a
	.dc.b $00				
_?LC74:						
	.dc.b $25,$2a,$73,$63,$6f,$6e,$74,$69
	.dc.b $6e,$75,$61,$74,$69,$6f,$6e,$3a
	.dc.b $20,$25,$64,$0a
	.dc.b $00				
_?LC75:						
	.dc.b $25,$2a,$73,$62,$5f,$6f,$5f,$73
	.dc.b $3a,$20,$25,$64,$0a
	.dc.b $00				
_?LC76:						
	.dc.b $25,$2a,$73,$65,$5f,$6f,$5f,$73
	.dc.b $3a,$20,$25,$64,$0a
	.dc.b $00				
_?LC77:						
	.dc.b $25,$2a,$73,$67,$72,$61,$6e,$75
	.dc.b $6c,$65,$70,$6f,$73,$3a,$20,$25
	.dc.b $6c,$64,$0a
	.dc.b $00				
_?LC78:						
	.dc.b $25,$2a,$73,$73,$65,$72,$69,$61
	.dc.b $6c,$6e,$6f,$3a,$20,$25,$64,$0a
	.dc.b $00				
_?LC79:						
	.dc.b $25,$2a,$73,$70,$61,$67,$65,$6e
	.dc.b $6f,$3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC80:						
	.dc.b $25,$2a,$73,$73,$65,$67,$6d,$65
	.dc.b $6e,$74,$73,$3a,$20,$25,$75,$0a
	.dc.b $00				
_?LC81:						
	.dc.b $25,$2a,$73,$63,$75,$72,$73,$65
	.dc.b $67,$3a,$20,$25,$75,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_ogg		
						
_miniflac_dump_ogg:				
	movem.l d3/d4/a3/a4/a5,-(sp)		
	move.l 24(sp),a4			
	move.l 28(sp),d3			
						
	pea 56.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d3,d0				
	move.l d0,-(sp)				
	pea _?LC71				
	pea __iob+52				
	lea _fprintf,a3				
	jbsr (a3)				
	lea (20,sp),sp				
						
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l a4,a5				
	move.l (a5)+,d0				
	move.l _miniflac_ogg_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l d3,(sp)				
	move.l a5,-(sp)				
	jbsr _miniflac_dump_bitreader		
	addq.l #8,sp				
						
	clr.l d0				
	move.b 32(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC72				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 33(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC73				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	move.l d3,d4				
	addq.l #2,d4				
	move.b 33(a4),d0			
	and.b #1,d0				
	moveq #1,d1				
	and.l d0,d1				
	move.l d1,-(sp)				
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC74				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	bfextu 33(a4){#6:#1},d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC75				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	bfextu 33(a4){#5:#1},d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC76				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 38(a4),(sp)			
	move.l 34(a4),-(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC77				
	pea __iob+52				
	jbsr (a3)				
						
	lea (20,sp),sp				
	move.l 42(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC78				
	pea __iob+52				
	jbsr (a3)				
						
	lea (16,sp),sp				
	move.l 46(a4),(sp)			
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC79				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 50(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC80				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.b 51(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC81				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.w 52(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC68				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	clr.l d0				
	move.w 54(a4),d0			
	move.l d0,-(sp)				
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC4				
	pea __iob+52				
	jbsr (a3)				
	lea (20,sp),sp				
						
	movem.l (sp)+,d3/d4/a3/a4/a5		
	rts					
						
	.data					
_?LC82:						
	.dc.b $25,$2a,$73,$6d,$69,$6e,$69,$66
	.dc.b $6c,$61,$63,$20,$28,$25,$6c,$75
	.dc.b $20,$62,$79,$74,$65,$73,$29,$3a
	.dc.b $0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_dump_flac		
						
_miniflac_dump_flac:				
	movem.l d3/d4/a3/a4,-(sp)		
	move.l 20(sp),a3			
	move.l 24(sp),d4			
						
	pea 470.w				
	pea _?LC0				
	moveq #0,d0				
	not.b d0				
	and.l d4,d0				
	move.l d0,-(sp)				
	pea _?LC82				
	pea __iob+52				
	lea _fprintf,a4				
	jbsr (a4)				
	lea (20,sp),sp				
						
	move.b d4,d3				
	addq.b #2,d3				
						
	and.l #255,d3				
	move.l (a3),d0				
	move.l _miniflac_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a4)				
						
	lea (16,sp),sp				
	move.l d3,(sp)				
	pea 8(a3)				
	jbsr _miniflac_dump_bitreader		
						
	addq.l #4,sp				
	move.l d3,(sp)				
	pea 36(a3)				
	jbsr _miniflac_dump_ogg			
	addq.l #8,sp				
						
	pea 4.w					
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC65				
	pea __iob+52				
	jbsr (a4)				
	lea (20,sp),sp				
						
	addq.b #4,d4				
						
	and.l #255,d4				
	move.l 92(a3),d0			
	move.l _miniflac_oggheader_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a4)				
	lea (20,sp),sp				
						
	pea 4.w					
	pea _?LC0				
	move.l d3,-(sp)				
	pea _?LC70				
	pea __iob+52				
	jbsr (a4)				
	lea (20,sp),sp				
						
	move.l 96(a3),d0			
	move.l _miniflac_streammarker_state_str(d0.l*4),-(sp)
	pea _?LC0				
	move.l d4,-(sp)				
	pea _?LC2				
	pea __iob+52				
	jbsr (a4)				
						
	lea (16,sp),sp				
	move.l d3,(sp)				
	pea 100(a3)				
	jbsr _miniflac_dump_metadata		
	addq.l #8,sp				
						
	move.l d3,24(sp)			
						
	lea (210,a3),a3				
	move.l a3,20(sp)			
						
	movem.l (sp)+,d3/d4/a3/a4		
						
	jbra _miniflac_dump_frame		
						
	.data					
_?LC83:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$49
	.dc.b $4e,$46,$4f,$5f,$4d,$49,$4e,$42
	.dc.b $4c,$4f,$43,$4b,$53,$49,$5a,$45
	.dc.b $00				
_?LC84:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$49
	.dc.b $4e,$46,$4f,$5f,$4d,$41,$58,$42
	.dc.b $4c,$4f,$43,$4b,$53,$49,$5a,$45
	.dc.b $00				
_?LC85:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$49
	.dc.b $4e,$46,$4f,$5f,$4d,$49,$4e,$46
	.dc.b $52,$41,$4d,$45,$53,$49,$5a,$45
	.dc.b $00				
_?LC86:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$49
	.dc.b $4e,$46,$4f,$5f,$4d,$41,$58,$46
	.dc.b $52,$41,$4d,$45,$53,$49,$5a,$45
	.dc.b $00				
_?LC87:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$49
	.dc.b $4e,$46,$4f,$5f,$53,$41,$4d,$50
	.dc.b $4c,$45,$52,$41,$54,$45
	.dc.b $00				
_?LC88:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$49
	.dc.b $4e,$46,$4f,$5f,$43,$48,$41,$4e
	.dc.b $4e,$45,$4c,$53
	.dc.b $00				
_?LC89:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$49
	.dc.b $4e,$46,$4f,$5f,$42,$50,$53
	.dc.b $00				
_?LC90:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$49
	.dc.b $4e,$46,$4f,$5f,$54,$4f,$54,$41
	.dc.b $4c,$53,$41,$4d,$50,$4c,$45,$53
	.dc.b $00				
_?LC91:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$49
	.dc.b $4e,$46,$4f,$5f,$4d,$44,$35,$5f
	.dc.b $31
	.dc.b $00				
_?LC92:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$49
	.dc.b $4e,$46,$4f,$5f,$4d,$44,$35,$5f
	.dc.b $32
	.dc.b $00				
_?LC93:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$49
	.dc.b $4e,$46,$4f,$5f,$4d,$44,$35,$5f
	.dc.b $33
	.dc.b $00				
_?LC94:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$49
	.dc.b $4e,$46,$4f,$5f,$4d,$44,$35,$5f
	.dc.b $34
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_streaminfo_state_str:			
	.dc.l	_?LC83				
	.dc.l	_?LC84				
	.dc.l	_?LC85				
	.dc.l	_?LC86				
	.dc.l	_?LC87				
	.dc.l	_?LC88				
	.dc.l	_?LC89				
	.dc.l	_?LC90				
	.dc.l	_?LC91				
	.dc.l	_?LC92				
	.dc.l	_?LC93				
	.dc.l	_?LC94				
	.data					
_?LC95:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$52,$45,$53,$49,$44,$55,$41
	.dc.b $4c,$5f,$43,$4f,$44,$49,$4e,$47
	.dc.b $5f,$4d,$45,$54,$48,$4f,$44
	.dc.b $00				
_?LC96:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$52,$45,$53,$49,$44,$55,$41
	.dc.b $4c,$5f,$50,$41,$52,$54,$49,$54
	.dc.b $49,$4f,$4e,$5f,$4f,$52,$44,$45
	.dc.b $52
	.dc.b $00				
_?LC97:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$52,$45,$53,$49,$44,$55,$41
	.dc.b $4c,$5f,$52,$49,$43,$45,$5f,$50
	.dc.b $41,$52,$41,$4d,$45,$54,$45,$52
	.dc.b $00				
_?LC98:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$52,$45,$53,$49,$44,$55,$41
	.dc.b $4c,$5f,$52,$49,$43,$45,$5f,$53
	.dc.b $49,$5a,$45
	.dc.b $00				
_?LC99:						
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$52,$45,$53,$49,$44,$55,$41
	.dc.b $4c,$5f,$52,$49,$43,$45,$5f,$56
	.dc.b $41,$4c,$55,$45
	.dc.b $00				
_?LC100:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$52,$45,$53,$49,$44,$55,$41
	.dc.b $4c,$5f,$4d,$53,$42
	.dc.b $00				
_?LC101:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$52,$45,$53,$49,$44,$55,$41
	.dc.b $4c,$5f,$4c,$53,$42
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_residual_state_str:			
	.dc.l	_?LC95				
	.dc.l	_?LC96				
	.dc.l	_?LC97				
	.dc.l	_?LC98				
	.dc.l	_?LC99				
	.dc.l	_?LC100				
	.dc.l	_?LC101				
	.data					
_?LC102:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$4c,$50,$43,$5f,$50,$52
	.dc.b $45,$43,$49,$53,$49,$4f,$4e
	.dc.b $00				
_?LC103:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$4c,$50,$43,$5f,$53,$48
	.dc.b $49,$46,$54
	.dc.b $00				
_?LC104:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$4c,$50,$43,$5f,$43,$4f
	.dc.b $45,$46,$46
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_subframe_lpc_state_str:		
	.dc.l	_?LC102				
	.dc.l	_?LC103				
	.dc.l	_?LC104				
	.data					
_?LC105:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$48,$45,$41,$44,$45,$52
	.dc.b $5f,$52,$45,$53,$45,$52,$56,$45
	.dc.b $42,$49,$54,$31
	.dc.b $00				
_?LC106:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$48,$45,$41,$44,$45,$52
	.dc.b $5f,$4b,$49,$4e,$44
	.dc.b $00				
_?LC107:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$48,$45,$41,$44,$45,$52
	.dc.b $5f,$57,$41,$53,$54,$45,$44,$5f
	.dc.b $42,$49,$54,$53
	.dc.b $00				
_?LC108:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$48,$45,$41,$44,$45,$52
	.dc.b $5f,$55,$4e,$41,$52,$59
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_subframe_header_state_str:		
	.dc.l	_?LC105				
	.dc.l	_?LC106				
	.dc.l	_?LC107				
	.dc.l	_?LC108				
	.data					
_?LC109:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4d,$45,$54,$41,$44,$41,$54
	.dc.b $41,$5f,$48,$45,$41,$44,$45,$52
	.dc.b $00				
_?LC110:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4d,$45,$54,$41,$44,$41,$54
	.dc.b $41,$5f,$44,$41,$54,$41
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_metadata_state_str:			
	.dc.l	_?LC109				
	.dc.l	_?LC110				
	.data					
_?LC111:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4d,$45,$54,$41,$44,$41,$54
	.dc.b $41,$5f,$53,$54,$52,$45,$41,$4d
	.dc.b $49,$4e,$46,$4f
	.dc.b $00				
_?LC112:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4d,$45,$54,$41,$44,$41,$54
	.dc.b $41,$5f,$50,$41,$44,$44,$49,$4e
	.dc.b $47
	.dc.b $00				
_?LC113:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4d,$45,$54,$41,$44,$41,$54
	.dc.b $41,$5f,$41,$50,$50,$4c,$49,$43
	.dc.b $41,$54,$49,$4f,$4e,$4d,$49,$4e
	.dc.b $49,$46,$4c,$41,$43,$5f,$4d,$45
	.dc.b $54,$41,$44,$41,$54,$41,$5f,$53
	.dc.b $45,$45,$4b,$54,$41,$42,$4c,$45
	.dc.b $00				
_?LC114:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4d,$45,$54,$41,$44,$41,$54
	.dc.b $41,$5f,$56,$4f,$52,$42,$49,$53
	.dc.b $5f,$43,$4f,$4d,$4d,$45,$4e,$54
	.dc.b $00				
_?LC115:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4d,$45,$54,$41,$44,$41,$54
	.dc.b $41,$5f,$43,$55,$45,$53,$48,$45
	.dc.b $45,$54
	.dc.b $00				
_?LC116:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4d,$45,$54,$41,$44,$41,$54
	.dc.b $41,$5f,$50,$49,$43,$54,$55,$52
	.dc.b $45
	.dc.b $00				
_?LC117:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4d,$45,$54,$41,$44,$41,$54
	.dc.b $41,$5f,$49,$4e,$56,$41,$4c,$49
	.dc.b $44
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_metadata_type_str:			
	.dc.l	_?LC111				
	.dc.l	_?LC112				
	.dc.l	_?LC113				
	.dc.l	_?LC114				
	.dc.l	_?LC115				
	.dc.l	_?LC116				
	.dc.l	_?LC117				
	.dc.l	_?LC64				
	.data					
_?LC118:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$54,$59,$50,$45,$5f,$55
	.dc.b $4e,$4b,$4e,$4f,$57,$4e
	.dc.b $00				
_?LC119:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$54,$59,$50,$45,$5f,$43
	.dc.b $4f,$4e,$53,$54,$41,$4e,$54
	.dc.b $00				
_?LC120:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$54,$59,$50,$45,$5f,$46
	.dc.b $49,$58,$45,$44
	.dc.b $00				
_?LC121:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$54,$59,$50,$45,$5f,$4c
	.dc.b $50,$43
	.dc.b $00				
_?LC122:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$54,$59,$50,$45,$5f,$56
	.dc.b $45,$52,$42,$41,$54,$49,$4d
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_subframe_header_type_str:		
	.dc.l	_?LC118				
	.dc.l	_?LC119				
	.dc.l	_?LC120				
	.dc.l	_?LC121				
	.dc.l	_?LC122				
	.data					
_?LC123:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$48,$45,$41,$44,$45,$52
	.dc.b $00				
_?LC124:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$43,$4f,$4e,$53,$54,$41
	.dc.b $4e,$54
	.dc.b $00				
_?LC125:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$56,$45,$52,$42,$41,$54
	.dc.b $49,$4d
	.dc.b $00				
_?LC126:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$46,$49,$58,$45,$44
	.dc.b $00				
_?LC127:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$55,$42,$46,$52,$41,$4d
	.dc.b $45,$5f,$4c,$50,$43
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_subframe_state_str:			
	.dc.l	_?LC123				
	.dc.l	_?LC124				
	.dc.l	_?LC125				
	.dc.l	_?LC126				
	.dc.l	_?LC127				
	.data					
_?LC128:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$48,$41,$53,$53,$47,$4e
	.dc.b $5f,$4e,$4f,$4e,$45
	.dc.b $00				
_?LC129:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$48,$41,$53,$53,$47,$4e
	.dc.b $5f,$4c,$45,$46,$54,$5f,$53,$49
	.dc.b $44,$45
	.dc.b $00				
_?LC130:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$48,$41,$53,$53,$47,$4e
	.dc.b $5f,$52,$49,$47,$48,$54,$5f,$53
	.dc.b $49,$44,$45
	.dc.b $00				
_?LC131:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$48,$41,$53,$53,$47,$4e
	.dc.b $5f,$4d,$49,$44,$5f,$53,$49,$44
	.dc.b $45
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_chassgn_str:				
	.dc.l	_?LC128				
	.dc.l	_?LC129				
	.dc.l	_?LC130				
	.dc.l	_?LC131				
	.data					
_?LC132:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$53,$59
	.dc.b $4e,$43
	.dc.b $00				
_?LC133:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$52,$45
	.dc.b $53,$45,$52,$56,$45,$42,$49,$54
	.dc.b $5f,$31
	.dc.b $00				
_?LC134:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$42,$4c
	.dc.b $4f,$43,$4b,$49,$4e,$47,$53,$54
	.dc.b $52,$41,$54,$45,$47,$59
	.dc.b $00				
_?LC135:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$42,$4c
	.dc.b $4f,$43,$4b,$53,$49,$5a,$45
	.dc.b $00				
_?LC136:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$53,$41
	.dc.b $4d,$50,$4c,$45,$52,$41,$54,$45
	.dc.b $00				
_?LC137:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$43,$48
	.dc.b $41,$4e,$4e,$45,$4c,$41,$53,$53
	.dc.b $49,$47,$4e,$4d,$45,$4e,$54
	.dc.b $00				
_?LC138:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$53,$41
	.dc.b $4d,$50,$4c,$45,$53,$49,$5a,$45
	.dc.b $00				
_?LC139:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$52,$45
	.dc.b $53,$45,$52,$56,$45,$42,$49,$54
	.dc.b $5f,$32
	.dc.b $00				
_?LC140:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$53,$41
	.dc.b $4d,$50,$4c,$45,$4e,$55,$4d,$42
	.dc.b $45,$52,$5f,$31
	.dc.b $00				
_?LC141:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$53,$41
	.dc.b $4d,$50,$4c,$45,$4e,$55,$4d,$42
	.dc.b $45,$52,$5f,$32
	.dc.b $00				
_?LC142:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$53,$41
	.dc.b $4d,$50,$4c,$45,$4e,$55,$4d,$42
	.dc.b $45,$52,$5f,$33
	.dc.b $00				
_?LC143:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$53,$41
	.dc.b $4d,$50,$4c,$45,$4e,$55,$4d,$42
	.dc.b $45,$52,$5f,$34
	.dc.b $00				
_?LC144:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$53,$41
	.dc.b $4d,$50,$4c,$45,$4e,$55,$4d,$42
	.dc.b $45,$52,$5f,$35
	.dc.b $00				
_?LC145:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$53,$41
	.dc.b $4d,$50,$4c,$45,$4e,$55,$4d,$42
	.dc.b $45,$52,$5f,$36
	.dc.b $00				
_?LC146:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$53,$41
	.dc.b $4d,$50,$4c,$45,$4e,$55,$4d,$42
	.dc.b $45,$52,$5f,$37
	.dc.b $00				
_?LC147:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$42,$4c
	.dc.b $4f,$43,$4b,$53,$49,$5a,$45,$5f
	.dc.b $4d,$41,$59,$42,$45
	.dc.b $00				
_?LC148:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$53,$41
	.dc.b $4d,$50,$4c,$45,$52,$41,$54,$45
	.dc.b $5f,$4d,$41,$59,$42,$45
	.dc.b $00				
_?LC149:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52,$5f,$43,$52
	.dc.b $43,$38
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_frame_header_state_str:		
	.dc.l	_?LC132				
	.dc.l	_?LC133				
	.dc.l	_?LC134				
	.dc.l	_?LC135				
	.dc.l	_?LC136				
	.dc.l	_?LC137				
	.dc.l	_?LC138				
	.dc.l	_?LC139				
	.dc.l	_?LC140				
	.dc.l	_?LC141				
	.dc.l	_?LC142				
	.dc.l	_?LC143				
	.dc.l	_?LC144				
	.dc.l	_?LC145				
	.dc.l	_?LC146				
	.dc.l	_?LC147				
	.dc.l	_?LC148				
	.dc.l	_?LC149				
	.data					
_?LC150:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$48,$45,$41,$44
	.dc.b $45,$52,$5f,$50,$41,$43,$4b,$45
	.dc.b $54,$54,$59,$50,$45
	.dc.b $00				
_?LC151:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$48,$45,$41,$44
	.dc.b $45,$52,$5f,$46
	.dc.b $00				
_?LC152:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$48,$45,$41,$44
	.dc.b $45,$52,$5f,$4c
	.dc.b $00				
_?LC153:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$48,$45,$41,$44
	.dc.b $45,$52,$5f,$41
	.dc.b $00				
_?LC154:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$48,$45,$41,$44
	.dc.b $45,$52,$5f,$43
	.dc.b $00				
_?LC155:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$48,$45,$41,$44
	.dc.b $45,$52,$5f,$4d,$41,$4a,$4f,$52
	.dc.b $00				
_?LC156:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$48,$45,$41,$44
	.dc.b $45,$52,$5f,$4d,$49,$4e,$4f,$52
	.dc.b $00				
_?LC157:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$48,$45,$41,$44
	.dc.b $45,$52,$5f,$48,$45,$41,$44,$45
	.dc.b $52,$50,$41,$43,$4b,$45,$54,$53
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_oggheader_state_str:			
	.dc.l	_?LC150				
	.dc.l	_?LC151				
	.dc.l	_?LC152				
	.dc.l	_?LC153				
	.dc.l	_?LC154				
	.dc.l	_?LC155				
	.dc.l	_?LC156				
	.dc.l	_?LC157				
	.data					
_?LC158:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$4d
	.dc.b $41,$52,$4b,$45,$52,$5f,$46
	.dc.b $00				
_?LC159:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$4d
	.dc.b $41,$52,$4b,$45,$52,$5f,$4c
	.dc.b $00				
_?LC160:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$4d
	.dc.b $41,$52,$4b,$45,$52,$5f,$41
	.dc.b $00				
_?LC161:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$4d
	.dc.b $41,$52,$4b,$45,$52,$5f,$43
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_streammarker_state_str:		
	.dc.l	_?LC158				
	.dc.l	_?LC159				
	.dc.l	_?LC160				
	.dc.l	_?LC161				
	.data					
_?LC162:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$5f,$43,$41,$50
	.dc.b $54,$55,$52,$45,$50,$41,$54,$54
	.dc.b $45,$52,$4e,$5f,$4f
	.dc.b $00				
_?LC163:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$5f,$43,$41,$50
	.dc.b $54,$55,$52,$45,$50,$41,$54,$54
	.dc.b $45,$52,$4e,$5f,$47,$31
	.dc.b $00				
_?LC164:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$5f,$43,$41,$50
	.dc.b $54,$55,$52,$45,$50,$41,$54,$54
	.dc.b $45,$52,$4e,$5f,$47,$32
	.dc.b $00				
_?LC165:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$5f,$43,$41,$50
	.dc.b $54,$55,$52,$45,$50,$41,$54,$54
	.dc.b $45,$52,$4e,$5f,$53
	.dc.b $00				
_?LC166:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$5f,$56,$45,$52
	.dc.b $53,$49,$4f,$4e
	.dc.b $00				
_?LC167:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$5f,$48,$45,$41
	.dc.b $44,$45,$52,$54,$59,$50,$45
	.dc.b $00				
_?LC168:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$5f,$47,$52,$41
	.dc.b $4e,$55,$4c,$45,$50,$4f,$53
	.dc.b $00				
_?LC169:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$5f,$53,$45,$52
	.dc.b $49,$41,$4c,$4e,$4f
	.dc.b $00				
_?LC170:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$5f,$50,$41,$47
	.dc.b $45,$4e,$4f
	.dc.b $00				
_?LC171:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$5f,$43,$48,$45
	.dc.b $43,$4b,$53,$55,$4d
	.dc.b $00				
_?LC172:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$5f,$50,$41,$47
	.dc.b $45,$53,$45,$47,$4d,$45,$4e,$54
	.dc.b $53
	.dc.b $00				
_?LC173:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$5f,$53,$45,$47
	.dc.b $4d,$45,$4e,$54,$54,$41,$42,$4c
	.dc.b $45
	.dc.b $00				
_?LC174:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$5f,$44,$41,$54
	.dc.b $41
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_ogg_state_str:			
	.dc.l	_?LC162				
	.dc.l	_?LC163				
	.dc.l	_?LC164				
	.dc.l	_?LC165				
	.dc.l	_?LC166				
	.dc.l	_?LC167				
	.dc.l	_?LC168				
	.dc.l	_?LC169				
	.dc.l	_?LC170				
	.dc.l	_?LC171				
	.dc.l	_?LC172				
	.dc.l	_?LC173				
	.dc.l	_?LC174				
	.data					
_?LC175:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52
	.dc.b $00				
_?LC176:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$53
	.dc.b $55,$42,$46,$52,$41,$4d,$45
	.dc.b $00				
_?LC177:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$46
	.dc.b $4f,$4f,$54,$45,$52
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_frame_state_str:			
	.dc.l	_?LC175				
	.dc.l	_?LC176				
	.dc.l	_?LC177				
	.data					
_?LC178:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4f,$47,$47,$48,$45,$41,$44
	.dc.b $45,$52
	.dc.b $00				
_?LC179:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$4d
	.dc.b $41,$52,$4b,$45,$52,$5f,$4f,$52
	.dc.b $5f,$46,$52,$41,$4d,$45
	.dc.b $00				
_?LC180:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$54,$52,$45,$41,$4d,$4d
	.dc.b $41,$52,$4b,$45,$52
	.dc.b $00				
_?LC181:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4d,$45,$54,$41,$44,$41,$54
	.dc.b $41,$5f,$4f,$52,$5f,$46,$52,$41
	.dc.b $4d,$45
	.dc.b $00				
_?LC182:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$4d,$45,$54,$41,$44,$41,$54
	.dc.b $41
	.dc.b $00				
_?LC183:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_state_str:				
	.dc.l	_?LC178				
	.dc.l	_?LC179				
	.dc.l	_?LC180				
	.dc.l	_?LC181				
	.dc.l	_?LC182				
	.dc.l	_?LC183				
	.data					
_?LC184:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$56,$4f,$52,$42,$49,$53,$43
	.dc.b $4f,$4d,$4d,$45,$4e,$54,$5f,$56
	.dc.b $45,$4e,$44,$4f,$52,$5f,$4c,$45
	.dc.b $4e,$47,$54,$48
	.dc.b $00				
_?LC185:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$56,$4f,$52,$42,$49,$53,$43
	.dc.b $4f,$4d,$4d,$45,$4e,$54,$5f,$56
	.dc.b $45,$4e,$44,$4f,$52,$5f,$53,$54
	.dc.b $52,$49,$4e,$47
	.dc.b $00				
_?LC186:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$56,$4f,$52,$42,$49,$53,$43
	.dc.b $4f,$4d,$4d,$45,$4e,$54,$5f,$54
	.dc.b $4f,$54,$41,$4c,$5f,$43,$4f,$4d
	.dc.b $4d,$45,$4e,$54,$53
	.dc.b $00				
_?LC187:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$56,$4f,$52,$42,$49,$53,$43
	.dc.b $4f,$4d,$4d,$45,$4e,$54,$5f,$43
	.dc.b $4f,$4d,$4d,$45,$4e,$54,$5f,$4c
	.dc.b $45,$4e,$47,$54,$48
	.dc.b $00				
_?LC188:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$56,$4f,$52,$42,$49,$53,$43
	.dc.b $4f,$4d,$4d,$45,$4e,$54,$5f,$43
	.dc.b $4f,$4d,$4d,$45,$4e,$54,$5f,$53
	.dc.b $54,$52,$49,$4e,$47
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_vorbis_comment_state_str:		
	.dc.l	_?LC184				
	.dc.l	_?LC185				
	.dc.l	_?LC186				
	.dc.l	_?LC187				
	.dc.l	_?LC188				
	.data					
_?LC189:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$45,$45,$4b,$54,$41,$42
	.dc.b $4c,$45,$5f,$53,$41,$4d,$50,$4c
	.dc.b $45,$5f,$4e,$55,$4d,$42,$45,$52
	.dc.b $00				
_?LC190:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$45,$45,$4b,$54,$41,$42
	.dc.b $4c,$45,$5f,$53,$41,$4d,$50,$4c
	.dc.b $45,$5f,$4f,$46,$46,$53,$45,$54
	.dc.b $00				
_?LC191:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$53,$45,$45,$4b,$54,$41,$42
	.dc.b $4c,$45,$5f,$53,$41,$4d,$50,$4c
	.dc.b $45,$53
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_seektable_state_str:			
	.dc.l	_?LC189				
	.dc.l	_?LC190				
	.dc.l	_?LC191				
	.data					
_?LC192:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$50,$49,$43,$54,$55,$52,$45
	.dc.b $5f,$54,$59,$50,$45
	.dc.b $00				
_?LC193:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$50,$49,$43,$54,$55,$52,$45
	.dc.b $5f,$4d,$49,$4d,$45,$5f,$4c,$45
	.dc.b $4e,$47,$54,$48
	.dc.b $00				
_?LC194:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$50,$49,$43,$54,$55,$52,$45
	.dc.b $5f,$4d,$49,$4d,$45,$5f,$53,$54
	.dc.b $52,$49,$4e,$47
	.dc.b $00				
_?LC195:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$50,$49,$43,$54,$55,$52,$45
	.dc.b $5f,$44,$45,$53,$43,$52,$49,$50
	.dc.b $54,$49,$4f,$4e,$5f,$4c,$45,$4e
	.dc.b $47,$54,$48
	.dc.b $00				
_?LC196:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$50,$49,$43,$54,$55,$52,$45
	.dc.b $5f,$44,$45,$53,$43,$52,$49,$50
	.dc.b $54,$49,$4f,$4e,$5f,$53,$54,$52
	.dc.b $49,$4e,$47
	.dc.b $00				
_?LC197:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$50,$49,$43,$54,$55,$52,$45
	.dc.b $5f,$57,$49,$44,$54,$48
	.dc.b $00				
_?LC198:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$50,$49,$43,$54,$55,$52,$45
	.dc.b $5f,$48,$45,$49,$47,$48,$54
	.dc.b $00				
_?LC199:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$50,$49,$43,$54,$55,$52,$45
	.dc.b $5f,$43,$4f,$4c,$4f,$52,$44,$45
	.dc.b $50,$54,$48
	.dc.b $00				
_?LC200:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$50,$49,$43,$54,$55,$52,$45
	.dc.b $5f,$54,$4f,$54,$41,$4c,$43,$4f
	.dc.b $4c,$4f,$52,$53
	.dc.b $00				
_?LC201:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$50,$49,$43,$54,$55,$52,$45
	.dc.b $5f,$50,$49,$43,$54,$55,$52,$45
	.dc.b $5f,$4c,$45,$4e,$47,$54,$48
	.dc.b $00				
_?LC202:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$50,$49,$43,$54,$55,$52,$45
	.dc.b $5f,$50,$49,$43,$54,$55,$52,$45
	.dc.b $5f,$44,$41,$54,$41
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_picture_state_str:			
	.dc.l	_?LC192				
	.dc.l	_?LC193				
	.dc.l	_?LC194				
	.dc.l	_?LC195				
	.dc.l	_?LC196				
	.dc.l	_?LC197				
	.dc.l	_?LC198				
	.dc.l	_?LC199				
	.dc.l	_?LC200				
	.dc.l	_?LC201				
	.dc.l	_?LC202				
	.data					
_?LC203:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$43,$41,$54,$41,$4c,$4f
	.dc.b $47
	.dc.b $00				
_?LC204:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$4c,$45,$41,$44,$49,$4e
	.dc.b $00				
_?LC205:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$43,$44,$46,$4c,$41,$47
	.dc.b $00				
_?LC206:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$53,$48,$45,$45,$54,$5f
	.dc.b $52,$45,$53,$45,$52,$56,$45
	.dc.b $00				
_?LC207:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$54,$52,$41,$43,$4b,$53
	.dc.b $00				
_?LC208:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$54,$52,$41,$43,$4b,$4f
	.dc.b $46,$46,$53,$45,$54
	.dc.b $00				
_?LC209:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$54,$52,$41,$43,$4b,$4e
	.dc.b $55,$4d,$42,$45,$52
	.dc.b $00				
_?LC210:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$54,$52,$41,$43,$4b,$49
	.dc.b $53,$52,$43
	.dc.b $00				
_?LC211:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$54,$52,$41,$43,$4b,$54
	.dc.b $59,$50,$45
	.dc.b $00				
_?LC212:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$54,$52,$41,$43,$4b,$50
	.dc.b $52,$45,$45,$4d,$50,$48
	.dc.b $00				
_?LC213:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$54,$52,$41,$43,$4b,$5f
	.dc.b $52,$45,$53,$45,$52,$56,$45
	.dc.b $00				
_?LC214:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$54,$52,$41,$43,$4b,$50
	.dc.b $4f,$49,$4e,$54,$53
	.dc.b $00				
_?LC215:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$49,$4e,$44,$45,$58,$5f
	.dc.b $4f,$46,$46,$53,$45,$54
	.dc.b $00				
_?LC216:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$49,$4e,$44,$45,$58,$5f
	.dc.b $4e,$55,$4d,$42,$45,$52
	.dc.b $00				
_?LC217:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$43,$55,$45,$53,$48,$45,$45
	.dc.b $54,$5f,$49,$4e,$44,$45,$58,$5f
	.dc.b $52,$45,$53,$45,$52,$56,$45
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_cuesheet_state_str:			
	.dc.l	_?LC203				
	.dc.l	_?LC204				
	.dc.l	_?LC205				
	.dc.l	_?LC206				
	.dc.l	_?LC207				
	.dc.l	_?LC208				
	.dc.l	_?LC209				
	.dc.l	_?LC210				
	.dc.l	_?LC211				
	.dc.l	_?LC212				
	.dc.l	_?LC213				
	.dc.l	_?LC214				
	.dc.l	_?LC215				
	.dc.l	_?LC216				
	.dc.l	_?LC217				
	.data					
_?LC218:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$41,$50,$50,$4c,$49,$43,$41
	.dc.b $54,$49,$4f,$4e,$5f,$49,$44
	.dc.b $00				
_?LC219:					
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$41,$50,$50,$4c,$49,$43,$41
	.dc.b $54,$49,$4f,$4e,$5f,$44,$41,$54
	.dc.b $41
	.dc.b $00				
	.data					
	.align	2				
						
						
_miniflac_application_state_str:		
	.dc.l	_?LC218				
	.dc.l	_?LC219				
						
