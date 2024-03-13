* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"flacall.c"			
						
						
						
						
						
	.text					
	.data					
_?LC0:						
	.dc.b $66,$6c,$61,$63,$61,$6c,$6c,$2e
	.dc.b $63
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
						
	pea 218.w				
	pea _?LC0				
	pea _?LC1				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.align	2				
						
_miniflac_bitreader_read:			
	movem.l d3/d4/d5/d6/d7,-(sp)		
	move.l 24(sp),a0			
	move.l 28(sp),d0			
						
	move.b 8(a0),d2				
	cmp.b d2,d0				
	jbhi _?L17				
						
	tst.b d0				
	jbeq _?L13				
						
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
	jbmi _?L6				
	moveq #-1,d6				
	lsr.l d1,d6				
	clr.l d0				
						
	move.w #-32,a1				
	add.l d3,a1				
	tst.l a1				
	jblt _?L8				
_?L18:						
	move.l d5,d1				
	move.l a1,d7				
	lsr.l d7,d1				
	clr.l d7				
						
	and.l d7,d0				
	and.l d6,d1				
						
	tst.b d2				
	jbeq _?L14				
_?L19:						
						
	moveq #64,d7				
	sub.l d3,d7				
						
	moveq #32,d6				
	sub.l d3,d6				
	jbmi _?L11				
	moveq #-1,d2				
	lsr.l d6,d2				
	clr.l d3				
						
	and.l d5,d3				
	and.l d4,d2				
_?L10:						
	move.l d3,(a0)				
	move.l d2,4(a0)				
_?L3:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7		
	rts					
_?L6:						
						
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
	jbge _?L18				
_?L8:						
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
	jbne _?L19				
_?L14:						
	clr.l d3				
	clr.l d2				
						
	move.l d3,(a0)				
	move.l d2,4(a0)				
	jbra _?L3				
_?L13:						
						
	clr.l d0				
	clr.l d1				
						
	movem.l (sp)+,d3/d4/d5/d6/d7		
	rts					
_?L11:						
						
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
	jbra _?L10				
_?L17:						
	jbsr (_miniflac_bitreader_read?part?0)	
						
	.data					
_?LC3:						
	.dc.b $62,$69,$74,$73,$20,$3c,$3d,$20
	.dc.b $36,$34
	.dc.b $00				
	.text					
	.align	2				
						
_miniflac_bitreader_fill_nocrc?part?0:		
						
	pea 199.w				
	pea _?LC0				
	pea _?LC3				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.align	2				
						
_miniflac_bitreader_fill_nocrc:			
	movem.l d3/d4/d5/d6/d7/a3,-(sp)		
	move.l 28(sp),a0			
	move.l 32(sp),d0			
	move.b d0,d5				
						
	move.b 8(a0),d1				
						
	cmp.b d0,d1				
	jbcc _?L23				
						
	move.l 16(a0),d6			
						
	move.l 12(a0),a1			
						
	cmp.l d6,a1				
	jbcc _?L23				
_?L25:						
						
	lea (1,a1),a2				
	move.l a2,12(a0)			
						
	move.l (a0),d2				
	move.l 4(a0),d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l 20(a0),a3			
	clr.l d4				
	move.b (a3,a1.l),d4			
	clr.l d7				
	or.l d2,d7				
	move.l d7,(a0)				
	or.l d3,d4				
	move.l d4,4(a0)				
						
	addq.b #8,d1				
	move.b d1,8(a0)				
						
	addq.l #1,24(a0)			
						
	cmp.b d1,d5				
	jbls _?L23				
	move.l a2,a1				
	cmp.l d6,a1				
	jbcs _?L25				
_?L23:						
						
	cmp.b d0,d1				
	scs d0					
	extb.l d0				
						
	neg.l d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3		
	rts					
						
	.align	2				
						
_miniflac_bitreader_discard?part?0:		
						
	pea 269.w				
	pea _?LC0				
	pea _?LC1				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.align	2				
						
_miniflac_bitreader_fill?part?0:		
						
	pea 182.w				
	pea _?LC0				
	pea _?LC3				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.align	2				
						
_miniflac_bitreader_fill:			
	lea (-28,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 68(sp),a0			
	move.l 72(sp),d7			
						
	cmp.b #64,d7				
	jbhi _?L55				
						
	tst.b d7				
	jbeq _?L38				
						
	move.b 8(a0),d3				
						
	cmp.b d7,d3				
	jbcc _?L35				
						
	move.l 16(a0),d6			
						
	move.l 12(a0),d4			
						
	cmp.l d6,d4				
	jbcc _?L35				
						
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
	jbls _?L40				
	cmp.l 48(sp),d6				
	jbls _?L40				
						
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
	jbls _?L52				
	cmp.l 56(sp),d6				
	jbls _?L52				
						
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
	jbls _?L52				
	cmp.l 52(sp),d6				
	jbls _?L52				
						
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
	jbls _?L52				
	cmp.l 56(sp),d6				
	jbls _?L52				
						
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
	jbls _?L52				
	cmp.l 52(sp),d6				
	jbls _?L52				
						
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
	jbls _?L52				
	cmp.l 56(sp),d6				
	jbls _?L52				
						
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
	jbls _?L52				
	cmp.l 52(sp),d6				
	jbls _?L52				
						
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
_?L35:						
						
	cmp.b d7,d3				
	scs d0					
	extb.l d0				
	neg.l d0				
_?L32:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L52:						
						
	move.b 47(sp),d3			
						
	cmp.b d7,d3				
	scs d0					
	extb.l d0				
	neg.l d0				
	jbra _?L32				
_?L38:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L40:						
						
	move.b 63(sp),d3			
						
	cmp.b d7,d3				
	scs d0					
	extb.l d0				
	neg.l d0				
	jbra _?L32				
_?L55:						
	jbsr (_miniflac_bitreader_fill?part?0)	
						
	.align	2				
						
_miniflac_bitreader_peek?part?0:		
						
	pea 256.w				
	pea _?LC0				
	pea _?LC1				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.data					
_?LC4:						
	.dc.b $6d,$65,$74,$61,$64,$61,$74,$61
	.dc.b $2d,$3e,$73,$74,$61,$74,$65,$20
	.dc.b $3d,$3d,$20,$4d,$49,$4e,$49,$46
	.dc.b $4c,$41,$43,$5f,$4d,$45,$54,$41
	.dc.b $44,$41,$54,$41,$5f,$48,$45,$41
	.dc.b $44,$45,$52
	.dc.b $00				
	.text					
	.align	2				
						
_miniflac_metadata_sync:			
	movem.l d3/d4/a3/a4,-(sp)		
	move.l 20(sp),a3			
	move.l 24(sp),d3			
						
	move.l (a3),d4				
	jbne _?L96				
						
	move.l 8(a3),d0				
						
	moveq #1,d1				
	lea _miniflac_bitreader_fill,a4		
	cmp.l d0,d1				
	jbeq _?L60				
	moveq #2,d1				
	lea _miniflac_bitreader_fill,a4		
	cmp.l d0,d1				
	jbeq _?L61				
	tst.l d0				
	jbeq _?L97				
_?L62:						
						
	moveq #6,d1				
	cmp.l 14(a3),d1				
	jbcs _?L77				
	move.l 14(a3),d0			
	add.l d0,d0				
	move.w _?L79(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L79:						
	.dc.w _?L85-_?L79			
	.dc.w _?L84-_?L79			
	.dc.w _?L83-_?L79			
	.dc.w _?L82-_?L79			
	.dc.w _?L81-_?L79			
	.dc.w _?L80-_?L79			
	.dc.w _?L78-_?L79			
_?L97:						
						
	pea 1.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill,a4		
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L63				
_?L65:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L85:						
						
	clr.l 22(a3)				
						
	clr.b 26(a3)				
						
	clr.l 28(a3)				
						
	clr.b 32(a3)				
_?L77:						
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
						
	moveq #1,d0				
_?L98:						
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L86:						
	moveq #2,d4				
_?L73:						
						
	move.l d4,14(a3)			
						
	moveq #2,d0				
	move.l d0,8(a3)				
_?L61:						
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L65				
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,18(a3)			
						
	clr.l 8(a3)				
	jbra _?L62				
_?L63:						
						
	clr.l 8(a3)				
						
	move.l #128,14(a3)			
						
	clr.w 12(a3)				
						
	clr.l 18(a3)				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,12(a3)			
						
	moveq #1,d0				
	move.l d0,8(a3)				
_?L60:						
						
	pea 7.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L65				
						
	pea 7.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,13(a3)			
	cmp.b #6,d1				
	jbhi _?L66				
	and.l #255,d1				
	add.l d1,d1				
	move.w _?L69(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L69:						
	.dc.w _?L73-_?L69			
	.dc.w _?L74-_?L69			
	.dc.w _?L86-_?L69			
	.dc.w _?L72-_?L69			
	.dc.w _?L71-_?L69			
	.dc.w _?L70-_?L69			
	.dc.w _?L68-_?L69			
_?L80:						
						
	clr.l 66(a3)				
						
	clr.l 70(a3)				
						
	clr.w 74(a3)				
						
	clr.w 76(a3)				
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
						
	moveq #1,d0				
	jbra _?L98				
_?L81:						
						
	clr.l 34(a3)				
						
	clr.l 38(a3)				
						
	clr.l 42(a3)				
						
	clr.l 46(a3)				
						
	clr.l 50(a3)				
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
						
	moveq #1,d0				
	jbra _?L98				
_?L82:						
						
	clr.l 78(a3)				
						
	clr.l 86(a3)				
						
	move.l 18(a3),d0			
	move.l d0,d1				
	mulu.l #954437177,d0:d1			
	lsr.l #2,d0				
						
	move.l d0,82(a3)			
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
						
	moveq #1,d0				
	jbra _?L98				
_?L83:						
						
	clr.l 90(a3)				
						
	clr.l 98(a3)				
						
	move.l 18(a3),d0			
	subq.l #4,d0				
	move.l d0,94(a3)			
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
						
	moveq #1,d0				
	jbra _?L98				
_?L84:						
						
	clr.l 106(a3)				
						
	move.l 18(a3),102(a3)			
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
						
	moveq #1,d0				
	jbra _?L98				
_?L78:						
						
	clr.l 54(a3)				
						
	clr.l 58(a3)				
						
	clr.l 62(a3)				
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
						
	moveq #1,d0				
	jbra _?L98				
_?L66:						
	cmp.b #127,d1				
	jbne _?L99				
						
	moveq #127,d1				
	move.l d1,14(a3)			
						
	moveq #-12,d0				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L74:						
	moveq #1,d4				
						
	move.l d4,14(a3)			
						
	moveq #2,d0				
	move.l d0,8(a3)				
	jbra _?L61				
_?L68:						
						
	moveq #6,d4				
						
	move.l d4,14(a3)			
						
	moveq #2,d0				
	move.l d0,8(a3)				
	jbra _?L61				
_?L70:						
						
	moveq #5,d4				
						
	move.l d4,14(a3)			
						
	moveq #2,d0				
	move.l d0,8(a3)				
	jbra _?L61				
_?L71:						
						
	moveq #4,d4				
						
	move.l d4,14(a3)			
						
	moveq #2,d0				
	move.l d0,8(a3)				
	jbra _?L61				
_?L72:						
						
	moveq #3,d4				
						
	move.l d4,14(a3)			
						
	moveq #2,d0				
	move.l d0,8(a3)				
	jbra _?L61				
_?L99:						
						
	move.l #128,14(a3)			
						
	moveq #-13,d0				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L96:						
						
	pea 1404.w				
	pea _?LC0				
	pea _?LC4				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.align	2				
						
_miniflac_oggfunction_end:			
	move.l 4(sp),a0				
	move.l 8(sp),d0				
						
	add.l d0,52(a0)				
						
	add.w 90(a0),d0				
	move.w d0,90(a0)			
						
	cmp.w 88(a0),d0				
	jbeq _?L109				
_?L100:						
						
	rts					
_?L109:						
						
	clr.l 36(a0)				
						
	btst #2,69(a0)				
	jbeq _?L100				
						
	cmp.b #1,468(a0)			
	jbne _?L100				
						
	move.l 464(a0),d0			
	cmp.l 78(a0),d0				
	jbne _?L100				
						
	clr.b 468(a0)				
						
	clr.l 464(a0)				
						
	rts					
						
	.align	2				
						
_miniflac_probe?part?0?isra?0:			
	move.b 11(sp),d0			
						
	cmp.b #79,d0				
	jbeq _?L113				
	cmp.b #102,d0				
	jbne _?L114				
	moveq #1,d1				
	moveq #2,d0				
						
	move.l 4(sp),a0				
	move.l d1,4(a0)				
						
	move.l d0,(a0)				
						
	moveq #1,d0				
_?L110:						
						
	rts					
_?L114:						
						
	moveq #-1,d0				
						
	rts					
_?L113:						
						
	moveq #2,d1				
	clr.l d0				
						
	move.l 4(sp),a0				
	move.l d1,4(a0)				
						
	move.l d0,(a0)				
						
	moveq #1,d0				
	jbra _?L110				
						
	.align	2				
						
_miniflac_streaminfo_read_channels:		
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbcc _?L118				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #5,d0				
	jbne _?L148				
						
	pea 3.w					
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L149				
_?L126:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L148:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L149:						
						
	pea 3.w					
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 20(sp)				
	jbeq _?L127				
						
	addq.b #1,d1				
	move.l 20(sp),a0			
	move.b d1,(a0)				
_?L127:						
						
	moveq #6,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L118:						
						
	moveq #4,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbne _?L150				
_?L121:						
						
	pea 20.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L126				
						
	pea 20.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,6(a3)				
						
	moveq #5,d0				
	move.l d0,(a3)				
						
	pea 3.w					
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L126				
	jbra _?L149				
_?L150:						
						
	moveq #3,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbeq _?L122				
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbeq _?L123				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbeq _?L124				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L126				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,(a3)				
_?L124:						
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L126				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,(a3)				
_?L123:						
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L126				
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #3,d0				
	move.l d0,(a3)				
_?L122:						
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L126				
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #4,d1				
	move.l d1,(a3)				
	jbra _?L121				
						
	.align	2				
						
_miniflac_cuesheet_read_tracks:			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 40(sp),a4			
	move.l 44(sp),a3			
						
	move.l (a4),d0				
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbeq _?L152				
	jbcs _?L211				
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d1				
	jbne _?L212				
_?L156:						
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L161				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b 8(a3),d0				
	cmp.b #6,d0				
	jbls _?L213				
						
	subq.b #7,d0				
	move.b d0,8(a3)				
						
	jbeq _?L184				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L164				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	moveq #3,d2				
	move.l d2,(a4)				
_?L152:						
						
	move.l 4(a4),a2				
						
	cmp.w #257,a2				
	jbhi _?L166				
						
	move.b 8(a3),d3				
	addq.l #1,a2				
_?L167:						
						
	cmp.b #7,d3				
	jbhi _?L214				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L161				
						
	move.l 20(a3),a0			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,12(a3)			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d0				
	or.b (a0,d2.l),d0			
						
	addq.l #1,24(a3)			
	move.b d3,d1				
_?L168:						
						
	move.b d1,8(a3)				
						
	jbeq _?L185				
						
	clr.l d2				
	move.b d1,d2				
						
	moveq #64,d6				
	sub.l d2,d6				
						
	moveq #32,d5				
	sub.l d2,d5				
	jbmi _?L171				
	moveq #-1,d2				
	lsr.l d5,d2				
	clr.l d5				
						
	and.l d5,d4				
	and.l d2,d0				
_?L170:						
	move.l d4,(a3)				
	move.l d0,4(a3)				
						
	move.l a2,4(a4)				
						
	cmp.w #258,a2				
	jbeq _?L166				
	move.l a2,d0				
	addq.l #1,d0				
	cmp.b #7,d3				
	jbhi _?L186				
						
	move.l 16(a3),a1			
						
	clr.l d0				
	move.b d1,d0				
	moveq #64,d3				
	sub.l d0,d3				
						
	moveq #32,d2				
	sub.l d0,d2				
	jbmi _?L174				
	moveq #-1,d4				
	lsr.l d2,d4				
	clr.l d5				
_?L180:						
						
	move.l 12(a3),d0			
						
	cmp.l a1,d0				
	jbcc _?L161				
						
	move.l 20(a3),a0			
						
	move.l d0,d2				
	addq.l #1,d2				
	move.l d2,12(a3)			
						
	move.b (a0,d0.l),d0			
						
	move.l (a3),d2				
	move.l 4(a3),d3				
						
	addq.l #1,24(a3)			
						
	move.b d1,8(a3)				
						
	jbeq _?L177				
						
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	or.b d0,d3				
						
	move.l d5,d0				
	and.l d2,d0				
	move.l d0,(a3)				
	and.l d4,d3				
	move.l d3,4(a3)				
						
	addq.l #1,a2				
	move.l a2,4(a4)				
						
	cmp.w #258,a2				
	jbne _?L180				
_?L166:						
						
	clr.l 4(a4)				
						
	moveq #4,d1				
	move.l d1,(a4)				
_?L154:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L161				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,9(a4)				
						
	tst.l 48(sp)				
	jbeq _?L183				
						
	move.l 48(sp),a0			
	move.b d1,(a0)				
_?L183:						
						
	clr.b 8(a4)				
						
	moveq #5,d0				
	move.l d0,(a4)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L211:						
						
	subq.l #4,d0				
	jbeq _?L154				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L161:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L212:						
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbne _?L215				
_?L157:						
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L161				
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,(a4)				
	jbra _?L156				
_?L177:						
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,a2				
	move.l a2,4(a4)				
						
	cmp.w #258,a2				
	jbne _?L180				
						
	clr.l 4(a4)				
						
	moveq #4,d1				
	move.l d1,(a4)				
	jbra _?L154				
_?L214:						
						
	move.b d3,d1				
	subq.b #8,d1				
						
	move.l (a3),d4				
	move.l 4(a3),d0				
	jbra _?L168				
_?L174:						
						
	moveq #-1,d5				
	moveq #31,d2				
	sub.l d3,d2				
	moveq #-2,d0				
	lsl.l d2,d0				
	move.l d5,d4				
	lsr.l d3,d4				
	or.l d0,d4				
	lsr.l d3,d5				
	jbra _?L180				
_?L185:						
	clr.l d4				
	clr.l d0				
	jbra _?L170				
_?L184:						
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	moveq #3,d2				
	move.l d2,(a4)				
	jbra _?L152				
_?L215:						
						
	move.l 4(a4),d3				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_read,a6		
						
	cmp.l #128,d3				
	jbcc _?L160				
_?L158:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L161				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	addq.l #1,d3				
	move.l d3,4(a4)				
						
	cmp.l #128,d3				
	jbne _?L158				
_?L160:						
						
	clr.l 4(a4)				
						
	moveq #1,d0				
	move.l d0,(a4)				
	jbra _?L157				
_?L171:						
						
	moveq #-1,d5				
	move.w #31,a1				
	sub.l d6,a1				
	moveq #-2,d7				
	move.l a1,d2				
	lsl.l d2,d7				
	move.l d5,d2				
	lsr.l d6,d2				
	or.l d7,d2				
	lsr.l d6,d5				
						
	and.l d5,d4				
	and.l d2,d0				
	jbra _?L170				
_?L164:						
						
	moveq #-1,d1				
	moveq #31,d0				
	sub.l d2,d0				
	moveq #-2,d3				
	lsl.l d0,d3				
	move.l d1,d0				
	lsr.l d2,d0				
	or.l d3,d0				
	lsr.l d2,d1				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	moveq #3,d2				
	move.l d2,(a4)				
	jbra _?L152				
_?L186:						
						
	move.l d0,a2				
	move.b d1,d3				
	jbra _?L167				
_?L213:						
	jbsr (_miniflac_bitreader_discard?part?0)
						
	.data					
_?LC5:						
	.dc.b $66,$72,$61,$6d,$65,$2d,$3e,$73
	.dc.b $74,$61,$74,$65,$20,$3d,$3d,$20
	.dc.b $4d,$49,$4e,$49,$46,$4c,$41,$43
	.dc.b $5f,$46,$52,$41,$4d,$45,$5f,$48
	.dc.b $45,$41,$44,$45,$52
	.dc.b $00				
	.text					
	.align	2				
						
_miniflac_frame_sync:				
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a3			
	move.l 56(sp),a4			
						
	tst.l (a3)				
	jbne _?L338				
						
	moveq #17,d0				
	cmp.l 38(a3),d0				
	jbcs _?L218				
	move.l 38(a3),d0			
	add.l d0,d0				
	move.w _?L220(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L220:						
	.dc.w _?L237-_?L220			
	.dc.w _?L317-_?L220			
	.dc.w _?L318-_?L220			
	.dc.w _?L319-_?L220			
	.dc.w _?L320-_?L220			
	.dc.w _?L321-_?L220			
	.dc.w _?L322-_?L220			
	.dc.w _?L323-_?L220			
	.dc.w _?L324-_?L220			
	.dc.w _?L325-_?L220			
	.dc.w _?L326-_?L220			
	.dc.w _?L327-_?L220			
	.dc.w _?L328-_?L220			
	.dc.w _?L329-_?L220			
	.dc.w _?L330-_?L220			
	.dc.w _?L331-_?L220			
	.dc.w _?L332-_?L220			
	.dc.w _?L316-_?L220			
_?L296:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
						
	pea 8.w					
						
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.w #1,d1				
	move.w d1,16(a3)			
_?L298:						
						
	moveq #16,d4				
	move.l d4,38(a3)			
_?L221:						
						
	move.b 13(a3),d0			
	cmp.b #13,d0				
	jbeq _?L299				
	cmp.b #14,d0				
	jbeq _?L300				
	cmp.b #12,d0				
	jbeq _?L339				
						
	move.b 9(a4),36(a3)			
						
	moveq #17,d5				
	move.l d5,38(a3)			
_?L219:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	clr.l d2				
	move.b 36(a3),d2			
	move.l d2,44(sp)			
	clr.l 40(sp)				
						
	move.l 40(sp),d3			
	move.l 44(sp),d4			
	sub.l d1,d4				
	subx.l d0,d3				
	jbne _?L313				
_?L218:						
						
	clr.l 38(a3)				
						
	tst.l 18(a3)				
	jbne _?L302				
						
	move.l 60(sp),a0			
	move.l 6(a0),d0				
						
	jbeq _?L264				
						
	move.l d0,18(a3)			
_?L302:						
						
	tst.b 27(a3)				
	jbne _?L304				
						
	move.l 60(sp),a0			
	move.b 10(a0),d0			
						
	jbeq _?L314				
						
	move.b d0,27(a3)			
_?L304:						
						
	moveq #1,d0				
	move.l d0,(a3)				
						
	clr.b 4(a3)				
						
	clr.b 46(a3)				
						
	clr.l 42(a3)				
						
	clr.l 48(a3)				
						
	clr.l 52(a3)				
						
	clr.w 56(a3)				
						
	clr.b 58(a3)				
						
	clr.l 60(a3)				
						
	clr.l 68(a3)				
						
	clr.l 64(a3)				
						
	clr.l 76(a3)				
						
	clr.l 72(a3)				
						
	clr.l 84(a3)				
						
	clr.w 88(a3)				
						
	clr.b 90(a3)				
						
	pea 128.w				
	clr.l -(sp)				
	pea 92(a3)				
	jbsr _memset				
	lea (12,sp),sp				
						
	clr.l 80(a3)				
						
	clr.l 234(a3)				
						
	clr.l 238(a3)				
						
	clr.l 242(a3)				
						
	clr.l 246(a3)				
						
	clr.l 250(a3)				
						
	clr.l 220(a3)				
						
	clr.w 224(a3)				
						
	clr.w 226(a3)				
						
	clr.l 228(a3)				
						
	clr.b 232(a3)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L332:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L221				
_?L316:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L219				
_?L324:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L340				
_?L247:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L325:						
	lea _miniflac_bitreader_fill,a5		
_?L228:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
_?L354:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	bfextu d1{#26:#4},d2			
	move.l d1,d3				
	moveq #30,d0				
	lsl.l d0,d3				
						
	add.l d3,32(a3)				
	move.l 28(a3),d1			
	addx.l d2,d1				
	move.l d1,28(a3)			
						
	moveq #10,d2				
	move.l d2,38(a3)			
_?L227:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
_?L341:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #24,d3				
	lsl.l d3,d1				
	clr.l d2				
	clr.l d3				
	move.l d1,d3				
	and.l #1056964608,d3			
						
	add.l d3,32(a3)				
	move.l 28(a3),d4			
	addx.l d2,d4				
	move.l d4,28(a3)			
						
	moveq #11,d5				
	move.l d5,38(a3)			
_?L226:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
_?L342:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #18,d0				
	lsl.l d0,d1				
	clr.l d2				
	clr.l d3				
	move.l d1,d3				
	and.l #16515072,d3			
						
	add.l d3,32(a3)				
	move.l 28(a3),d1			
	addx.l d2,d1				
	move.l d1,28(a3)			
						
	moveq #12,d2				
	move.l d2,38(a3)			
_?L225:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #12,d3				
	lsl.l d3,d1				
	clr.l d2				
	clr.l d3				
	move.l d1,d3				
	and.l #258048,d3			
						
	add.l d3,32(a3)				
	move.l 28(a3),d4			
	addx.l d2,d4				
	move.l d4,28(a3)			
						
	moveq #13,d5				
	move.l d5,38(a3)			
_?L224:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	lsl.l #6,d1				
	clr.l d2				
	clr.l d3				
	move.l d1,d3				
	and.l #4032,d3				
						
	add.l d3,32(a3)				
	move.l 28(a3),d0			
	addx.l d2,d0				
	move.l d0,28(a3)			
						
	moveq #14,d1				
	move.l d1,38(a3)			
_?L223:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d1,d2				
						
	clr.l d0				
	clr.l d1				
	moveq #63,d1				
	and.l d2,d1				
						
	add.l d1,32(a3)				
	move.l 28(a3),d2			
	addx.l d0,d2				
	move.l d2,28(a3)			
						
	moveq #15,d3				
	move.l d3,38(a3)			
_?L222:						
						
	move.b 12(a3),d0			
	cmp.b #6,d0				
	jbeq _?L296				
	cmp.b #7,d0				
	jbne _?L298				
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.w #1,d1				
	move.w d1,16(a3)			
	jbra _?L298				
_?L326:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
	jbra _?L341				
_?L327:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
	jbra _?L342				
_?L328:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L225				
_?L329:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L224				
_?L330:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L223				
_?L331:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L222				
_?L320:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
_?L358:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,13(a3)			
	cmp.b #15,d1				
	jbhi _?L263				
	and.l #255,d1				
	add.l d1,d1				
	move.w _?L265(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L265:						
	.dc.w _?L266-_?L265			
	.dc.w _?L277-_?L265			
	.dc.w _?L276-_?L265			
	.dc.w _?L275-_?L265			
	.dc.w _?L274-_?L265			
	.dc.w _?L273-_?L265			
	.dc.w _?L272-_?L265			
	.dc.w _?L271-_?L265			
	.dc.w _?L270-_?L265			
	.dc.w _?L269-_?L265			
	.dc.w _?L268-_?L265			
	.dc.w _?L267-_?L265			
	.dc.w _?L266-_?L265			
	.dc.w _?L266-_?L265			
	.dc.w _?L266-_?L265			
	.dc.w _?L264-_?L265			
_?L321:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
_?L355:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d0,d2				
	move.l d1,d3				
						
	clr.l d4				
	moveq #10,d5				
	sub.l d3,d5				
	subx.l d2,d4				
	jbcs _?L308				
						
	clr.l d0				
	moveq #7,d1				
	sub.l d3,d1				
	subx.l d2,d0				
	jbcs _?L279				
						
	move.b d3,d1				
	addq.b #1,d1				
	move.b d1,26(a3)			
						
	clr.l 22(a3)				
						
	move.b d3,14(a3)			
						
	moveq #6,d1				
	move.l d1,38(a3)			
_?L231:						
						
	pea 3.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
_?L343:						
						
	pea 3.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d0,d2				
	move.l d1,d3				
	clr.l d4				
	moveq #7,d5				
	sub.l d3,d5				
	subx.l d2,d4				
	jbcs _?L282				
	move.l d1,d0				
	add.l d0,d0				
	move.w _?L283(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L283:						
	.dc.w _?L289-_?L283			
	.dc.w _?L288-_?L283			
	.dc.w _?L287-_?L283			
	.dc.w _?L311-_?L283			
	.dc.w _?L286-_?L283			
	.dc.w _?L285-_?L283			
	.dc.w _?L284-_?L283			
	.dc.w _?L311-_?L283			
_?L322:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 3.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
	jbra _?L343				
_?L323:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
_?L356:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d0,d2				
	or.l d1,d2				
	jbne _?L312				
						
	moveq #8,d3				
	move.l d3,38(a3)			
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
	jbra _?L340				
_?L318:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
_?L344:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,15(a3)			
						
	moveq #3,d4				
	move.l d4,38(a3)			
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
_?L345:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,12(a3)			
						
	clr.w 16(a3)				
	cmp.b #15,d1				
	jbhi _?L248				
	and.l #255,d1				
	add.l d1,d1				
	move.w _?L250(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L250:						
	.dc.w _?L307-_?L250			
	.dc.w _?L262-_?L250			
	.dc.w _?L261-_?L250			
	.dc.w _?L260-_?L250			
	.dc.w _?L259-_?L250			
	.dc.w _?L258-_?L250			
	.dc.w _?L248-_?L250			
	.dc.w _?L248-_?L250			
	.dc.w _?L257-_?L250			
	.dc.w _?L256-_?L250			
	.dc.w _?L255-_?L250			
	.dc.w _?L254-_?L250			
	.dc.w _?L253-_?L250			
	.dc.w _?L252-_?L250			
	.dc.w _?L251-_?L250			
	.dc.w _?L249-_?L250			
_?L317:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
_?L347:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d0,d2				
	or.l d1,d2				
	jbne _?L306				
						
	moveq #2,d3				
	move.l d3,38(a3)			
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
	jbra _?L344				
_?L319:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
	jbra _?L345				
_?L237:						
						
	move.l (a4),d6				
	move.l 4(a4),d7				
						
	move.b 8(a4),d0				
						
	clr.b 9(a4)				
						
	clr.w 10(a4)				
						
	clr.l 24(a4)				
						
	tst.b d0				
	jbeq _?L238				
	move.w #1,a1				
	clr.w d4				
	clr.b 39(sp)				
	lea _miniflac_crc8_table,a6		
	lea _miniflac_crc16_table,a5		
						
	move.w #-1,a2				
						
	subq.b #8,d0				
						
	clr.l d2				
	move.b d0,d2				
	move.w #-32,a0				
	add.l d2,a0				
	tst.l a0				
	jblt _?L239				
_?L361:						
	move.l d6,d5				
	move.l a0,d1				
	lsr.l d1,d5				
_?L240:						
						
	move.b d5,d1				
						
	tst.b d0				
	jbne _?L346				
						
	bfextu d4{#16:#8},d1			
						
	clr.l d0				
	move.b d5,d0				
	eor.l d0,d1				
						
	lsl.w #8,d4				
						
	move.b 39(sp),d3			
	eor.b d5,d3				
	and.l #255,d3				
	move.b (a6,d3.l),9(a4)			
	move.w (a5,d1.l*2),d1			
	eor.w d4,d1				
	move.w d1,10(a4)			
	move.l a1,24(a4)			
_?L238:						
						
	pea 14.w				
	move.l a4,-(sp)				
	lea _miniflac_bitreader_fill,a5		
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
						
	pea 14.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	clr.l d4				
	move.l #16382,d5			
	sub.l d1,d5				
	subx.l d0,d4				
	jbne _?L305				
						
	clr.w 12(a3)				
						
	clr.w 14(a3)				
						
	clr.w 16(a3)				
						
	clr.l 18(a3)				
						
	clr.l 22(a3)				
						
	clr.w 26(a3)				
						
	clr.l 28(a3)				
	clr.l 32(a3)				
						
	clr.b 36(a3)				
						
	moveq #1,d5				
	move.l d5,38(a3)			
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
	jbra _?L347				
_?L340:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	clr.l d2				
	clr.l d3				
	moveq #127,d3				
	not.b d3				
	and.l d1,d3				
						
	move.l d2,d4				
	or.l d3,d4				
	jbeq _?L348				
						
	clr.l d2				
	clr.l d3				
	moveq #31,d3				
	not.b d3				
	and.l d1,d3				
						
	clr.l d4				
	moveq #63,d5				
	not.b d5				
	sub.l d3,d5				
	subx.l d2,d4				
	jbeq _?L349				
						
	clr.l d2				
	clr.l d3				
	moveq #15,d3				
	not.b d3				
	and.l d1,d3				
						
	clr.l d4				
	moveq #31,d5				
	not.b d5				
	sub.l d3,d5				
	subx.l d2,d4				
	jbeq _?L350				
						
	clr.l d2				
	clr.l d3				
	moveq #7,d3				
	not.b d3				
	and.l d1,d3				
						
	clr.l d4				
	moveq #15,d5				
	not.b d5				
	sub.l d3,d5				
	subx.l d2,d4				
	jbeq _?L351				
						
	clr.l d2				
	clr.l d3				
	moveq #3,d3				
	not.b d3				
	and.l d1,d3				
						
	clr.l d4				
	moveq #7,d5				
	not.b d5				
	sub.l d3,d5				
	subx.l d2,d4				
	jbeq _?L352				
						
	clr.l d2				
	clr.l d3				
	moveq #1,d3				
	not.b d3				
	and.l d1,d3				
						
	clr.l d4				
	moveq #3,d5				
	not.b d5				
	sub.l d3,d5				
	subx.l d2,d4				
	jbeq _?L353				
						
	clr.l d2				
	clr.l d3				
	moveq #0,d3				
	not.b d3				
	and.l d1,d3				
						
	clr.l d4				
	moveq #1,d5				
	not.b d5				
	sub.l d3,d5				
	subx.l d2,d4				
	jbne _?L228				
						
	clr.l 28(a3)				
	clr.l 32(a3)				
						
	moveq #9,d5				
	move.l d5,38(a3)			
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
	jbra _?L354				
_?L339:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,d0				
	lsl.l #5,d0				
	sub.l d1,d0				
	lsl.l #2,d0				
	add.l d1,d0				
	lsl.l #3,d0				
	move.l d0,18(a3)			
						
	move.b 9(a4),36(a3)			
						
	moveq #17,d5				
	move.l d5,38(a3)			
	jbra _?L219				
_?L311:						
	moveq #-11,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L266:						
						
	clr.l 18(a3)				
_?L263:						
						
	moveq #5,d0				
	move.l d0,38(a3)			
_?L359:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
	jbra _?L355				
_?L285:						
						
	move.b #20,27(a3)			
_?L282:						
						
	moveq #7,d5				
	move.l d5,38(a3)			
_?L357:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
	jbra _?L356				
_?L286:						
						
	move.b #16,27(a3)			
						
	moveq #7,d5				
	move.l d5,38(a3)			
	jbra _?L357				
_?L288:						
						
	move.b #8,27(a3)			
						
	moveq #7,d5				
	move.l d5,38(a3)			
	jbra _?L357				
_?L284:						
						
	move.b #24,27(a3)			
						
	moveq #7,d5				
	move.l d5,38(a3)			
	jbra _?L357				
_?L289:						
						
	clr.b 27(a3)				
						
	moveq #7,d5				
	move.l d5,38(a3)			
	jbra _?L357				
_?L287:						
						
	move.b #12,27(a3)			
						
	moveq #7,d5				
	move.l d5,38(a3)			
	jbra _?L357				
_?L262:						
						
	move.w #192,16(a3)			
_?L248:						
						
	moveq #4,d5				
	move.l d5,38(a3)			
_?L360:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
	jbra _?L358				
_?L307:						
	moveq #-7,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L272:						
						
	move.l #22050,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L359				
_?L273:						
						
	move.l #16000,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L359				
_?L274:						
						
	move.l #8000,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L359				
_?L275:						
						
	move.l #192000,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L359				
_?L264:						
						
	moveq #-8,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L267:						
						
	move.l #96000,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L359				
_?L268:						
						
	move.l #48000,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L359				
_?L269:						
						
	move.l #44100,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L359				
_?L270:						
						
	move.l #32000,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L359				
_?L271:						
						
	move.l #24000,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L359				
_?L276:						
						
	move.l #176400,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L359				
_?L277:						
						
	move.l #88200,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L359				
_?L261:						
						
	move.w #576,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L360				
_?L257:						
						
	move.w #256,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L360				
_?L258:						
						
	move.w #4608,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L360				
_?L259:						
						
	move.w #2304,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L360				
_?L260:						
						
	move.w #1152,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L360				
_?L253:						
						
	move.w #4096,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L360				
_?L254:						
						
	move.w #2048,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L360				
_?L255:						
						
	move.w #1024,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L360				
_?L256:						
						
	move.w #512,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L360				
_?L251:						
						
	move.w #16384,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L360				
_?L252:						
						
	move.w #8192,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L360				
_?L249:						
						
	move.w #-32768,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L360				
_?L313:						
						
	moveq #-2,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L346:						
						
	move.w #64,a0				
	sub.l d2,a0				
						
	moveq #32,d5				
	sub.l d2,d5				
	jbmi _?L242				
	move.l a2,d2				
	lsr.l d5,d2				
	clr.l d5				
						
	and.l d5,d6				
	and.l d2,d7				
						
	move.b 39(sp),d3			
	eor.b d1,d3				
	and.l #255,d3				
						
	move.b (a6,d3.l),39(sp)			
						
	bfextu d4{#16:#8},d2			
						
	and.l #255,d1				
	eor.l d2,d1				
						
	lsl.w #8,d4				
						
	move.w (a5,d1.l*2),d1			
	eor.w d1,d4				
						
	addq.l #1,a1				
_?L362:						
						
	subq.b #8,d0				
						
	clr.l d2				
	move.b d0,d2				
	move.w #-32,a0				
	add.l d2,a0				
	tst.l a0				
	jbge _?L361				
_?L239:						
	moveq #31,d5				
	sub.l d2,d5				
	move.l d6,d1				
	add.l d1,d1				
	lsl.l d5,d1				
	move.l d7,d5				
	lsr.l d2,d5				
	or.l d1,d5				
	jbra _?L240				
_?L242:						
						
	moveq #31,d2				
	sub.l a0,d2				
	moveq #-2,d3				
	lsl.l d2,d3				
	move.l a2,d2				
	move.l a0,d5				
	lsr.l d5,d2				
	or.l d3,d2				
	move.l a2,d5				
	move.l a0,d3				
	lsr.l d3,d5				
						
	and.l d5,d6				
	and.l d2,d7				
						
	move.b 39(sp),d3			
	eor.b d1,d3				
	and.l #255,d3				
						
	move.b (a6,d3.l),39(sp)			
						
	bfextu d4{#16:#8},d2			
						
	and.l #255,d1				
	eor.l d2,d1				
						
	lsl.w #8,d4				
						
	move.w (a5,d1.l*2),d1			
	eor.w d1,d4				
						
	addq.l #1,a1				
	jbra _?L362				
_?L300:						
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,d0				
	lsl.l #2,d0				
	add.l d1,d0				
	add.l d0,d0				
	move.l d0,18(a3)			
						
	move.b 9(a4),36(a3)			
						
	moveq #17,d5				
	move.l d5,38(a3)			
	jbra _?L219				
_?L299:						
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,18(a3)			
						
	move.b 9(a4),36(a3)			
						
	moveq #17,d5				
	move.l d5,38(a3)			
	jbra _?L219				
_?L279:						
	clr.l d4				
	moveq #9,d5				
	sub.l d3,d5				
	subx.l d2,d4				
	jbeq _?L309				
	clr.l d0				
	moveq #10,d1				
	sub.l d3,d1				
	subx.l d2,d0				
	jbeq _?L310				
	moveq #1,d0				
						
	move.l d0,22(a3)			
						
	move.b #2,26(a3)			
_?L363:						
						
	move.b d3,14(a3)			
						
	moveq #6,d1				
	move.l d1,38(a3)			
	jbra _?L231				
_?L348:						
						
	move.l d0,28(a3)			
	move.l d1,32(a3)			
						
	moveq #15,d5				
	move.l d5,38(a3)			
						
	jbra _?L222				
_?L310:						
	moveq #3,d0				
						
	move.l d0,22(a3)			
						
	move.b #2,26(a3)			
	jbra _?L363				
_?L309:						
	moveq #2,d0				
						
	move.l d0,22(a3)			
						
	move.b #2,26(a3)			
	jbra _?L363				
_?L349:						
						
	lsl.l #6,d1				
	clr.l 28(a3)				
	and.l #1984,d1				
	move.l d1,32(a3)			
						
	moveq #14,d5				
	move.l d5,38(a3)			
						
	jbra _?L223				
_?L351:						
						
	moveq #18,d5				
	lsl.l d5,d1				
	clr.l 28(a3)				
	and.l #1835008,d1			
	move.l d1,32(a3)			
						
	moveq #12,d0				
	move.l d0,38(a3)			
						
	jbra _?L225				
_?L350:						
						
	moveq #12,d5				
	lsl.l d5,d1				
	clr.l 28(a3)				
	and.l #65535,d1				
	move.l d1,32(a3)			
						
	moveq #13,d0				
	move.l d0,38(a3)			
						
	jbra _?L224				
_?L353:						
						
	moveq #30,d5				
	lsl.l d5,d1				
	clr.l 28(a3)				
	and.l #1073741824,d1			
	move.l d1,32(a3)			
						
	moveq #10,d0				
	move.l d0,38(a3)			
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
	jbra _?L341				
_?L352:						
						
	moveq #24,d5				
	lsl.l d5,d1				
	clr.l 28(a3)				
	and.l #50331648,d1			
	move.l d1,32(a3)			
						
	moveq #11,d0				
	move.l d0,38(a3)			
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L247				
	jbra _?L342				
_?L314:						
						
	moveq #-9,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L312:						
						
	moveq #-6,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L338:						
						
	pea 863.w				
	pea _?LC0				
	pea _?LC5				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
_?L308:						
						
	moveq #-10,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L305:						
						
	moveq #-4,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L306:						
						
	moveq #-5,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
						
	.align	2				
						
_miniflac_picture_read_description_length:	
	movem.l d3/d4/d5/d6/d7/a3/a4/a5,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),a3			
						
	move.l (a4),d0				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbcc _?L365				
	subq.l #3,d0				
	jbne _?L403				
_?L366:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L386				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,4(a4)				
						
	clr.l 8(a4)				
						
	tst.l 44(sp)				
	jbeq _?L388				
						
	move.l 44(sp),a0			
	move.l d1,(a0)				
_?L388:						
						
	moveq #4,d0				
	move.l d0,(a4)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L403:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L365:						
						
	moveq #2,d6				
	cmp.l d0,d6				
	jbeq _?L404				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbne _?L405				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L406				
_?L386:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L404:						
						
	move.l 8(a4),a2				
						
	move.l 4(a4),d4				
_?L369:						
						
	cmp.l d4,a2				
	jbcc _?L387				
						
	move.b 8(a3),d3				
	addq.l #1,a2				
_?L376:						
						
	cmp.b #7,d3				
	jbhi _?L407				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L386				
						
	move.l 20(a3),a0			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,12(a3)			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d5				
	move.l d1,d0				
	or.b (a0,d2.l),d0			
						
	addq.l #1,24(a3)			
	move.b d3,d2				
						
	move.b d2,8(a3)				
						
	jbeq _?L389				
_?L408:						
						
	clr.l d1				
	move.b d2,d1				
						
	moveq #64,d7				
	sub.l d1,d7				
						
	moveq #32,d6				
	sub.l d1,d6				
	jbmi _?L373				
	moveq #-1,d1				
	lsr.l d6,d1				
	clr.l d6				
						
	and.l d6,d5				
	and.l d1,d0				
_?L372:						
	move.l d5,(a3)				
	move.l d0,4(a3)				
						
	move.l a2,8(a4)				
						
	cmp.l d4,a2				
	jbeq _?L387				
	move.l a2,d0				
	addq.l #1,d0				
	cmp.b #7,d3				
	jbhi _?L390				
						
	move.l 16(a3),a1			
						
	clr.l d0				
	move.b d2,d0				
	moveq #64,d3				
	sub.l d0,d3				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L377				
	moveq #-1,d5				
	lsr.l d1,d5				
	clr.l d6				
_?L382:						
						
	move.l 12(a3),d0			
						
	cmp.l d0,a1				
	jbls _?L386				
						
	move.l 20(a3),a0			
						
	move.l d0,d1				
	addq.l #1,d1				
	move.l d1,12(a3)			
						
	move.b (a0,d0.l),d3			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
						
	addq.l #1,24(a3)			
						
	move.b d2,8(a3)				
						
	jbeq _?L380				
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	or.b d3,d1				
						
	move.l d6,d3				
	and.l d0,d3				
	move.l d3,(a3)				
	and.l d5,d1				
	move.l d1,4(a3)				
						
	addq.l #1,a2				
	move.l a2,8(a4)				
						
	cmp.l a2,d4				
	jbhi _?L382				
_?L387:						
						
	moveq #3,d6				
	move.l d6,(a4)				
	jbra _?L366				
_?L407:						
						
	move.b d3,d2				
	subq.b #8,d2				
						
	move.l (a3),d5				
	move.l 4(a3),d0				
						
	move.b d2,8(a3)				
						
	jbne _?L408				
_?L389:						
	clr.l d5				
	clr.l d0				
	jbra _?L372				
_?L405:						
						
	pea 32.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L386				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d3				
	move.l d3,(a4)				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L386				
_?L406:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d1,d4				
						
	move.l d1,4(a4)				
						
	clr.l 8(a4)				
						
	moveq #2,d6				
	move.l d6,(a4)				
	sub.l a2,a2				
	jbra _?L369				
_?L380:						
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,a2				
	move.l a2,8(a4)				
						
	cmp.l a2,d4				
	jbhi _?L382				
						
	moveq #3,d6				
	move.l d6,(a4)				
	jbra _?L366				
_?L377:						
						
	moveq #-1,d6				
	moveq #31,d1				
	sub.l d3,d1				
	moveq #-2,d0				
	lsl.l d1,d0				
	move.l d6,d5				
	lsr.l d3,d5				
	or.l d0,d5				
	lsr.l d3,d6				
	jbra _?L382				
_?L373:						
	move.w #-1,a5				
	move.w #31,a1				
	sub.l d7,a1				
	moveq #-2,d1				
	move.l a1,d6				
	lsl.l d6,d1				
	move.l d1,a0				
	move.l a5,d1				
	lsr.l d7,d1				
	move.l a0,d6				
	or.l d6,d1				
	move.l a5,d6				
	lsr.l d7,d6				
						
	and.l d6,d5				
	and.l d1,d0				
	jbra _?L372				
_?L390:						
						
	move.l d0,a2				
	move.b d2,d3				
	jbra _?L376				
						
	.align	2				
						
_miniflac_picture_read_colordepth:		
	movem.l d3/d4/d5/a3/a4/a5,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d3			
						
	move.l (a3),d0				
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcc _?L410				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #7,d0				
	jbne _?L439				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L440				
_?L420:						
	clr.l d0				
_?L409:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4/a5		
	rts					
_?L439:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/a3/a4/a5		
	rts					
_?L440:						
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 36(sp)				
	jbeq _?L421				
						
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L421:						
						
	moveq #8,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/a3/a4/a5		
	rts					
_?L410:						
						
	moveq #6,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbne _?L441				
_?L413:						
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L420				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #7,d1				
	move.l d1,(a3)				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L420				
	jbra _?L440				
_?L441:						
						
	moveq #5,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbeq _?L414				
						
	subq.l #4,d0				
	jbeq _?L419				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_picture_read_description_length
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L409				
_?L419:						
						
	move.l 8(a3),d4				
						
	move.l 4(a3),d5				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	cmp.l d4,d5				
	jbls _?L416				
	addq.l #1,d4				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
_?L418:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L420				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l d4,8(a3)				
						
	move.l d4,d0				
	addq.l #1,d0				
	cmp.l d5,d4				
	jbeq _?L416				
	move.l d0,d4				
	jbra _?L418				
_?L416:						
						
	moveq #5,d0				
	move.l d0,(a3)				
_?L414:						
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L420				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d0				
	move.l d0,(a3)				
	jbra _?L413				
						
	.align	2				
						
_miniflac_picture_read_width:			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 40(sp),a4			
	move.l 44(sp),a3			
						
	move.l (a4),d0				
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbcc _?L443				
	subq.l #5,d0				
	jbne _?L492				
_?L444:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L466				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 48(sp)				
	jbeq _?L472				
						
	move.l 48(sp),a0			
	move.l d1,(a0)				
_?L472:						
						
	moveq #6,d0				
	move.l d0,(a4)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L492:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L443:						
						
	moveq #4,d6				
	cmp.l d0,d6				
	jbeq _?L493				
						
	moveq #3,d1				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d1				
	jbne _?L494				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L495				
_?L466:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L493:						
						
	move.l 4(a4),d4				
						
	move.l 8(a4),a2				
_?L447:						
						
	cmp.l a2,d4				
	jbls _?L471				
						
	move.b 8(a3),d3				
	addq.l #1,a2				
_?L454:						
						
	cmp.b #7,d3				
	jbhi _?L496				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L466				
						
	move.l 20(a3),a0			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,12(a3)			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d5				
	move.l d1,d0				
	or.b (a0,d2.l),d0			
						
	addq.l #1,24(a3)			
	move.b d3,d2				
						
	move.b d2,8(a3)				
						
	jbeq _?L473				
_?L497:						
						
	clr.l d1				
	move.b d2,d1				
						
	moveq #64,d7				
	sub.l d1,d7				
						
	moveq #32,d6				
	sub.l d1,d6				
	jbmi _?L451				
	moveq #-1,d1				
	lsr.l d6,d1				
	clr.l d6				
						
	and.l d6,d5				
	and.l d1,d0				
_?L450:						
	move.l d5,(a3)				
	move.l d0,4(a3)				
						
	move.l a2,8(a4)				
						
	cmp.l d4,a2				
	jbeq _?L471				
	move.l a2,d0				
	addq.l #1,d0				
	cmp.b #7,d3				
	jbhi _?L474				
						
	move.l 16(a3),a1			
						
	clr.l d0				
	move.b d2,d0				
	moveq #64,d3				
	sub.l d0,d3				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L455				
	moveq #-1,d5				
	lsr.l d1,d5				
	clr.l d6				
_?L460:						
						
	move.l 12(a3),d0			
						
	cmp.l d0,a1				
	jbls _?L466				
						
	move.l 20(a3),a0			
						
	move.l d0,d1				
	addq.l #1,d1				
	move.l d1,12(a3)			
						
	move.b (a0,d0.l),d3			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
						
	addq.l #1,24(a3)			
						
	move.b d2,8(a3)				
						
	jbeq _?L458				
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	or.b d3,d1				
						
	move.l d6,d3				
	and.l d0,d3				
	move.l d3,(a3)				
	and.l d5,d1				
	move.l d1,4(a3)				
						
	addq.l #1,a2				
	move.l a2,8(a4)				
						
	cmp.l a2,d4				
	jbhi _?L460				
_?L471:						
						
	moveq #5,d6				
	move.l d6,(a4)				
	jbra _?L444				
_?L496:						
						
	move.b d3,d2				
	subq.b #8,d2				
						
	move.l (a3),d5				
	move.l 4(a3),d0				
						
	move.b d2,8(a3)				
						
	jbne _?L497				
_?L473:						
	clr.l d5				
	clr.l d0				
	jbra _?L450				
_?L494:						
						
	moveq #2,d3				
	cmp.l d0,d3				
	jbne _?L464				
						
	move.l 4(a4),d4				
						
	move.l 8(a4),d0				
	lea _miniflac_bitreader_fill_nocrc,a5	
	move.l d0,d3				
	addq.l #1,d3				
						
	lea _miniflac_bitreader_read,a6		
						
	cmp.l d4,d0				
	jbcc _?L470				
_?L467:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L466				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l d3,8(a4)				
						
	move.l d3,d0				
	addq.l #1,d0				
	cmp.l d4,d3				
	jbeq _?L470				
	move.l d0,d3				
	jbra _?L467				
_?L495:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d1,d4				
						
	move.l d1,4(a4)				
						
	clr.l 8(a4)				
						
	moveq #4,d0				
	move.l d0,(a4)				
	sub.l a2,a2				
	jbra _?L447				
_?L470:						
						
	moveq #3,d6				
	move.l d6,(a4)				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L466				
	jbra _?L495				
_?L458:						
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,a2				
	move.l a2,8(a4)				
						
	cmp.l d4,a2				
	jbcs _?L460				
						
	moveq #5,d6				
	move.l d6,(a4)				
	jbra _?L444				
_?L455:						
						
	moveq #-1,d6				
	moveq #31,d1				
	sub.l d3,d1				
	moveq #-2,d0				
	lsl.l d1,d0				
	move.l d6,d5				
	lsr.l d3,d5				
	or.l d0,d5				
	lsr.l d3,d6				
	jbra _?L460				
_?L451:						
	move.w #-1,a5				
	move.w #31,a1				
	sub.l d7,a1				
	moveq #-2,d1				
	move.l a1,d6				
	lsl.l d6,d1				
	move.l d1,a0				
	move.l a5,d1				
	lsr.l d7,d1				
	move.l a0,d6				
	or.l d6,d1				
	move.l a5,d6				
	lsr.l d7,d6				
						
	and.l d6,d5				
	and.l d1,d0				
	jbra _?L450				
_?L464:						
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbeq _?L468				
						
	pea 32.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L466				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d3				
	move.l d3,(a4)				
_?L468:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L466				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d1,d4				
						
	move.l d1,4(a4)				
						
	clr.l 8(a4)				
						
	moveq #2,d6				
	move.l d6,(a4)				
	clr.l d0				
	move.l d0,d3				
	addq.l #1,d3				
						
	lea _miniflac_bitreader_read,a6		
						
	cmp.l d4,d0				
	jbcs _?L467				
	jbra _?L470				
_?L474:						
						
	move.l d0,a2				
	move.b d2,d3				
	jbra _?L454				
						
	.align	2				
						
_miniflac_vorbis_comment_read_length:		
	movem.l d3/d4/d5/d6/a3/a4/a5/a6,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),a3			
						
	move.l (a4),d0				
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbeq _?L499				
	jbcc _?L500				
	subq.l #4,d0				
	jbne _?L530				
						
	move.l 8(a4),d5				
						
	move.l 4(a4),d3				
						
	lea _miniflac_bitreader_read,a5		
						
	cmp.l d5,d3				
	jbls _?L505				
_?L504:						
						
	move.b 8(a3),d4				
						
	cmp.b #7,d4				
	jbhi _?L515				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L511				
						
	move.l 20(a3),a0			
						
	move.l d2,d1				
	addq.l #1,d1				
	move.l d1,12(a3)			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.b (a0,d2.l),d2			
	and.l #255,d2				
	clr.l d6				
	or.l d0,d6				
	move.l d6,(a3)				
	or.l d1,d2				
	move.l d2,4(a3)				
						
	addq.b #8,d4				
	move.b d4,8(a3)				
						
	addq.l #1,24(a3)			
_?L515:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	addq.l #1,d5				
	move.l d5,8(a4)				
						
	cmp.l d5,d3				
	jbne _?L504				
_?L505:						
						
	move.l 16(a4),d1			
	addq.l #1,d1				
	move.l d1,16(a4)			
						
	moveq #3,d0				
	move.l d0,(a4)				
						
	move.l 12(a4),d0			
_?L503:						
						
	cmp.l d1,d0				
	jbeq _?L519				
_?L533:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L531				
_?L511:						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5/a6	
	rts					
_?L500:						
						
	moveq #2,d6				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d6				
	jbne _?L532				
_?L506:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L511				
						
	pea 8.w					
	move.l a3,-(sp)				
	lea _miniflac_bitreader_read,a5		
	jbsr (a5)				
	addq.l #8,sp				
	move.l d1,d4				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d1,d3				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d1,d5				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	clr.l d0				
	move.b d3,d0				
						
	lsl.l #8,d0				
						
	and.l #255,d5				
						
	swap d5					
	clr.w d5				
						
	or.l d5,d0				
	or.b d4,d0				
						
	moveq #24,d2				
	lsl.l d2,d1				
						
	or.l d1,d0				
						
	move.l d0,12(a4)			
						
	moveq #3,d6				
	move.l d6,(a4)				
						
	move.l 16(a4),d1			
						
	cmp.l d1,d0				
	jbne _?L533				
_?L519:						
						
	moveq #2,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5/a6	
	rts					
_?L530:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5/a6	
	rts					
_?L499:						
						
	move.l 16(a4),d1			
						
	move.l 12(a4),d0			
	jbra _?L503				
_?L531:						
						
	pea 8.w					
	move.l a3,-(sp)				
	lea _miniflac_bitreader_read,a5		
	jbsr (a5)				
	addq.l #8,sp				
	move.l d1,d4				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d1,d3				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d1,d5				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	clr.l d0				
	move.b d3,d0				
						
	lsl.l #8,d0				
						
	and.l #255,d5				
						
	swap d5					
	clr.w d5				
						
	or.l d5,d0				
	or.b d4,d0				
						
	moveq #24,d2				
	lsl.l d2,d1				
						
	or.l d0,d1				
						
	move.l d1,4(a4)				
						
	clr.l 8(a4)				
						
	tst.l 44(sp)				
	jbeq _?L514				
						
	move.l 44(sp),a0			
	move.l d1,(a0)				
_?L514:						
						
	moveq #4,d0				
	move.l d0,(a4)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5/a6	
	rts					
_?L532:						
						
	subq.l #1,d0				
	jbeq _?L534				
						
	pea 32.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L511				
						
	pea 8.w					
	move.l a3,-(sp)				
	lea _miniflac_bitreader_read,a6		
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,d5				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,d3				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,d6				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	clr.l d4				
	move.b d3,d4				
						
	lsl.l #8,d4				
						
	clr.l d0				
	move.b d6,d0				
						
	swap d0					
	clr.w d0				
						
	or.l d0,d4				
	or.b d5,d4				
						
	moveq #24,d6				
	lsl.l d6,d1				
						
	or.l d1,d4				
						
	move.l d4,4(a4)				
						
	moveq #1,d0				
	move.l d0,(a4)				
						
	move.l 8(a4),d0				
	move.l d0,d3				
	addq.l #1,d3				
						
	lea _miniflac_bitreader_read,a6		
						
	cmp.l d4,d0				
	jbcc _?L513				
_?L510:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L511				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l d3,8(a4)				
						
	move.l d3,d0				
	addq.l #1,d0				
	cmp.l d3,d4				
	jbeq _?L513				
	move.l d0,d3				
	jbra _?L510				
_?L534:						
						
	move.l 4(a4),d4				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	move.l 8(a4),d0				
	move.l d0,d3				
	addq.l #1,d3				
						
	lea _miniflac_bitreader_read,a6		
						
	cmp.l d4,d0				
	jbcs _?L510				
_?L513:						
						
	moveq #2,d2				
	move.l d2,(a4)				
	jbra _?L506				
						
	.align	2				
						
_miniflac_cuesheet_read_track_audio_flag:	
	movem.l d3/d4/d5/d6/d7/a3/a4,-(sp)	
	move.l 32(sp),a4			
	move.l 36(sp),a3			
						
	move.l (a4),d0				
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcc _?L536				
	subq.l #8,d0				
	jbne _?L563				
						
	move.b 8(a3),d2				
						
	jbne _?L553				
_?L554:						
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L562				
						
	move.l 20(a3),a0			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,12(a3)			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.b (a0,d2.l),d2			
	and.l #255,d2				
	clr.l d3				
	or.l d0,d3				
	move.l d3,(a3)				
	or.l d1,d2				
	move.l d2,4(a3)				
						
	move.b #8,8(a3)				
						
	addq.l #1,24(a3)			
_?L553:						
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 40(sp)				
	jbeq _?L559				
_?L558:						
						
	move.l 40(sp),a0			
	move.b d1,(a0)				
_?L559:						
						
	moveq #9,d0				
	move.l d0,(a4)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L562:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L563:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L536:						
						
	subq.l #7,d0				
	jbne _?L539				
_?L560:						
						
	move.l 4(a4),a2				
						
	move.b 8(a3),d2				
						
	moveq #11,d3				
	cmp.l a2,d3				
	jbcs _?L541				
	addq.l #1,a2				
	move.b d2,d5				
						
	moveq #-1,d6				
	move.w #-2,a1				
_?L547:						
						
	cmp.b #7,d2				
	jbhi _?L576				
						
	move.l 12(a3),d3			
						
	cmp.l 16(a3),d3				
	jbcc _?L562				
						
	move.l 20(a3),a0			
						
	move.l d3,d0				
	addq.l #1,d0				
	move.l d0,12(a3)			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d0				
	or.b (a0,d3.l),d0			
						
	addq.l #1,24(a3)			
						
	move.b d2,8(a3)				
						
	jbeq _?L564				
_?L577:						
						
	clr.l d1				
	move.b d2,d1				
						
	moveq #64,d7				
	sub.l d1,d7				
						
	moveq #32,d3				
	sub.l d1,d3				
	jbmi _?L545				
	move.l d6,d1				
	lsr.l d3,d1				
	clr.l d3				
						
	and.l d4,d3				
	and.l d1,d0				
_?L544:						
	move.l d3,(a3)				
	move.l d0,4(a3)				
						
	move.l a2,4(a4)				
						
	moveq #12,d1				
	cmp.l a2,d1				
	jbeq _?L541				
	move.l a2,d0				
	addq.l #1,d0				
	cmp.b #7,d5				
	jbhi _?L565				
						
	move.l 16(a3),a1			
						
	clr.l d0				
	move.b d2,d0				
	moveq #64,d3				
	sub.l d0,d3				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L548				
	moveq #-1,d4				
	lsr.l d1,d4				
	clr.l d5				
_?L555:						
						
	move.l 12(a3),d0			
						
	cmp.l d0,a1				
	jbls _?L562				
						
	move.l 20(a3),a0			
						
	move.l d0,d3				
	addq.l #1,d3				
	move.l d3,12(a3)			
						
	move.b (a0,d0.l),d3			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
						
	addq.l #1,24(a3)			
						
	move.b d2,8(a3)				
						
	jbeq _?L551				
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	or.b d3,d1				
						
	move.l d5,d3				
	and.l d0,d3				
	move.l d3,(a3)				
	and.l d4,d1				
	move.l d1,4(a3)				
						
	addq.l #1,a2				
	move.l a2,4(a4)				
						
	moveq #12,d0				
	cmp.l a2,d0				
	jbne _?L555				
						
	clr.l 4(a4)				
						
	moveq #8,d1				
	move.l d1,(a4)				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 40(sp)				
	jbne _?L558				
	jbra _?L559				
_?L539:						
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
						
	moveq #1,d3				
	cmp.l d0,d3				
	jbeq _?L560				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L576:						
						
	subq.b #8,d2				
						
	move.l (a3),d4				
	move.l 4(a3),d0				
						
	move.b d2,8(a3)				
						
	jbne _?L577				
_?L564:						
	clr.l d3				
	clr.l d0				
	jbra _?L544				
_?L551:						
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,a2				
	move.l a2,4(a4)				
						
	moveq #12,d3				
	cmp.l a2,d3				
	jbne _?L555				
						
	clr.l 4(a4)				
						
	moveq #8,d0				
	move.l d0,(a4)				
	jbra _?L554				
_?L548:						
						
	moveq #-1,d5				
	moveq #31,d1				
	sub.l d3,d1				
	moveq #-2,d0				
	lsl.l d1,d0				
	move.l d5,d4				
	lsr.l d3,d4				
	or.l d0,d4				
	lsr.l d3,d5				
	jbra _?L555				
_?L545:						
	moveq #31,d1				
	sub.l d7,d1				
	move.l a1,d3				
	lsl.l d1,d3				
	move.l d6,d1				
	lsr.l d7,d1				
	or.l d3,d1				
	move.l d6,d3				
	lsr.l d7,d3				
						
	and.l d4,d3				
	and.l d1,d0				
	jbra _?L544				
_?L541:						
						
	clr.l 4(a4)				
						
	moveq #8,d1				
	move.l d1,(a4)				
						
	tst.b d2				
	jbeq _?L554				
	jbra _?L553				
_?L565:						
						
	move.l d0,a2				
	move.b d2,d5				
	jbra _?L547				
						
	.align	2				
						
_miniflac_cuesheet_read_track_indexpoints:	
	movem.l d3/d4/d5/d6/d7/a3/a4/a5,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),a3			
						
	move.l (a4),a0				
						
	moveq #11,d0				
	cmp.l a0,d0				
	jbeq _?L579				
	jbcs _?L580				
	moveq #10,d1				
	cmp.l a0,d1				
	jbeq _?L581				
						
	moveq #9,d2				
	cmp.l a0,d2				
	jbne _?L583				
_?L582:						
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L599				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b 8(a3),d0				
	cmp.b #5,d0				
	jbls _?L640				
						
	subq.b #6,d0				
	move.b d0,8(a3)				
						
	jbeq _?L614				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L594				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	clr.l 4(a4)				
						
	moveq #10,d0				
	move.l d0,(a4)				
	sub.l a2,a2				
_?L586:						
						
	move.b 8(a3),d3				
	addq.l #1,a2				
_?L596:						
						
	cmp.b #7,d3				
	jbhi _?L641				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L599				
						
	move.l 20(a3),a0			
						
	move.l d2,d1				
	addq.l #1,d1				
	move.l d1,12(a3)			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d0				
	or.b (a0,d2.l),d0			
						
	addq.l #1,24(a3)			
	move.b d3,d1				
_?L597:						
						
	move.b d1,8(a3)				
						
	jbeq _?L615				
						
	clr.l d2				
	move.b d1,d2				
						
	moveq #64,d6				
	sub.l d2,d6				
						
	moveq #32,d5				
	sub.l d2,d5				
	jbmi _?L601				
	moveq #-1,d2				
	lsr.l d5,d2				
	clr.l d5				
						
	and.l d5,d4				
	and.l d2,d0				
_?L600:						
	move.l d4,(a3)				
	move.l d0,4(a3)				
						
	move.l a2,4(a4)				
						
	moveq #13,d0				
	cmp.l a2,d0				
	jbeq _?L587				
	move.l a2,d0				
	addq.l #1,d0				
	cmp.b #7,d3				
	jbhi _?L616				
						
	move.l 16(a3),a1			
						
	clr.l d0				
	move.b d1,d0				
	moveq #64,d3				
	sub.l d0,d3				
						
	moveq #32,d2				
	sub.l d0,d2				
	jbmi _?L604				
	moveq #-1,d4				
	lsr.l d2,d4				
	clr.l d5				
_?L610:						
						
	move.l 12(a3),d0			
						
	cmp.l a1,d0				
	jbcc _?L599				
						
	move.l 20(a3),a0			
						
	move.l d0,d2				
	addq.l #1,d2				
	move.l d2,12(a3)			
						
	move.b (a0,d0.l),d0			
						
	move.l (a3),d2				
	move.l 4(a3),d3				
						
	addq.l #1,24(a3)			
						
	move.b d1,8(a3)				
						
	jbeq _?L607				
						
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	or.b d0,d3				
						
	move.l d5,d0				
	and.l d2,d0				
	move.l d0,(a3)				
	and.l d4,d3				
	move.l d3,4(a3)				
						
	addq.l #1,a2				
	move.l a2,4(a4)				
						
	moveq #13,d2				
	cmp.l a2,d2				
	jbne _?L610				
_?L587:						
						
	moveq #11,d1				
	move.l d1,(a4)				
_?L579:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L642				
_?L599:						
						
	clr.l d0				
_?L578:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L580:						
						
	lea (-12,a0),a0				
	lea _miniflac_cuesheet_read_index_point_offset,a5
	moveq #2,d0				
	cmp.l a0,d0				
	jbcs _?L590				
_?L584:						
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbne _?L588				
						
	moveq #5,d0				
	cmp.l (a4),d0				
	jbne _?L584				
						
	moveq #1,d0				
_?L643:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L588:						
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbne _?L578				
						
	move.l (a4),d0				
						
	moveq #8,d2				
	cmp.l d0,d2				
	jbcc _?L583				
	moveq #9,d1				
	cmp.l d0,d1				
	jbeq _?L582				
_?L590:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L581:						
						
	move.l 4(a4),a2				
						
	moveq #12,d1				
	cmp.l a2,d1				
	jbcs _?L587				
						
	move.b 8(a3),d3				
	addq.l #1,a2				
	jbra _?L596				
_?L642:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,11(a4)			
						
	tst.l 44(sp)				
	jbeq _?L613				
						
	move.l 44(sp),a0			
	move.b d1,(a0)				
_?L613:						
						
	clr.b 10(a4)				
						
	moveq #12,d0				
	move.l d0,(a4)				
						
	moveq #1,d0				
	jbra _?L643				
_?L583:						
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_cuesheet_read_track_audio_flag
	lea (12,sp),sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L582				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L641:						
						
	move.b d3,d1				
	subq.b #8,d1				
						
	move.l (a3),d4				
	move.l 4(a3),d0				
	jbra _?L597				
_?L615:						
	clr.l d4				
	clr.l d0				
	jbra _?L600				
_?L607:						
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,a2				
	move.l a2,4(a4)				
						
	moveq #13,d0				
	cmp.l a2,d0				
	jbne _?L610				
						
	moveq #11,d1				
	move.l d1,(a4)				
	jbra _?L579				
_?L604:						
						
	moveq #-1,d5				
	moveq #31,d2				
	sub.l d3,d2				
	moveq #-2,d0				
	lsl.l d2,d0				
	move.l d5,d4				
	lsr.l d3,d4				
	or.l d0,d4				
	lsr.l d3,d5				
	jbra _?L610				
_?L614:						
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	clr.l 4(a4)				
						
	moveq #10,d0				
	move.l d0,(a4)				
	sub.l a2,a2				
	jbra _?L586				
_?L601:						
						
	moveq #-1,d5				
	move.w #31,a1				
	sub.l d6,a1				
	moveq #-2,d7				
	move.l a1,d2				
	lsl.l d2,d7				
	move.l d5,d2				
	lsr.l d6,d2				
	or.l d7,d2				
	lsr.l d6,d5				
						
	and.l d5,d4				
	and.l d2,d0				
	jbra _?L600				
_?L594:						
						
	moveq #-1,d1				
	moveq #31,d0				
	sub.l d2,d0				
	moveq #-2,d3				
	lsl.l d0,d3				
	move.l d1,d0				
	lsr.l d2,d0				
	or.l d3,d0				
	lsr.l d2,d1				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	clr.l 4(a4)				
						
	moveq #10,d0				
	move.l d0,(a4)				
	sub.l a2,a2				
	jbra _?L586				
_?L616:						
						
	move.l d0,a2				
	move.b d1,d3				
	jbra _?L596				
_?L640:						
	jbsr (_miniflac_bitreader_discard?part?0)
						
	.align	2				
						
_miniflac_cuesheet_read_index_point_offset:	
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 44(sp),a4			
	move.l 48(sp),a3			
						
	move.l (a4),d0				
						
	moveq #13,d1				
	cmp.l d0,d1				
	jbeq _?L645				
	jbcs _?L646				
	moveq #12,d2				
	cmp.l d0,d2				
	jbeq _?L700				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_cuesheet_read_track_indexpoints
	lea (12,sp),sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L700				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L646:						
						
	moveq #14,d3				
	cmp.l d0,d3				
	jbne _?L684				
						
	move.l 4(a4),a1				
						
	moveq #2,d6				
	cmp.l a1,d6				
	jbcs _?L651				
_?L650:						
						
	move.b 8(a3),d3				
						
	cmp.b #7,d3				
	jbhi _?L703				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L670				
						
	move.l 20(a3),a0			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,12(a3)			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d6				
	move.l d1,d0				
	or.b (a0,d2.l),d0			
						
	addq.l #1,24(a3)			
	move.b d3,d1				
_?L655:						
						
	move.b d1,8(a3)				
						
	jbeq _?L685				
						
	clr.l d2				
	move.b d1,d2				
						
	moveq #64,d5				
	sub.l d2,d5				
						
	moveq #32,d4				
	sub.l d2,d4				
	jbmi _?L658				
	moveq #-1,d2				
	lsr.l d4,d2				
	clr.l d7				
						
	move.l d7,d4				
	and.l d6,d4				
	move.l d2,d5				
	and.l d0,d5				
_?L657:						
	move.l d4,(a3)				
	move.l d5,4(a3)				
						
	lea (1,a1),a0				
	move.l a0,4(a4)				
						
	moveq #3,d2				
	cmp.l a0,d2				
	jbeq _?L651				
	cmp.b #7,d3				
	jbhi _?L704				
_?L661:						
						
	move.l 12(a3),d0			
						
	move.l 16(a3),a1			
						
	cmp.l d0,a1				
	jbls _?L670				
						
	move.l 20(a3),a2			
						
	move.l d0,d4				
	addq.l #1,d4				
	move.l d4,12(a3)			
						
	move.b (a2,d0.l),d6			
						
	move.l (a3),d2				
	move.l 4(a3),d3				
						
	move.l 24(a3),d5			
						
	move.l d5,d7				
	addq.l #1,d7				
	move.l d7,24(a3)			
						
	move.b d1,8(a3)				
						
	jbeq _?L689				
						
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,a6				
	move.l d3,d7				
	or.b d6,d7				
	move.l d7,36(sp)			
						
	clr.l d6				
	move.b d1,d6				
						
	moveq #64,d2				
	sub.l d6,d2				
						
	moveq #32,d3				
	sub.l d6,d3				
	jbmi _?L675				
	moveq #-1,d6				
	lsr.l d3,d6				
	sub.l a5,a5				
						
	move.l a6,d2				
	move.l a5,d7				
	and.l d7,d2				
	move.l 36(sp),d3			
	and.l d6,d3				
_?L674:						
	move.l d2,(a3)				
	move.l d3,4(a3)				
						
	addq.l #1,a0				
	move.l a0,4(a4)				
						
	moveq #2,d6				
	cmp.l a0,d6				
	jbne _?L651				
						
	cmp.l a1,d4				
	jbcc _?L670				
						
	addq.l #2,d0				
	move.l d0,12(a3)			
						
	move.b (a2,d4.l),d0			
						
	addq.l #2,d5				
	move.l d5,24(a3)			
						
	move.b d1,8(a3)				
						
	jbeq _?L690				
						
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d4				
	move.l d3,d2				
	or.b d0,d2				
						
	and.l #255,d1				
						
	moveq #64,d3				
	sub.l d1,d3				
						
	moveq #32,d5				
	sub.l d1,d5				
	jbmi _?L678				
	moveq #-1,d0				
	lsr.l d5,d0				
	clr.l d1				
						
	and.l d4,d1				
	and.l d2,d0				
_?L677:						
	move.l d1,(a3)				
	move.l d0,4(a3)				
						
	moveq #3,d7				
	move.l d7,4(a4)				
_?L651:						
						
	move.b 10(a4),d0			
	addq.b #1,d0				
	move.b d0,10(a4)			
						
	moveq #12,d1				
	move.l d1,(a4)				
_?L652:						
						
	cmp.b 11(a4),d0				
	jbeq _?L705				
_?L682:						
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L706				
_?L670:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L700:						
						
	move.b 10(a4),d0			
						
	cmp.b 11(a4),d0				
	jbne _?L682				
_?L705:						
						
	addq.b #1,8(a4)				
						
	moveq #5,d3				
	move.l d3,(a4)				
	moveq #2,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L684:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L706:						
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 52(sp)				
	jbeq _?L683				
						
	move.l 52(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L683:						
						
	moveq #13,d0				
	move.l d0,(a4)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L703:						
						
	move.b d3,d1				
	subq.b #8,d1				
						
	move.l (a3),d6				
	move.l 4(a3),d0				
	jbra _?L655				
_?L645:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L670				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	clr.l 4(a4)				
						
	moveq #14,d7				
	move.l d7,(a4)				
	sub.l a1,a1				
	jbra _?L650				
_?L685:						
						
	clr.l d4				
	clr.l d5				
	jbra _?L657				
_?L704:						
						
	cmp.b #7,d1				
	jbhi _?L707				
						
	move.l 12(a3),d0			
						
	cmp.l 16(a3),d0				
	jbcc _?L670				
						
	move.l 20(a3),a0			
						
	move.l d0,d3				
	addq.l #1,d3				
	move.l d3,12(a3)			
						
	move.l d4,d2				
	move.l d5,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d4				
	move.l d3,d5				
	or.b (a0,d0.l),d5			
						
	addq.l #1,24(a3)			
	move.b d1,d6				
_?L663:						
						
	move.b d6,8(a3)				
						
	jbeq _?L686				
						
	clr.l d0				
	move.b d6,d0				
						
	moveq #64,d3				
	sub.l d0,d3				
						
	moveq #32,d2				
	sub.l d0,d2				
	jbmi _?L665				
	moveq #-1,d0				
	lsr.l d2,d0				
	clr.l d7				
						
	move.l d7,d2				
	and.l d4,d2				
	move.l d0,d3				
	and.l d5,d3				
_?L664:						
	move.l d2,(a3)				
	move.l d3,4(a3)				
						
	lea (2,a1),a0				
	move.l a0,4(a4)				
						
	moveq #2,d7				
	cmp.l a0,d7				
	jbne _?L651				
	cmp.b #7,d1				
	jbhi _?L708				
	move.b d6,d1				
	jbra _?L661				
_?L707:						
						
	move.b d1,d6				
	subq.b #8,d6				
	jbra _?L663				
_?L689:						
						
	clr.l d2				
	clr.l d3				
	jbra _?L674				
_?L686:						
	clr.l d2				
	clr.l d3				
	jbra _?L664				
_?L708:						
						
	cmp.b #7,d6				
	jbhi _?L709				
						
	move.l 12(a3),d0			
						
	cmp.l 16(a3),d0				
	jbcc _?L670				
						
	move.l 20(a3),a0			
						
	move.l d0,d1				
	addq.l #1,d1				
	move.l d1,12(a3)			
						
	move.l d2,d4				
	move.l d3,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d2				
	move.l d5,d3				
	or.b (a0,d0.l),d3			
						
	addq.l #1,24(a3)			
_?L668:						
						
	move.b d6,8(a3)				
						
	jbeq _?L688				
						
	and.l #255,d6				
						
	moveq #64,d4				
	sub.l d6,d4				
						
	moveq #32,d1				
	sub.l d6,d1				
	jbmi _?L672				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d2,d1				
	and.l d3,d0				
_?L671:						
	move.l d1,(a3)				
	move.l d0,4(a3)				
						
	moveq #3,d2				
	move.l d2,4(a4)				
_?L710:						
						
	move.b 10(a4),d0			
	addq.b #1,d0				
	move.b d0,10(a4)			
						
	moveq #12,d1				
	move.l d1,(a4)				
	jbra _?L652				
_?L709:						
						
	subq.b #8,d6				
	jbra _?L668				
_?L688:						
	clr.l d1				
	clr.l d0				
						
	move.l d1,(a3)				
	move.l d0,4(a3)				
						
	moveq #3,d2				
	move.l d2,4(a4)				
	jbra _?L710				
_?L672:						
						
	moveq #-1,d1				
	moveq #31,d0				
	sub.l d4,d0				
	moveq #-2,d5				
	lsl.l d0,d5				
	move.l d1,d0				
	lsr.l d4,d0				
	or.l d5,d0				
	lsr.l d4,d1				
						
	and.l d2,d1				
	and.l d3,d0				
	jbra _?L671				
_?L658:						
						
	moveq #-1,d4				
	moveq #31,d2				
	sub.l d5,d2				
	moveq #-2,d7				
	lsl.l d2,d7				
	move.l d4,d2				
	lsr.l d5,d2				
	or.l d7,d2				
	move.l d4,d7				
	lsr.l d5,d7				
						
	move.l d7,d4				
	and.l d6,d4				
	move.l d2,d5				
	and.l d0,d5				
	jbra _?L657				
_?L665:						
						
	moveq #-1,d2				
	moveq #31,d0				
	sub.l d3,d0				
	moveq #-2,d7				
	lsl.l d0,d7				
	move.l d2,d0				
	lsr.l d3,d0				
	or.l d7,d0				
	move.l d2,d7				
	lsr.l d3,d7				
						
	move.l d7,d2				
	and.l d4,d2				
	move.l d0,d3				
	and.l d5,d3				
	jbra _?L664				
_?L675:						
						
	move.w #-1,a5				
	moveq #31,d6				
	sub.l d2,d6				
	moveq #-2,d3				
	lsl.l d6,d3				
	move.l a5,d6				
	lsr.l d2,d6				
	or.l d3,d6				
	move.l a5,d3				
	lsr.l d2,d3				
	move.l d3,a5				
						
	move.l a6,d2				
	move.l a5,d7				
	and.l d7,d2				
	move.l 36(sp),d3			
	and.l d6,d3				
	jbra _?L674				
_?L690:						
						
	clr.l d1				
	clr.l d0				
						
	move.l d1,(a3)				
	move.l d0,4(a3)				
						
	moveq #3,d7				
	move.l d7,4(a4)				
	jbra _?L651				
_?L678:						
						
	moveq #-1,d1				
	moveq #31,d0				
	sub.l d3,d0				
	moveq #-2,d5				
	lsl.l d0,d5				
	move.l d1,d0				
	lsr.l d3,d0				
	or.l d5,d0				
	lsr.l d3,d1				
						
	and.l d4,d1				
	and.l d2,d0				
	jbra _?L677				
						
	.align	2				
						
_miniflac_cuesheet_read_track_number:		
	movem.l d3/d4/a3/a4,-(sp)		
	move.l 20(sp),a4			
	move.l 24(sp),a3			
						
	move.l (a4),d0				
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcc _?L712				
	subq.l #6,d0				
	jbne _?L733				
_?L713:						
						
	move.b 8(a3),d3				
						
	cmp.b #7,d3				
	jbhi _?L722				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L724				
						
	move.l 20(a3),a0			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,12(a3)			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.b (a0,d2.l),d2			
	and.l #255,d2				
	clr.l d4				
	or.l d0,d4				
	move.l d4,(a3)				
	or.l d1,d2				
	move.l d2,4(a3)				
						
	addq.b #8,d3				
	move.b d3,8(a3)				
						
	addq.l #1,24(a3)			
_?L722:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 28(sp)				
	jbeq _?L721				
						
	move.l 28(sp),a0			
	move.b d1,(a0)				
_?L721:						
						
	clr.l 4(a4)				
						
	moveq #7,d0				
	move.l d0,(a4)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L733:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L712:						
						
	subq.l #5,d0				
	jbne _?L715				
_?L717:						
						
	move.b 8(a4),d4				
	cmp.b 9(a4),d4				
	jbeq _?L734				
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L724				
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d4				
	move.l d4,(a4)				
	jbra _?L713				
_?L724:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L715:						
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_cuesheet_read_tracks	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L717				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L734:						
						
	moveq #2,d0				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
						
	.align	2				
						
_miniflac_streaminfo_read_max_frame_size:	
	movem.l d3/d4/d5/d6/d7/a3/a4/a5,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),a3			
						
	move.l (a4),d0				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbcc _?L736				
	subq.l #3,d0				
	jbne _?L760				
_?L737:						
						
	move.b 8(a3),d5				
						
	cmp.b #23,d5				
	jbhi _?L746				
						
	move.l 16(a3),a1			
						
	move.l 12(a3),d4			
						
	cmp.l d4,a1				
	jbls _?L742				
						
	move.l 20(a3),a0			
						
	move.l d4,a2				
	addq.l #1,a2				
	move.l a2,12(a3)			
						
	move.l (a3),d2				
	move.l 4(a3),d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b (a0,d4.l),d1			
						
	move.l d0,(a3)				
	move.l d1,4(a3)				
						
	move.b d5,d2				
	addq.b #8,d2				
	move.b d2,8(a3)				
						
	move.l 24(a3),d6			
						
	move.l d6,d3				
	addq.l #1,d3				
	move.l d3,24(a3)			
						
	cmp.b #23,d2				
	jbhi _?L746				
	cmp.l a1,a2				
	jbcc _?L742				
						
	move.l d4,d7				
	addq.l #2,d7				
	move.l d7,12(a3)			
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b (a0,a2.l),d1			
						
	move.l d0,(a3)				
	move.l d1,4(a3)				
						
	move.b d5,d2				
	add.b #16,d2				
	move.b d2,8(a3)				
						
	move.l d6,d3				
	addq.l #2,d3				
	move.l d3,24(a3)			
						
	cmp.b #23,d2				
	jbhi _?L746				
	cmp.l d7,a1				
	jbls _?L742				
						
	addq.l #3,d4				
	move.l d4,12(a3)			
						
	clr.l d2				
	move.b (a0,d7.l),d2			
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	clr.l d3				
	or.l d0,d3				
	move.l d3,(a3)				
	or.l d1,d2				
	move.l d2,4(a3)				
						
	add.b #24,d5				
	move.b d5,8(a3)				
						
	addq.l #3,d6				
	move.l d6,24(a3)			
_?L746:						
						
	pea 24.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 44(sp)				
	jbeq _?L745				
						
	move.l 44(sp),a0			
	move.l d1,(a0)				
_?L745:						
						
	moveq #4,d0				
	move.l d0,(a4)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L760:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L736:						
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d1				
	jbeq _?L739				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbne _?L761				
						
	pea 16.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L762				
_?L742:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L762:						
						
	pea 16.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,(a4)				
_?L739:						
						
	pea 24.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L742				
						
	pea 24.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #3,d3				
	move.l d3,(a4)				
	jbra _?L737				
_?L761:						
						
	pea 16.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L742				
						
	pea 16.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,(a4)				
						
	pea 16.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L742				
	jbra _?L762				
						
	.align	2				
						
_miniflac_streaminfo_read_total_samples:	
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcc _?L764				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #7,d0				
	jbne _?L789				
						
	pea 36.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L790				
_?L770:						
						
	clr.l d0				
_?L763:						
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L789:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L790:						
						
	pea 36.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 20(sp)				
	jbeq _?L773				
						
	move.l 20(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L773:						
						
	moveq #8,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L764:						
						
	moveq #6,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbne _?L791				
_?L767:						
						
	pea 5.w					
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L770				
						
	pea 5.w					
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
	move.b d1,10(a3)			
						
	moveq #7,d0				
	move.l d0,(a3)				
						
	pea 36.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L770				
	jbra _?L790				
_?L791:						
						
	moveq #5,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbeq _?L768				
						
	subq.l #4,d0				
	jbeq _?L772				
						
	clr.l -(sp)				
	move.l 20(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L763				
_?L772:						
						
	pea 20.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L770				
						
	pea 20.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,6(a3)				
						
	moveq #5,d0				
	move.l d0,(a3)				
_?L768:						
						
	pea 3.w					
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L770				
						
	pea 3.w					
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d1				
	move.l d1,(a3)				
	jbra _?L767				
						
	.align	2				
						
_miniflac_residual_decode:			
	lea (-24,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 64(sp),a5			
	move.l 68(sp),a3			
	move.l 72(sp),a4			
	move.l 80(sp),48(sp)			
						
	moveq #6,d0				
	cmp.l (a5),d0				
	jbcs _?L793				
	move.l (a5),d0				
	add.l d0,d0				
	move.w _?L795(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L795:						
	.dc.w _?L801-_?L795			
	.dc.w _?L839-_?L795			
	.dc.w _?L840-_?L795			
	.dc.w _?L841-_?L795			
	.dc.w _?L797-_?L795			
	.dc.w _?L796-_?L795			
	.dc.w _?L794-_?L795			
_?L840:						
	lea _miniflac_bitreader_fill,a6		
_?L799:						
						
	clr.l d0				
	move.b 12(a5),d0			
	move.l d0,-(sp)				
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L805				
						
	clr.l d0				
	move.b 12(a5),d0			
	move.l d0,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,d2				
	move.b d1,6(a5)				
						
	clr.l 26(a5)				
						
	clr.l d1				
	move.b 5(a5),d1				
						
	move.l 76(sp),d0			
	lsr.l d1,d0				
						
	move.l d0,30(a5)			
						
	tst.l 18(a5)				
	jbne _?L806				
						
	clr.l d1				
	move.b 51(sp),d1			
	sub.l d1,d0				
	move.l d0,30(a5)			
_?L806:						
						
	clr.l d0				
	move.b 4(a5),d0				
						
	cmp.b _escape_codes(d0.l),d2		
	jbeq _?L857				
_?L807:						
						
	moveq #5,d1				
	move.l d1,(a5)				
_?L796:						
						
	move.b 8(a3),d2				
						
	jbne _?L858				
						
	move.l 12(a3),d0			
						
	cmp.l 16(a3),d0				
	jbcc _?L805				
_?L828:						
						
	move.l 20(a3),a0			
						
	move.l d0,d2				
	addq.l #1,d2				
	move.l d2,12(a3)			
						
	move.b (a0,d0.l),d2			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	or.b d2,d1				
						
	move.b 9(a3),d3				
	eor.b d2,d3				
	and.l #255,d3				
						
	move.b _miniflac_crc8_table(d3.l),9(a3)	
						
	move.w 10(a3),d3			
						
	bfextu d3{#16:#8},d5			
						
	clr.l d4				
	move.b d2,d4				
	eor.l d4,d5				
						
	lsl.w #8,d3				
						
	move.w _miniflac_crc16_table(d5.l*2),d4	
	eor.w d3,d4				
	move.w d4,10(a3)			
						
	addq.l #1,24(a3)			
						
	move.b #7,8(a3)				
						
	clr.l d6				
	bfextu d2{#24:#1},d7			
	moveq #7,d2				
	moveq #7,d3				
_?L827:						
						
	moveq #64,d5				
	sub.l d3,d5				
						
	moveq #32,d4				
	sub.l d3,d4				
	jbmi _?L820				
	moveq #-1,d3				
	lsr.l d4,d3				
	clr.l d4				
_?L821:						
						
	and.l d0,d4				
	move.l d4,(a3)				
	and.l d1,d3				
	move.l d3,4(a3)				
						
	move.l d6,d5				
	or.l d7,d5				
	jbne _?L822				
						
	addq.l #1,8(a5)				
	move.l d4,d0				
	move.l d3,d1				
_?L826:						
						
	subq.b #1,d2				
						
	clr.l d3				
	move.b d2,d3				
						
	move.b d2,8(a3)				
						
	move.w #-32,a1				
	add.l d3,a1				
	tst.l a1				
	jblt _?L829				
	move.l d0,d5				
	move.l a1,d4				
	lsr.l d4,d5				
	move.l d5,a0				
						
	clr.l d6				
	move.l a0,d7				
	moveq #1,d5				
	and.l d5,d7				
						
	tst.b d2				
	jbne _?L827				
_?L831:						
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	move.l d6,d0				
	or.l d7,d0				
	jbne _?L822				
						
	addq.l #1,8(a5)				
						
	move.l 12(a3),d0			
						
	cmp.l 16(a3),d0				
	jbcs _?L828				
_?L805:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L822:						
						
	moveq #6,d1				
	move.l d1,(a5)				
_?L794:						
						
	clr.l d0				
	move.b 6(a5),d0				
	move.l d0,-(sp)				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill,a6		
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L805				
						
	clr.l d0				
	move.b 6(a5),d0				
						
	move.l 8(a5),d1				
	move.l d1,d3				
	lsl.l d0,d3				
						
	move.l d0,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	or.l d1,d3				
						
	moveq #1,d0				
	and.l d3,d0				
						
	neg.l d0				
						
	lsr.l #1,d3				
						
	eor.l d3,d0				
						
	move.l d0,14(a5)			
						
	tst.l 84(sp)				
	jbeq _?L832				
						
	move.l (a4),d1				
						
	move.l 84(sp),a0			
	move.l d0,(a0,d1.l*4)			
_?L832:						
						
	addq.l #1,(a4)				
						
	clr.l 8(a5)				
						
	move.l 26(a5),d0			
	addq.l #1,d0				
	move.l d0,26(a5)			
						
	cmp.l 30(a5),d0				
	jbcs _?L807				
_?L814:						
						
	clr.l 26(a5)				
						
	move.l 18(a5),d0			
	addq.l #1,d0				
	move.l d0,18(a5)			
						
	cmp.l 22(a5),d0				
	jbcc _?L793				
						
	moveq #2,d0				
	move.l d0,(a5)				
						
	jbra _?L799				
_?L820:						
						
	move.w #-1,a0				
	moveq #31,d4				
	sub.l d5,d4				
	move.w #-2,a2				
	move.l a2,d3				
	lsl.l d4,d3				
	move.l d3,a2				
	move.l a0,d3				
	lsr.l d5,d3				
	move.l a2,d4				
	or.l d4,d3				
	move.l a0,d4				
	lsr.l d5,d4				
	jbra _?L821				
_?L793:						
						
	clr.l 14(a5)				
						
	clr.l 18(a5)				
						
	clr.l 22(a5)				
						
	clr.l 26(a5)				
						
	clr.l 30(a5)				
						
	clr.l (a5)				
						
	clr.w 4(a5)				
						
	clr.w 6(a5)				
						
	clr.l 8(a5)				
						
	clr.b 12(a5)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L839:						
	lea _miniflac_bitreader_fill,a6		
_?L800:						
						
	pea 4.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L805				
						
	pea 4.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,5(a5)				
						
	and.l #255,d1				
						
	moveq #1,d0				
	lsl.l d1,d0				
						
	move.l d0,22(a5)			
						
	moveq #2,d5				
	move.l d5,(a5)				
	jbra _?L799				
_?L841:						
	lea _miniflac_bitreader_fill,a6		
_?L798:						
						
	pea 5.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L805				
						
	pea 5.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,d3				
	move.b d1,7(a5)				
						
	moveq #4,d2				
	move.l d2,(a5)				
	tst.l 84(sp)				
	jbeq _?L815				
_?L808:						
						
	and.l #255,d3				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L805				
						
	move.b 7(a5),d3				
						
	jbeq _?L816				
						
	clr.l d5				
	move.b d3,d5				
						
	move.l d5,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d0,a1				
	move.l d1,d0				
						
	move.l d5,d1				
	subq.l #1,d1				
						
	moveq #1,d2				
	lsl.l d1,d2				
	move.l d2,a2				
	move.l a2,d2				
	smi d1					
	extb.l d1				
						
	move.l a1,d4				
	and.l d1,d4				
	move.l d4,40(sp)			
	move.l a2,d1				
	and.l d0,d1				
	move.l d1,44(sp)			
						
	move.l 40(sp),d2			
	or.l 44(sp),d2				
	jbeq _?L816				
						
	move.w #-32,a1				
	add.l d5,a1				
	tst.l a1				
	jblt _?L818				
	clr.l d1				
						
	or.l d1,d0				
_?L816:						
						
	move.l d0,14(a5)			
						
	move.l (a4),d1				
						
	move.l 84(sp),a0			
	move.l d0,(a0,d1.l*4)			
						
	addq.l #1,(a4)				
						
	move.l 26(a5),d0			
	addq.l #1,d0				
	move.l d0,26(a5)			
						
	cmp.l 30(a5),d0				
	jbcc _?L814				
						
	moveq #4,d0				
	move.l d0,(a5)				
						
	jbra _?L808				
_?L797:						
						
	move.b 7(a5),d3				
	lea _miniflac_bitreader_fill,a6		
	tst.l 84(sp)				
	jbne _?L808				
	jbra _?L815				
_?L801:						
						
	pea 2.w					
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill,a6		
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L805				
						
	pea 2.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d0,a0				
	move.l a0,d0				
						
	clr.l d2				
	moveq #1,d3				
	sub.l d1,d3				
	subx.l d0,d2				
	jbcs _?L833				
						
	move.b d1,4(a5)				
						
	move.b d1,d3				
	addq.b #4,d3				
	move.b d3,12(a5)			
						
	clr.l 8(a5)				
						
	moveq #1,d4				
	move.l d4,(a5)				
	jbra _?L800				
_?L811:						
						
	moveq #-1,d0				
	move.l 36(sp),d2			
	lsl.l d2,d0				
						
	or.l d0,d1				
_?L813:						
						
	move.l d1,d0				
_?L809:						
	move.l d0,14(a5)			
						
	addq.l #1,(a4)				
						
	move.l 26(a5),d0			
	addq.l #1,d0				
	move.l d0,26(a5)			
						
	cmp.l 30(a5),d0				
	jbcc _?L814				
						
	moveq #4,d4				
	move.l d4,(a5)				
_?L815:						
						
	and.l #255,d3				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L805				
						
	move.b 7(a5),d3				
						
	jbeq _?L809				
						
	clr.l d4				
	move.b d3,d4				
	move.l d4,36(sp)			
						
	move.l d4,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d0,d2				
						
	move.l d4,a1				
	subq.l #1,a1				
						
	moveq #1,d0				
	move.l a1,d5				
	lsl.l d5,d0				
	move.l d0,d5				
	smi d4					
	extb.l d4				
						
	move.l d4,d5				
	and.l d2,d5				
	move.l d5,52(sp)			
	and.l d1,d0				
	move.l d0,56(sp)			
						
	move.l 52(sp),d0			
	or.l 56(sp),d0				
	jbeq _?L813				
						
	move.w #-32,a0				
	add.l 36(sp),a0				
	tst.l a0				
	jblt _?L811				
	clr.l d0				
						
	or.l d0,d1				
	jbra _?L813				
_?L818:						
						
	moveq #-1,d1				
	lsl.l d5,d1				
						
	or.l d1,d0				
	jbra _?L816				
_?L857:						
						
	moveq #3,d0				
	move.l d0,(a5)				
						
	jbra _?L798				
_?L858:						
	move.l (a3),d0				
	move.l 4(a3),d1				
	jbra _?L826				
_?L829:						
						
	move.w #31,a1				
	sub.l d3,a1				
	move.l d0,d5				
	add.l d5,d5				
	move.l a1,d4				
	lsl.l d4,d5				
	move.l d5,a2				
	move.l d1,d5				
	lsr.l d3,d5				
	move.l a2,d4				
	or.l d5,d4				
	move.l d4,a0				
						
	clr.l d6				
	move.l a0,d7				
	moveq #1,d5				
	and.l d5,d7				
						
	tst.b d2				
	jbeq _?L831				
	jbra _?L827				
_?L833:						
						
	moveq #-14,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
						
	.align	2				
						
_miniflac_picture_read_length:			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),a3			
						
	move.l (a4),d0				
						
	moveq #8,d1				
	cmp.l d0,d1				
	jbcc _?L860				
	moveq #9,d4				
	cmp.l d0,d4				
	jbne _?L887				
_?L861:						
						
	move.b 8(a3),d3				
						
	cmp.b #31,d3				
	jbhi _?L872				
						
	move.l 16(a3),a1			
						
	move.l 12(a3),d2			
						
	cmp.l d2,a1				
	jbls _?L866				
						
	move.l 20(a3),a0			
						
	move.l d2,a2				
	addq.l #1,a2				
	move.l a2,12(a3)			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b (a0,d2.l),d5			
						
	move.l d4,(a3)				
	move.l d5,4(a3)				
						
	move.b d3,d0				
	addq.b #8,d0				
	move.b d0,8(a3)				
						
	move.l 24(a3),d6			
						
	move.l d6,d1				
	addq.l #1,d1				
	move.l d1,24(a3)			
						
	cmp.b #31,d0				
	jbhi _?L872				
	cmp.l a1,a2				
	jbcc _?L866				
						
	move.l d2,d7				
	addq.l #2,d7				
	move.l d7,12(a3)			
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b (a0,a2.l),d5			
						
	move.l d4,(a3)				
	move.l d5,4(a3)				
						
	move.b d3,d0				
	add.b #16,d0				
	move.b d0,8(a3)				
						
	move.l d6,d1				
	addq.l #2,d1				
	move.l d1,24(a3)			
						
	cmp.b #31,d0				
	jbhi _?L872				
	cmp.l d7,a1				
	jbls _?L866				
						
	addq.l #2,a2				
	move.l a2,12(a3)			
						
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d0				
	move.l d5,d1				
	or.b (a0,d7.l),d1			
						
	move.l d0,(a3)				
	move.l d1,4(a3)				
						
	move.b d3,d4				
	add.b #24,d4				
	move.b d4,8(a3)				
						
	move.l d6,d5				
	addq.l #3,d5				
	move.l d5,24(a3)			
						
	cmp.b #31,d4				
	jbhi _?L872				
	cmp.l a1,a2				
	jbcc _?L866				
						
	addq.l #4,d2				
	move.l d2,12(a3)			
						
	clr.l d2				
	move.b (a0,a2.l),d2			
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	clr.l d4				
	or.l d0,d4				
	move.l d4,(a3)				
	or.l d1,d2				
	move.l d2,4(a3)				
						
	add.b #32,d3				
	move.b d3,8(a3)				
						
	addq.l #4,d6				
	move.l d6,24(a3)			
_?L872:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,4(a4)				
						
	clr.l 8(a4)				
						
	tst.l 44(sp)				
	jbeq _?L871				
						
	move.l 44(sp),a0			
	move.l d1,(a0)				
_?L871:						
						
	moveq #10,d0				
	move.l d0,(a4)				
	moveq #1,d0				
_?L859:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L887:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L860:						
						
	moveq #8,d5				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d5				
	jbeq _?L863				
						
	moveq #7,d1				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d1				
	jbne _?L888				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L889				
_?L866:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L889:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #8,d1				
	move.l d1,(a4)				
_?L863:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L866				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #9,d4				
	move.l d4,(a4)				
	jbra _?L861				
_?L888:						
						
	subq.l #6,d0				
	jbeq _?L868				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
						
	moveq #1,d5				
	cmp.l d0,d5				
	jbne _?L859				
_?L868:						
						
	pea 32.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L866				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #7,d0				
	move.l d0,(a4)				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L866				
	jbra _?L889				
						
	.data					
_?LC6:						
	.dc.b $62,$72,$2d,$3e,$62,$69,$74,$73
	.dc.b $20,$3c,$20,$38
	.dc.b $00				
_?LC7:						
	.dc.b $62,$72,$2d,$3e,$62,$69,$74,$73
	.dc.b $20,$3d,$3d,$20,$30
	.dc.b $00				
	.text					
	.align	2				
						
_miniflac_frame_decode:				
	lea (-116,sp),sp			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 156(sp),a6			
	move.l 160(sp),a4			
						
	move.l (a6),d0				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L891				
	moveq #2,d2				
	cmp.l d0,d2				
	jbeq _?L892				
	tst.l d0				
	jbeq _?L893				
_?L926:						
						
	moveq #-1,d0				
_?L890:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (116,sp),sp				
	rts					
_?L893:						
						
	move.l 164(sp),-(sp)			
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d3				
	cmp.l d0,d3				
	jbne _?L890				
_?L891:						
						
	move.b 4(a6),d0				
						
	cmp.b 26(a6),d0				
	jbcc _?L1021				
						
	move.l 42(a6),d1			
						
	move.b 27(a6),d3			
						
	clr.l d6				
	move.b d3,d6				
						
	move.l 22(a6),a0			
						
	moveq #-3,d7				
	move.l a0,d2				
	and.l d2,d7				
	subq.l #1,d7				
	jbeq _?L1186				
						
	moveq #2,d2				
	cmp.l a0,d2				
	jbeq _?L900				
_?L899:						
						
	clr.l d6				
	move.w 16(a6),d6			
	move.l d6,44(sp)			
	tst.l 168(sp)				
	jbeq _?L902				
_?L1190:					
						
	and.l #255,d0				
	lsl.l #2,d0				
						
	move.l 168(sp),a0			
	move.l (a0,d0.l),a3			
						
	moveq #4,d0				
	cmp.l d1,d0				
	jbcs _?L1168				
	add.l d1,d1				
	move.w _?L905(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L905:						
	.dc.w _?L901-_?L905			
	.dc.w _?L908-_?L905			
	.dc.w _?L907-_?L905			
	.dc.w _?L906-_?L905			
	.dc.w _?L904-_?L905			
_?L908:						
						
	move.b 46(a6),d3			
	lea _miniflac_bitreader_fill,a5		
_?L928:						
						
	clr.l d6				
	move.b d3,d6				
						
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1036				
						
	tst.b d3				
	jbne _?L1187				
_?L933:						
						
	tst.l a3				
	jbeq _?L1172				
						
	tst.l 44(sp)				
	jbeq _?L1172				
	move.l a3,a1				
	move.l 44(sp),d1			
	lsl.l #2,d1				
	add.l a3,d1				
_?L947:						
						
	move.l d0,(a1)+				
						
	cmp.l d1,a1				
	jbne _?L947				
_?L1168:					
	lea (92,a6),a2				
						
	tst.l a3				
	jbeq _?L1019				
_?L974:						
						
	move.b 57(a6),d1			
						
	jbeq _?L1019				
						
	tst.l 44(sp)				
	jbeq _?L1019				
						
	and.l #255,d1				
	move.l 44(sp),d0			
	lsl.l #2,d0				
	lea (a3,d0.l),a1			
_?L1020:					
						
	move.l (a3),d0				
						
	lsl.l d1,d0				
	move.l d0,(a3)+				
						
	cmp.l a1,a3				
	jbne _?L1020				
_?L1019:					
						
	clr.b 46(a6)				
						
	clr.l 42(a6)				
						
	clr.l 48(a6)				
						
	clr.l 52(a6)				
						
	clr.w 56(a6)				
						
	clr.b 58(a6)				
						
	clr.l 60(a6)				
						
	clr.l 68(a6)				
						
	clr.l 64(a6)				
						
	clr.l 76(a6)				
						
	clr.l 72(a6)				
						
	clr.l 84(a6)				
						
	clr.w 88(a6)				
						
	clr.b 90(a6)				
						
	pea 128.w				
	clr.l -(sp)				
	move.l a2,-(sp)				
	jbsr _memset				
	lea (12,sp),sp				
						
	clr.l 80(a6)				
						
	clr.l 234(a6)				
						
	clr.l 238(a6)				
						
	clr.l 242(a6)				
						
	clr.l 246(a6)				
						
	clr.l 250(a6)				
						
	clr.l 220(a6)				
						
	clr.w 224(a6)				
						
	clr.w 226(a6)				
						
	clr.l 228(a6)				
						
	clr.b 232(a6)				
						
	move.b 4(a6),d0				
	addq.b #1,d0				
	move.b d0,4(a6)				
						
	cmp.b 26(a6),d0				
	jbcc _?L1021				
_?L1193:					
						
	move.b 27(a6),d3			
						
	clr.l d6				
	move.b d3,d6				
						
	move.l 22(a6),d1			
						
	moveq #-3,d2				
	and.l d1,d2				
	subq.l #1,d2				
	jbeq _?L1188				
						
	subq.l #2,d1				
	jbeq _?L1041				
_?L1023:					
						
	clr.l d2				
	move.w 16(a6),d2			
	move.l d2,44(sp)			
	tst.l 168(sp)				
	jbeq _?L1051				
						
	and.l #255,d0				
	lsl.l #2,d0				
						
	move.l 168(sp),a0			
	move.l (a0,d0.l),a3			
_?L901:						
						
	move.l 48(a6),d0			
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill,a5		
	cmp.l d0,d1				
	jbeq _?L909				
_?L1197:					
	moveq #2,d2				
	cmp.l d0,d2				
	jbcs _?L910				
	tst.l d0				
	jbeq _?L911				
	lea _miniflac_bitreader_fill,a5		
						
	pea 6.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1189				
_?L1036:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (116,sp),sp				
	rts					
_?L1041:					
						
	clr.l d1				
_?L900:						
						
	tst.b d0				
	jbne _?L899				
	move.b d6,d3				
	addq.b #1,d3				
_?L1198:					
						
	clr.l d6				
	move.w 16(a6),d6			
	move.l d6,44(sp)			
	tst.l 168(sp)				
	jbne _?L1190				
_?L902:						
						
	moveq #4,d0				
	cmp.l d1,d0				
	jbcs _?L1172				
	add.l d1,d1				
	move.w _?L1037(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1037:					
	.dc.w _?L1051-_?L1037			
	.dc.w _?L1040-_?L1037			
	.dc.w _?L1039-_?L1037			
	.dc.w _?L1038-_?L1037			
	.dc.w _?L1052-_?L1037			
_?L1052:					
	sub.l a3,a3				
_?L904:						
						
	move.b 56(a6),76(sp)			
						
	clr.l d7				
	move.b 76(sp),d7			
						
	lea (220,a6),a0				
	move.l a0,88(sp)			
						
	move.b 46(a6),d3			
						
	clr.l d6				
	move.b d3,d6				
						
	cmp.l 84(a6),d7				
	jbls _?L981				
	lea _miniflac_bitreader_fill,a5		
_?L931:						
						
	move.w #-32,a1				
	add.l d6,a1				
	tst.l a1				
	jblt _?L982				
	clr.l 80(sp)				
						
	move.l d6,d1				
	subq.l #1,d1				
						
	moveq #1,d0				
	lsl.l d1,d0				
	move.l d0,40(sp)			
	smi d1					
	extb.l d1				
	move.l d1,36(sp)			
_?L990:						
						
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1036				
						
	tst.b d3				
	jbeq _?L985				
						
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	and.l 36(sp),d0				
	move.l d0,68(sp)			
	move.l d1,d2				
	and.l 40(sp),d2				
	move.l d2,72(sp)			
						
	move.l 68(sp),d0			
	or.l 72(sp),d0				
	jbeq _?L986				
						
	or.l 80(sp),d1				
_?L986:						
						
	move.l d1,d0				
_?L985:						
						
	tst.l a3				
	jbeq _?L987				
						
	move.l 84(a6),d1			
						
	move.l d0,(a3,d1.l*4)			
_?L987:						
						
	move.l 84(a6),d0			
	addq.l #1,d0				
	move.l d0,84(a6)			
						
	clr.l 80(a6)				
						
	cmp.l d0,d7				
	jbhi _?L990				
_?L932:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1036				
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
	move.b d1,88(a6)			
						
	moveq #1,d1				
	move.l d1,80(a6)			
						
	pea 5.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1036				
_?L1203:					
						
	move.b 8(a4),d1				
	cmp.b #4,d1				
	jbls _?L994				
						
	subq.b #5,d1				
	move.b d1,8(a4)				
						
	move.l (a4),d3				
	move.l 4(a4),a5				
						
	clr.l d0				
	move.b d1,d0				
						
	move.w #-32,a1				
	add.l d0,a1				
	tst.l a1				
	jblt _?L995				
	move.l d3,d2				
	move.l a1,d6				
	lsr.l d6,d2				
_?L996:						
						
	sub.l a0,a0				
	moveq #31,d6				
	and.l d2,d6				
	move.l d6,a1				
						
	tst.b d1				
	jbeq _?L1047				
						
	moveq #64,d6				
	sub.l d0,d6				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L998				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d3,d1				
	move.l a5,d3				
	and.l d3,d0				
_?L997:						
	move.l d1,(a4)				
	move.l d0,4(a4)				
						
	clr.l 124(sp)				
	moveq #16,d6				
	and.l d2,d6				
	move.l d6,128(sp)			
						
	move.l 124(sp),d0			
	or.l 128(sp),d0				
	jbeq _?L1000				
						
	move.w #-1,a0				
	move.l a1,d1				
	moveq #-32,d2				
	or.l d2,d1				
	move.l d1,a1				
_?L1000:					
						
	move.l a1,d0				
	tst.l a0				
	jblt _?L1191				
						
	move.b d0,89(a6)			
						
	moveq #2,d3				
	move.l d3,80(a6)			
_?L1002:					
						
	move.b 76(sp),d2			
	cmp.b 90(a6),d2				
	jbls _?L1003				
						
	move.b 88(a6),d3			
	lea _miniflac_bitreader_fill,a5		
						
	move.l d7,36(sp)			
	move.l a6,d0				
	move.l a3,a6				
	move.l 132(sp),d6			
	move.l 136(sp),d7			
	move.l d4,80(sp)			
	move.l d5,84(sp)			
	move.l d0,a3				
_?L1009:					
						
	and.l #255,d3				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1036				
						
	move.b 88(a3),d3			
						
	jbeq _?L1005				
						
	clr.l d4				
	move.b d3,d4				
						
	move.l d4,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d4,a0				
	subq.l #1,a0				
						
	moveq #1,d2				
	move.l a0,d5				
	lsl.l d5,d2				
	move.l d2,d7				
	smi d6					
	extb.l d6				
						
	and.l d0,d6				
	move.l d2,d7				
	and.l d1,d7				
						
	move.l d6,d0				
	or.l d7,d0				
	jbeq _?L1006				
						
	move.w #-32,a0				
	add.l d4,a0				
	tst.l a0				
	jblt _?L1007				
	clr.l d0				
						
	or.l d0,d1				
_?L1006:					
						
	move.l d1,d0				
_?L1005:					
						
	move.b 90(a3),d1			
						
	move.b d1,d2				
	addq.b #1,d2				
	move.b d2,90(a3)			
	and.l #255,d1				
						
	move.l d0,92(a3,d1.l*4)			
						
	cmp.b 76(sp),d2				
	jbcs _?L1009				
	move.l a3,d0				
	move.l a6,a3				
	move.l d6,132(sp)			
	move.l d7,136(sp)			
	move.l 36(sp),d7			
	move.l 80(sp),d4			
	move.l 84(sp),d5			
	move.l d0,a6				
_?L1003:					
						
	move.l a3,-(sp)				
	move.l d7,-(sp)				
	move.l 52(sp),-(sp)			
	pea 84(a6)				
	move.l a4,-(sp)				
	move.l 108(sp),-(sp)			
	jbsr _miniflac_residual_decode		
	lea (24,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L890				
						
	tst.l a3				
	jbeq _?L1172				
						
	cmp.l 44(sp),d7				
	jbcc _?L1170				
						
	clr.l d2				
	move.b 89(a6),d2			
	move.l d2,88(sp)			
	move.l d7,d6				
	lsl.l #2,d6				
	lea (a3,d6.l),a0			
	move.l d7,d3				
	add.l #1073741823,d3			
	move.l d3,36(sp)			
	move.l 44(sp),d2			
	add.l #1073741823,d2			
	move.l d2,80(sp)			
	lea (92,a6),a2				
	add.l a2,d6				
						
	moveq #-32,d3				
	add.l 88(sp),d3				
	move.l d3,76(sp)			
	moveq #31,d0				
	sub.l 88(sp),d0				
	move.l d0,140(sp)			
	move.l a3,a5				
_?L1010:					
						
	clr.l d0				
	tst.l d7				
	jbeq _?L1015				
	move.l a2,a1				
	move.l a0,a3				
						
	clr.l d2				
	clr.l d3				
_?L1011:					
						
	move.l (a1)+,d1				
						
	move.l -(a3),d0				
	move.l d1,d5				
	muls.l d0,d4:d5				
						
	add.l d5,d3				
	addx.l d4,d2				
						
	cmp.l d6,a1				
	jbne _?L1011				
						
	tst.l 76(sp)				
	jblt _?L1012				
	move.l d2,d0				
	move.l 76(sp),d1			
	asr.l d1,d0				
_?L1015:					
						
	move.l (a0),d3				
	smi d2					
	extb.l d2				
						
	add.l d3,d0				
	move.l d0,(a0)+				
						
	addq.l #1,36(sp)			
	move.l 80(sp),d2			
	cmp.l 36(sp),d2				
	jbne _?L1010				
	move.l a5,a3				
						
	tst.l a3				
	jbne _?L974				
	jbra _?L1019				
_?L907:						
						
	move.b 46(a6),d3			
						
	move.l 68(a6),d0			
_?L929:						
						
	clr.l d6				
	move.b d3,d6				
						
	cmp.l 44(sp),d0				
	jbcc _?L955				
_?L948:						
						
	move.w #-32,a1				
	add.l d6,a1				
	tst.l a1				
	jblt _?L949				
	clr.l 76(sp)				
						
	move.l d6,d1				
	subq.l #1,d1				
						
	moveq #1,d0				
	lsl.l d1,d0				
	move.l d0,40(sp)			
	smi d1					
	extb.l d1				
	move.l d1,36(sp)			
	lea _miniflac_bitreader_fill,a5		
						
	move.l #_miniflac_bitreader_read,d7	
_?L956:						
						
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1036				
						
	tst.b d3				
	jbeq _?L951				
						
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	and.l 36(sp),d0				
	move.l d0,52(sp)			
	move.l d1,d0				
	and.l 40(sp),d0				
	move.l d0,56(sp)			
						
	move.l 52(sp),d2			
	or.l 56(sp),d2				
	jbeq _?L952				
						
	or.l 76(sp),d1				
_?L952:						
						
	move.l d1,d0				
_?L951:						
						
	tst.l a3				
	jbeq _?L953				
						
	move.l 68(a6),d1			
						
	move.l d0,(a3,d1.l*4)			
						
	move.l 68(a6),d0			
	addq.l #1,d0				
	move.l d0,68(a6)			
						
	cmp.l 44(sp),d0				
	jbcs _?L956				
_?L955:						
						
	clr.l 68(a6)				
	lea (92,a6),a2				
_?L1192:					
						
	tst.l a3				
	jbne _?L974				
	jbra _?L1019				
_?L906:						
						
	move.l 76(a6),d0			
						
	move.b 46(a6),d3			
_?L930:						
						
	move.b 56(a6),76(sp)			
						
	clr.l d6				
	move.b d3,d6				
						
	clr.l d7				
	move.b 76(sp),d7			
	cmp.l d7,d0				
	jbcc _?L966				
						
	move.w #-32,a1				
	add.l d6,a1				
	tst.l a1				
	jblt _?L959				
	clr.l 80(sp)				
						
	move.l d6,d1				
	subq.l #1,d1				
						
	moveq #1,d0				
	lsl.l d1,d0				
	move.l d0,40(sp)			
	smi d1					
	extb.l d1				
	move.l d1,36(sp)			
	lea _miniflac_bitreader_fill,a5		
_?L967:						
						
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1036				
						
	tst.b d3				
	jbeq _?L961				
						
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	and.l 36(sp),d0				
	move.l d0,60(sp)			
	move.l d1,d2				
	and.l 40(sp),d2				
	move.l d2,64(sp)			
						
	move.l 60(sp),d0			
	or.l 64(sp),d0				
	jbeq _?L962				
						
	or.l 80(sp),d1				
_?L962:						
						
	move.l d1,d0				
_?L961:						
						
	tst.l a3				
	jbeq _?L963				
						
	move.l 76(a6),d1			
						
	move.l d0,(a3,d1.l*4)			
						
	move.l 76(a6),d0			
	addq.l #1,d0				
	move.l d0,76(a6)			
						
	cmp.l d7,d0				
	jbcs _?L967				
						
	move.l a3,-(sp)				
	move.l d7,-(sp)				
	move.l 52(sp),-(sp)			
	pea 76(a6)				
	move.l a4,-(sp)				
	pea 220(a6)				
	jbsr _miniflac_residual_decode		
	lea (24,sp),sp				
						
	moveq #1,d3				
	cmp.l d0,d3				
	jbne _?L890				
						
	cmp.b #3,76(sp)				
	jbeq _?L968				
	jbhi _?L969				
	cmp.b #1,76(sp)				
	jbeq _?L970				
						
	moveq #2,d3				
	move.l d3,76(a6)			
						
	moveq #2,d0				
						
	cmp.l 44(sp),d3				
	jbcc _?L1170				
_?L977:						
						
	lsl.l #2,d0				
						
	move.l (a3,d0.l),d1			
	sub.l -8(a3,d0.l),d1			
						
	move.l -4(a3,d0.l),d3			
	smi d2					
	extb.l d2				
	add.l d3,d3				
	addx.l d2,d2				
						
	add.l d3,d1				
	move.l d1,(a3,d0.l)			
						
	move.l 76(a6),d0			
	addq.l #1,d0				
	move.l d0,76(a6)			
						
	cmp.l 44(sp),d0				
	jbcc _?L1168				
						
	lsl.l #2,d0				
						
	move.l (a3,d0.l),d1			
	sub.l -8(a3,d0.l),d1			
						
	move.l -4(a3,d0.l),d3			
	smi d2					
	extb.l d2				
	add.l d3,d3				
	addx.l d2,d2				
						
	add.l d3,d1				
	move.l d1,(a3,d0.l)			
						
	move.l 76(a6),d0			
	addq.l #1,d0				
	move.l d0,76(a6)			
						
	cmp.l 44(sp),d0				
	jbcs _?L977				
	jbra _?L1168				
_?L953:						
						
	move.l 68(a6),d0			
	addq.l #1,d0				
	move.l d0,68(a6)			
						
	cmp.l 44(sp),d0				
	jbcs _?L956				
						
	clr.l 68(a6)				
	lea (92,a6),a2				
	jbra _?L1192				
_?L963:						
						
	move.l 76(a6),d0			
	addq.l #1,d0				
	move.l d0,76(a6)			
						
	cmp.l d7,d0				
	jbcs _?L967				
_?L966:						
						
	move.l a3,-(sp)				
	move.l d7,-(sp)				
	move.l 52(sp),-(sp)			
	pea 76(a6)				
	move.l a4,-(sp)				
	pea 220(a6)				
	jbsr _miniflac_residual_decode		
	lea (24,sp),sp				
						
	moveq #1,d3				
	cmp.l d0,d3				
	jbne _?L890				
						
	tst.l a3				
	jbne _?L1156				
_?L1172:					
	lea (92,a6),a2				
_?L1201:					
						
	clr.b 46(a6)				
						
	clr.l 42(a6)				
						
	clr.l 48(a6)				
						
	clr.l 52(a6)				
						
	clr.w 56(a6)				
						
	clr.b 58(a6)				
						
	clr.l 60(a6)				
						
	clr.l 68(a6)				
						
	clr.l 64(a6)				
						
	clr.l 76(a6)				
						
	clr.l 72(a6)				
						
	clr.l 84(a6)				
						
	clr.w 88(a6)				
						
	clr.b 90(a6)				
						
	pea 128.w				
	clr.l -(sp)				
	move.l a2,-(sp)				
	jbsr _memset				
	lea (12,sp),sp				
						
	clr.l 80(a6)				
						
	clr.l 234(a6)				
						
	clr.l 238(a6)				
						
	clr.l 242(a6)				
						
	clr.l 246(a6)				
						
	clr.l 250(a6)				
						
	clr.l 220(a6)				
						
	clr.w 224(a6)				
						
	clr.w 226(a6)				
						
	clr.l 228(a6)				
						
	clr.b 232(a6)				
						
	move.b 4(a6),d0				
	addq.b #1,d0				
	move.b d0,4(a6)				
						
	cmp.b 26(a6),d0				
	jbcs _?L1193				
_?L1021:					
						
	cmp.b #7,8(a4)				
	jbhi _?L1194				
						
	clr.b 8(a4)				
						
	clr.l (a4)				
	clr.l 4(a4)				
						
	move.w 10(a4),6(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L892:						
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1036				
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.w 6(a6),d1				
	jbne _?L1050				
						
	move.l 24(a4),8(a6)			
						
	tst.l 168(sp)				
	jbeq _?L1025				
						
	move.l 22(a6),d0			
	moveq #2,d1				
	cmp.l d0,d1				
	jbeq _?L1026				
	moveq #3,d2				
	cmp.l d0,d2				
	jbeq _?L1027				
	subq.l #1,d0				
	jbeq _?L1195				
_?L1025:					
						
	tst.b 8(a4)				
	jbne _?L1196				
						
	clr.b 9(a4)				
						
	clr.w 10(a4)				
						
	clr.b 4(a6)				
						
	clr.l (a6)				
						
	clr.b 46(a6)				
						
	clr.l 42(a6)				
						
	clr.l 48(a6)				
						
	clr.l 52(a6)				
						
	clr.w 56(a6)				
						
	clr.b 58(a6)				
						
	clr.l 60(a6)				
						
	clr.l 68(a6)				
						
	clr.l 64(a6)				
						
	clr.l 76(a6)				
						
	clr.l 72(a6)				
						
	clr.l 84(a6)				
						
	clr.w 88(a6)				
						
	clr.b 90(a6)				
						
	pea 128.w				
	clr.l -(sp)				
	pea 92(a6)				
	jbsr _memset				
	lea (12,sp),sp				
						
	clr.l 80(a6)				
						
	clr.l 234(a6)				
						
	clr.l 238(a6)				
						
	clr.l 242(a6)				
						
	clr.l 246(a6)				
						
	clr.l 250(a6)				
						
	clr.l 220(a6)				
						
	clr.w 224(a6)				
						
	clr.w 226(a6)				
						
	clr.l 228(a6)				
						
	clr.b 232(a6)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (116,sp),sp				
	rts					
_?L1188:					
						
	cmp.b #1,d0				
	jbne _?L1023				
	addq.b #1,d3				
						
	clr.l d2				
	move.w 16(a6),d2			
	move.l d2,44(sp)			
	tst.l 168(sp)				
	jbeq _?L1051				
	move.l 168(sp),a0			
	move.l 4(a0),a3				
						
	move.l 48(a6),d0			
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill,a5		
	cmp.l d0,d1				
	jbne _?L1197				
_?L909:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1036				
						
	clr.b 57(a6)				
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d0,d2				
	or.l d1,d2				
	jbeq _?L919				
						
	moveq #3,d6				
	move.l d6,48(a6)			
						
	move.l #_miniflac_bitreader_read,d7	
	move.l d4,36(sp)			
	move.l d5,40(sp)			
_?L920:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1036				
						
	move.b 57(a6),d6			
	addq.b #1,d6				
	move.b d6,57(a6)			
						
	pea 1.w					
	move.l a4,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	clr.l d4				
	moveq #1,d5				
	sub.l d1,d5				
	subx.l d0,d4				
	jbne _?L920				
						
	move.l 36(sp),d4			
	move.l 40(sp),d5			
	sub.b d6,d3				
_?L919:						
						
	clr.l 48(a6)				
						
	move.b d3,46(a6)			
						
	move.l 52(a6),d0			
						
	moveq #3,d6				
	cmp.l d0,d6				
	jbeq _?L922				
	jbcs _?L923				
	moveq #1,d7				
	cmp.l d0,d7				
	jbeq _?L924				
	subq.l #2,d0				
	jbne _?L926				
						
	clr.l 234(a6)				
						
	clr.l 238(a6)				
						
	clr.l 242(a6)				
						
	clr.l 246(a6)				
						
	clr.l 250(a6)				
						
	clr.l 220(a6)				
						
	clr.w 224(a6)				
						
	clr.w 226(a6)				
						
	clr.l 228(a6)				
						
	clr.b 232(a6)				
						
	clr.l 76(a6)				
						
	clr.l 72(a6)				
						
	moveq #3,d0				
	move.l d0,42(a6)			
						
	clr.l d0				
	jbra _?L930				
_?L1186:					
						
	cmp.b #1,d0				
	jbne _?L899				
	addq.b #1,d3				
	jbra _?L1198				
_?L1051:					
						
	sub.l a3,a3				
	jbra _?L901				
_?L910:						
	lea _miniflac_bitreader_fill,a5		
						
	subq.l #3,d0				
	jbne _?L1036				
						
	move.l #_miniflac_bitreader_read,d7	
	move.l d4,36(sp)			
	move.l d5,40(sp)			
	jbra _?L920				
_?L949:						
						
	moveq #-1,d0				
	lsl.l d6,d0				
	move.l d0,76(sp)			
						
	move.l d6,d1				
	subq.l #1,d1				
						
	moveq #1,d0				
	lsl.l d1,d0				
	move.l d0,40(sp)			
	smi d1					
	extb.l d1				
	move.l d1,36(sp)			
	lea _miniflac_bitreader_fill,a5		
						
	move.l #_miniflac_bitreader_read,d7	
	jbra _?L956				
_?L959:						
						
	moveq #-1,d0				
	lsl.l d6,d0				
	move.l d0,80(sp)			
						
	move.l d6,d1				
	subq.l #1,d1				
						
	moveq #1,d0				
	lsl.l d1,d0				
	move.l d0,40(sp)			
	smi d1					
	extb.l d1				
	move.l d1,36(sp)			
	lea _miniflac_bitreader_fill,a5		
	jbra _?L967				
_?L982:						
						
	moveq #-1,d0				
	lsl.l d6,d0				
	move.l d0,80(sp)			
						
	move.l d6,d1				
	subq.l #1,d1				
						
	moveq #1,d0				
	lsl.l d1,d0				
	move.l d0,40(sp)			
	smi d1					
	extb.l d1				
	move.l d1,36(sp)			
	jbra _?L990				
_?L981:						
						
	move.l 80(a6),d0			
						
	jbeq _?L1199				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L1200				
						
	subq.l #2,d0				
	jbne _?L1003				
	jbra _?L1002				
_?L1187:					
						
	move.b 8(a4),d0				
	cmp.b d0,d3				
	jbhi _?L994				
						
	sub.b d3,d0				
	move.w d0,a2				
	move.b d0,8(a4)				
						
	move.l (a4),36(sp)			
	move.l 4(a4),a0				
						
	and.l #255,d0				
						
	moveq #64,d3				
	sub.l d6,d3				
						
	moveq #32,d2				
	sub.l d6,d2				
	jbmi _?L935				
	moveq #-1,d1				
	lsr.l d2,d1				
	sub.l a5,a5				
_?L936:						
						
	move.w #-32,a1				
	add.l d0,a1				
	tst.l a1				
	jblt _?L937				
	move.l 36(sp),d2			
	move.l a1,d3				
	lsr.l d3,d2				
	sub.l a1,a1				
_?L938:						
						
	move.l a5,d7				
	move.l a1,d3				
	and.l d3,d7				
	move.l d7,a5				
	and.l d1,d2				
						
	move.w a2,d7				
	tst.b d7				
	jbeq _?L1046				
						
	moveq #64,d3				
	sub.l d0,d3				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L940				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l 36(sp),d1				
	move.l a0,d3				
	and.l d3,d0				
_?L939:						
	move.l d1,(a4)				
	move.l d0,4(a4)				
						
	move.l d6,d0				
	subq.l #1,d0				
						
	moveq #1,d3				
	lsl.l d0,d3				
	move.l d3,d1				
	smi d0					
	extb.l d0				
						
	move.l a5,d7				
	and.l d0,d7				
	move.l d7,116(sp)			
	and.l d2,d3				
	move.l d3,120(sp)			
						
	move.l 116(sp),d0			
	or.l 120(sp),d0				
	jbeq _?L942				
						
	move.w #-32,a1				
	add.l d6,a1				
	tst.l a1				
	jblt _?L943				
	clr.l d0				
						
	or.l d0,d2				
_?L942:						
						
	move.l d2,d0				
	jbra _?L933				
_?L911:						
						
	pea 1.w					
	move.l a4,-(sp)				
	lea _miniflac_bitreader_fill,a5		
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1036				
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d0,d7				
	or.l d1,d7				
	jbne _?L1043				
						
	moveq #1,d0				
	move.l d0,48(a6)			
						
	pea 6.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1036				
	jbra _?L1189				
_?L1038:					
						
	move.l 76(a6),d0			
						
	move.b 46(a6),d3			
						
	sub.l a3,a3				
	jbra _?L930				
_?L1039:					
						
	move.b 46(a6),d3			
						
	clr.l d6				
	move.b d3,d6				
						
	sub.l a3,a3				
						
	move.l 44(sp),d2			
	cmp.l 68(a6),d2				
	jbhi _?L948				
	lea (92,a6),a2				
	jbra _?L1201				
_?L1040:					
						
	move.b 46(a6),d3			
						
	sub.l a3,a3				
	lea _miniflac_bitreader_fill,a5		
	jbra _?L928				
_?L969:						
						
	cmp.b #4,76(sp)				
	jbne _?L1170				
						
	moveq #4,d7				
	move.l d7,76(a6)			
						
	moveq #4,d0				
						
	cmp.l 44(sp),d7				
	jbcc _?L1170				
_?L980:						
						
	lsl.l #2,d0				
	lea (a3,d0.l),a0			
						
	move.l (a0),d1				
	sub.l -16(a3,d0.l),d1			
						
	move.l -4(a3,d0.l),d3			
	smi d2					
	extb.l d2				
	add.l d3,d3				
	addx.l d2,d2				
	add.l d3,d3				
	addx.l d2,d2				
						
	add.l d3,d1				
						
	move.l -12(a3,d0.l),d3			
	smi d2					
	extb.l d2				
	add.l d3,d3				
	addx.l d2,d2				
	add.l d3,d3				
	addx.l d2,d2				
						
	move.l d1,a1				
	add.l d3,a1				
						
	move.l -8(a3,d0.l),d3			
	smi d2					
	extb.l d2				
	move.l d2,d0				
	move.l d3,d1				
	add.l d1,d1				
	addx.l d0,d0				
	add.l d3,d1				
	addx.l d2,d0				
	add.l d1,d1				
	addx.l d0,d0				
						
	sub.l d1,a1				
	move.l a1,(a0)				
						
	move.l 76(a6),d0			
	addq.l #1,d0				
	move.l d0,76(a6)			
						
	cmp.l 44(sp),d0				
	jbcc _?L1168				
						
	lsl.l #2,d0				
	lea (a3,d0.l),a0			
						
	move.l (a0),d1				
	sub.l -16(a3,d0.l),d1			
						
	move.l -4(a3,d0.l),d3			
	smi d2					
	extb.l d2				
	add.l d3,d3				
	addx.l d2,d2				
	add.l d3,d3				
	addx.l d2,d2				
						
	add.l d3,d1				
						
	move.l -12(a3,d0.l),d3			
	smi d2					
	extb.l d2				
	add.l d3,d3				
	addx.l d2,d2				
	add.l d3,d3				
	addx.l d2,d2				
						
	move.l d1,a1				
	add.l d3,a1				
						
	move.l -8(a3,d0.l),d3			
	smi d2					
	extb.l d2				
	move.l d2,d0				
	move.l d3,d1				
	add.l d1,d1				
	addx.l d0,d0				
	add.l d3,d1				
	addx.l d2,d0				
	add.l d1,d1				
	addx.l d0,d0				
						
	sub.l d1,a1				
	move.l a1,(a0)				
						
	move.l 76(a6),d0			
	addq.l #1,d0				
	move.l d0,76(a6)			
						
	cmp.l 44(sp),d0				
	jbcs _?L980				
	jbra _?L1168				
_?L923:						
						
	subq.l #4,d0				
	jbne _?L926				
						
	clr.l 68(a6)				
						
	clr.l 64(a6)				
						
	moveq #2,d7				
	move.l d7,42(a6)			
						
	clr.l d0				
						
	clr.l d6				
	move.b d3,d6				
						
	cmp.l 44(sp),d0				
	jbcs _?L948				
	jbra _?L955				
_?L1012:					
						
	add.l d2,d2				
	move.l 140(sp),d0			
	lsl.l d0,d2				
	move.l d3,d0				
	move.l 88(sp),d1			
	lsr.l d1,d0				
	or.l d2,d0				
	jbra _?L1015				
_?L1007:					
						
	moveq #-1,d0				
	lsl.l d4,d0				
						
	or.l d0,d1				
	jbra _?L1006				
_?L1046:					
	clr.l d1				
	clr.l d0				
	jbra _?L939				
_?L922:						
						
	clr.l 234(a6)				
						
	clr.l 238(a6)				
						
	clr.l 242(a6)				
						
	clr.l 246(a6)				
						
	clr.l 250(a6)				
						
	clr.l 220(a6)				
						
	clr.w 224(a6)				
						
	clr.w 226(a6)				
						
	clr.l 228(a6)				
						
	clr.b 232(a6)				
						
	clr.l 84(a6)				
						
	clr.w 88(a6)				
						
	clr.b 90(a6)				
						
	pea 128.w				
	clr.l -(sp)				
	pea 92(a6)				
	jbsr _memset				
	lea (12,sp),sp				
						
	clr.l 80(a6)				
						
	moveq #4,d1				
	move.l d1,42(a6)			
						
	move.b 56(a6),76(sp)			
						
	clr.l d7				
	move.b 76(sp),d7			
						
	lea (220,a6),a0				
	move.l a0,88(sp)			
						
	clr.l d6				
	move.b d3,d6				
						
	tst.b 76(sp)				
	jbne _?L931				
						
	clr.b 76(sp)				
	jbra _?L932				
_?L924:						
						
	clr.l 60(a6)				
						
	moveq #1,d6				
	move.l d6,42(a6)			
						
	jbra _?L928				
_?L937:						
						
	moveq #31,d3				
	sub.l d0,d3				
	move.l 36(sp),d2			
	add.l d2,d2				
	lsl.l d3,d2				
	move.l d2,a1				
	move.l a0,d2				
	lsr.l d0,d2				
	move.l a1,d7				
	or.l d7,d2				
	move.l 36(sp),d3			
	lsr.l d0,d3				
	move.l d3,a1				
	jbra _?L938				
_?L935:						
						
	move.w #-1,a5				
	moveq #31,d1				
	sub.l d3,d1				
	moveq #-2,d2				
	lsl.l d1,d2				
	move.l a5,d1				
	lsr.l d3,d1				
	or.l d2,d1				
	move.l a5,d2				
	lsr.l d3,d2				
	move.l d2,a5				
	jbra _?L936				
_?L970:						
						
	moveq #1,d1				
	move.l d1,76(a6)			
						
	moveq #1,d0				
						
	cmp.l 44(sp),d1				
	jbcs _?L976				
_?L1170:					
	lea (92,a6),a2				
	jbra _?L974				
_?L1189:					
						
	pea 6.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d1,d2				
	clr.l 92(sp)				
	moveq #0,d1				
	not.b d1				
	and.l d2,d1				
	move.l d1,96(sp)			
						
	move.b d2,58(a6)			
						
	move.l 92(sp),d6			
	or.l 96(sp),d6				
	jbne _?L915				
						
	moveq #1,d7				
	move.l d7,52(a6)			
						
	moveq #2,d1				
	move.l d1,48(a6)			
	jbra _?L909				
_?L1195:					
						
	move.w 16(a6),d0			
						
	jbeq _?L1025				
	move.l 168(sp),a0			
	move.l (a0),a1				
	move.l 4(a0),a2				
	and.l #65535,d0				
	lsl.l #2,d0				
	add.l a1,d0				
_?L1032:					
						
	move.l (a1)+,d1				
	sub.l (a2),d1				
	move.l d1,(a2)+				
						
	cmp.l a1,d0				
	jbeq _?L1025				
						
	move.l (a1)+,d1				
	sub.l (a2),d1				
	move.l d1,(a2)+				
						
	cmp.l a1,d0				
	jbne _?L1032				
	jbra _?L1025				
_?L940:						
						
	move.w #-1,a1				
	moveq #31,d0				
	sub.l d3,d0				
	moveq #-2,d1				
	lsl.l d0,d1				
	move.l a1,d0				
	lsr.l d3,d0				
	or.l d1,d0				
	move.l a1,d1				
	lsr.l d3,d1				
						
	and.l 36(sp),d1				
	move.l a0,d3				
	and.l d3,d0				
	jbra _?L939				
_?L976:						
						
	lsl.l #2,d0				
						
	move.l -4(a3,d0.l),d2			
	add.l d2,(a3,d0.l)			
						
	move.l 76(a6),d0			
	addq.l #1,d0				
	move.l d0,76(a6)			
						
	cmp.l 44(sp),d0				
	jbcc _?L1168				
						
	lsl.l #2,d0				
						
	move.l -4(a3,d0.l),d2			
	add.l d2,(a3,d0.l)			
						
	move.l 76(a6),d0			
	addq.l #1,d0				
	move.l d0,76(a6)			
						
	cmp.l 44(sp),d0				
	jbcs _?L976				
	jbra _?L1168				
_?L1156:					
						
	cmp.b #3,76(sp)				
	jbeq _?L968				
	jbhi _?L969				
	cmp.b #1,76(sp)				
	jbeq _?L970				
	cmp.b #2,76(sp)				
	jbne _?L1170				
						
	moveq #2,d3				
	move.l d3,76(a6)			
						
	moveq #2,d0				
						
	cmp.l 44(sp),d3				
	jbcs _?L977				
	jbra _?L1170				
_?L943:						
						
	moveq #-1,d0				
	lsl.l d6,d0				
						
	or.l d0,d2				
	jbra _?L942				
_?L1027:					
						
	move.w 16(a6),d0			
						
	jbeq _?L1025				
	move.l 168(sp),a0			
	move.l (a0),a1				
	move.l 4(a0),a2				
	and.l #65535,d0				
	lsl.l #2,d0				
	add.l a1,d0				
_?L1034:					
						
	move.l (a2),d1				
						
	move.l d1,d5				
	smi d4					
	extb.l d4				
						
	move.l (a1),d3				
	smi d2					
	extb.l d2				
						
	add.l d3,d3				
	addx.l d2,d2				
						
	moveq #1,d6				
	and.l d6,d1				
	move.l d1,48(sp)			
	smi d7					
	extb.l d7				
	move.l d7,44(sp)			
						
	move.l 44(sp),d6			
	or.l d2,d6				
	move.l d1,d7				
	or.l d3,d7				
						
	move.l d4,d2				
	move.l d5,d3				
	add.l d7,d3				
	addx.l d6,d2				
						
	lsr.l #1,d2				
	roxr.l #1,d3				
						
	move.l d3,(a1)+				
						
	move.l d6,d2				
	move.l d7,d3				
	sub.l d5,d3				
	subx.l d4,d2				
						
	lsr.l #1,d2				
	roxr.l #1,d3				
						
	move.l d3,(a2)+				
						
	cmp.l d0,a1				
	jbeq _?L1025				
						
	move.l (a2),d1				
						
	move.l d1,d5				
	smi d4					
	extb.l d4				
						
	move.l (a1),d3				
	smi d2					
	extb.l d2				
						
	add.l d3,d3				
	addx.l d2,d2				
						
	moveq #1,d6				
	and.l d6,d1				
	move.l d1,48(sp)			
	smi d7					
	extb.l d7				
	move.l d7,44(sp)			
						
	move.l 44(sp),d6			
	or.l d2,d6				
	move.l d1,d7				
	or.l d3,d7				
						
	move.l d4,d2				
	move.l d5,d3				
	add.l d7,d3				
	addx.l d6,d2				
						
	lsr.l #1,d2				
	roxr.l #1,d3				
						
	move.l d3,(a1)+				
						
	move.l d6,d2				
	move.l d7,d3				
	sub.l d5,d3				
	subx.l d4,d2				
						
	lsr.l #1,d2				
	roxr.l #1,d3				
						
	move.l d3,(a2)+				
						
	cmp.l d0,a1				
	jbne _?L1034				
	jbra _?L1025				
_?L1026:					
						
	move.w 16(a6),d0			
						
	jbeq _?L1025				
	move.l 168(sp),a0			
	move.l (a0),a1				
	move.l 4(a0),a2				
	and.l #65535,d0				
	lsl.l #2,d0				
	add.l a1,d0				
_?L1033:					
						
	move.l (a1),d1				
	add.l (a2)+,d1				
	move.l d1,(a1)+				
						
	cmp.l d0,a1				
	jbeq _?L1025				
						
	move.l (a1),d1				
	add.l (a2)+,d1				
	move.l d1,(a1)+				
						
	cmp.l d0,a1				
	jbne _?L1033				
	jbra _?L1025				
_?L968:						
						
	moveq #3,d6				
	move.l d6,76(a6)			
						
	cmp.l 44(sp),d6				
	jbcc _?L1170				
						
	moveq #3,d6				
	move.l d6,d0				
_?L979:						
						
	lsl.l #2,d0				
	lea (a3,d0.l),a0			
						
	move.l -12(a3,d0.l),d1			
	add.l (a0),d1				
						
	move.l -4(a3,d0.l),d3			
	smi d2					
	extb.l d2				
	move.l d2,d6				
	move.l d3,d7				
	add.l d7,d7				
	addx.l d6,d6				
	add.l d7,d3				
	addx.l d6,d2				
						
	move.l d1,a1				
	add.l d3,a1				
						
	move.l -8(a3,d0.l),d3			
	smi d2					
	extb.l d2				
	move.l d2,d0				
	move.l d3,d1				
	add.l d1,d1				
	addx.l d0,d0				
	add.l d3,d1				
	addx.l d2,d0				
						
	sub.l d1,a1				
	move.l a1,(a0)				
						
	move.l 76(a6),d0			
	addq.l #1,d0				
	move.l d0,76(a6)			
						
	cmp.l 44(sp),d0				
	jbcc _?L1168				
						
	lsl.l #2,d0				
	lea (a3,d0.l),a0			
						
	move.l -12(a3,d0.l),d1			
	add.l (a0),d1				
						
	move.l -4(a3,d0.l),d3			
	smi d2					
	extb.l d2				
	move.l d2,d6				
	move.l d3,d7				
	add.l d7,d7				
	addx.l d6,d6				
	add.l d7,d3				
	addx.l d6,d2				
						
	move.l d1,a1				
	add.l d3,a1				
						
	move.l -8(a3,d0.l),d3			
	smi d2					
	extb.l d2				
	move.l d2,d0				
	move.l d3,d1				
	add.l d1,d1				
	addx.l d0,d0				
	add.l d3,d1				
	addx.l d2,d0				
						
	sub.l d1,a1				
	move.l a1,(a0)				
						
	move.l 76(a6),d0			
	addq.l #1,d0				
	move.l d0,76(a6)			
						
	cmp.l 44(sp),d0				
	jbcs _?L979				
	jbra _?L1168				
_?L915:						
						
	move.l 92(sp),d6			
	move.l 96(sp),d7			
	clr.l d0				
	moveq #1,d1				
	sub.l d1,d7				
	subx.l d0,d6				
	jbeq _?L1202				
						
	clr.l 100(sp)				
	moveq #7,d6				
	not.b d6				
	and.l d2,d6				
	move.l d6,104(sp)			
	move.l 100(sp),d7			
	or.l 104(sp),d7				
	jbeq _?L1045				
						
	move.l 92(sp),d6			
	move.l 96(sp),d7			
	clr.l d0				
	moveq #12,d1				
	sub.l d1,d7				
	subx.l d0,d6				
	jbhi _?L918				
						
	moveq #2,d1				
	move.l d1,52(a6)			
						
	subq.b #8,d2				
	move.b d2,56(a6)			
						
	moveq #2,d1				
	move.l d1,48(a6)			
	jbra _?L909				
_?L1191:					
						
	clr.l d0				
						
	move.b d0,89(a6)			
						
	moveq #2,d3				
	move.l d3,80(a6)			
	jbra _?L1002				
_?L1047:					
	clr.l d1				
	clr.l d0				
	jbra _?L997				
_?L918:						
						
	clr.l 108(sp)				
	moveq #31,d6				
	not.b d6				
	and.l d2,d6				
	move.l d6,112(sp)			
	move.l 108(sp),d7			
	or.l 112(sp),d7				
	jbeq _?L1045				
						
	moveq #3,d0				
	move.l d0,52(a6)			
						
	add.b #-31,d2				
	move.b d2,56(a6)			
						
	moveq #2,d1				
	move.l d1,48(a6)			
	jbra _?L909				
_?L1202:					
						
	moveq #4,d1				
	move.l d1,52(a6)			
						
	moveq #2,d1				
	move.l d1,48(a6)			
	jbra _?L909				
_?L995:						
						
	moveq #31,d6				
	sub.l d0,d6				
	move.l d3,d2				
	add.l d2,d2				
	lsl.l d6,d2				
	move.l d2,a1				
	move.l a5,d2				
	lsr.l d0,d2				
	move.l a1,d6				
	or.l d6,d2				
	jbra _?L996				
_?L998:						
						
	move.w #-1,a2				
	moveq #31,d0				
	sub.l d6,d0				
	moveq #-2,d1				
	lsl.l d0,d1				
	move.l a2,d0				
	lsr.l d6,d0				
	or.l d1,d0				
	move.l a2,d1				
	lsr.l d6,d1				
						
	and.l d3,d1				
	move.l a5,d3				
	and.l d3,d0				
	jbra _?L997				
_?L1194:					
						
	pea 285.w				
	pea _?LC0				
	pea _?LC6				
						
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
_?L1045:					
						
	moveq #-17,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (116,sp),sp				
	rts					
_?L1200:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 5.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1036				
	jbra _?L1203				
_?L1196:					
						
	pea 961.w				
	pea _?LC0				
	pea _?LC7				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
_?L1050:					
						
	moveq #-3,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (116,sp),sp				
	rts					
_?L1199:					
	lea _miniflac_bitreader_fill,a5		
	jbra _?L932				
_?L994:						
	jbsr (_miniflac_bitreader_read?part?0)	
_?L1043:					
	moveq #-16,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (116,sp),sp				
	rts					
						
	.align	2				
						
_miniflac_oggfunction_start:			
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
						
	move.l 36(a3),d0			
						
	moveq #12,d1				
	cmp.l d0,d1				
	jbeq _?L1205				
						
	lea (40,a3),a4				
						
	moveq #13,d2				
	cmp.l d0,d2				
	jbcs _?L1206				
	add.l d0,d0				
	move.w _?L1208(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1208:					
	.dc.w _?L1256-_?L1208			
	.dc.w _?L1257-_?L1208			
	.dc.w _?L1258-_?L1208			
	.dc.w _?L1259-_?L1208			
	.dc.w _?L1260-_?L1208			
	.dc.w _?L1261-_?L1208			
	.dc.w _?L1262-_?L1208			
	.dc.w _?L1263-_?L1208			
	.dc.w _?L1264-_?L1208			
	.dc.w _?L1265-_?L1208			
	.dc.w _?L1266-_?L1208			
	.dc.w _?L1209-_?L1208			
	.dc.w _?L1206-_?L1208			
	.dc.w _?L1207-_?L1208			
_?L1209:					
						
	move.b 86(a3),d3			
						
	move.b 87(a3),d6			
_?L1222:					
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	cmp.b d6,d3				
	jbls _?L1249				
						
	move.w #-2,a6				
_?L1239:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1232				
						
	move.b 48(a3),d0			
	cmp.b #7,d0				
	jbls _?L1274				
						
	subq.b #8,d0				
	move.b d0,48(a3)			
						
	move.l 40(a3),d7			
	move.l 44(a3),d5			
						
	clr.l d2				
	move.b d0,d2				
						
	move.w #-32,a0				
	add.l d2,a0				
	tst.l a0				
	jblt _?L1243				
	move.l d7,d1				
	move.l a0,d4				
	lsr.l d4,d1				
_?L1244:					
						
	moveq #0,d4				
	not.b d4				
	and.l d4,d1				
						
	tst.b d0				
	jbeq _?L1245				
						
	move.w #64,a2				
	sub.l d2,a2				
						
	move.w #32,a0				
	sub.l d2,a0				
	tst.l a0				
	jblt _?L1246				
	moveq #-1,d0				
	move.l a0,d2				
	lsr.l d2,d0				
	clr.l d2				
						
	and.l d7,d2				
	move.l d2,40(a3)			
	and.l d5,d0				
	move.l d0,44(a3)			
						
	add.w d1,88(a3)				
						
	addq.b #1,d6				
	move.b d6,87(a3)			
						
	cmp.b d3,d6				
	jbne _?L1239				
_?L1249:					
						
	clr.w 90(a3)				
						
	moveq #12,d2				
	move.l d2,36(a3)			
						
	tst.b 468(a3)				
	jbne _?L1275				
						
	btst #1,69(a3)				
	jbne _?L1276				
_?L1250:					
						
	clr.l d1				
	clr.w d0				
_?L1252:					
						
	move.l 52(a3),a1			
						
	move.l 64(sp),a0			
	move.l 60(sp),d2			
	add.l a1,d2				
	move.l d2,(a0)				
						
	move.l 56(a3),a0			
	sub.l a1,a0				
						
	move.l 68(sp),a1			
	move.l a0,(a1)				
						
	clr.l d2				
	move.w 88(a3),d2			
						
	move.l d2,a1				
	sub.l d1,a1				
						
	cmp.l a0,a1				
	jbcc _?L1253				
_?L1278:					
						
	and.l #65535,d0				
						
	sub.l d0,d2				
	move.l 68(sp),a0			
	move.l d2,(a0)				
_?L1253:					
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L1276:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	clr.w 16(a3)				
						
	clr.w 18(a3)				
						
	clr.l 20(a3)				
						
	clr.l 24(a3)				
						
	clr.l 28(a3)				
						
	clr.l 32(a3)				
						
	clr.l 92(a3)				
						
	clr.l 96(a3)				
						
	clr.l 100(a3)				
						
	clr.l 104(a3)				
						
	clr.l 108(a3)				
						
	move.l #128,114(a3)			
						
	clr.w 112(a3)				
						
	clr.l 118(a3)				
						
	clr.l 122(a3)				
						
	clr.b 126(a3)				
						
	clr.l 128(a3)				
						
	clr.b 132(a3)				
						
	clr.l 134(a3)				
						
	clr.l 138(a3)				
						
	clr.l 142(a3)				
						
	clr.l 146(a3)				
						
	clr.l 150(a3)				
						
	clr.l 154(a3)				
						
	clr.l 158(a3)				
						
	clr.l 162(a3)				
						
	clr.l 166(a3)				
						
	clr.l 170(a3)				
						
	clr.w 174(a3)				
						
	clr.w 176(a3)				
						
	clr.l 178(a3)				
						
	clr.l 182(a3)				
						
	clr.l 186(a3)				
						
	clr.l 190(a3)				
						
	clr.l 194(a3)				
						
	clr.l 198(a3)				
						
	clr.w 216(a3)				
						
	clr.b 214(a3)				
						
	clr.l 210(a3)				
						
	clr.w 222(a3)				
						
	clr.w 224(a3)				
						
	clr.w 226(a3)				
						
	clr.l 228(a3)				
						
	clr.l 232(a3)				
						
	clr.w 236(a3)				
						
	clr.l 238(a3)				
	clr.l 242(a3)				
						
	clr.b 246(a3)				
						
	clr.l 248(a3)				
						
	clr.b 256(a3)				
						
	clr.l 252(a3)				
						
	clr.l 258(a3)				
						
	clr.l 262(a3)				
						
	clr.w 266(a3)				
						
	clr.b 268(a3)				
						
	clr.l 270(a3)				
						
	clr.l 278(a3)				
						
	clr.l 274(a3)				
						
	clr.l 286(a3)				
						
	clr.l 282(a3)				
						
	clr.l 294(a3)				
						
	clr.w 298(a3)				
						
	clr.b 300(a3)				
						
	pea 128.w				
	clr.l -(sp)				
	pea 302(a3)				
	jbsr _memset				
	lea (12,sp),sp				
						
	clr.l 290(a3)				
						
	clr.l 444(a3)				
						
	clr.l 448(a3)				
						
	clr.l 452(a3)				
						
	clr.l 456(a3)				
						
	clr.l 460(a3)				
						
	clr.l 430(a3)				
						
	clr.w 434(a3)				
						
	clr.w 436(a3)				
						
	clr.l 438(a3)				
						
	clr.b 442(a3)				
						
	clr.l (a3)				
						
	clr.l d1				
	clr.w d0				
	jbra _?L1252				
_?L1206:					
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L1275:					
						
	move.l 464(a3),a0			
	cmp.l 78(a3),a0				
	jbeq _?L1250				
						
	moveq #13,d0				
	move.l d0,36(a3)			
_?L1207:					
						
	move.w 90(a3),d6			
						
	move.w 88(a3),d3			
						
	cmp.w d3,d6				
	jbcc _?L1277				
	addq.w #1,d6				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	moveq #-1,d4				
	moveq #-2,d5				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1232				
_?L1224:					
						
	move.b 48(a3),d0			
	cmp.b #7,d0				
	jbls _?L1235				
						
	subq.b #8,d0				
	move.b d0,48(a3)			
						
	jbeq _?L1226				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L1227				
	move.l d4,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,40(a3)				
	and.l d0,44(a3)				
						
	move.w d6,90(a3)			
						
	move.w d6,d0				
	addq.w #1,d0				
	cmp.w d3,d6				
	jbeq _?L1230				
_?L1229:					
						
	move.w d0,d6				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1224				
_?L1232:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L1245:					
						
	clr.l 40(a3)				
	clr.l 44(a3)				
						
	add.w d1,88(a3)				
						
	addq.b #1,d6				
	move.b d6,87(a3)			
						
	cmp.b d6,d3				
	jbne _?L1239				
	jbra _?L1249				
_?L1243:					
						
	move.w #31,a2				
	sub.l d2,a2				
	move.l d7,d1				
	add.l d1,d1				
	move.l a2,d4				
	lsl.l d4,d1				
	move.l d1,a0				
	move.l d5,d1				
	lsr.l d2,d1				
	move.l a0,d4				
	or.l d4,d1				
	jbra _?L1244				
_?L1226:					
						
	clr.l 40(a3)				
	clr.l 44(a3)				
						
	move.w d6,90(a3)			
						
	move.w d6,d0				
	addq.w #1,d0				
	cmp.w d3,d6				
	jbne _?L1229				
_?L1230:					
						
	clr.l 36(a3)				
_?L1220:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1232				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #79,d1				
	jbne _?L1206				
						
	moveq #1,d4				
	move.l d4,36(a3)			
_?L1219:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1232				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #103,d1				
	jbne _?L1206				
						
	moveq #2,d0				
	move.l d0,36(a3)			
_?L1218:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1232				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #103,d1				
	jbne _?L1206				
						
	moveq #3,d1				
	move.l d1,36(a3)			
_?L1217:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1232				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #83,d1				
	jbne _?L1206				
						
	moveq #4,d2				
	move.l d2,36(a3)			
_?L1216:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1232				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,68(a3)			
						
	jbne _?L1206				
						
	moveq #5,d4				
	move.l d4,36(a3)			
_?L1215:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1232				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,69(a3)			
						
	moveq #6,d0				
	move.l d0,36(a3)			
_?L1214:					
						
	pea 64.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1232				
						
	pea 8.w					
	move.l a4,-(sp)				
	lea _miniflac_bitreader_read,a6		
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,36(sp)			
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,d7				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,d5				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,d3				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,40(sp)			
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,44(sp)			
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,48(sp)			
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	moveq #24,d0				
	lsl.l d0,d1				
	move.l d1,d0				
						
	rol.l #8,d7				
	clr.b d7				
	move.l d7,d1				
	and.l #65535,d1				
						
	or.b 39(sp),d1				
						
	swap d5					
	clr.w d5				
	move.l d5,d2				
	and.l #16711680,d2			
						
	or.l d2,d1				
						
	moveq #24,d2				
	lsl.l d2,d3				
						
	or.b 43(sp),d0				
						
	move.l 44(sp),d2			
	lsl.l #8,d2				
	and.l #65280,d2				
						
	or.l d2,d0				
						
	move.l 48(sp),d2			
	swap d2					
	clr.w d2				
	and.l #16711680,d2			
						
	or.l d2,d0				
	move.l d0,70(a3)			
	or.l d3,d1				
	move.l d1,74(a3)			
						
	moveq #7,d4				
	move.l d4,36(a3)			
_?L1213:					
						
	pea 32.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1232				
						
	pea 8.w					
	move.l a4,-(sp)				
	lea _miniflac_bitreader_read,a6		
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,d4				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,d3				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,d5				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	clr.l d0				
	move.b d3,d0				
						
	lsl.l #8,d0				
						
	and.l #255,d5				
						
	swap d5					
	clr.w d5				
						
	or.l d5,d0				
	or.b d4,d0				
						
	moveq #24,d2				
	lsl.l d2,d1				
						
	or.l d1,d0				
	move.l d0,78(a3)			
						
	moveq #8,d4				
	move.l d4,36(a3)			
_?L1212:					
						
	pea 32.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1232				
						
	pea 8.w					
	move.l a4,-(sp)				
	lea _miniflac_bitreader_read,a6		
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,d4				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,d3				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d1,d5				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	clr.l d0				
	move.b d3,d0				
						
	lsl.l #8,d0				
						
	and.l #255,d5				
						
	swap d5					
	clr.w d5				
						
	or.l d5,d0				
	or.b d4,d0				
						
	moveq #24,d2				
	lsl.l d2,d1				
						
	or.l d1,d0				
	move.l d0,82(a3)			
						
	moveq #9,d4				
	move.l d4,36(a3)			
_?L1211:					
						
	pea 32.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1232				
						
	move.b 48(a3),d0			
	cmp.b #31,d0				
	jbls _?L1235				
						
	add.b #-32,d0				
	move.b d0,48(a3)			
						
	jbeq _?L1254				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L1237				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,40(a3)				
	and.l d0,44(a3)				
						
	moveq #10,d0				
	move.l d0,36(a3)			
_?L1210:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1232				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,d3				
						
	move.b d1,86(a3)			
						
	clr.b 87(a3)				
						
	clr.w 88(a3)				
						
	moveq #11,d1				
	move.l d1,36(a3)			
	clr.b d6				
	jbra _?L1222				
_?L1246:					
						
	moveq #31,d0				
	sub.l a2,d0				
	move.l a6,d2				
	lsl.l d0,d2				
	moveq #-1,d0				
	move.l a2,d4				
	lsr.l d4,d0				
	or.l d2,d0				
	moveq #-1,d2				
	lsr.l d4,d2				
						
	and.l d7,d2				
	move.l d2,40(a3)			
	and.l d5,d0				
	move.l d0,44(a3)			
						
	add.w d1,88(a3)				
						
	addq.b #1,d6				
	move.b d6,87(a3)			
						
	cmp.b d3,d6				
	jbne _?L1239				
	jbra _?L1249				
_?L1227:					
						
	moveq #31,d0				
	sub.l d2,d0				
	move.l d5,d1				
	lsl.l d0,d1				
	move.l d4,d0				
	lsr.l d2,d0				
	or.l d1,d0				
	move.l d4,d1				
	lsr.l d2,d1				
						
	and.l d1,40(a3)				
	and.l d0,44(a3)				
						
	move.w d6,90(a3)			
						
	move.w d6,d0				
	addq.w #1,d0				
	cmp.w d3,d6				
	jbne _?L1229				
	jbra _?L1230				
_?L1254:					
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,40(a3)				
	and.l d0,44(a3)				
						
	moveq #10,d0				
	move.l d0,36(a3)			
	jbra _?L1210				
_?L1237:					
						
	moveq #-1,d1				
	moveq #31,d0				
	sub.l d2,d0				
	moveq #-2,d3				
	lsl.l d0,d3				
	move.l d1,d0				
	lsr.l d2,d0				
	or.l d3,d0				
	lsr.l d2,d1				
						
	and.l d1,40(a3)				
	and.l d0,44(a3)				
						
	moveq #10,d0				
	move.l d0,36(a3)			
	jbra _?L1210				
_?L1260:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1216				
_?L1261:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1215				
_?L1262:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1214				
_?L1263:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1213				
_?L1264:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1212				
_?L1265:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1211				
_?L1266:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1210				
_?L1258:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1218				
_?L1256:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1220				
_?L1257:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1219				
_?L1259:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1217				
_?L1205:					
						
	move.w 90(a3),d0			
	clr.l d1				
	move.w d0,d1				
						
	move.l 52(a3),a1			
						
	move.l 64(sp),a0			
	move.l 60(sp),d2			
	add.l a1,d2				
	move.l d2,(a0)				
						
	move.l 56(a3),a0			
	sub.l a1,a0				
						
	move.l 68(sp),a1			
	move.l a0,(a1)				
						
	clr.l d2				
	move.w 88(a3),d2			
						
	move.l d2,a1				
	sub.l d1,a1				
						
	cmp.l a0,a1				
	jbcc _?L1253				
	jbra _?L1278				
_?L1277:					
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	clr.l 36(a3)				
	jbra _?L1220				
_?L1274:					
	jbsr (_miniflac_bitreader_read?part?0)	
_?L1235:					
	jbsr (_miniflac_bitreader_discard?part?0)
						
	.globl	___lshrdi3			
	.align	2				
						
_miniflac_sync_internal:			
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 44(sp),a4			
	move.l 48(sp),a3			
						
	moveq #5,d0				
	cmp.l (a4),d0				
	jbcs _?L1303				
	move.l (a4),d0				
	add.l d0,d0				
	move.w _?L1282(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1282:					
	.dc.w _?L1287-_?L1282			
	.dc.w _?L1286-_?L1282			
	.dc.w _?L1285-_?L1282			
	.dc.w _?L1284-_?L1282			
	.dc.w _?L1283-_?L1282			
	.dc.w _?L1281-_?L1282			
_?L1286:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	move.b 8(a3),d0				
	cmp.b #7,d0				
	jbls _?L1321				
						
	and.l #255,d0				
						
	move.l d0,d2				
	subq.l #8,d2				
						
	move.w #-40,a0				
	add.l d0,a0				
	move.l (a3),d0				
	tst.l a0				
	jblt _?L1310				
	move.l a0,d1				
	lsr.l d1,d0				
_?L1311:					
						
	cmp.b #102,d0				
	jbeq _?L1512				
						
	cmp.b #-1,d0				
	jbne _?L1303				
_?L1322:					
						
	moveq #5,d3				
	move.l d3,(a4)				
_?L1281:					
						
	move.l a4,d4				
	add.l #210,d4				
						
	lea (122,a4),a5				
						
	lea _miniflac_frame_decode,a6		
_?L1421:					
						
	tst.l 210(a4)				
	jbeq _?L1513				
						
	clr.l -(sp)				
	move.l a5,-(sp)				
	move.l a3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a6)				
	lea (16,sp),sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L1421				
_?L1279:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L1314:					
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	subq.l #3,d0				
	jbne _?L1303				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
_?L1517:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #67,d1				
	jbne _?L1319				
						
	clr.l 96(a4)				
						
	tst.b 8(a3)				
	jbne _?L1514				
						
	clr.b 9(a3)				
						
	clr.w 10(a3)				
						
	moveq #3,d1				
	move.l d1,(a4)				
_?L1284:					
						
	pea 16.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
_?L1518:					
						
	move.b 8(a3),d0				
	cmp.b #13,d0				
	jbls _?L1321				
						
	and.l #255,d0				
	move.l d0,a0				
						
	lea (-14,a0),a1				
						
	lea (-46,a0),a0				
	move.l (a3),d0				
	tst.l a0				
	jblt _?L1323				
	move.l a0,d2				
	lsr.l d2,d0				
_?L1324:					
						
	and.l #16383,d0				
						
	cmp.w #16382,d0				
	jbeq _?L1322				
						
	moveq #4,d7				
	move.l d7,(a4)				
_?L1283:					
						
	move.l 100(a4),d0			
						
	jbeq _?L1515				
						
	subq.l #1,d0				
	jbne _?L1303				
	moveq #6,d2				
	cmp.l 114(a4),d2			
	jbcs _?L1325				
	move.l 114(a4),d0			
	add.l d0,d0				
	move.w _?L1327(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1327:					
	.dc.w _?L1333-_?L1327			
	.dc.w _?L1332-_?L1327			
	.dc.w _?L1331-_?L1327			
	.dc.w _?L1330-_?L1327			
	.dc.w _?L1329-_?L1327			
	.dc.w _?L1328-_?L1327			
	.dc.w _?L1326-_?L1327			
_?L1424:					
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	clr.l 92(a4)				
_?L1289:					
						
	move.b #1,468(a4)			
						
	move.l 78(a4),464(a4)			
						
	moveq #2,d7				
	move.l d7,(a4)				
_?L1285:					
						
	move.l 96(a4),d0			
						
	moveq #2,d7				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d7				
	jbeq _?L1313				
_?L1523:					
	moveq #2,d1				
	cmp.l d0,d1				
	jbcs _?L1314				
	tst.l d0				
	jbeq _?L1315				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1516				
_?L1352:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L1287:					
						
	moveq #7,d1				
	cmp.l 92(a4),d1				
	jbcs _?L1289				
	move.l 92(a4),d0			
	add.l d0,d0				
	move.w _?L1291(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1291:					
	.dc.w _?L1298-_?L1291			
	.dc.w _?L1451-_?L1291			
	.dc.w _?L1452-_?L1291			
	.dc.w _?L1453-_?L1291			
	.dc.w _?L1454-_?L1291			
	.dc.w _?L1455-_?L1291			
	.dc.w _?L1456-_?L1291			
	.dc.w _?L1450-_?L1291			
_?L1515:					
						
	move.l a3,48(sp)			
						
	lea (100,a4),a4				
	move.l a4,44(sp)			
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
						
	jbra _miniflac_metadata_sync		
_?L1516:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #76,d1				
	jbne _?L1319				
						
	moveq #2,d7				
	move.l d7,96(a4)			
_?L1313:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #97,d1				
	jbne _?L1319				
						
	moveq #3,d0				
	move.l d0,96(a4)			
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
	jbra _?L1517				
_?L1513:					
						
	move.l a5,-(sp)				
	move.l a3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L1323:					
						
	add.l d0,d0				
	moveq #31,d2				
	sub.l a1,d2				
	move.l d0,d1				
	lsl.l d2,d1				
	move.l 4(a3),d0				
	move.l a1,d3				
	lsr.l d3,d0				
	or.l d1,d0				
	jbra _?L1324				
_?L1334:					
						
	subq.l #2,d0				
	jbeq _?L1390				
_?L1303:					
						
	moveq #-1,d0				
_?L1526:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L1456:					
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1292:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.b d1				
	jbne _?L1303				
						
	moveq #7,d3				
	move.l d3,92(a4)			
_?L1290:					
						
	pea 16.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	move.b 8(a3),d0				
	cmp.b #15,d0				
	jbls _?L1413				
						
	add.b #-16,d0				
	move.b d0,8(a3)				
						
	jbeq _?L1424				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L1307				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	clr.l 92(a4)				
	jbra _?L1289				
_?L1455:					
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1293:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #1,d1				
	jbne _?L1303				
						
	moveq #6,d2				
	move.l d2,92(a4)			
	jbra _?L1292				
_?L1454:					
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1294:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #67,d1				
	jbne _?L1303				
						
	moveq #5,d1				
	move.l d1,92(a4)			
	jbra _?L1293				
_?L1453:					
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1295:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #65,d1				
	jbne _?L1303				
						
	moveq #4,d0				
	move.l d0,92(a4)			
	jbra _?L1294				
_?L1452:					
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1296:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #76,d1				
	jbne _?L1303				
						
	moveq #3,d7				
	move.l d7,92(a4)			
	jbra _?L1295				
_?L1451:					
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1297:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #70,d1				
	jbne _?L1303				
						
	moveq #2,d3				
	move.l d3,92(a4)			
	jbra _?L1296				
_?L1450:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1290				
_?L1298:					
						
	pea 8.w					
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #127,d1				
	jbne _?L1423				
						
	moveq #1,d2				
	move.l d2,92(a4)			
	jbra _?L1297				
_?L1328:					
						
	move.l a4,d3				
	add.l #166,d3				
	lea _miniflac_cuesheet_read_track_indexpoints,a5
_?L1389:					
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1389				
_?L1365:					
						
	moveq #2,d3				
	cmp.l d0,d3				
	jbne _?L1279				
_?L1337:					
						
	tst.b 8(a3)				
	jbne _?L1418				
_?L1419:					
						
	clr.b 9(a3)				
						
	clr.w 10(a3)				
						
	clr.l 100(a4)				
						
	clr.l 104(a4)				
						
	moveq #3,d1				
	move.l d1,(a4)				
_?L1524:					
						
	pea 16.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1518				
	jbra _?L1352				
_?L1332:					
						
	move.l 206(a4),d3			
						
	move.l 202(a4),d6			
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_read,a6		
						
	cmp.l d6,d3				
	jbcc _?L1337				
_?L1336:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	addq.l #1,d3				
	move.l d3,206(a4)			
						
	cmp.l d3,d6				
	jbne _?L1336				
						
	tst.b 8(a3)				
	jbeq _?L1419				
	jbra _?L1418				
_?L1330:					
						
	move.l 178(a4),d0			
						
	moveq #1,d3				
	cmp.l d0,d3				
	jbcs _?L1334				
						
	subq.l #1,d0				
	jbne _?L1393				
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1391:					
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,178(a4)			
_?L1390:					
						
	move.b 8(a3),d3				
						
	cmp.b #15,d3				
	jbhi _?L1395				
						
	move.l 16(a3),a1			
						
	move.l 12(a3),d2			
						
	cmp.l a1,d2				
	jbcc _?L1352				
						
	move.l 20(a3),a2			
						
	move.l d2,a0				
	addq.l #1,a0				
	move.l a0,12(a3)			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b (a2,d2.l),d5			
						
	move.l d4,(a3)				
	move.l d5,4(a3)				
						
	move.b d3,d0				
	addq.b #8,d0				
	move.b d0,8(a3)				
						
	move.l 24(a3),d6			
						
	move.l d6,d7				
	addq.l #1,d7				
	move.l d7,24(a3)			
						
	cmp.b #15,d0				
	jbhi _?L1395				
	cmp.l a1,a0				
	jbcc _?L1352				
						
	addq.l #2,d2				
	move.l d2,12(a3)			
						
	clr.l d2				
	move.b (a2,a0.l),d2			
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	clr.l d7				
	or.l d0,d7				
	move.l d7,(a3)				
	or.l d1,d2				
	move.l d2,4(a3)				
						
	add.b #16,d3				
	move.b d3,8(a3)				
						
	addq.l #2,d6				
	move.l d6,24(a3)			
_?L1395:					
						
	pea 16.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.l #1,186(a4)			
						
	clr.l 178(a4)				
_?L1393:					
						
	move.l 186(a4),d7			
	cmp.l 182(a4),d7			
	jbeq _?L1337				
						
	pea 64.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,178(a4)			
	jbra _?L1391				
_?L1331:					
						
	move.l 190(a4),d0			
						
	jbeq _?L1397				
	subq.l #1,d0				
	jbne _?L1303				
						
	move.l 198(a4),a5			
						
	move.l 194(a4),a6			
						
	move.b 8(a3),d6				
						
	cmp.l a5,a6				
	jbls _?L1337				
_?L1403:					
						
	cmp.b #7,d6				
	jbhi _?L1519				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L1352				
						
	move.l 20(a3),a0			
						
	move.l d2,d3				
	addq.l #1,d3				
	move.l d3,12(a3)			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,a1				
	move.l d1,d7				
	or.b (a0,d2.l),d7			
						
	addq.l #1,24(a3)			
	move.b d6,d3				
_?L1399:					
						
	move.b d3,8(a3)				
	clr.l d0				
						
	tst.b d3				
	jbeq _?L1429				
						
	move.b d3,d0				
						
	moveq #64,d1				
	sub.l d0,d1				
	move.l d1,-(sp)				
	pea -1.w				
	pea -1.w				
	move.l a1,48(sp)			
	jbsr ___lshrdi3				
	lea (12,sp),sp				
						
	move.l 36(sp),a1			
	move.l a1,d2				
	and.l d2,d0				
	and.l d7,d1				
_?L1401:					
	move.l d0,(a3)				
	move.l d1,4(a3)				
						
	addq.l #1,a5				
	move.l a5,198(a4)			
						
	cmp.l a5,a6				
	jbeq _?L1337				
	cmp.b #7,d6				
	jbhi _?L1430				
						
	move.l 16(a3),a1			
						
	clr.l d2				
	move.b d3,d2				
	moveq #64,d0				
	sub.l d2,d0				
						
	moveq #32,d1				
	sub.l d2,d1				
	jbmi _?L1404				
	moveq #-1,d2				
	lsr.l d1,d2				
	clr.l d6				
_?L1410:					
						
	move.l 12(a3),d0			
						
	cmp.l d0,a1				
	jbls _?L1352				
						
	move.l 20(a3),a0			
						
	move.l d0,d7				
	addq.l #1,d7				
	move.l d7,12(a3)			
						
	move.b (a0,d0.l),d7			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
						
	addq.l #1,24(a3)			
						
	move.b d3,8(a3)				
						
	jbeq _?L1407				
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	or.b d7,d1				
						
	move.l d6,d7				
	and.l d0,d7				
	move.l d7,(a3)				
	and.l d2,d1				
	move.l d1,4(a3)				
						
	addq.l #1,a5				
	move.l a5,198(a4)			
						
	cmp.l a6,a5				
	jbcs _?L1410				
						
	tst.b 8(a3)				
	jbeq _?L1419				
	jbra _?L1418				
_?L1329:					
						
	move.l a4,d3				
	add.l #134,d3				
	lea _miniflac_vorbis_comment_read_length,a5
_?L1364:					
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1365				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1364				
	jbra _?L1365				
_?L1326:					
						
	move.l 154(a4),d0			
						
	moveq #9,d2				
	cmp.l d0,d2				
	jbcs _?L1520				
						
	moveq #9,d7				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d7				
	jbeq _?L1368				
						
	subq.l #8,d0				
	jbeq _?L1372				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_colordepth	
	lea (12,sp),sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L1372				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbne _?L1279				
						
	tst.b 8(a3)				
	jbeq _?L1419				
	jbra _?L1418				
_?L1333:					
						
	move.l 122(a4),d0			
						
	moveq #7,d7				
	cmp.l d0,d7				
	jbcs _?L1521				
						
	moveq #7,d2				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d2				
	jbeq _?L1341				
						
	moveq #6,d3				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d3				
	jbeq _?L1342				
						
	moveq #5,d7				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d7				
	jbeq _?L1343				
						
	subq.l #4,d0				
	jbeq _?L1347				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbne _?L1346				
_?L1347:					
						
	pea 20.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 20.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,128(a4)			
						
	moveq #5,d3				
	move.l d3,122(a4)			
_?L1343:					
						
	pea 3.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 3.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d7				
	move.l d7,122(a4)			
_?L1342:					
						
	pea 5.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 5.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
	move.b d1,132(a4)			
						
	moveq #7,d0				
	move.l d0,122(a4)			
_?L1341:					
						
	pea 36.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 36.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #8,d1				
	move.l d1,122(a4)			
_?L1340:					
						
	move.b 126(a4),d0			
						
	move.b 8(a3),d7				
						
	cmp.b #16,d0				
	jbeq _?L1337				
	move.b d0,d6				
	addq.b #1,d6				
						
	cmp.b #15,d0				
	jbhi _?L1337				
_?L1355:					
						
	cmp.b #7,d7				
	jbhi _?L1522				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L1352				
						
	move.l 20(a3),a0			
						
	move.l d2,d3				
	addq.l #1,d3				
	move.l d3,12(a3)			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,a5				
	move.l d1,d3				
	or.b (a0,d2.l),d3			
	move.l d3,d2				
						
	addq.l #1,24(a3)			
	move.b d7,d3				
_?L1350:					
						
	move.b d3,8(a3)				
						
	jbeq _?L1425				
						
	clr.l d0				
	move.b d3,d0				
						
	moveq #64,d1				
	sub.l d0,d1				
	move.l d1,-(sp)				
	pea -1.w				
	pea -1.w				
	move.l d2,48(sp)			
	jbsr ___lshrdi3				
	lea (12,sp),sp				
	move.l d0,a0				
	move.l d1,a1				
						
	move.l a0,d0				
	move.l a5,d1				
	and.l d1,d0				
	move.l d0,a5				
	move.l 36(sp),d2			
	move.l a1,d1				
	and.l d2,d1				
_?L1353:					
	move.l a5,(a3)				
	move.l d1,4(a3)				
						
	move.b d6,126(a4)			
						
	cmp.b #16,d6				
	jbeq _?L1337				
	move.b d6,d0				
	addq.b #1,d0				
	cmp.b #7,d7				
	jbhi _?L1426				
						
	move.l 16(a3),a1			
						
	clr.l d2				
	move.b d3,d2				
	moveq #64,d0				
	sub.l d2,d0				
						
	moveq #32,d1				
	sub.l d2,d1				
	jbmi _?L1356				
	moveq #-1,d2				
	lsr.l d1,d2				
	sub.l a2,a2				
_?L1361:					
						
	move.l 12(a3),d0			
						
	cmp.l a1,d0				
	jbcc _?L1352				
						
	move.l 20(a3),a0			
						
	move.l d0,d7				
	addq.l #1,d7				
	move.l d7,12(a3)			
						
	move.b (a0,d0.l),d7			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
						
	addq.l #1,24(a3)			
						
	move.b d3,8(a3)				
						
	jbeq _?L1359				
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	or.b d7,d1				
						
	move.l a2,d7				
	and.l d0,d7				
	move.l d7,(a3)				
	and.l d2,d1				
	move.l d1,4(a3)				
						
	addq.b #1,d6				
	move.b d6,126(a4)			
						
	cmp.b #16,d6				
	jbne _?L1361				
						
	tst.b 8(a3)				
	jbeq _?L1419				
	jbra _?L1418				
_?L1315:					
						
	pea 8.w					
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbne _?L1319				
						
	moveq #1,d3				
	move.l d3,96(a4)			
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
	jbra _?L1516				
_?L1310:					
						
	add.l d0,d0				
	moveq #31,d3				
	sub.l d2,d3				
	move.l d0,d1				
	lsl.l d3,d1				
	move.l 4(a3),d0				
	lsr.l d2,d0				
	or.l d1,d0				
	jbra _?L1311				
_?L1512:					
						
	moveq #2,d2				
	move.l d2,(a4)				
						
	move.l 96(a4),d0			
						
	moveq #2,d7				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d7				
	jbne _?L1523				
	jbra _?L1313				
_?L1407:					
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,a5				
	move.l a5,198(a4)			
						
	cmp.l a5,a6				
	jbhi _?L1410				
						
	tst.b 8(a3)				
	jbeq _?L1419				
	jbra _?L1418				
_?L1325:					
						
	move.l 104(a4),a6			
						
	move.l 118(a4),d3			
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	cmp.l d3,a6				
	jbcc _?L1337				
						
	moveq #-1,d6				
	moveq #-2,d7				
_?L1338:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	move.b 8(a3),d0				
	cmp.b #7,d0				
	jbls _?L1413				
						
	subq.b #8,d0				
	move.b d0,8(a3)				
						
	jbeq _?L1414				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L1415				
	move.l d6,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	addq.l #1,a6				
	move.l a6,104(a4)			
						
	cmp.l a6,d3				
	jbne _?L1338				
_?L1418:					
						
	pea 1520.w				
	pea _?LC0				
	pea _?LC7				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
_?L1414:					
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,a6				
	move.l a6,104(a4)			
						
	cmp.l d3,a6				
	jbne _?L1338				
						
	clr.b 9(a3)				
						
	clr.w 10(a3)				
						
	clr.l 100(a4)				
						
	clr.l 104(a4)				
						
	moveq #3,d1				
	move.l d1,(a4)				
	jbra _?L1524				
_?L1415:					
						
	moveq #31,d0				
	sub.l d2,d0				
	move.l d7,d1				
	lsl.l d0,d1				
	move.l d6,d0				
	lsr.l d2,d0				
	or.l d1,d0				
	move.l d6,d1				
	lsr.l d2,d1				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	addq.l #1,a6				
	move.l a6,104(a4)			
						
	cmp.l a6,d3				
	jbne _?L1338				
	jbra _?L1418				
_?L1520:					
						
	moveq #10,d3				
	cmp.l d0,d3				
	jbne _?L1303				
_?L1367:					
						
	move.l 162(a4),d6			
						
	move.l 158(a4),a5			
						
	move.b 8(a3),d7				
						
	cmp.l d6,a5				
	jbeq _?L1337				
						
	jbls _?L1337				
_?L1373:					
						
	cmp.b #7,d7				
	jbhi _?L1525				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L1352				
						
	move.l 20(a3),a0			
						
	move.l d2,d3				
	addq.l #1,d3				
	move.l d3,12(a3)			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,a6				
	move.l d1,d3				
	or.b (a0,d2.l),d3			
	move.l d3,d2				
						
	addq.l #1,24(a3)			
	move.b d7,d3				
_?L1374:					
						
	move.b d3,8(a3)				
						
	jbeq _?L1427				
						
	clr.l d0				
	move.b d3,d0				
						
	moveq #64,d1				
	sub.l d0,d1				
	move.l d1,-(sp)				
	pea -1.w				
	pea -1.w				
	move.l d2,48(sp)			
	jbsr ___lshrdi3				
	lea (12,sp),sp				
	move.l d0,a0				
	move.l d1,a1				
						
	move.l a0,d0				
	move.l a6,d1				
	and.l d1,d0				
	move.l d0,a6				
	move.l 36(sp),d2			
	move.l a1,d1				
	and.l d2,d1				
_?L1377:					
	move.l a6,(a3)				
	move.l d1,4(a3)				
						
	addq.l #1,d6				
	move.l d6,162(a4)			
						
	cmp.l a5,d6				
	jbeq _?L1337				
	cmp.b #7,d7				
	jbhi _?L1428				
						
	move.l 16(a3),a1			
						
	clr.l d2				
	move.b d3,d2				
	moveq #64,d0				
	sub.l d2,d0				
						
	moveq #32,d1				
	sub.l d2,d1				
	jbmi _?L1380				
	moveq #-1,d2				
	lsr.l d1,d2				
	sub.l a2,a2				
_?L1386:					
						
	move.l 12(a3),d0			
						
	cmp.l d0,a1				
	jbls _?L1352				
						
	move.l 20(a3),a0			
						
	move.l d0,d7				
	addq.l #1,d7				
	move.l d7,12(a3)			
						
	move.b (a0,d0.l),d7			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
						
	addq.l #1,24(a3)			
						
	move.b d3,8(a3)				
						
	jbeq _?L1383				
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	or.b d7,d1				
						
	move.l a2,d7				
	and.l d0,d7				
	move.l d7,(a3)				
	and.l d2,d1				
	move.l d1,4(a3)				
						
	addq.l #1,d6				
	move.l d6,162(a4)			
						
	cmp.l a5,d6				
	jbcs _?L1386				
						
	tst.b 8(a3)				
	jbeq _?L1419				
	jbra _?L1418				
_?L1383:					
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,d6				
	move.l d6,162(a4)			
						
	cmp.l d6,a5				
	jbhi _?L1386				
						
	tst.b 8(a3)				
	jbeq _?L1419				
	jbra _?L1418				
_?L1521:					
						
	subq.l #8,d0				
	jbeq _?L1340				
						
	moveq #-1,d0				
	jbra _?L1526				
_?L1359:					
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.b #1,d6				
	move.b d6,126(a4)			
						
	cmp.b #16,d6				
	jbne _?L1361				
						
	tst.b 8(a3)				
	jbeq _?L1419				
	jbra _?L1418				
_?L1307:					
						
	moveq #-1,d1				
	moveq #31,d0				
	sub.l d2,d0				
	moveq #-2,d3				
	lsl.l d0,d3				
	move.l d1,d0				
	lsr.l d2,d0				
	or.l d3,d0				
	lsr.l d2,d1				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	clr.l 92(a4)				
	jbra _?L1289				
_?L1319:					
						
	moveq #-15,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L1519:					
						
	move.b d6,d3				
	subq.b #8,d3				
						
	move.l (a3),a1				
	move.l 4(a3),d7				
	jbra _?L1399				
_?L1525:					
						
	move.b d7,d3				
	subq.b #8,d3				
						
	move.l (a3),a6				
	move.l 4(a3),d2				
	jbra _?L1374				
_?L1522:					
						
	move.b d7,d3				
	subq.b #8,d3				
						
	move.l (a3),a5				
	move.l 4(a3),d2				
	jbra _?L1350				
_?L1372:					
						
	pea 32.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #9,d3				
	move.l d3,154(a4)			
_?L1368:					
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,158(a4)			
						
	clr.l 162(a4)				
						
	moveq #10,d7				
	move.l d7,154(a4)			
	jbra _?L1367				
_?L1356:					
						
	moveq #-1,d7				
	moveq #31,d2				
	sub.l d0,d2				
	moveq #-2,d1				
	lsl.l d2,d1				
	move.l d7,d2				
	lsr.l d0,d2				
	or.l d1,d2				
	lsr.l d0,d7				
	move.l d7,a2				
	jbra _?L1361				
_?L1380:					
	moveq #-1,d7				
	moveq #31,d2				
	sub.l d0,d2				
	moveq #-2,d1				
	lsl.l d2,d1				
	move.l d7,d2				
	lsr.l d0,d2				
	or.l d1,d2				
	lsr.l d0,d7				
	move.l d7,a2				
	jbra _?L1386				
_?L1404:					
	moveq #-1,d6				
	moveq #31,d2				
	sub.l d0,d2				
	moveq #-2,d1				
	lsl.l d2,d1				
	move.l d6,d2				
	lsr.l d0,d2				
	or.l d1,d2				
	lsr.l d0,d6				
	jbra _?L1410				
_?L1429:					
	clr.l d1				
	jbra _?L1401				
_?L1425:					
	sub.l a5,a5				
	clr.l d1				
	jbra _?L1353				
_?L1427:					
	sub.l a6,a6				
	clr.l d1				
	jbra _?L1377				
_?L1397:					
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1352				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,190(a4)			
						
	move.l 198(a4),a5			
						
	move.l 194(a4),a6			
						
	move.b 8(a3),d6				
						
	cmp.l a5,a6				
	jbhi _?L1403				
	jbra _?L1337				
_?L1423:					
						
	moveq #-18,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L1346:					
						
	moveq #2,d2				
	cmp.l d0,d2				
	jbne _?L1279				
						
	tst.b 8(a3)				
	jbeq _?L1419				
	jbra _?L1418				
_?L1413:					
	jbsr (_miniflac_bitreader_discard?part?0)
_?L1514:					
						
	pea 2832.w				
						
	pea _?LC0				
	pea _?LC7				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
_?L1426:					
						
	move.b d0,d6				
	move.b d3,d7				
	jbra _?L1355				
_?L1428:					
						
	move.b d3,d7				
	jbra _?L1373				
_?L1321:					
	jbsr (_miniflac_bitreader_peek?part?0)	
_?L1430:					
						
	move.b d3,d6				
	jbra _?L1403				
						
	.align	2				
						
_miniflac_streaminfo_min_block_size_native:	
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a3			
						
	move.l 20(sp),28(a3)			
	move.l 24(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L1528:					
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1542				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1528				
_?L1529:					
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1542:					
						
	lea _miniflac_sync_internal,a4		
_?L1531:					
						
	tst.l 114(a3)				
	jbeq _?L1543				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1529				
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1531				
_?L1533:					
						
	moveq #-1,d0				
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1543:					
						
	tst.l 122(a3)				
	jbne _?L1533				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1544				
						
	clr.l d0				
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1544:					
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 32(sp)				
	jbeq _?L1534				
						
	move.l 32(sp),a0			
	move.w d1,(a0)				
_?L1534:					
						
	moveq #1,d0				
	move.l d0,122(a3)			
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.align	2				
						
_miniflac_vorbis_comment_vendor_length_native:	
	movem.l d3/d4/d5/d6/a3/a4/a5,-(sp)	
	move.l 32(sp),a3			
						
	move.l 36(sp),28(a3)			
	move.l 40(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L1546:					
						
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L1560				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1546				
_?L1547:					
						
	move.l 44(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5	
	rts					
_?L1560:					
						
	lea _miniflac_sync_internal,a4		
_?L1549:					
						
	moveq #4,d0				
	cmp.l 114(a3),d0			
	jbeq _?L1561				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1547				
						
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L1549				
_?L1551:					
						
	moveq #-1,d0				
	move.l 44(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5	
	rts					
_?L1561:					
						
	tst.l 134(a3)				
	jbne _?L1551				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1562				
						
	clr.l d0				
						
	move.l 44(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5	
	rts					
_?L1562:					
						
	pea 8.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_read,a5		
	jbsr (a5)				
	addq.l #8,sp				
	move.l d1,d4				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d1,d6				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d1,d5				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	clr.l d0				
	move.b d6,d0				
						
	lsl.l #8,d0				
						
	and.l #255,d5				
						
	swap d5					
	clr.w d5				
						
	or.l d5,d0				
	or.b d4,d0				
						
	moveq #24,d2				
	lsl.l d2,d1				
						
	or.l d1,d0				
						
	move.l d0,138(a3)			
						
	tst.l 48(sp)				
	jbeq _?L1552				
						
	move.l 48(sp),a0			
	move.l d0,(a0)				
_?L1552:					
						
	moveq #1,d0				
	move.l d0,134(a3)			
						
	move.l 44(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5	
	rts					
						
	.align	2				
						
_miniflac_picture_type_native:			
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a3			
						
	move.l 20(sp),28(a3)			
	move.l 24(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L1564:					
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1578				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1564				
_?L1565:					
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1578:					
						
	lea _miniflac_sync_internal,a4		
_?L1567:					
						
	moveq #6,d1				
	cmp.l 114(a3),d1			
	jbeq _?L1579				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1565				
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1567				
_?L1569:					
						
	moveq #-1,d0				
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1579:					
						
	tst.l 154(a3)				
	jbne _?L1569				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1580				
						
	clr.l d0				
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1580:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 32(sp)				
	jbeq _?L1570				
						
	move.l 32(sp),a0			
	move.l d1,(a0)				
_?L1570:					
						
	moveq #1,d0				
	move.l d0,154(a3)			
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.align	2				
						
_miniflac_cuesheet_catalog_string_native:	
	movem.l d3/d4/d5/d6/d7/a3/a4,-(sp)	
	move.l 32(sp),a3			
						
	move.l 36(sp),28(a3)			
	move.l 40(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L1582:					
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1627				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1582				
_?L1623:					
						
	move.l 20(a3),d2			
_?L1583:					
						
	move.l 44(sp),a0			
	move.l d2,(a0)				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L1627:					
						
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L1585:					
						
	moveq #5,d1				
	cmp.l 114(a3),d1			
	jbeq _?L1628				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1623				
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1585				
_?L1624:					
						
	move.l 20(a3),d2			
	moveq #-1,d0				
	move.l 44(sp),a0			
	move.l d2,(a0)				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L1628:					
						
	tst.l 166(a3)				
	jbne _?L1624				
						
	move.l 170(a3),a1			
						
	cmp.w #128,a1				
	jbcc _?L1589				
	tst.l 48(sp)				
	jbeq _?L1621				
						
	moveq #-1,d4				
	moveq #-2,d5				
_?L1590:					
						
	move.b 16(a3),d3			
						
	cmp.b #7,d3				
	jbhi _?L1629				
						
	move.l 20(a3),d2			
						
	cmp.l 24(a3),d2				
	jbcc _?L1593				
						
	move.l 28(a3),a0			
						
	move.l d2,d1				
	addq.l #1,d1				
	move.l d1,20(a3)			
						
	move.l 8(a3),d0				
	move.l 12(a3),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	or.b (a0,d2.l),d1			
						
	addq.l #1,32(a3)			
_?L1600:					
						
	move.b d3,16(a3)			
						
	clr.l d6				
	move.b d3,d6				
						
	jbeq _?L1613				
						
	moveq #64,d7				
	sub.l d6,d7				
						
	moveq #32,d3				
	sub.l d6,d3				
	jbmi _?L1603				
	move.l d4,d2				
	lsr.l d3,d2				
	clr.l d3				
						
	and.l d0,d3				
	and.l d1,d2				
_?L1602:					
	move.l d3,8(a3)				
	move.l d2,12(a3)			
						
	cmp.l 52(sp),a1				
	jbcc _?L1605				
						
	move.w #-32,a0				
	add.l d6,a0				
	tst.l a0				
	jblt _?L1606				
	move.l a0,d1				
	lsr.l d1,d0				
						
	move.l 48(sp),a0			
	move.b d0,(a0,a1.l)			
						
	move.l 170(a3),a1			
	addq.l #1,a1				
	move.l a1,170(a3)			
						
	cmp.w #128,a1				
	jbcs _?L1590				
_?L1589:					
						
	tst.l 56(sp)				
	jbeq _?L1611				
						
	move.l 52(sp),d0			
	cmp.l d0,a1				
	jbcc _?L1612				
	move.l a1,d0				
_?L1612:					
						
	move.l 56(sp),a0			
	move.l d0,(a0)				
_?L1611:					
						
	clr.l 170(a3)				
						
	moveq #1,d0				
	move.l d0,166(a3)			
						
	move.l 20(a3),d2			
	jbra _?L1583				
_?L1593:					
						
	clr.l d0				
						
	move.l 44(sp),a0			
	move.l d2,(a0)				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L1605:					
						
	move.l 170(a3),a1			
	addq.l #1,a1				
	move.l a1,170(a3)			
						
	cmp.w #128,a1				
	jbcs _?L1590				
	jbra _?L1589				
_?L1613:					
	clr.l d3				
	clr.l d2				
	jbra _?L1602				
_?L1603:					
						
	moveq #31,d2				
	sub.l d7,d2				
	move.l d5,d3				
	lsl.l d2,d3				
	move.l d4,d2				
	lsr.l d7,d2				
	or.l d3,d2				
	move.l d4,d3				
	lsr.l d7,d3				
						
	and.l d0,d3				
	and.l d1,d2				
	jbra _?L1602				
_?L1606:					
						
	add.l d0,d0				
	moveq #31,d3				
	sub.l d6,d3				
	move.l d0,d2				
	lsl.l d3,d2				
	move.l d1,d0				
	lsr.l d6,d0				
	or.l d2,d0				
						
	move.l 48(sp),a0			
	move.b d0,(a0,a1.l)			
						
	move.l 170(a3),a1			
	addq.l #1,a1				
	move.l a1,170(a3)			
						
	cmp.w #128,a1				
	jbcs _?L1590				
	jbra _?L1589				
_?L1629:					
						
	move.l 8(a3),d0				
	move.l 12(a3),d1			
						
	subq.b #8,d3				
	jbra _?L1600				
_?L1621:					
						
	moveq #-1,d5				
	moveq #-2,d6				
_?L1599:					
						
	move.b 16(a3),d4			
						
	cmp.b #7,d4				
	jbhi _?L1630				
						
	move.l 20(a3),d2			
						
	cmp.l 24(a3),d2				
	jbcc _?L1593				
						
	move.l 28(a3),a0			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a3)			
						
	move.l 8(a3),d0				
	move.l 12(a3),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d3				
	move.l d1,d0				
	or.b (a0,d2.l),d0			
						
	addq.l #1,32(a3)			
_?L1592:					
						
	move.b d4,16(a3)			
						
	jbeq _?L1594				
						
	and.l #255,d4				
						
	moveq #64,d7				
	sub.l d4,d7				
						
	moveq #32,d2				
	sub.l d4,d2				
	jbmi _?L1595				
	move.l d5,d1				
	lsr.l d2,d1				
	clr.l d2				
						
	and.l d3,d2				
	move.l d2,8(a3)				
	and.l d0,d1				
	move.l d1,12(a3)			
						
	move.l 170(a3),a1			
	addq.l #1,a1				
	move.l a1,170(a3)			
						
	cmp.w #128,a1				
	jbcs _?L1599				
	jbra _?L1589				
_?L1594:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 170(a3),a1			
	addq.l #1,a1				
	move.l a1,170(a3)			
						
	cmp.w #128,a1				
	jbcs _?L1599				
	jbra _?L1589				
_?L1595:					
						
	moveq #31,d1				
	sub.l d7,d1				
	move.l d6,d2				
	lsl.l d1,d2				
	move.l d5,d1				
	lsr.l d7,d1				
	or.l d2,d1				
	move.l d5,d2				
	lsr.l d7,d2				
						
	and.l d3,d2				
	move.l d2,8(a3)				
	and.l d0,d1				
	move.l d1,12(a3)			
						
	move.l 170(a3),a1			
	addq.l #1,a1				
	move.l a1,170(a3)			
						
	cmp.w #128,a1				
	jbcs _?L1599				
	jbra _?L1589				
_?L1630:					
						
	move.l 8(a3),d3				
	move.l 12(a3),d0			
						
	subq.b #8,d4				
	jbra _?L1592				
						
	.align	2				
						
_miniflac_cuesheet_track_isrc_length_native:	
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a3			
						
	move.l 20(sp),28(a3)			
	move.l 24(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L1632:					
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1650				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1632				
_?L1633:					
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1650:					
						
	lea _miniflac_sync_internal,a4		
_?L1635:					
						
	moveq #5,d1				
	cmp.l 114(a3),d1			
	jbeq _?L1651				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1633				
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1635				
						
	moveq #-1,d0				
_?L1653:					
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1651:					
						
	move.l 166(a3),d0			
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcs _?L1652				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a3)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1633				
_?L1638:					
						
	tst.l 32(sp)				
	jbeq _?L1640				
						
	moveq #12,d0				
	move.l 32(sp),a0			
	move.l d0,(a0)				
_?L1640:					
						
	moveq #1,d0				
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1652:					
						
	subq.l #7,d0				
	jbeq _?L1638				
						
	moveq #-1,d0				
	jbra _?L1653				
						
	.align	2				
						
_miniflac_seektable_sample_number_native:	
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a3			
						
	move.l 20(sp),28(a3)			
	move.l 24(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L1655:					
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1670				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1655				
_?L1656:					
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1670:					
						
	lea _miniflac_sync_internal,a4		
_?L1658:					
						
	moveq #3,d1				
	cmp.l 114(a3),d1			
	jbeq _?L1671				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1656				
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1658				
_?L1660:					
						
	moveq #-1,d0				
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1671:					
						
	tst.l 178(a3)				
	jbne _?L1660				
						
	move.l 186(a3),a0			
	cmp.l 182(a3),a0			
	jbeq _?L1662				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1663				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 32(sp)				
	jbeq _?L1661				
						
	move.l 32(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L1661:					
						
	moveq #1,d0				
	move.l d0,178(a3)			
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1663:					
						
	clr.l d0				
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1662:					
						
	moveq #2,d0				
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.align	2				
						
_miniflac_application_length_native:		
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a3			
						
	move.l 20(sp),28(a3)			
	move.l 24(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L1673:					
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1692				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1673				
_?L1674:					
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1692:					
						
	lea _miniflac_sync_internal,a4		
_?L1676:					
						
	moveq #2,d1				
	cmp.l 114(a3),d1			
	jbeq _?L1693				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1674				
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1676				
_?L1680:					
						
	moveq #-1,d0				
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1693:					
						
	move.l 190(a3),d0			
						
	jbeq _?L1678				
						
	subq.l #1,d0				
	jbne _?L1680				
_?L1679:					
						
	tst.l 32(sp)				
	jbeq _?L1681				
						
	move.l 32(sp),a0			
	move.l 194(a3),(a0)			
_?L1681:					
						
	moveq #1,d0				
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1678:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1682				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,190(a3)			
	jbra _?L1679				
_?L1682:					
						
	clr.l d0				
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.align	2				
						
_miniflac_padding_data_native:			
	movem.l d3/d4/d5/d6/d7/a3/a4,-(sp)	
	move.l 32(sp),a3			
						
	move.l 36(sp),28(a3)			
	move.l 40(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L1695:					
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1737				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1695				
_?L1733:					
						
	move.l 20(a3),d2			
_?L1696:					
	move.l 44(sp),a0			
	move.l d2,(a0)				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L1737:					
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L1698:					
						
	moveq #1,d1				
	cmp.l 114(a3),d1			
	jbeq _?L1738				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1733				
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1698				
						
	move.l 20(a3),d2			
	moveq #-1,d0				
	move.l 44(sp),a0			
	move.l d2,(a0)				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L1738:					
						
	move.l 206(a3),d3			
						
	move.l 202(a3),a1			
						
	cmp.l a1,d3				
	jbcc _?L1701				
	tst.l 48(sp)				
	jbeq _?L1731				
						
	moveq #-1,d4				
	move.w #-2,a2				
_?L1702:					
						
	move.b 16(a3),d6			
						
	cmp.b #7,d6				
	jbhi _?L1739				
						
	move.l 20(a3),d2			
						
	cmp.l 24(a3),d2				
	jbcc _?L1705				
						
	move.l 28(a3),a0			
						
	move.l d2,d1				
	addq.l #1,d1				
	move.l d1,20(a3)			
						
	move.l 8(a3),d0				
	move.l 12(a3),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	or.b (a0,d2.l),d1			
						
	addq.l #1,32(a3)			
_?L1712:					
						
	move.b d6,16(a3)			
						
	clr.l d7				
	move.b d6,d7				
						
	jbeq _?L1726				
						
	moveq #64,d5				
	sub.l d7,d5				
						
	moveq #32,d6				
	sub.l d7,d6				
	jbmi _?L1715				
	move.l d4,d2				
	lsr.l d6,d2				
	clr.l d6				
						
	and.l d0,d6				
	and.l d1,d2				
_?L1714:					
	move.l d6,8(a3)				
	move.l d2,12(a3)			
						
	cmp.l 52(sp),d3				
	jbcc _?L1717				
						
	move.w #-32,a0				
	add.l d7,a0				
	tst.l a0				
	jblt _?L1718				
	move.l a0,d1				
	lsr.l d1,d0				
						
	move.l 48(sp),a0			
	move.b d0,(a0,d3.l)			
						
	move.l 206(a3),d3			
	addq.l #1,d3				
	move.l d3,206(a3)			
						
	move.l 202(a3),a1			
						
	cmp.l d3,a1				
	jbhi _?L1702				
_?L1701:					
						
	tst.l 56(sp)				
	jbeq _?L1734				
						
	move.l 52(sp),d0			
	cmp.l d0,a1				
	jbcs _?L1740				
						
	move.l 56(sp),a0			
	move.l d0,(a0)				
_?L1734:					
						
	move.l 20(a3),d2			
						
	moveq #1,d0				
						
	move.l 44(sp),a0			
	move.l d2,(a0)				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L1705:					
						
	clr.l d0				
						
	move.l 44(sp),a0			
	move.l d2,(a0)				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L1717:					
						
	move.l 206(a3),d3			
	addq.l #1,d3				
	move.l d3,206(a3)			
						
	cmp.l d3,a1				
	jbhi _?L1702				
	jbra _?L1701				
_?L1726:					
	clr.l d6				
	clr.l d2				
	jbra _?L1714				
_?L1715:					
						
	moveq #31,d2				
	sub.l d5,d2				
	move.l a2,d6				
	lsl.l d2,d6				
	move.l d4,d2				
	lsr.l d5,d2				
	or.l d6,d2				
	move.l d4,d6				
	lsr.l d5,d6				
						
	and.l d0,d6				
	and.l d1,d2				
	jbra _?L1714				
_?L1718:					
						
	add.l d0,d0				
	moveq #31,d6				
	sub.l d7,d6				
	move.l d0,d2				
	lsl.l d6,d2				
	move.l d1,d0				
	lsr.l d7,d0				
	or.l d2,d0				
						
	move.l 48(sp),a0			
	move.b d0,(a0,d3.l)			
						
	move.l 206(a3),d3			
	addq.l #1,d3				
	move.l d3,206(a3)			
						
	move.l 202(a3),a1			
						
	cmp.l d3,a1				
	jbhi _?L1702				
	jbra _?L1701				
_?L1739:					
						
	move.l 8(a3),d0				
	move.l 12(a3),d1			
						
	subq.b #8,d6				
	jbra _?L1712				
_?L1731:					
						
	moveq #-1,d5				
	moveq #-2,d6				
_?L1711:					
						
	move.b 16(a3),d4			
						
	cmp.b #7,d4				
	jbhi _?L1741				
						
	move.l 20(a3),d2			
						
	cmp.l 24(a3),d2				
	jbcc _?L1705				
						
	move.l 28(a3),a0			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a3)			
						
	move.l 8(a3),d0				
	move.l 12(a3),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d3				
	move.l d1,d0				
	or.b (a0,d2.l),d0			
						
	addq.l #1,32(a3)			
_?L1704:					
						
	move.b d4,16(a3)			
						
	jbeq _?L1706				
						
	and.l #255,d4				
						
	moveq #64,d7				
	sub.l d4,d7				
						
	moveq #32,d2				
	sub.l d4,d2				
	jbmi _?L1707				
	move.l d5,d1				
	lsr.l d2,d1				
	clr.l d2				
						
	and.l d3,d2				
	move.l d2,8(a3)				
	and.l d0,d1				
	move.l d1,12(a3)			
						
	move.l 206(a3),d0			
	addq.l #1,d0				
	move.l d0,206(a3)			
						
	cmp.l a1,d0				
	jbcs _?L1711				
	jbra _?L1701				
_?L1706:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 206(a3),d0			
	addq.l #1,d0				
	move.l d0,206(a3)			
						
	cmp.l a1,d0				
	jbcs _?L1711				
	jbra _?L1701				
_?L1707:					
						
	moveq #31,d1				
	sub.l d7,d1				
	move.l d6,d2				
	lsl.l d1,d2				
	move.l d5,d1				
	lsr.l d7,d1				
	or.l d2,d1				
	move.l d5,d2				
	lsr.l d7,d2				
						
	and.l d3,d2				
	move.l d2,8(a3)				
	and.l d0,d1				
	move.l d1,12(a3)			
						
	move.l 206(a3),d0			
	addq.l #1,d0				
	move.l d0,206(a3)			
						
	cmp.l a1,d0				
	jbcs _?L1711				
	jbra _?L1701				
_?L1740:					
						
	move.l a1,d0				
						
	move.l 56(sp),a0			
	move.l d0,(a0)				
	jbra _?L1734				
_?L1741:					
						
	move.l 8(a3),d3				
	move.l 12(a3),d0			
						
	subq.b #8,d4				
	jbra _?L1704				
						
	.align	2				
	.globl	_miniflac_version_major		
						
_miniflac_version_major:			
						
	moveq #1,d0				
	rts					
						
	.align	2				
	.globl	_miniflac_version_minor		
						
_miniflac_version_minor:			
	moveq #1,d0				
	rts					
						
	.align	2				
	.globl	_miniflac_version_patch		
						
_miniflac_version_patch:			
	moveq #1,d0				
	rts					
						
	.data					
_?LC8:						
	.dc.b $31,$2e,$31,$2e,$31
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_version_string	
						
_miniflac_version_string:			
						
	move.l #_?LC8,d0			
	rts					
						
	.align	2				
	.globl	_miniflac_size			
						
_miniflac_size:					
						
	move.l #470,d0				
	rts					
						
	.align	2				
	.globl	_miniflac_init			
						
_miniflac_init:					
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	clr.w 16(a3)				
						
	clr.w 18(a3)				
						
	clr.l 20(a3)				
						
	clr.l 24(a3)				
						
	clr.l 28(a3)				
						
	clr.l 32(a3)				
						
	clr.l 36(a3)				
						
	clr.w 68(a3)				
						
	clr.l 70(a3)				
	clr.l 74(a3)				
						
	clr.l 78(a3)				
						
	clr.l 82(a3)				
						
	clr.w 86(a3)				
						
	clr.w 88(a3)				
						
	clr.w 90(a3)				
						
	clr.l 40(a3)				
	clr.l 44(a3)				
						
	clr.w 48(a3)				
						
	clr.w 50(a3)				
						
	clr.l 52(a3)				
						
	clr.l 56(a3)				
						
	clr.l 60(a3)				
						
	clr.l 64(a3)				
						
	clr.l 92(a3)				
						
	clr.l 96(a3)				
						
	clr.l 100(a3)				
						
	clr.l 104(a3)				
						
	clr.l 108(a3)				
						
	move.l #128,114(a3)			
						
	clr.w 112(a3)				
						
	clr.l 118(a3)				
						
	clr.l 122(a3)				
						
	clr.b 126(a3)				
						
	clr.l 128(a3)				
						
	clr.b 132(a3)				
						
	clr.l 134(a3)				
						
	clr.l 138(a3)				
						
	clr.l 142(a3)				
						
	clr.l 146(a3)				
						
	clr.l 150(a3)				
						
	clr.l 154(a3)				
						
	clr.l 158(a3)				
						
	clr.l 162(a3)				
						
	clr.l 166(a3)				
						
	clr.l 170(a3)				
						
	clr.w 174(a3)				
						
	clr.w 176(a3)				
						
	clr.l 178(a3)				
						
	clr.l 182(a3)				
						
	clr.l 186(a3)				
						
	clr.l 190(a3)				
						
	clr.l 194(a3)				
						
	clr.l 198(a3)				
						
	clr.w 216(a3)				
						
	clr.b 214(a3)				
						
	clr.l 210(a3)				
						
	clr.w 222(a3)				
						
	clr.w 224(a3)				
						
	clr.w 226(a3)				
						
	clr.l 228(a3)				
						
	clr.l 232(a3)				
						
	clr.w 236(a3)				
						
	clr.l 238(a3)				
	clr.l 242(a3)				
						
	clr.b 246(a3)				
						
	clr.l 248(a3)				
						
	clr.b 256(a3)				
						
	clr.l 252(a3)				
						
	clr.l 258(a3)				
						
	clr.l 262(a3)				
						
	clr.w 266(a3)				
						
	clr.b 268(a3)				
						
	clr.l 270(a3)				
						
	clr.l 278(a3)				
						
	clr.l 274(a3)				
						
	clr.l 286(a3)				
						
	clr.l 282(a3)				
						
	clr.l 294(a3)				
						
	clr.w 298(a3)				
						
	clr.b 300(a3)				
						
	pea 128.w				
	clr.l -(sp)				
	pea 302(a3)				
	jbsr _memset				
	lea (12,sp),sp				
						
	clr.l 290(a3)				
						
	clr.l 444(a3)				
						
	clr.l 448(a3)				
						
	clr.l 452(a3)				
						
	clr.l 456(a3)				
						
	clr.l 460(a3)				
						
	clr.l 430(a3)				
						
	clr.w 434(a3)				
						
	clr.w 436(a3)				
						
	clr.l 438(a3)				
						
	clr.b 442(a3)				
						
	move.l 12(sp),4(a3)			
						
	moveq #-1,d0				
	move.l d0,464(a3)			
						
	clr.b 468(a3)				
						
	moveq #2,d0				
	move.l d0,(a3)				
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_miniflac_decode		
						
_miniflac_decode:				
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a6			
	move.l 56(sp),a4			
	move.l 60(sp),d4			
						
	move.l 4(a6),d0				
						
	jbne _?L1755				
						
	tst.l d4				
	jbeq _?L1768				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1772				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1772:					
						
	move.l 4(a6),d0				
_?L1755:					
						
	subq.l #1,d0				
	jbeq _?L1773				
						
	clr.l 40(sp)				
						
	clr.l 44(sp)				
						
	move.l a4,60(a6)			
						
	move.l d4,56(a6)			
						
	clr.l 52(a6)				
	moveq #44,d6				
	add.l sp,d6				
	moveq #40,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a5	
						
	move.l a6,d3				
	addq.l #8,d3				
						
	lea _miniflac_sync_internal,a3		
						
	move.l a6,d7				
	add.l #210,d7				
_?L1767:					
						
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1761				
						
	move.l 40(sp),28(a6)			
						
	move.l 44(sp),24(a6)			
						
	clr.l 20(a6)				
_?L1762:					
						
	moveq #5,d0				
	cmp.l (a6),d0				
	jbeq _?L1774				
						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1762				
_?L1763:					
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
						
	move.l 36(sp),d0			
						
	move.l 52(a6),d1			
						
	tst.l d0				
	jbne _?L1766				
	cmp.l d4,d1				
	jbcs _?L1767				
_?L1766:					
						
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L1776:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1773:					
						
	move.l a4,28(a6)			
						
	move.l d4,24(a6)			
						
	clr.l 20(a6)				
						
	move.l a6,d3				
	addq.l #8,d3				
						
	lea _miniflac_sync_internal,a3		
_?L1758:					
						
	moveq #5,d0				
	cmp.l (a6),d0				
	jbeq _?L1775				
						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1758				
_?L1759:					
						
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
_?L1777:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1774:					
						
	move.l 68(sp),-(sp)			
	pea 122(a6)				
	move.l d3,-(sp)				
	move.l d7,-(sp)				
	jbsr _miniflac_frame_decode		
	lea (16,sp),sp				
	jbra _?L1763				
_?L1768:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1761:					
						
	move.l 52(a6),d1			
						
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L1776				
_?L1775:					
						
	move.l 68(sp),-(sp)			
	pea 122(a6)				
	move.l d3,-(sp)				
	pea 210(a6)				
	jbsr _miniflac_frame_decode		
	lea (16,sp),sp				
						
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1777				
						
	.align	2				
	.globl	_miniflac_sync			
						
_miniflac_sync:					
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a3			
	move.l 56(sp),d3			
						
	move.l 4(a3),d0				
						
	jbne _?L1779				
						
	tst.l d3				
	jbeq _?L1787				
	subq.l #4,sp				
	move.l 56(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbeq _?L1794				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1794:					
						
	move.l 4(a3),d0				
_?L1779:					
						
	subq.l #1,d0				
	jbeq _?L1795				
						
	clr.l 36(sp)				
						
	clr.l 40(sp)				
						
	move.l 52(sp),60(a3)			
						
	move.l d3,56(a3)			
						
	clr.l 52(a3)				
	moveq #40,d5				
	add.l sp,d5				
	moveq #36,d4				
	add.l sp,d4				
	lea _miniflac_oggfunction_start,a5	
						
	move.l a3,d7				
	addq.l #8,d7				
						
	lea _miniflac_sync_internal,a4		
						
	lea _miniflac_oggfunction_end,a6	
_?L1786:					
						
	move.l d5,-(sp)				
	move.l d4,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbne _?L1782				
						
	move.l 36(sp),28(a3)			
						
	move.l 40(sp),24(a3)			
						
	clr.l 20(a3)				
						
	move.l d7,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d6				
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	moveq #-18,d1				
	cmp.l d6,d1				
	jbeq _?L1796				
						
	tst.l d6				
	jbne _?L1782				
						
	move.l 52(a3),d1			
						
	cmp.l d3,d1				
	jbcs _?L1786				
_?L1798:					
	clr.l d6				
						
	move.l 60(sp),a0			
	move.l d1,(a0)				
_?L1797:					
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1795:					
						
	move.l 52(sp),28(a3)			
						
	move.l d3,24(a3)			
						
	clr.l 20(a3)				
						
	pea 8(a3)				
	move.l a3,-(sp)				
	jbsr _miniflac_sync_internal		
	addq.l #8,sp				
	move.l d0,d6				
						
	move.l 60(sp),a0			
	move.l 20(a3),(a0)			
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1782:					
						
	move.l 52(a3),d1			
						
	move.l 60(sp),a0			
	move.l d1,(a0)				
	jbra _?L1797				
_?L1796:					
						
	moveq #13,d0				
	move.l d0,36(a3)			
						
	move.l 52(a3),d1			
						
	cmp.l d3,d1				
	jbcs _?L1786				
	jbra _?L1798				
_?L1787:					
						
	clr.l d6				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_is_metadata		
						
_miniflac_is_metadata:				
						
	move.l 4(sp),a0				
	moveq #4,d1				
	cmp.l (a0),d1				
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_miniflac_is_frame		
						
_miniflac_is_frame:				
						
	move.l 4(sp),a0				
	moveq #5,d1				
	cmp.l (a0),d1				
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_miniflac_metadata_is_last	
						
_miniflac_metadata_is_last:			
						
	move.l 4(sp),a0				
	move.b 112(a0),d0			
	rts					
						
	.align	2				
	.globl	_miniflac_metadata_type		
						
_miniflac_metadata_type:			
						
	move.l 4(sp),a0				
	move.l 114(a0),d0			
	rts					
						
	.align	2				
	.globl	_miniflac_metadata_length	
						
_miniflac_metadata_length:			
						
	move.l 4(sp),a0				
	move.l 118(a0),d0			
	rts					
						
	.align	2				
	.globl	_miniflac_metadata_is_streaminfo
						
_miniflac_metadata_is_streaminfo:		
						
	move.l 4(sp),a0				
	tst.l 114(a0)				
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_miniflac_metadata_is_padding	
						
_miniflac_metadata_is_padding:			
						
	move.l 4(sp),a0				
	moveq #1,d1				
	cmp.l 114(a0),d1			
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_miniflac_metadata_is_application
						
_miniflac_metadata_is_application:		
						
	move.l 4(sp),a0				
	moveq #2,d1				
	cmp.l 114(a0),d1			
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_miniflac_metadata_is_seektable	
						
_miniflac_metadata_is_seektable:		
						
	move.l 4(sp),a0				
	moveq #3,d1				
	cmp.l 114(a0),d1			
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_miniflac_metadata_is_vorbis_comment
						
_miniflac_metadata_is_vorbis_comment:		
						
	move.l 4(sp),a0				
	moveq #4,d1				
	cmp.l 114(a0),d1			
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_miniflac_metadata_is_cuesheet	
						
_miniflac_metadata_is_cuesheet:			
						
	move.l 4(sp),a0				
	moveq #5,d1				
	cmp.l 114(a0),d1			
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_miniflac_metadata_is_picture	
						
_miniflac_metadata_is_picture:			
						
	move.l 4(sp),a0				
	moveq #6,d1				
	cmp.l 114(a0),d1			
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_miniflac_frame_blocking_strategy
						
_miniflac_frame_blocking_strategy:		
						
	move.l 4(sp),a0				
	move.b 225(a0),d0			
	rts					
						
	.align	2				
	.globl	_miniflac_frame_block_size	
						
_miniflac_frame_block_size:			
						
	move.l 4(sp),a0				
	move.w 226(a0),d0			
	rts					
						
	.align	2				
	.globl	_miniflac_frame_sample_rate	
						
_miniflac_frame_sample_rate:			
						
	move.l 4(sp),a0				
	move.l 228(a0),d0			
	rts					
						
	.align	2				
	.globl	_miniflac_frame_channels	
						
_miniflac_frame_channels:			
						
	move.l 4(sp),a0				
	move.b 236(a0),d0			
	rts					
						
	.align	2				
	.globl	_miniflac_frame_bps		
						
_miniflac_frame_bps:				
						
	move.l 4(sp),a0				
	move.b 237(a0),d0			
	rts					
						
	.align	2				
	.globl	_miniflac_frame_sample_number	
						
_miniflac_frame_sample_number:			
						
	move.l 4(sp),a0				
	move.l 238(a0),d0			
	move.l 242(a0),d1			
	rts					
						
	.align	2				
	.globl	_miniflac_frame_frame_number	
						
_miniflac_frame_frame_number:			
						
	move.l 4(sp),a0				
	move.l 238(a0),d0			
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_min_block_size
						
_miniflac_streaminfo_min_block_size:		
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
	move.l 60(sp),a4			
	move.l 64(sp),d3			
	move.l 68(sp),36(sp)			
	move.l 72(sp),d4			
						
	move.l 4(a3),d0				
	jbne _?L1838				
						
	tst.l d3				
	jbeq _?L1845				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbeq _?L1849				
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L1849:					
	move.l 4(a3),d0				
_?L1838:					
						
	subq.l #1,d0				
	jbeq _?L1850				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l a4,60(a3)			
	move.l d3,56(a3)			
	clr.l 52(a3)				
	moveq #44,d5				
	add.l sp,d5				
	moveq #40,d7				
	add.l sp,d7				
	lea _miniflac_oggfunction_start,a5	
	lea _miniflac_oggfunction_end,a6	
_?L1844:					
	move.l d5,-(sp)				
	move.l d7,-(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d6				
	moveq #1,d0				
	cmp.l d6,d0				
	jbne _?L1841				
	move.l d4,-(sp)				
	pea 52(sp)				
	move.l 52(sp),-(sp)			
	move.l 52(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_streaminfo_min_block_size_native
	lea (20,sp),sp				
	move.l d0,d6				
	move.l 48(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	tst.l d6				
	jbne _?L1843				
	cmp.l d3,d1				
	jbcs _?L1844				
_?L1843:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L1851:					
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L1850:					
						
	move.l d4,72(sp)			
	move.l 36(sp),68(sp)			
	move.l d3,64(sp)			
	move.l a4,60(sp)			
	move.l a3,56(sp)			
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	jbra _miniflac_streaminfo_min_block_size_native
_?L1845:					
						
	clr.l d6				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L1841:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L1851				
						
	.align	2				
	.globl	_miniflac_streaminfo_max_block_size
						
_miniflac_streaminfo_max_block_size:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L1853				
						
	tst.l 60(sp)				
	jbeq _?L1883				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L1903				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1903:					
	move.l 4(a4),d0				
_?L1853:					
						
	subq.l #1,d0				
	jbeq _?L1904				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L1882:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L1867				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L1868:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L1871				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1868				
_?L1869:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L1905				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L1882				
_?L1909:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L1907:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1871:					
	tst.l 114(a4)				
	jbeq _?L1906				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1869				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L1871				
_?L1872:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L1907				
_?L1904:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1856:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L1908				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L1856				
_?L1857:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L1911:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1906:					
						
	move.l 122(a4),d0			
						
	jbeq _?L1874				
	subq.l #1,d0				
	jbne _?L1872				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1879				
_?L1900:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L1882				
	jbra _?L1909				
_?L1879:					
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L1880				
						
	move.l 68(sp),a0			
	move.w d1,(a0)				
_?L1880:					
						
	moveq #2,d0				
	move.l d0,122(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L1907				
_?L1883:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1867:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L1907				
_?L1908:					
	lea _miniflac_sync_internal,a3		
_?L1859:					
	tst.l 114(a4)				
	jbeq _?L1910				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L1857				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L1859				
_?L1863:					
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L1911				
_?L1874:					
						
	pea 16.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L1900				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1900				
	jbra _?L1879				
_?L1910:					
						
	move.l 122(a4),d0			
						
	jbeq _?L1861				
	subq.l #1,d0				
	jbne _?L1863				
	lea _miniflac_bitreader_fill_nocrc,a1	
_?L1862:					
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1865				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L1866				
						
	move.l 68(sp),a0			
	move.w d1,(a0)				
_?L1866:					
						
	moveq #2,d0				
	move.l d0,122(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L1911				
_?L1865:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L1911				
_?L1861:					
						
	pea 16.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L1865				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
	jbra _?L1862				
_?L1905:					
						
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L1907				
						
	.align	2				
	.globl	_miniflac_streaminfo_min_frame_size
						
_miniflac_streaminfo_min_frame_size:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L1913				
						
	tst.l 60(sp)				
	jbeq _?L1946				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L1973				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1973:					
	move.l 4(a4),d0				
_?L1913:					
						
	subq.l #1,d0				
	jbeq _?L1974				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L1945:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L1928				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L1929:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L1932				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1929				
_?L1930:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L1975				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L1945				
_?L1980:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L1977:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1932:					
	tst.l 114(a4)				
	jbeq _?L1976				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1930				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L1932				
_?L1933:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L1977				
_?L1974:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1916:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L1978				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L1916				
_?L1917:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L1982:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1976:					
						
	move.l 122(a4),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L1979				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a1	
	jbeq _?L1938				
						
	pea 16.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L1939				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
_?L1938:					
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L1939				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,122(a4)			
	move.l 36(sp),a1			
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1942				
_?L1939:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L1945				
	jbra _?L1980				
_?L1979:					
						
	subq.l #2,d0				
	jbne _?L1933				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1939				
_?L1942:					
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L1943				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L1943:					
						
	moveq #3,d0				
	move.l d0,122(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L1977				
_?L1946:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1928:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L1977				
_?L1978:					
	lea _miniflac_sync_internal,a3		
_?L1919:					
	tst.l 114(a4)				
	jbeq _?L1981				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L1917				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L1919				
	moveq #-1,d4				
_?L1984:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L1982				
_?L1981:					
						
	move.l 122(a4),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L1983				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a1	
	jbeq _?L1924				
						
	pea 16.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L1926				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
_?L1924:					
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L1926				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,122(a4)			
	move.l 36(sp),a1			
_?L1922:					
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1926				
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L1927				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L1927:					
						
	moveq #3,d0				
	move.l d0,122(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L1982				
_?L1983:					
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	subq.l #2,d0				
	jbeq _?L1922				
						
	moveq #-1,d4				
	jbra _?L1984				
_?L1926:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L1982				
_?L1975:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L1977				
						
	.align	2				
	.globl	_miniflac_streaminfo_max_frame_size
						
_miniflac_streaminfo_max_frame_size:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L1986				
						
	tst.l 60(sp)				
	jbeq _?L2014				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2034				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2034:					
	move.l 4(a4),d0				
_?L1986:					
						
	subq.l #1,d0				
	jbeq _?L2035				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L2013:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L1994				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L1995:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L1998				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1995				
_?L1996:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2036				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2013				
_?L2042:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L2038:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1998:					
	tst.l 114(a4)				
	jbeq _?L2037				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1996				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L1998				
_?L1999:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2038				
_?L2035:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1989:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2039				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L1989				
_?L1990:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L2044:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2037:					
						
	move.l 122(a4),d0			
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbcs _?L2040				
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbne _?L2041				
_?L2004:					
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2006				
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #3,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2010				
_?L2006:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2013				
	jbra _?L2042				
_?L2040:					
						
	subq.l #3,d0				
	jbne _?L1999				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2006				
_?L2010:					
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L2011				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L2011:					
						
	moveq #4,d0				
	move.l d0,122(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2038				
_?L2014:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2041:					
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a1	
	jbeq _?L2005				
						
	pea 16.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2006				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
_?L2005:					
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2006				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,122(a4)			
	move.l 36(sp),a1			
	jbra _?L2004				
_?L1994:					
						
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2038				
_?L2039:					
	lea _miniflac_sync_internal,a3		
_?L1992:					
	tst.l 114(a4)				
	jbeq _?L2043				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L1990				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L1992				
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2044				
_?L2043:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2044				
_?L2036:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2038				
						
	.align	2				
	.globl	_miniflac_streaminfo_sample_rate
						
_miniflac_streaminfo_sample_rate:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L2046				
						
	tst.l 60(sp)				
	jbeq _?L2080				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2110				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2110:					
	move.l 4(a4),d0				
_?L2046:					
						
	subq.l #1,d0				
	jbeq _?L2111				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L2079:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2058				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L2059:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2062				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2059				
_?L2060:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2112				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2079				
_?L2118:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L2114:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2062:					
	tst.l 114(a4)				
	jbeq _?L2113				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2060				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2062				
_?L2063:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2114				
_?L2111:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2049:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2115				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2049				
_?L2050:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L2120:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2113:					
						
	move.l 122(a4),d0			
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbcs _?L2116				
						
	moveq #3,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbne _?L2117				
_?L2068:					
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2072				
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #4,d1				
	move.l d1,122(a4)			
	move.l 36(sp),a1			
						
	pea 20.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2076				
_?L2072:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2079				
	jbra _?L2118				
_?L2116:					
						
	subq.l #4,d0				
	jbne _?L2063				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 20.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2072				
_?L2076:					
						
	pea 20.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,128(a4)			
						
	tst.l 68(sp)				
	jbeq _?L2077				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L2077:					
						
	moveq #5,d0				
	move.l d0,122(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2114				
_?L2080:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2117:					
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbeq _?L2069				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a1	
	jbeq _?L2070				
						
	pea 16.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2072				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
_?L2070:					
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2072				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,122(a4)			
	move.l 36(sp),a1			
_?L2069:					
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2072				
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #3,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
	jbra _?L2068				
_?L2058:					
						
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2114				
_?L2115:					
	lea _miniflac_sync_internal,a3		
_?L2052:					
	tst.l 114(a4)				
	jbeq _?L2119				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2050				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2052				
	moveq #-1,d4				
_?L2122:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2120				
_?L2119:					
						
	move.l 122(a4),d0			
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbcs _?L2121				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2050				
_?L2055:					
						
	pea 20.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2081				
						
	pea 20.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,128(a4)			
						
	tst.l 68(sp)				
	jbeq _?L2057				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L2057:					
						
	moveq #5,d0				
	move.l d0,122(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2120				
_?L2121:					
						
	subq.l #4,d0				
	jbeq _?L2055				
						
	moveq #-1,d4				
	jbra _?L2122				
_?L2081:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2120				
_?L2112:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2114				
						
	.align	2				
	.globl	_miniflac_streaminfo_channels	
						
_miniflac_streaminfo_channels:			
	lea (-36,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 76(sp),a4			
	move.l 80(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L2124				
						
	tst.l 84(sp)				
	jbeq _?L2160				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2187				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (36,sp),sp				
	rts					
_?L2187:					
	move.l 4(a4),d0				
_?L2124:					
						
	subq.l #1,d0				
	jbeq _?L2188				
						
	clr.l 64(sp)				
	clr.l 68(sp)				
	move.l d5,60(a4)			
	move.l 84(sp),56(a4)			
	clr.l 52(a4)				
	moveq #68,d7				
	add.l sp,d7				
	moveq #64,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L2159:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2132				
	move.l 64(sp),28(a4)			
	move.l 68(sp),24(a4)			
	clr.l 20(a4)				
_?L2133:					
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L2136				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2133				
_?L2134:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,54(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 46(sp),d0			
	jbne _?L2189				
	move.l 52(a4),d1			
	cmp.l 84(sp),d1				
	jbcs _?L2159				
_?L2195:					
	clr.l d4				
	move.l 88(sp),a0			
	move.l d1,(a0)				
_?L2191:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (36,sp),sp				
	rts					
_?L2136:					
	tst.l 114(a4)				
	jbeq _?L2190				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2134				
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L2136				
_?L2137:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 88(sp),a0			
	move.l d1,(a0)				
	jbra _?L2191				
_?L2188:					
	move.l d5,28(a4)			
	move.l 84(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2127:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2192				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L2127				
_?L2128:					
	move.l 88(sp),a0			
	move.l 20(a4),(a0)			
_?L2197:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (36,sp),sp				
	rts					
_?L2190:					
						
	move.l 122(a4),d0			
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbcs _?L2193				
						
	moveq #4,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbne _?L2194				
_?L2142:					
						
	pea 20.w				
	move.l d3,-(sp)				
	move.l a1,54(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 46(sp),a1			
	tst.l d0				
	jbne _?L2153				
						
	pea 20.w				
	move.l d3,-(sp)				
	move.l a1,54(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,128(a4)			
						
	moveq #5,d1				
	move.l d1,122(a4)			
	move.l 46(sp),a1			
						
	pea 3.w					
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2156				
_?L2153:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 84(sp),d1				
	jbcs _?L2159				
	jbra _?L2195				
_?L2193:					
						
	subq.l #5,d0				
	jbne _?L2137				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 3.w					
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2153				
_?L2156:					
						
	pea 3.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 92(sp)				
	jbeq _?L2157				
						
	addq.b #1,d1				
	move.l 92(sp),a0			
	move.b d1,(a0)				
_?L2157:					
						
	moveq #6,d0				
	move.l d0,122(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 88(sp),a0			
	move.l d1,(a0)				
	jbra _?L2191				
_?L2160:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (36,sp),sp				
	rts					
_?L2194:					
						
	moveq #3,d2				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d2				
	jbeq _?L2143				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbeq _?L2144				
						
	subq.l #1,d0				
	jbeq _?L2145				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2153				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,122(a4)			
_?L2145:					
						
	move.b 16(a4),59(sp)			
						
	cmp.b #15,59(sp)			
	jbhi _?L2150				
						
	move.l 24(a4),a0			
						
	move.l 20(a4),d2			
						
	cmp.l d2,a0				
	jbls _?L2162				
						
	move.l 28(a4),a2			
						
	move.l d2,a1				
	addq.l #1,a1				
	move.l a1,20(a4)			
						
	move.l 8(a4),d0				
	move.l 12(a4),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,38(sp)			
	move.l d1,42(sp)			
						
	move.l d0,50(sp)			
	or.b (a2,d2.l),d1			
	move.l d1,54(sp)			
						
	move.l 50(sp),8(a4)			
	move.l 54(sp),12(a4)			
						
	move.b 59(sp),d0			
	addq.b #8,d0				
	move.b d0,16(a4)			
						
	move.l 32(a4),60(sp)			
						
	move.l 60(sp),d1			
	addq.l #1,d1				
	move.l d1,32(a4)			
						
	cmp.b #15,d0				
	jbhi _?L2150				
	cmp.l a0,a1				
	jbcc _?L2148				
						
	addq.l #2,d2				
	move.l d2,20(a4)			
						
	clr.l d2				
	move.b (a2,a1.l),d2			
	move.l d2,a0				
						
	move.l 50(sp),d0			
	move.l 54(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	clr.l d2				
	or.l d0,d2				
	move.l d2,8(a4)				
	move.l a0,d2				
	or.l d1,d2				
	move.l d2,12(a4)			
						
	move.b 59(sp),d0			
	add.b #16,d0				
	move.b d0,16(a4)			
						
	move.l 60(sp),d1			
	addq.l #2,d1				
	move.l d1,32(a4)			
_?L2150:					
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,122(a4)			
_?L2144:					
						
	pea 24.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,54(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 46(sp),a1			
	tst.l d0				
	jbne _?L2153				
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,54(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #3,d2				
	move.l d2,122(a4)			
	move.l 46(sp),a1			
_?L2143:					
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,54(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 46(sp),a1			
	tst.l d0				
	jbne _?L2153				
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,54(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #4,d0				
	move.l d0,122(a4)			
	move.l 46(sp),a1			
	jbra _?L2142				
_?L2132:					
						
	move.l 52(a4),d1			
	move.l 88(sp),a0			
	move.l d1,(a0)				
	jbra _?L2191				
_?L2192:					
	lea _miniflac_sync_internal,a3		
_?L2130:					
	tst.l 114(a4)				
	jbeq _?L2196				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2128				
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L2130				
	moveq #-1,d4				
	move.l 88(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2197				
_?L2196:					
	move.l 92(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_channels	
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 88(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2197				
_?L2162:					
						
	move.l d2,a1				
_?L2148:					
						
	move.l a1,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 84(sp),d1				
	jbcs _?L2159				
	jbra _?L2195				
_?L2189:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 88(sp),a0			
	move.l d1,(a0)				
	jbra _?L2191				
						
	.align	2				
	.globl	_miniflac_streaminfo_bps	
						
_miniflac_streaminfo_bps:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L2199				
						
	tst.l 60(sp)				
	jbeq _?L2232				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2259				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2259:					
	move.l 4(a4),d0				
_?L2199:					
						
	subq.l #1,d0				
	jbeq _?L2260				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L2231:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2211				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L2212:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2215				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2212				
_?L2213:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2261				
_?L2227:					
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2231				
_?L2267:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L2263:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2215:					
	tst.l 114(a4)				
	jbeq _?L2262				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2213				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2215				
_?L2216:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2263				
_?L2260:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2202:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2264				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2202				
_?L2203:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L2269:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2262:					
						
	move.l 122(a4),d0			
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2265				
						
	moveq #5,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbne _?L2266				
_?L2221:					
						
	pea 3.w					
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2223				
						
	pea 3.w					
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d1				
	move.l d1,122(a4)			
	move.l 36(sp),a1			
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2228				
_?L2223:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2231				
	jbra _?L2267				
_?L2265:					
						
	subq.l #6,d0				
	jbne _?L2216				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2223				
_?L2228:					
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
						
	move.b d1,132(a4)			
						
	tst.l 68(sp)				
	jbeq _?L2229				
						
	move.l 68(sp),a0			
	move.b d1,(a0)				
_?L2229:					
						
	moveq #7,d0				
	move.l d0,122(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2263				
_?L2232:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2266:					
						
	subq.l #4,d0				
	jbne _?L2222				
_?L2225:					
						
	pea 20.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2223				
						
	pea 20.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,128(a4)			
						
	moveq #5,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
	jbra _?L2221				
_?L2211:					
						
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2263				
_?L2264:					
	lea _miniflac_sync_internal,a3		
_?L2205:					
	tst.l 114(a4)				
	jbeq _?L2268				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2203				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2205				
	moveq #-1,d4				
_?L2271:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2269				
_?L2222:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2225				
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbeq _?L2227				
	jbra _?L2261				
_?L2268:					
						
	move.l 122(a4),d0			
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2270				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_channels	
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2203				
_?L2208:					
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2233				
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
						
	move.b d1,132(a4)			
						
	tst.l 68(sp)				
	jbeq _?L2210				
						
	move.l 68(sp),a0			
	move.b d1,(a0)				
_?L2210:					
						
	moveq #7,d0				
	move.l d0,122(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2269				
_?L2270:					
						
	subq.l #6,d0				
	jbeq _?L2208				
						
	moveq #-1,d4				
	jbra _?L2271				
_?L2233:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2269				
_?L2261:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2263				
						
	.align	2				
	.globl	_miniflac_streaminfo_total_samples
						
_miniflac_streaminfo_total_samples:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L2273				
						
	tst.l 60(sp)				
	jbeq _?L2304				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2325				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2325:					
	move.l 4(a4),d0				
_?L2273:					
						
	subq.l #1,d0				
	jbeq _?L2326				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L2303:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2281				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L2282:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2285				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2282				
_?L2283:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2327				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2303				
_?L2333:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L2329:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2285:					
	tst.l 114(a4)				
	jbeq _?L2328				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2283				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2285				
_?L2286:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2329				
_?L2326:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2276:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2330				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2276				
_?L2277:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L2335:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2328:					
						
	move.l 122(a4),d0			
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcs _?L2331				
						
	moveq #6,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbne _?L2332				
_?L2291:					
						
	pea 5.w					
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2294				
						
	pea 5.w					
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
	move.b d1,132(a4)			
						
	moveq #7,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
						
	pea 36.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2300				
_?L2294:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2303				
	jbra _?L2333				
_?L2331:					
						
	subq.l #7,d0				
	jbne _?L2286				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 36.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2294				
_?L2300:					
						
	pea 36.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L2301				
						
	move.l 68(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L2301:					
						
	moveq #8,d0				
	move.l d0,122(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2329				
_?L2304:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2332:					
						
	moveq #5,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbeq _?L2292				
						
	subq.l #4,d0				
	jbeq _?L2296				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2283				
_?L2296:					
						
	pea 20.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2294				
						
	pea 20.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,128(a4)			
						
	moveq #5,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
_?L2292:					
						
	pea 3.w					
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2294				
						
	pea 3.w					
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d1				
	move.l d1,122(a4)			
	move.l 36(sp),a1			
	jbra _?L2291				
_?L2281:					
						
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2329				
_?L2330:					
	lea _miniflac_sync_internal,a3		
_?L2279:					
	tst.l 114(a4)				
	jbeq _?L2334				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2277				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2279				
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2335				
_?L2334:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_total_samples
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2335				
_?L2327:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2329				
						
	.align	2				
	.globl	_miniflac_streaminfo_md5_length	
						
_miniflac_streaminfo_md5_length:		
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a4			
	move.l 60(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L2337				
						
	tst.l 64(sp)				
	jbeq _?L2371				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2391				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2391:					
	move.l 4(a4),d0				
_?L2337:					
						
	subq.l #1,d0				
	jbeq _?L2392				
						
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l d5,60(a4)			
	move.l 64(sp),56(a4)			
	clr.l 52(a4)				
	moveq #48,d7				
	add.l sp,d7				
	moveq #44,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L2370:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2349				
	move.l 44(sp),28(a4)			
	move.l 48(sp),24(a4)			
	clr.l 20(a4)				
_?L2350:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2353				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2350				
_?L2351:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2393				
	move.l 52(a4),d1			
	cmp.l 64(sp),d1				
	jbcs _?L2370				
_?L2401:					
	clr.l d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L2395:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2353:					
	tst.l 114(a4)				
	jbeq _?L2394				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2351				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2353				
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L2395				
_?L2392:					
	move.l d5,28(a4)			
	move.l 64(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2340:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2396				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2340				
_?L2341:					
	move.l 68(sp),a0			
	move.l 20(a4),(a0)			
_?L2400:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2394:					
						
	move.l 122(a4),d0			
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcc _?L2397				
_?L2356:					
						
	tst.l 72(sp)				
	jbeq _?L2387				
						
	moveq #16,d1				
	move.l 72(sp),a0			
	move.l d1,(a0)				
_?L2387:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L2395				
_?L2397:					
						
	cmp.l d0,d1				
	jbne _?L2383				
	move.l #_miniflac_bitreader_fill_nocrc,40(sp)
_?L2357:					
						
	pea 36.w				
	move.l d3,-(sp)				
	move.l 48(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2364				
						
	pea 36.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #8,d0				
	move.l d0,122(a4)			
	jbra _?L2356				
_?L2371:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2383:					
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbeq _?L2398				
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbne _?L2385				
	move.l #_miniflac_bitreader_fill_nocrc,40(sp)
_?L2359:					
						
	pea 3.w					
	move.l d3,-(sp)				
	move.l 48(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2364				
						
	pea 3.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d0				
	move.l d0,122(a4)			
_?L2358:					
						
	pea 5.w					
	move.l d3,-(sp)				
	move.l 48(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2364				
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
	move.b d1,132(a4)			
						
	moveq #7,d0				
	move.l d0,122(a4)			
	jbra _?L2357				
_?L2349:					
						
	move.l 52(a4),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L2395				
_?L2396:					
	lea _miniflac_sync_internal,a3		
_?L2343:					
	tst.l 114(a4)				
	jbeq _?L2399				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2341				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2343				
	moveq #-1,d4				
	move.l 68(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2400				
_?L2364:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 64(sp),d1				
	jbcs _?L2370				
	jbra _?L2401				
_?L2398:					
	move.l #_miniflac_bitreader_fill_nocrc,40(sp)
	jbra _?L2358				
_?L2399:					
						
	moveq #7,d0				
	cmp.l 122(a4),d0			
	jbcc _?L2345				
_?L2348:					
						
	tst.l 72(sp)				
	jbeq _?L2347				
						
	moveq #16,d0				
	move.l 72(sp),a0			
	move.l d0,(a0)				
_?L2347:					
						
	moveq #1,d4				
						
	move.l 68(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2400				
_?L2345:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_total_samples
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2348				
						
	move.l 68(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2400				
_?L2385:					
						
	subq.l #4,d0				
	jbeq _?L2363				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2351				
_?L2363:					
						
	pea 20.w				
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_fill_nocrc,48(sp)
	lea _miniflac_bitreader_fill_nocrc,a0	
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2364				
						
	pea 20.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,128(a4)			
						
	moveq #5,d0				
	move.l d0,122(a4)			
	jbra _?L2359				
_?L2393:					
						
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L2395				
						
	.align	2				
	.globl	_miniflac_streaminfo_md5_data	
						
_miniflac_streaminfo_md5_data:			
	lea (-20,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 60(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L2403				
						
	tst.l 68(sp)				
	jbeq _?L2466				
	subq.l #4,sp				
	move.l 68(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2493				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2493:					
	move.l 4(a3),d0				
_?L2403:					
						
	subq.l #1,d0				
	jbeq _?L2494				
						
	clr.l 48(sp)				
	clr.l 52(sp)				
	move.l 64(sp),60(a3)			
	move.l 68(sp),56(a3)			
	clr.l 52(a3)				
	moveq #52,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a5	
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
	lea _miniflac_oggfunction_end,a6	
_?L2465:					
	move.l d5,-(sp)				
	pea 52(sp)				
	move.l 72(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2426				
	move.l 48(sp),28(a3)			
	move.l 52(sp),24(a3)			
	clr.l 20(a3)				
_?L2427:					
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L2430				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2427				
_?L2428:					
	move.l 20(a3),d1			
_?L2432:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbne _?L2495				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L2465				
_?L2501:					
	clr.l d4				
	move.l 72(sp),a1			
	move.l d1,(a1)				
_?L2497:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2430:					
	tst.l 114(a3)				
	jbeq _?L2496				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2428				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L2430				
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
_?L2503:					
	move.l 72(sp),a1			
	move.l d1,(a1)				
	jbra _?L2497				
_?L2494:					
	move.l 64(sp),28(a3)			
	move.l 68(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L2406:					
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L2498				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L2406				
_?L2407:					
	move.l 72(sp),a1			
	move.l 20(a3),(a1)			
_?L2505:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2496:					
						
	move.l 122(a3),d0			
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcs _?L2499				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a3)				
	jbsr _miniflac_streaminfo_read_total_samples
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2428				
_?L2436:					
						
	move.b 126(a3),d0			
						
	cmp.b #16,d0				
	jbeq _?L2438				
						
	cmp.b #15,d0				
	jbhi _?L2439				
	tst.l 76(sp)				
	jbeq _?L2488				
						
	move.w #-1,a2				
_?L2440:					
						
	move.b 16(a3),d2			
						
	cmp.b #7,d2				
	jbhi _?L2500				
_?L2461:					
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L2443				
	move.l d1,a1				
						
	move.l 28(a3),a0			
						
	addq.l #1,d1				
	move.l d1,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d7,d1				
	or.b (a0,a1.l),d1			
	move.l d1,36(sp)			
						
	addq.l #1,32(a3)			
						
	move.b d2,16(a3)			
						
	clr.l d7				
	move.b d2,d7				
						
	jbeq _?L2468				
_?L2502:					
						
	move.w #64,a0				
	sub.l d7,a0				
						
	moveq #32,d2				
	sub.l d7,d2				
	jbmi _?L2455				
	move.l a2,d1				
	lsr.l d2,d1				
	move.l d1,a1				
	clr.l d2				
						
	and.l d6,d2				
	move.l d2,a0				
	move.l a1,d2				
	and.l 36(sp),d2				
_?L2454:					
	move.l a0,8(a3)				
	move.l d2,12(a3)			
						
	and.l #255,d0				
						
	cmp.l 80(sp),d0				
	jbcc _?L2457				
						
	move.w #-32,a0				
	add.l d7,a0				
	tst.l a0				
	jblt _?L2458				
	move.l a0,d2				
	lsr.l d2,d6				
						
	move.l 76(sp),a0			
	move.b d6,(a0,d0.l)			
						
	move.b 126(a3),d0			
	addq.b #1,d0				
	move.b d0,126(a3)			
						
	cmp.b #15,d0				
	jbls _?L2440				
_?L2439:					
						
	tst.l 84(sp)				
	jbeq _?L2490				
						
	move.l 80(sp),d0			
	moveq #16,d1				
	cmp.l d0,d1				
	jbcc _?L2464				
	moveq #16,d0				
_?L2464:					
						
	move.l 84(sp),a0			
	move.l d0,(a0)				
_?L2490:					
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	move.l 72(sp),a1			
	move.l d1,(a1)				
	jbra _?L2497				
_?L2443:					
	move.l 44(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L2465				
	jbra _?L2501				
_?L2457:					
						
	move.b 126(a3),d0			
	addq.b #1,d0				
	move.b d0,126(a3)			
						
	cmp.b #15,d0				
	jbhi _?L2439				
						
	move.b 16(a3),d2			
						
	cmp.b #7,d2				
	jbls _?L2461				
_?L2500:					
						
	move.l 8(a3),d6				
	move.l 12(a3),36(sp)			
						
	subq.b #8,d2				
	move.b d2,16(a3)			
						
	clr.l d7				
	move.b d2,d7				
						
	jbne _?L2502				
_?L2468:					
	sub.l a0,a0				
	clr.l d2				
	jbra _?L2454				
_?L2499:					
						
	subq.l #8,d0				
	jbeq _?L2436				
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	jbra _?L2503				
_?L2455:					
						
	moveq #31,d2				
	sub.l a0,d2				
	moveq #-2,d1				
	lsl.l d2,d1				
	move.l d1,44(sp)			
	move.l a2,d2				
	move.l a0,d1				
	lsr.l d1,d2				
	or.l 44(sp),d2				
	move.l d2,a1				
	move.l a2,d2				
	lsr.l d1,d2				
						
	and.l d6,d2				
	move.l d2,a0				
	move.l a1,d2				
	and.l 36(sp),d2				
	jbra _?L2454				
_?L2458:					
						
	add.l d6,d6				
	moveq #31,d2				
	sub.l d7,d2				
	lsl.l d2,d6				
	move.l d6,a0				
	move.l 36(sp),d6			
	lsr.l d7,d6				
	move.l a0,d1				
	or.l d1,d6				
						
	move.l 76(sp),a0			
	move.b d6,(a0,d0.l)			
						
	move.b 126(a3),d0			
	addq.b #1,d0				
	move.b d0,126(a3)			
						
	cmp.b #15,d0				
	jbls _?L2440				
	jbra _?L2439				
_?L2466:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2426:					
	move.l 52(a3),d1			
	move.l 72(sp),a1			
	move.l d1,(a1)				
	jbra _?L2497				
_?L2498:					
	lea _miniflac_sync_internal,a4		
_?L2409:					
	tst.l 114(a3)				
	jbeq _?L2504				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2407				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L2409				
	moveq #-1,d4				
_?L2508:					
	move.l 72(sp),a1			
	move.l 20(a3),(a1)			
	jbra _?L2505				
_?L2488:					
						
	move.w #-1,a1				
_?L2449:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L2506				
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d2			
	cmp.l 24(a3),d2				
	jbcc _?L2443				
	move.l d2,a2				
						
	move.l 28(a3),a0			
						
	addq.l #1,d2				
	move.l d2,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d6,d2				
	move.l d7,d1				
	or.b (a0,a2.l),d1			
	move.l d1,a0				
						
	addq.l #1,32(a3)			
_?L2442:					
						
	move.b d0,16(a3)			
						
	jbeq _?L2444				
						
	and.l #255,d0				
						
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d6				
	sub.l d0,d6				
	jbmi _?L2445				
	move.l a1,d0				
	lsr.l d6,d0				
	clr.l d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
						
	move.b 126(a3),d0			
	addq.b #1,d0				
	move.b d0,126(a3)			
						
	cmp.b #15,d0				
	jbls _?L2449				
	jbra _?L2439				
_?L2444:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.b 126(a3),d0			
	addq.b #1,d0				
	move.b d0,126(a3)			
						
	cmp.b #15,d0				
	jbls _?L2449				
	jbra _?L2439				
_?L2445:					
						
	moveq #31,d0				
	sub.l d7,d0				
	moveq #-2,d6				
	lsl.l d0,d6				
	move.l a1,d0				
	lsr.l d7,d0				
	or.l d6,d0				
	move.l a1,d6				
	lsr.l d7,d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
						
	move.b 126(a3),d0			
	addq.b #1,d0				
	move.b d0,126(a3)			
						
	cmp.b #15,d0				
	jbls _?L2449				
	jbra _?L2439				
_?L2438:					
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
						
	moveq #2,d4				
						
	move.l 72(sp),a1			
	move.l d1,(a1)				
	jbra _?L2497				
_?L2506:					
						
	move.l 8(a3),d2				
	move.l 12(a3),a0			
						
	subq.b #8,d0				
	jbra _?L2442				
_?L2504:					
						
	move.l 122(a3),d0			
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcs _?L2507				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a3)				
	jbsr _miniflac_streaminfo_read_total_samples
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2407				
_?L2412:					
						
	move.b 126(a3),d4			
						
	cmp.b #16,d4				
	jbeq _?L2467				
						
	cmp.b #15,d4				
	jbhi _?L2424				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
	tst.l 76(sp)				
	jbeq _?L2419				
_?L2417:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2418				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	and.l #255,d4				
						
	cmp.l 80(sp),d4				
	jbcc _?L2422				
						
	move.l 76(sp),a0			
	move.b d1,(a0,d4.l)			
						
	move.b 126(a3),d4			
	addq.b #1,d4				
	move.b d4,126(a3)			
						
	cmp.b #15,d4				
	jbls _?L2417				
_?L2424:					
						
	tst.l 84(sp)				
	jbeq _?L2416				
						
	move.l 80(sp),d0			
	moveq #16,d1				
	cmp.l d0,d1				
	jbcc _?L2425				
	moveq #16,d0				
_?L2425:					
						
	move.l 84(sp),a0			
	move.l d0,(a0)				
_?L2416:					
						
	moveq #1,d4				
						
	move.l 72(sp),a1			
	move.l 20(a3),(a1)			
	jbra _?L2505				
_?L2419:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2418				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b 126(a3),d0			
	addq.b #1,d0				
	move.b d0,126(a3)			
						
	cmp.b #15,d0				
	jbls _?L2419				
	jbra _?L2424				
_?L2422:					
						
	move.b 126(a3),d4			
	addq.b #1,d4				
	move.b d4,126(a3)			
						
	cmp.b #15,d4				
	jbls _?L2417				
	jbra _?L2424				
_?L2507:					
						
	subq.l #8,d0				
	jbeq _?L2412				
						
	moveq #-1,d4				
	jbra _?L2508				
_?L2418:					
						
	clr.l d4				
						
	move.l 72(sp),a1			
	move.l 20(a3),(a1)			
	jbra _?L2505				
_?L2467:					
						
	moveq #2,d4				
						
	move.l 72(sp),a1			
	move.l 20(a3),(a1)			
	jbra _?L2505				
_?L2495:					
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 72(sp),a1			
	move.l d1,(a1)				
	jbra _?L2497				
						
	.align	2				
	.globl	_miniflac_vorbis_comment_vendor_length
						
_miniflac_vorbis_comment_vendor_length:		
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
	move.l 60(sp),a4			
	move.l 64(sp),d3			
	move.l 68(sp),36(sp)			
	move.l 72(sp),d4			
						
	move.l 4(a3),d0				
	jbne _?L2510				
						
	tst.l d3				
	jbeq _?L2517				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbeq _?L2521				
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2521:					
	move.l 4(a3),d0				
_?L2510:					
						
	subq.l #1,d0				
	jbeq _?L2522				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l a4,60(a3)			
	move.l d3,56(a3)			
	clr.l 52(a3)				
	moveq #44,d5				
	add.l sp,d5				
	moveq #40,d7				
	add.l sp,d7				
	lea _miniflac_oggfunction_start,a5	
	lea _miniflac_oggfunction_end,a6	
_?L2516:					
	move.l d5,-(sp)				
	move.l d7,-(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d6				
	moveq #1,d0				
	cmp.l d6,d0				
	jbne _?L2513				
	move.l d4,-(sp)				
	pea 52(sp)				
	move.l 52(sp),-(sp)			
	move.l 52(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_vorbis_comment_vendor_length_native
	lea (20,sp),sp				
	move.l d0,d6				
	move.l 48(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	tst.l d6				
	jbne _?L2515				
	cmp.l d3,d1				
	jbcs _?L2516				
_?L2515:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L2523:					
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2522:					
						
	move.l d4,72(sp)			
	move.l 36(sp),68(sp)			
	move.l d3,64(sp)			
	move.l a4,60(sp)			
	move.l a3,56(sp)			
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	jbra _miniflac_vorbis_comment_vendor_length_native
_?L2517:					
						
	clr.l d6				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2513:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L2523				
						
	.align	2				
	.globl	_miniflac_vorbis_comment_vendor_string
						
_miniflac_vorbis_comment_vendor_string:		
	lea (-20,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 60(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L2525				
						
	tst.l 68(sp)				
	jbeq _?L2588				
	subq.l #4,sp				
	move.l 68(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2610				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2610:					
	move.l 4(a3),d0				
_?L2525:					
						
	subq.l #1,d0				
	jbeq _?L2611				
						
	clr.l 48(sp)				
	clr.l 52(sp)				
	move.l 64(sp),60(a3)			
	move.l 68(sp),56(a3)			
	clr.l 52(a3)				
	moveq #52,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a5	
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
	lea _miniflac_oggfunction_end,a6	
_?L2587:					
	move.l d5,-(sp)				
	pea 52(sp)				
	move.l 72(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2548				
	move.l 48(sp),28(a3)			
	move.l 52(sp),24(a3)			
	clr.l 20(a3)				
_?L2549:					
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L2552				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2549				
_?L2550:					
	move.l 20(a3),d1			
_?L2554:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2612				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L2587				
_?L2618:					
	clr.l d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
_?L2614:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2552:					
	moveq #4,d0				
	cmp.l 114(a3),d0			
	jbeq _?L2613				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2550				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L2552				
_?L2555:					
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L2614				
_?L2611:					
	move.l 64(sp),28(a3)			
	move.l 68(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L2528:					
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L2615				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L2528				
_?L2529:					
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
_?L2621:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2613:					
						
	move.l 134(a3),d0			
						
	jbeq _?L2557				
	subq.l #1,d0				
	jbne _?L2555				
						
	move.l 138(a3),d0			
_?L2559:					
						
	move.l 142(a3),a1			
						
	cmp.l a1,d0				
	jbls _?L2577				
	tst.l 76(sp)				
	jbeq _?L2616				
_?L2578:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L2617				
						
	move.l 20(a3),40(sp)			
						
	move.l 40(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L2581				
	move.l d1,d2				
	move.l d1,a2				
						
	move.l 28(a3),a0			
						
	addq.l #1,d2				
	move.l d2,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d6,d2				
	move.l d7,d1				
	or.b (a0,a2.l),d1			
	move.l d1,40(sp)			
						
	addq.l #1,32(a3)			
_?L2560:					
						
	move.b d0,16(a3)			
						
	clr.l d6				
	move.b d0,d6				
						
	jbeq _?L2589				
						
	move.w #64,a2				
	sub.l d6,a2				
						
	moveq #32,d0				
	sub.l d6,d0				
	jbmi _?L2564				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,a0				
	clr.l d7				
						
	and.l d2,d7				
	move.l a0,d0				
	and.l 40(sp),d0				
_?L2563:					
	move.l d7,8(a3)				
	move.l d0,12(a3)			
						
	cmp.l 80(sp),a1				
	jbcc _?L2566				
						
	move.w #-32,a0				
	add.l d6,a0				
	tst.l a0				
	jblt _?L2567				
	move.l a0,d0				
	lsr.l d0,d2				
						
	move.l 76(sp),a0			
	move.b d2,(a0,a1.l)			
_?L2566:					
						
	move.l 142(a3),a1			
	addq.l #1,a1				
	move.l a1,142(a3)			
						
	move.l 138(a3),d0			
						
	cmp.l a1,d0				
	jbhi _?L2578				
_?L2577:					
						
	tst.l 84(sp)				
	jbeq _?L2573				
						
	move.l 80(sp),d1			
	cmp.l d1,d0				
	jbcc _?L2574				
	move.l d0,d1				
_?L2574:					
						
	move.l 84(sp),a2			
	move.l d1,(a2)				
_?L2573:					
						
	moveq #2,d0				
	move.l d0,134(a3)			
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L2614				
_?L2581:					
	move.l 40(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L2587				
	jbra _?L2618				
_?L2589:					
	clr.l d7				
	clr.l d0				
	jbra _?L2563				
_?L2564:					
						
	moveq #31,d0				
	sub.l a2,d0				
	moveq #-2,d7				
	lsl.l d0,d7				
	moveq #-1,d0				
	move.l a2,d1				
	lsr.l d1,d0				
	or.l d7,d0				
	move.l d0,a0				
	moveq #-1,d7				
	lsr.l d1,d7				
						
	and.l d2,d7				
	move.l a0,d0				
	and.l 40(sp),d0				
	jbra _?L2563				
_?L2567:					
						
	add.l d2,d2				
	moveq #31,d0				
	sub.l d6,d0				
	move.l d2,d7				
	lsl.l d0,d7				
	move.l 40(sp),d2			
	lsr.l d6,d2				
	or.l d7,d2				
						
	move.l 76(sp),a0			
	move.b d2,(a0,a1.l)			
	jbra _?L2566				
_?L2588:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2616:					
						
	move.w #-1,a1				
_?L2586:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L2619				
						
	move.l 20(a3),40(sp)			
						
	move.l 40(sp),d2			
	cmp.l 24(a3),d2				
	jbcc _?L2581				
	move.l d2,a2				
						
	move.l 28(a3),a0			
						
	addq.l #1,d2				
	move.l d2,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d6,d2				
	move.l d7,d1				
	or.b (a0,a2.l),d1			
	move.l d1,a0				
						
	addq.l #1,32(a3)			
_?L2580:					
						
	move.b d0,16(a3)			
						
	jbeq _?L2582				
						
	and.l #255,d0				
						
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d6				
	sub.l d0,d6				
	jbmi _?L2583				
	move.l a1,d0				
	lsr.l d6,d0				
	clr.l d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
_?L2607:					
						
	move.l 142(a3),d1			
	addq.l #1,d1				
	move.l d1,142(a3)			
						
	move.l 138(a3),d0			
						
	cmp.l d1,d0				
	jbhi _?L2586				
	jbra _?L2577				
_?L2582:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 142(a3),d1			
	addq.l #1,d1				
	move.l d1,142(a3)			
						
	move.l 138(a3),d0			
						
	cmp.l d1,d0				
	jbhi _?L2586				
	jbra _?L2577				
_?L2583:					
						
	moveq #31,d0				
	sub.l d7,d0				
	moveq #-2,d6				
	lsl.l d0,d6				
	move.l a1,d0				
	lsr.l d7,d0				
	or.l d6,d0				
	move.l a1,d6				
	lsr.l d7,d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
	jbra _?L2607				
_?L2548:					
						
	move.l 52(a3),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L2614				
_?L2617:					
						
	move.l 8(a3),d2				
	move.l 12(a3),40(sp)			
						
	subq.b #8,d0				
	jbra _?L2560				
_?L2615:					
						
	lea _miniflac_sync_internal,a4		
_?L2531:					
	moveq #4,d0				
	cmp.l 114(a3),d0			
	jbeq _?L2620				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2529				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L2531				
_?L2532:					
	moveq #-1,d4				
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L2621				
_?L2557:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2576				
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L2587				
	jbra _?L2618				
_?L2619:					
						
	move.l 8(a3),d2				
	move.l 12(a3),a0			
						
	subq.b #8,d0				
	jbra _?L2580				
_?L2576:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_read,d6	
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
	move.l d1,40(sp)			
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d6,a2				
	jbsr (a2)				
	addq.l #8,sp				
	move.l d1,d7				
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
	move.l d1,44(sp)			
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d6,a2				
	jbsr (a2)				
	addq.l #8,sp				
						
	clr.l d0				
	move.b d7,d0				
						
	lsl.l #8,d0				
						
	clr.l d2				
	move.b 47(sp),d2			
						
	swap d2					
	clr.w d2				
						
	or.l d2,d0				
	or.b 43(sp),d0				
						
	moveq #24,d2				
	lsl.l d2,d1				
						
	or.l d1,d0				
						
	move.l d0,138(a3)			
						
	moveq #1,d1				
	move.l d1,134(a3)			
	jbra _?L2559				
_?L2620:					
						
	move.l 134(a3),d0			
						
	jbeq _?L2534				
	subq.l #1,d0				
	jbne _?L2532				
						
	move.l 138(a3),d0			
_?L2535:					
						
	move.l 142(a3),d4			
						
	cmp.l d0,d4				
	jbcc _?L2547				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
	tst.l 76(sp)				
	jbeq _?L2538				
_?L2536:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2545				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	cmp.l 80(sp),d4				
	jbcc _?L2541				
						
	move.l 76(sp),a0			
	move.b d1,(a0,d4.l)			
_?L2541:					
						
	move.l 142(a3),d4			
	addq.l #1,d4				
	move.l d4,142(a3)			
						
	move.l 138(a3),d0			
						
	cmp.l d4,d0				
	jbhi _?L2536				
_?L2547:					
						
	tst.l 84(sp)				
	jbeq _?L2543				
						
	move.l 80(sp),d1			
	cmp.l d1,d0				
	jbcc _?L2544				
	move.l d0,d1				
_?L2544:					
						
	move.l 84(sp),a2			
	move.l d1,(a2)				
_?L2543:					
						
	moveq #2,d0				
	move.l d0,134(a3)			
						
	moveq #1,d4				
						
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L2621				
_?L2538:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2545				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 142(a3),d1			
	addq.l #1,d1				
	move.l d1,142(a3)			
						
	move.l 138(a3),d0			
						
	cmp.l d0,d1				
	jbcs _?L2538				
	jbra _?L2547				
_?L2545:					
						
	clr.l d4				
						
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L2621				
_?L2534:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2545				
						
	pea 8.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_read,a4		
	jbsr (a4)				
	addq.l #8,sp				
	move.l d1,d5				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d1,d4				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d1,d6				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	clr.l d0				
	move.b d4,d0				
						
	lsl.l #8,d0				
						
	clr.l d2				
	move.b d6,d2				
						
	swap d2					
	clr.w d2				
						
	or.l d2,d0				
	or.b d5,d0				
						
	moveq #24,d2				
	lsl.l d2,d1				
						
	or.l d1,d0				
						
	move.l d0,138(a3)			
						
	moveq #1,d1				
	move.l d1,134(a3)			
	jbra _?L2535				
_?L2612:					
						
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L2614				
						
	.align	2				
	.globl	_miniflac_vorbis_comment_total	
						
_miniflac_vorbis_comment_total:			
	lea (-24,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 64(sp),a6			
						
	move.l 4(a6),d0				
	jbne _?L2623				
						
	tst.l 72(sp)				
	jbeq _?L2681				
	subq.l #4,sp				
	move.l 72(sp),a0			
	move.b (a0),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2718				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L2718:					
	move.l 4(a6),d0				
_?L2623:					
						
	subq.l #1,d0				
	jbeq _?L2719				
						
	clr.l 52(sp)				
	clr.l 56(sp)				
	move.l 68(sp),60(a6)			
	move.l 72(sp),56(a6)			
	clr.l 52(a6)				
	moveq #56,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a4	
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a5	
_?L2680:					
	move.l d6,-(sp)				
	pea 56(sp)				
	move.l 76(sp),-(sp)			
	move.l a6,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2655				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
_?L2656:					
	moveq #4,d2				
	cmp.l (a6),d2				
	jbeq _?L2659				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2656				
_?L2657:					
	move.l 20(a6),d1			
_?L2661:					
	move.l d1,-(sp)				
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr (a5)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2720				
	move.l 52(a6),d1			
	cmp.l 72(sp),d1				
	jbcs _?L2680				
_?L2727:					
	clr.l d4				
	move.l 76(sp),a0			
	move.l d1,(a0)				
_?L2722:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L2659:					
	moveq #4,d0				
	cmp.l 114(a6),d0			
	jbeq _?L2721				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d5				
	cmp.l d0,d5				
	jbne _?L2657				
	moveq #4,d7				
	cmp.l (a6),d7				
	jbeq _?L2659				
_?L2662:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d4				
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L2722				
_?L2719:					
	move.l 68(sp),28(a6)			
	move.l 72(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2626:					
	moveq #4,d4				
	cmp.l (a6),d4				
	jbeq _?L2723				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L2626				
_?L2713:					
	move.l 20(a6),d2			
_?L2627:					
	move.l 76(sp),a0			
	move.l d2,(a0)				
_?L2729:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L2721:					
						
	move.l 134(a6),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L2724				
						
	subq.l #1,d0				
	jbeq _?L2725				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2674				
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_read,d7	
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
	move.l d1,d5				
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
	move.l d1,44(sp)			
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d1,44(sp)			
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	clr.l d0				
	move.b 47(sp),d0			
						
	lsl.l #8,d0				
						
	move.l 36(sp),d2			
	and.l #255,d2				
						
	swap d2					
	clr.w d2				
						
	or.l d2,d0				
	or.b d5,d0				
						
	moveq #24,d2				
	lsl.l d2,d1				
						
	or.l d1,d0				
	move.l d0,40(sp)			
						
	move.l d0,138(a6)			
						
	moveq #1,d5				
	move.l d5,134(a6)			
						
	move.l 142(a6),a1			
						
	cmp.l 40(sp),a1				
	jbcc _?L2672				
_?L2675:					
						
	move.b 16(a6),d7			
						
	cmp.b #7,d7				
	jbhi _?L2669				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L2726				
						
	move.l 28(a6),a0			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a6)			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.b (a0,d2.l),d2			
	and.l #255,d2				
	clr.l d5				
	or.l d0,d5				
	move.l d5,8(a6)				
	or.l d1,d2				
	move.l d2,12(a6)			
						
	addq.b #8,d7				
	move.b d7,16(a6)			
						
	addq.l #1,32(a6)			
_?L2669:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	addq.l #1,a1				
	move.l a1,142(a6)			
						
	cmp.l 40(sp),a1				
	jbne _?L2675				
_?L2672:					
						
	moveq #2,d7				
	move.l d7,134(a6)			
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2676				
_?L2674:					
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 72(sp),d1				
	jbcs _?L2680				
	jbra _?L2727				
_?L2724:					
						
	subq.l #2,d0				
	jbne _?L2662				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2674				
	jbra _?L2676				
_?L2681:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L2676:					
						
	pea 8.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_read,a3		
	jbsr (a3)				
	addq.l #8,sp				
	move.l d1,d6				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d1,d5				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d1,d7				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	clr.l d0				
	move.b d5,d0				
						
	lsl.l #8,d0				
						
	and.l #255,d7				
						
	swap d7					
	clr.w d7				
						
	or.l d7,d0				
	or.b d6,d0				
						
	moveq #24,d7				
	lsl.l d7,d1				
						
	or.l d1,d0				
						
	move.l d0,146(a6)			
						
	tst.l 80(sp)				
	jbeq _?L2678				
						
	move.l 80(sp),a0			
	move.l d0,(a0)				
_?L2678:					
						
	moveq #3,d0				
	move.l d0,134(a6)			
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L2722				
_?L2725:					
						
	move.l 138(a6),40(sp)			
						
	move.l 142(a6),a1			
						
	cmp.l 40(sp),a1				
	jbcs _?L2675				
	jbra _?L2672				
_?L2726:					
						
	move.l d2,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 72(sp),d1				
	jbcs _?L2680				
	jbra _?L2727				
_?L2655:					
	move.l 52(a6),d1			
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L2722				
_?L2723:					
	lea _miniflac_sync_internal,a3		
_?L2629:					
	moveq #4,d0				
	cmp.l 114(a6),d0			
	jbeq _?L2728				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d5				
	cmp.l d0,d5				
	jbne _?L2713				
	moveq #4,d7				
	cmp.l (a6),d7				
	jbeq _?L2629				
	move.l 20(a6),d2			
						
	moveq #-1,d4				
_?L2732:					
						
	move.l 76(sp),a0			
	move.l d2,(a0)				
	jbra _?L2729				
_?L2728:					
						
	move.l 134(a6),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L2730				
						
	subq.l #1,d0				
	jbeq _?L2634				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2712				
						
	pea 8.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_read,a3		
	jbsr (a3)				
	addq.l #8,sp				
	move.l d1,d5				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d1,d4				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d1,d6				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	clr.l d0				
	move.b d4,d0				
						
	lsl.l #8,d0				
						
	clr.l d2				
	move.b d6,d2				
						
	swap d2					
	clr.w d2				
						
	or.l d2,d0				
	or.b d5,d0				
						
	moveq #24,d5				
	lsl.l d5,d1				
						
	or.l d1,d0				
	move.l d0,138(a6)			
						
	moveq #1,d7				
	move.l d7,134(a6)			
_?L2634:					
						
	move.l 142(a6),a1			
						
	move.l 138(a6),d6			
						
	cmp.l a1,d6				
	jbls _?L2652				
						
	move.b 16(a6),d4			
	addq.l #1,a1				
_?L2642:					
						
	cmp.b #7,d4				
	jbhi _?L2731				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L2711				
						
	move.l 28(a6),a0			
						
	move.l d2,d5				
	addq.l #1,d5				
	move.l d5,20(a6)			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,a4				
	move.l d1,d7				
	or.b (a0,d2.l),d7			
	move.l d7,a2				
						
	addq.l #1,32(a6)			
	move.b d4,d0				
_?L2636:					
						
	move.b d0,16(a6)			
						
	jbeq _?L2682				
						
	clr.l d1				
	move.b d0,d1				
						
	moveq #64,d5				
	sub.l d1,d5				
						
	moveq #32,d2				
	sub.l d1,d2				
	jbmi _?L2639				
	moveq #-1,d1				
	lsr.l d2,d1				
	clr.l d2				
						
	move.l a4,d5				
	and.l d5,d2				
	move.l a2,d7				
	and.l d7,d1				
_?L2638:					
	move.l d2,8(a6)				
	move.l d1,12(a6)			
						
	move.l a1,142(a6)			
						
	cmp.l a1,d6				
	jbeq _?L2652				
	move.l a1,d1				
	addq.l #1,d1				
	cmp.b #7,d4				
	jbhi _?L2683				
						
	move.l 24(a6),d1			
						
	clr.l d5				
	move.b d0,d5				
	moveq #64,d2				
	sub.l d5,d2				
						
	moveq #32,d4				
	sub.l d5,d4				
	jbmi _?L2643				
	moveq #-1,d7				
	lsr.l d4,d7				
	sub.l a2,a2				
_?L2648:					
						
	move.l 20(a6),d2			
						
	cmp.l d1,d2				
	jbcc _?L2711				
						
	move.l 28(a6),a0			
						
	move.l d2,d4				
	addq.l #1,d4				
	move.l d4,20(a6)			
						
	move.b (a0,d2.l),d2			
						
	move.l 8(a6),d4				
	move.l 12(a6),d5			
						
	addq.l #1,32(a6)			
						
	move.b d0,16(a6)			
						
	jbeq _?L2646				
						
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	or.b d2,d5				
						
	move.l a2,d2				
	and.l d4,d2				
	move.l d2,8(a6)				
	and.l d7,d5				
	move.l d5,12(a6)			
						
	addq.l #1,a1				
	move.l a1,142(a6)			
						
	cmp.l a1,d6				
	jbhi _?L2648				
_?L2652:					
						
	moveq #2,d4				
	move.l d4,134(a6)			
_?L2633:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2712				
						
	pea 8.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_read,a3		
	jbsr (a3)				
	addq.l #8,sp				
	move.l d1,d5				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d1,d4				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d1,d6				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	clr.l d0				
	move.b d4,d0				
						
	lsl.l #8,d0				
						
	clr.l d2				
	move.b d6,d2				
						
	swap d2					
	clr.w d2				
						
	or.l d2,d0				
	or.b d5,d0				
						
	moveq #24,d2				
	lsl.l d2,d1				
						
	or.l d1,d0				
						
	move.l d0,146(a6)			
						
	tst.l 80(sp)				
	jbeq _?L2654				
						
	move.l 80(sp),a0			
	move.l d0,(a0)				
_?L2654:					
						
	moveq #3,d0				
	move.l d0,134(a6)			
						
	move.l 20(a6),d2			
	moveq #1,d4				
	move.l 76(sp),a0			
	move.l d2,(a0)				
	jbra _?L2729				
_?L2730:					
						
	subq.l #2,d0				
	jbeq _?L2633				
						
	move.l 20(a6),d2			
						
	moveq #-1,d4				
	jbra _?L2732				
_?L2712:					
						
	move.l 20(a6),d2			
_?L2711:					
						
	clr.l d4				
						
	move.l 76(sp),a0			
	move.l d2,(a0)				
	jbra _?L2729				
_?L2731:					
						
	move.b d4,d0				
	subq.b #8,d0				
						
	move.l 8(a6),a4				
	move.l 12(a6),a2			
	jbra _?L2636				
_?L2646:					
						
	clr.l 8(a6)				
	clr.l 12(a6)				
						
	addq.l #1,a1				
	move.l a1,142(a6)			
						
	cmp.l a1,d6				
	jbhi _?L2648				
						
	moveq #2,d4				
	move.l d4,134(a6)			
	jbra _?L2633				
_?L2643:					
						
	moveq #-1,d5				
	moveq #31,d7				
	sub.l d2,d7				
	moveq #-2,d4				
	lsl.l d7,d4				
	move.l d5,d7				
	lsr.l d2,d7				
	or.l d4,d7				
	lsr.l d2,d5				
	move.l d5,a2				
	jbra _?L2648				
_?L2683:					
						
	move.l d1,a1				
	move.b d0,d4				
	jbra _?L2642				
_?L2720:					
						
	move.l 52(a6),d1			
	move.l d0,d4				
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L2722				
_?L2639:					
						
	moveq #-1,d2				
	move.w #31,a3				
	sub.l d5,a3				
	moveq #-2,d1				
	move.l a3,d7				
	lsl.l d7,d1				
	move.l d1,a0				
	move.l d2,d1				
	lsr.l d5,d1				
	move.l a0,d7				
	or.l d7,d1				
	lsr.l d5,d2				
						
	move.l a4,d5				
	and.l d5,d2				
	move.l a2,d7				
	and.l d7,d1				
	jbra _?L2638				
_?L2682:					
	clr.l d2				
	clr.l d1				
	jbra _?L2638				
						
	.align	2				
	.globl	_miniflac_vorbis_comment_length	
						
_miniflac_vorbis_comment_length:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a6			
	move.l 56(sp),a4			
	move.l 60(sp),d4			
						
	move.l 4(a6),d0				
	jbne _?L2734				
						
	tst.l d4				
	jbeq _?L2752				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2757				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2757:					
	move.l 4(a6),d0				
_?L2734:					
						
	subq.l #1,d0				
	jbeq _?L2758				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l a4,60(a6)			
	move.l d4,56(a6)			
	clr.l 52(a6)				
	moveq #44,d6				
	add.l sp,d6				
	moveq #40,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a5	
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	move.l a6,d7				
	add.l #134,d7				
_?L2751:					
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2742				
	move.l 40(sp),28(a6)			
	move.l 44(sp),24(a6)			
	clr.l 20(a6)				
_?L2743:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2746				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2743				
_?L2744:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	move.l 52(a6),d1			
	tst.l d0				
	jbne _?L2750				
	cmp.l d4,d1				
	jbcs _?L2751				
_?L2750:					
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L2760:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2746:					
	moveq #4,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2759				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2744				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2746				
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d0				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2760				
_?L2758:					
	move.l a4,28(a6)			
	move.l d4,24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2737:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2761				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2737				
_?L2738:					
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
_?L2763:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2759:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	move.l d7,-(sp)				
	jbsr _miniflac_vorbis_comment_read_length
	lea (12,sp),sp				
	jbra _?L2744				
_?L2752:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2742:					
	move.l 52(a6),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2760				
_?L2761:					
	lea _miniflac_sync_internal,a3		
_?L2740:					
	moveq #4,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2762				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2738				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2740				
	moveq #-1,d0				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2763				
_?L2762:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 134(a6)				
	jbsr _miniflac_vorbis_comment_read_length
	lea (12,sp),sp				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2763				
						
	.align	2				
	.globl	_miniflac_vorbis_comment_string	
						
_miniflac_vorbis_comment_string:		
	lea (-20,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 60(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L2765				
						
	tst.l 68(sp)				
	jbeq _?L2841				
	subq.l #4,sp				
	move.l 68(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2877				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2877:					
	move.l 4(a3),d0				
_?L2765:					
						
	subq.l #1,d0				
	jbeq _?L2878				
						
	clr.l 48(sp)				
	clr.l 52(sp)				
	move.l 64(sp),60(a3)			
	move.l 68(sp),56(a3)			
	clr.l 52(a3)				
	moveq #52,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a5	
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
	lea _miniflac_oggfunction_end,a6	
_?L2840:					
	move.l d5,-(sp)				
	pea 52(sp)				
	move.l 72(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2801				
	move.l 48(sp),28(a3)			
	move.l 52(sp),24(a3)			
	clr.l 20(a3)				
_?L2802:					
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L2805				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2802				
_?L2803:					
	move.l 20(a3),d1			
_?L2807:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbne _?L2879				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L2840				
_?L2887:					
	clr.l d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
_?L2881:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2805:					
	moveq #4,d1				
	cmp.l 114(a3),d1			
	jbeq _?L2880				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d6				
	cmp.l d0,d6				
	jbne _?L2803				
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L2805				
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
_?L2889:					
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L2881				
_?L2878:					
	move.l 64(sp),28(a3)			
	move.l 68(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L2768:					
	moveq #4,d5				
	cmp.l (a3),d5				
	jbeq _?L2882				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L2768				
_?L2872:					
	move.l 20(a3),d2			
_?L2769:					
	move.l 72(sp),a0			
	move.l d2,(a0)				
_?L2891:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2880:					
						
	move.l 134(a3),d0			
						
	moveq #3,d2				
	cmp.l d0,d2				
	jbcs _?L2883				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 134(a3)				
	jbsr _miniflac_vorbis_comment_read_length
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2803				
_?L2823:					
						
	move.l 142(a3),d2			
						
	move.l 138(a3),a1			
						
	cmp.l d2,a1				
	jbls _?L2812				
	tst.l 76(sp)				
	jbeq _?L2822				
_?L2813:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L2884				
_?L2835:					
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L2816				
	move.l d1,d6				
	move.l d1,a2				
						
	move.l 28(a3),a0			
						
	addq.l #1,d6				
	move.l d6,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d7,d1				
	or.b (a0,a2.l),d1			
	move.l d1,36(sp)			
						
	addq.l #1,32(a3)			
						
	move.b d0,16(a3)			
						
	clr.l d7				
	move.b d0,d7				
						
	jbeq _?L2843				
_?L2888:					
						
	move.w #64,a0				
	sub.l d7,a0				
						
	moveq #32,d0				
	sub.l d7,d0				
	jbmi _?L2828				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,a2				
	clr.l d0				
						
	and.l d6,d0				
	move.l d0,a0				
	move.l a2,d0				
	and.l 36(sp),d0				
_?L2827:					
	move.l a0,8(a3)				
	move.l d0,12(a3)			
						
	cmp.l 80(sp),d2				
	jbcc _?L2830				
						
	move.w #-32,a0				
	add.l d7,a0				
	tst.l a0				
	jblt _?L2831				
	move.l a0,d0				
	lsr.l d0,d6				
						
	move.l 76(sp),a0			
	move.b d6,(a0,d2.l)			
						
	move.l 142(a3),d2			
	addq.l #1,d2				
	move.l d2,142(a3)			
						
	move.l 138(a3),a1			
						
	cmp.l d2,a1				
	jbhi _?L2813				
_?L2812:					
						
	tst.l 84(sp)				
	jbeq _?L2837				
						
	move.l 80(sp),d0			
	cmp.l d0,a1				
	jbcc _?L2838				
	move.l a1,d0				
_?L2838:					
						
	move.l 84(sp),a2			
	move.l d0,(a2)				
_?L2837:					
						
	addq.l #1,150(a3)			
						
	moveq #3,d0				
	move.l d0,134(a3)			
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L2881				
_?L2885:					
						
	move.l 8(a3),d2				
	move.l 12(a3),44(sp)			
						
	subq.b #8,d0				
	move.b d0,16(a3)			
						
	jbeq _?L2817				
_?L2886:					
						
	and.l #255,d0				
						
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d6				
	sub.l d0,d6				
	jbmi _?L2818				
	moveq #-1,d0				
	lsr.l d6,d0				
	clr.l d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	and.l 44(sp),d0				
	move.l d0,12(a3)			
						
	move.l 142(a3),d0			
	addq.l #1,d0				
	move.l d0,142(a3)			
						
	cmp.l a1,d0				
	jbcc _?L2812				
_?L2822:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L2885				
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d6			
	cmp.l 24(a3),d6				
	jbcc _?L2816				
	move.l d6,a2				
						
	addq.l #1,d6				
	move.l d6,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d6,d2				
	move.l d7,d1				
	move.l 28(a3),a0			
	or.b (a0,a2.l),d1			
	move.l d1,44(sp)			
						
	addq.l #1,32(a3)			
						
	move.b d0,16(a3)			
						
	jbne _?L2886				
_?L2817:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 142(a3),d0			
	addq.l #1,d0				
	move.l d0,142(a3)			
						
	cmp.l a1,d0				
	jbcs _?L2822				
	jbra _?L2812				
_?L2816:					
						
	move.l 44(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L2840				
	jbra _?L2887				
_?L2830:					
						
	move.l 142(a3),d2			
	addq.l #1,d2				
	move.l d2,142(a3)			
						
	cmp.l d2,a1				
	jbls _?L2812				
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbls _?L2835				
_?L2884:					
						
	move.l 8(a3),d6				
	move.l 12(a3),36(sp)			
						
	subq.b #8,d0				
	move.b d0,16(a3)			
						
	clr.l d7				
	move.b d0,d7				
						
	jbne _?L2888				
_?L2843:					
	sub.l a0,a0				
	clr.l d0				
	jbra _?L2827				
_?L2883:					
						
	cmp.l d0,d1				
	jbeq _?L2823				
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	jbra _?L2889				
_?L2828:					
						
	moveq #31,d0				
	sub.l a0,d0				
	moveq #-2,d1				
	lsl.l d0,d1				
	move.l d1,44(sp)			
	moveq #-1,d0				
	move.l a0,d1				
	lsr.l d1,d0				
	or.l 44(sp),d0				
	move.l d0,a2				
	moveq #-1,d0				
	lsr.l d1,d0				
						
	and.l d6,d0				
	move.l d0,a0				
	move.l a2,d0				
	and.l 36(sp),d0				
	jbra _?L2827				
_?L2831:					
						
	add.l d6,d6				
	moveq #31,d0				
	sub.l d7,d0				
	lsl.l d0,d6				
	move.l d6,a0				
	move.l 36(sp),d6			
	lsr.l d7,d6				
	move.l a0,d1				
	or.l d1,d6				
						
	move.l 76(sp),a0			
	move.b d6,(a0,d2.l)			
						
	move.l 142(a3),d2			
	addq.l #1,d2				
	move.l d2,142(a3)			
						
	move.l 138(a3),a1			
						
	cmp.l d2,a1				
	jbhi _?L2813				
	jbra _?L2812				
_?L2841:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2818:					
						
	moveq #31,d0				
	sub.l d7,d0				
	moveq #-2,d6				
	lsl.l d0,d6				
	moveq #-1,d0				
	lsr.l d7,d0				
	or.l d6,d0				
	moveq #-1,d6				
	lsr.l d7,d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	and.l 44(sp),d0				
	move.l d0,12(a3)			
						
	move.l 142(a3),d0			
	addq.l #1,d0				
	move.l d0,142(a3)			
						
	cmp.l a1,d0				
	jbcs _?L2822				
	jbra _?L2812				
_?L2801:					
						
	move.l 52(a3),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L2881				
_?L2882:					
	lea _miniflac_sync_internal,a4		
_?L2771:					
	moveq #4,d1				
	cmp.l 114(a3),d1			
	jbeq _?L2890				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d6				
	cmp.l d0,d6				
	jbne _?L2872				
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L2771				
	move.l 20(a3),d2			
						
	moveq #-1,d4				
_?L2894:					
						
	move.l 72(sp),a0			
	move.l d2,(a0)				
	jbra _?L2891				
_?L2890:					
						
	move.l 134(a3),d0			
						
	moveq #3,d2				
	cmp.l d0,d2				
	jbcs _?L2892				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 134(a3)				
	jbsr _miniflac_vorbis_comment_read_length
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2872				
_?L2775:					
						
	move.l 142(a3),d3			
						
	move.l 138(a3),a1			
						
	cmp.l a1,d3				
	jbcc _?L2776				
	tst.l 76(sp)				
	jbeq _?L2868				
						
	moveq #-1,d4				
	move.w #-2,a2				
_?L2777:					
						
	move.b 16(a3),d6			
						
	cmp.b #7,d6				
	jbhi _?L2893				
						
	move.l 20(a3),d2			
						
	cmp.l 24(a3),d2				
	jbcc _?L2780				
						
	move.l 28(a3),a0			
						
	move.l d2,d5				
	addq.l #1,d5				
	move.l d5,20(a3)			
						
	move.l 8(a3),d0				
	move.l 12(a3),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d7				
	move.l d1,d0				
	or.b (a0,d2.l),d0			
						
	addq.l #1,32(a3)			
_?L2787:					
						
	move.b d6,16(a3)			
						
	clr.l d2				
	move.b d6,d2				
						
	jbeq _?L2842				
						
	move.w #64,a0				
	sub.l d2,a0				
						
	moveq #32,d6				
	sub.l d2,d6				
	jbmi _?L2790				
	move.l d4,d1				
	lsr.l d6,d1				
	clr.l d6				
						
	and.l d7,d6				
	and.l d0,d1				
_?L2789:					
	move.l d6,8(a3)				
	move.l d1,12(a3)			
						
	cmp.l 80(sp),d3				
	jbcc _?L2792				
						
	moveq #-32,d1				
	add.l d2,d1				
	jbmi _?L2793				
	move.l d7,d0				
	lsr.l d1,d0				
						
	move.l 76(sp),a0			
	move.b d0,(a0,d3.l)			
						
	move.l 142(a3),d3			
	addq.l #1,d3				
	move.l d3,142(a3)			
						
	move.l 138(a3),a1			
						
	cmp.l d3,a1				
	jbhi _?L2777				
_?L2776:					
						
	tst.l 84(sp)				
	jbeq _?L2799				
						
	move.l 80(sp),d0			
	cmp.l d0,a1				
	jbcc _?L2800				
	move.l a1,d0				
_?L2800:					
						
	move.l 84(sp),a2			
	move.l d0,(a2)				
_?L2799:					
						
	addq.l #1,150(a3)			
						
	moveq #3,d0				
	move.l d0,134(a3)			
						
	move.l 20(a3),d2			
	moveq #1,d4				
	move.l 72(sp),a0			
	move.l d2,(a0)				
	jbra _?L2891				
_?L2780:					
						
	clr.l d4				
						
	move.l 72(sp),a0			
	move.l d2,(a0)				
	jbra _?L2891				
_?L2792:					
						
	move.l 142(a3),d3			
	addq.l #1,d3				
	move.l d3,142(a3)			
						
	cmp.l d3,a1				
	jbhi _?L2777				
	jbra _?L2776				
_?L2842:					
	clr.l d6				
	clr.l d1				
	jbra _?L2789				
_?L2892:					
						
	cmp.l d0,d1				
	jbeq _?L2775				
						
	move.l 20(a3),d2			
						
	moveq #-1,d4				
	jbra _?L2894				
_?L2790:					
						
	moveq #31,d1				
	sub.l a0,d1				
	move.l a2,d5				
	lsl.l d1,d5				
	move.l d4,d1				
	move.l a0,d6				
	lsr.l d6,d1				
	or.l d5,d1				
	move.l d4,d6				
	move.l a0,d5				
	lsr.l d5,d6				
						
	and.l d7,d6				
	and.l d0,d1				
	jbra _?L2789				
_?L2793:					
						
	move.l d7,d1				
	add.l d1,d1				
	moveq #31,d6				
	sub.l d2,d6				
	lsl.l d6,d1				
	lsr.l d2,d0				
	or.l d1,d0				
						
	move.l 76(sp),a0			
	move.b d0,(a0,d3.l)			
						
	move.l 142(a3),d3			
	addq.l #1,d3				
	move.l d3,142(a3)			
						
	move.l 138(a3),a1			
						
	cmp.l d3,a1				
	jbhi _?L2777				
	jbra _?L2776				
_?L2868:					
						
	moveq #-1,d5				
	moveq #-2,d6				
_?L2786:					
						
	move.b 16(a3),d4			
						
	cmp.b #7,d4				
	jbhi _?L2895				
						
	move.l 20(a3),d2			
						
	cmp.l 24(a3),d2				
	jbcc _?L2780				
						
	move.l 28(a3),a0			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a3)			
						
	move.l 8(a3),d0				
	move.l 12(a3),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d3				
	move.l d1,d0				
	or.b (a0,d2.l),d0			
						
	addq.l #1,32(a3)			
_?L2779:					
						
	move.b d4,16(a3)			
						
	jbeq _?L2781				
						
	and.l #255,d4				
						
	moveq #64,d2				
	sub.l d4,d2				
						
	moveq #32,d7				
	sub.l d4,d7				
	jbmi _?L2782				
	move.l d5,d1				
	lsr.l d7,d1				
	clr.l d4				
						
	and.l d3,d4				
	move.l d4,8(a3)				
	and.l d0,d1				
	move.l d1,12(a3)			
						
	move.l 142(a3),d0			
	addq.l #1,d0				
	move.l d0,142(a3)			
						
	cmp.l a1,d0				
	jbcs _?L2786				
	jbra _?L2776				
_?L2781:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 142(a3),d0			
	addq.l #1,d0				
	move.l d0,142(a3)			
						
	cmp.l d0,a1				
	jbhi _?L2786				
	jbra _?L2776				
_?L2782:					
						
	moveq #31,d1				
	sub.l d2,d1				
	move.l d6,d4				
	lsl.l d1,d4				
	move.l d5,d1				
	lsr.l d2,d1				
	or.l d4,d1				
	move.l d5,d4				
	lsr.l d2,d4				
						
	and.l d3,d4				
	move.l d4,8(a3)				
	and.l d0,d1				
	move.l d1,12(a3)			
						
	move.l 142(a3),d0			
	addq.l #1,d0				
	move.l d0,142(a3)			
						
	cmp.l a1,d0				
	jbcs _?L2786				
	jbra _?L2776				
_?L2893:					
						
	move.l 8(a3),d7				
	move.l 12(a3),d0			
						
	subq.b #8,d6				
	jbra _?L2787				
_?L2895:					
						
	move.l 8(a3),d3				
	move.l 12(a3),d0			
						
	subq.b #8,d4				
	jbra _?L2779				
_?L2879:					
						
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L2881				
						
	.align	2				
	.globl	_miniflac_picture_type		
						
_miniflac_picture_type:				
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
	move.l 60(sp),a4			
	move.l 64(sp),d3			
	move.l 68(sp),36(sp)			
	move.l 72(sp),d4			
						
	move.l 4(a3),d0				
	jbne _?L2897				
						
	tst.l d3				
	jbeq _?L2904				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbeq _?L2908				
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2908:					
	move.l 4(a3),d0				
_?L2897:					
						
	subq.l #1,d0				
	jbeq _?L2909				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l a4,60(a3)			
	move.l d3,56(a3)			
	clr.l 52(a3)				
	moveq #44,d5				
	add.l sp,d5				
	moveq #40,d7				
	add.l sp,d7				
	lea _miniflac_oggfunction_start,a5	
	lea _miniflac_oggfunction_end,a6	
_?L2903:					
	move.l d5,-(sp)				
	move.l d7,-(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d6				
	moveq #1,d0				
	cmp.l d6,d0				
	jbne _?L2900				
	move.l d4,-(sp)				
	pea 52(sp)				
	move.l 52(sp),-(sp)			
	move.l 52(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_picture_type_native	
	lea (20,sp),sp				
	move.l d0,d6				
	move.l 48(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	tst.l d6				
	jbne _?L2902				
	cmp.l d3,d1				
	jbcs _?L2903				
_?L2902:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L2910:					
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2909:					
						
	move.l d4,72(sp)			
	move.l 36(sp),68(sp)			
	move.l d3,64(sp)			
	move.l a4,60(sp)			
	move.l a3,56(sp)			
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	jbra _miniflac_picture_type_native	
_?L2904:					
						
	clr.l d6				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2900:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L2910				
						
	.align	2				
	.globl	_miniflac_picture_mime_length	
						
_miniflac_picture_mime_length:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L2912				
						
	tst.l 60(sp)				
	jbeq _?L2942				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2962				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2962:					
	move.l 4(a4),d0				
_?L2912:					
						
	subq.l #1,d0				
	jbeq _?L2963				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L2941:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2926				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L2927:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2930				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2927				
_?L2928:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2964				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2941				
_?L2968:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L2966:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2930:					
	moveq #6,d1				
	cmp.l 114(a4),d1			
	jbeq _?L2965				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2928				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2930				
_?L2931:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2966				
_?L2963:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2915:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2967				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2915				
_?L2916:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L2970:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2965:					
						
	move.l 154(a4),d0			
						
	jbeq _?L2933				
	subq.l #1,d0				
	jbne _?L2931				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2938				
_?L2959:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2941				
	jbra _?L2968				
_?L2938:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,158(a4)			
						
	clr.l 162(a4)				
						
	tst.l 68(sp)				
	jbeq _?L2939				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L2939:					
						
	moveq #2,d0				
	move.l d0,154(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2966				
_?L2942:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2926:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2966				
_?L2967:					
	lea _miniflac_sync_internal,a3		
_?L2918:					
	moveq #6,d0				
	cmp.l 114(a4),d0			
	jbeq _?L2969				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2916				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2918				
_?L2922:					
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2970				
_?L2933:					
						
	pea 32.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2959				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,154(a4)			
	move.l 36(sp),a1			
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2959				
	jbra _?L2938				
_?L2969:					
						
	move.l 154(a4),d0			
						
	jbeq _?L2920				
	subq.l #1,d0				
	jbne _?L2922				
	lea _miniflac_bitreader_fill_nocrc,a1	
_?L2921:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2924				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,158(a4)			
						
	clr.l 162(a4)				
						
	tst.l 68(sp)				
	jbeq _?L2925				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L2925:					
						
	moveq #2,d0				
	move.l d0,154(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2970				
_?L2924:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2970				
_?L2920:					
						
	pea 32.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2924				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,154(a4)			
	move.l 36(sp),a1			
	jbra _?L2921				
_?L2964:					
						
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2966				
						
	.align	2				
	.globl	_miniflac_picture_mime_string	
						
_miniflac_picture_mime_string:			
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L2972				
						
	tst.l 64(sp)				
	jbeq _?L3044				
	subq.l #4,sp				
	move.l 64(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3078				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3078:					
	move.l 4(a3),d0				
_?L2972:					
						
	subq.l #1,d0				
	jbeq _?L3079				
						
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l 60(sp),60(a3)			
	move.l 64(sp),56(a3)			
	clr.l 52(a3)				
	moveq #48,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a5	
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
	lea _miniflac_oggfunction_end,a6	
_?L3043:					
	move.l d5,-(sp)				
	pea 48(sp)				
	move.l 68(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3002				
	move.l 44(sp),28(a3)			
	move.l 48(sp),24(a3)			
	clr.l 20(a3)				
_?L3003:					
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3006				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3003				
_?L3004:					
	move.l 20(a3),d1			
_?L3008:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbne _?L3080				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3043				
_?L3087:					
	clr.l d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L3082:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3006:					
	moveq #6,d0				
	cmp.l 114(a3),d0			
	jbeq _?L3081				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3004				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3006				
_?L3009:					
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3082				
_?L3079:					
	move.l 60(sp),28(a3)			
	move.l 64(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L2975:					
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L3083				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L2975				
_?L2976:					
	move.l 20(a3),a0			
_?L2980:					
	move.l 68(sp),a1			
	move.l a0,(a1)				
_?L3090:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3081:					
						
	move.l 154(a3),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L3084				
						
	subq.l #1,d0				
	move.l #_miniflac_bitreader_fill_nocrc,d6
	tst.l d0				
	jbeq _?L3030				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_fill_nocrc,d6
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3031				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,154(a3)			
_?L3030:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3031				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d1,d0				
						
	move.l d1,158(a3)			
						
	clr.l 162(a3)				
						
	moveq #2,d1				
	move.l d1,154(a3)			
	sub.l a1,a1				
_?L3013:					
						
	cmp.l a1,d0				
	jbls _?L3033				
	tst.l 72(sp)				
	jbeq _?L3085				
_?L3034:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L3086				
						
	move.l 20(a3),36(sp)			
						
	move.l 36(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L3037				
	move.l d1,a2				
						
	move.l 28(a3),a0			
						
	addq.l #1,d1				
	move.l d1,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d6,d2				
	move.l d7,d1				
	or.b (a0,a2.l),d1			
	move.l d1,36(sp)			
						
	addq.l #1,32(a3)			
_?L3014:					
						
	move.b d0,16(a3)			
						
	clr.l d6				
	move.b d0,d6				
						
	jbeq _?L3048				
						
	move.w #64,a2				
	sub.l d6,a2				
						
	moveq #32,d0				
	sub.l d6,d0				
	jbmi _?L3018				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,a0				
	clr.l d7				
						
	and.l d2,d7				
	move.l a0,d0				
	and.l 36(sp),d0				
_?L3017:					
	move.l d7,8(a3)				
	move.l d0,12(a3)			
						
	cmp.l 76(sp),a1				
	jbcc _?L3020				
						
	move.w #-32,a0				
	add.l d6,a0				
	tst.l a0				
	jblt _?L3021				
	move.l a0,d0				
	lsr.l d0,d2				
						
	move.l 72(sp),a0			
	move.b d2,(a0,a1.l)			
_?L3020:					
						
	move.l 162(a3),a1			
	addq.l #1,a1				
	move.l a1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l a1,d0				
	jbhi _?L3034				
_?L3033:					
						
	tst.l 80(sp)				
	jbeq _?L3027				
						
	move.l 76(sp),d1			
	cmp.l d1,d0				
	jbcc _?L3028				
	move.l d0,d1				
_?L3028:					
						
	move.l 80(sp),a1			
	move.l d1,(a1)				
_?L3027:					
						
	moveq #3,d0				
	move.l d0,154(a3)			
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3082				
_?L3084:					
						
	subq.l #2,d0				
	jbne _?L3009				
						
	move.l 158(a3),d0			
						
	move.l 162(a3),a1			
	jbra _?L3013				
_?L3037:					
						
	move.l 36(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3043				
	jbra _?L3087				
_?L3048:					
	clr.l d7				
	clr.l d0				
	jbra _?L3017				
_?L3018:					
						
	moveq #31,d0				
	sub.l a2,d0				
	moveq #-2,d7				
	lsl.l d0,d7				
	moveq #-1,d0				
	move.l a2,d1				
	lsr.l d1,d0				
	or.l d7,d0				
	move.l d0,a0				
	moveq #-1,d7				
	lsr.l d1,d7				
						
	and.l d2,d7				
	move.l a0,d0				
	and.l 36(sp),d0				
	jbra _?L3017				
_?L3021:					
						
	add.l d2,d2				
	moveq #31,d0				
	sub.l d6,d0				
	move.l d2,d7				
	lsl.l d0,d7				
	move.l 36(sp),d2			
	lsr.l d6,d2				
	or.l d7,d2				
						
	move.l 72(sp),a0			
	move.b d2,(a0,a1.l)			
	jbra _?L3020				
_?L3044:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3085:					
						
	move.w #-1,a1				
_?L3042:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L3088				
						
	move.l 20(a3),36(sp)			
						
	move.l 36(sp),d2			
	cmp.l 24(a3),d2				
	jbcc _?L3037				
	move.l d2,a2				
						
	move.l 28(a3),a0			
						
	addq.l #1,d2				
	move.l d2,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d6,d2				
	move.l d7,d1				
	or.b (a0,a2.l),d1			
	move.l d1,a0				
						
	addq.l #1,32(a3)			
_?L3036:					
						
	move.b d0,16(a3)			
						
	jbeq _?L3038				
						
	and.l #255,d0				
						
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d6				
	sub.l d0,d6				
	jbmi _?L3039				
	move.l a1,d0				
	lsr.l d6,d0				
	clr.l d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
_?L3075:					
						
	move.l 162(a3),d1			
	addq.l #1,d1				
	move.l d1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d1,d0				
	jbhi _?L3042				
	jbra _?L3033				
_?L3038:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 162(a3),d1			
	addq.l #1,d1				
	move.l d1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d1,d0				
	jbhi _?L3042				
	jbra _?L3033				
_?L3039:					
						
	moveq #31,d0				
	sub.l d7,d0				
	moveq #-2,d6				
	lsl.l d0,d6				
	move.l a1,d0				
	lsr.l d7,d0				
	or.l d6,d0				
	move.l a1,d6				
	lsr.l d7,d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
	jbra _?L3075				
_?L3002:					
						
	move.l 52(a3),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3082				
_?L3086:					
						
	move.l 8(a3),d2				
	move.l 12(a3),36(sp)			
						
	subq.b #8,d0				
	jbra _?L3014				
_?L3083:					
						
	lea _miniflac_sync_internal,a4		
_?L2978:					
	moveq #6,d0				
	cmp.l 114(a3),d0			
	jbeq _?L3089				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2976				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L2978				
_?L2983:					
	move.l 20(a3),a0			
						
	moveq #-1,d4				
						
	move.l 68(sp),a1			
	move.l a0,(a1)				
	jbra _?L3090				
_?L3031:					
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3043				
	jbra _?L3087				
_?L3088:					
						
	move.l 8(a3),d2				
	move.l 12(a3),a0			
						
	subq.b #8,d0				
	jbra _?L3036				
_?L3089:					
						
	move.l 154(a3),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L3091				
						
	subq.l #1,d0				
	jbeq _?L2994				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3073				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d2				
	move.l d2,154(a3)			
_?L2994:					
						
	move.b 16(a3),d4			
						
	cmp.b #31,d4				
	jbhi _?L2997				
						
	move.l 24(a3),a2			
						
	move.l 20(a3),d2			
						
	cmp.l a2,d2				
	jbcc _?L3045				
						
	move.l 28(a3),a1			
						
	move.l d2,a0				
	addq.l #1,a0				
	move.l a0,20(a3)			
						
	move.l 8(a3),d0				
	move.l 12(a3),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d6				
	move.l d1,d7				
	or.b (a1,d2.l),d7			
						
	move.l d6,8(a3)				
	move.l d7,12(a3)			
						
	move.b d4,d0				
	addq.b #8,d0				
	move.b d0,16(a3)			
						
	move.l 32(a3),d5			
						
	move.l d5,d1				
	addq.l #1,d1				
	move.l d1,32(a3)			
						
	cmp.b #31,d0				
	jbhi _?L2997				
	cmp.l a0,a2				
	jbls _?L3072				
						
	move.l d2,a4				
	addq.l #2,a4				
	move.l a4,20(a3)			
						
	move.l d6,d0				
	move.l d7,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d6				
	move.l d1,d7				
	or.b (a1,a0.l),d7			
						
	move.l d6,8(a3)				
	move.l d7,12(a3)			
						
	move.b d4,d0				
	add.b #16,d0				
	move.b d0,16(a3)			
						
	move.l d5,d1				
	addq.l #2,d1				
	move.l d1,32(a3)			
						
	cmp.b #31,d0				
	jbhi _?L2997				
	cmp.l a4,a2				
	jbls _?L3047				
						
	addq.l #2,a0				
	move.l a0,20(a3)			
						
	move.l d6,d0				
	move.l d7,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d6				
	move.l d1,d7				
	or.b (a1,a4.l),d7			
						
	move.l d6,8(a3)				
	move.l d7,12(a3)			
						
	move.b d4,d0				
	add.b #24,d0				
	move.b d0,16(a3)			
						
	move.l d5,d1				
	addq.l #3,d1				
	move.l d1,32(a3)			
						
	cmp.b #31,d0				
	jbhi _?L2997				
	cmp.l a0,a2				
	jbls _?L3072				
						
	addq.l #4,d2				
	move.l d2,20(a3)			
						
	clr.l d2				
	move.b (a1,a0.l),d2			
						
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	clr.l d0				
	or.l d6,d0				
	move.l d0,8(a3)				
	or.l d7,d2				
	move.l d2,12(a3)			
						
	add.b #32,d4				
	move.b d4,16(a3)			
						
	addq.l #4,d5				
	move.l d5,32(a3)			
_?L2997:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d1,d0				
						
	move.l d1,158(a3)			
						
	clr.l 162(a3)				
						
	moveq #2,d1				
	move.l d1,154(a3)			
	clr.l d4				
_?L2984:					
						
	cmp.l d4,d0				
	jbls _?L3001				
	move.l #_miniflac_bitreader_fill_nocrc,d6
						
	lea _miniflac_bitreader_read,a4		
	tst.l 72(sp)				
	jbeq _?L2987				
_?L2985:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d6,a1				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3073				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	cmp.l 76(sp),d4				
	jbcc _?L2990				
						
	move.l 72(sp),a2			
	move.b d1,(a2,d4.l)			
_?L2990:					
						
	move.l 162(a3),d4			
	addq.l #1,d4				
	move.l d4,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d4,d0				
	jbhi _?L2985				
_?L3001:					
						
	tst.l 80(sp)				
	jbeq _?L2992				
						
	move.l 76(sp),d1			
	cmp.l d1,d0				
	jbcc _?L2993				
	move.l d0,d1				
_?L2993:					
						
	move.l 80(sp),a0			
	move.l d1,(a0)				
_?L2992:					
						
	moveq #3,d0				
	move.l d0,154(a3)			
						
	move.l 20(a3),a0			
						
	moveq #1,d4				
						
	move.l 68(sp),a1			
	move.l a0,(a1)				
	jbra _?L3090				
_?L3091:					
						
	subq.l #2,d0				
	jbne _?L2983				
						
	move.l 162(a3),d4			
						
	move.l 158(a3),d0			
	jbra _?L2984				
_?L2987:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3073				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 162(a3),d1			
	addq.l #1,d1				
	move.l d1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d0,d1				
	jbcs _?L2987				
	jbra _?L3001				
_?L3073:					
						
	move.l 20(a3),a0			
						
	clr.l d4				
						
	move.l 68(sp),a1			
	move.l a0,(a1)				
	jbra _?L3090				
_?L3080:					
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3082				
_?L3047:					
						
	move.l a4,a0				
_?L3072:					
						
	clr.l d4				
						
	move.l 68(sp),a1			
	move.l a0,(a1)				
	jbra _?L3090				
_?L3045:					
						
	move.l d2,a0				
						
	clr.l d4				
						
	move.l 68(sp),a1			
	move.l a0,(a1)				
	jbra _?L3090				
						
	.align	2				
	.globl	_miniflac_picture_description_length
						
_miniflac_picture_description_length:		
	lea (-28,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 68(sp),a4			
						
	move.l 4(a4),d0				
	jbne _?L3093				
						
	tst.l 76(sp)				
	jbeq _?L3139				
	subq.l #4,sp				
	move.l 76(sp),a0			
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3161				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3161:					
	move.l 4(a4),d0				
_?L3093:					
						
	subq.l #1,d0				
	jbeq _?L3162				
						
	clr.l 56(sp)				
	clr.l 60(sp)				
	move.l 72(sp),60(a4)			
	move.l 76(sp),56(a4)			
	clr.l 52(a4)				
	moveq #60,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L3138:					
	move.l d6,-(sp)				
	pea 60(sp)				
	move.l 80(sp),-(sp)			
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3101				
	move.l 56(sp),28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
_?L3102:					
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L3105				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3102				
_?L3103:					
	move.l 20(a4),d1			
_?L3107:					
	move.l d1,-(sp)				
	move.l a4,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbne _?L3163				
	move.l 52(a4),d1			
	cmp.l 76(sp),d1				
	jbcs _?L3138				
_?L3169:					
	clr.l d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
_?L3165:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3105:					
	moveq #6,d1				
	cmp.l 114(a4),d1			
	jbeq _?L3164				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d5				
	cmp.l d0,d5				
	jbne _?L3103				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3105				
_?L3108:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3165				
_?L3162:					
	move.l 72(sp),28(a4)			
	move.l 76(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3096:					
	moveq #4,d5				
	cmp.l (a4),d5				
	jbeq _?L3166				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L3096				
_?L3097:					
	move.l 80(sp),a0			
	move.l 20(a4),(a0)			
_?L3171:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3164:					
						
	move.l 154(a4),d0			
						
	moveq #2,d2				
	cmp.l d0,d2				
	jbcs _?L3167				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbne _?L3113				
						
	move.l 158(a4),44(sp)			
						
	move.l 162(a4),d0			
_?L3114:					
						
	cmp.l 44(sp),d0				
	jbcc _?L3134				
						
	move.b 16(a4),d7			
	move.l d0,a2				
	addq.l #1,a2				
_?L3122:					
						
	cmp.b #7,d7				
	jbhi _?L3168				
						
	move.l 20(a4),d2			
						
	cmp.l 24(a4),d2				
	jbcc _?L3125				
						
	move.l 28(a4),a1			
						
	move.l d2,d5				
	addq.l #1,d5				
	move.l d5,20(a4)			
						
	move.l 8(a4),d0				
	move.l 12(a4),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,a0				
	move.l d1,d5				
	or.b (a1,d2.l),d5			
						
	addq.l #1,32(a4)			
	move.b d7,d0				
						
	move.b d0,16(a4)			
						
	jbeq _?L3141				
_?L3172:					
						
	clr.l d1				
	move.b d0,d1				
						
	move.w #64,a1				
	sub.l d1,a1				
						
	moveq #32,d2				
	sub.l d1,d2				
	move.l d2,48(sp)			
	jbmi _?L3119				
	move.l d2,d1				
	moveq #-1,d2				
	lsr.l d1,d2				
	move.l d2,36(sp)			
	clr.l 48(sp)				
						
	move.l a0,d1				
	and.l 48(sp),d1				
	move.l d1,a0				
	move.l 36(sp),d2			
	and.l d5,d2				
_?L3118:					
	move.l a0,8(a4)				
	move.l d2,12(a4)			
						
	move.l a2,162(a4)			
						
	cmp.l 44(sp),a2				
	jbeq _?L3134				
	move.l a2,d1				
	addq.l #1,d1				
	cmp.b #7,d7				
	jbhi _?L3142				
						
	move.l 24(a4),d7			
						
	clr.l d1				
	move.b d0,d1				
	move.w #64,a1				
	sub.l d1,a1				
						
	moveq #32,d2				
	sub.l d1,d2				
	moveq #-1,d1				
	tst.l d2				
	jblt _?L3123				
	lsr.l d2,d1				
	move.l d1,48(sp)			
	clr.l 52(sp)				
_?L3128:					
						
	move.l 20(a4),d2			
						
	cmp.l d2,d7				
	jbls _?L3125				
						
	move.l 28(a4),a1			
						
	move.l d2,d5				
	addq.l #1,d5				
	move.l d5,20(a4)			
						
	move.b (a1,d2.l),d5			
						
	move.l 8(a4),a0				
	move.l 12(a4),a1			
						
	addq.l #1,32(a4)			
						
	move.b d0,16(a4)			
						
	jbeq _?L3126				
						
	move.l a0,d1				
	move.l a1,d2				
	rol.l #8,d1				
	rol.l #8,d2				
	move.b d2,d1				
	clr.b d2				
						
	or.b d5,d2				
						
	move.l 52(sp),d5			
	and.l d1,d5				
	move.l d5,8(a4)				
	and.l 48(sp),d2				
	move.l d2,12(a4)			
						
	addq.l #1,a2				
	move.l a2,162(a4)			
						
	cmp.l 44(sp),a2				
	jbcs _?L3128				
_?L3134:					
						
	moveq #3,d0				
	move.l d0,154(a4)			
_?L3111:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3135				
_?L3132:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 76(sp),d1				
	jbcs _?L3138				
	jbra _?L3169				
_?L3167:					
						
	subq.l #3,d0				
	jbne _?L3108				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3132				
_?L3135:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,158(a4)			
						
	clr.l 162(a4)				
						
	tst.l 84(sp)				
	jbeq _?L3136				
						
	move.l 84(sp),a0			
	move.l d1,(a0)				
_?L3136:					
						
	moveq #4,d0				
	move.l d0,154(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3165				
_?L3139:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3113:					
						
	subq.l #1,d0				
	move.l #_miniflac_bitreader_fill_nocrc,d7
	tst.l d0				
	jbeq _?L3131				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_fill_nocrc,d7
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3132				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,154(a4)			
_?L3131:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3132				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d1,44(sp)			
						
	move.l d1,158(a4)			
						
	clr.l 162(a4)				
						
	moveq #2,d0				
	move.l d0,154(a4)			
	clr.l d0				
	jbra _?L3114				
_?L3125:					
						
	move.l d2,-(sp)				
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 76(sp),d1				
	jbcs _?L3138				
	jbra _?L3169				
_?L3101:					
	move.l 52(a4),d1			
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3165				
_?L3166:					
	lea _miniflac_sync_internal,a3		
_?L3099:					
	moveq #6,d2				
	cmp.l 114(a4),d2			
	jbeq _?L3170				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3097				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3099				
	moveq #-1,d4				
	move.l 80(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3171				
_?L3168:					
						
	move.b d7,d0				
	subq.b #8,d0				
						
	move.l 8(a4),a0				
	move.l 12(a4),d5			
						
	move.b d0,16(a4)			
						
	jbne _?L3172				
_?L3141:					
	sub.l a0,a0				
	clr.l d2				
	jbra _?L3118				
_?L3126:					
						
	clr.l 8(a4)				
	clr.l 12(a4)				
						
	addq.l #1,a2				
	move.l a2,162(a4)			
						
	cmp.l 44(sp),a2				
	jbcs _?L3128				
						
	moveq #3,d0				
	move.l d0,154(a4)			
	jbra _?L3111				
_?L3170:					
						
	move.l 84(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_description_length
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 80(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3171				
_?L3123:					
						
	moveq #31,d5				
	sub.l a1,d5				
	moveq #-2,d2				
	lsl.l d5,d2				
	move.l d2,a0				
	move.l d1,d2				
	move.l a1,d5				
	lsr.l d5,d2				
	move.l d2,48(sp)			
	move.l a0,d2				
	or.l d2,48(sp)				
	lsr.l d5,d1				
	move.l d1,52(sp)			
	jbra _?L3128				
_?L3119:					
	moveq #31,d2				
	sub.l a1,d2				
	move.l d2,48(sp)			
	moveq #-2,d2				
	move.l 48(sp),d1			
	lsl.l d1,d2				
	move.l d2,52(sp)			
	moveq #-1,d2				
	move.l a1,d1				
	lsr.l d1,d2				
	move.l d2,36(sp)			
	move.l 52(sp),d2			
	or.l d2,36(sp)				
	moveq #-1,d2				
	lsr.l d1,d2				
	move.l d2,48(sp)			
						
	move.l a0,d1				
	and.l 48(sp),d1				
	move.l d1,a0				
	move.l 36(sp),d2			
	and.l d5,d2				
	jbra _?L3118				
_?L3142:					
						
	move.l d1,a2				
	move.b d0,d7				
	jbra _?L3122				
_?L3163:					
						
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3165				
						
	.align	2				
	.globl	_miniflac_picture_description_string
						
_miniflac_picture_description_string:		
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L3174				
						
	tst.l 64(sp)				
	jbeq _?L3244				
	subq.l #4,sp				
	move.l 64(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3280				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3280:					
	move.l 4(a3),d0				
_?L3174:					
						
	subq.l #1,d0				
	jbeq _?L3281				
						
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l 60(sp),60(a3)			
	move.l 64(sp),56(a3)			
	clr.l 52(a3)				
	moveq #48,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a5	
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
	lea _miniflac_oggfunction_end,a6	
_?L3243:					
	move.l d5,-(sp)				
	pea 48(sp)				
	move.l 68(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3195				
	move.l 44(sp),28(a3)			
	move.l 48(sp),24(a3)			
	clr.l 20(a3)				
_?L3196:					
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3199				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3196				
_?L3197:					
	move.l 20(a3),d1			
_?L3201:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L3282				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3243				
_?L3290:					
	clr.l d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L3284:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3199:					
	moveq #6,d0				
	cmp.l 114(a3),d0			
	jbeq _?L3283				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3197				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3199				
_?L3202:					
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3284				
_?L3281:					
	move.l 60(sp),28(a3)			
	move.l 64(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L3177:					
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L3285				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L3177				
_?L3178:					
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
_?L3294:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3283:					
						
	move.l 154(a3),d0			
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbcs _?L3286				
						
	moveq #3,d1				
	move.l #_miniflac_bitreader_fill_nocrc,d7
	cmp.l d0,d1				
	jbne _?L3287				
_?L3223:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3229				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d1,d0				
						
	move.l d1,158(a3)			
						
	clr.l 162(a3)				
						
	moveq #4,d1				
	move.l d1,154(a3)			
	sub.l a1,a1				
_?L3206:					
						
	cmp.l a1,d0				
	jbls _?L3233				
	tst.l 72(sp)				
	jbeq _?L3288				
_?L3234:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L3289				
						
	move.l 20(a3),40(sp)			
						
	move.l 40(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L3237				
	move.l d1,a2				
						
	move.l 28(a3),a0			
						
	addq.l #1,d1				
	move.l d1,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d6,d2				
	move.l d7,d1				
	or.b (a0,a2.l),d1			
	move.l d1,40(sp)			
						
	addq.l #1,32(a3)			
_?L3207:					
						
	move.b d0,16(a3)			
						
	clr.l d6				
	move.b d0,d6				
						
	jbeq _?L3245				
						
	move.w #64,a2				
	sub.l d6,a2				
						
	moveq #32,d0				
	sub.l d6,d0				
	jbmi _?L3211				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,a0				
	clr.l d7				
						
	and.l d2,d7				
	move.l a0,d0				
	and.l 40(sp),d0				
_?L3210:					
	move.l d7,8(a3)				
	move.l d0,12(a3)			
						
	cmp.l 76(sp),a1				
	jbcc _?L3213				
						
	move.w #-32,a0				
	add.l d6,a0				
	tst.l a0				
	jblt _?L3214				
	move.l a0,d0				
	lsr.l d0,d2				
						
	move.l 72(sp),a0			
	move.b d2,(a0,a1.l)			
_?L3213:					
						
	move.l 162(a3),a1			
	addq.l #1,a1				
	move.l a1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l a1,d0				
	jbhi _?L3234				
_?L3233:					
						
	tst.l 80(sp)				
	jbeq _?L3220				
						
	move.l 76(sp),d1			
	cmp.l d1,d0				
	jbcc _?L3221				
	move.l d0,d1				
_?L3221:					
						
	move.l 80(sp),a2			
	move.l d1,(a2)				
_?L3220:					
						
	moveq #5,d0				
	move.l d0,154(a3)			
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3284				
_?L3286:					
						
	subq.l #4,d0				
	jbne _?L3202				
						
	move.l 158(a3),d0			
						
	move.l 162(a3),a1			
	jbra _?L3206				
_?L3237:					
						
	move.l 40(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3243				
	jbra _?L3290				
_?L3245:					
	clr.l d7				
	clr.l d0				
	jbra _?L3210				
_?L3211:					
						
	moveq #31,d0				
	sub.l a2,d0				
	moveq #-2,d7				
	lsl.l d0,d7				
	moveq #-1,d0				
	move.l a2,d1				
	lsr.l d1,d0				
	or.l d7,d0				
	move.l d0,a0				
	moveq #-1,d7				
	lsr.l d1,d7				
						
	and.l d2,d7				
	move.l a0,d0				
	and.l 40(sp),d0				
	jbra _?L3210				
_?L3214:					
						
	add.l d2,d2				
	moveq #31,d0				
	sub.l d6,d0				
	move.l d2,d7				
	lsl.l d0,d7				
	move.l 40(sp),d2			
	lsr.l d6,d2				
	or.l d7,d2				
						
	move.l 72(sp),a0			
	move.b d2,(a0,a1.l)			
	jbra _?L3213				
_?L3244:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3288:					
						
	move.w #-1,a1				
_?L3242:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L3291				
						
	move.l 20(a3),40(sp)			
						
	move.l 40(sp),d2			
	cmp.l 24(a3),d2				
	jbcc _?L3237				
	move.l d2,a2				
						
	move.l 28(a3),a0			
						
	addq.l #1,d2				
	move.l d2,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d6,d2				
	move.l d7,d1				
	or.b (a0,a2.l),d1			
	move.l d1,a0				
						
	addq.l #1,32(a3)			
_?L3236:					
						
	move.b d0,16(a3)			
						
	jbeq _?L3238				
						
	and.l #255,d0				
						
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d6				
	sub.l d0,d6				
	jbmi _?L3239				
	move.l a1,d0				
	lsr.l d6,d0				
	clr.l d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
_?L3275:					
						
	move.l 162(a3),d1			
	addq.l #1,d1				
	move.l d1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d0,d1				
	jbcs _?L3242				
	jbra _?L3233				
_?L3287:					
						
	moveq #2,d2				
	cmp.l d0,d2				
	jbeq _?L3292				
						
	subq.l #1,d0				
	move.l #_miniflac_bitreader_fill_nocrc,d7
	tst.l d0				
	jbeq _?L3228				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_fill_nocrc,d7
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3229				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,154(a3)			
_?L3228:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3229				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d1,40(sp)			
						
	move.l d1,158(a3)			
						
	clr.l 162(a3)				
						
	moveq #2,d0				
	move.l d0,154(a3)			
	clr.l d6				
						
	cmp.l 40(sp),d6				
	jbcc _?L3231				
_?L3227:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3229				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.l #1,d6				
	move.l d6,162(a3)			
						
	cmp.l 40(sp),d6				
	jbne _?L3227				
_?L3231:					
						
	moveq #3,d0				
	move.l d0,154(a3)			
	jbra _?L3223				
_?L3238:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 162(a3),d1			
	addq.l #1,d1				
	move.l d1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d0,d1				
	jbcs _?L3242				
	jbra _?L3233				
_?L3239:					
						
	moveq #31,d0				
	sub.l d7,d0				
	moveq #-2,d6				
	lsl.l d0,d6				
	move.l a1,d0				
	lsr.l d7,d0				
	or.l d6,d0				
	move.l a1,d6				
	lsr.l d7,d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
	jbra _?L3275				
_?L3195:					
						
	move.l 52(a3),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3284				
_?L3289:					
						
	move.l 8(a3),d2				
	move.l 12(a3),40(sp)			
						
	subq.b #8,d0				
	jbra _?L3207				
_?L3285:					
						
	lea _miniflac_sync_internal,a4		
_?L3180:					
	moveq #6,d0				
	cmp.l 114(a3),d0			
	jbeq _?L3293				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3178				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3180				
	moveq #-1,d4				
_?L3296:					
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L3294				
_?L3229:					
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3243				
	jbra _?L3290				
_?L3291:					
						
	move.l 8(a3),d2				
	move.l 12(a3),a0			
						
	subq.b #8,d0				
	jbra _?L3236				
_?L3292:					
						
	move.l 162(a3),d6			
						
	move.l 158(a3),40(sp)			
	move.l #_miniflac_bitreader_fill_nocrc,d7
						
	cmp.l 40(sp),d6				
	jbcs _?L3227				
	jbra _?L3231				
_?L3293:					
						
	move.l 154(a3),d0			
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbcs _?L3295				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a3)				
	jbsr _miniflac_picture_read_description_length
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3178				
_?L3194:					
						
	move.l 162(a3),d4			
						
	move.l 158(a3),d5			
						
	cmp.l d4,d5				
	jbls _?L3184				
	move.l #_miniflac_bitreader_fill_nocrc,d7
						
	lea _miniflac_bitreader_read,a4		
	tst.l 72(sp)				
	jbeq _?L3187				
_?L3185:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d7,a2				
	jbsr (a2)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3186				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	cmp.l 76(sp),d4				
	jbcc _?L3190				
						
	move.l 72(sp),a0			
	move.b d1,(a0,d4.l)			
_?L3190:					
						
	move.l 162(a3),d4			
	addq.l #1,d4				
	move.l d4,162(a3)			
						
	move.l 158(a3),d5			
						
	cmp.l d4,d5				
	jbhi _?L3185				
_?L3184:					
						
	tst.l 80(sp)				
	jbeq _?L3192				
						
	move.l 76(sp),d0			
	cmp.l d0,d5				
	jbcc _?L3193				
	move.l d5,d0				
_?L3193:					
						
	move.l 80(sp),a2			
	move.l d0,(a2)				
_?L3192:					
						
	moveq #5,d0				
	move.l d0,154(a3)			
						
	moveq #1,d4				
						
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L3294				
_?L3187:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3186				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 162(a3),d0			
	addq.l #1,d0				
	move.l d0,162(a3)			
						
	cmp.l d0,d5				
	jbhi _?L3187				
	jbra _?L3184				
_?L3295:					
						
	subq.l #4,d0				
	jbeq _?L3194				
						
	moveq #-1,d4				
	jbra _?L3296				
_?L3186:					
						
	clr.l d4				
						
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L3294				
_?L3282:					
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3284				
						
	.align	2				
	.globl	_miniflac_picture_width		
						
_miniflac_picture_width:			
	lea (-28,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 68(sp),a6			
						
	move.l 4(a6),d0				
	jbne _?L3298				
						
	tst.l 76(sp)				
	jbeq _?L3354				
	subq.l #4,sp				
	move.l 76(sp),a0			
	move.b (a0),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3379				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3379:					
	move.l 4(a6),d0				
_?L3298:					
						
	subq.l #1,d0				
	jbeq _?L3380				
						
	clr.l 56(sp)				
	clr.l 60(sp)				
	move.l 72(sp),60(a6)			
	move.l 76(sp),56(a6)			
	clr.l 52(a6)				
	moveq #60,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a4	
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a5	
_?L3353:					
	move.l d6,-(sp)				
	pea 60(sp)				
	move.l 80(sp),-(sp)			
	move.l a6,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3306				
	move.l 56(sp),28(a6)			
	move.l 60(sp),24(a6)			
	clr.l 20(a6)				
_?L3307:					
	moveq #4,d2				
	cmp.l (a6),d2				
	jbeq _?L3310				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3307				
_?L3308:					
	move.l 20(a6),d1			
_?L3312:					
	move.l d1,-(sp)				
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr (a5)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L3381				
	move.l 52(a6),d1			
	cmp.l 76(sp),d1				
	jbcs _?L3353				
_?L3387:					
	clr.l d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
_?L3383:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3310:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3382				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d5				
	cmp.l d0,d5				
	jbne _?L3308				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3310				
_?L3313:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3383				
_?L3380:					
	move.l 72(sp),28(a6)			
	move.l 76(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3301:					
	moveq #4,d5				
	cmp.l (a6),d5				
	jbeq _?L3384				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L3301				
_?L3302:					
	move.l 80(sp),a0			
	move.l 20(a6),(a0)			
_?L3390:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3382:					
						
	move.l 154(a6),d0			
						
	moveq #4,d2				
	cmp.l d0,d2				
	jbcs _?L3385				
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L3318				
						
	move.l 162(a6),d0			
						
	move.l 158(a6),40(sp)			
_?L3319:					
						
	cmp.l 40(sp),d0				
	jbcc _?L3323				
	move.l d0,a1				
	addq.l #1,a1				
_?L3349:					
						
	move.b 16(a6),d7			
						
	cmp.b #7,d7				
	jbhi _?L3320				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L3386				
						
	move.l 28(a6),a0			
						
	move.l d2,d5				
	addq.l #1,d5				
	move.l d5,20(a6)			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.b (a0,d2.l),d2			
	and.l #255,d2				
	clr.l d5				
	or.l d0,d5				
	move.l d5,8(a6)				
	or.l d1,d2				
	move.l d2,12(a6)			
						
	addq.b #8,d7				
	move.b d7,16(a6)			
						
	addq.l #1,32(a6)			
_?L3320:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	move.l a1,162(a6)			
						
	move.l a1,d0				
	addq.l #1,d0				
	cmp.l 40(sp),a1				
	jbeq _?L3323				
	move.l d0,a1				
	jbra _?L3349				
_?L3385:					
						
	subq.l #5,d0				
	jbne _?L3313				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3350				
_?L3346:					
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 76(sp),d1				
	jbcs _?L3353				
	jbra _?L3387				
_?L3350:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 84(sp)				
	jbeq _?L3351				
						
	move.l 84(sp),a0			
	move.l d1,(a0)				
_?L3351:					
						
	moveq #6,d0				
	move.l d0,154(a6)			
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3383				
_?L3354:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3318:					
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbne _?L3388				
_?L3325:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3346				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d1,40(sp)			
						
	move.l d1,158(a6)			
						
	clr.l 162(a6)				
						
	moveq #4,d2				
	move.l d2,154(a6)			
	clr.l d0				
	jbra _?L3319				
_?L3386:					
						
	move.l d2,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 76(sp),d1				
	jbcs _?L3353				
	jbra _?L3387				
_?L3306:					
	move.l 52(a6),d1			
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3383				
_?L3384:					
	lea _miniflac_sync_internal,a3		
_?L3304:					
	moveq #6,d2				
	cmp.l 114(a6),d2			
	jbeq _?L3389				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3302				
	moveq #4,d1				
	cmp.l (a6),d1				
	jbeq _?L3304				
	moveq #-1,d4				
	move.l 80(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3390				
_?L3323:					
						
	moveq #5,d0				
	move.l d0,154(a6)			
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3346				
	jbra _?L3350				
_?L3388:					
						
	moveq #2,d2				
	cmp.l d0,d2				
	jbne _?L3326				
						
	move.l 158(a6),a2			
						
	move.l 162(a6),d7			
_?L3327:					
						
	cmp.l a2,d7				
	jbcc _?L3347				
						
	move.b 16(a6),d1			
	move.w d1,a1				
_?L3335:					
						
	move.w a1,d0				
	cmp.b #7,d0				
	jbhi _?L3391				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L3338				
						
	move.l 28(a6),a0			
						
	move.l d2,d5				
	addq.l #1,d5				
	move.l d5,20(a6)			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,44(sp)			
	move.l d1,d5				
	or.b (a0,d2.l),d5			
	move.l d5,48(sp)			
						
	addq.l #1,32(a6)			
	move.w a1,d0				
_?L3328:					
						
	move.b d0,16(a6)			
	clr.l d1				
						
	tst.b d0				
	jbeq _?L3356				
						
	move.b d0,d1				
						
	move.w #64,a0				
	sub.l d1,a0				
						
	moveq #32,d5				
	sub.l d1,d5				
	jbmi _?L3332				
	moveq #-1,d2				
	lsr.l d5,d2				
	clr.l d1				
						
	and.l 44(sp),d1				
	and.l 48(sp),d2				
_?L3331:					
	move.l d1,8(a6)				
	move.l d2,12(a6)			
						
	addq.l #1,d7				
	move.l d7,162(a6)			
						
	cmp.l d7,a2				
	jbeq _?L3347				
	move.w a1,d1				
	cmp.b #7,d1				
	jbhi _?L3357				
						
	move.l 24(a6),48(sp)			
						
	clr.l d2				
	move.b d0,d2				
	move.w #64,a1				
	sub.l d2,a1				
						
	move.w #32,a0				
	sub.l d2,a0				
	tst.l a0				
	jblt _?L3336				
	moveq #-1,d2				
	move.l a0,d5				
	lsr.l d5,d2				
	move.l d2,40(sp)			
	clr.l 44(sp)				
_?L3341:					
						
	move.l 20(a6),d2			
						
	cmp.l 48(sp),d2				
	jbcc _?L3338				
						
	move.l 28(a6),a0			
						
	move.l d2,d5				
	addq.l #1,d5				
	move.l d5,20(a6)			
						
	move.b (a0,d2.l),d5			
						
	move.l 8(a6),a0				
	move.l 12(a6),a1			
						
	addq.l #1,32(a6)			
						
	move.b d0,16(a6)			
						
	jbeq _?L3339				
						
	move.l a0,d1				
	move.l a1,d2				
	rol.l #8,d1				
	rol.l #8,d2				
	move.b d2,d1				
	clr.b d2				
	move.l d1,a0				
	move.l d2,a1				
						
	or.b d5,d2				
	move.l d2,a1				
						
	move.l a0,d2				
	and.l 44(sp),d2				
	move.l d2,8(a6)				
	move.l a1,d5				
	and.l 40(sp),d5				
	move.l d5,12(a6)			
						
	addq.l #1,d7				
	move.l d7,162(a6)			
						
	cmp.l d7,a2				
	jbhi _?L3341				
_?L3347:					
						
	moveq #3,d1				
	move.l d1,154(a6)			
	jbra _?L3325				
_?L3338:					
						
	move.l d2,-(sp)				
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 76(sp),d1				
	jbcs _?L3353				
	jbra _?L3387				
_?L3389:					
	move.l 84(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 80(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3390				
_?L3326:					
						
	subq.l #1,d0				
	move.l #_miniflac_bitreader_fill_nocrc,d7
	tst.l d0				
	jbeq _?L3344				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_fill_nocrc,d7
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3346				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,154(a6)			
_?L3344:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3346				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d1,a2				
						
	move.l d1,158(a6)			
						
	clr.l 162(a6)				
						
	moveq #2,d0				
	move.l d0,154(a6)			
	clr.l d7				
	jbra _?L3327				
_?L3391:					
						
	move.w a1,d0				
	subq.b #8,d0				
						
	move.l 8(a6),44(sp)			
	move.l 12(a6),48(sp)			
	jbra _?L3328				
_?L3356:					
	clr.l d2				
	jbra _?L3331				
_?L3339:					
						
	clr.l 8(a6)				
	clr.l 12(a6)				
						
	addq.l #1,d7				
	move.l d7,162(a6)			
						
	cmp.l a2,d7				
	jbcs _?L3341				
						
	moveq #3,d1				
	move.l d1,154(a6)			
	jbra _?L3325				
_?L3336:					
						
	moveq #-1,d1				
	moveq #31,d2				
	sub.l a1,d2				
	move.w #-2,a0				
	move.l a0,d5				
	lsl.l d2,d5				
	move.l d5,a0				
	move.l d1,d2				
	move.l a1,d5				
	lsr.l d5,d2				
	move.l d2,40(sp)			
	move.l a0,d2				
	or.l d2,40(sp)				
	lsr.l d5,d1				
	move.l d1,44(sp)			
	jbra _?L3341				
_?L3357:					
						
	move.w d0,a1				
	jbra _?L3335				
_?L3381:					
						
	move.l 52(a6),d1			
	move.l d0,d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3383				
_?L3332:					
						
	moveq #-1,d1				
	moveq #31,d2				
	sub.l a0,d2				
	move.l d2,40(sp)			
	moveq #-2,d2				
	move.l 40(sp),d5			
	lsl.l d5,d2				
	move.l d2,52(sp)			
	move.l d1,d2				
	move.l a0,d5				
	lsr.l d5,d2				
	or.l 52(sp),d2				
	lsr.l d5,d1				
						
	and.l 44(sp),d1				
	and.l 48(sp),d2				
	jbra _?L3331				
						
	.align	2				
	.globl	_miniflac_picture_height	
						
_miniflac_picture_height:			
	lea (-24,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 64(sp),a4			
	move.l 68(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L3393				
						
	tst.l 72(sp)				
	jbeq _?L3428				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3455				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L3455:					
	move.l 4(a4),d0				
_?L3393:					
						
	subq.l #1,d0				
	jbeq _?L3456				
						
	clr.l 52(sp)				
	clr.l 56(sp)				
	move.l d5,60(a4)			
	move.l 72(sp),56(a4)			
	clr.l 52(a4)				
	moveq #56,d7				
	add.l sp,d7				
	moveq #52,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L3427:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3405				
	move.l 52(sp),28(a4)			
	move.l 56(sp),24(a4)			
	clr.l 20(a4)				
_?L3406:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3409				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3406				
_?L3407:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L3457				
_?L3423:					
	move.l 52(a4),d1			
	cmp.l 72(sp),d1				
	jbcs _?L3427				
_?L3462:					
	clr.l d4				
	move.l 76(sp),a0			
	move.l d1,(a0)				
_?L3459:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L3409:					
	moveq #6,d1				
	cmp.l 114(a4),d1			
	jbeq _?L3458				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3407				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3409				
_?L3410:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L3459				
_?L3456:					
	move.l d5,28(a4)			
	move.l 72(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3396:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3460				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3396				
_?L3397:					
	move.l 76(sp),a0			
	move.l 20(a4),(a0)			
_?L3465:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L3458:					
						
	move.l 154(a4),d0			
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L3461				
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbne _?L3450				
	move.l #_miniflac_bitreader_fill_nocrc,40(sp)
_?L3415:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l 48(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3418				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d0				
	move.l d0,154(a4)			
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l 48(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3424				
_?L3418:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 72(sp),d1				
	jbcs _?L3427				
	jbra _?L3462				
_?L3461:					
						
	subq.l #6,d0				
	jbne _?L3410				
	move.l #_miniflac_bitreader_fill_nocrc,40(sp)
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l 48(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3418				
_?L3424:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 80(sp)				
	jbeq _?L3425				
						
	move.l 80(sp),a0			
	move.l d1,(a0)				
_?L3425:					
						
	moveq #7,d0				
	move.l d0,154(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L3459				
_?L3428:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L3450:					
						
	subq.l #4,d0				
	jbne _?L3416				
_?L3421:					
						
	move.l 162(a4),d0			
						
	move.l 158(a4),48(sp)			
						
	cmp.l 48(sp),d0				
	jbcc _?L3463				
	addq.l #1,d0				
	move.l d0,44(sp)			
	move.l #_miniflac_bitreader_fill_nocrc,40(sp)
_?L3419:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l 48(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3418				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l 44(sp),162(a4)			
						
	move.l 44(sp),d0			
	addq.l #1,d0				
	move.l 48(sp),a0			
	cmp.l 44(sp),a0				
	jbeq _?L3420				
	move.l d0,44(sp)			
	jbra _?L3419				
_?L3405:					
						
	move.l 52(a4),d1			
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L3459				
_?L3460:					
	lea _miniflac_sync_internal,a3		
_?L3399:					
	moveq #6,d0				
	cmp.l 114(a4),d0			
	jbeq _?L3464				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3397				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3399				
	moveq #-1,d4				
_?L3467:					
	move.l 76(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3465				
_?L3416:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_description_length
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3421				
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbeq _?L3423				
	jbra _?L3457				
_?L3464:					
						
	move.l 154(a4),d0			
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L3466				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3397				
_?L3402:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3429				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 80(sp)				
	jbeq _?L3404				
						
	move.l 80(sp),a0			
	move.l d1,(a0)				
_?L3404:					
						
	moveq #7,d0				
	move.l d0,154(a4)			
	moveq #1,d4				
						
	move.l 76(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3465				
_?L3466:					
						
	subq.l #6,d0				
	jbeq _?L3402				
						
	moveq #-1,d4				
	jbra _?L3467				
_?L3463:					
	move.l #_miniflac_bitreader_fill_nocrc,40(sp)
_?L3420:					
						
	moveq #5,d0				
	move.l d0,154(a4)			
	jbra _?L3415				
_?L3429:					
						
	clr.l d4				
						
	move.l 76(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3465				
_?L3457:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L3459				
						
	.align	2				
	.globl	_miniflac_picture_colordepth	
						
_miniflac_picture_colordepth:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L3469				
						
	tst.l 60(sp)				
	jbeq _?L3496				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3512				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3512:					
	move.l 4(a4),d0				
_?L3469:					
						
	subq.l #1,d0				
	jbeq _?L3513				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L3495:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3477				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L3478:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3481				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3478				
_?L3479:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L3514				
_?L3491:					
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L3495				
_?L3520:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L3516:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3481:					
	moveq #6,d1				
	cmp.l 114(a4),d1			
	jbeq _?L3515				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3479				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3481				
_?L3482:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3516				
_?L3513:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3472:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3517				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3472				
_?L3473:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L3522:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3515:					
						
	move.l 154(a4),d0			
						
	cmp.l d0,d1				
	jbcs _?L3518				
						
	subq.l #6,d0				
	jbne _?L3487				
_?L3490:					
						
	pea 32.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L3492				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #7,d0				
	move.l d0,154(a4)			
	move.l 36(sp),a1			
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3519				
_?L3492:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L3495				
	jbra _?L3520				
_?L3518:					
						
	subq.l #7,d0				
	jbne _?L3482				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3492				
_?L3519:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L3493				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L3493:					
						
	moveq #8,d0				
	move.l d0,154(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3516				
_?L3496:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3487:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3490				
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbeq _?L3491				
	jbra _?L3514				
_?L3477:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3516				
_?L3517:					
	lea _miniflac_sync_internal,a3		
_?L3475:					
	moveq #6,d0				
	cmp.l 114(a4),d0			
	jbeq _?L3521				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3473				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3475				
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3522				
_?L3521:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_colordepth	
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3522				
_?L3514:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3516				
						
	.align	2				
	.globl	_miniflac_picture_totalcolors	
						
_miniflac_picture_totalcolors:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L3524				
						
	tst.l 60(sp)				
	jbeq _?L3557				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3584				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3584:					
	move.l 4(a4),d0				
_?L3524:					
						
	subq.l #1,d0				
	jbeq _?L3585				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L3556:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3536				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L3537:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3540				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3537				
_?L3538:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L3586				
_?L3552:					
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L3556				
_?L3592:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L3588:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3540:					
	moveq #6,d1				
	cmp.l 114(a4),d1			
	jbeq _?L3587				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3538				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3540				
_?L3541:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3588				
_?L3585:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3527:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3589				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3527				
_?L3528:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L3594:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3587:					
						
	move.l 154(a4),d0			
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcs _?L3590				
						
	moveq #7,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbne _?L3591				
_?L3546:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L3548				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #8,d1				
	move.l d1,154(a4)			
	move.l 36(sp),a1			
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3553				
_?L3548:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L3556				
	jbra _?L3592				
_?L3590:					
						
	subq.l #8,d0				
	jbne _?L3541				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3548				
_?L3553:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L3554				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L3554:					
						
	moveq #9,d0				
	move.l d0,154(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3588				
_?L3557:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3591:					
						
	subq.l #6,d0				
	jbne _?L3547				
_?L3550:					
						
	pea 32.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L3548				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #7,d0				
	move.l d0,154(a4)			
	move.l 36(sp),a1			
	jbra _?L3546				
_?L3536:					
						
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3588				
_?L3589:					
	lea _miniflac_sync_internal,a3		
_?L3530:					
	moveq #6,d0				
	cmp.l 114(a4),d0			
	jbeq _?L3593				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3528				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3530				
	moveq #-1,d4				
_?L3596:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3594				
_?L3547:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3550				
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbeq _?L3552				
	jbra _?L3586				
_?L3593:					
						
	move.l 154(a4),d0			
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcs _?L3595				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_colordepth	
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3528				
_?L3533:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3558				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L3535				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L3535:					
						
	moveq #9,d0				
	move.l d0,154(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3594				
_?L3595:					
						
	subq.l #8,d0				
	jbeq _?L3533				
						
	moveq #-1,d4				
	jbra _?L3596				
_?L3558:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3594				
_?L3586:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3588				
						
	.align	2				
	.globl	_miniflac_picture_length	
						
_miniflac_picture_length:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L3598				
						
	tst.l 60(sp)				
	jbeq _?L3629				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3650				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3650:					
	move.l 4(a4),d0				
_?L3598:					
						
	subq.l #1,d0				
	jbeq _?L3651				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L3628:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3606				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L3607:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3610				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3607				
_?L3608:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L3652				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L3628				
_?L3658:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L3654:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3610:					
	moveq #6,d1				
	cmp.l 114(a4),d1			
	jbeq _?L3653				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3608				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3610				
_?L3611:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3654				
_?L3651:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3601:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3655				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3601				
_?L3602:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L3660:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3653:					
						
	move.l 154(a4),d0			
						
	moveq #8,d1				
	cmp.l d0,d1				
	jbcs _?L3656				
						
	moveq #8,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbne _?L3657				
_?L3616:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L3619				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #9,d0				
	move.l d0,154(a4)			
	move.l 36(sp),a1			
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3625				
_?L3619:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L3628				
	jbra _?L3658				
_?L3656:					
						
	moveq #9,d1				
	cmp.l d0,d1				
	jbne _?L3611				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3619				
_?L3625:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,158(a4)			
						
	clr.l 162(a4)				
						
	tst.l 68(sp)				
	jbeq _?L3626				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L3626:					
						
	moveq #10,d0				
	move.l d0,154(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3654				
_?L3629:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3657:					
						
	moveq #7,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbeq _?L3617				
						
	subq.l #6,d0				
	jbeq _?L3621				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3608				
_?L3621:					
						
	pea 32.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L3619				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #7,d0				
	move.l d0,154(a4)			
	move.l 36(sp),a1			
_?L3617:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L3619				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #8,d1				
	move.l d1,154(a4)			
	move.l 36(sp),a1			
	jbra _?L3616				
_?L3606:					
						
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3654				
_?L3655:					
	lea _miniflac_sync_internal,a3		
_?L3604:					
	moveq #6,d0				
	cmp.l 114(a4),d0			
	jbeq _?L3659				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3602				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3604				
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3660				
_?L3659:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_length	
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3660				
_?L3652:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3654				
						
	.align	2				
	.globl	_miniflac_picture_data		
						
_miniflac_picture_data:				
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L3662				
						
	tst.l 64(sp)				
	jbeq _?L3728				
	subq.l #4,sp				
	move.l 64(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3765				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3765:					
	move.l 4(a3),d0				
_?L3662:					
						
	subq.l #1,d0				
	jbeq _?L3766				
						
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l 60(sp),60(a3)			
	move.l 64(sp),56(a3)			
	clr.l 52(a3)				
	moveq #48,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a5	
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
	lea _miniflac_oggfunction_end,a6	
_?L3727:					
	move.l d5,-(sp)				
	pea 48(sp)				
	move.l 68(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3683				
	move.l 44(sp),28(a3)			
	move.l 48(sp),24(a3)			
	clr.l 20(a3)				
_?L3684:					
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3687				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3684				
_?L3685:					
	move.l 20(a3),d1			
_?L3689:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbne _?L3767				
_?L3700:					
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3727				
_?L3775:					
	clr.l d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L3769:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3687:					
	moveq #6,d0				
	cmp.l 114(a3),d0			
	jbeq _?L3768				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3685				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3687				
_?L3690:					
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3769				
_?L3766:					
	move.l 60(sp),28(a3)			
	move.l 64(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L3665:					
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L3770				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L3665				
_?L3666:					
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
_?L3779:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3768:					
						
	move.l 154(a3),d0			
						
	moveq #9,d1				
	cmp.l d0,d1				
	jbcs _?L3771				
						
	moveq #9,d1				
	move.l #_miniflac_bitreader_fill_nocrc,d6
	cmp.l d0,d1				
	jbne _?L3772				
_?L3696:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3698				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d1,d0				
						
	move.l d1,158(a3)			
						
	clr.l 162(a3)				
						
	moveq #10,d1				
	move.l d1,154(a3)			
						
	tst.l d0				
	jbeq _?L3694				
	sub.l a1,a1				
	tst.l 72(sp)				
	jbeq _?L3773				
_?L3703:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L3774				
						
	move.l 20(a3),36(sp)			
						
	move.l 36(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L3706				
	move.l d1,d2				
	move.l d1,a2				
						
	move.l 28(a3),a0			
						
	addq.l #1,d2				
	move.l d2,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d6,d2				
	move.l d7,d1				
	or.b (a0,a2.l),d1			
	move.l d1,36(sp)			
						
	addq.l #1,32(a3)			
_?L3714:					
						
	move.b d0,16(a3)			
						
	clr.l d6				
	move.b d0,d6				
						
	jbeq _?L3730				
						
	move.w #64,a2				
	sub.l d6,a2				
						
	moveq #32,d0				
	sub.l d6,d0				
	jbmi _?L3717				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,a0				
	clr.l d7				
						
	and.l d2,d7				
	move.l a0,d0				
	and.l 36(sp),d0				
_?L3716:					
	move.l d7,8(a3)				
	move.l d0,12(a3)			
						
	cmp.l 76(sp),a1				
	jbcc _?L3719				
						
	move.w #-32,a0				
	add.l d6,a0				
	tst.l a0				
	jblt _?L3720				
	move.l a0,d0				
	lsr.l d0,d2				
						
	move.l 72(sp),a0			
	move.b d2,(a0,a1.l)			
_?L3719:					
						
	move.l 162(a3),a1			
	addq.l #1,a1				
	move.l a1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l a1,d0				
	jbhi _?L3703				
_?L3702:					
						
	tst.l 80(sp)				
	jbeq _?L3762				
						
	move.l 76(sp),d1			
	cmp.l d1,d0				
	jbcc _?L3726				
	move.l d0,d1				
_?L3726:					
						
	move.l 80(sp),a2			
	move.l d1,(a2)				
_?L3762:					
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3769				
_?L3771:					
						
	moveq #10,d2				
	cmp.l d0,d2				
	jbne _?L3690				
						
	move.l 162(a3),a1			
						
	move.l 158(a3),d0			
						
	cmp.l d0,a1				
	jbeq _?L3694				
						
	jbcc _?L3702				
	tst.l 72(sp)				
	jbne _?L3703				
	jbra _?L3773				
_?L3706:					
						
	move.l 36(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3727				
	jbra _?L3775				
_?L3730:					
	clr.l d7				
	clr.l d0				
	jbra _?L3716				
_?L3717:					
						
	moveq #31,d0				
	sub.l a2,d0				
	moveq #-2,d7				
	lsl.l d0,d7				
	moveq #-1,d0				
	move.l a2,d1				
	lsr.l d1,d0				
	or.l d7,d0				
	move.l d0,a0				
	moveq #-1,d7				
	lsr.l d1,d7				
						
	and.l d2,d7				
	move.l a0,d0				
	and.l 36(sp),d0				
	jbra _?L3716				
_?L3720:					
						
	add.l d2,d2				
	moveq #31,d0				
	sub.l d6,d0				
	move.l d2,d7				
	lsl.l d0,d7				
	move.l 36(sp),d2			
	lsr.l d6,d2				
	or.l d7,d2				
						
	move.l 72(sp),a0			
	move.b d2,(a0,a1.l)			
	jbra _?L3719				
_?L3728:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3773:					
						
	move.w #-1,a1				
_?L3712:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L3776				
						
	move.l 20(a3),36(sp)			
						
	move.l 36(sp),d2			
	cmp.l 24(a3),d2				
	jbcc _?L3706				
	move.l d2,a2				
						
	move.l 28(a3),a0			
						
	addq.l #1,d2				
	move.l d2,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d6,d2				
	move.l d7,d1				
	or.b (a0,a2.l),d1			
	move.l d1,a0				
						
	addq.l #1,32(a3)			
_?L3705:					
						
	move.b d0,16(a3)			
						
	jbeq _?L3707				
						
	and.l #255,d0				
						
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d6				
	sub.l d0,d6				
	jbmi _?L3708				
	move.l a1,d0				
	lsr.l d6,d0				
	clr.l d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
_?L3761:					
						
	move.l 162(a3),d1			
	addq.l #1,d1				
	move.l d1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d1,d0				
	jbhi _?L3712				
	jbra _?L3702				
_?L3772:					
						
	subq.l #8,d0				
	jbne _?L3777				
_?L3697:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_fill_nocrc,d6
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3698				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #9,d0				
	move.l d0,154(a3)			
	jbra _?L3696				
_?L3707:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 162(a3),d1			
	addq.l #1,d1				
	move.l d1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d1,d0				
	jbhi _?L3712				
	jbra _?L3702				
_?L3708:					
						
	moveq #31,d0				
	sub.l d7,d0				
	moveq #-2,d6				
	lsl.l d0,d6				
	move.l a1,d0				
	lsr.l d7,d0				
	or.l d6,d0				
	move.l a1,d6				
	lsr.l d7,d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
	jbra _?L3761				
_?L3683:					
						
	move.l 52(a3),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3769				
_?L3770:					
	lea _miniflac_sync_internal,a4		
_?L3668:					
	moveq #6,d0				
	cmp.l 114(a3),d0			
	jbeq _?L3778				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3666				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3668				
	moveq #-1,d4				
_?L3781:					
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L3779				
_?L3774:					
						
	move.l 8(a3),d2				
	move.l 12(a3),36(sp)			
						
	subq.b #8,d0				
	jbra _?L3714				
_?L3698:					
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3727				
	jbra _?L3775				
_?L3777:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a3)				
	jbsr _miniflac_picture_read_colordepth	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3697				
						
	move.l 20(a3),d1			
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbeq _?L3700				
	jbra _?L3767				
_?L3776:					
						
	move.l 8(a3),d2				
	move.l 12(a3),a0			
						
	subq.b #8,d0				
	jbra _?L3705				
_?L3694:					
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
						
	moveq #2,d4				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3769				
_?L3778:					
						
	move.l 154(a3),d0			
						
	moveq #9,d1				
	cmp.l d0,d1				
	jbcs _?L3780				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a3)				
	jbsr _miniflac_picture_read_length	
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3666				
_?L3671:					
						
	move.l 162(a3),d4			
						
	move.l 158(a3),d5			
						
	cmp.l d4,d5				
	jbeq _?L3729				
						
	jbls _?L3673				
	move.l #_miniflac_bitreader_fill_nocrc,d6
						
	lea _miniflac_bitreader_read,a4		
	tst.l 72(sp)				
	jbeq _?L3676				
_?L3674:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d6,a2				
	jbsr (a2)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3675				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	cmp.l 76(sp),d4				
	jbcc _?L3679				
						
	move.l 72(sp),a0			
	move.b d1,(a0,d4.l)			
_?L3679:					
						
	move.l 162(a3),d4			
	addq.l #1,d4				
	move.l d4,162(a3)			
						
	move.l 158(a3),d5			
						
	cmp.l d4,d5				
	jbhi _?L3674				
_?L3673:					
						
	tst.l 80(sp)				
	jbeq _?L3681				
						
	move.l 76(sp),d0			
	cmp.l d0,d5				
	jbcc _?L3682				
	move.l d5,d0				
_?L3682:					
						
	move.l 80(sp),a2			
	move.l d0,(a2)				
_?L3681:					
						
	moveq #1,d4				
						
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L3779				
_?L3676:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3675				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 162(a3),d0			
	addq.l #1,d0				
	move.l d0,162(a3)			
						
	cmp.l d5,d0				
	jbcs _?L3676				
	jbra _?L3673				
_?L3780:					
						
	moveq #10,d2				
	cmp.l d0,d2				
	jbeq _?L3671				
						
	moveq #-1,d4				
	jbra _?L3781				
_?L3675:					
						
	clr.l d4				
						
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L3779				
_?L3729:					
						
	moveq #2,d4				
						
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L3779				
_?L3767:					
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3769				
						
	.align	2				
	.globl	_miniflac_cuesheet_catalog_length
						
_miniflac_cuesheet_catalog_length:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a6			
	move.l 56(sp),a4			
	move.l 60(sp),d5			
						
	move.l 4(a6),d0				
	jbne _?L3783				
						
	tst.l d5				
	jbeq _?L3805				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3814				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3814:					
	move.l 4(a6),d0				
_?L3783:					
						
	subq.l #1,d0				
	jbeq _?L3815				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l a4,60(a6)			
	move.l d5,56(a6)			
	clr.l 52(a6)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3804:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3793				
	move.l 40(sp),28(a6)			
	move.l 44(sp),24(a6)			
	clr.l 20(a6)				
_?L3794:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3797				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3794				
_?L3795:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	move.l 52(a6),d1			
	tst.l d0				
	jbne _?L3816				
	cmp.l d5,d1				
	jbcs _?L3804				
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L3818:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3797:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3817				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3795				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3797				
_?L3798:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3818				
_?L3815:					
	move.l a4,28(a6)			
	move.l d5,24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3786:					
	moveq #4,d1				
	cmp.l (a6),d1				
	jbeq _?L3819				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3786				
_?L3787:					
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
_?L3821:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3817:					
						
	tst.l 166(a6)				
	jbne _?L3798				
						
	tst.l 68(sp)				
	jbeq _?L3811				
						
	move.l 68(sp),a0			
	move.l #128,(a0)			
_?L3811:					
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3818				
_?L3805:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3793:					
	move.l 52(a6),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3818				
_?L3819:					
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3789:					
	moveq #5,d0				
	cmp.l 114(a6),d0			
	jbeq _?L3820				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3787				
	moveq #4,d1				
	cmp.l (a6),d1				
	jbeq _?L3789				
_?L3791:					
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3821				
_?L3820:					
						
	tst.l 166(a6)				
	jbne _?L3791				
						
	tst.l 68(sp)				
	jbeq _?L3792				
						
	move.l 68(sp),a0			
	move.l #128,(a0)			
_?L3792:					
						
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3821				
_?L3816:					
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3818				
						
	.align	2				
	.globl	_miniflac_cuesheet_catalog_string
						
_miniflac_cuesheet_catalog_string:		
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
	move.l 60(sp),a4			
	move.l 64(sp),d3			
	move.l 68(sp),36(sp)			
	move.l 72(sp),d4			
	move.l 76(sp),d5			
	move.l 80(sp),d6			
						
	move.l 4(a3),d0				
	jbne _?L3823				
						
	tst.l d3				
	jbeq _?L3830				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d7				
						
	moveq #1,d0				
	cmp.l d7,d0				
	jbeq _?L3834				
	move.l d7,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3834:					
	move.l 4(a3),d0				
_?L3823:					
						
	subq.l #1,d0				
	jbeq _?L3835				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l a4,60(a3)			
	move.l d3,56(a3)			
	clr.l 52(a3)				
	lea _miniflac_oggfunction_start,a5	
	lea _miniflac_oggfunction_end,a6	
_?L3829:					
	pea 44(sp)				
	pea 44(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d7				
	moveq #1,d0				
	cmp.l d7,d0				
	jbne _?L3826				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l d4,-(sp)				
	pea 60(sp)				
	move.l 60(sp),-(sp)			
	move.l 60(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_cuesheet_catalog_string_native
	lea (28,sp),sp				
	move.l d0,d7				
	move.l 48(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	tst.l d7				
	jbne _?L3828				
	cmp.l d3,d1				
	jbcs _?L3829				
_?L3828:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L3836:					
	move.l d7,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3835:					
						
	move.l d6,80(sp)			
	move.l d5,76(sp)			
	move.l d4,72(sp)			
	move.l 36(sp),68(sp)			
	move.l d3,64(sp)			
	move.l a4,60(sp)			
	move.l a3,56(sp)			
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	jbra _miniflac_cuesheet_catalog_string_native
_?L3830:					
						
	clr.l d7				
						
	move.l d7,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3826:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L3836				
						
	.align	2				
	.globl	_miniflac_cuesheet_leadin	
						
_miniflac_cuesheet_leadin:			
	lea (-32,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 72(sp),a6			
						
	move.l 4(a6),d0				
	jbne _?L3838				
						
	tst.l 80(sp)				
	jbeq _?L3906				
	subq.l #4,sp				
	move.l 80(sp),a0			
	move.b (a0),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3942				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L3942:					
	move.l 4(a6),d0				
_?L3838:					
						
	subq.l #1,d0				
	jbeq _?L3943				
						
	clr.l 60(sp)				
	clr.l 64(sp)				
	move.l 76(sp),60(a6)			
	move.l 80(sp),56(a6)			
	clr.l 52(a6)				
	moveq #64,d6				
	add.l sp,d6				
	moveq #60,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a5	
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a4	
_?L3905:					
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l 84(sp),-(sp)			
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3874				
	move.l 60(sp),28(a6)			
	move.l 64(sp),24(a6)			
	clr.l 20(a6)				
_?L3875:					
	moveq #4,d2				
	cmp.l (a6),d2				
	jbeq _?L3878				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3875				
_?L3876:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,52(sp)			
	jbsr (a4)				
	addq.l #8,sp				
	move.l 44(sp),d0			
	jbne _?L3944				
	move.l 52(a6),d1			
	cmp.l 80(sp),d1				
	jbcs _?L3905				
_?L3948:					
	clr.l d4				
	move.l 84(sp),a0			
	move.l d1,(a0)				
_?L3946:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L3878:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3945				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d7				
	cmp.l d0,d7				
	jbne _?L3876				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3878				
_?L3879:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d4				
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L3946				
_?L3943:					
	move.l 76(sp),28(a6)			
	move.l 80(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3841:					
	moveq #4,d5				
	cmp.l (a6),d5				
	jbeq _?L3947				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L3841				
_?L3939:					
	move.l 20(a6),d2			
_?L3842:					
	move.l 84(sp),a0			
	move.l d2,(a0)				
_?L3952:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L3945:					
						
	move.l 166(a6),d0			
						
	jbeq _?L3881				
	subq.l #1,d0				
	jbne _?L3879				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3902				
_?L3950:					
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 80(sp),d1				
	jbcs _?L3905				
	jbra _?L3948				
_?L3881:					
						
	move.l 170(a6),a1			
						
	cmp.w #128,a1				
	jbcc _?L3884				
						
	move.b 16(a6),d7			
	move.w d7,a2				
_?L3885:					
						
	move.w a2,d7				
	cmp.b #7,d7				
	jbhi _?L3949				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L3895				
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a6)			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,40(sp)			
	move.l d1,d7				
	move.l 28(a6),a0			
	or.b (a0,d2.l),d7			
	move.l d7,d2				
						
	addq.l #1,32(a6)			
	move.w a2,d7				
_?L3886:					
						
	move.b d7,16(a6)			
						
	jbeq _?L3916				
						
	clr.l d0				
	move.b d7,d0				
						
	move.w #64,a0				
	sub.l d0,a0				
						
	moveq #32,d1				
	sub.l d0,d1				
	move.l d1,52(sp)			
	jbmi _?L3890				
	move.l d1,d0				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,36(sp)			
	clr.l 52(sp)				
						
	move.l 52(sp),d0			
	and.l 40(sp),d0				
	move.l d0,a0				
	move.l 36(sp),d1			
	and.l d2,d1				
_?L3889:					
	move.l a0,8(a6)				
	move.l d1,12(a6)			
						
	addq.l #1,a1				
	move.l a1,170(a6)			
						
	cmp.w #128,a1				
	jbeq _?L3884				
	move.w a2,d1				
	cmp.b #7,d1				
	jbhi _?L3917				
						
	move.l 24(a6),a2			
						
	clr.l d1				
	move.b d7,d1				
	moveq #64,d2				
	sub.l d1,d2				
						
	moveq #32,d0				
	sub.l d1,d0				
	jbmi _?L3893				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,52(sp)			
	clr.l 48(sp)				
_?L3899:					
						
	move.l 20(a6),d2			
						
	cmp.l d2,a2				
	jbls _?L3895				
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a6)			
						
	move.l 28(a6),a0			
	move.b (a0,d2.l),d2			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
						
	addq.l #1,32(a6)			
						
	move.b d7,16(a6)			
						
	jbeq _?L3896				
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	or.b d2,d1				
						
	move.l 48(sp),d2			
	and.l d0,d2				
	move.l d2,8(a6)				
	and.l 52(sp),d1				
	move.l d1,12(a6)			
						
	addq.l #1,a1				
	move.l a1,170(a6)			
						
	cmp.w #128,a1				
	jbne _?L3899				
_?L3884:					
						
	clr.l 170(a6)				
						
	moveq #1,d0				
	move.l d0,166(a6)			
_?L3953:					
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3950				
_?L3902:					
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 88(sp)				
	jbeq _?L3903				
						
	move.l 88(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L3903:					
						
	moveq #2,d0				
	move.l d0,166(a6)			
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L3946				
_?L3906:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L3895:					
	move.l d2,-(sp)				
	move.l a6,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 80(sp),d1				
	jbcs _?L3905				
	jbra _?L3948				
_?L3874:					
	move.l 52(a6),d1			
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L3946				
_?L3947:					
	lea _miniflac_sync_internal,a3		
_?L3844:					
	moveq #5,d0				
	cmp.l 114(a6),d0			
	jbeq _?L3951				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d6				
	cmp.l d0,d6				
	jbne _?L3939				
	moveq #4,d7				
	cmp.l (a6),d7				
	jbeq _?L3844				
_?L3848:					
	move.l 20(a6),d2			
						
	moveq #-1,d4				
						
	move.l 84(sp),a0			
	move.l d2,(a0)				
	jbra _?L3952				
_?L3949:					
						
	move.w a2,d7				
	subq.b #8,d7				
						
	move.l 8(a6),40(sp)			
	move.l 12(a6),d2			
	jbra _?L3886				
_?L3916:					
	sub.l a0,a0				
	clr.l d1				
	jbra _?L3889				
_?L3896:					
						
	clr.l 8(a6)				
	clr.l 12(a6)				
						
	addq.l #1,a1				
	move.l a1,170(a6)			
						
	cmp.w #128,a1				
	jbne _?L3899				
						
	clr.l 170(a6)				
						
	moveq #1,d0				
	move.l d0,166(a6)			
	jbra _?L3953				
_?L3893:					
						
	move.w #-1,a0				
	moveq #31,d0				
	sub.l d2,d0				
	moveq #-2,d1				
	lsl.l d0,d1				
	move.l a0,d0				
	lsr.l d2,d0				
	move.l d0,52(sp)			
	or.l d1,52(sp)				
	move.l d0,48(sp)			
	jbra _?L3899				
_?L3890:					
	moveq #31,d1				
	sub.l a0,d1				
	move.l d1,52(sp)			
	moveq #-2,d1				
	move.l 52(sp),d0			
	lsl.l d0,d1				
	move.l d1,56(sp)			
	moveq #-1,d1				
	move.l a0,d0				
	lsr.l d0,d1				
	move.l d1,36(sp)			
	move.l 56(sp),d1			
	or.l d1,36(sp)				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,52(sp)			
						
	move.l 52(sp),d0			
	and.l 40(sp),d0				
	move.l d0,a0				
	move.l 36(sp),d1			
	and.l d2,d1				
	jbra _?L3889				
_?L3951:					
						
	move.l 166(a6),d0			
						
	jbeq _?L3847				
	subq.l #1,d0				
	jbne _?L3848				
						
	move.b 16(a6),d4			
_?L3849:					
						
	cmp.b #63,d4				
	jbhi _?L3871				
	move.l 24(a6),a0			
_?L3865:					
						
	move.l 20(a6),d5			
						
	cmp.l a0,d5				
	jbcc _?L3909				
						
	move.l 28(a6),a1			
						
	move.l d5,d2				
	addq.l #1,d2				
	move.l d2,20(a6)			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,a2				
	move.l d1,d7				
	or.b (a1,d5.l),d7			
	move.l d7,a3				
						
	move.l a2,8(a6)				
	move.l a3,12(a6)			
						
	move.b d4,d0				
	addq.b #8,d0				
	move.b d0,16(a6)			
						
	move.l 32(a6),d6			
						
	move.l d6,d1				
	addq.l #1,d1				
	move.l d1,32(a6)			
						
	cmp.b #63,d0				
	jbhi _?L3871				
	cmp.l d2,a0				
	jbls _?L3938				
						
	move.l d5,d7				
	addq.l #2,d7				
	move.l d7,20(a6)			
						
	move.l a2,d0				
	move.l a3,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,a4				
	move.l d1,a5				
						
	move.l a4,a2				
	or.b (a1,d2.l),d1			
	move.l d1,a3				
						
	move.l a2,8(a6)				
	move.l a3,12(a6)			
						
	move.b d4,d0				
	add.b #16,d0				
	move.b d0,16(a6)			
						
	move.l d6,d1				
	addq.l #2,d1				
	move.l d1,32(a6)			
						
	cmp.b #63,d0				
	jbhi _?L3871				
	cmp.l d7,a0				
	jbls _?L3915				
						
	addq.l #2,d2				
	move.l d2,20(a6)			
						
	move.l a2,d0				
	move.l a3,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,a4				
	move.l d1,a5				
						
	move.l a4,a2				
	or.b (a1,d7.l),d1			
	move.l d1,a3				
						
	move.l a2,8(a6)				
	move.l a3,12(a6)			
						
	move.b d4,d0				
	add.b #24,d0				
	move.b d0,16(a6)			
						
	move.l d6,d1				
	addq.l #3,d1				
	move.l d1,32(a6)			
						
	cmp.b #63,d0				
	jbhi _?L3871				
	cmp.l d2,a0				
	jbls _?L3938				
						
	addq.l #2,d7				
	move.l d7,20(a6)			
						
	move.l a2,d0				
	move.l a3,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,a4				
	move.l d1,a5				
						
	move.l a4,a2				
	or.b (a1,d2.l),d1			
	move.l d1,a3				
						
	move.l a2,8(a6)				
	move.l a3,12(a6)			
						
	move.b d4,d0				
	add.b #32,d0				
	move.b d0,16(a6)			
						
	move.l d6,d1				
	addq.l #4,d1				
	move.l d1,32(a6)			
						
	cmp.b #63,d0				
	jbhi _?L3871				
	cmp.l d7,a0				
	jbls _?L3915				
						
	addq.l #2,d2				
	move.l d2,20(a6)			
						
	move.l a2,d0				
	move.l a3,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,a4				
	move.l d1,a5				
						
	move.l a4,a2				
	or.b (a1,d7.l),d1			
	move.l d1,a3				
						
	move.l a2,8(a6)				
	move.l a3,12(a6)			
						
	move.b d4,d0				
	add.b #40,d0				
	move.b d0,16(a6)			
						
	move.l d6,d1				
	addq.l #5,d1				
	move.l d1,32(a6)			
						
	cmp.b #63,d0				
	jbhi _?L3871				
	cmp.l d2,a0				
	jbls _?L3938				
						
	addq.l #2,d7				
	move.l d7,20(a6)			
						
	move.l a2,d0				
	move.l a3,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,a4				
	move.l d1,a5				
						
	move.l a4,a2				
	or.b (a1,d2.l),d1			
	move.l d1,a3				
						
	move.l a2,8(a6)				
	move.l a3,12(a6)			
						
	move.b d4,d0				
	add.b #48,d0				
	move.b d0,16(a6)			
						
	move.l d6,d1				
	addq.l #6,d1				
	move.l d1,32(a6)			
						
	cmp.b #63,d0				
	jbhi _?L3871				
	cmp.l d7,a0				
	jbls _?L3915				
						
	addq.l #2,d2				
	move.l d2,20(a6)			
						
	move.l a2,d0				
	move.l a3,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,a4				
	move.l d1,a5				
						
	move.l a4,a2				
	or.b (a1,d7.l),d1			
	move.l d1,a3				
						
	move.l a2,8(a6)				
	move.l a3,12(a6)			
						
	move.b d4,d0				
	add.b #56,d0				
	move.b d0,16(a6)			
						
	move.l d6,d1				
	addq.l #7,d1				
	move.l d1,32(a6)			
						
	cmp.b #63,d0				
	jbhi _?L3871				
	cmp.l d2,a0				
	jbls _?L3938				
						
	addq.l #8,d5				
	move.l d5,20(a6)			
						
	move.b (a1,d2.l),d2			
	and.l #255,d2				
						
	move.l a2,d0				
	move.l a3,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	clr.l d5				
	or.l d0,d5				
	move.l d5,8(a6)				
	or.l d1,d2				
	move.l d2,12(a6)			
						
	add.b #64,d4				
	move.b d4,16(a6)			
						
	addq.l #8,d6				
	move.l d6,32(a6)			
_?L3871:					
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 88(sp)				
	jbeq _?L3870				
						
	move.l 88(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L3870:					
						
	moveq #2,d0				
	move.l d0,166(a6)			
						
	move.l 20(a6),d2			
	moveq #1,d4				
	move.l 84(sp),a0			
	move.l d2,(a0)				
	jbra _?L3952				
_?L3915:					
						
	move.l d7,d2				
_?L3938:					
						
	clr.l d4				
						
	move.l 84(sp),a0			
	move.l d2,(a0)				
	jbra _?L3952				
_?L3847:					
						
	move.l 170(a6),d5			
						
	move.b 16(a6),d4			
						
	cmp.l #128,d5				
	jbcc _?L3851				
	addq.l #1,d5				
	move.b d4,d7				
						
	moveq #-1,d6				
	move.w #-2,a1				
_?L3858:					
						
	cmp.b #7,d4				
	jbhi _?L3954				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L3938				
						
	move.l 28(a6),a0			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a6)			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,a2				
	move.l d1,a3				
						
	or.b (a0,d2.l),d1			
	move.l d1,a0				
						
	addq.l #1,32(a6)			
_?L3852:					
						
	move.b d4,16(a6)			
						
	jbeq _?L3907				
						
	clr.l d0				
	move.b d4,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L3855				
	move.l d6,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	move.l a2,d2				
	and.l d2,d1				
	move.l a0,d2				
	and.l d2,d0				
_?L3854:					
	move.l d1,8(a6)				
	move.l d0,12(a6)			
						
	move.l d5,170(a6)			
						
	cmp.l #128,d5				
	jbeq _?L3851				
	move.l d5,d0				
	addq.l #1,d0				
	cmp.b #7,d7				
	jbhi _?L3908				
						
	move.l 24(a6),a0			
						
	clr.l d2				
	move.b d4,d2				
	moveq #64,d0				
	sub.l d2,d0				
						
	moveq #32,d1				
	sub.l d2,d1				
	jbmi _?L3859				
	moveq #-1,d6				
	lsr.l d1,d6				
	clr.l d7				
_?L3866:					
						
	move.l 20(a6),d2			
						
	cmp.l a0,d2				
	jbcc _?L3938				
						
	move.l 28(a6),a1			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a6)			
						
	move.b (a1,d2.l),d2			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
						
	addq.l #1,32(a6)			
						
	move.b d4,16(a6)			
						
	jbeq _?L3862				
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	or.b d2,d1				
						
	move.l d7,d2				
	and.l d0,d2				
	move.l d2,8(a6)				
	and.l d6,d1				
	move.l d1,12(a6)			
						
	addq.l #1,d5				
	move.l d5,170(a6)			
						
	cmp.l #128,d5				
	jbne _?L3866				
_?L3851:					
						
	clr.l 170(a6)				
						
	moveq #1,d6				
	move.l d6,166(a6)			
	jbra _?L3849				
_?L3917:					
						
	move.w d7,a2				
	jbra _?L3885				
_?L3954:					
						
	subq.b #8,d4				
						
	move.l 8(a6),a2				
	move.l 12(a6),a0			
	jbra _?L3852				
_?L3862:					
						
	clr.l 8(a6)				
	clr.l 12(a6)				
						
	addq.l #1,d5				
	move.l d5,170(a6)			
						
	cmp.l #128,d5				
	jbne _?L3866				
						
	clr.l 170(a6)				
						
	moveq #1,d5				
	move.l d5,166(a6)			
	jbra _?L3865				
_?L3859:					
						
	moveq #-1,d7				
	moveq #31,d2				
	sub.l d0,d2				
	moveq #-2,d1				
	lsl.l d2,d1				
	move.l d7,d6				
	lsr.l d0,d6				
	or.l d1,d6				
	lsr.l d0,d7				
	jbra _?L3866				
_?L3907:					
	clr.l d1				
	clr.l d0				
	jbra _?L3854				
_?L3908:					
						
	move.l d0,d5				
	move.b d4,d7				
	jbra _?L3858				
_?L3855:					
						
	moveq #31,d0				
	sub.l d2,d0				
	move.l a1,d1				
	lsl.l d0,d1				
	move.l d6,d0				
	lsr.l d2,d0				
	or.l d1,d0				
	move.l d6,d1				
	lsr.l d2,d1				
						
	move.l a2,d2				
	and.l d2,d1				
	move.l a0,d2				
	and.l d2,d0				
	jbra _?L3854				
_?L3944:					
						
	move.l 52(a6),d1			
	move.l d0,d4				
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L3946				
_?L3909:					
						
	move.l d5,d2				
						
	clr.l d4				
						
	move.l 84(sp),a0			
	move.l d2,(a0)				
	jbra _?L3952				
						
	.align	2				
	.globl	_miniflac_cuesheet_cd_flag	
						
_miniflac_cuesheet_cd_flag:			
	lea (-20,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 60(sp),a4			
	move.l 64(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L3956				
						
	tst.l 68(sp)				
	jbeq _?L4017				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4059				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L4059:					
	move.l 4(a4),d0				
_?L3956:					
						
	subq.l #1,d0				
	jbeq _?L4060				
						
	clr.l 48(sp)				
	clr.l 52(sp)				
	move.l d5,60(a4)			
	move.l 68(sp),56(a4)			
	clr.l 52(a4)				
	moveq #52,d7				
	add.l sp,d7				
	moveq #48,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L4016:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3992				
	move.l 48(sp),28(a4)			
	move.l 52(sp),24(a4)			
	clr.l 20(a4)				
_?L3993:					
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L3996				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3993				
_?L3994:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L4061				
	move.l 52(a4),d1			
	cmp.l 68(sp),d1				
	jbcs _?L4016				
_?L4068:					
	clr.l d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
_?L4063:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L3996:					
	moveq #5,d0				
	cmp.l 114(a4),d0			
	jbeq _?L4062				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3994				
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L3996				
_?L3997:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L4063				
_?L4060:					
	move.l d5,28(a4)			
	move.l 68(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3959:					
	moveq #4,d6				
	cmp.l (a4),d6				
	jbeq _?L4064				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L3959				
_?L4054:					
	move.l 20(a4),d2			
_?L3960:					
	move.l 72(sp),a0			
	move.l d2,(a0)				
_?L4070:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L4062:					
						
	move.l 166(a4),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L4065				
						
	subq.l #1,d0				
	jbeq _?L4066				
						
	move.l 170(a4),d0			
						
	cmp.l #128,d0				
	jbcc _?L4067				
	addq.l #1,d0				
	move.l d0,40(sp)			
	move.l #_miniflac_bitreader_fill_nocrc,44(sp)
_?L4005:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l 52(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4056				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l 40(sp),170(a4)			
						
	addq.l #1,40(sp)			
	cmp.l #129,40(sp)			
	jbne _?L4005				
						
	clr.l 170(a4)				
						
	moveq #1,d2				
	move.l d2,166(a4)			
_?L4002:					
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l 52(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4056				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d0				
	move.l d0,166(a4)			
						
	pea 1.w					
	move.l d3,-(sp)				
	move.l 52(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L4009				
_?L4056:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 68(sp),d1				
	jbcs _?L4016				
	jbra _?L4068				
_?L4065:					
						
	subq.l #2,d0				
	jbne _?L3997				
	move.l #_miniflac_bitreader_fill_nocrc,44(sp)
						
	pea 1.w					
	move.l d3,-(sp)				
	move.l 52(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4056				
_?L4009:					
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 76(sp)				
	jbeq _?L4010				
						
	move.l 76(sp),a0			
	move.b d1,(a0)				
_?L4010:					
						
	move.b 16(a4),d0			
	cmp.b #6,d0				
	jbls _?L4011				
						
	subq.b #7,d0				
	move.b d0,16(a4)			
						
	jbeq _?L4021				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L4013				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	moveq #3,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
_?L4071:					
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L4063				
_?L4017:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L4066:					
	move.l #_miniflac_bitreader_fill_nocrc,44(sp)
	jbra _?L4002				
_?L3992:					
	move.l 52(a4),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L4063				
_?L4064:					
	lea _miniflac_sync_internal,a3		
_?L3962:					
	moveq #5,d2				
	cmp.l 114(a4),d2			
	jbeq _?L4069				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4054				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3962				
	move.l 20(a4),d2			
						
	moveq #-1,d4				
_?L4074:					
						
	move.l 72(sp),a0			
	move.l d2,(a0)				
	jbra _?L4070				
_?L4021:					
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	moveq #3,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	jbra _?L4071				
_?L4069:					
						
	move.l 166(a4),d0			
						
	moveq #1,d6				
	cmp.l d0,d6				
	jbcs _?L4072				
						
	subq.l #1,d0				
	jbeq _?L3967				
						
	move.l 170(a4),d4			
						
	cmp.l #128,d4				
	jbcc _?L3968				
						
	move.b 16(a4),d5			
_?L3969:					
						
	cmp.b #7,d5				
	jbhi _?L4073				
						
	move.l 20(a4),d2			
						
	cmp.l 24(a4),d2				
	jbcc _?L4052				
						
	move.l 28(a4),a1			
						
	move.l d2,d6				
	addq.l #1,d6				
	move.l d6,20(a4)			
						
	move.l 8(a4),d0				
	move.l 12(a4),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,a2				
	move.l d1,d6				
	or.b (a1,d2.l),d6			
	move.l d6,a1				
						
	addq.l #1,32(a4)			
	move.b d5,d0				
_?L3970:					
						
	move.b d0,16(a4)			
						
	jbeq _?L4018				
						
	clr.l d1				
	move.b d0,d1				
						
	moveq #64,d6				
	sub.l d1,d6				
						
	moveq #32,d2				
	sub.l d1,d2				
	jbmi _?L3973				
	moveq #-1,d1				
	lsr.l d2,d1				
	clr.l d2				
						
	move.l a2,d6				
	and.l d6,d2				
	move.l a1,d6				
	and.l d6,d1				
_?L3972:					
	move.l d2,8(a4)				
	move.l d1,12(a4)			
						
	addq.l #1,d4				
	move.l d4,170(a4)			
						
	cmp.l #128,d4				
	jbeq _?L3968				
	cmp.b #7,d5				
	jbhi _?L4019				
						
	move.l 24(a4),d1			
						
	clr.l d5				
	move.b d0,d5				
	moveq #64,d2				
	sub.l d5,d2				
						
	moveq #32,d6				
	sub.l d5,d6				
	jbmi _?L3976				
	moveq #-1,d5				
	lsr.l d6,d5				
	sub.l a2,a2				
_?L3982:					
						
	move.l 20(a4),d2			
						
	cmp.l d1,d2				
	jbcc _?L4052				
						
	move.l 28(a4),a1			
						
	move.l d2,d6				
	addq.l #1,d6				
	move.l d6,20(a4)			
						
	move.b (a1,d2.l),d2			
						
	move.l 8(a4),d6				
	move.l 12(a4),d7			
						
	addq.l #1,32(a4)			
						
	move.b d0,16(a4)			
						
	jbeq _?L3979				
						
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	or.b d2,d7				
						
	move.l a2,d2				
	and.l d6,d2				
	move.l d2,8(a4)				
	and.l d5,d7				
	move.l d7,12(a4)			
						
	addq.l #1,d4				
	move.l d4,170(a4)			
						
	cmp.l #128,d4				
	jbne _?L3982				
_?L3968:					
						
	clr.l 170(a4)				
						
	moveq #1,d6				
	move.l d6,166(a4)			
_?L3967:					
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_fill_nocrc,52(sp)
	lea _miniflac_bitreader_fill_nocrc,a0	
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4053				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d0				
	move.l d0,166(a4)			
_?L3966:					
						
	pea 1.w					
	move.l d3,-(sp)				
	move.l 52(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4053				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 76(sp)				
	jbeq _?L3987				
						
	move.l 76(sp),a0			
	move.b d1,(a0)				
_?L3987:					
						
	move.b 16(a4),d0			
	cmp.b #6,d0				
	jbls _?L4011				
						
	subq.b #7,d0				
	move.b d0,16(a4)			
						
	jbeq _?L4020				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L3990				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	moveq #3,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),d2			
	moveq #1,d4				
_?L4075:					
	move.l 72(sp),a0			
	move.l d2,(a0)				
	jbra _?L4070				
_?L4072:					
	move.l #_miniflac_bitreader_fill_nocrc,44(sp)
						
	subq.l #2,d0				
	jbeq _?L3966				
						
	move.l 20(a4),d2			
						
	moveq #-1,d4				
	jbra _?L4074				
_?L4013:					
						
	moveq #-1,d1				
	moveq #31,d0				
	sub.l d2,d0				
	moveq #-2,d3				
	lsl.l d0,d3				
	move.l d1,d0				
	lsr.l d2,d0				
	or.l d3,d0				
	lsr.l d2,d1				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	moveq #3,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	jbra _?L4071				
_?L4053:					
	move.l 20(a4),d2			
_?L4052:					
						
	clr.l d4				
						
	move.l 72(sp),a0			
	move.l d2,(a0)				
	jbra _?L4070				
_?L4073:					
						
	move.b d5,d0				
	subq.b #8,d0				
						
	move.l 8(a4),a2				
	move.l 12(a4),a1			
	jbra _?L3970				
_?L3990:					
						
	moveq #-1,d1				
	moveq #31,d0				
	sub.l d2,d0				
	moveq #-2,d3				
	lsl.l d0,d3				
	move.l d1,d0				
	lsr.l d2,d0				
	or.l d3,d0				
	lsr.l d2,d1				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	moveq #3,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),d2			
	moveq #1,d4				
	jbra _?L4075				
_?L4020:					
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	moveq #3,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),d2			
	moveq #1,d4				
	jbra _?L4075				
_?L4067:					
	move.l #_miniflac_bitreader_fill_nocrc,44(sp)
						
	clr.l 170(a4)				
						
	moveq #1,d2				
	move.l d2,166(a4)			
	jbra _?L4002				
_?L4061:					
						
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L4063				
_?L4011:					
	jbsr (_miniflac_bitreader_discard?part?0)
_?L3979:					
						
	clr.l 8(a4)				
	clr.l 12(a4)				
						
	addq.l #1,d4				
	move.l d4,170(a4)			
						
	cmp.l #128,d4				
	jbne _?L3982				
						
	clr.l 170(a4)				
						
	moveq #1,d6				
	move.l d6,166(a4)			
	jbra _?L3967				
_?L3976:					
						
	moveq #-1,d7				
	moveq #31,d5				
	sub.l d2,d5				
	moveq #-2,d6				
	lsl.l d5,d6				
	move.l d7,d5				
	lsr.l d2,d5				
	or.l d6,d5				
	lsr.l d2,d7				
	move.l d7,a2				
	jbra _?L3982				
_?L4019:					
						
	move.b d0,d5				
	jbra _?L3969				
_?L3973:					
						
	moveq #-1,d2				
	moveq #31,d1				
	sub.l d6,d1				
	moveq #-2,d7				
	lsl.l d1,d7				
	move.l d2,d1				
	lsr.l d6,d1				
	or.l d7,d1				
	lsr.l d6,d2				
						
	move.l a2,d6				
	and.l d6,d2				
	move.l a1,d6				
	and.l d6,d1				
	jbra _?L3972				
_?L4018:					
	clr.l d2				
	clr.l d1				
	jbra _?L3972				
						
	.align	2				
	.globl	_miniflac_cuesheet_tracks	
						
_miniflac_cuesheet_tracks:			
	lea (-32,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 72(sp),a6			
						
	move.l 4(a6),d0				
	jbne _?L4077				
						
	tst.l 80(sp)				
	jbeq _?L4132				
	subq.l #4,sp				
	move.l 80(sp),a0			
	move.b (a0),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4165				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L4165:					
	move.l 4(a6),d0				
_?L4077:					
						
	subq.l #1,d0				
	jbeq _?L4166				
						
	clr.l 60(sp)				
	clr.l 64(sp)				
	move.l 76(sp),60(a6)			
	move.l 80(sp),56(a6)			
	clr.l 52(a6)				
	moveq #64,d6				
	add.l sp,d6				
	moveq #60,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a4	
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a5	
_?L4131:					
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l 84(sp),-(sp)			
	move.l a6,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4085				
	move.l 60(sp),28(a6)			
	move.l 64(sp),24(a6)			
	clr.l 20(a6)				
_?L4086:					
	moveq #4,d2				
	cmp.l (a6),d2				
	jbeq _?L4089				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4086				
_?L4087:					
	move.l 20(a6),d1			
_?L4091:					
	move.l d1,-(sp)				
	move.l a6,-(sp)				
	move.l d0,52(sp)			
	jbsr (a5)				
	addq.l #8,sp				
	move.l 44(sp),d0			
	jbne _?L4167				
	move.l 52(a6),d1			
	cmp.l 80(sp),d1				
	jbcs _?L4131				
_?L4172:					
	clr.l d4				
	move.l 84(sp),a0			
	move.l d1,(a0)				
_?L4169:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L4089:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L4168				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d7				
	cmp.l d0,d7				
	jbne _?L4087				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4089				
_?L4092:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d4				
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L4169				
_?L4166:					
	move.l 76(sp),28(a6)			
	move.l 80(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4080:					
	moveq #4,d7				
	cmp.l (a6),d7				
	jbeq _?L4170				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L4080				
_?L4081:					
	move.l 84(sp),a0			
	move.l 20(a6),(a0)			
_?L4177:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L4168:					
						
	move.l 166(a6),d0			
						
	moveq #3,d2				
	cmp.l d0,d2				
	jbeq _?L4094				
	jbcs _?L4171				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbne _?L4159				
	move.l #_miniflac_bitreader_fill_nocrc,48(sp)
						
	pea 1.w					
	move.l d3,-(sp)				
	move.l 56(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L4106				
_?L4105:					
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 80(sp),d1				
	jbcs _?L4131				
	jbra _?L4172				
_?L4171:					
						
	subq.l #4,d0				
	jbne _?L4092				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4105				
_?L4128:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,175(a6)			
						
	tst.l 88(sp)				
	jbeq _?L4129				
						
	move.l 88(sp),a0			
	move.b d1,(a0)				
_?L4129:					
						
	clr.b 174(a6)				
						
	moveq #5,d0				
	move.l d0,166(a6)			
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L4169				
_?L4134:					
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,8(a6)				
	and.l d0,12(a6)				
						
	moveq #3,d0				
	move.l d0,166(a6)			
_?L4094:					
						
	move.l 170(a6),a1			
						
	cmp.w #257,a1				
	jbhi _?L4111				
						
	move.b 16(a6),d1			
	move.w d1,a2				
	addq.l #1,a1				
_?L4112:					
						
	move.w a2,d7				
	cmp.b #7,d7				
	jbhi _?L4173				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L4121				
						
	move.l d2,d7				
	addq.l #1,d7				
	move.l d7,20(a6)			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,40(sp)			
	move.l d1,d7				
	move.l 28(a6),a0			
	or.b (a0,d2.l),d7			
	move.l d7,d2				
						
	addq.l #1,32(a6)			
	move.w a2,d7				
_?L4113:					
						
	move.b d7,16(a6)			
						
	jbeq _?L4135				
						
	clr.l d0				
	move.b d7,d0				
						
	move.w #64,a0				
	sub.l d0,a0				
						
	moveq #32,d1				
	sub.l d0,d1				
	move.l d1,52(sp)			
	jbmi _?L4116				
	move.l d1,d0				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,36(sp)			
	clr.l 52(sp)				
						
	move.l 52(sp),d0			
	and.l 40(sp),d0				
	move.l d0,a0				
	move.l 36(sp),d1			
	and.l d2,d1				
_?L4115:					
	move.l a0,8(a6)				
	move.l d1,12(a6)			
						
	move.l a1,170(a6)			
						
	cmp.w #258,a1				
	jbeq _?L4111				
	move.l a1,d0				
	addq.l #1,d0				
	move.w a2,d1				
	cmp.b #7,d1				
	jbhi _?L4136				
						
	move.l 24(a6),a2			
						
	clr.l d1				
	move.b d7,d1				
	moveq #64,d2				
	sub.l d1,d2				
						
	moveq #32,d0				
	sub.l d1,d0				
	jbmi _?L4119				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,52(sp)			
	clr.l 48(sp)				
_?L4125:					
						
	move.l 20(a6),d2			
						
	cmp.l a2,d2				
	jbcc _?L4121				
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a6)			
						
	move.l 28(a6),a0			
	move.b (a0,d2.l),d2			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
						
	addq.l #1,32(a6)			
						
	move.b d7,16(a6)			
						
	jbeq _?L4122				
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	or.b d2,d1				
						
	move.l 48(sp),d2			
	and.l d0,d2				
	move.l d2,8(a6)				
	and.l 52(sp),d1				
	move.l d1,12(a6)			
						
	addq.l #1,a1				
	move.l a1,170(a6)			
						
	cmp.w #258,a1				
	jbne _?L4125				
_?L4111:					
						
	clr.l 170(a6)				
						
	moveq #4,d0				
	move.l d0,166(a6)			
_?L4178:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4105				
	jbra _?L4128				
_?L4132:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L4159:					
						
	subq.l #1,d0				
	jbeq _?L4174				
						
	move.l 170(a6),d0			
						
	cmp.l #128,d0				
	jbcc _?L4175				
	move.l d0,d7				
	addq.l #1,d7				
	move.l #_miniflac_bitreader_fill_nocrc,48(sp)
_?L4103:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l 56(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4105				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d7,170(a6)			
						
	addq.l #1,d7				
	cmp.l #129,d7				
	jbne _?L4103				
						
	clr.l 170(a6)				
						
	moveq #1,d7				
	move.l d7,166(a6)			
_?L4099:					
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l 56(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4105				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d0				
	move.l d0,166(a6)			
						
	pea 1.w					
	move.l d3,-(sp)				
	move.l 56(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4105				
	jbra _?L4106				
_?L4121:					
						
	move.l d2,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 80(sp),d1				
	jbcs _?L4131				
	jbra _?L4172				
_?L4085:					
	move.l 52(a6),d1			
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L4169				
_?L4173:					
						
	move.w a2,d7				
	subq.b #8,d7				
						
	move.l 8(a6),40(sp)			
	move.l 12(a6),d2			
	jbra _?L4113				
_?L4170:					
						
	lea _miniflac_sync_internal,a3		
_?L4083:					
	moveq #5,d2				
	cmp.l 114(a6),d2			
	jbeq _?L4176				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4081				
	moveq #4,d1				
	cmp.l (a6),d1				
	jbeq _?L4083				
	moveq #-1,d4				
	move.l 84(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L4177				
_?L4135:					
	sub.l a0,a0				
	clr.l d1				
	jbra _?L4115				
_?L4122:					
						
	clr.l 8(a6)				
	clr.l 12(a6)				
						
	addq.l #1,a1				
	move.l a1,170(a6)			
						
	cmp.w #258,a1				
	jbne _?L4125				
						
	clr.l 170(a6)				
						
	moveq #4,d0				
	move.l d0,166(a6)			
	jbra _?L4178				
_?L4119:					
						
	move.w #-1,a0				
	moveq #31,d0				
	sub.l d2,d0				
	moveq #-2,d1				
	lsl.l d0,d1				
	move.l a0,d0				
	lsr.l d2,d0				
	move.l d0,52(sp)			
	or.l d1,52(sp)				
	move.l d0,48(sp)			
	jbra _?L4125				
_?L4106:					
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b 16(a6),d0			
	cmp.b #6,d0				
	jbls _?L4179				
						
	subq.b #7,d0				
	move.b d0,16(a6)			
						
	jbeq _?L4134				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L4109				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,8(a6)				
	and.l d0,12(a6)				
						
	moveq #3,d0				
	move.l d0,166(a6)			
	jbra _?L4094				
_?L4116:					
						
	moveq #31,d1				
	sub.l a0,d1				
	move.l d1,52(sp)			
	moveq #-2,d1				
	move.l 52(sp),d0			
	lsl.l d0,d1				
	move.l d1,56(sp)			
	moveq #-1,d1				
	move.l a0,d0				
	lsr.l d0,d1				
	move.l d1,36(sp)			
	move.l 56(sp),d1			
	or.l d1,36(sp)				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,52(sp)			
						
	move.l 52(sp),d0			
	and.l 40(sp),d0				
	move.l d0,a0				
	move.l 36(sp),d1			
	and.l d2,d1				
	jbra _?L4115				
_?L4174:					
	move.l #_miniflac_bitreader_fill_nocrc,48(sp)
	jbra _?L4099				
_?L4176:					
						
	move.l 88(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_tracks	
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 84(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L4177				
_?L4136:					
						
	move.l d0,a1				
	move.w d7,a2				
	jbra _?L4112				
_?L4109:					
						
	moveq #-1,d1				
	moveq #31,d0				
	sub.l d2,d0				
	moveq #-2,d7				
	lsl.l d0,d7				
	move.l d1,d0				
	lsr.l d2,d0				
	or.l d7,d0				
	lsr.l d2,d1				
						
	and.l d1,8(a6)				
	and.l d0,12(a6)				
						
	moveq #3,d0				
	move.l d0,166(a6)			
	jbra _?L4094				
_?L4175:					
	move.l #_miniflac_bitreader_fill_nocrc,48(sp)
						
	clr.l 170(a6)				
						
	moveq #1,d7				
	move.l d7,166(a6)			
	jbra _?L4099				
_?L4179:					
	jbsr (_miniflac_bitreader_discard?part?0)
_?L4167:					
						
	move.l 52(a6),d1			
	move.l d0,d4				
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L4169				
						
	.align	2				
	.globl	_miniflac_cuesheet_track_offset	
						
_miniflac_cuesheet_track_offset:		
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a6			
	move.l 60(sp),a4			
	move.l 64(sp),d5			
						
	move.l 4(a6),d0				
	jbne _?L4181				
						
	tst.l d5				
	jbeq _?L4243				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4292				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4292:					
	move.l 4(a6),d0				
_?L4181:					
						
	subq.l #1,d0				
	jbeq _?L4293				
						
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l a4,60(a6)			
	move.l d5,56(a6)			
	clr.l 52(a6)				
	moveq #48,d7				
	add.l sp,d7				
	moveq #44,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea (166,a6),a0				
	move.l a0,40(sp)			
_?L4242:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4226				
	move.l 44(sp),28(a6)			
	move.l 48(sp),24(a6)			
	clr.l 20(a6)				
_?L4227:					
	moveq #4,d2				
	cmp.l (a6),d2				
	jbeq _?L4230				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4227				
_?L4228:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L4294				
_?L4239:					
	move.l 52(a6),d1			
	cmp.l d5,d1				
	jbcs _?L4242				
_?L4300:					
	clr.l d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L4296:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4230:					
	moveq #5,d0				
	cmp.l 114(a6),d0			
	jbeq _?L4295				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4228				
	moveq #4,d2				
	cmp.l (a6),d2				
	jbeq _?L4230				
_?L4231:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4296				
_?L4293:					
	move.l a4,28(a6)			
	move.l d5,24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4184:					
	moveq #4,d4				
	cmp.l (a6),d4				
	jbeq _?L4297				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L4184				
_?L4225:					
	move.l 20(a6),d2			
_?L4185:					
	move.l 68(sp),a0			
	move.l d2,(a0)				
_?L4302:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4295:					
						
	move.l 166(a6),a1			
						
	cmp.l a1,d0				
	jbeq _?L4233				
	jbcs _?L4298				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l 48(sp),-(sp)			
	jbsr _miniflac_cuesheet_read_tracks	
	lea (12,sp),sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbne _?L4228				
_?L4233:					
						
	move.b 174(a6),d0			
	cmp.b 175(a6),d0			
	jbeq _?L4299				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L4238				
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l d5,d1				
	jbcs _?L4242				
	jbra _?L4300				
_?L4298:					
						
	lea (-12,a1),a1				
	moveq #2,d1				
	cmp.l a1,d1				
	jbcs _?L4231				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l 48(sp),-(sp)			
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbeq _?L4233				
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbeq _?L4239				
	jbra _?L4294				
_?L4243:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4238:					
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 72(sp)				
	jbeq _?L4240				
						
	move.l 72(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L4240:					
						
	moveq #6,d0				
	move.l d0,166(a6)			
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4296				
_?L4226:					
	move.l 52(a6),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4296				
_?L4297:					
	lea _miniflac_sync_internal,a3		
_?L4187:					
	moveq #5,d2				
	cmp.l 114(a6),d2			
	jbeq _?L4301				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4225				
	moveq #4,d1				
	cmp.l (a6),d1				
	jbeq _?L4187				
_?L4192:					
	move.l 20(a6),d2			
						
	moveq #-1,d4				
						
	move.l 68(sp),a0			
	move.l d2,(a0)				
	jbra _?L4302				
_?L4299:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
						
	moveq #2,d4				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4296				
_?L4301:					
						
	move.l 166(a6),a1			
						
	cmp.l a1,d2				
	jbeq _?L4286				
	jbcs _?L4303				
						
	moveq #3,d0				
	cmp.l a1,d0				
	jbeq _?L4195				
	moveq #4,d1				
	cmp.l a1,d1				
	jbne _?L4304				
_?L4196:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4289				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,175(a6)			
						
	clr.b 174(a6)				
						
	moveq #5,d0				
	move.l d0,166(a6)			
	clr.b d0				
_?L4194:					
						
	cmp.b d1,d0				
	jbeq _?L4305				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4289				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 72(sp)				
	jbeq _?L4224				
						
	move.l 72(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L4224:					
						
	moveq #6,d0				
	move.l d0,166(a6)			
						
	move.l 20(a6),d2			
	moveq #1,d4				
	move.l 68(sp),a0			
	move.l d2,(a0)				
	jbra _?L4302				
_?L4304:					
						
	moveq #2,d2				
	lea _miniflac_bitreader_fill_nocrc,a3	
	cmp.l a1,d2				
	jbeq _?L4197				
						
	moveq #1,d4				
	lea _miniflac_bitreader_fill_nocrc,a3	
	cmp.l a1,d4				
	jbeq _?L4198				
						
	move.l 170(a6),d4			
	lea _miniflac_bitreader_fill_nocrc,a3	
						
	lea _miniflac_bitreader_read,a4		
						
	cmp.l #128,d4				
	jbcc _?L4201				
_?L4199:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4289				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	addq.l #1,d4				
	move.l d4,170(a6)			
						
	cmp.l #128,d4				
	jbne _?L4199				
_?L4201:					
						
	clr.l 170(a6)				
						
	moveq #1,d0				
	move.l d0,166(a6)			
_?L4198:					
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4289				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,166(a6)			
_?L4197:					
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4289				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b 16(a6),d0			
	cmp.b #6,d0				
	jbls _?L4306				
						
	subq.b #7,d0				
	move.b d0,16(a6)			
						
	jbeq _?L4244				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
	move.l d2,-(sp)				
	pea -1.w				
	pea -1.w				
	jbsr ___lshrdi3				
	lea (12,sp),sp				
	move.l d0,a1				
	move.l d1,d0				
	move.l a1,d1				
						
	and.l d1,8(a6)				
	and.l d0,12(a6)				
						
	moveq #3,d4				
	move.l d4,166(a6)			
_?L4195:					
						
	move.l 170(a6),d5			
						
	cmp.l #257,d5				
	jbhi _?L4206				
						
	move.b 16(a6),d6			
	addq.l #1,d5				
_?L4207:					
						
	cmp.b #7,d6				
	jbhi _?L4307				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L4288				
						
	move.l 28(a6),a1			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a6)			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d7				
	move.l d1,d4				
	or.b (a1,d2.l),d4			
	move.l d4,a3				
						
	addq.l #1,32(a6)			
	move.b d6,d4				
_?L4208:					
						
	move.b d4,16(a6)			
	clr.l d0				
						
	tst.b d4				
	jbeq _?L4245				
						
	move.b d4,d0				
						
	moveq #64,d1				
	sub.l d0,d1				
	move.l d1,-(sp)				
	pea -1.w				
	pea -1.w				
	jbsr ___lshrdi3				
	lea (12,sp),sp				
						
	and.l d7,d0				
	move.l a3,d2				
	and.l d2,d1				
_?L4210:					
	move.l d0,8(a6)				
	move.l d1,12(a6)			
						
	move.l d5,170(a6)			
						
	cmp.l #258,d5				
	jbeq _?L4206				
	move.l d5,d0				
	addq.l #1,d0				
	cmp.b #7,d6				
	jbhi _?L4246				
						
	move.l 24(a6),d6			
						
	clr.l d2				
	move.b d4,d2				
	moveq #64,d0				
	sub.l d2,d0				
						
	moveq #32,d1				
	sub.l d2,d1				
	jbmi _?L4212				
	moveq #-1,d7				
	lsr.l d1,d7				
	sub.l a2,a2				
_?L4218:					
						
	move.l 20(a6),d2			
						
	cmp.l d6,d2				
	jbcc _?L4288				
						
	move.l 28(a6),a1			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a6)			
						
	move.b (a1,d2.l),d2			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
						
	addq.l #1,32(a6)			
						
	move.b d4,16(a6)			
						
	jbeq _?L4215				
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	or.b d2,d1				
						
	move.l a2,d2				
	and.l d0,d2				
	move.l d2,8(a6)				
	and.l d7,d1				
	move.l d1,12(a6)			
						
	addq.l #1,d5				
	move.l d5,170(a6)			
						
	cmp.l #258,d5				
	jbne _?L4218				
_?L4206:					
						
	clr.l 170(a6)				
						
	moveq #4,d4				
	move.l d4,166(a6)			
	jbra _?L4196				
_?L4303:					
						
	lea (-12,a1),a1				
	moveq #2,d4				
	cmp.l a1,d4				
	jbcs _?L4192				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbne _?L4225				
_?L4286:					
						
	move.b 174(a6),d0			
						
	move.b 175(a6),d1			
	jbra _?L4194				
_?L4289:					
						
	move.l 20(a6),d2			
_?L4288:					
						
	clr.l d4				
						
	move.l 68(sp),a0			
	move.l d2,(a0)				
	jbra _?L4302				
_?L4305:					
	move.l 20(a6),d2			
						
	moveq #2,d4				
						
	move.l 68(sp),a0			
	move.l d2,(a0)				
	jbra _?L4302				
_?L4294:					
	move.l 52(a6),d1			
	move.l d0,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4296				
_?L4244:					
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,8(a6)				
	and.l d0,12(a6)				
						
	moveq #3,d4				
	move.l d4,166(a6)			
	jbra _?L4195				
_?L4306:					
	jbsr (_miniflac_bitreader_discard?part?0)
_?L4307:					
						
	move.b d6,d4				
	subq.b #8,d4				
						
	move.l 8(a6),d7				
	move.l 12(a6),a3			
	jbra _?L4208				
_?L4215:					
						
	clr.l 8(a6)				
	clr.l 12(a6)				
						
	addq.l #1,d5				
	move.l d5,170(a6)			
						
	cmp.l #258,d5				
	jbne _?L4218				
						
	clr.l 170(a6)				
						
	moveq #4,d4				
	move.l d4,166(a6)			
	jbra _?L4196				
_?L4212:					
						
	moveq #-1,d2				
	moveq #31,d7				
	sub.l d0,d7				
	moveq #-2,d1				
	lsl.l d7,d1				
	move.l d2,d7				
	lsr.l d0,d7				
	or.l d1,d7				
	lsr.l d0,d2				
	move.l d2,a2				
	jbra _?L4218				
_?L4246:					
						
	move.l d0,d5				
	move.b d4,d6				
	jbra _?L4207				
_?L4245:					
	clr.l d1				
	jbra _?L4210				
						
	.align	2				
	.globl	_miniflac_cuesheet_track_number	
						
_miniflac_cuesheet_track_number:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L4309				
						
	tst.l 60(sp)				
	jbeq _?L4337				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4353				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4353:					
	move.l 4(a4),d0				
_?L4309:					
						
	subq.l #1,d0				
	jbeq _?L4354				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L4336:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4317				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L4318:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L4321				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4318				
_?L4319:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L4355				
_?L4333:					
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L4336				
_?L4361:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L4357:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4321:					
	moveq #5,d1				
	cmp.l 114(a4),d1			
	jbeq _?L4356				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4319				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L4321				
_?L4322:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4357				
_?L4354:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4312:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L4358				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4312				
_?L4313:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L4363:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4356:					
						
	move.l 166(a4),d0			
						
	cmp.l d0,d1				
	jbcs _?L4359				
						
	subq.l #5,d0				
	jbne _?L4327				
_?L4330:					
						
	move.b 174(a4),d0			
	cmp.b 175(a4),d0			
	jbeq _?L4360				
						
	pea 64.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbeq _?L4332				
_?L4334:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L4336				
	jbra _?L4361				
_?L4359:					
						
	subq.l #6,d0				
	jbne _?L4322				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4334				
_?L4364:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L4335				
						
	move.l 68(sp),a0			
	move.b d1,(a0)				
_?L4335:					
						
	clr.l 170(a4)				
						
	moveq #7,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4357				
_?L4337:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4327:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_tracks	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4330				
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbeq _?L4333				
	jbra _?L4355				
_?L4317:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4357				
_?L4358:					
	lea _miniflac_sync_internal,a3		
_?L4315:					
	moveq #5,d0				
	cmp.l 114(a4),d0			
	jbeq _?L4362				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4313				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L4315				
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4363				
_?L4332:					
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d0				
	move.l d0,166(a4)			
	move.l 36(sp),a1			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4334				
	jbra _?L4364				
_?L4362:					
						
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4363				
_?L4360:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
						
	moveq #2,d4				
						
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4357				
_?L4355:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4357				
						
	.align	2				
	.globl	_miniflac_cuesheet_track_isrc_length
						
_miniflac_cuesheet_track_isrc_length:		
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
	move.l 60(sp),a4			
	move.l 64(sp),d3			
	move.l 68(sp),36(sp)			
	move.l 72(sp),d4			
						
	move.l 4(a3),d0				
	jbne _?L4366				
						
	tst.l d3				
	jbeq _?L4373				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbeq _?L4377				
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4377:					
	move.l 4(a3),d0				
_?L4366:					
						
	subq.l #1,d0				
	jbeq _?L4378				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l a4,60(a3)			
	move.l d3,56(a3)			
	clr.l 52(a3)				
	moveq #44,d5				
	add.l sp,d5				
	moveq #40,d7				
	add.l sp,d7				
	lea _miniflac_oggfunction_start,a5	
	lea _miniflac_oggfunction_end,a6	
_?L4372:					
	move.l d5,-(sp)				
	move.l d7,-(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d6				
	moveq #1,d0				
	cmp.l d6,d0				
	jbne _?L4369				
	move.l d4,-(sp)				
	pea 52(sp)				
	move.l 52(sp),-(sp)			
	move.l 52(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_cuesheet_track_isrc_length_native
	lea (20,sp),sp				
	move.l d0,d6				
	move.l 48(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	tst.l d6				
	jbne _?L4371				
	cmp.l d3,d1				
	jbcs _?L4372				
_?L4371:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L4379:					
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4378:					
						
	move.l d4,72(sp)			
	move.l 36(sp),68(sp)			
	move.l d3,64(sp)			
	move.l a4,60(sp)			
	move.l a3,56(sp)			
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	jbra _miniflac_cuesheet_track_isrc_length_native
_?L4373:					
						
	clr.l d6				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4369:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L4379				
						
	.align	2				
	.globl	_miniflac_cuesheet_track_isrc_string
						
_miniflac_cuesheet_track_isrc_string:		
	lea (-20,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 60(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L4381				
						
	tst.l 68(sp)				
	jbeq _?L4441				
	subq.l #4,sp				
	move.l 68(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4470				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L4470:					
	move.l 4(a3),d0				
_?L4381:					
						
	subq.l #1,d0				
	jbeq _?L4471				
						
	clr.l 48(sp)				
	clr.l 52(sp)				
	move.l 64(sp),60(a3)			
	move.l 68(sp),56(a3)			
	clr.l 52(a3)				
	moveq #52,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a5	
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
	lea _miniflac_oggfunction_end,a6	
_?L4440:					
	move.l d5,-(sp)				
	pea 52(sp)				
	move.l 72(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4402				
	move.l 48(sp),28(a3)			
	move.l 52(sp),24(a3)			
	clr.l 20(a3)				
_?L4403:					
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L4406				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4403				
_?L4404:					
	move.l 20(a3),d1			
_?L4408:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbne _?L4472				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L4440				
_?L4478:					
	clr.l d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
_?L4474:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L4406:					
	moveq #5,d0				
	cmp.l 114(a3),d0			
	jbeq _?L4473				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4404				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L4406				
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
_?L4480:					
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L4474				
_?L4471:					
	move.l 64(sp),28(a3)			
	move.l 68(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L4384:					
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L4475				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L4384				
_?L4385:					
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
_?L4482:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L4473:					
						
	move.l 166(a3),d0			
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcs _?L4476				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a3)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4404				
_?L4439:					
						
	move.l 170(a3),d0			
						
	moveq #11,d1				
	cmp.l d0,d1				
	jbcs _?L4413				
	tst.l 76(sp)				
	jbeq _?L4464				
						
	move.w #-1,a2				
_?L4414:					
						
	move.b 16(a3),d2			
						
	cmp.b #7,d2				
	jbhi _?L4477				
_?L4434:					
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L4417				
	move.l d1,a1				
						
	move.l 28(a3),a0			
						
	addq.l #1,d1				
	move.l d1,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d7,d1				
	or.b (a0,a1.l),d1			
	move.l d1,36(sp)			
						
	addq.l #1,32(a3)			
						
	move.b d2,16(a3)			
						
	clr.l d7				
	move.b d2,d7				
						
	jbeq _?L4442				
_?L4479:					
						
	move.w #64,a0				
	sub.l d7,a0				
						
	moveq #32,d2				
	sub.l d7,d2				
	jbmi _?L4428				
	move.l a2,d1				
	lsr.l d2,d1				
	move.l d1,a1				
	clr.l d2				
						
	and.l d6,d2				
	move.l d2,a0				
	move.l a1,d2				
	and.l 36(sp),d2				
_?L4427:					
	move.l a0,8(a3)				
	move.l d2,12(a3)			
						
	cmp.l 80(sp),d0				
	jbcc _?L4430				
						
	move.w #-32,a0				
	add.l d7,a0				
	tst.l a0				
	jblt _?L4431				
	move.l a0,d2				
	lsr.l d2,d6				
						
	move.l 76(sp),a0			
	move.b d6,(a0,d0.l)			
						
	move.l 170(a3),d0			
	addq.l #1,d0				
	move.l d0,170(a3)			
						
	moveq #11,d1				
	cmp.l d0,d1				
	jbcc _?L4414				
_?L4413:					
						
	tst.l 84(sp)				
	jbeq _?L4436				
						
	move.l 80(sp),d1			
	cmp.l d1,d0				
	jbcc _?L4437				
	move.l d0,d1				
_?L4437:					
						
	move.l 84(sp),a0			
	move.l d1,(a0)				
_?L4436:					
						
	clr.l 170(a3)				
						
	moveq #8,d0				
	move.l d0,166(a3)			
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L4474				
_?L4417:					
	move.l 44(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L4440				
	jbra _?L4478				
_?L4430:					
						
	move.l 170(a3),d0			
	addq.l #1,d0				
	move.l d0,170(a3)			
						
	moveq #11,d2				
	cmp.l d0,d2				
	jbcs _?L4413				
						
	move.b 16(a3),d2			
						
	cmp.b #7,d2				
	jbls _?L4434				
_?L4477:					
						
	move.l 8(a3),d6				
	move.l 12(a3),36(sp)			
						
	subq.b #8,d2				
	move.b d2,16(a3)			
						
	clr.l d7				
	move.b d2,d7				
						
	jbne _?L4479				
_?L4442:					
	sub.l a0,a0				
	clr.l d2				
	jbra _?L4427				
_?L4476:					
						
	subq.l #7,d0				
	jbeq _?L4439				
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	jbra _?L4480				
_?L4428:					
						
	moveq #31,d2				
	sub.l a0,d2				
	moveq #-2,d1				
	lsl.l d2,d1				
	move.l d1,44(sp)			
	move.l a2,d2				
	move.l a0,d1				
	lsr.l d1,d2				
	or.l 44(sp),d2				
	move.l d2,a1				
	move.l a2,d2				
	lsr.l d1,d2				
						
	and.l d6,d2				
	move.l d2,a0				
	move.l a1,d2				
	and.l 36(sp),d2				
	jbra _?L4427				
_?L4431:					
						
	add.l d6,d6				
	moveq #31,d2				
	sub.l d7,d2				
	lsl.l d2,d6				
	move.l d6,a0				
	move.l 36(sp),d6			
	lsr.l d7,d6				
	move.l a0,d1				
	or.l d1,d6				
						
	move.l 76(sp),a0			
	move.b d6,(a0,d0.l)			
						
	move.l 170(a3),d0			
	addq.l #1,d0				
	move.l d0,170(a3)			
						
	moveq #11,d1				
	cmp.l d0,d1				
	jbcc _?L4414				
	jbra _?L4413				
_?L4441:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L4402:					
	move.l 52(a3),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L4474				
_?L4475:					
	lea _miniflac_sync_internal,a4		
_?L4387:					
	moveq #5,d0				
	cmp.l 114(a3),d0			
	jbeq _?L4481				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4385				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L4387				
	moveq #-1,d4				
_?L4485:					
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L4482				
_?L4464:					
						
	move.w #-1,a1				
_?L4423:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L4483				
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d2			
	cmp.l 24(a3),d2				
	jbcc _?L4417				
	move.l d2,a2				
						
	move.l 28(a3),a0			
						
	addq.l #1,d2				
	move.l d2,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d6,d2				
	move.l d7,d1				
	or.b (a0,a2.l),d1			
	move.l d1,a0				
						
	addq.l #1,32(a3)			
_?L4416:					
						
	move.b d0,16(a3)			
						
	jbeq _?L4418				
						
	and.l #255,d0				
						
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d6				
	sub.l d0,d6				
	jbmi _?L4419				
	move.l a1,d0				
	lsr.l d6,d0				
	clr.l d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
						
	move.l 170(a3),d0			
	addq.l #1,d0				
	move.l d0,170(a3)			
						
	moveq #11,d2				
	cmp.l d0,d2				
	jbcc _?L4423				
	jbra _?L4413				
_?L4418:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 170(a3),d0			
	addq.l #1,d0				
	move.l d0,170(a3)			
						
	moveq #11,d1				
	cmp.l d0,d1				
	jbcc _?L4423				
	jbra _?L4413				
_?L4419:					
						
	moveq #31,d0				
	sub.l d7,d0				
	moveq #-2,d6				
	lsl.l d0,d6				
	move.l a1,d0				
	lsr.l d7,d0				
	or.l d6,d0				
	move.l a1,d6				
	lsr.l d7,d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
						
	move.l 170(a3),d0			
	addq.l #1,d0				
	move.l d0,170(a3)			
						
	moveq #11,d2				
	cmp.l d0,d2				
	jbcc _?L4423				
	jbra _?L4413				
_?L4483:					
						
	move.l 8(a3),d2				
	move.l 12(a3),a0			
						
	subq.b #8,d0				
	jbra _?L4416				
_?L4481:					
						
	move.l 166(a3),d0			
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcs _?L4484				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a3)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4385				
_?L4401:					
						
	move.l 170(a3),d4			
						
	moveq #11,d0				
	cmp.l d4,d0				
	jbcs _?L4391				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
	tst.l 76(sp)				
	jbeq _?L4394				
_?L4392:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4393				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	cmp.l 80(sp),d4				
	jbcc _?L4397				
						
	move.l 76(sp),a0			
	move.b d1,(a0,d4.l)			
						
	move.l 170(a3),d4			
	addq.l #1,d4				
	move.l d4,170(a3)			
						
	moveq #11,d0				
	cmp.l d4,d0				
	jbcc _?L4392				
_?L4391:					
						
	tst.l 84(sp)				
	jbeq _?L4399				
						
	move.l 80(sp),d0			
	cmp.l d0,d4				
	jbcc _?L4400				
	move.l d4,d0				
_?L4400:					
						
	move.l 84(sp),a0			
	move.l d0,(a0)				
_?L4399:					
						
	clr.l 170(a3)				
						
	moveq #8,d0				
	move.l d0,166(a3)			
						
	moveq #1,d4				
						
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L4482				
_?L4394:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4393				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 170(a3),d4			
	addq.l #1,d4				
	move.l d4,170(a3)			
						
	moveq #11,d1				
	cmp.l d4,d1				
	jbcc _?L4394				
	jbra _?L4391				
_?L4397:					
						
	move.l 170(a3),d4			
	addq.l #1,d4				
	move.l d4,170(a3)			
						
	moveq #11,d1				
	cmp.l d4,d1				
	jbcc _?L4392				
	jbra _?L4391				
_?L4484:					
						
	subq.l #7,d0				
	jbeq _?L4401				
						
	moveq #-1,d4				
	jbra _?L4485				
_?L4393:					
						
	clr.l d4				
						
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L4482				
_?L4472:					
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L4474				
						
	.align	2				
	.globl	_miniflac_cuesheet_track_audio_flag
						
_miniflac_cuesheet_track_audio_flag:		
	lea (-28,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 68(sp),a4			
						
	move.l 4(a4),d0				
	jbne _?L4487				
						
	tst.l 76(sp)				
	jbeq _?L4531				
	subq.l #4,sp				
	move.l 76(sp),a0			
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4556				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L4556:					
	move.l 4(a4),d0				
_?L4487:					
						
	subq.l #1,d0				
	jbeq _?L4557				
						
	clr.l 56(sp)				
	clr.l 60(sp)				
	move.l 72(sp),60(a4)			
	move.l 76(sp),56(a4)			
	clr.l 52(a4)				
	moveq #56,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L4530:					
	pea 60(sp)				
	move.l d5,-(sp)				
	move.l 80(sp),-(sp)			
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4495				
	move.l 56(sp),28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
_?L4496:					
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L4499				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4496				
_?L4497:					
	move.l 20(a4),d1			
_?L4501:					
	move.l d1,-(sp)				
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L4558				
_?L4512:					
	move.l 52(a4),d1			
	cmp.l 76(sp),d1				
	jbcs _?L4530				
_?L4564:					
	clr.l d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
_?L4560:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L4499:					
	moveq #5,d0				
	cmp.l 114(a4),d0			
	jbeq _?L4559				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d6				
	cmp.l d0,d6				
	jbne _?L4497				
	moveq #4,d7				
	cmp.l (a4),d7				
	jbeq _?L4499				
_?L4502:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L4560				
_?L4557:					
	move.l 72(sp),28(a4)			
	move.l 76(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4490:					
	moveq #4,d6				
	cmp.l (a4),d6				
	jbeq _?L4561				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L4490				
_?L4491:					
	move.l 80(sp),a0			
	move.l 20(a4),(a0)			
_?L4567:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L4559:					
						
	move.l 166(a4),d0			
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcs _?L4562				
						
	subq.l #7,d0				
	jbne _?L4507				
_?L4526:					
						
	move.l 170(a4),d0			
						
	moveq #11,d7				
	cmp.l d0,d7				
	jbcs _?L4508				
						
	move.b 16(a4),40(sp)			
	move.l d0,a2				
	addq.l #1,a2				
_?L4509:					
						
	cmp.b #7,40(sp)				
	jbhi _?L4563				
						
	move.l 20(a4),d2			
						
	cmp.l 24(a4),d2				
	jbcc _?L4519				
						
	move.l 28(a4),a0			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a4)			
						
	move.l 8(a4),d0				
	move.l 12(a4),d1			
	move.l d0,d6				
	move.l d1,d7				
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d6,a1				
	move.l d7,d1				
	or.b (a0,d2.l),d1			
	move.l d1,a0				
						
	addq.l #1,32(a4)			
	move.b 40(sp),d0			
						
	move.b d0,16(a4)			
						
	jbeq _?L4533				
_?L4568:					
						
	clr.l d1				
	move.b d0,d1				
						
	moveq #64,d6				
	sub.l d1,d6				
						
	moveq #32,d7				
	sub.l d1,d7				
	jbmi _?L4514				
	moveq #-1,d2				
	lsr.l d7,d2				
	clr.l d7				
						
	move.l a1,d6				
	and.l d7,d6				
	move.l d6,a1				
	move.l a0,d7				
	and.l d7,d2				
_?L4513:					
	move.l a1,8(a4)				
	move.l d2,12(a4)			
						
	move.l a2,170(a4)			
						
	moveq #12,d1				
	cmp.l a2,d1				
	jbeq _?L4508				
	move.l a2,d1				
	addq.l #1,d1				
	cmp.b #7,40(sp)				
	jbhi _?L4534				
						
	move.l 24(a4),d1			
						
	clr.l d2				
	move.b d0,d2				
	move.w #64,a1				
	sub.l d2,a1				
						
	move.w #32,a0				
	sub.l d2,a0				
	tst.l a0				
	jblt _?L4517				
	moveq #-1,d2				
	move.l a0,d6				
	lsr.l d6,d2				
	move.l d2,40(sp)			
	clr.l 44(sp)				
_?L4523:					
						
	move.l 20(a4),d2			
						
	cmp.l d1,d2				
	jbcc _?L4519				
						
	move.l 28(a4),a0			
						
	move.l d2,d6				
	addq.l #1,d6				
	move.l d6,20(a4)			
						
	move.b (a0,d2.l),d2			
						
	move.l 8(a4),a0				
	move.l 12(a4),a1			
						
	addq.l #1,32(a4)			
						
	move.b d0,16(a4)			
						
	jbeq _?L4520				
						
	move.l a0,d6				
	move.l a1,d7				
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
	move.l d6,a0				
	move.l d7,a1				
						
	or.b d2,d7				
	move.l d7,a1				
						
	move.l a0,d7				
	and.l 44(sp),d7				
	move.l d7,8(a4)				
	move.l a1,d2				
	and.l 40(sp),d2				
	move.l d2,12(a4)			
						
	addq.l #1,a2				
	move.l a2,170(a4)			
						
	moveq #12,d6				
	cmp.l a2,d6				
	jbne _?L4523				
_?L4508:					
						
	clr.l 170(a4)				
						
	moveq #8,d0				
	move.l d0,166(a4)			
_?L4505:					
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L4527				
_?L4565:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 76(sp),d1				
	jbcs _?L4530				
	jbra _?L4564				
_?L4562:					
						
	subq.l #8,d0				
	jbne _?L4502				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4565				
	jbra _?L4527				
_?L4531:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L4527:					
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 84(sp)				
	jbeq _?L4528				
						
	move.l 84(sp),a0			
	move.b d1,(a0)				
_?L4528:					
						
	moveq #9,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L4560				
_?L4507:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4526				
						
	move.l 20(a4),d1			
	move.l d1,-(sp)				
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbeq _?L4512				
	jbra _?L4558				
_?L4519:					
	move.l d2,-(sp)				
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 76(sp),d1				
	jbcs _?L4530				
	jbra _?L4564				
_?L4495:					
	move.l 52(a4),d1			
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L4560				
_?L4561:					
	lea _miniflac_sync_internal,a3		
_?L4493:					
	moveq #5,d1				
	cmp.l 114(a4),d1			
	jbeq _?L4566				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d7				
	cmp.l d0,d7				
	jbne _?L4491				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L4493				
	moveq #-1,d4				
	move.l 80(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4567				
_?L4563:					
						
	move.b 40(sp),d0			
	subq.b #8,d0				
						
	move.l 8(a4),a1				
	move.l 12(a4),a0			
						
	move.b d0,16(a4)			
						
	jbne _?L4568				
_?L4533:					
	sub.l a1,a1				
	clr.l d2				
	jbra _?L4513				
_?L4520:					
						
	clr.l 8(a4)				
	clr.l 12(a4)				
						
	addq.l #1,a2				
	move.l a2,170(a4)			
						
	moveq #12,d7				
	cmp.l a2,d7				
	jbne _?L4523				
						
	clr.l 170(a4)				
						
	moveq #8,d0				
	move.l d0,166(a4)			
	jbra _?L4505				
_?L4517:					
						
	moveq #-1,d6				
	moveq #31,d7				
	sub.l a1,d7				
	move.w #-2,a0				
	move.l a0,d2				
	lsl.l d7,d2				
	move.l d2,a0				
	move.l d6,d7				
	move.l a1,d2				
	lsr.l d2,d7				
	move.l d7,40(sp)			
	move.l a0,d7				
	or.l d7,40(sp)				
	lsr.l d2,d6				
	move.l d6,44(sp)			
	jbra _?L4523				
_?L4566:					
						
	move.l 84(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_track_audio_flag
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 80(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4567				
_?L4514:					
						
	moveq #-1,d7				
	moveq #31,d2				
	sub.l d6,d2				
	move.l d2,48(sp)			
	moveq #-2,d2				
	move.l 48(sp),d1			
	lsl.l d1,d2				
	move.l d2,52(sp)			
	move.l d7,d2				
	lsr.l d6,d2				
	or.l 52(sp),d2				
	lsr.l d6,d7				
						
	move.l a1,d6				
	and.l d7,d6				
	move.l d6,a1				
	move.l a0,d7				
	and.l d7,d2				
	jbra _?L4513				
_?L4534:					
						
	move.l d1,a2				
	move.b d0,40(sp)			
	jbra _?L4509				
_?L4558:					
						
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L4560				
						
	.align	2				
	.globl	_miniflac_cuesheet_track_preemph_flag
						
_miniflac_cuesheet_track_preemph_flag:		
	lea (-40,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 80(sp),a4			
	move.l 84(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L4570				
						
	tst.l 88(sp)				
	jbeq _?L4648				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4702				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (40,sp),sp				
	rts					
_?L4702:					
	move.l 4(a4),d0				
_?L4570:					
						
	subq.l #1,d0				
	jbeq _?L4703				
						
	clr.l 68(sp)				
	clr.l 72(sp)				
	move.l d5,60(a4)			
	move.l 88(sp),56(a4)			
	clr.l 52(a4)				
	moveq #72,d7				
	add.l sp,d7				
	moveq #68,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L4647:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4606				
	move.l 68(sp),28(a4)			
	move.l 72(sp),24(a4)			
	clr.l 20(a4)				
_?L4607:					
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L4610				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4607				
_?L4608:					
	move.l 20(a4),d1			
_?L4612:					
	move.l d1,-(sp)				
	move.l a4,-(sp)				
	move.l d0,56(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 48(sp),d0			
	jbne _?L4704				
_?L4624:					
	move.l 52(a4),d1			
	cmp.l 88(sp),d1				
	jbcs _?L4647				
_?L4710:					
	clr.l d4				
	move.l 92(sp),a0			
	move.l d1,(a0)				
_?L4706:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (40,sp),sp				
	rts					
_?L4610:					
	moveq #5,d0				
	cmp.l 114(a4),d0			
	jbeq _?L4705				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4608				
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L4610				
_?L4613:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 92(sp),a0			
	move.l d1,(a0)				
	jbra _?L4706				
_?L4703:					
	move.l d5,28(a4)			
	move.l 88(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4573:					
	moveq #4,d5				
	cmp.l (a4),d5				
	jbeq _?L4707				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L4573				
_?L4695:					
	move.l 20(a4),d2			
_?L4574:					
	move.l 92(sp),a0			
	move.l d2,(a0)				
_?L4713:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (40,sp),sp				
	rts					
_?L4705:					
						
	move.l 166(a4),d0			
						
	moveq #8,d1				
	cmp.l d0,d1				
	jbcs _?L4708				
						
	moveq #8,d1				
	cmp.l d0,d1				
	jbne _?L4709				
_?L4618:					
						
	pea 1.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,56(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 48(sp),a1			
	tst.l d0				
	jbne _?L4699				
						
	pea 1.w					
	move.l d3,-(sp)				
	move.l a1,56(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #9,d2				
	move.l d2,166(a4)			
	move.l 48(sp),a1			
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L4640				
_?L4699:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 88(sp),d1				
	jbcs _?L4647				
	jbra _?L4710				
_?L4708:					
						
	moveq #9,d2				
	cmp.l d0,d2				
	jbne _?L4613				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4699				
_?L4640:					
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 96(sp)				
	jbeq _?L4641				
						
	move.l 96(sp),a0			
	move.b d1,(a0)				
_?L4641:					
						
	move.b 16(a4),d0			
	cmp.b #5,d0				
	jbls _?L4642				
						
	subq.b #6,d0				
	move.b d0,16(a4)			
						
	jbeq _?L4654				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L4644				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	clr.l 170(a4)				
						
	moveq #10,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
_?L4714:					
	move.l 92(sp),a0			
	move.l d1,(a0)				
	jbra _?L4706				
_?L4648:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (40,sp),sp				
	rts					
_?L4709:					
						
	subq.l #7,d0				
	jbne _?L4619				
_?L4638:					
						
	move.l 170(a4),a0			
						
	moveq #11,d0				
	cmp.l a0,d0				
	jbcs _?L4620				
						
	move.b 16(a4),d1			
	move.w d1,a2				
_?L4621:					
						
	move.w a2,d2				
	cmp.b #7,d2				
	jbhi _?L4711				
						
	move.l 20(a4),d2			
						
	cmp.l 24(a4),d2				
	jbcc _?L4631				
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a4)			
						
	move.l 8(a4),d0				
	move.l 12(a4),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	move.l d0,40(sp)			
	move.l d1,44(sp)			
						
	move.l d0,36(sp)			
	move.l 28(a4),a1			
	or.b (a1,d2.l),d1			
	move.l d1,52(sp)			
						
	addq.l #1,32(a4)			
	move.w a2,d0				
_?L4622:					
						
	move.b d0,16(a4)			
						
	jbeq _?L4652				
						
	clr.l d1				
	move.b d0,d1				
						
	move.w #64,a1				
	sub.l d1,a1				
						
	moveq #32,d2				
	sub.l d1,d2				
	move.l d2,60(sp)			
	jbmi _?L4626				
	move.l d2,d1				
	moveq #-1,d2				
	lsr.l d1,d2				
	move.l d2,40(sp)			
	clr.l 60(sp)				
						
	move.l 60(sp),d1			
	and.l 36(sp),d1				
	move.l d1,a1				
	move.l 40(sp),d2			
	and.l 52(sp),d2				
_?L4625:					
	move.l a1,8(a4)				
	move.l d2,12(a4)			
						
	addq.l #1,a0				
	move.l a0,170(a4)			
						
	moveq #12,d2				
	cmp.l a0,d2				
	jbeq _?L4620				
	move.w a2,d1				
	cmp.b #7,d1				
	jbhi _?L4653				
						
	move.l 24(a4),a2			
						
	clr.l d1				
	move.b d0,d1				
	move.w #64,a1				
	sub.l d1,a1				
						
	moveq #32,d2				
	sub.l d1,d2				
	jbmi _?L4629				
	moveq #-1,d1				
	lsr.l d2,d1				
	move.l d1,52(sp)			
	clr.l 56(sp)				
_?L4635:					
						
	move.l 20(a4),d2			
						
	cmp.l a2,d2				
	jbcc _?L4631				
						
	move.l 28(a4),a1			
						
	move.l d2,d1				
	addq.l #1,d1				
	move.l d1,20(a4)			
						
	move.b (a1,d2.l),d2			
	move.w d2,a1				
						
	move.l 8(a4),40(sp)			
	move.l 12(a4),44(sp)			
						
	addq.l #1,32(a4)			
						
	move.b d0,16(a4)			
						
	jbeq _?L4632				
						
	move.l 40(sp),d1			
	move.l 44(sp),d2			
	rol.l #8,d1				
	rol.l #8,d2				
	move.b d2,d1				
	clr.b d2				
	move.l d1,40(sp)			
	move.l d2,44(sp)			
						
	move.w a1,d1				
	or.b d1,d2				
	move.l d2,60(sp)			
						
	move.l 56(sp),d2			
	and.l 40(sp),d2				
	move.l d2,8(a4)				
	move.l 60(sp),d1			
	and.l 52(sp),d1				
	move.l d1,12(a4)			
						
	addq.l #1,a0				
	move.l a0,170(a4)			
						
	moveq #12,d2				
	cmp.l a0,d2				
	jbne _?L4635				
_?L4620:					
						
	clr.l 170(a4)				
						
	moveq #8,d0				
	move.l d0,166(a4)			
	jbra _?L4618				
_?L4606:					
						
	move.l 52(a4),d1			
	move.l 92(sp),a0			
	move.l d1,(a0)				
	jbra _?L4706				
_?L4707:					
	lea _miniflac_sync_internal,a3		
_?L4576:					
	moveq #5,d2				
	cmp.l 114(a4),d2			
	jbeq _?L4712				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4695				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L4576				
	move.l 20(a4),d2			
						
	moveq #-1,d4				
_?L4717:					
						
	move.l 92(sp),a0			
	move.l d2,(a0)				
	jbra _?L4713				
_?L4654:					
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	clr.l 170(a4)				
						
	moveq #10,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	jbra _?L4714				
_?L4619:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4638				
						
	move.l 20(a4),d1			
	move.l d1,-(sp)				
	move.l a4,-(sp)				
	move.l d0,56(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 48(sp),d0			
	jbeq _?L4624				
	jbra _?L4704				
_?L4631:					
	move.l d2,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 88(sp),d1				
	jbcs _?L4647				
	jbra _?L4710				
_?L4632:					
						
	clr.l 8(a4)				
	clr.l 12(a4)				
						
	addq.l #1,a0				
	move.l a0,170(a4)			
						
	moveq #12,d1				
	cmp.l a0,d1				
	jbne _?L4635				
						
	clr.l 170(a4)				
						
	moveq #8,d0				
	move.l d0,166(a4)			
	jbra _?L4618				
_?L4712:					
						
	move.l 166(a4),d0			
						
	moveq #8,d5				
	cmp.l d0,d5				
	jbcs _?L4715				
						
	moveq #8,d2				
	cmp.l d0,d2				
	jbeq _?L4581				
						
	subq.l #7,d0				
	jbeq _?L4598				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d5				
	cmp.l d0,d5				
	jbne _?L4695				
_?L4598:					
						
	move.l 170(a4),d4			
						
	moveq #11,d0				
	cmp.l d4,d0				
	jbcs _?L4583				
						
	move.b 16(a4),d6			
	addq.l #1,d4				
_?L4584:					
						
	cmp.b #7,d6				
	jbhi _?L4716				
						
	move.l 20(a4),d2			
						
	cmp.l 24(a4),d2				
	jbcc _?L4696				
						
	move.l 28(a4),a1			
						
	move.l d2,d1				
	addq.l #1,d1				
	move.l d1,20(a4)			
						
	move.l 8(a4),d0				
	move.l 12(a4),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d7				
	move.l d1,d5				
	or.b (a1,d2.l),d5			
	move.l d5,a3				
						
	addq.l #1,32(a4)			
	move.b d6,d5				
_?L4585:					
						
	move.b d5,16(a4)			
	clr.l d0				
						
	tst.b d5				
	jbeq _?L4649				
						
	move.b d5,d0				
						
	moveq #64,d1				
	sub.l d0,d1				
	move.l d1,-(sp)				
	pea -1.w				
	pea -1.w				
	jbsr ___lshrdi3				
	lea (12,sp),sp				
						
	and.l d7,d0				
	move.l a3,d2				
	and.l d2,d1				
_?L4587:					
	move.l d0,8(a4)				
	move.l d1,12(a4)			
						
	move.l d4,170(a4)			
						
	moveq #12,d0				
	cmp.l d4,d0				
	jbeq _?L4583				
	move.l d4,d0				
	addq.l #1,d0				
	cmp.b #7,d6				
	jbhi _?L4650				
						
	move.l 24(a4),a2			
						
	clr.l d2				
	move.b d5,d2				
	moveq #64,d0				
	sub.l d2,d0				
						
	moveq #32,d1				
	sub.l d2,d1				
	jbmi _?L4589				
	moveq #-1,d6				
	lsr.l d1,d6				
	clr.l d7				
_?L4595:					
						
	move.l 20(a4),d2			
						
	cmp.l a2,d2				
	jbcc _?L4696				
						
	move.l 28(a4),a1			
						
	move.l d2,d1				
	addq.l #1,d1				
	move.l d1,20(a4)			
						
	move.b (a1,d2.l),d2			
						
	move.l 8(a4),d0				
	move.l 12(a4),d1			
						
	addq.l #1,32(a4)			
						
	move.b d5,16(a4)			
						
	jbeq _?L4592				
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	or.b d2,d1				
						
	move.l d7,d2				
	and.l d0,d2				
	move.l d2,8(a4)				
	and.l d6,d1				
	move.l d1,12(a4)			
						
	addq.l #1,d4				
	move.l d4,170(a4)			
						
	moveq #12,d0				
	cmp.l d4,d0				
	jbne _?L4595				
_?L4583:					
						
	clr.l 170(a4)				
						
	moveq #8,d2				
	move.l d2,166(a4)			
_?L4581:					
						
	pea 1.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,56(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 48(sp),a1			
	tst.l d0				
	jbne _?L4697				
						
	pea 1.w					
	move.l d3,-(sp)				
	move.l a1,56(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #9,d0				
	move.l d0,166(a4)			
	move.l 48(sp),a1			
_?L4580:					
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4697				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 96(sp)				
	jbeq _?L4601				
						
	move.l 96(sp),a0			
	move.b d1,(a0)				
_?L4601:					
						
	move.b 16(a4),d0			
	cmp.b #5,d0				
	jbls _?L4642				
						
	subq.b #6,d0				
	move.b d0,16(a4)			
						
	jbeq _?L4651				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L4604				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	clr.l 170(a4)				
						
	moveq #10,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),d2			
	moveq #1,d4				
_?L4718:					
	move.l 92(sp),a0			
	move.l d2,(a0)				
	jbra _?L4713				
_?L4715:					
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	moveq #9,d1				
	cmp.l d0,d1				
	jbeq _?L4580				
						
	move.l 20(a4),d2			
						
	moveq #-1,d4				
	jbra _?L4717				
_?L4644:					
						
	moveq #-1,d1				
	moveq #31,d0				
	sub.l d2,d0				
	moveq #-2,d3				
	lsl.l d0,d3				
	move.l d1,d0				
	lsr.l d2,d0				
	or.l d3,d0				
	lsr.l d2,d1				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	clr.l 170(a4)				
						
	moveq #10,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	jbra _?L4714				
_?L4711:					
						
	move.w a2,d0				
	subq.b #8,d0				
						
	move.l 8(a4),36(sp)			
	move.l 12(a4),52(sp)			
	jbra _?L4622				
_?L4629:					
						
	moveq #31,d1				
	sub.l a1,d1				
	moveq #-2,d2				
	lsl.l d1,d2				
	move.l d2,56(sp)			
	moveq #-1,d2				
	move.l a1,d1				
	lsr.l d1,d2				
	move.l d2,52(sp)			
	move.l 56(sp),d2			
	or.l d2,52(sp)				
	moveq #-1,d2				
	lsr.l d1,d2				
	move.l d2,56(sp)			
	jbra _?L4635				
_?L4697:					
						
	move.l 20(a4),d2			
_?L4696:					
						
	clr.l d4				
						
	move.l 92(sp),a0			
	move.l d2,(a0)				
	jbra _?L4713				
_?L4652:					
	sub.l a1,a1				
	clr.l d2				
	jbra _?L4625				
_?L4626:					
						
	moveq #31,d2				
	sub.l a1,d2				
	move.l d2,60(sp)			
	moveq #-2,d2				
	move.l 60(sp),d1			
	lsl.l d1,d2				
	move.l d2,64(sp)			
	moveq #-1,d2				
	move.l a1,d1				
	lsr.l d1,d2				
	move.l d2,40(sp)			
	move.l 64(sp),d2			
	or.l d2,40(sp)				
	moveq #-1,d2				
	lsr.l d1,d2				
	move.l d2,60(sp)			
						
	move.l 60(sp),d1			
	and.l 36(sp),d1				
	move.l d1,a1				
	move.l 40(sp),d2			
	and.l 52(sp),d2				
	jbra _?L4625				
_?L4651:					
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	clr.l 170(a4)				
						
	moveq #10,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),d2			
	moveq #1,d4				
	jbra _?L4718				
_?L4604:					
						
	moveq #-1,d1				
	moveq #31,d0				
	sub.l d2,d0				
	moveq #-2,d3				
	lsl.l d0,d3				
	move.l d1,d0				
	lsr.l d2,d0				
	or.l d3,d0				
	lsr.l d2,d1				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	clr.l 170(a4)				
						
	moveq #10,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),d2			
	moveq #1,d4				
	jbra _?L4718				
_?L4653:					
						
	move.w d0,a2				
	jbra _?L4621				
_?L4716:					
						
	move.b d6,d5				
	subq.b #8,d5				
						
	move.l 8(a4),d7				
	move.l 12(a4),a3			
	jbra _?L4585				
_?L4642:					
	jbsr (_miniflac_bitreader_discard?part?0)
_?L4704:					
						
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 92(sp),a0			
	move.l d1,(a0)				
	jbra _?L4706				
_?L4592:					
						
	clr.l 8(a4)				
	clr.l 12(a4)				
						
	addq.l #1,d4				
	move.l d4,170(a4)			
						
	moveq #12,d1				
	cmp.l d4,d1				
	jbne _?L4595				
						
	clr.l 170(a4)				
						
	moveq #8,d2				
	move.l d2,166(a4)			
	jbra _?L4581				
_?L4589:					
						
	moveq #-1,d7				
	moveq #31,d2				
	sub.l d0,d2				
	moveq #-2,d1				
	lsl.l d2,d1				
	move.l d7,d6				
	lsr.l d0,d6				
	or.l d1,d6				
	lsr.l d0,d7				
	jbra _?L4595				
_?L4650:					
						
	move.l d0,d4				
	move.b d5,d6				
	jbra _?L4584				
_?L4649:					
	clr.l d1				
	jbra _?L4587				
						
	.align	2				
	.globl	_miniflac_cuesheet_track_indexpoints
						
_miniflac_cuesheet_track_indexpoints:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a6			
	move.l 56(sp),a4			
	move.l 60(sp),d4			
						
	move.l 4(a6),d0				
	jbne _?L4720				
						
	tst.l d4				
	jbeq _?L4738				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4743				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4743:					
	move.l 4(a6),d0				
_?L4720:					
						
	subq.l #1,d0				
	jbeq _?L4744				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l a4,60(a6)			
	move.l d4,56(a6)			
	clr.l 52(a6)				
	moveq #44,d6				
	add.l sp,d6				
	moveq #40,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a5	
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	move.l a6,d7				
	add.l #166,d7				
_?L4737:					
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4728				
	move.l 40(sp),28(a6)			
	move.l 44(sp),24(a6)			
	clr.l 20(a6)				
_?L4729:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4732				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4729				
_?L4730:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	move.l 52(a6),d1			
	tst.l d0				
	jbne _?L4736				
	cmp.l d4,d1				
	jbcs _?L4737				
_?L4736:					
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L4746:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4732:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L4745				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4730				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4732				
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d0				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4746				
_?L4744:					
	move.l a4,28(a6)			
	move.l d4,24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4723:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4747				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4723				
_?L4724:					
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
_?L4749:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4745:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	move.l d7,-(sp)				
	jbsr _miniflac_cuesheet_read_track_indexpoints
	lea (12,sp),sp				
	jbra _?L4730				
_?L4738:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4728:					
	move.l 52(a6),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4746				
_?L4747:					
	lea _miniflac_sync_internal,a3		
_?L4726:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L4748				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4724				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4726				
	moveq #-1,d0				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L4749				
_?L4748:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_indexpoints
	lea (12,sp),sp				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L4749				
						
	.align	2				
	.globl	_miniflac_cuesheet_index_point_offset
						
_miniflac_cuesheet_index_point_offset:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a6			
	move.l 56(sp),a4			
	move.l 60(sp),d4			
						
	move.l 4(a6),d0				
	jbne _?L4751				
						
	tst.l d4				
	jbeq _?L4769				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4774				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4774:					
	move.l 4(a6),d0				
_?L4751:					
						
	subq.l #1,d0				
	jbeq _?L4775				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l a4,60(a6)			
	move.l d4,56(a6)			
	clr.l 52(a6)				
	moveq #44,d6				
	add.l sp,d6				
	moveq #40,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a5	
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	move.l a6,d7				
	add.l #166,d7				
_?L4768:					
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4759				
	move.l 40(sp),28(a6)			
	move.l 44(sp),24(a6)			
	clr.l 20(a6)				
_?L4760:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4763				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4760				
_?L4761:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	move.l 52(a6),d1			
	tst.l d0				
	jbne _?L4767				
	cmp.l d4,d1				
	jbcs _?L4768				
_?L4767:					
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L4777:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4763:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L4776				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4761				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4763				
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d0				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4777				
_?L4775:					
	move.l a4,28(a6)			
	move.l d4,24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4754:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4778				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4754				
_?L4755:					
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
_?L4780:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4776:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	move.l d7,-(sp)				
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
	jbra _?L4761				
_?L4769:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4759:					
	move.l 52(a6),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4777				
_?L4778:					
	lea _miniflac_sync_internal,a3		
_?L4757:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L4779				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4755				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4757				
	moveq #-1,d0				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L4780				
_?L4779:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L4780				
						
	.align	2				
	.globl	_miniflac_cuesheet_index_point_number
						
_miniflac_cuesheet_index_point_number:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L4782				
						
	tst.l 60(sp)				
	jbeq _?L4812				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4837				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4837:					
	move.l 4(a4),d0				
_?L4782:					
						
	subq.l #1,d0				
	jbeq _?L4838				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L4811:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4798				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L4799:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L4802				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4799				
_?L4800:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L4839				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L4811				
_?L4844:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L4841:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4802:					
	moveq #5,d1				
	cmp.l 114(a4),d1			
	jbeq _?L4840				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4800				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L4802				
_?L4803:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4841				
_?L4838:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4785:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L4842				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d5				
	cmp.l d0,d5				
	jbeq _?L4785				
_?L4832:					
	move.l 20(a4),d2			
_?L4786:					
	move.l 64(sp),a0			
	move.l d2,(a0)				
_?L4847:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4840:					
						
	move.l 166(a4),d0			
						
	moveq #12,d1				
	cmp.l d0,d1				
	jbcs _?L4843				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4800				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L4808				
_?L4845:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L4811				
	jbra _?L4844				
_?L4843:					
						
	moveq #13,d1				
	cmp.l d0,d1				
	jbne _?L4803				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4845				
	jbra _?L4808				
_?L4812:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4808:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L4810				
						
	move.l 68(sp),a0			
	move.b d1,(a0)				
_?L4810:					
						
	clr.l 170(a4)				
						
	moveq #14,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4841				
_?L4798:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4841				
_?L4842:					
	lea _miniflac_sync_internal,a3		
_?L4788:					
	moveq #5,d0				
	cmp.l 114(a4),d0			
	jbeq _?L4846				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4832				
	moveq #4,d5				
	cmp.l (a4),d5				
	jbeq _?L4788				
	move.l 20(a4),d2			
						
	moveq #-1,d4				
_?L4850:					
						
	move.l 64(sp),a0			
	move.l d2,(a0)				
	jbra _?L4847				
_?L4846:					
						
	move.l 166(a4),d0			
						
	moveq #12,d1				
	cmp.l d0,d1				
	jbcs _?L4848				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4832				
_?L4792:					
						
	move.b 16(a4),d4			
						
	cmp.b #7,d4				
	jbhi _?L4796				
						
	move.l 20(a4),d2			
						
	cmp.l 24(a4),d2				
	jbcc _?L4849				
						
	move.l 28(a4),a1			
						
	move.l d2,d1				
	addq.l #1,d1				
	move.l d1,20(a4)			
						
	move.l 8(a4),d0				
	move.l 12(a4),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.b (a1,d2.l),d2			
	and.l #255,d2				
	clr.l d5				
	or.l d0,d5				
	move.l d5,8(a4)				
	or.l d1,d2				
	move.l d2,12(a4)			
						
	addq.b #8,d4				
	move.b d4,16(a4)			
						
	addq.l #1,32(a4)			
_?L4796:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L4795				
						
	move.l 68(sp),a0			
	move.b d1,(a0)				
_?L4795:					
						
	clr.l 170(a4)				
						
	moveq #14,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),d2			
	moveq #1,d4				
	move.l 64(sp),a0			
	move.l d2,(a0)				
	jbra _?L4847				
_?L4848:					
						
	moveq #13,d5				
	cmp.l d0,d5				
	jbeq _?L4792				
						
	move.l 20(a4),d2			
						
	moveq #-1,d4				
	jbra _?L4850				
_?L4849:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l d2,(a0)				
	jbra _?L4847				
_?L4839:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4841				
						
	.align	2				
	.globl	_miniflac_seektable_seekpoints	
						
_miniflac_seektable_seekpoints:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a6			
	move.l 56(sp),a4			
	move.l 60(sp),d5			
						
	move.l 4(a6),d0				
	jbne _?L4852				
						
	tst.l d5				
	jbeq _?L4874				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4883				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4883:					
	move.l 4(a6),d0				
_?L4852:					
						
	subq.l #1,d0				
	jbeq _?L4884				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l a4,60(a6)			
	move.l d5,56(a6)			
	clr.l 52(a6)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4873:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4862				
	move.l 40(sp),28(a6)			
	move.l 44(sp),24(a6)			
	clr.l 20(a6)				
_?L4863:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4866				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4863				
_?L4864:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	move.l 52(a6),d1			
	tst.l d0				
	jbne _?L4885				
	cmp.l d5,d1				
	jbcs _?L4873				
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L4887:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4866:					
	moveq #3,d1				
	cmp.l 114(a6),d1			
	jbeq _?L4886				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4864				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4866				
_?L4867:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4887				
_?L4884:					
	move.l a4,28(a6)			
	move.l d5,24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4855:					
	moveq #4,d1				
	cmp.l (a6),d1				
	jbeq _?L4888				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4855				
_?L4856:					
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
_?L4890:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4886:					
						
	tst.l 178(a6)				
	jbne _?L4867				
						
	tst.l 68(sp)				
	jbeq _?L4880				
						
	move.l 68(sp),a0			
	move.l 182(a6),(a0)			
_?L4880:					
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4887				
_?L4874:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4862:					
	move.l 52(a6),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4887				
_?L4888:					
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4858:					
	moveq #3,d0				
	cmp.l 114(a6),d0			
	jbeq _?L4889				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4856				
	moveq #4,d1				
	cmp.l (a6),d1				
	jbeq _?L4858				
_?L4860:					
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L4890				
_?L4889:					
						
	tst.l 178(a6)				
	jbne _?L4860				
						
	tst.l 68(sp)				
	jbeq _?L4861				
						
	move.l 68(sp),a0			
	move.l 182(a6),(a0)			
_?L4861:					
						
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L4890				
_?L4885:					
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4887				
						
	.align	2				
	.globl	_miniflac_seektable_sample_number
						
_miniflac_seektable_sample_number:		
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
	move.l 60(sp),a4			
	move.l 64(sp),d3			
	move.l 68(sp),36(sp)			
	move.l 72(sp),d4			
						
	move.l 4(a3),d0				
	jbne _?L4892				
						
	tst.l d3				
	jbeq _?L4899				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbeq _?L4903				
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4903:					
	move.l 4(a3),d0				
_?L4892:					
						
	subq.l #1,d0				
	jbeq _?L4904				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l a4,60(a3)			
	move.l d3,56(a3)			
	clr.l 52(a3)				
	moveq #44,d5				
	add.l sp,d5				
	moveq #40,d7				
	add.l sp,d7				
	lea _miniflac_oggfunction_start,a5	
	lea _miniflac_oggfunction_end,a6	
_?L4898:					
	move.l d5,-(sp)				
	move.l d7,-(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d6				
	moveq #1,d0				
	cmp.l d6,d0				
	jbne _?L4895				
	move.l d4,-(sp)				
	pea 52(sp)				
	move.l 52(sp),-(sp)			
	move.l 52(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_seektable_sample_number_native
	lea (20,sp),sp				
	move.l d0,d6				
	move.l 48(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	tst.l d6				
	jbne _?L4897				
	cmp.l d3,d1				
	jbcs _?L4898				
_?L4897:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L4905:					
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4904:					
						
	move.l d4,72(sp)			
	move.l 36(sp),68(sp)			
	move.l d3,64(sp)			
	move.l a4,60(sp)			
	move.l a3,56(sp)			
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	jbra _miniflac_seektable_sample_number_native
_?L4899:					
						
	clr.l d6				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4895:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L4905				
						
	.align	2				
	.globl	_miniflac_seektable_sample_offset
						
_miniflac_seektable_sample_offset:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L4907				
						
	tst.l 60(sp)				
	jbeq _?L4938				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4959				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4959:					
	move.l 4(a4),d0				
_?L4907:					
						
	subq.l #1,d0				
	jbeq _?L4960				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L4937:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4921				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L4922:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L4925				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4922				
_?L4923:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L4961				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L4937				
_?L4965:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L4963:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4925:					
	moveq #3,d1				
	cmp.l 114(a4),d1			
	jbeq _?L4962				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4923				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L4925				
_?L4926:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4963				
_?L4960:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4910:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L4964				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4910				
_?L4911:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L4968:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4962:					
						
	move.l 178(a4),d0			
						
	jbeq _?L4928				
	subq.l #1,d0				
	jbne _?L4926				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L4935				
_?L4956:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L4937				
	jbra _?L4965				
_?L4928:					
						
	move.l 186(a4),a0			
	cmp.l 182(a4),a0			
	jbeq _?L4966				
						
	pea 64.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L4956				
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,178(a4)			
	move.l 36(sp),a1			
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4956				
_?L4935:					
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L4936				
						
	move.l 68(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L4936:					
						
	moveq #2,d0				
	move.l d0,178(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4963				
_?L4938:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4966:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
						
	moveq #2,d4				
						
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4963				
_?L4921:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4963				
_?L4964:					
	lea _miniflac_sync_internal,a3		
_?L4913:					
	moveq #3,d0				
	cmp.l 114(a4),d0			
	jbeq _?L4967				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4911				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L4913				
_?L4917:					
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4968				
_?L4967:					
						
	move.l 178(a4),d0			
						
	jbeq _?L4915				
	subq.l #1,d0				
	jbne _?L4917				
	lea _miniflac_bitreader_fill_nocrc,a1	
_?L4916:					
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4919				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L4920				
						
	move.l 68(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L4920:					
						
	moveq #2,d0				
	move.l d0,178(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4968				
_?L4919:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4968				
_?L4915:					
						
	move.l 186(a4),a0			
	cmp.l 182(a4),a0			
	jbeq _?L4939				
						
	pea 64.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L4919				
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,178(a4)			
	move.l 36(sp),a1			
	jbra _?L4916				
_?L4939:					
						
	moveq #2,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4968				
_?L4961:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4963				
						
	.align	2				
	.globl	_miniflac_seektable_samples	
						
_miniflac_seektable_samples:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L4970				
						
	tst.l 60(sp)				
	jbeq _?L5004				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5032				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5032:					
	move.l 4(a4),d0				
_?L4970:					
						
	subq.l #1,d0				
	jbeq _?L5033				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L5003:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4985				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L4986:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L4989				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4986				
_?L4987:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L5034				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L5003				
_?L5040:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L5036:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4989:					
	moveq #3,d1				
	cmp.l 114(a4),d1			
	jbeq _?L5035				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4987				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L4989				
_?L4990:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5036				
_?L5033:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4973:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L5037				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4973				
_?L4974:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L5042:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5035:					
						
	move.l 178(a4),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L5038				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a1	
	jbeq _?L4995				
						
	move.l 186(a4),a0			
	cmp.l 182(a4),a0			
	jbeq _?L4996				
						
	pea 64.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbeq _?L5039				
_?L4997:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L5003				
	jbra _?L5040				
_?L5038:					
						
	subq.l #2,d0				
	jbne _?L4990				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4997				
_?L5000:					
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L5001				
						
	move.l 68(sp),a0			
	move.w d1,(a0)				
_?L5001:					
						
	addq.l #1,186(a4)			
						
	clr.l 178(a4)				
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5036				
_?L5004:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5039:					
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,178(a4)			
	move.l 36(sp),a1			
_?L4995:					
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L4997				
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,178(a4)			
	move.l 36(sp),a1			
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4997				
	jbra _?L5000				
_?L4985:					
						
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5036				
_?L5037:					
	lea _miniflac_sync_internal,a3		
_?L4976:					
	moveq #3,d0				
	cmp.l 114(a4),d0			
	jbeq _?L5041				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4974				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L4976				
	moveq #-1,d4				
_?L5044:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5042				
_?L5041:					
						
	move.l 178(a4),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L5043				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a1	
	jbeq _?L4981				
						
	move.l 186(a4),a0			
	cmp.l 182(a4),a0			
	jbeq _?L5005				
						
	pea 64.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L4983				
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,178(a4)			
	move.l 36(sp),a1			
_?L4981:					
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L4983				
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,178(a4)			
	move.l 36(sp),a1			
_?L4979:					
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4983				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L4984				
						
	move.l 68(sp),a0			
	move.w d1,(a0)				
_?L4984:					
						
	addq.l #1,186(a4)			
						
	clr.l 178(a4)				
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5042				
_?L5043:					
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	subq.l #2,d0				
	jbeq _?L4979				
						
	moveq #-1,d4				
	jbra _?L5044				
_?L4996:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
						
	moveq #2,d4				
						
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5036				
_?L4983:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5042				
_?L5034:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5036				
_?L5005:					
						
	moveq #2,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5042				
						
	.align	2				
	.globl	_miniflac_application_id	
						
_miniflac_application_id:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L5046				
						
	tst.l 60(sp)				
	jbeq _?L5069				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5084				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5084:					
	move.l 4(a4),d0				
_?L5046:					
						
	subq.l #1,d0				
	jbeq _?L5085				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l d5,60(a4)			
	move.l 60(sp),56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a5	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	lea _miniflac_oggfunction_end,a6	
_?L5068:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5056				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L5057:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5060				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5057				
_?L5058:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L5086				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L5068				
_?L5090:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L5088:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5060:					
	moveq #2,d1				
	cmp.l 114(a4),d1			
	jbeq _?L5087				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5058				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5060				
_?L5061:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5088				
_?L5085:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5049:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L5089				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5049				
_?L5050:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L5092:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5087:					
						
	tst.l 190(a4)				
	jbne _?L5061				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L5064				
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L5068				
	jbra _?L5090				
_?L5069:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5064:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L5066				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L5066:					
						
	moveq #1,d0				
	move.l d0,190(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5088				
_?L5056:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5088				
_?L5089:					
	lea _miniflac_sync_internal,a3		
_?L5052:					
	moveq #2,d0				
	cmp.l 114(a4),d0			
	jbeq _?L5091				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5050				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L5052				
_?L5054:					
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5092				
_?L5091:					
						
	tst.l 190(a4)				
	jbne _?L5054				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5070				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L5055				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L5055:					
						
	moveq #1,d0				
	move.l d0,190(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5092				
_?L5070:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5092				
_?L5086:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5088				
						
	.align	2				
	.globl	_miniflac_application_length	
						
_miniflac_application_length:			
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
	move.l 60(sp),a4			
	move.l 64(sp),d3			
	move.l 68(sp),36(sp)			
	move.l 72(sp),d4			
						
	move.l 4(a3),d0				
	jbne _?L5094				
						
	tst.l d3				
	jbeq _?L5101				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbeq _?L5105				
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5105:					
	move.l 4(a3),d0				
_?L5094:					
						
	subq.l #1,d0				
	jbeq _?L5106				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l a4,60(a3)			
	move.l d3,56(a3)			
	clr.l 52(a3)				
	moveq #44,d5				
	add.l sp,d5				
	moveq #40,d7				
	add.l sp,d7				
	lea _miniflac_oggfunction_start,a5	
	lea _miniflac_oggfunction_end,a6	
_?L5100:					
	move.l d5,-(sp)				
	move.l d7,-(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d6				
	moveq #1,d0				
	cmp.l d6,d0				
	jbne _?L5097				
	move.l d4,-(sp)				
	pea 52(sp)				
	move.l 52(sp),-(sp)			
	move.l 52(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_application_length_native
	lea (20,sp),sp				
	move.l d0,d6				
	move.l 48(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	tst.l d6				
	jbne _?L5099				
	cmp.l d3,d1				
	jbcs _?L5100				
_?L5099:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L5107:					
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5106:					
						
	move.l d4,72(sp)			
	move.l 36(sp),68(sp)			
	move.l d3,64(sp)			
	move.l a4,60(sp)			
	move.l a3,56(sp)			
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	jbra _miniflac_application_length_native
_?L5101:					
						
	clr.l d6				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5097:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L5107				
						
	.align	2				
	.globl	_miniflac_application_data	
						
_miniflac_application_data:			
	lea (-20,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 60(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L5109				
						
	tst.l 68(sp)				
	jbeq _?L5173				
	subq.l #4,sp				
	move.l 68(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5197				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L5197:					
	move.l 4(a3),d0				
_?L5109:					
						
	subq.l #1,d0				
	jbeq _?L5198				
						
	clr.l 48(sp)				
	clr.l 52(sp)				
	move.l 64(sp),60(a3)			
	move.l 68(sp),56(a3)			
	clr.l 52(a3)				
	moveq #52,d5				
	add.l sp,d5				
	lea _miniflac_oggfunction_start,a5	
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
	lea _miniflac_oggfunction_end,a6	
_?L5172:					
	move.l d5,-(sp)				
	pea 52(sp)				
	move.l 72(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5132				
	move.l 48(sp),28(a3)			
	move.l 52(sp),24(a3)			
	clr.l 20(a3)				
_?L5133:					
	moveq #4,d6				
	cmp.l (a3),d6				
	jbeq _?L5136				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5133				
_?L5134:					
	move.l 20(a3),d1			
_?L5138:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbne _?L5199				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L5172				
_?L5205:					
	clr.l d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
_?L5201:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L5136:					
	moveq #2,d0				
	cmp.l 114(a3),d0			
	jbeq _?L5200				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5134				
	moveq #4,d6				
	cmp.l (a3),d6				
	jbeq _?L5136				
_?L5139:					
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L5201				
_?L5198:					
	move.l 64(sp),28(a3)			
	move.l 68(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L5112:					
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L5202				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d6				
	cmp.l d0,d6				
	jbeq _?L5112				
_?L5113:					
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
_?L5209:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L5200:					
						
	move.l 190(a3),d0			
						
	jbeq _?L5141				
	subq.l #1,d0				
	jbne _?L5139				
_?L5142:					
						
	move.l 198(a3),a1			
						
	move.l 194(a3),d2			
						
	cmp.l d2,a1				
	jbcc _?L5161				
	tst.l 76(sp)				
	jbeq _?L5203				
_?L5162:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L5204				
_?L5155:					
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L5165				
	move.l d1,d6				
	move.l d1,a2				
						
	move.l 28(a3),a0			
						
	addq.l #1,d6				
	move.l d6,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d7,d1				
	or.b (a0,a2.l),d1			
	move.l d1,36(sp)			
						
	addq.l #1,32(a3)			
						
	move.b d0,16(a3)			
						
	clr.l d7				
	move.b d0,d7				
						
	jbeq _?L5174				
_?L5206:					
						
	move.w #64,a0				
	sub.l d7,a0				
						
	moveq #32,d0				
	sub.l d7,d0				
	jbmi _?L5148				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,a2				
	clr.l d0				
						
	and.l d6,d0				
	move.l d0,a0				
	move.l a2,d0				
	and.l 36(sp),d0				
_?L5147:					
	move.l a0,8(a3)				
	move.l d0,12(a3)			
						
	cmp.l 80(sp),a1				
	jbcc _?L5150				
						
	move.w #-32,a0				
	add.l d7,a0				
	tst.l a0				
	jblt _?L5151				
	move.l a0,d0				
	lsr.l d0,d6				
						
	move.l 76(sp),a0			
	move.b d6,(a0,a1.l)			
						
	move.l 198(a3),a1			
	addq.l #1,a1				
	move.l a1,198(a3)			
						
	move.l 194(a3),d2			
						
	cmp.l a1,d2				
	jbhi _?L5162				
_?L5161:					
						
	tst.l 84(sp)				
	jbeq _?L5157				
						
	move.l 80(sp),d0			
	cmp.l d0,d2				
	jbcc _?L5158				
	move.l d2,d0				
_?L5158:					
						
	move.l 84(sp),a2			
	move.l d0,(a2)				
_?L5157:					
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L5201				
_?L5165:					
	move.l 44(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L5172				
	jbra _?L5205				
_?L5150:					
						
	move.l 198(a3),a1			
	addq.l #1,a1				
	move.l a1,198(a3)			
						
	cmp.l a1,d2				
	jbls _?L5161				
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbls _?L5155				
_?L5204:					
						
	move.l 8(a3),d6				
	move.l 12(a3),36(sp)			
						
	subq.b #8,d0				
	move.b d0,16(a3)			
						
	clr.l d7				
	move.b d0,d7				
						
	jbne _?L5206				
_?L5174:					
	sub.l a0,a0				
	clr.l d0				
	jbra _?L5147				
_?L5148:					
						
	moveq #31,d0				
	sub.l a0,d0				
	moveq #-2,d1				
	lsl.l d0,d1				
	move.l d1,44(sp)			
	moveq #-1,d0				
	move.l a0,d1				
	lsr.l d1,d0				
	or.l 44(sp),d0				
	move.l d0,a2				
	moveq #-1,d0				
	lsr.l d1,d0				
						
	and.l d6,d0				
	move.l d0,a0				
	move.l a2,d0				
	and.l 36(sp),d0				
	jbra _?L5147				
_?L5151:					
						
	add.l d6,d6				
	moveq #31,d0				
	sub.l d7,d0				
	move.l d6,d2				
	lsl.l d0,d2				
	move.l 36(sp),d6			
	lsr.l d7,d6				
	or.l d2,d6				
						
	move.l 76(sp),a0			
	move.b d6,(a0,a1.l)			
						
	move.l 198(a3),a1			
	addq.l #1,a1				
	move.l a1,198(a3)			
						
	move.l 194(a3),d2			
						
	cmp.l a1,d2				
	jbhi _?L5162				
	jbra _?L5161				
_?L5173:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L5203:					
						
	move.w #-1,a1				
_?L5171:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L5207				
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L5165				
	move.l d1,a2				
						
	addq.l #1,d1				
	move.l d1,20(a3)			
						
	move.l 8(a3),d6				
	move.l 12(a3),d7			
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d7,d1				
	move.l 28(a3),a0			
	or.b (a0,a2.l),d1			
	move.l d1,44(sp)			
						
	addq.l #1,32(a3)			
_?L5164:					
						
	move.b d0,16(a3)			
						
	jbeq _?L5166				
						
	and.l #255,d0				
						
	move.w #64,a0				
	sub.l d0,a0				
						
	moveq #32,d7				
	sub.l d0,d7				
	jbmi _?L5167				
	move.l a1,d0				
	lsr.l d7,d0				
	clr.l d7				
						
	and.l d6,d7				
	move.l d7,8(a3)				
	and.l 44(sp),d0				
	move.l d0,12(a3)			
						
	move.l 198(a3),d0			
	addq.l #1,d0				
	move.l d0,198(a3)			
						
	cmp.l d2,d0				
	jbcs _?L5171				
	jbra _?L5161				
_?L5166:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 198(a3),d0			
	addq.l #1,d0				
	move.l d0,198(a3)			
						
	cmp.l d2,d0				
	jbcs _?L5171				
	jbra _?L5161				
_?L5167:					
						
	moveq #31,d0				
	sub.l a0,d0				
	moveq #-2,d7				
	lsl.l d0,d7				
	move.l a1,d0				
	move.l a0,d1				
	lsr.l d1,d0				
	or.l d7,d0				
	move.l a1,d7				
	lsr.l d1,d7				
						
	and.l d6,d7				
	move.l d7,8(a3)				
	and.l 44(sp),d0				
	move.l d0,12(a3)			
						
	move.l 198(a3),d0			
	addq.l #1,d0				
	move.l d0,198(a3)			
						
	cmp.l d2,d0				
	jbcs _?L5171				
	jbra _?L5161				
_?L5132:					
						
	move.l 52(a3),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L5201				
_?L5202:					
	lea _miniflac_sync_internal,a4		
_?L5115:					
	moveq #2,d0				
	cmp.l 114(a3),d0			
	jbeq _?L5208				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5113				
	moveq #4,d6				
	cmp.l (a3),d6				
	jbeq _?L5115				
_?L5116:					
	moveq #-1,d4				
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L5209				
_?L5141:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L5160				
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L5172				
	jbra _?L5205				
_?L5207:					
						
	move.l 8(a3),d6				
	move.l 12(a3),44(sp)			
						
	subq.b #8,d0				
	jbra _?L5164				
_?L5160:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,190(a3)			
	jbra _?L5142				
_?L5208:					
						
	move.l 190(a3),d0			
						
	jbeq _?L5118				
	subq.l #1,d0				
	jbne _?L5116				
_?L5119:					
						
	move.l 198(a3),d4			
						
	move.l 194(a3),d5			
						
	cmp.l d4,d5				
	jbls _?L5131				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
	tst.l 76(sp)				
	jbeq _?L5122				
_?L5120:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5129				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	cmp.l 80(sp),d4				
	jbcc _?L5125				
						
	move.l 76(sp),a0			
	move.b d1,(a0,d4.l)			
_?L5125:					
						
	move.l 198(a3),d4			
	addq.l #1,d4				
	move.l d4,198(a3)			
						
	move.l 194(a3),d5			
						
	cmp.l d4,d5				
	jbhi _?L5120				
_?L5131:					
						
	tst.l 84(sp)				
	jbeq _?L5127				
						
	move.l 80(sp),d0			
	cmp.l d0,d5				
	jbcc _?L5128				
	move.l d5,d0				
_?L5128:					
						
	move.l 84(sp),a2			
	move.l d0,(a2)				
_?L5127:					
						
	moveq #1,d4				
						
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L5209				
_?L5122:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5129				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 198(a3),d0			
	addq.l #1,d0				
	move.l d0,198(a3)			
						
	cmp.l d0,d5				
	jbhi _?L5122				
	jbra _?L5131				
_?L5129:					
						
	clr.l d4				
						
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L5209				
_?L5118:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5129				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,190(a3)			
	jbra _?L5119				
_?L5199:					
						
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L5201				
						
	.align	2				
	.globl	_miniflac_padding_length	
						
_miniflac_padding_length:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),a5			
	move.l 60(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L5211				
						
	tst.l d5				
	jbeq _?L5231				
	subq.l #4,sp				
	move.b (a5),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5239				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5239:					
	move.l 4(a4),d0				
_?L5211:					
						
	subq.l #1,d0				
	jbeq _?L5240				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	move.l a5,60(a4)			
	move.l d5,56(a4)			
	clr.l 52(a4)				
	moveq #44,d7				
	add.l sp,d7				
	moveq #40,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a6	
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5230:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l a5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a6)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5220				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L5221:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5224				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5221				
_?L5222:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	move.l 52(a4),d1			
	tst.l d0				
	jbne _?L5241				
	cmp.l d5,d1				
	jbcs _?L5230				
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L5243:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5224:					
	moveq #1,d1				
	cmp.l 114(a4),d1			
	jbeq _?L5242				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5222				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5224				
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5243				
_?L5240:					
	move.l a5,28(a4)			
	move.l d5,24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5214:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L5244				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5214				
_?L5215:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L5246:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5242:					
						
	tst.l 68(sp)				
	jbeq _?L5227				
						
	move.l 68(sp),a0			
	move.l 202(a4),(a0)			
_?L5227:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5243				
_?L5231:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5220:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5243				
_?L5244:					
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5217:					
	moveq #1,d0				
	cmp.l 114(a4),d0			
	jbeq _?L5245				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5215				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L5217				
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5246				
_?L5245:					
						
	tst.l 68(sp)				
	jbeq _?L5219				
						
	move.l 68(sp),a0			
	move.l 202(a4),(a0)			
_?L5219:					
						
	moveq #1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5246				
_?L5241:					
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5243				
						
	.align	2				
	.globl	_miniflac_padding_data		
						
_miniflac_padding_data:				
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
	move.l 60(sp),a4			
	move.l 64(sp),d3			
	move.l 68(sp),36(sp)			
	move.l 72(sp),d4			
	move.l 76(sp),d5			
	move.l 80(sp),d6			
						
	move.l 4(a3),d0				
	jbne _?L5248				
						
	tst.l d3				
	jbeq _?L5255				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d7				
						
	moveq #1,d0				
	cmp.l d7,d0				
	jbeq _?L5259				
	move.l d7,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5259:					
	move.l 4(a3),d0				
_?L5248:					
						
	subq.l #1,d0				
	jbeq _?L5260				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l a4,60(a3)			
	move.l d3,56(a3)			
	clr.l 52(a3)				
	lea _miniflac_oggfunction_start,a5	
	lea _miniflac_oggfunction_end,a6	
_?L5254:					
	pea 44(sp)				
	pea 44(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d7				
	moveq #1,d0				
	cmp.l d7,d0				
	jbne _?L5251				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l d4,-(sp)				
	pea 60(sp)				
	move.l 60(sp),-(sp)			
	move.l 60(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_padding_data_native	
	lea (28,sp),sp				
	move.l d0,d7				
	move.l 48(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	tst.l d7				
	jbne _?L5253				
	cmp.l d3,d1				
	jbcs _?L5254				
_?L5253:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L5261:					
	move.l d7,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5260:					
						
	move.l d6,80(sp)			
	move.l d5,76(sp)			
	move.l d4,72(sp)			
	move.l 36(sp),68(sp)			
	move.l d3,64(sp)			
	move.l a4,60(sp)			
	move.l a3,56(sp)			
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	jbra _miniflac_padding_data_native	
_?L5255:					
						
	clr.l d7				
						
	move.l d7,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5251:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L5261				
						
	.data					
						
						
_escape_codes:					
	.dc.b $0f,$1f				
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
						
