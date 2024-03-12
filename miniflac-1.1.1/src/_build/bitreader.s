* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"bitreader.c"			
						
						
						
						
						
	.text					
	.data					
_?LC0:						
	.dc.b $62,$69,$74,$72,$65,$61,$64,$65
	.dc.b $72,$2e,$63
	.dc.b $00				
_?LC1:						
	.dc.b $62,$69,$74,$73,$20,$3c,$3d,$20
	.dc.b $62,$72,$2d,$3e,$62,$69,$74,$73
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
						
_miniflac_bitreader_read?part?0:		
						
	pea 134.w				
	pea _?LC0				
	pea _?LC1				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.align	2				
	.globl	_miniflac_bitreader_init	
						
_miniflac_bitreader_init:			
	move.l 4(sp),a0				
						
	clr.l (a0)				
	clr.l 4(a0)				
						
	clr.w 8(a0)				
						
	clr.w 10(a0)				
						
	clr.l 12(a0)				
						
	clr.l 16(a0)				
						
	clr.l 20(a0)				
						
	clr.l 24(a0)				
						
	rts					
						
	.data					
_?LC3:						
	.dc.b $62,$69,$74,$73,$20,$3c,$3d,$20
	.dc.b $36,$34
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_bitreader_fill	
						
_miniflac_bitreader_fill:			
	lea (-28,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 68(sp),a0			
	move.l 72(sp),d7			
						
	cmp.b #64,d7				
	jbhi _?L28				
						
	tst.b d7				
	jbeq _?L11				
						
	move.b 8(a0),d3				
						
	cmp.b d7,d3				
	jbcc _?L8				
						
	move.l 16(a0),d6			
						
	move.l 12(a0),d4			
						
	cmp.l d6,d4				
	jbcc _?L8				
						
	move.l 20(a0),a2			
						
	move.l d4,d0				
	addq.l #1,d0				
	move.l d0,48(sp)			
	move.l d0,12(a0)			
						
	move.b (a2,d4.l),d5			
						
	move.l (a0),d0				
	move.l 4(a0),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,36(sp)			
	move.l d1,40(sp)			
						
	move.l d0,a4				
	or.b d5,d1				
	move.l d1,a5				
						
	move.l a4,(a0)				
	move.l a5,4(a0)				
						
	move.b d3,d1				
	addq.b #8,d1				
	move.b d1,63(sp)			
						
	lea _miniflac_crc8_table,a1		
						
	move.b 9(a0),d1				
	eor.b d5,d1				
	and.l #255,d1				
						
	move.b (a1,d1.l),52(sp)			
						
	clr.w d1				
	move.b 63(sp),d0			
	bfins d0,d1{#16:#8}			
	move.b 52(sp),d1			
	move.w d1,8(a0)				
						
	move.w 10(a0),58(sp)			
						
	lea _miniflac_crc16_table,a3		
						
	move.w 58(sp),d0			
	bfextu d0{#16:#8},d1			
						
	and.l #255,d5				
	eor.l d1,d5				
						
	move.w d0,d1				
	lsl.w #8,d1				
						
	move.w (a3,d5.l*2),d5			
	eor.w d1,d5				
	move.w d5,a6				
						
	move.w d5,10(a0)			
						
	move.l 24(a0),d5			
						
	move.l d5,d1				
	addq.l #1,d1				
	move.l d1,24(a0)			
						
	cmp.b 63(sp),d7				
	jbls _?L13				
	cmp.l 48(sp),d6				
	jbls _?L13				
						
	move.l d4,d0				
	addq.l #2,d0				
	move.l d0,56(sp)			
	move.l d0,12(a0)			
						
	move.l 48(sp),d1			
	move.b (a2,d1.l),48(sp)			
						
	move.l a4,d0				
	move.l a5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,36(sp)			
	move.l d1,40(sp)			
						
	move.l d0,a4				
	or.b 48(sp),d1				
	move.l d1,a5				
						
	move.l a4,(a0)				
	move.l a5,4(a0)				
						
	move.b d3,d1				
	add.b #16,d1				
	move.b d1,47(sp)			
						
	move.b 52(sp),d0			
	move.b 48(sp),d1			
	eor.b d1,d0				
	and.l #255,d0				
						
	move.b (a1,d0.l),60(sp)			
						
	clr.w d0				
	move.b 47(sp),d1			
	bfins d1,d0{#16:#8}			
	move.b 60(sp),d0			
	move.w d0,8(a0)				
						
	move.l a6,d1				
	bfextu d1{#16:#8},d0			
	move.l d0,52(sp)			
						
	clr.l d0				
	move.b 48(sp),d0			
	move.l 52(sp),d1			
	eor.l d1,d0				
						
	move.w a6,d1				
	lsl.w #8,d1				
						
	move.w (a3,d0.l*2),d0			
	eor.w d0,d1				
	move.w d1,a6				
						
	move.w d1,10(a0)			
						
	move.l d5,d0				
	addq.l #2,d0				
	move.l d0,24(a0)			
						
	cmp.b 47(sp),d7				
	jbls _?L25				
	cmp.l 56(sp),d6				
	jbls _?L25				
						
	move.l d4,d1				
	addq.l #3,d1				
	move.l d1,52(sp)			
	move.l d1,12(a0)			
						
	move.l 56(sp),d0			
	move.b (a2,d0.l),48(sp)			
						
	move.l a4,d0				
	move.l a5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,36(sp)			
	move.l d1,40(sp)			
						
	move.l d0,a4				
	or.b 48(sp),d1				
	move.l d1,a5				
						
	move.l a4,(a0)				
	move.l a5,4(a0)				
						
	move.b d3,d1				
	add.b #24,d1				
	move.b d1,47(sp)			
						
	move.b 60(sp),d0			
	move.b 48(sp),d1			
	eor.b d1,d0				
	and.l #255,d0				
						
	move.b (a1,d0.l),60(sp)			
						
	clr.w d0				
	move.b 47(sp),d1			
	bfins d1,d0{#16:#8}			
	move.b 60(sp),d0			
	move.w d0,8(a0)				
						
	move.l a6,d1				
	bfextu d1{#16:#8},d0			
	move.l d0,56(sp)			
						
	clr.l d0				
	move.b 48(sp),d0			
	move.l 56(sp),d1			
	eor.l d1,d0				
						
	move.w a6,d1				
	lsl.w #8,d1				
						
	move.w (a3,d0.l*2),d0			
	eor.w d0,d1				
	move.w d1,a6				
						
	move.w d1,10(a0)			
						
	move.l d5,d0				
	addq.l #3,d0				
	move.l d0,24(a0)			
						
	cmp.b 47(sp),d7				
	jbls _?L25				
	cmp.l 52(sp),d6				
	jbls _?L25				
						
	move.l d4,d1				
	addq.l #4,d1				
	move.l d1,56(sp)			
	move.l d1,12(a0)			
						
	move.l 52(sp),d0			
	move.b (a2,d0.l),48(sp)			
						
	move.l a4,d0				
	move.l a5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,36(sp)			
	move.l d1,40(sp)			
						
	move.l d0,a4				
	or.b 48(sp),d1				
	move.l d1,a5				
						
	move.l a4,(a0)				
	move.l a5,4(a0)				
						
	move.b d3,d1				
	add.b #32,d1				
	move.b d1,47(sp)			
						
	move.b 60(sp),d0			
	move.b 48(sp),d1			
	eor.b d1,d0				
	and.l #255,d0				
						
	move.b (a1,d0.l),60(sp)			
						
	clr.w d0				
	move.b 47(sp),d1			
	bfins d1,d0{#16:#8}			
	move.b 60(sp),d0			
	move.w d0,8(a0)				
						
	move.l a6,d1				
	bfextu d1{#16:#8},d0			
	move.l d0,52(sp)			
						
	clr.l d0				
	move.b 48(sp),d0			
	move.l 52(sp),d1			
	eor.l d1,d0				
						
	move.w a6,d1				
	lsl.w #8,d1				
						
	move.w (a3,d0.l*2),d0			
	eor.w d0,d1				
	move.w d1,a6				
						
	move.w d1,10(a0)			
						
	move.l d5,d0				
	addq.l #4,d0				
	move.l d0,24(a0)			
						
	cmp.b 47(sp),d7				
	jbls _?L25				
	cmp.l 56(sp),d6				
	jbls _?L25				
						
	move.l d4,d1				
	addq.l #5,d1				
	move.l d1,52(sp)			
	move.l d1,12(a0)			
						
	move.l 56(sp),d0			
	move.b (a2,d0.l),48(sp)			
						
	move.l a4,d0				
	move.l a5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,36(sp)			
	move.l d1,40(sp)			
						
	move.l d0,a4				
	or.b 48(sp),d1				
	move.l d1,a5				
						
	move.l a4,(a0)				
	move.l a5,4(a0)				
						
	move.b d3,d1				
	add.b #40,d1				
	move.b d1,47(sp)			
						
	move.b 60(sp),d0			
	move.b 48(sp),d1			
	eor.b d1,d0				
	and.l #255,d0				
						
	move.b (a1,d0.l),60(sp)			
						
	clr.w d0				
	move.b 47(sp),d1			
	bfins d1,d0{#16:#8}			
	move.b 60(sp),d0			
	move.w d0,8(a0)				
						
	move.l a6,d1				
	bfextu d1{#16:#8},d0			
	move.l d0,56(sp)			
						
	clr.l d0				
	move.b 48(sp),d0			
	move.l 56(sp),d1			
	eor.l d1,d0				
						
	move.w a6,d1				
	lsl.w #8,d1				
						
	move.w (a3,d0.l*2),d0			
	eor.w d0,d1				
	move.w d1,a6				
						
	move.w d1,10(a0)			
						
	move.l d5,d0				
	addq.l #5,d0				
	move.l d0,24(a0)			
						
	cmp.b 47(sp),d7				
	jbls _?L25				
	cmp.l 52(sp),d6				
	jbls _?L25				
						
	move.l d4,d1				
	addq.l #6,d1				
	move.l d1,56(sp)			
	move.l d1,12(a0)			
						
	move.l 52(sp),d0			
	move.b (a2,d0.l),48(sp)			
						
	move.l a4,d0				
	move.l a5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,36(sp)			
	move.l d1,40(sp)			
						
	move.l d0,a4				
	or.b 48(sp),d1				
	move.l d1,a5				
						
	move.l a4,(a0)				
	move.l a5,4(a0)				
						
	move.b d3,d1				
	add.b #48,d1				
	move.b d1,47(sp)			
						
	move.b 60(sp),d0			
	move.b 48(sp),d1			
	eor.b d1,d0				
	and.l #255,d0				
						
	move.b (a1,d0.l),60(sp)			
						
	clr.w d0				
	move.b 47(sp),d1			
	bfins d1,d0{#16:#8}			
	move.b 60(sp),d0			
	move.w d0,8(a0)				
						
	move.l a6,d1				
	bfextu d1{#16:#8},d0			
	move.l d0,52(sp)			
						
	clr.l d0				
	move.b 48(sp),d0			
	move.l 52(sp),d1			
	eor.l d1,d0				
						
	move.w a6,d1				
	lsl.w #8,d1				
						
	move.w (a3,d0.l*2),d0			
	eor.w d0,d1				
	move.w d1,a6				
						
	move.w d1,10(a0)			
						
	move.l d5,d0				
	addq.l #6,d0				
	move.l d0,24(a0)			
						
	cmp.b 47(sp),d7				
	jbls _?L25				
	cmp.l 56(sp),d6				
	jbls _?L25				
						
	move.l d4,d1				
	addq.l #7,d1				
	move.l d1,52(sp)			
	move.l d1,12(a0)			
						
	move.l 56(sp),d0			
	move.b (a2,d0.l),48(sp)			
						
	move.l a4,d0				
	move.l a5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,36(sp)			
	move.l d1,40(sp)			
						
	move.l d0,a4				
	or.b 48(sp),d1				
	move.l d1,a5				
						
	move.l a4,(a0)				
	move.l a5,4(a0)				
						
	move.b d3,d1				
	add.b #56,d1				
	move.b d1,47(sp)			
						
	move.b 60(sp),d0			
	move.b 48(sp),d1			
	eor.b d1,d0				
	and.l #255,d0				
						
	move.b (a1,d0.l),56(sp)			
						
	clr.w d0				
	move.b 47(sp),d1			
	bfins d1,d0{#16:#8}			
	move.b 56(sp),d0			
	move.w d0,8(a0)				
						
	move.l a6,d1				
	bfextu d1{#16:#8},d0			
	move.l d0,60(sp)			
						
	clr.l d0				
	move.b 48(sp),d0			
	move.l 60(sp),d1			
	eor.l d1,d0				
						
	move.w a6,d1				
	lsl.w #8,d1				
						
	move.w (a3,d0.l*2),d0			
	eor.w d0,d1				
	move.w d1,a6				
						
	move.w d1,10(a0)			
						
	move.l d5,d0				
	addq.l #7,d0				
	move.l d0,24(a0)			
						
	cmp.b 47(sp),d7				
	jbls _?L25				
	cmp.l 52(sp),d6				
	jbls _?L25				
						
	addq.l #8,d4				
	move.l d4,12(a0)			
						
	move.l 52(sp),d1			
	move.b (a2,d1.l),d2			
						
	move.l a4,d0				
	move.l a5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,(a0)				
	move.l d1,d4				
	or.b d2,d4				
	move.l d4,4(a0)				
						
	add.b #64,d3				
	clr.w d1				
	bfins d3,d1{#16:#8}			
						
	move.b 56(sp),d0			
	eor.b d2,d0				
	and.l #255,d0				
						
	move.b (a1,d0.l),d1			
	move.w d1,8(a0)				
						
	move.l a6,d0				
	bfextu d0{#16:#8},d1			
						
	and.l #255,d2				
	eor.l d2,d1				
						
	lsl.w #8,d0				
						
	move.w (a3,d1.l*2),d1			
	eor.w d0,d1				
	move.w d1,10(a0)			
						
	addq.l #8,d5				
	move.l d5,24(a0)			
_?L8:						
						
	cmp.b d7,d3				
	scs d0					
	extb.l d0				
	neg.l d0				
_?L5:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L25:						
						
	move.b 47(sp),d3			
						
	cmp.b d7,d3				
	scs d0					
	extb.l d0				
	neg.l d0				
	jbra _?L5				
_?L11:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L13:						
						
	move.b 63(sp),d3			
						
	cmp.b d7,d3				
	scs d0					
	extb.l d0				
	neg.l d0				
	jbra _?L5				
_?L28:						
						
	pea 98.w				
	pea _?LC0				
	pea _?LC3				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.align	2				
	.globl	_miniflac_bitreader_fill_nocrc	
						
_miniflac_bitreader_fill_nocrc:			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5,-(sp)	
	move.l 36(sp),a0			
	move.l 40(sp),a3			
	move.w a3,d2				
						
	cmp.b #64,d2				
	jbhi _?L52				
						
	tst.b d2				
	jbeq _?L35				
						
	move.b 8(a0),d3				
						
	cmp.b d2,d3				
	jbcc _?L32				
						
	move.l 16(a0),a2			
						
	move.l 12(a0),d4			
						
	cmp.l a2,d4				
	jbcc _?L32				
						
	move.l 20(a0),a1			
						
	move.l d4,a4				
	addq.l #1,a4				
	move.l a4,12(a0)			
						
	move.l (a0),d0				
	move.l 4(a0),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d6				
	move.l d1,d7				
	or.b (a1,d4.l),d7			
						
	move.l d6,(a0)				
	move.l d7,4(a0)				
						
	move.b d3,d0				
	addq.b #8,d0				
	move.b d0,8(a0)				
						
	move.l 24(a0),d5			
						
	move.l d5,d1				
	addq.l #1,d1				
	move.l d1,24(a0)			
						
	cmp.b d2,d0				
	jbcc _?L49				
	cmp.l a2,a4				
	jbcc _?L49				
						
	move.l d4,a5				
	addq.l #2,a5				
	move.l a5,12(a0)			
						
	move.l d6,d0				
	move.l d7,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d6				
	move.l d1,d7				
	or.b (a1,a4.l),d7			
						
	move.l d6,(a0)				
	move.l d7,4(a0)				
						
	move.b d3,d0				
	add.b #16,d0				
	move.b d0,8(a0)				
						
	move.l d5,d1				
	addq.l #2,d1				
	move.l d1,24(a0)			
						
	cmp.b d2,d0				
	jbcc _?L49				
	cmp.l a2,a5				
	jbcc _?L49				
						
	addq.l #2,a4				
	move.l a4,12(a0)			
						
	move.l d6,d0				
	move.l d7,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d6				
	move.l d1,d7				
	or.b (a1,a5.l),d7			
						
	move.l d6,(a0)				
	move.l d7,4(a0)				
						
	move.b d3,d0				
	add.b #24,d0				
	move.b d0,8(a0)				
						
	move.l d5,d1				
	addq.l #3,d1				
	move.l d1,24(a0)			
						
	cmp.b d2,d0				
	jbcc _?L49				
	cmp.l a2,a4				
	jbcc _?L49				
						
	addq.l #2,a5				
	move.l a5,12(a0)			
						
	move.l d6,d0				
	move.l d7,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d6				
	move.l d1,d7				
	or.b (a1,a4.l),d7			
						
	move.l d6,(a0)				
	move.l d7,4(a0)				
						
	move.b d3,d0				
	add.b #32,d0				
	move.b d0,8(a0)				
						
	move.l d5,d1				
	addq.l #4,d1				
	move.l d1,24(a0)			
						
	cmp.b d2,d0				
	jbcc _?L49				
	cmp.l a2,a5				
	jbcc _?L49				
						
	addq.l #2,a4				
	move.l a4,12(a0)			
						
	move.l d6,d0				
	move.l d7,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d6				
	move.l d1,d7				
	or.b (a1,a5.l),d7			
						
	move.l d6,(a0)				
	move.l d7,4(a0)				
						
	move.b d3,d0				
	add.b #40,d0				
	move.b d0,8(a0)				
						
	move.l d5,d1				
	addq.l #5,d1				
	move.l d1,24(a0)			
						
	cmp.b d2,d0				
	jbcc _?L49				
	cmp.l a2,a4				
	jbcc _?L49				
						
	addq.l #2,a5				
	move.l a5,12(a0)			
						
	move.l d6,d0				
	move.l d7,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d6				
	move.l d1,d7				
	or.b (a1,a4.l),d7			
						
	move.l d6,(a0)				
	move.l d7,4(a0)				
						
	move.b d3,d0				
	add.b #48,d0				
	move.b d0,8(a0)				
						
	move.l d5,d1				
	addq.l #6,d1				
	move.l d1,24(a0)			
						
	cmp.b d2,d0				
	jbcc _?L49				
	cmp.l a2,a5				
	jbcc _?L49				
						
	addq.l #2,a4				
	move.l a4,12(a0)			
						
	move.l d6,d0				
	move.l d7,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d6				
	move.l d1,d7				
	or.b (a1,a5.l),d7			
						
	move.l d6,(a0)				
	move.l d7,4(a0)				
						
	move.b d3,d0				
	add.b #56,d0				
	move.b d0,8(a0)				
						
	move.l d5,d1				
	addq.l #7,d1				
	move.l d1,24(a0)			
						
	cmp.b d2,d0				
	jbcc _?L49				
	cmp.l a2,a4				
	jbcc _?L49				
						
	addq.l #8,d4				
	move.l d4,12(a0)			
						
	clr.l d0				
	move.b (a1,a4.l),d0			
						
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	clr.l d1				
	or.l d6,d1				
	move.l d1,(a0)				
	or.l d7,d0				
	move.l d0,4(a0)				
						
	add.b #64,d3				
	move.b d3,8(a0)				
						
	addq.l #8,d5				
	move.l d5,24(a0)			
_?L32:						
						
	move.w a3,d1				
	cmp.b d1,d3				
	scs d0					
	extb.l d0				
	neg.l d0				
_?L29:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L49:						
						
	move.b d0,d3				
						
	move.w a3,d1				
	cmp.b d1,d3				
	scs d0					
	extb.l d0				
	neg.l d0				
	jbra _?L29				
_?L35:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L52:						
						
	pea 115.w				
	pea _?LC0				
	pea _?LC3				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.align	2				
	.globl	_miniflac_bitreader_read	
						
_miniflac_bitreader_read:			
	movem.l d3/d4/d5/d6/d7,-(sp)		
	move.l 24(sp),a0			
	move.l 28(sp),d0			
						
	move.b 8(a0),d2				
	cmp.b d2,d0				
	jbhi _?L67				
						
	tst.b d0				
	jbeq _?L63				
						
	sub.b d0,d2				
	move.b d2,8(a0)				
						
	move.l (a0),d5				
	move.l 4(a0),d4				
						
	clr.l d3				
	move.b d2,d3				
						
	and.l #255,d0				
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L56				
	moveq #-1,d6				
	lsr.l d1,d6				
	clr.l d0				
						
	move.w #-32,a1				
	add.l d3,a1				
	tst.l a1				
	jblt _?L58				
_?L68:						
	move.l d5,d1				
	move.l a1,d7				
	lsr.l d7,d1				
	clr.l d7				
						
	and.l d7,d0				
	and.l d6,d1				
						
	tst.b d2				
	jbeq _?L64				
_?L69:						
						
	moveq #64,d7				
	sub.l d3,d7				
						
	moveq #32,d6				
	sub.l d3,d6				
	jbmi _?L61				
	moveq #-1,d2				
	lsr.l d6,d2				
	clr.l d3				
						
	and.l d5,d3				
	and.l d4,d2				
_?L60:						
	move.l d3,(a0)				
	move.l d2,4(a0)				
_?L53:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7		
	rts					
_?L56:						
						
	moveq #-1,d0				
	moveq #31,d6				
	sub.l d7,d6				
	moveq #-2,d1				
	lsl.l d6,d1				
	move.l d0,d6				
	lsr.l d7,d6				
	or.l d1,d6				
	lsr.l d7,d0				
						
	move.w #-32,a1				
	add.l d3,a1				
	tst.l a1				
	jbge _?L68				
_?L58:						
	moveq #31,d1				
	sub.l d3,d1				
	move.l d5,d7				
	add.l d7,d7				
	lsl.l d1,d7				
	move.l d4,d1				
	lsr.l d3,d1				
	or.l d7,d1				
	move.l d5,d7				
	lsr.l d3,d7				
						
	and.l d7,d0				
	and.l d6,d1				
						
	tst.b d2				
	jbne _?L69				
_?L64:						
	clr.l d3				
	clr.l d2				
						
	move.l d3,(a0)				
	move.l d2,4(a0)				
	jbra _?L53				
_?L63:						
						
	clr.l d0				
	clr.l d1				
						
	movem.l (sp)+,d3/d4/d5/d6/d7		
	rts					
_?L61:						
						
	moveq #-1,d3				
	moveq #31,d2				
	sub.l d7,d2				
	moveq #-2,d6				
	lsl.l d2,d6				
	move.l d3,d2				
	lsr.l d7,d2				
	or.l d6,d2				
	lsr.l d7,d3				
						
	and.l d5,d3				
	and.l d4,d2				
	jbra _?L60				
_?L67:						
	jbsr (_miniflac_bitreader_read?part?0)	
						
	.align	2				
	.globl	_miniflac_bitreader_read_signed	
						
_miniflac_bitreader_read_signed:		
	movem.l d3/d4/d5/d6/d7/a3,-(sp)		
	move.l 28(sp),a0			
	move.l 32(sp),d0			
						
	tst.b d0				
	jbne _?L90				
						
	clr.l d0				
	clr.l d1				
_?L70:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3		
	rts					
_?L90:						
						
	move.b 8(a0),d4				
	cmp.b d0,d4				
	jbcs _?L91				
						
	clr.l d3				
	move.b d0,d3				
						
	sub.b d0,d4				
	move.b d4,8(a0)				
						
	move.l (a0),d6				
	move.l 4(a0),a3				
						
	clr.l d2				
	move.b d4,d2				
						
	moveq #64,d7				
	sub.l d3,d7				
						
	moveq #32,d0				
	sub.l d3,d0				
	jbmi _?L73				
	moveq #-1,d1				
	lsr.l d0,d1				
	clr.l d0				
						
	move.w #-32,a1				
	add.l d2,a1				
	tst.l a1				
	jblt _?L75				
_?L92:						
	move.l d6,d7				
	move.l a1,d5				
	lsr.l d5,d7				
	sub.l a1,a1				
						
	move.l a1,d5				
	and.l d5,d0				
	and.l d7,d1				
						
	tst.b d4				
	jbeq _?L84				
_?L93:						
						
	moveq #64,d7				
	sub.l d2,d7				
						
	moveq #32,d4				
	sub.l d2,d4				
	jbmi _?L78				
	moveq #-1,d2				
	lsr.l d4,d2				
	clr.l d4				
						
	and.l d6,d4				
	move.l a3,d5				
	and.l d5,d2				
_?L77:						
	move.l d4,(a0)				
	move.l d2,4(a0)				
						
	move.l d3,d4				
	subq.l #1,d4				
						
	moveq #1,d2				
	lsl.l d4,d2				
	move.l d2,d7				
	smi d6					
	extb.l d6				
						
	move.l d6,d4				
	and.l d0,d4				
	move.l d2,d5				
	and.l d1,d5				
						
	move.l d4,d2				
	or.l d5,d2				
	jbeq _?L70				
						
	move.w #-32,a0				
	add.l d3,a0				
	tst.l a0				
	jblt _?L81				
	moveq #-1,d2				
	move.l a0,d3				
	lsl.l d3,d2				
	clr.l d4				
						
	or.l d2,d0				
	or.l d4,d1				
_?L94:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3		
	rts					
_?L73:						
						
	moveq #-1,d5				
	move.w #31,a2				
	sub.l d7,a2				
	moveq #-2,d1				
	move.l a2,d0				
	lsl.l d0,d1				
	move.l d1,a1				
	move.l d5,d1				
	lsr.l d7,d1				
	move.l a1,d0				
	or.l d0,d1				
	move.l d5,d0				
	lsr.l d7,d0				
						
	move.w #-32,a1				
	add.l d2,a1				
	tst.l a1				
	jbge _?L92				
_?L75:						
	moveq #31,d7				
	sub.l d2,d7				
	move.l d6,d5				
	add.l d5,d5				
	lsl.l d7,d5				
	move.l a3,d7				
	lsr.l d2,d7				
	or.l d5,d7				
	move.l d6,d5				
	lsr.l d2,d5				
	move.l d5,a1				
						
	move.l a1,d5				
	and.l d5,d0				
	and.l d7,d1				
						
	tst.b d4				
	jbne _?L93				
_?L84:						
	clr.l d4				
	clr.l d2				
	jbra _?L77				
_?L81:						
						
	moveq #-1,d4				
	moveq #31,d2				
	sub.l d3,d2				
	move.l #2147483647,d5			
	lsr.l d2,d5				
	move.l d4,d2				
	lsl.l d3,d2				
	or.l d5,d2				
	lsl.l d3,d4				
						
	or.l d2,d0				
	or.l d4,d1				
	jbra _?L94				
_?L78:						
						
	moveq #-1,d4				
	move.w #31,a2				
	sub.l d7,a2				
	moveq #-2,d2				
	move.l a2,d5				
	lsl.l d5,d2				
	move.l d2,a1				
	move.l d4,d2				
	lsr.l d7,d2				
	move.l a1,d5				
	or.l d5,d2				
	lsr.l d7,d4				
						
	and.l d6,d4				
	move.l a3,d5				
	and.l d5,d2				
	jbra _?L77				
_?L91:						
	jbsr (_miniflac_bitreader_read?part?0)	
						
	.align	2				
	.globl	_miniflac_bitreader_peek	
						
_miniflac_bitreader_peek:			
	movem.l d3/d4/d5,-(sp)			
	move.l 16(sp),a0			
	move.l 20(sp),d3			
						
	move.b 8(a0),d0				
	cmp.b d0,d3				
	jbhi _?L105				
						
	tst.b d3				
	jbeq _?L102				
						
	and.l #255,d3				
						
	clr.l d2				
	move.b d0,d2				
						
	sub.l d3,d2				
						
	move.w #-32,a1				
	add.l d2,a1				
	tst.l a1				
	jblt _?L98				
	move.l (a0),d1				
	move.l a1,d0				
	lsr.l d0,d1				
	clr.l d0				
						
	moveq #64,d5				
	sub.l d3,d5				
						
	moveq #32,d4				
	sub.l d3,d4				
	jbmi _?L100				
_?L106:						
	moveq #-1,d2				
	lsr.l d4,d2				
	clr.l d3				
						
	and.l d3,d0				
	and.l d2,d1				
_?L95:						
						
	movem.l (sp)+,d3/d4/d5			
	rts					
_?L98:						
						
	move.l (a0),d0				
	move.l d0,d4				
	add.l d4,d4				
	moveq #31,d1				
	sub.l d2,d1				
	lsl.l d1,d4				
	move.l 4(a0),d1				
	lsr.l d2,d1				
	or.l d4,d1				
	lsr.l d2,d0				
						
	moveq #64,d5				
	sub.l d3,d5				
						
	moveq #32,d4				
	sub.l d3,d4				
	jbpl _?L106				
_?L100:						
	moveq #-1,d3				
	moveq #31,d2				
	sub.l d5,d2				
	moveq #-2,d4				
	lsl.l d2,d4				
	move.l d3,d2				
	lsr.l d5,d2				
	or.l d4,d2				
	lsr.l d5,d3				
						
	and.l d3,d0				
	and.l d2,d1				
	jbra _?L95				
_?L102:						
						
	clr.l d0				
	clr.l d1				
						
	movem.l (sp)+,d3/d4/d5			
	rts					
_?L105:						
						
	pea 172.w				
	pea _?LC0				
	pea _?LC1				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.align	2				
	.globl	_miniflac_bitreader_discard	
						
_miniflac_bitreader_discard:			
	move.l d3,-(sp)				
	move.l 8(sp),a0				
	move.l 12(sp),d2			
						
	move.b 8(a0),d0				
	cmp.b d0,d2				
	jbhi _?L119				
						
	tst.b d2				
	jbeq _?L107				
						
	sub.b d2,d0				
	move.b d0,8(a0)				
						
	jbne _?L120				
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,(a0)				
	and.l d0,4(a0)				
_?L107:						
						
	move.l (sp)+,d3				
	rts					
_?L120:						
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L111				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,(a0)				
	and.l d0,4(a0)				
	jbra _?L107				
_?L111:						
						
	moveq #-1,d1				
	moveq #31,d0				
	sub.l d2,d0				
	moveq #-2,d3				
	lsl.l d0,d3				
	move.l d1,d0				
	lsr.l d2,d0				
	or.l d3,d0				
	lsr.l d2,d1				
						
	and.l d1,(a0)				
	and.l d0,4(a0)				
	jbra _?L107				
_?L119:						
						
	pea 185.w				
	pea _?LC0				
	pea _?LC1				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.data					
_?LC4:						
	.dc.b $62,$72,$2d,$3e,$62,$69,$74,$73
	.dc.b $20,$3c,$20,$38
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_bitreader_align	
						
_miniflac_bitreader_align:			
	move.l 4(sp),a0				
						
	cmp.b #7,8(a0)				
	jbhi _?L125				
						
	clr.b 8(a0)				
						
	clr.l (a0)				
	clr.l 4(a0)				
						
	rts					
_?L125:						
						
	pea 201.w				
	pea _?LC0				
	pea _?LC4				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.align	2				
	.globl	_miniflac_bitreader_reset_crc	
						
_miniflac_bitreader_reset_crc:			
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 44(sp),a1			
						
	move.l (a1),d6				
	move.l 4(a1),d7				
						
	move.b 8(a1),d0				
						
	clr.b 9(a1)				
						
	clr.w 10(a1)				
						
	clr.l 24(a1)				
						
	tst.b d0				
	jbeq _?L126				
	move.w #1,a0				
	clr.w d3				
	clr.b 39(sp)				
	lea _miniflac_crc8_table,a4		
	lea _miniflac_crc16_table,a3		
						
	move.w #-1,a2				
	move.w #-2,a5				
						
	subq.b #8,d0				
						
	clr.l d1				
	move.b d0,d1				
	move.w #-32,a6				
	add.l d1,a6				
	tst.l a6				
	jblt _?L128				
_?L140:						
	move.l d6,d4				
	move.l a6,d2				
	lsr.l d2,d4				
_?L129:						
						
	move.b d4,d5				
						
	tst.b d0				
	jbne _?L139				
						
	bfextu d3{#16:#8},d0			
						
	clr.l d1				
	move.b d4,d1				
	eor.l d1,d0				
						
	lsl.w #8,d3				
						
	move.b 39(sp),d2			
	eor.b d4,d2				
	and.l #255,d2				
	move.b (a4,d2.l),9(a1)			
	move.w (a3,d0.l*2),d0			
	eor.w d3,d0				
	move.w d0,10(a1)			
	move.l a0,24(a1)			
_?L126:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L139:						
						
	move.w #64,a6				
	sub.l d1,a6				
						
	moveq #32,d4				
	sub.l d1,d4				
	jbmi _?L131				
	move.l a2,d1				
	lsr.l d4,d1				
	clr.l d4				
						
	and.l d4,d6				
	and.l d1,d7				
						
	move.b 39(sp),d2			
	eor.b d5,d2				
	and.l #255,d2				
						
	move.b (a4,d2.l),39(sp)			
						
	bfextu d3{#16:#8},d1			
						
	and.l #255,d5				
	eor.l d5,d1				
						
	lsl.w #8,d3				
						
	move.w (a3,d1.l*2),d1			
	eor.w d1,d3				
						
	addq.l #1,a0				
_?L141:						
						
	subq.b #8,d0				
						
	clr.l d1				
	move.b d0,d1				
	move.w #-32,a6				
	add.l d1,a6				
	tst.l a6				
	jbge _?L140				
_?L128:						
	moveq #31,d4				
	sub.l d1,d4				
	move.l d6,d5				
	add.l d5,d5				
	lsl.l d4,d5				
	move.l d7,d4				
	lsr.l d1,d4				
	or.l d5,d4				
	jbra _?L129				
_?L131:						
						
	moveq #31,d1				
	sub.l a6,d1				
	move.l a5,d2				
	lsl.l d1,d2				
	move.l a2,d1				
	move.l a6,d4				
	lsr.l d4,d1				
	or.l d2,d1				
	move.l a2,d4				
	move.l a6,d2				
	lsr.l d2,d4				
						
	and.l d4,d6				
	and.l d1,d7				
						
	move.b 39(sp),d2			
	eor.b d5,d2				
	and.l #255,d2				
						
	move.b (a4,d2.l),39(sp)			
						
	bfextu d3{#16:#8},d1			
						
	and.l #255,d5				
	eor.l d5,d1				
						
	lsl.w #8,d3				
						
	move.w (a3,d1.l*2),d1			
	eor.w d1,d3				
						
	addq.l #1,a0				
	jbra _?L141				
						
	.data					
	.align	2				
						
						
_miniflac_crc16_table:				
	.dc.w	0				
	.dc.w	-32763				
	.dc.w	-32753				
	.dc.w	10				
	.dc.w	-32741				
	.dc.w	30				
	.dc.w	20				
	.dc.w	-32751				
	.dc.w	-32717				
	.dc.w	54				
	.dc.w	60				
	.dc.w	-32711				
	.dc.w	40				
	.dc.w	-32723				
	.dc.w	-32729				
	.dc.w	34				
	.dc.w	-32669				
	.dc.w	102				
	.dc.w	108				
	.dc.w	-32663				
	.dc.w	120				
	.dc.w	-32643				
	.dc.w	-32649				
	.dc.w	114				
	.dc.w	80				
	.dc.w	-32683				
	.dc.w	-32673				
	.dc.w	90				
	.dc.w	-32693				
	.dc.w	78				
	.dc.w	68				
	.dc.w	-32703				
	.dc.w	-32573				
	.dc.w	198				
	.dc.w	204				
	.dc.w	-32567				
	.dc.w	216				
	.dc.w	-32547				
	.dc.w	-32553				
	.dc.w	210				
	.dc.w	240				
	.dc.w	-32523				
	.dc.w	-32513				
	.dc.w	250				
	.dc.w	-32533				
	.dc.w	238				
	.dc.w	228				
	.dc.w	-32543				
	.dc.w	160				
	.dc.w	-32603				
	.dc.w	-32593				
	.dc.w	170				
	.dc.w	-32581				
	.dc.w	190				
	.dc.w	180				
	.dc.w	-32591				
	.dc.w	-32621				
	.dc.w	150				
	.dc.w	156				
	.dc.w	-32615				
	.dc.w	136				
	.dc.w	-32627				
	.dc.w	-32633				
	.dc.w	130				
	.dc.w	-32381				
	.dc.w	390				
	.dc.w	396				
	.dc.w	-32375				
	.dc.w	408				
	.dc.w	-32355				
	.dc.w	-32361				
	.dc.w	402				
	.dc.w	432				
	.dc.w	-32331				
	.dc.w	-32321				
	.dc.w	442				
	.dc.w	-32341				
	.dc.w	430				
	.dc.w	420				
	.dc.w	-32351				
	.dc.w	480				
	.dc.w	-32283				
	.dc.w	-32273				
	.dc.w	490				
	.dc.w	-32261				
	.dc.w	510				
	.dc.w	500				
	.dc.w	-32271				
	.dc.w	-32301				
	.dc.w	470				
	.dc.w	476				
	.dc.w	-32295				
	.dc.w	456				
	.dc.w	-32307				
	.dc.w	-32313				
	.dc.w	450				
	.dc.w	320				
	.dc.w	-32443				
	.dc.w	-32433				
	.dc.w	330				
	.dc.w	-32421				
	.dc.w	350				
	.dc.w	340				
	.dc.w	-32431				
	.dc.w	-32397				
	.dc.w	374				
	.dc.w	380				
	.dc.w	-32391				
	.dc.w	360				
	.dc.w	-32403				
	.dc.w	-32409				
	.dc.w	354				
	.dc.w	-32477				
	.dc.w	294				
	.dc.w	300				
	.dc.w	-32471				
	.dc.w	312				
	.dc.w	-32451				
	.dc.w	-32457				
	.dc.w	306				
	.dc.w	272				
	.dc.w	-32491				
	.dc.w	-32481				
	.dc.w	282				
	.dc.w	-32501				
	.dc.w	270				
	.dc.w	260				
	.dc.w	-32511				
	.dc.w	-31997				
	.dc.w	774				
	.dc.w	780				
	.dc.w	-31991				
	.dc.w	792				
	.dc.w	-31971				
	.dc.w	-31977				
	.dc.w	786				
	.dc.w	816				
	.dc.w	-31947				
	.dc.w	-31937				
	.dc.w	826				
	.dc.w	-31957				
	.dc.w	814				
	.dc.w	804				
	.dc.w	-31967				
	.dc.w	864				
	.dc.w	-31899				
	.dc.w	-31889				
	.dc.w	874				
	.dc.w	-31877				
	.dc.w	894				
	.dc.w	884				
	.dc.w	-31887				
	.dc.w	-31917				
	.dc.w	854				
	.dc.w	860				
	.dc.w	-31911				
	.dc.w	840				
	.dc.w	-31923				
	.dc.w	-31929				
	.dc.w	834				
	.dc.w	960				
	.dc.w	-31803				
	.dc.w	-31793				
	.dc.w	970				
	.dc.w	-31781				
	.dc.w	990				
	.dc.w	980				
	.dc.w	-31791				
	.dc.w	-31757				
	.dc.w	1014				
	.dc.w	1020				
	.dc.w	-31751				
	.dc.w	1000				
	.dc.w	-31763				
	.dc.w	-31769				
	.dc.w	994				
	.dc.w	-31837				
	.dc.w	934				
	.dc.w	940				
	.dc.w	-31831				
	.dc.w	952				
	.dc.w	-31811				
	.dc.w	-31817				
	.dc.w	946				
	.dc.w	912				
	.dc.w	-31851				
	.dc.w	-31841				
	.dc.w	922				
	.dc.w	-31861				
	.dc.w	910				
	.dc.w	900				
	.dc.w	-31871				
	.dc.w	640				
	.dc.w	-32123				
	.dc.w	-32113				
	.dc.w	650				
	.dc.w	-32101				
	.dc.w	670				
	.dc.w	660				
	.dc.w	-32111				
	.dc.w	-32077				
	.dc.w	694				
	.dc.w	700				
	.dc.w	-32071				
	.dc.w	680				
	.dc.w	-32083				
	.dc.w	-32089				
	.dc.w	674				
	.dc.w	-32029				
	.dc.w	742				
	.dc.w	748				
	.dc.w	-32023				
	.dc.w	760				
	.dc.w	-32003				
	.dc.w	-32009				
	.dc.w	754				
	.dc.w	720				
	.dc.w	-32043				
	.dc.w	-32033				
	.dc.w	730				
	.dc.w	-32053				
	.dc.w	718				
	.dc.w	708				
	.dc.w	-32063				
	.dc.w	-32189				
	.dc.w	582				
	.dc.w	588				
	.dc.w	-32183				
	.dc.w	600				
	.dc.w	-32163				
	.dc.w	-32169				
	.dc.w	594				
	.dc.w	624				
	.dc.w	-32139				
	.dc.w	-32129				
	.dc.w	634				
	.dc.w	-32149				
	.dc.w	622				
	.dc.w	612				
	.dc.w	-32159				
	.dc.w	544				
	.dc.w	-32219				
	.dc.w	-32209				
	.dc.w	554				
	.dc.w	-32197				
	.dc.w	574				
	.dc.w	564				
	.dc.w	-32207				
	.dc.w	-32237				
	.dc.w	534				
	.dc.w	540				
	.dc.w	-32231				
	.dc.w	520				
	.dc.w	-32243				
	.dc.w	-32249				
	.dc.w	514				
						
						
_miniflac_crc8_table:				

	.dc.b $00				
	.dc.b $07,$0e,$09,$1c,$1b,$12,$15,$38
	.dc.b $3f,$36,$31,$24,$23,$2a,$2d,$70
	.dc.b $77,$7e,$79,$6c,$6b,$62,$65,$48
	.dc.b $4f,$46,$41,$54,$53,$5a,$5d,$e0
	.dc.b $e7,$ee				
	.dc.b $e9,$fc,$fb,$f2,$f5,$d8,$df,$d6
	.dc.b $d1,$c4,$c3,$ca,$cd,$90,$97	
	.dc.b $9e,$99,$8c,$8b,$82,$85,$a8,$af
	.dc.b $a6,$a1,$b4,$b3,$ba,$bd,$c7	
	.dc.b $c0,$c9,$ce,$db,$dc,$d5,$d2,$ff
	.dc.b $f8,$f1,$f6,$e3,$e4,$ed,$ea	
	.dc.b $b7,$b0,$b9,$be,$ab,$ac,$a5,$a2
	.dc.b $8f,$88,$81,$86,$93,$94,$9d	
	.dc.b $9a,$27,$20,$29,$2e,$3b,$3c,$35
	.dc.b $32,$1f,$18,$11,$16,$03,$04,$0d
	.dc.b $0a,$57,$50,$59,$5e,$4b,$4c,$45
	.dc.b $42,$6f,$68,$61,$66,$73,$74,$7d
	.dc.b $7a,$89				
	.dc.b $8e,$87,$80,$95,$92,$9b,$9c,$b1
	.dc.b $b6,$bf,$b8,$ad,$aa,$a3,$a4	
	.dc.b $f9,$fe,$f7,$f0,$e5,$e2,$eb,$ec
	.dc.b $c1,$c6,$cf,$c8,$dd,$da,$d3	
	.dc.b $d4,$69,$6e,$67,$60,$75,$72,$7b
	.dc.b $7c,$51,$56,$5f,$58,$4d,$4a,$43
	.dc.b $44,$19,$1e,$17,$10,$05,$02,$0b
	.dc.b $0c,$21,$26,$2f,$28,$3d,$3a,$33
	.dc.b $34,$4e,$49			
	.dc.b $40,$47,$52,$55,$5c,$5b,$76,$71
	.dc.b $78,$7f,$6a,$6d,$64,$63,$3e,$39
	.dc.b $30,$37,$22,$25,$2c,$2b,$06,$01
	.dc.b $08,$0f,$1a,$1d,$14,$13,$ae	
	.dc.b $a9,$a0,$a7,$b2,$b5,$bc,$bb,$96
	.dc.b $91,$98,$9f,$8a,$8d,$84,$83	
	.dc.b $de,$d9,$d0,$d7,$c2,$c5,$cc,$cb
	.dc.b $e6,$e1,$e8,$ef,$fa,$fd,$f4	
	.dc.b $f3				
						
