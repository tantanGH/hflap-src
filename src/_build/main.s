* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"main.c"			
						
						
						
						
						
	.text					
	.data					
_?LC0:						
	.dc.b $48,$46,$4c,$41,$50,$2e,$58,$20
	.dc.b $2d,$20,$48,$69,$67,$68,$20,$4d
	.dc.b $65,$6d,$6f,$72,$79,$20,$46,$4c
	.dc.b $41,$43,$20,$70,$6c,$61,$79,$65
	.dc.b $72,$20,$66,$6f,$72,$20,$58,$36
	.dc.b $38,$30,$78,$30,$20,$76,$65,$72
	.dc.b $73,$69,$6f,$6e,$20,$30,$2e,$31
	.dc.b $2e,$33,$20,$28,$32,$30,$32,$34
	.dc.b $2f,$30,$33,$2f,$31,$33,$29,$20
	.dc.b $62,$79,$20,$74,$61,$6e,$74,$61
	.dc.b $6e
	.dc.b $00				
_?LC1:						
	.dc.b $75,$73,$61,$67,$65,$3a,$20,$68
	.dc.b $66,$6c,$61,$70,$20,$5b,$6f,$70
	.dc.b $74,$69,$6f,$6e,$73,$5d,$20,$3c
	.dc.b $69,$6e,$70,$75,$74,$2d,$66,$69
	.dc.b $6c,$65,$2e,$66,$6c,$61,$3e
	.dc.b $00				
_?LC2:						
	.dc.b $6f,$70,$74,$69,$6f,$6e,$73,$3a
	.dc.b $00				
_?LC3:						
	.dc.b $20,$20,$20,$20,$20,$2d,$6c,$5b
	.dc.b $6e,$5d,$20,$2e,$2e,$2e,$20,$6c
	.dc.b $6f,$6f,$70,$20,$63,$6f,$75,$6e
	.dc.b $74,$20,$28,$6e,$6f,$6e,$65,$3a
	.dc.b $65,$6e,$64,$6c,$65,$73,$73,$2c
	.dc.b $20,$64,$65,$66,$61,$75,$6c,$74
	.dc.b $3a,$31,$29
	.dc.b $00				
_?LC4:						
	.dc.b $20,$20,$20,$20,$20,$2d,$76,$3c
	.dc.b $6e,$3e,$20,$2e,$2e,$2e,$20,$76
	.dc.b $6f,$6c,$75,$6d,$65,$20,$28,$31
	.dc.b $2d,$31,$35,$2c,$20,$64,$65,$66
	.dc.b $61,$75,$6c,$74,$3a,$25,$64,$29
	.dc.b $0a
	.dc.b $00				
_?LC5:						
	.dc.b $20,$20,$20,$20,$20,$2d,$62,$3c
	.dc.b $6e,$3e,$20,$2e,$2e,$2e,$20,$62
	.dc.b $75,$66,$66,$65,$72,$20,$73,$69
	.dc.b $7a,$65,$20,$5b,$78,$20,$36,$34
	.dc.b $4b,$42,$5d,$20,$28,$33,$2d,$33
	.dc.b $32,$2c,$64,$65,$66,$61,$75,$6c
	.dc.b $74,$3a,$25,$64,$29,$0a
	.dc.b $00				
_?LC6:						
	.dc.b $20,$20,$20,$20,$20,$2d,$6e,$20
	.dc.b $20,$20,$20,$2e,$2e,$2e,$20,$6e
	.dc.b $6f,$20,$70,$72,$6f,$67,$72,$65
	.dc.b $73,$73,$20,$62,$61,$72
	.dc.b $00				
_?LC7:						
	.dc.b $20,$20,$20,$20,$20,$2d,$73,$20
	.dc.b $20,$20,$20,$2e,$2e,$2e,$20,$75
	.dc.b $73,$65,$20,$6d,$61,$69,$6e,$20
	.dc.b $6d,$65,$6d,$6f,$72,$79,$20,$66
	.dc.b $6f,$72,$20,$66,$69,$6c,$65,$20
	.dc.b $72,$65,$61,$64,$69,$6e,$67,$20
	.dc.b $28,$53,$43,$53,$49,$20,$64,$69
	.dc.b $73,$6b,$29
	.dc.b $00				
_?LC8:						
	.dc.b $20,$20,$20,$20,$20,$2d,$68,$20
	.dc.b $20,$20,$20,$2e,$2e,$2e,$20,$73
	.dc.b $68,$6f,$77,$20,$68,$65,$6c,$70
	.dc.b $20,$6d,$65,$73,$73,$61,$67,$65
	.dc.b $00				
	.text					
	.align	2				
						
_show_help_message:				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
						
	pea _?LC0				
	lea _puts,a3				
	jbsr (a3)				
						
	move.l #_?LC1,(sp)			
	jbsr (a3)				
						
	move.l #_?LC2,(sp)			
	jbsr (a3)				
						
	move.l #_?LC3,(sp)			
	jbsr (a3)				
						
	moveq #6,d0				
	move.l d0,(sp)				
	pea _?LC4				
	lea _printf,a4				
	jbsr (a4)				
	addq.l #8,sp				
						
	pea 4.w					
	pea _?LC5				
	jbsr (a4)				
						
	addq.l #4,sp				
	move.l #_?LC6,(sp)			
	jbsr (a3)				
						
	move.l #_?LC7,(sp)			
	jbsr (a3)				
						
	move.l #_?LC8,(sp)			
	jbsr (a3)				
	addq.l #4,sp				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
						
	.data					
_?LC9:						
	.dc.b $41,$62,$6f,$72,$74,$65,$64,$2e
	.dc.b $00				
	.text					
	.align	2				
						
_abort_application:				
	movem.l d3/a3/a4/a5,-(sp)		
						
	move.l _g_abort_vector1,-(sp)		
	move.l #65521,-(sp)			
	lea _INTVCS,a3				
	jbsr (a3)				
						
	addq.l #4,sp				
	move.l _g_abort_vector2,(sp)		
	move.l #65522,-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
						
	lea _pcm8pp_isavailable,a5		
	jbsr (a5)				
						
	tst.l d0				
	jbne _?L39				
_?L4:						
						
	jbsr _pcm8a_isavailable			
						
	tst.l d0				
	jbeq _?L5				
						
	move.l _g_init_chain_table,a3		
						
	tst.l a3				
	jbeq _?L6				
	lea _himem_free,a4			
_?L9:						
						
	move.l (a3),d0				
						
	jbeq _?L7				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
_?L7:						
						
	move.l 6(a3),d3				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d3				
	jbeq _?L6				
						
	move.l d3,a3				
	jbra _?L9				
_?L6:						
						
	clr.l _g_init_chain_table		
_?L5:						
						
	jbsr (a5)				
						
	tst.l d0				
	jbeq _?L10				
						
	move.l _g_init_chain_table_ex,a3	
						
	tst.l a3				
	jbeq _?L11				
	lea _himem_free,a4			
_?L14:						
						
	move.l (a3),d0				
						
	jbeq _?L12				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
_?L12:						
						
	move.l 8(a3),d3				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d3				
	jbeq _?L11				
						
	move.l d3,a3				
	jbra _?L14				
_?L11:						
						
	clr.l _g_init_chain_table_ex		
_?L10:						
						
	jbsr _C_CURON				
						
	move.l _g_funckey_mode,d0		
						
	jbpl _?L40				
						
	pea 255.w				
	jbsr _KFLUSHIO				
						
	move.l #_?LC9,(sp)			
	jbsr _puts				
						
	moveq #1,d0				
	move.l d0,(sp)				
	jbsr _exit				
_?L40:						
						
	move.l d0,-(sp)				
	jbsr _C_FNKMOD				
	addq.l #4,sp				
						
	pea 255.w				
	jbsr _KFLUSHIO				
						
	move.l #_?LC9,(sp)			
	jbsr _puts				
						
	moveq #1,d0				
	move.l d0,(sp)				
	jbsr _exit				
_?L39:						
						
	jbsr _pcm8pp_stop			
						
	move.w _g_original_pcm8pp_frequency_mode+2,a0
	move.l a0,-(sp)				
	jbsr _pcm8pp_set_frequency_mode		
	addq.l #4,sp				
	jbra _?L4				
						
	.data					
_?LC10:						
	.dc.b $2e,$2e,$2f,$6d,$69,$6e,$69,$66
	.dc.b $6c,$61,$63,$2d,$31,$2e,$31,$2e
	.dc.b $31,$2f,$6d,$69,$6e,$69,$66,$6c
	.dc.b $61,$63,$2e,$68
	.dc.b $00				
_?LC11:						
	.dc.b $62,$69,$74,$73,$20,$3c,$3d,$20
	.dc.b $62,$72,$2d,$3e,$62,$69,$74,$73
	.dc.b $00				
_?LC12:						
	.dc.b $41,$73,$73,$65,$72,$74,$69,$6f
	.dc.b $6e,$20,$66,$61,$69,$6c,$65,$64
	.dc.b $3a,$20,$25,$73,$2c,$20,$66,$69
	.dc.b $6c,$65,$20,$25,$73,$2c,$20,$6c
	.dc.b $69,$6e,$65,$20,$25,$64,$0a
	.dc.b $00				
	.text					
	.align	2				
						
_miniflac_bitreader_read?part?0:		
						
	pea 2867.w				
	pea _?LC10				
	pea _?LC11				
	pea _?LC12				
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
	jbhi _?L57				
						
	tst.b d0				
	jbeq _?L53				
						
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
	jbmi _?L46				
	moveq #-1,d6				
	lsr.l d1,d6				
	clr.l d0				
						
	move.w #-32,a1				
	add.l d3,a1				
	tst.l a1				
	jblt _?L48				
_?L58:						
	move.l d5,d1				
	move.l a1,d7				
	lsr.l d7,d1				
	clr.l d7				
						
	and.l d7,d0				
	and.l d6,d1				
						
	tst.b d2				
	jbeq _?L54				
_?L59:						
						
	moveq #64,d7				
	sub.l d3,d7				
						
	moveq #32,d6				
	sub.l d3,d6				
	jbmi _?L51				
	moveq #-1,d2				
	lsr.l d6,d2				
	clr.l d3				
						
	and.l d5,d3				
	and.l d4,d2				
_?L50:						
	move.l d3,(a0)				
	move.l d2,4(a0)				
_?L43:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7		
	rts					
_?L46:						
						
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
	jbge _?L58				
_?L48:						
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
	jbne _?L59				
_?L54:						
	clr.l d3				
	clr.l d2				
						
	move.l d3,(a0)				
	move.l d2,4(a0)				
	jbra _?L43				
_?L53:						
						
	clr.l d0				
	clr.l d1				
						
	movem.l (sp)+,d3/d4/d5/d6/d7		
	rts					
_?L51:						
						
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
	jbra _?L50				
_?L57:						
	jbsr (_miniflac_bitreader_read?part?0)	
						
	.data					
_?LC13:						
	.dc.b $62,$69,$74,$73,$20,$3c,$3d,$20
	.dc.b $36,$34
	.dc.b $00				
	.text					
	.align	2				
						
_miniflac_bitreader_fill_nocrc?part?0:		
						
	pea 2848.w				
	pea _?LC10				
	pea _?LC13				
	pea _?LC12				
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
	jbcc _?L63				
						
	move.l 16(a0),d6			
						
	move.l 12(a0),a1			
						
	cmp.l d6,a1				
	jbcc _?L63				
_?L65:						
						
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
	jbls _?L63				
	move.l a2,a1				
	cmp.l d6,a1				
	jbcs _?L65				
_?L63:						
						
	cmp.b d0,d1				
	scs d0					
	extb.l d0				
						
	neg.l d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3		
	rts					
						
	.align	2				
						
_miniflac_bitreader_discard?part?0:		
						
	pea 2918.w				
	pea _?LC10				
	pea _?LC11				
	pea _?LC12				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.align	2				
						
_miniflac_bitreader_fill?part?0:		
						
	pea 2831.w				
	pea _?LC10				
	pea _?LC13				
	pea _?LC12				
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
	jbhi _?L95				
						
	tst.b d7				
	jbeq _?L78				
						
	move.b 8(a0),d3				
						
	cmp.b d7,d3				
	jbcc _?L75				
						
	move.l 16(a0),d6			
						
	move.l 12(a0),d4			
						
	cmp.l d6,d4				
	jbcc _?L75				
						
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
	jbls _?L80				
	cmp.l 48(sp),d6				
	jbls _?L80				
						
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
	jbls _?L92				
	cmp.l 56(sp),d6				
	jbls _?L92				
						
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
	jbls _?L92				
	cmp.l 52(sp),d6				
	jbls _?L92				
						
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
	jbls _?L92				
	cmp.l 56(sp),d6				
	jbls _?L92				
						
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
	jbls _?L92				
	cmp.l 52(sp),d6				
	jbls _?L92				
						
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
	jbls _?L92				
	cmp.l 56(sp),d6				
	jbls _?L92				
						
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
	jbls _?L92				
	cmp.l 52(sp),d6				
	jbls _?L92				
						
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
_?L75:						
						
	cmp.b d7,d3				
	scs d0					
	extb.l d0				
	neg.l d0				
_?L72:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L92:						
						
	move.b 47(sp),d3			
						
	cmp.b d7,d3				
	scs d0					
	extb.l d0				
	neg.l d0				
	jbra _?L72				
_?L78:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L80:						
						
	move.b 63(sp),d3			
						
	cmp.b d7,d3				
	scs d0					
	extb.l d0				
	neg.l d0				
	jbra _?L72				
_?L95:						
	jbsr (_miniflac_bitreader_fill?part?0)	
						
	.align	2				
						
_miniflac_bitreader_peek?part?0:		
						
	pea 2905.w				
	pea _?LC10				
	pea _?LC11				
	pea _?LC12				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.data					
_?LC14:						
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
	jbne _?L136				
						
	move.l 8(a3),d0				
						
	moveq #1,d1				
	lea _miniflac_bitreader_fill,a4		
	cmp.l d0,d1				
	jbeq _?L100				
	moveq #2,d1				
	lea _miniflac_bitreader_fill,a4		
	cmp.l d0,d1				
	jbeq _?L101				
	tst.l d0				
	jbeq _?L137				
_?L102:						
						
	moveq #6,d1				
	cmp.l 14(a3),d1				
	jbcs _?L117				
	move.l 14(a3),d0			
	add.l d0,d0				
	move.w _?L119(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L119:						
	.dc.w _?L125-_?L119			
	.dc.w _?L124-_?L119			
	.dc.w _?L123-_?L119			
	.dc.w _?L122-_?L119			
	.dc.w _?L121-_?L119			
	.dc.w _?L120-_?L119			
	.dc.w _?L118-_?L119			
_?L137:						
						
	pea 1.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill,a4		
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L103				
_?L105:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L125:						
						
	clr.l 22(a3)				
						
	clr.b 26(a3)				
						
	clr.l 28(a3)				
						
	clr.b 32(a3)				
_?L117:						
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
						
	moveq #1,d0				
_?L138:						
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L126:						
	moveq #2,d4				
_?L113:						
						
	move.l d4,14(a3)			
						
	moveq #2,d0				
	move.l d0,8(a3)				
_?L101:						
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L105				
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,18(a3)			
						
	clr.l 8(a3)				
	jbra _?L102				
_?L103:						
						
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
_?L100:						
						
	pea 7.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L105				
						
	pea 7.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,13(a3)			
	cmp.b #6,d1				
	jbhi _?L106				
	and.l #255,d1				
	add.l d1,d1				
	move.w _?L109(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L109:						
	.dc.w _?L113-_?L109			
	.dc.w _?L114-_?L109			
	.dc.w _?L126-_?L109			
	.dc.w _?L112-_?L109			
	.dc.w _?L111-_?L109			
	.dc.w _?L110-_?L109			
	.dc.w _?L108-_?L109			
_?L120:						
						
	clr.l 66(a3)				
						
	clr.l 70(a3)				
						
	clr.w 74(a3)				
						
	clr.w 76(a3)				
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
						
	moveq #1,d0				
	jbra _?L138				
_?L121:						
						
	clr.l 34(a3)				
						
	clr.l 38(a3)				
						
	clr.l 42(a3)				
						
	clr.l 46(a3)				
						
	clr.l 50(a3)				
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
						
	moveq #1,d0				
	jbra _?L138				
_?L122:						
						
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
	jbra _?L138				
_?L123:						
						
	clr.l 90(a3)				
						
	clr.l 98(a3)				
						
	move.l 18(a3),d0			
	subq.l #4,d0				
	move.l d0,94(a3)			
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
						
	moveq #1,d0				
	jbra _?L138				
_?L124:						
						
	clr.l 106(a3)				
						
	move.l 18(a3),102(a3)			
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
						
	moveq #1,d0				
	jbra _?L138				
_?L118:						
						
	clr.l 54(a3)				
						
	clr.l 58(a3)				
						
	clr.l 62(a3)				
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
						
	moveq #1,d0				
	jbra _?L138				
_?L106:						
	cmp.b #127,d1				
	jbne _?L139				
						
	moveq #127,d1				
	move.l d1,14(a3)			
						
	moveq #-12,d0				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L114:						
	moveq #1,d4				
						
	move.l d4,14(a3)			
						
	moveq #2,d0				
	move.l d0,8(a3)				
	jbra _?L101				
_?L108:						
						
	moveq #6,d4				
						
	move.l d4,14(a3)			
						
	moveq #2,d0				
	move.l d0,8(a3)				
	jbra _?L101				
_?L110:						
						
	moveq #5,d4				
						
	move.l d4,14(a3)			
						
	moveq #2,d0				
	move.l d0,8(a3)				
	jbra _?L101				
_?L111:						
						
	moveq #4,d4				
						
	move.l d4,14(a3)			
						
	moveq #2,d0				
	move.l d0,8(a3)				
	jbra _?L101				
_?L112:						
						
	moveq #3,d4				
						
	move.l d4,14(a3)			
						
	moveq #2,d0				
	move.l d0,8(a3)				
	jbra _?L101				
_?L139:						
						
	move.l #128,14(a3)			
						
	moveq #-13,d0				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L136:						
						
	pea 4993.w				
	pea _?LC10				
	pea _?LC14				
	pea _?LC12				
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
	jbeq _?L149				
_?L140:						
						
	rts					
_?L149:						
						
	clr.l 36(a0)				
						
	btst #2,69(a0)				
	jbeq _?L140				
						
	cmp.b #1,468(a0)			
	jbne _?L140				
						
	move.l 464(a0),d0			
	cmp.l 78(a0),d0				
	jbne _?L140				
						
	clr.b 468(a0)				
						
	clr.l 464(a0)				
						
	rts					
						
	.align	2				
						
_miniflac_probe?part?0?isra?0:			
	move.b 11(sp),d0			
						
	cmp.b #79,d0				
	jbeq _?L153				
	cmp.b #102,d0				
	jbne _?L154				
	moveq #1,d1				
	moveq #2,d0				
						
	move.l 4(sp),a0				
	move.l d1,4(a0)				
						
	move.l d0,(a0)				
						
	moveq #1,d0				
_?L150:						
						
	rts					
_?L154:						
						
	moveq #-1,d0				
						
	rts					
_?L153:						
						
	moveq #2,d1				
	clr.l d0				
						
	move.l 4(sp),a0				
	move.l d1,4(a0)				
						
	move.l d0,(a0)				
						
	moveq #1,d0				
	jbra _?L150				
						
	.align	2				
						
_miniflac_streaminfo_read_channels:		
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbcc _?L158				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #5,d0				
	jbne _?L188				
						
	pea 3.w					
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L189				
_?L166:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L188:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L189:						
						
	pea 3.w					
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 20(sp)				
	jbeq _?L167				
						
	addq.b #1,d1				
	move.l 20(sp),a0			
	move.b d1,(a0)				
_?L167:						
						
	moveq #6,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L158:						
						
	moveq #4,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbne _?L190				
_?L161:						
						
	pea 20.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L166				
						
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
	jbne _?L166				
	jbra _?L189				
_?L190:						
						
	moveq #3,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbeq _?L162				
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbeq _?L163				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbeq _?L164				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L166				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,(a3)				
_?L164:						
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L166				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,(a3)				
_?L163:						
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L166				
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #3,d0				
	move.l d0,(a3)				
_?L162:						
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L166				
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #4,d1				
	move.l d1,(a3)				
	jbra _?L161				
						
	.align	2				
						
_miniflac_cuesheet_read_tracks:			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 40(sp),a4			
	move.l 44(sp),a3			
						
	move.l (a4),d0				
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbeq _?L192				
	jbcs _?L251				
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d1				
	jbne _?L252				
_?L196:						
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L201				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b 8(a3),d0				
	cmp.b #6,d0				
	jbls _?L253				
						
	subq.b #7,d0				
	move.b d0,8(a3)				
						
	jbeq _?L224				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L204				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	moveq #3,d2				
	move.l d2,(a4)				
_?L192:						
						
	move.l 4(a4),a2				
						
	cmp.w #257,a2				
	jbhi _?L206				
						
	move.b 8(a3),d3				
	addq.l #1,a2				
_?L207:						
						
	cmp.b #7,d3				
	jbhi _?L254				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L201				
						
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
_?L208:						
						
	move.b d1,8(a3)				
						
	jbeq _?L225				
						
	clr.l d2				
	move.b d1,d2				
						
	moveq #64,d6				
	sub.l d2,d6				
						
	moveq #32,d5				
	sub.l d2,d5				
	jbmi _?L211				
	moveq #-1,d2				
	lsr.l d5,d2				
	clr.l d5				
						
	and.l d5,d4				
	and.l d2,d0				
_?L210:						
	move.l d4,(a3)				
	move.l d0,4(a3)				
						
	move.l a2,4(a4)				
						
	cmp.w #258,a2				
	jbeq _?L206				
	move.l a2,d0				
	addq.l #1,d0				
	cmp.b #7,d3				
	jbhi _?L226				
						
	move.l 16(a3),a1			
						
	clr.l d0				
	move.b d1,d0				
	moveq #64,d3				
	sub.l d0,d3				
						
	moveq #32,d2				
	sub.l d0,d2				
	jbmi _?L214				
	moveq #-1,d4				
	lsr.l d2,d4				
	clr.l d5				
_?L220:						
						
	move.l 12(a3),d0			
						
	cmp.l a1,d0				
	jbcc _?L201				
						
	move.l 20(a3),a0			
						
	move.l d0,d2				
	addq.l #1,d2				
	move.l d2,12(a3)			
						
	move.b (a0,d0.l),d0			
						
	move.l (a3),d2				
	move.l 4(a3),d3				
						
	addq.l #1,24(a3)			
						
	move.b d1,8(a3)				
						
	jbeq _?L217				
						
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
	jbne _?L220				
_?L206:						
						
	clr.l 4(a4)				
						
	moveq #4,d1				
	move.l d1,(a4)				
_?L194:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L201				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,9(a4)				
						
	tst.l 48(sp)				
	jbeq _?L223				
						
	move.l 48(sp),a0			
	move.b d1,(a0)				
_?L223:						
						
	clr.b 8(a4)				
						
	moveq #5,d0				
	move.l d0,(a4)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L251:						
						
	subq.l #4,d0				
	jbeq _?L194				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L201:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L252:						
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbne _?L255				
_?L197:						
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L201				
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,(a4)				
	jbra _?L196				
_?L217:						
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,a2				
	move.l a2,4(a4)				
						
	cmp.w #258,a2				
	jbne _?L220				
						
	clr.l 4(a4)				
						
	moveq #4,d1				
	move.l d1,(a4)				
	jbra _?L194				
_?L254:						
						
	move.b d3,d1				
	subq.b #8,d1				
						
	move.l (a3),d4				
	move.l 4(a3),d0				
	jbra _?L208				
_?L214:						
						
	moveq #-1,d5				
	moveq #31,d2				
	sub.l d3,d2				
	moveq #-2,d0				
	lsl.l d2,d0				
	move.l d5,d4				
	lsr.l d3,d4				
	or.l d0,d4				
	lsr.l d3,d5				
	jbra _?L220				
_?L225:						
	clr.l d4				
	clr.l d0				
	jbra _?L210				
_?L224:						
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	moveq #3,d2				
	move.l d2,(a4)				
	jbra _?L192				
_?L255:						
						
	move.l 4(a4),d3				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_read,a6		
						
	cmp.l #128,d3				
	jbcc _?L200				
_?L198:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L201				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	addq.l #1,d3				
	move.l d3,4(a4)				
						
	cmp.l #128,d3				
	jbne _?L198				
_?L200:						
						
	clr.l 4(a4)				
						
	moveq #1,d0				
	move.l d0,(a4)				
	jbra _?L197				
_?L211:						
						
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
	jbra _?L210				
_?L204:						
						
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
	jbra _?L192				
_?L226:						
						
	move.l d0,a2				
	move.b d1,d3				
	jbra _?L207				
_?L253:						
	jbsr (_miniflac_bitreader_discard?part?0)
						
	.data					
_?LC15:						
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
	jbne _?L378				
						
	moveq #17,d0				
	cmp.l 38(a3),d0				
	jbcs _?L258				
	move.l 38(a3),d0			
	add.l d0,d0				
	move.w _?L260(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L260:						
	.dc.w _?L277-_?L260			
	.dc.w _?L357-_?L260			
	.dc.w _?L358-_?L260			
	.dc.w _?L359-_?L260			
	.dc.w _?L360-_?L260			
	.dc.w _?L361-_?L260			
	.dc.w _?L362-_?L260			
	.dc.w _?L363-_?L260			
	.dc.w _?L364-_?L260			
	.dc.w _?L365-_?L260			
	.dc.w _?L366-_?L260			
	.dc.w _?L367-_?L260			
	.dc.w _?L368-_?L260			
	.dc.w _?L369-_?L260			
	.dc.w _?L370-_?L260			
	.dc.w _?L371-_?L260			
	.dc.w _?L372-_?L260			
	.dc.w _?L356-_?L260			
_?L336:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
						
	pea 8.w					
						
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.w #1,d1				
	move.w d1,16(a3)			
_?L338:						
						
	moveq #16,d4				
	move.l d4,38(a3)			
_?L261:						
						
	move.b 13(a3),d0			
	cmp.b #13,d0				
	jbeq _?L339				
	cmp.b #14,d0				
	jbeq _?L340				
	cmp.b #12,d0				
	jbeq _?L379				
						
	move.b 9(a4),36(a3)			
						
	moveq #17,d5				
	move.l d5,38(a3)			
_?L259:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
						
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
	jbne _?L353				
_?L258:						
						
	clr.l 38(a3)				
						
	tst.l 18(a3)				
	jbne _?L342				
						
	move.l 60(sp),a0			
	move.l 6(a0),d0				
						
	jbeq _?L304				
						
	move.l d0,18(a3)			
_?L342:						
						
	tst.b 27(a3)				
	jbne _?L344				
						
	move.l 60(sp),a0			
	move.b 10(a0),d0			
						
	jbeq _?L354				
						
	move.b d0,27(a3)			
_?L344:						
						
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
_?L372:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L261				
_?L356:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L259				
_?L364:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L380				
_?L287:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L365:						
	lea _miniflac_bitreader_fill,a5		
_?L268:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
_?L394:						
						
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
_?L267:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
_?L381:						
						
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
_?L266:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
_?L382:						
						
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
_?L265:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
						
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
_?L264:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
						
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
_?L263:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
						
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
_?L262:						
						
	move.b 12(a3),d0			
	cmp.b #6,d0				
	jbeq _?L336				
	cmp.b #7,d0				
	jbne _?L338				
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.w #1,d1				
	move.w d1,16(a3)			
	jbra _?L338				
_?L366:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
	jbra _?L381				
_?L367:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
	jbra _?L382				
_?L368:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L265				
_?L369:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L264				
_?L370:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L263				
_?L371:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L262				
_?L360:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
_?L398:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,13(a3)			
	cmp.b #15,d1				
	jbhi _?L303				
	and.l #255,d1				
	add.l d1,d1				
	move.w _?L305(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L305:						
	.dc.w _?L306-_?L305			
	.dc.w _?L317-_?L305			
	.dc.w _?L316-_?L305			
	.dc.w _?L315-_?L305			
	.dc.w _?L314-_?L305			
	.dc.w _?L313-_?L305			
	.dc.w _?L312-_?L305			
	.dc.w _?L311-_?L305			
	.dc.w _?L310-_?L305			
	.dc.w _?L309-_?L305			
	.dc.w _?L308-_?L305			
	.dc.w _?L307-_?L305			
	.dc.w _?L306-_?L305			
	.dc.w _?L306-_?L305			
	.dc.w _?L306-_?L305			
	.dc.w _?L304-_?L305			
_?L361:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
_?L395:						
						
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
	jbcs _?L348				
						
	clr.l d0				
	moveq #7,d1				
	sub.l d3,d1				
	subx.l d2,d0				
	jbcs _?L319				
						
	move.b d3,d1				
	addq.b #1,d1				
	move.b d1,26(a3)			
						
	clr.l 22(a3)				
						
	move.b d3,14(a3)			
						
	moveq #6,d1				
	move.l d1,38(a3)			
_?L271:						
						
	pea 3.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
_?L383:						
						
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
	jbcs _?L322				
	move.l d1,d0				
	add.l d0,d0				
	move.w _?L323(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L323:						
	.dc.w _?L329-_?L323			
	.dc.w _?L328-_?L323			
	.dc.w _?L327-_?L323			
	.dc.w _?L351-_?L323			
	.dc.w _?L326-_?L323			
	.dc.w _?L325-_?L323			
	.dc.w _?L324-_?L323			
	.dc.w _?L351-_?L323			
_?L362:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 3.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
	jbra _?L383				
_?L363:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
_?L396:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d0,d2				
	or.l d1,d2				
	jbne _?L352				
						
	moveq #8,d3				
	move.l d3,38(a3)			
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
	jbra _?L380				
_?L358:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
_?L384:						
						
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
	jbne _?L287				
_?L385:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,12(a3)			
						
	clr.w 16(a3)				
	cmp.b #15,d1				
	jbhi _?L288				
	and.l #255,d1				
	add.l d1,d1				
	move.w _?L290(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L290:						
	.dc.w _?L347-_?L290			
	.dc.w _?L302-_?L290			
	.dc.w _?L301-_?L290			
	.dc.w _?L300-_?L290			
	.dc.w _?L299-_?L290			
	.dc.w _?L298-_?L290			
	.dc.w _?L288-_?L290			
	.dc.w _?L288-_?L290			
	.dc.w _?L297-_?L290			
	.dc.w _?L296-_?L290			
	.dc.w _?L295-_?L290			
	.dc.w _?L294-_?L290			
	.dc.w _?L293-_?L290			
	.dc.w _?L292-_?L290			
	.dc.w _?L291-_?L290			
	.dc.w _?L289-_?L290			
_?L357:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
_?L387:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d0,d2				
	or.l d1,d2				
	jbne _?L346				
						
	moveq #2,d3				
	move.l d3,38(a3)			
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
	jbra _?L384				
_?L359:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
	jbra _?L385				
_?L277:						
						
	move.l (a4),d6				
	move.l 4(a4),d7				
						
	move.b 8(a4),d0				
						
	clr.b 9(a4)				
						
	clr.w 10(a4)				
						
	clr.l 24(a4)				
						
	tst.b d0				
	jbeq _?L278				
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
	jblt _?L279				
_?L401:						
	move.l d6,d5				
	move.l a0,d1				
	lsr.l d1,d5				
_?L280:						
						
	move.b d5,d1				
						
	tst.b d0				
	jbne _?L386				
						
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
_?L278:						
						
	pea 14.w				
	move.l a4,-(sp)				
	lea _miniflac_bitreader_fill,a5		
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
						
	pea 14.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	clr.l d4				
	move.l #16382,d5			
	sub.l d1,d5				
	subx.l d0,d4				
	jbne _?L345				
						
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
	jbne _?L287				
	jbra _?L387				
_?L380:						
						
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
	jbeq _?L388				
						
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
	jbeq _?L389				
						
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
	jbeq _?L390				
						
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
	jbeq _?L391				
						
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
	jbeq _?L392				
						
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
	jbeq _?L393				
						
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
	jbne _?L268				
						
	clr.l 28(a3)				
	clr.l 32(a3)				
						
	moveq #9,d5				
	move.l d5,38(a3)			
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
	jbra _?L394				
_?L379:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
						
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
	jbra _?L259				
_?L351:						
	moveq #-11,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L306:						
						
	clr.l 18(a3)				
_?L303:						
						
	moveq #5,d0				
	move.l d0,38(a3)			
_?L399:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
	jbra _?L395				
_?L325:						
						
	move.b #20,27(a3)			
_?L322:						
						
	moveq #7,d5				
	move.l d5,38(a3)			
_?L397:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
	jbra _?L396				
_?L326:						
						
	move.b #16,27(a3)			
						
	moveq #7,d5				
	move.l d5,38(a3)			
	jbra _?L397				
_?L328:						
						
	move.b #8,27(a3)			
						
	moveq #7,d5				
	move.l d5,38(a3)			
	jbra _?L397				
_?L324:						
						
	move.b #24,27(a3)			
						
	moveq #7,d5				
	move.l d5,38(a3)			
	jbra _?L397				
_?L329:						
						
	clr.b 27(a3)				
						
	moveq #7,d5				
	move.l d5,38(a3)			
	jbra _?L397				
_?L327:						
						
	move.b #12,27(a3)			
						
	moveq #7,d5				
	move.l d5,38(a3)			
	jbra _?L397				
_?L302:						
						
	move.w #192,16(a3)			
_?L288:						
						
	moveq #4,d5				
	move.l d5,38(a3)			
_?L400:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
	jbra _?L398				
_?L347:						
	moveq #-7,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L312:						
						
	move.l #22050,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L399				
_?L313:						
						
	move.l #16000,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L399				
_?L314:						
						
	move.l #8000,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L399				
_?L315:						
						
	move.l #192000,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L399				
_?L304:						
						
	moveq #-8,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L307:						
						
	move.l #96000,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L399				
_?L308:						
						
	move.l #48000,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L399				
_?L309:						
						
	move.l #44100,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L399				
_?L310:						
						
	move.l #32000,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L399				
_?L311:						
						
	move.l #24000,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L399				
_?L316:						
						
	move.l #176400,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L399				
_?L317:						
						
	move.l #88200,18(a3)			
						
	moveq #5,d0				
	move.l d0,38(a3)			
	jbra _?L399				
_?L301:						
						
	move.w #576,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L400				
_?L297:						
						
	move.w #256,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L400				
_?L298:						
						
	move.w #4608,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L400				
_?L299:						
						
	move.w #2304,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L400				
_?L300:						
						
	move.w #1152,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L400				
_?L293:						
						
	move.w #4096,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L400				
_?L294:						
						
	move.w #2048,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L400				
_?L295:						
						
	move.w #1024,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L400				
_?L296:						
						
	move.w #512,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L400				
_?L291:						
						
	move.w #16384,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L400				
_?L292:						
						
	move.w #8192,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L400				
_?L289:						
						
	move.w #-32768,16(a3)			
						
	moveq #4,d5				
	move.l d5,38(a3)			
	jbra _?L400				
_?L353:						
						
	moveq #-2,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L386:						
						
	move.w #64,a0				
	sub.l d2,a0				
						
	moveq #32,d5				
	sub.l d2,d5				
	jbmi _?L282				
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
_?L402:						
						
	subq.b #8,d0				
						
	clr.l d2				
	move.b d0,d2				
	move.w #-32,a0				
	add.l d2,a0				
	tst.l a0				
	jbge _?L401				
_?L279:						
	moveq #31,d5				
	sub.l d2,d5				
	move.l d6,d1				
	add.l d1,d1				
	lsl.l d5,d1				
	move.l d7,d5				
	lsr.l d2,d5				
	or.l d1,d5				
	jbra _?L280				
_?L282:						
						
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
	jbra _?L402				
_?L340:						
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
						
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
	jbra _?L259				
_?L339:						
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L287				
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,18(a3)			
						
	move.b 9(a4),36(a3)			
						
	moveq #17,d5				
	move.l d5,38(a3)			
	jbra _?L259				
_?L319:						
	clr.l d4				
	moveq #9,d5				
	sub.l d3,d5				
	subx.l d2,d4				
	jbeq _?L349				
	clr.l d0				
	moveq #10,d1				
	sub.l d3,d1				
	subx.l d2,d0				
	jbeq _?L350				
	moveq #1,d0				
						
	move.l d0,22(a3)			
						
	move.b #2,26(a3)			
_?L403:						
						
	move.b d3,14(a3)			
						
	moveq #6,d1				
	move.l d1,38(a3)			
	jbra _?L271				
_?L388:						
						
	move.l d0,28(a3)			
	move.l d1,32(a3)			
						
	moveq #15,d5				
	move.l d5,38(a3)			
						
	jbra _?L262				
_?L350:						
	moveq #3,d0				
						
	move.l d0,22(a3)			
						
	move.b #2,26(a3)			
	jbra _?L403				
_?L349:						
	moveq #2,d0				
						
	move.l d0,22(a3)			
						
	move.b #2,26(a3)			
	jbra _?L403				
_?L389:						
						
	lsl.l #6,d1				
	clr.l 28(a3)				
	and.l #1984,d1				
	move.l d1,32(a3)			
						
	moveq #14,d5				
	move.l d5,38(a3)			
						
	jbra _?L263				
_?L391:						
						
	moveq #18,d5				
	lsl.l d5,d1				
	clr.l 28(a3)				
	and.l #1835008,d1			
	move.l d1,32(a3)			
						
	moveq #12,d0				
	move.l d0,38(a3)			
						
	jbra _?L265				
_?L390:						
						
	moveq #12,d5				
	lsl.l d5,d1				
	clr.l 28(a3)				
	and.l #65535,d1				
	move.l d1,32(a3)			
						
	moveq #13,d0				
	move.l d0,38(a3)			
						
	jbra _?L264				
_?L393:						
						
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
	jbne _?L287				
	jbra _?L381				
_?L392:						
						
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
	jbne _?L287				
	jbra _?L382				
_?L354:						
						
	moveq #-9,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L352:						
						
	moveq #-6,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L378:						
						
	pea 3220.w				
	pea _?LC10				
	pea _?LC15				
	pea _?LC12				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
_?L348:						
						
	moveq #-10,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L345:						
						
	moveq #-4,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L346:						
						
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
	jbcc _?L405				
	subq.l #3,d0				
	jbne _?L443				
_?L406:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L426				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,4(a4)				
						
	clr.l 8(a4)				
						
	tst.l 44(sp)				
	jbeq _?L428				
						
	move.l 44(sp),a0			
	move.l d1,(a0)				
_?L428:						
						
	moveq #4,d0				
	move.l d0,(a4)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L443:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L405:						
						
	moveq #2,d6				
	cmp.l d0,d6				
	jbeq _?L444				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbne _?L445				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L446				
_?L426:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L444:						
						
	move.l 8(a4),a2				
						
	move.l 4(a4),d4				
_?L409:						
						
	cmp.l d4,a2				
	jbcc _?L427				
						
	move.b 8(a3),d3				
	addq.l #1,a2				
_?L416:						
						
	cmp.b #7,d3				
	jbhi _?L447				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L426				
						
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
						
	jbeq _?L429				
_?L448:						
						
	clr.l d1				
	move.b d2,d1				
						
	moveq #64,d7				
	sub.l d1,d7				
						
	moveq #32,d6				
	sub.l d1,d6				
	jbmi _?L413				
	moveq #-1,d1				
	lsr.l d6,d1				
	clr.l d6				
						
	and.l d6,d5				
	and.l d1,d0				
_?L412:						
	move.l d5,(a3)				
	move.l d0,4(a3)				
						
	move.l a2,8(a4)				
						
	cmp.l d4,a2				
	jbeq _?L427				
	move.l a2,d0				
	addq.l #1,d0				
	cmp.b #7,d3				
	jbhi _?L430				
						
	move.l 16(a3),a1			
						
	clr.l d0				
	move.b d2,d0				
	moveq #64,d3				
	sub.l d0,d3				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L417				
	moveq #-1,d5				
	lsr.l d1,d5				
	clr.l d6				
_?L422:						
						
	move.l 12(a3),d0			
						
	cmp.l d0,a1				
	jbls _?L426				
						
	move.l 20(a3),a0			
						
	move.l d0,d1				
	addq.l #1,d1				
	move.l d1,12(a3)			
						
	move.b (a0,d0.l),d3			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
						
	addq.l #1,24(a3)			
						
	move.b d2,8(a3)				
						
	jbeq _?L420				
						
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
	jbhi _?L422				
_?L427:						
						
	moveq #3,d6				
	move.l d6,(a4)				
	jbra _?L406				
_?L447:						
						
	move.b d3,d2				
	subq.b #8,d2				
						
	move.l (a3),d5				
	move.l 4(a3),d0				
						
	move.b d2,8(a3)				
						
	jbne _?L448				
_?L429:						
	clr.l d5				
	clr.l d0				
	jbra _?L412				
_?L445:						
						
	pea 32.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L426				
						
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
	jbne _?L426				
_?L446:						
						
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
	jbra _?L409				
_?L420:						
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,a2				
	move.l a2,8(a4)				
						
	cmp.l a2,d4				
	jbhi _?L422				
						
	moveq #3,d6				
	move.l d6,(a4)				
	jbra _?L406				
_?L417:						
						
	moveq #-1,d6				
	moveq #31,d1				
	sub.l d3,d1				
	moveq #-2,d0				
	lsl.l d1,d0				
	move.l d6,d5				
	lsr.l d3,d5				
	or.l d0,d5				
	lsr.l d3,d6				
	jbra _?L422				
_?L413:						
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
	jbra _?L412				
_?L430:						
						
	move.l d0,a2				
	move.b d2,d3				
	jbra _?L416				
						
	.align	2				
						
_miniflac_picture_read_width:			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 40(sp),a4			
	move.l 44(sp),a3			
						
	move.l (a4),d0				
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbcc _?L450				
	subq.l #5,d0				
	jbne _?L499				
_?L451:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L473				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 48(sp)				
	jbeq _?L479				
						
	move.l 48(sp),a0			
	move.l d1,(a0)				
_?L479:						
						
	moveq #6,d0				
	move.l d0,(a4)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L499:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L450:						
						
	moveq #4,d6				
	cmp.l d0,d6				
	jbeq _?L500				
						
	moveq #3,d1				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d1				
	jbne _?L501				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L502				
_?L473:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L500:						
						
	move.l 4(a4),d4				
						
	move.l 8(a4),a2				
_?L454:						
						
	cmp.l a2,d4				
	jbls _?L478				
						
	move.b 8(a3),d3				
	addq.l #1,a2				
_?L461:						
						
	cmp.b #7,d3				
	jbhi _?L503				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L473				
						
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
						
	jbeq _?L480				
_?L504:						
						
	clr.l d1				
	move.b d2,d1				
						
	moveq #64,d7				
	sub.l d1,d7				
						
	moveq #32,d6				
	sub.l d1,d6				
	jbmi _?L458				
	moveq #-1,d1				
	lsr.l d6,d1				
	clr.l d6				
						
	and.l d6,d5				
	and.l d1,d0				
_?L457:						
	move.l d5,(a3)				
	move.l d0,4(a3)				
						
	move.l a2,8(a4)				
						
	cmp.l d4,a2				
	jbeq _?L478				
	move.l a2,d0				
	addq.l #1,d0				
	cmp.b #7,d3				
	jbhi _?L481				
						
	move.l 16(a3),a1			
						
	clr.l d0				
	move.b d2,d0				
	moveq #64,d3				
	sub.l d0,d3				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L462				
	moveq #-1,d5				
	lsr.l d1,d5				
	clr.l d6				
_?L467:						
						
	move.l 12(a3),d0			
						
	cmp.l d0,a1				
	jbls _?L473				
						
	move.l 20(a3),a0			
						
	move.l d0,d1				
	addq.l #1,d1				
	move.l d1,12(a3)			
						
	move.b (a0,d0.l),d3			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
						
	addq.l #1,24(a3)			
						
	move.b d2,8(a3)				
						
	jbeq _?L465				
						
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
	jbhi _?L467				
_?L478:						
						
	moveq #5,d6				
	move.l d6,(a4)				
	jbra _?L451				
_?L503:						
						
	move.b d3,d2				
	subq.b #8,d2				
						
	move.l (a3),d5				
	move.l 4(a3),d0				
						
	move.b d2,8(a3)				
						
	jbne _?L504				
_?L480:						
	clr.l d5				
	clr.l d0				
	jbra _?L457				
_?L501:						
						
	moveq #2,d3				
	cmp.l d0,d3				
	jbne _?L471				
						
	move.l 4(a4),d4				
						
	move.l 8(a4),d0				
	lea _miniflac_bitreader_fill_nocrc,a5	
	move.l d0,d3				
	addq.l #1,d3				
						
	lea _miniflac_bitreader_read,a6		
						
	cmp.l d4,d0				
	jbcc _?L477				
_?L474:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L473				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l d3,8(a4)				
						
	move.l d3,d0				
	addq.l #1,d0				
	cmp.l d4,d3				
	jbeq _?L477				
	move.l d0,d3				
	jbra _?L474				
_?L502:						
						
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
	jbra _?L454				
_?L477:						
						
	moveq #3,d6				
	move.l d6,(a4)				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L473				
	jbra _?L502				
_?L465:						
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,a2				
	move.l a2,8(a4)				
						
	cmp.l d4,a2				
	jbcs _?L467				
						
	moveq #5,d6				
	move.l d6,(a4)				
	jbra _?L451				
_?L462:						
						
	moveq #-1,d6				
	moveq #31,d1				
	sub.l d3,d1				
	moveq #-2,d0				
	lsl.l d1,d0				
	move.l d6,d5				
	lsr.l d3,d5				
	or.l d0,d5				
	lsr.l d3,d6				
	jbra _?L467				
_?L458:						
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
	jbra _?L457				
_?L471:						
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbeq _?L475				
						
	pea 32.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L473				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d3				
	move.l d3,(a4)				
_?L475:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L473				
						
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
	jbcs _?L474				
	jbra _?L477				
_?L481:						
						
	move.l d0,a2				
	move.b d2,d3				
	jbra _?L461				
						
	.align	2				
						
_miniflac_vorbis_comment_read_length:		
	movem.l d3/d4/d5/d6/a3/a4/a5/a6,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),a3			
						
	move.l (a4),d0				
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbeq _?L506				
	jbcc _?L507				
	subq.l #4,d0				
	jbne _?L537				
						
	move.l 8(a4),d5				
						
	move.l 4(a4),d3				
						
	lea _miniflac_bitreader_read,a5		
						
	cmp.l d5,d3				
	jbls _?L512				
_?L511:						
						
	move.b 8(a3),d4				
						
	cmp.b #7,d4				
	jbhi _?L522				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L518				
						
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
_?L522:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	addq.l #1,d5				
	move.l d5,8(a4)				
						
	cmp.l d5,d3				
	jbne _?L511				
_?L512:						
						
	move.l 16(a4),d1			
	addq.l #1,d1				
	move.l d1,16(a4)			
						
	moveq #3,d0				
	move.l d0,(a4)				
						
	move.l 12(a4),d0			
_?L510:						
						
	cmp.l d1,d0				
	jbeq _?L526				
_?L540:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L538				
_?L518:						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5/a6	
	rts					
_?L507:						
						
	moveq #2,d6				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d6				
	jbne _?L539				
_?L513:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L518				
						
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
	jbne _?L540				
_?L526:						
						
	moveq #2,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5/a6	
	rts					
_?L537:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5/a6	
	rts					
_?L506:						
						
	move.l 16(a4),d1			
						
	move.l 12(a4),d0			
	jbra _?L510				
_?L538:						
						
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
	jbeq _?L521				
						
	move.l 44(sp),a0			
	move.l d1,(a0)				
_?L521:						
						
	moveq #4,d0				
	move.l d0,(a4)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5/a6	
	rts					
_?L539:						
						
	subq.l #1,d0				
	jbeq _?L541				
						
	pea 32.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L518				
						
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
	jbcc _?L520				
_?L517:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L518				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l d3,8(a4)				
						
	move.l d3,d0				
	addq.l #1,d0				
	cmp.l d3,d4				
	jbeq _?L520				
	move.l d0,d3				
	jbra _?L517				
_?L541:						
						
	move.l 4(a4),d4				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	move.l 8(a4),d0				
	move.l d0,d3				
	addq.l #1,d3				
						
	lea _miniflac_bitreader_read,a6		
						
	cmp.l d4,d0				
	jbcs _?L517				
_?L520:						
						
	moveq #2,d2				
	move.l d2,(a4)				
	jbra _?L513				
						
	.align	2				
						
_miniflac_streaminfo_read_max_frame_size:	
	movem.l d3/d4/d5/d6/d7/a3/a4/a5,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),a3			
						
	move.l (a4),d0				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbcc _?L543				
	subq.l #3,d0				
	jbne _?L567				
_?L544:						
						
	move.b 8(a3),d5				
						
	cmp.b #23,d5				
	jbhi _?L553				
						
	move.l 16(a3),a1			
						
	move.l 12(a3),d4			
						
	cmp.l d4,a1				
	jbls _?L549				
						
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
	jbhi _?L553				
	cmp.l a1,a2				
	jbcc _?L549				
						
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
	jbhi _?L553				
	cmp.l d7,a1				
	jbls _?L549				
						
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
_?L553:						
						
	pea 24.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 44(sp)				
	jbeq _?L552				
						
	move.l 44(sp),a0			
	move.l d1,(a0)				
_?L552:						
						
	moveq #4,d0				
	move.l d0,(a4)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L567:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L543:						
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d1				
	jbeq _?L546				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbne _?L568				
						
	pea 16.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L569				
_?L549:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L569:						
						
	pea 16.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,(a4)				
_?L546:						
						
	pea 24.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L549				
						
	pea 24.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #3,d3				
	move.l d3,(a4)				
	jbra _?L544				
_?L568:						
						
	pea 16.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L549				
						
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
	jbne _?L549				
	jbra _?L569				
						
	.align	2				
						
_miniflac_cuesheet_read_track_audio_flag:	
	movem.l d3/d4/d5/d6/d7/a3/a4,-(sp)	
	move.l 32(sp),a4			
	move.l 36(sp),a3			
						
	move.l (a4),d0				
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcc _?L571				
	subq.l #8,d0				
	jbne _?L598				
						
	move.b 8(a3),d2				
						
	jbne _?L588				
_?L589:						
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L597				
						
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
_?L588:						
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 40(sp)				
	jbeq _?L594				
_?L593:						
						
	move.l 40(sp),a0			
	move.b d1,(a0)				
_?L594:						
						
	moveq #9,d0				
	move.l d0,(a4)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L597:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L598:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L571:						
						
	subq.l #7,d0				
	jbne _?L574				
_?L595:						
						
	move.l 4(a4),a2				
						
	move.b 8(a3),d2				
						
	moveq #11,d3				
	cmp.l a2,d3				
	jbcs _?L576				
	addq.l #1,a2				
	move.b d2,d5				
						
	moveq #-1,d6				
	move.w #-2,a1				
_?L582:						
						
	cmp.b #7,d2				
	jbhi _?L611				
						
	move.l 12(a3),d3			
						
	cmp.l 16(a3),d3				
	jbcc _?L597				
						
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
						
	jbeq _?L599				
_?L612:						
						
	clr.l d1				
	move.b d2,d1				
						
	moveq #64,d7				
	sub.l d1,d7				
						
	moveq #32,d3				
	sub.l d1,d3				
	jbmi _?L580				
	move.l d6,d1				
	lsr.l d3,d1				
	clr.l d3				
						
	and.l d4,d3				
	and.l d1,d0				
_?L579:						
	move.l d3,(a3)				
	move.l d0,4(a3)				
						
	move.l a2,4(a4)				
						
	moveq #12,d1				
	cmp.l a2,d1				
	jbeq _?L576				
	move.l a2,d0				
	addq.l #1,d0				
	cmp.b #7,d5				
	jbhi _?L600				
						
	move.l 16(a3),a1			
						
	clr.l d0				
	move.b d2,d0				
	moveq #64,d3				
	sub.l d0,d3				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L583				
	moveq #-1,d4				
	lsr.l d1,d4				
	clr.l d5				
_?L590:						
						
	move.l 12(a3),d0			
						
	cmp.l d0,a1				
	jbls _?L597				
						
	move.l 20(a3),a0			
						
	move.l d0,d3				
	addq.l #1,d3				
	move.l d3,12(a3)			
						
	move.b (a0,d0.l),d3			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
						
	addq.l #1,24(a3)			
						
	move.b d2,8(a3)				
						
	jbeq _?L586				
						
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
	jbne _?L590				
						
	clr.l 4(a4)				
						
	moveq #8,d1				
	move.l d1,(a4)				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 40(sp)				
	jbne _?L593				
	jbra _?L594				
_?L574:						
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
						
	moveq #1,d3				
	cmp.l d0,d3				
	jbeq _?L595				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L611:						
						
	subq.b #8,d2				
						
	move.l (a3),d4				
	move.l 4(a3),d0				
						
	move.b d2,8(a3)				
						
	jbne _?L612				
_?L599:						
	clr.l d3				
	clr.l d0				
	jbra _?L579				
_?L586:						
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,a2				
	move.l a2,4(a4)				
						
	moveq #12,d3				
	cmp.l a2,d3				
	jbne _?L590				
						
	clr.l 4(a4)				
						
	moveq #8,d0				
	move.l d0,(a4)				
	jbra _?L589				
_?L583:						
						
	moveq #-1,d5				
	moveq #31,d1				
	sub.l d3,d1				
	moveq #-2,d0				
	lsl.l d1,d0				
	move.l d5,d4				
	lsr.l d3,d4				
	or.l d0,d4				
	lsr.l d3,d5				
	jbra _?L590				
_?L580:						
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
	jbra _?L579				
_?L576:						
						
	clr.l 4(a4)				
						
	moveq #8,d1				
	move.l d1,(a4)				
						
	tst.b d2				
	jbeq _?L589				
	jbra _?L588				
_?L600:						
						
	move.l d0,a2				
	move.b d2,d5				
	jbra _?L582				
						
	.align	2				
						
_miniflac_cuesheet_read_track_indexpoints:	
	movem.l d3/d4/d5/d6/d7/a3/a4/a5,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),a3			
						
	move.l (a4),a0				
						
	moveq #11,d0				
	cmp.l a0,d0				
	jbeq _?L614				
	jbcs _?L615				
	moveq #10,d1				
	cmp.l a0,d1				
	jbeq _?L616				
						
	moveq #9,d2				
	cmp.l a0,d2				
	jbne _?L618				
_?L617:						
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L634				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b 8(a3),d0				
	cmp.b #5,d0				
	jbls _?L675				
						
	subq.b #6,d0				
	move.b d0,8(a3)				
						
	jbeq _?L649				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L629				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	clr.l 4(a4)				
						
	moveq #10,d0				
	move.l d0,(a4)				
	sub.l a2,a2				
_?L621:						
						
	move.b 8(a3),d3				
	addq.l #1,a2				
_?L631:						
						
	cmp.b #7,d3				
	jbhi _?L676				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L634				
						
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
_?L632:						
						
	move.b d1,8(a3)				
						
	jbeq _?L650				
						
	clr.l d2				
	move.b d1,d2				
						
	moveq #64,d6				
	sub.l d2,d6				
						
	moveq #32,d5				
	sub.l d2,d5				
	jbmi _?L636				
	moveq #-1,d2				
	lsr.l d5,d2				
	clr.l d5				
						
	and.l d5,d4				
	and.l d2,d0				
_?L635:						
	move.l d4,(a3)				
	move.l d0,4(a3)				
						
	move.l a2,4(a4)				
						
	moveq #13,d0				
	cmp.l a2,d0				
	jbeq _?L622				
	move.l a2,d0				
	addq.l #1,d0				
	cmp.b #7,d3				
	jbhi _?L651				
						
	move.l 16(a3),a1			
						
	clr.l d0				
	move.b d1,d0				
	moveq #64,d3				
	sub.l d0,d3				
						
	moveq #32,d2				
	sub.l d0,d2				
	jbmi _?L639				
	moveq #-1,d4				
	lsr.l d2,d4				
	clr.l d5				
_?L645:						
						
	move.l 12(a3),d0			
						
	cmp.l a1,d0				
	jbcc _?L634				
						
	move.l 20(a3),a0			
						
	move.l d0,d2				
	addq.l #1,d2				
	move.l d2,12(a3)			
						
	move.b (a0,d0.l),d0			
						
	move.l (a3),d2				
	move.l 4(a3),d3				
						
	addq.l #1,24(a3)			
						
	move.b d1,8(a3)				
						
	jbeq _?L642				
						
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
	jbne _?L645				
_?L622:						
						
	moveq #11,d1				
	move.l d1,(a4)				
_?L614:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L677				
_?L634:						
						
	clr.l d0				
_?L613:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L615:						
						
	lea (-12,a0),a0				
	lea _miniflac_cuesheet_read_index_point_offset,a5
	moveq #2,d0				
	cmp.l a0,d0				
	jbcs _?L625				
_?L619:						
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbne _?L623				
						
	moveq #5,d0				
	cmp.l (a4),d0				
	jbne _?L619				
						
	moveq #1,d0				
_?L678:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L623:						
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbne _?L613				
						
	move.l (a4),d0				
						
	moveq #8,d2				
	cmp.l d0,d2				
	jbcc _?L618				
	moveq #9,d1				
	cmp.l d0,d1				
	jbeq _?L617				
_?L625:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L616:						
						
	move.l 4(a4),a2				
						
	moveq #12,d1				
	cmp.l a2,d1				
	jbcs _?L622				
						
	move.b 8(a3),d3				
	addq.l #1,a2				
	jbra _?L631				
_?L677:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,11(a4)			
						
	tst.l 44(sp)				
	jbeq _?L648				
						
	move.l 44(sp),a0			
	move.b d1,(a0)				
_?L648:						
						
	clr.b 10(a4)				
						
	moveq #12,d0				
	move.l d0,(a4)				
						
	moveq #1,d0				
	jbra _?L678				
_?L618:						
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_cuesheet_read_track_audio_flag
	lea (12,sp),sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L617				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L676:						
						
	move.b d3,d1				
	subq.b #8,d1				
						
	move.l (a3),d4				
	move.l 4(a3),d0				
	jbra _?L632				
_?L650:						
	clr.l d4				
	clr.l d0				
	jbra _?L635				
_?L642:						
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,a2				
	move.l a2,4(a4)				
						
	moveq #13,d0				
	cmp.l a2,d0				
	jbne _?L645				
						
	moveq #11,d1				
	move.l d1,(a4)				
	jbra _?L614				
_?L639:						
						
	moveq #-1,d5				
	moveq #31,d2				
	sub.l d3,d2				
	moveq #-2,d0				
	lsl.l d2,d0				
	move.l d5,d4				
	lsr.l d3,d4				
	or.l d0,d4				
	lsr.l d3,d5				
	jbra _?L645				
_?L649:						
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	clr.l 4(a4)				
						
	moveq #10,d0				
	move.l d0,(a4)				
	sub.l a2,a2				
	jbra _?L621				
_?L636:						
						
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
	jbra _?L635				
_?L629:						
						
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
	jbra _?L621				
_?L651:						
						
	move.l d0,a2				
	move.b d1,d3				
	jbra _?L631				
_?L675:						
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
	jbeq _?L680				
	jbcs _?L681				
	moveq #12,d2				
	cmp.l d0,d2				
	jbeq _?L735				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_cuesheet_read_track_indexpoints
	lea (12,sp),sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L735				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L681:						
						
	moveq #14,d3				
	cmp.l d0,d3				
	jbne _?L719				
						
	move.l 4(a4),a1				
						
	moveq #2,d6				
	cmp.l a1,d6				
	jbcs _?L686				
_?L685:						
						
	move.b 8(a3),d3				
						
	cmp.b #7,d3				
	jbhi _?L738				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L705				
						
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
_?L690:						
						
	move.b d1,8(a3)				
						
	jbeq _?L720				
						
	clr.l d2				
	move.b d1,d2				
						
	moveq #64,d5				
	sub.l d2,d5				
						
	moveq #32,d4				
	sub.l d2,d4				
	jbmi _?L693				
	moveq #-1,d2				
	lsr.l d4,d2				
	clr.l d7				
						
	move.l d7,d4				
	and.l d6,d4				
	move.l d2,d5				
	and.l d0,d5				
_?L692:						
	move.l d4,(a3)				
	move.l d5,4(a3)				
						
	lea (1,a1),a0				
	move.l a0,4(a4)				
						
	moveq #3,d2				
	cmp.l a0,d2				
	jbeq _?L686				
	cmp.b #7,d3				
	jbhi _?L739				
_?L696:						
						
	move.l 12(a3),d0			
						
	move.l 16(a3),a1			
						
	cmp.l d0,a1				
	jbls _?L705				
						
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
						
	jbeq _?L724				
						
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
	jbmi _?L710				
	moveq #-1,d6				
	lsr.l d3,d6				
	sub.l a5,a5				
						
	move.l a6,d2				
	move.l a5,d7				
	and.l d7,d2				
	move.l 36(sp),d3			
	and.l d6,d3				
_?L709:						
	move.l d2,(a3)				
	move.l d3,4(a3)				
						
	addq.l #1,a0				
	move.l a0,4(a4)				
						
	moveq #2,d6				
	cmp.l a0,d6				
	jbne _?L686				
						
	cmp.l a1,d4				
	jbcc _?L705				
						
	addq.l #2,d0				
	move.l d0,12(a3)			
						
	move.b (a2,d4.l),d0			
						
	addq.l #2,d5				
	move.l d5,24(a3)			
						
	move.b d1,8(a3)				
						
	jbeq _?L725				
						
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
	jbmi _?L713				
	moveq #-1,d0				
	lsr.l d5,d0				
	clr.l d1				
						
	and.l d4,d1				
	and.l d2,d0				
_?L712:						
	move.l d1,(a3)				
	move.l d0,4(a3)				
						
	moveq #3,d7				
	move.l d7,4(a4)				
_?L686:						
						
	move.b 10(a4),d0			
	addq.b #1,d0				
	move.b d0,10(a4)			
						
	moveq #12,d1				
	move.l d1,(a4)				
_?L687:						
						
	cmp.b 11(a4),d0				
	jbeq _?L740				
_?L717:						
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L741				
_?L705:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L735:						
						
	move.b 10(a4),d0			
						
	cmp.b 11(a4),d0				
	jbne _?L717				
_?L740:						
						
	addq.b #1,8(a4)				
						
	moveq #5,d3				
	move.l d3,(a4)				
	moveq #2,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L719:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L741:						
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 52(sp)				
	jbeq _?L718				
						
	move.l 52(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L718:						
						
	moveq #13,d0				
	move.l d0,(a4)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L738:						
						
	move.b d3,d1				
	subq.b #8,d1				
						
	move.l (a3),d6				
	move.l 4(a3),d0				
	jbra _?L690				
_?L680:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L705				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	clr.l 4(a4)				
						
	moveq #14,d7				
	move.l d7,(a4)				
	sub.l a1,a1				
	jbra _?L685				
_?L720:						
						
	clr.l d4				
	clr.l d5				
	jbra _?L692				
_?L739:						
						
	cmp.b #7,d1				
	jbhi _?L742				
						
	move.l 12(a3),d0			
						
	cmp.l 16(a3),d0				
	jbcc _?L705				
						
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
_?L698:						
						
	move.b d6,8(a3)				
						
	jbeq _?L721				
						
	clr.l d0				
	move.b d6,d0				
						
	moveq #64,d3				
	sub.l d0,d3				
						
	moveq #32,d2				
	sub.l d0,d2				
	jbmi _?L700				
	moveq #-1,d0				
	lsr.l d2,d0				
	clr.l d7				
						
	move.l d7,d2				
	and.l d4,d2				
	move.l d0,d3				
	and.l d5,d3				
_?L699:						
	move.l d2,(a3)				
	move.l d3,4(a3)				
						
	lea (2,a1),a0				
	move.l a0,4(a4)				
						
	moveq #2,d7				
	cmp.l a0,d7				
	jbne _?L686				
	cmp.b #7,d1				
	jbhi _?L743				
	move.b d6,d1				
	jbra _?L696				
_?L742:						
						
	move.b d1,d6				
	subq.b #8,d6				
	jbra _?L698				
_?L724:						
						
	clr.l d2				
	clr.l d3				
	jbra _?L709				
_?L721:						
	clr.l d2				
	clr.l d3				
	jbra _?L699				
_?L743:						
						
	cmp.b #7,d6				
	jbhi _?L744				
						
	move.l 12(a3),d0			
						
	cmp.l 16(a3),d0				
	jbcc _?L705				
						
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
_?L703:						
						
	move.b d6,8(a3)				
						
	jbeq _?L723				
						
	and.l #255,d6				
						
	moveq #64,d4				
	sub.l d6,d4				
						
	moveq #32,d1				
	sub.l d6,d1				
	jbmi _?L707				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d2,d1				
	and.l d3,d0				
_?L706:						
	move.l d1,(a3)				
	move.l d0,4(a3)				
						
	moveq #3,d2				
	move.l d2,4(a4)				
_?L745:						
						
	move.b 10(a4),d0			
	addq.b #1,d0				
	move.b d0,10(a4)			
						
	moveq #12,d1				
	move.l d1,(a4)				
	jbra _?L687				
_?L744:						
						
	subq.b #8,d6				
	jbra _?L703				
_?L723:						
	clr.l d1				
	clr.l d0				
						
	move.l d1,(a3)				
	move.l d0,4(a3)				
						
	moveq #3,d2				
	move.l d2,4(a4)				
	jbra _?L745				
_?L707:						
						
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
	jbra _?L706				
_?L693:						
						
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
	jbra _?L692				
_?L700:						
						
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
	jbra _?L699				
_?L710:						
						
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
	jbra _?L709				
_?L725:						
						
	clr.l d1				
	clr.l d0				
						
	move.l d1,(a3)				
	move.l d0,4(a3)				
						
	moveq #3,d7				
	move.l d7,4(a4)				
	jbra _?L686				
_?L713:						
						
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
	jbra _?L712				
						
	.align	2				
						
_miniflac_cuesheet_read_track_number:		
	movem.l d3/d4/a3/a4,-(sp)		
	move.l 20(sp),a4			
	move.l 24(sp),a3			
						
	move.l (a4),d0				
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcc _?L747				
	subq.l #6,d0				
	jbne _?L768				
_?L748:						
						
	move.b 8(a3),d3				
						
	cmp.b #7,d3				
	jbhi _?L757				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L759				
						
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
_?L757:						
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 28(sp)				
	jbeq _?L756				
						
	move.l 28(sp),a0			
	move.b d1,(a0)				
_?L756:						
						
	clr.l 4(a4)				
						
	moveq #7,d0				
	move.l d0,(a4)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L768:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L747:						
						
	subq.l #5,d0				
	jbne _?L750				
_?L752:						
						
	move.b 8(a4),d4				
	cmp.b 9(a4),d4				
	jbeq _?L769				
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L759				
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d4				
	move.l d4,(a4)				
	jbra _?L748				
_?L759:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L750:						
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_cuesheet_read_tracks	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L752				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
_?L769:						
						
	moveq #2,d0				
						
	movem.l (sp)+,d3/d4/a3/a4		
	rts					
						
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
	jbcs _?L771				
	move.l (a5),d0				
	add.l d0,d0				
	move.w _?L773(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L773:						
	.dc.w _?L779-_?L773			
	.dc.w _?L817-_?L773			
	.dc.w _?L818-_?L773			
	.dc.w _?L819-_?L773			
	.dc.w _?L775-_?L773			
	.dc.w _?L774-_?L773			
	.dc.w _?L772-_?L773			
_?L818:						
	lea _miniflac_bitreader_fill,a6		
_?L777:						
						
	clr.l d0				
	move.b 12(a5),d0			
	move.l d0,-(sp)				
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L783				
						
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
	jbne _?L784				
						
	clr.l d1				
	move.b 51(sp),d1			
	sub.l d1,d0				
	move.l d0,30(a5)			
_?L784:						
						
	clr.l d0				
	move.b 4(a5),d0				
						
	cmp.b _escape_codes(d0.l),d2		
	jbeq _?L835				
_?L785:						
						
	moveq #5,d1				
	move.l d1,(a5)				
_?L774:						
						
	move.b 8(a3),d2				
						
	jbne _?L836				
						
	move.l 12(a3),d0			
						
	cmp.l 16(a3),d0				
	jbcc _?L783				
_?L806:						
						
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
_?L805:						
						
	moveq #64,d5				
	sub.l d3,d5				
						
	moveq #32,d4				
	sub.l d3,d4				
	jbmi _?L798				
	moveq #-1,d3				
	lsr.l d4,d3				
	clr.l d4				
_?L799:						
						
	and.l d0,d4				
	move.l d4,(a3)				
	and.l d1,d3				
	move.l d3,4(a3)				
						
	move.l d6,d5				
	or.l d7,d5				
	jbne _?L800				
						
	addq.l #1,8(a5)				
	move.l d4,d0				
	move.l d3,d1				
_?L804:						
						
	subq.b #1,d2				
						
	clr.l d3				
	move.b d2,d3				
						
	move.b d2,8(a3)				
						
	move.w #-32,a1				
	add.l d3,a1				
	tst.l a1				
	jblt _?L807				
	move.l d0,d5				
	move.l a1,d4				
	lsr.l d4,d5				
	move.l d5,a0				
						
	clr.l d6				
	move.l a0,d7				
	moveq #1,d5				
	and.l d5,d7				
						
	tst.b d2				
	jbne _?L805				
_?L809:						
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	move.l d6,d0				
	or.l d7,d0				
	jbne _?L800				
						
	addq.l #1,8(a5)				
						
	move.l 12(a3),d0			
						
	cmp.l 16(a3),d0				
	jbcs _?L806				
_?L783:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L800:						
						
	moveq #6,d1				
	move.l d1,(a5)				
_?L772:						
						
	clr.l d0				
	move.b 6(a5),d0				
	move.l d0,-(sp)				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill,a6		
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L783				
						
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
	jbeq _?L810				
						
	move.l (a4),d1				
						
	move.l 84(sp),a0			
	move.l d0,(a0,d1.l*4)			
_?L810:						
						
	addq.l #1,(a4)				
						
	clr.l 8(a5)				
						
	move.l 26(a5),d0			
	addq.l #1,d0				
	move.l d0,26(a5)			
						
	cmp.l 30(a5),d0				
	jbcs _?L785				
_?L792:						
						
	clr.l 26(a5)				
						
	move.l 18(a5),d0			
	addq.l #1,d0				
	move.l d0,18(a5)			
						
	cmp.l 22(a5),d0				
	jbcc _?L771				
						
	moveq #2,d0				
	move.l d0,(a5)				
						
	jbra _?L777				
_?L798:						
						
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
	jbra _?L799				
_?L771:						
						
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
_?L817:						
	lea _miniflac_bitreader_fill,a6		
_?L778:						
						
	pea 4.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L783				
						
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
	jbra _?L777				
_?L819:						
	lea _miniflac_bitreader_fill,a6		
_?L776:						
						
	pea 5.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L783				
						
	pea 5.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,d3				
	move.b d1,7(a5)				
						
	moveq #4,d2				
	move.l d2,(a5)				
	tst.l 84(sp)				
	jbeq _?L793				
_?L786:						
						
	and.l #255,d3				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L783				
						
	move.b 7(a5),d3				
						
	jbeq _?L794				
						
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
	jbeq _?L794				
						
	move.w #-32,a1				
	add.l d5,a1				
	tst.l a1				
	jblt _?L796				
	clr.l d1				
						
	or.l d1,d0				
_?L794:						
						
	move.l d0,14(a5)			
						
	move.l (a4),d1				
						
	move.l 84(sp),a0			
	move.l d0,(a0,d1.l*4)			
						
	addq.l #1,(a4)				
						
	move.l 26(a5),d0			
	addq.l #1,d0				
	move.l d0,26(a5)			
						
	cmp.l 30(a5),d0				
	jbcc _?L792				
						
	moveq #4,d0				
	move.l d0,(a5)				
						
	jbra _?L786				
_?L775:						
						
	move.b 7(a5),d3				
	lea _miniflac_bitreader_fill,a6		
	tst.l 84(sp)				
	jbne _?L786				
	jbra _?L793				
_?L779:						
						
	pea 2.w					
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill,a6		
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L783				
						
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
	jbcs _?L811				
						
	move.b d1,4(a5)				
						
	move.b d1,d3				
	addq.b #4,d3				
	move.b d3,12(a5)			
						
	clr.l 8(a5)				
						
	moveq #1,d4				
	move.l d4,(a5)				
	jbra _?L778				
_?L789:						
						
	moveq #-1,d0				
	move.l 36(sp),d2			
	lsl.l d2,d0				
						
	or.l d0,d1				
_?L791:						
						
	move.l d1,d0				
_?L787:						
	move.l d0,14(a5)			
						
	addq.l #1,(a4)				
						
	move.l 26(a5),d0			
	addq.l #1,d0				
	move.l d0,26(a5)			
						
	cmp.l 30(a5),d0				
	jbcc _?L792				
						
	moveq #4,d4				
	move.l d4,(a5)				
_?L793:						
						
	and.l #255,d3				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L783				
						
	move.b 7(a5),d3				
						
	jbeq _?L787				
						
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
	jbeq _?L791				
						
	move.w #-32,a0				
	add.l 36(sp),a0				
	tst.l a0				
	jblt _?L789				
	clr.l d0				
						
	or.l d0,d1				
	jbra _?L791				
_?L796:						
						
	moveq #-1,d1				
	lsl.l d5,d1				
						
	or.l d1,d0				
	jbra _?L794				
_?L835:						
						
	moveq #3,d0				
	move.l d0,(a5)				
						
	jbra _?L776				
_?L836:						
	move.l (a3),d0				
	move.l 4(a3),d1				
	jbra _?L804				
_?L807:						
						
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
	jbeq _?L809				
	jbra _?L805				
_?L811:						
						
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
	jbcc _?L838				
	moveq #9,d4				
	cmp.l d0,d4				
	jbne _?L865				
_?L839:						
						
	move.b 8(a3),d3				
						
	cmp.b #31,d3				
	jbhi _?L850				
						
	move.l 16(a3),a1			
						
	move.l 12(a3),d2			
						
	cmp.l d2,a1				
	jbls _?L844				
						
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
	jbhi _?L850				
	cmp.l a1,a2				
	jbcc _?L844				
						
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
	jbhi _?L850				
	cmp.l d7,a1				
	jbls _?L844				
						
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
	jbhi _?L850				
	cmp.l a1,a2				
	jbcc _?L844				
						
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
_?L850:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,4(a4)				
						
	clr.l 8(a4)				
						
	tst.l 44(sp)				
	jbeq _?L849				
						
	move.l 44(sp),a0			
	move.l d1,(a0)				
_?L849:						
						
	moveq #10,d0				
	move.l d0,(a4)				
	moveq #1,d0				
_?L837:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L865:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L838:						
						
	moveq #8,d5				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d5				
	jbeq _?L841				
						
	moveq #7,d1				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d1				
	jbne _?L866				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L867				
_?L844:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L867:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #8,d1				
	move.l d1,(a4)				
_?L841:						
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L844				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #9,d4				
	move.l d4,(a4)				
	jbra _?L839				
_?L866:						
						
	subq.l #6,d0				
	jbeq _?L846				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
						
	moveq #1,d5				
	cmp.l d0,d5				
	jbne _?L837				
_?L846:						
						
	pea 32.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L844				
						
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
	jbne _?L844				
	jbra _?L867				
						
	.data					
_?LC16:						
	.dc.b $62,$72,$2d,$3e,$62,$69,$74,$73
	.dc.b $20,$3c,$20,$38
	.dc.b $00				
_?LC17:						
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
	jbeq _?L869				
	moveq #2,d2				
	cmp.l d0,d2				
	jbeq _?L870				
	tst.l d0				
	jbeq _?L871				
_?L904:						
						
	moveq #-1,d0				
_?L868:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (116,sp),sp				
	rts					
_?L871:						
						
	move.l 164(sp),-(sp)			
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d3				
	cmp.l d0,d3				
	jbne _?L868				
_?L869:						
						
	move.b 4(a6),d0				
						
	cmp.b 26(a6),d0				
	jbcc _?L999				
						
	move.l 42(a6),d1			
						
	move.b 27(a6),d3			
						
	clr.l d6				
	move.b d3,d6				
						
	move.l 22(a6),a0			
						
	moveq #-3,d7				
	move.l a0,d2				
	and.l d2,d7				
	subq.l #1,d7				
	jbeq _?L1164				
						
	moveq #2,d2				
	cmp.l a0,d2				
	jbeq _?L878				
_?L877:						
						
	clr.l d6				
	move.w 16(a6),d6			
	move.l d6,44(sp)			
	tst.l 168(sp)				
	jbeq _?L880				
_?L1168:					
						
	and.l #255,d0				
	lsl.l #2,d0				
						
	move.l 168(sp),a0			
	move.l (a0,d0.l),a3			
						
	moveq #4,d0				
	cmp.l d1,d0				
	jbcs _?L1146				
	add.l d1,d1				
	move.w _?L883(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L883:						
	.dc.w _?L879-_?L883			
	.dc.w _?L886-_?L883			
	.dc.w _?L885-_?L883			
	.dc.w _?L884-_?L883			
	.dc.w _?L882-_?L883			
_?L886:						
						
	move.b 46(a6),d3			
	lea _miniflac_bitreader_fill,a5		
_?L906:						
						
	clr.l d6				
	move.b d3,d6				
						
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1014				
						
	tst.b d3				
	jbne _?L1165				
_?L911:						
						
	tst.l a3				
	jbeq _?L1150				
						
	tst.l 44(sp)				
	jbeq _?L1150				
	move.l a3,a1				
	move.l 44(sp),d1			
	lsl.l #2,d1				
	add.l a3,d1				
_?L925:						
						
	move.l d0,(a1)+				
						
	cmp.l d1,a1				
	jbne _?L925				
_?L1146:					
	lea (92,a6),a2				
						
	tst.l a3				
	jbeq _?L997				
_?L952:						
						
	move.b 57(a6),d1			
						
	jbeq _?L997				
						
	tst.l 44(sp)				
	jbeq _?L997				
						
	and.l #255,d1				
	move.l 44(sp),d0			
	lsl.l #2,d0				
	lea (a3,d0.l),a1			
_?L998:						
						
	move.l (a3),d0				
						
	lsl.l d1,d0				
	move.l d0,(a3)+				
						
	cmp.l a1,a3				
	jbne _?L998				
_?L997:						
						
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
	jbcc _?L999				
_?L1171:					
						
	move.b 27(a6),d3			
						
	clr.l d6				
	move.b d3,d6				
						
	move.l 22(a6),d1			
						
	moveq #-3,d2				
	and.l d1,d2				
	subq.l #1,d2				
	jbeq _?L1166				
						
	subq.l #2,d1				
	jbeq _?L1019				
_?L1001:					
						
	clr.l d2				
	move.w 16(a6),d2			
	move.l d2,44(sp)			
	tst.l 168(sp)				
	jbeq _?L1029				
						
	and.l #255,d0				
	lsl.l #2,d0				
						
	move.l 168(sp),a0			
	move.l (a0,d0.l),a3			
_?L879:						
						
	move.l 48(a6),d0			
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill,a5		
	cmp.l d0,d1				
	jbeq _?L887				
_?L1175:					
	moveq #2,d2				
	cmp.l d0,d2				
	jbcs _?L888				
	tst.l d0				
	jbeq _?L889				
	lea _miniflac_bitreader_fill,a5		
						
	pea 6.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1167				
_?L1014:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (116,sp),sp				
	rts					
_?L1019:					
						
	clr.l d1				
_?L878:						
						
	tst.b d0				
	jbne _?L877				
	move.b d6,d3				
	addq.b #1,d3				
_?L1176:					
						
	clr.l d6				
	move.w 16(a6),d6			
	move.l d6,44(sp)			
	tst.l 168(sp)				
	jbne _?L1168				
_?L880:						
						
	moveq #4,d0				
	cmp.l d1,d0				
	jbcs _?L1150				
	add.l d1,d1				
	move.w _?L1015(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1015:					
	.dc.w _?L1029-_?L1015			
	.dc.w _?L1018-_?L1015			
	.dc.w _?L1017-_?L1015			
	.dc.w _?L1016-_?L1015			
	.dc.w _?L1030-_?L1015			
_?L1030:					
	sub.l a3,a3				
_?L882:						
						
	move.b 56(a6),76(sp)			
						
	clr.l d7				
	move.b 76(sp),d7			
						
	lea (220,a6),a0				
	move.l a0,88(sp)			
						
	move.b 46(a6),d3			
						
	clr.l d6				
	move.b d3,d6				
						
	cmp.l 84(a6),d7				
	jbls _?L959				
	lea _miniflac_bitreader_fill,a5		
_?L909:						
						
	move.w #-32,a1				
	add.l d6,a1				
	tst.l a1				
	jblt _?L960				
	clr.l 80(sp)				
						
	move.l d6,d1				
	subq.l #1,d1				
						
	moveq #1,d0				
	lsl.l d1,d0				
	move.l d0,40(sp)			
	smi d1					
	extb.l d1				
	move.l d1,36(sp)			
_?L968:						
						
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1014				
						
	tst.b d3				
	jbeq _?L963				
						
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
	jbeq _?L964				
						
	or.l 80(sp),d1				
_?L964:						
						
	move.l d1,d0				
_?L963:						
						
	tst.l a3				
	jbeq _?L965				
						
	move.l 84(a6),d1			
						
	move.l d0,(a3,d1.l*4)			
_?L965:						
						
	move.l 84(a6),d0			
	addq.l #1,d0				
	move.l d0,84(a6)			
						
	clr.l 80(a6)				
						
	cmp.l d0,d7				
	jbhi _?L968				
_?L910:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1014				
						
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
	jbne _?L1014				
_?L1181:					
						
	move.b 8(a4),d1				
	cmp.b #4,d1				
	jbls _?L972				
						
	subq.b #5,d1				
	move.b d1,8(a4)				
						
	move.l (a4),d3				
	move.l 4(a4),a5				
						
	clr.l d0				
	move.b d1,d0				
						
	move.w #-32,a1				
	add.l d0,a1				
	tst.l a1				
	jblt _?L973				
	move.l d3,d2				
	move.l a1,d6				
	lsr.l d6,d2				
_?L974:						
						
	sub.l a0,a0				
	moveq #31,d6				
	and.l d2,d6				
	move.l d6,a1				
						
	tst.b d1				
	jbeq _?L1025				
						
	moveq #64,d6				
	sub.l d0,d6				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L976				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d3,d1				
	move.l a5,d3				
	and.l d3,d0				
_?L975:						
	move.l d1,(a4)				
	move.l d0,4(a4)				
						
	clr.l 124(sp)				
	moveq #16,d6				
	and.l d2,d6				
	move.l d6,128(sp)			
						
	move.l 124(sp),d0			
	or.l 128(sp),d0				
	jbeq _?L978				
						
	move.w #-1,a0				
	move.l a1,d1				
	moveq #-32,d2				
	or.l d2,d1				
	move.l d1,a1				
_?L978:						
						
	move.l a1,d0				
	tst.l a0				
	jblt _?L1169				
						
	move.b d0,89(a6)			
						
	moveq #2,d3				
	move.l d3,80(a6)			
_?L980:						
						
	move.b 76(sp),d2			
	cmp.b 90(a6),d2				
	jbls _?L981				
						
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
_?L987:						
						
	and.l #255,d3				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1014				
						
	move.b 88(a3),d3			
						
	jbeq _?L983				
						
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
	jbeq _?L984				
						
	move.w #-32,a0				
	add.l d4,a0				
	tst.l a0				
	jblt _?L985				
	clr.l d0				
						
	or.l d0,d1				
_?L984:						
						
	move.l d1,d0				
_?L983:						
						
	move.b 90(a3),d1			
						
	move.b d1,d2				
	addq.b #1,d2				
	move.b d2,90(a3)			
	and.l #255,d1				
						
	move.l d0,92(a3,d1.l*4)			
						
	cmp.b 76(sp),d2				
	jbcs _?L987				
	move.l a3,d0				
	move.l a6,a3				
	move.l d6,132(sp)			
	move.l d7,136(sp)			
	move.l 36(sp),d7			
	move.l 80(sp),d4			
	move.l 84(sp),d5			
	move.l d0,a6				
_?L981:						
						
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
	jbne _?L868				
						
	tst.l a3				
	jbeq _?L1150				
						
	cmp.l 44(sp),d7				
	jbcc _?L1148				
						
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
_?L988:						
						
	clr.l d0				
	tst.l d7				
	jbeq _?L993				
	move.l a2,a1				
	move.l a0,a3				
						
	clr.l d2				
	clr.l d3				
_?L989:						
						
	move.l (a1)+,d1				
						
	move.l -(a3),d0				
	move.l d1,d5				
	muls.l d0,d4:d5				
						
	add.l d5,d3				
	addx.l d4,d2				
						
	cmp.l d6,a1				
	jbne _?L989				
						
	tst.l 76(sp)				
	jblt _?L990				
	move.l d2,d0				
	move.l 76(sp),d1			
	asr.l d1,d0				
_?L993:						
						
	move.l (a0),d3				
	smi d2					
	extb.l d2				
						
	add.l d3,d0				
	move.l d0,(a0)+				
						
	addq.l #1,36(sp)			
	move.l 80(sp),d2			
	cmp.l 36(sp),d2				
	jbne _?L988				
	move.l a5,a3				
						
	tst.l a3				
	jbne _?L952				
	jbra _?L997				
_?L885:						
						
	move.b 46(a6),d3			
						
	move.l 68(a6),d0			
_?L907:						
						
	clr.l d6				
	move.b d3,d6				
						
	cmp.l 44(sp),d0				
	jbcc _?L933				
_?L926:						
						
	move.w #-32,a1				
	add.l d6,a1				
	tst.l a1				
	jblt _?L927				
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
_?L934:						
						
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1014				
						
	tst.b d3				
	jbeq _?L929				
						
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
	jbeq _?L930				
						
	or.l 76(sp),d1				
_?L930:						
						
	move.l d1,d0				
_?L929:						
						
	tst.l a3				
	jbeq _?L931				
						
	move.l 68(a6),d1			
						
	move.l d0,(a3,d1.l*4)			
						
	move.l 68(a6),d0			
	addq.l #1,d0				
	move.l d0,68(a6)			
						
	cmp.l 44(sp),d0				
	jbcs _?L934				
_?L933:						
						
	clr.l 68(a6)				
	lea (92,a6),a2				
_?L1170:					
						
	tst.l a3				
	jbne _?L952				
	jbra _?L997				
_?L884:						
						
	move.l 76(a6),d0			
						
	move.b 46(a6),d3			
_?L908:						
						
	move.b 56(a6),76(sp)			
						
	clr.l d6				
	move.b d3,d6				
						
	clr.l d7				
	move.b 76(sp),d7			
	cmp.l d7,d0				
	jbcc _?L944				
						
	move.w #-32,a1				
	add.l d6,a1				
	tst.l a1				
	jblt _?L937				
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
_?L945:						
						
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1014				
						
	tst.b d3				
	jbeq _?L939				
						
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
	jbeq _?L940				
						
	or.l 80(sp),d1				
_?L940:						
						
	move.l d1,d0				
_?L939:						
						
	tst.l a3				
	jbeq _?L941				
						
	move.l 76(a6),d1			
						
	move.l d0,(a3,d1.l*4)			
						
	move.l 76(a6),d0			
	addq.l #1,d0				
	move.l d0,76(a6)			
						
	cmp.l d7,d0				
	jbcs _?L945				
						
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
	jbne _?L868				
						
	cmp.b #3,76(sp)				
	jbeq _?L946				
	jbhi _?L947				
	cmp.b #1,76(sp)				
	jbeq _?L948				
						
	moveq #2,d3				
	move.l d3,76(a6)			
						
	moveq #2,d0				
						
	cmp.l 44(sp),d3				
	jbcc _?L1148				
_?L955:						
						
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
	jbcc _?L1146				
						
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
	jbcs _?L955				
	jbra _?L1146				
_?L931:						
						
	move.l 68(a6),d0			
	addq.l #1,d0				
	move.l d0,68(a6)			
						
	cmp.l 44(sp),d0				
	jbcs _?L934				
						
	clr.l 68(a6)				
	lea (92,a6),a2				
	jbra _?L1170				
_?L941:						
						
	move.l 76(a6),d0			
	addq.l #1,d0				
	move.l d0,76(a6)			
						
	cmp.l d7,d0				
	jbcs _?L945				
_?L944:						
						
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
	jbne _?L868				
						
	tst.l a3				
	jbne _?L1134				
_?L1150:					
	lea (92,a6),a2				
_?L1179:					
						
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
	jbcs _?L1171				
_?L999:						
						
	cmp.b #7,8(a4)				
	jbhi _?L1172				
						
	clr.b 8(a4)				
						
	clr.l (a4)				
	clr.l 4(a4)				
						
	move.w 10(a4),6(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L870:						
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1014				
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.w 6(a6),d1				
	jbne _?L1028				
						
	move.l 24(a4),8(a6)			
						
	tst.l 168(sp)				
	jbeq _?L1003				
						
	move.l 22(a6),d0			
	moveq #2,d1				
	cmp.l d0,d1				
	jbeq _?L1004				
	moveq #3,d2				
	cmp.l d0,d2				
	jbeq _?L1005				
	subq.l #1,d0				
	jbeq _?L1173				
_?L1003:					
						
	tst.b 8(a4)				
	jbne _?L1174				
						
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
_?L1166:					
						
	cmp.b #1,d0				
	jbne _?L1001				
	addq.b #1,d3				
						
	clr.l d2				
	move.w 16(a6),d2			
	move.l d2,44(sp)			
	tst.l 168(sp)				
	jbeq _?L1029				
	move.l 168(sp),a0			
	move.l 4(a0),a3				
						
	move.l 48(a6),d0			
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill,a5		
	cmp.l d0,d1				
	jbne _?L1175				
_?L887:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1014				
						
	clr.b 57(a6)				
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d0,d2				
	or.l d1,d2				
	jbeq _?L897				
						
	moveq #3,d6				
	move.l d6,48(a6)			
						
	move.l #_miniflac_bitreader_read,d7	
	move.l d4,36(sp)			
	move.l d5,40(sp)			
_?L898:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1014				
						
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
	jbne _?L898				
						
	move.l 36(sp),d4			
	move.l 40(sp),d5			
	sub.b d6,d3				
_?L897:						
						
	clr.l 48(a6)				
						
	move.b d3,46(a6)			
						
	move.l 52(a6),d0			
						
	moveq #3,d6				
	cmp.l d0,d6				
	jbeq _?L900				
	jbcs _?L901				
	moveq #1,d7				
	cmp.l d0,d7				
	jbeq _?L902				
	subq.l #2,d0				
	jbne _?L904				
						
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
	jbra _?L908				
_?L1164:					
						
	cmp.b #1,d0				
	jbne _?L877				
	addq.b #1,d3				
	jbra _?L1176				
_?L1029:					
						
	sub.l a3,a3				
	jbra _?L879				
_?L888:						
	lea _miniflac_bitreader_fill,a5		
						
	subq.l #3,d0				
	jbne _?L1014				
						
	move.l #_miniflac_bitreader_read,d7	
	move.l d4,36(sp)			
	move.l d5,40(sp)			
	jbra _?L898				
_?L927:						
						
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
	jbra _?L934				
_?L937:						
						
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
	jbra _?L945				
_?L960:						
						
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
	jbra _?L968				
_?L959:						
						
	move.l 80(a6),d0			
						
	jbeq _?L1177				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L1178				
						
	subq.l #2,d0				
	jbne _?L981				
	jbra _?L980				
_?L1165:					
						
	move.b 8(a4),d0				
	cmp.b d0,d3				
	jbhi _?L972				
						
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
	jbmi _?L913				
	moveq #-1,d1				
	lsr.l d2,d1				
	sub.l a5,a5				
_?L914:						
						
	move.w #-32,a1				
	add.l d0,a1				
	tst.l a1				
	jblt _?L915				
	move.l 36(sp),d2			
	move.l a1,d3				
	lsr.l d3,d2				
	sub.l a1,a1				
_?L916:						
						
	move.l a5,d7				
	move.l a1,d3				
	and.l d3,d7				
	move.l d7,a5				
	and.l d1,d2				
						
	move.w a2,d7				
	tst.b d7				
	jbeq _?L1024				
						
	moveq #64,d3				
	sub.l d0,d3				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L918				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l 36(sp),d1				
	move.l a0,d3				
	and.l d3,d0				
_?L917:						
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
	jbeq _?L920				
						
	move.w #-32,a1				
	add.l d6,a1				
	tst.l a1				
	jblt _?L921				
	clr.l d0				
						
	or.l d0,d2				
_?L920:						
						
	move.l d2,d0				
	jbra _?L911				
_?L889:						
						
	pea 1.w					
	move.l a4,-(sp)				
	lea _miniflac_bitreader_fill,a5		
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1014				
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d0,d7				
	or.l d1,d7				
	jbne _?L1021				
						
	moveq #1,d0				
	move.l d0,48(a6)			
						
	pea 6.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1014				
	jbra _?L1167				
_?L1016:					
						
	move.l 76(a6),d0			
						
	move.b 46(a6),d3			
						
	sub.l a3,a3				
	jbra _?L908				
_?L1017:					
						
	move.b 46(a6),d3			
						
	clr.l d6				
	move.b d3,d6				
						
	sub.l a3,a3				
						
	move.l 44(sp),d2			
	cmp.l 68(a6),d2				
	jbhi _?L926				
	lea (92,a6),a2				
	jbra _?L1179				
_?L1018:					
						
	move.b 46(a6),d3			
						
	sub.l a3,a3				
	lea _miniflac_bitreader_fill,a5		
	jbra _?L906				
_?L947:						
						
	cmp.b #4,76(sp)				
	jbne _?L1148				
						
	moveq #4,d7				
	move.l d7,76(a6)			
						
	moveq #4,d0				
						
	cmp.l 44(sp),d7				
	jbcc _?L1148				
_?L958:						
						
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
	jbcc _?L1146				
						
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
	jbcs _?L958				
	jbra _?L1146				
_?L901:						
						
	subq.l #4,d0				
	jbne _?L904				
						
	clr.l 68(a6)				
						
	clr.l 64(a6)				
						
	moveq #2,d7				
	move.l d7,42(a6)			
						
	clr.l d0				
						
	clr.l d6				
	move.b d3,d6				
						
	cmp.l 44(sp),d0				
	jbcs _?L926				
	jbra _?L933				
_?L990:						
						
	add.l d2,d2				
	move.l 140(sp),d0			
	lsl.l d0,d2				
	move.l d3,d0				
	move.l 88(sp),d1			
	lsr.l d1,d0				
	or.l d2,d0				
	jbra _?L993				
_?L985:						
						
	moveq #-1,d0				
	lsl.l d4,d0				
						
	or.l d0,d1				
	jbra _?L984				
_?L1024:					
	clr.l d1				
	clr.l d0				
	jbra _?L917				
_?L900:						
						
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
	jbne _?L909				
						
	clr.b 76(sp)				
	jbra _?L910				
_?L902:						
						
	clr.l 60(a6)				
						
	moveq #1,d6				
	move.l d6,42(a6)			
						
	jbra _?L906				
_?L915:						
						
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
	jbra _?L916				
_?L913:						
						
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
	jbra _?L914				
_?L948:						
						
	moveq #1,d1				
	move.l d1,76(a6)			
						
	moveq #1,d0				
						
	cmp.l 44(sp),d1				
	jbcs _?L954				
_?L1148:					
	lea (92,a6),a2				
	jbra _?L952				
_?L1167:					
						
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
	jbne _?L893				
						
	moveq #1,d7				
	move.l d7,52(a6)			
						
	moveq #2,d1				
	move.l d1,48(a6)			
	jbra _?L887				
_?L1173:					
						
	move.w 16(a6),d0			
						
	jbeq _?L1003				
	move.l 168(sp),a0			
	move.l (a0),a1				
	move.l 4(a0),a2				
	and.l #65535,d0				
	lsl.l #2,d0				
	add.l a1,d0				
_?L1010:					
						
	move.l (a1)+,d1				
	sub.l (a2),d1				
	move.l d1,(a2)+				
						
	cmp.l a1,d0				
	jbeq _?L1003				
						
	move.l (a1)+,d1				
	sub.l (a2),d1				
	move.l d1,(a2)+				
						
	cmp.l a1,d0				
	jbne _?L1010				
	jbra _?L1003				
_?L918:						
						
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
	jbra _?L917				
_?L954:						
						
	lsl.l #2,d0				
						
	move.l -4(a3,d0.l),d2			
	add.l d2,(a3,d0.l)			
						
	move.l 76(a6),d0			
	addq.l #1,d0				
	move.l d0,76(a6)			
						
	cmp.l 44(sp),d0				
	jbcc _?L1146				
						
	lsl.l #2,d0				
						
	move.l -4(a3,d0.l),d2			
	add.l d2,(a3,d0.l)			
						
	move.l 76(a6),d0			
	addq.l #1,d0				
	move.l d0,76(a6)			
						
	cmp.l 44(sp),d0				
	jbcs _?L954				
	jbra _?L1146				
_?L1134:					
						
	cmp.b #3,76(sp)				
	jbeq _?L946				
	jbhi _?L947				
	cmp.b #1,76(sp)				
	jbeq _?L948				
	cmp.b #2,76(sp)				
	jbne _?L1148				
						
	moveq #2,d3				
	move.l d3,76(a6)			
						
	moveq #2,d0				
						
	cmp.l 44(sp),d3				
	jbcs _?L955				
	jbra _?L1148				
_?L921:						
						
	moveq #-1,d0				
	lsl.l d6,d0				
						
	or.l d0,d2				
	jbra _?L920				
_?L1005:					
						
	move.w 16(a6),d0			
						
	jbeq _?L1003				
	move.l 168(sp),a0			
	move.l (a0),a1				
	move.l 4(a0),a2				
	and.l #65535,d0				
	lsl.l #2,d0				
	add.l a1,d0				
_?L1012:					
						
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
	jbeq _?L1003				
						
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
	jbne _?L1012				
	jbra _?L1003				
_?L1004:					
						
	move.w 16(a6),d0			
						
	jbeq _?L1003				
	move.l 168(sp),a0			
	move.l (a0),a1				
	move.l 4(a0),a2				
	and.l #65535,d0				
	lsl.l #2,d0				
	add.l a1,d0				
_?L1011:					
						
	move.l (a1),d1				
	add.l (a2)+,d1				
	move.l d1,(a1)+				
						
	cmp.l d0,a1				
	jbeq _?L1003				
						
	move.l (a1),d1				
	add.l (a2)+,d1				
	move.l d1,(a1)+				
						
	cmp.l d0,a1				
	jbne _?L1011				
	jbra _?L1003				
_?L946:						
						
	moveq #3,d6				
	move.l d6,76(a6)			
						
	cmp.l 44(sp),d6				
	jbcc _?L1148				
						
	moveq #3,d6				
	move.l d6,d0				
_?L957:						
						
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
	jbcc _?L1146				
						
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
	jbcs _?L957				
	jbra _?L1146				
_?L893:						
						
	move.l 92(sp),d6			
	move.l 96(sp),d7			
	clr.l d0				
	moveq #1,d1				
	sub.l d1,d7				
	subx.l d0,d6				
	jbeq _?L1180				
						
	clr.l 100(sp)				
	moveq #7,d6				
	not.b d6				
	and.l d2,d6				
	move.l d6,104(sp)			
	move.l 100(sp),d7			
	or.l 104(sp),d7				
	jbeq _?L1023				
						
	move.l 92(sp),d6			
	move.l 96(sp),d7			
	clr.l d0				
	moveq #12,d1				
	sub.l d1,d7				
	subx.l d0,d6				
	jbhi _?L896				
						
	moveq #2,d1				
	move.l d1,52(a6)			
						
	subq.b #8,d2				
	move.b d2,56(a6)			
						
	moveq #2,d1				
	move.l d1,48(a6)			
	jbra _?L887				
_?L1169:					
						
	clr.l d0				
						
	move.b d0,89(a6)			
						
	moveq #2,d3				
	move.l d3,80(a6)			
	jbra _?L980				
_?L1025:					
	clr.l d1				
	clr.l d0				
	jbra _?L975				
_?L896:						
						
	clr.l 108(sp)				
	moveq #31,d6				
	not.b d6				
	and.l d2,d6				
	move.l d6,112(sp)			
	move.l 108(sp),d7			
	or.l 112(sp),d7				
	jbeq _?L1023				
						
	moveq #3,d0				
	move.l d0,52(a6)			
						
	add.b #-31,d2				
	move.b d2,56(a6)			
						
	moveq #2,d1				
	move.l d1,48(a6)			
	jbra _?L887				
_?L1180:					
						
	moveq #4,d1				
	move.l d1,52(a6)			
						
	moveq #2,d1				
	move.l d1,48(a6)			
	jbra _?L887				
_?L973:						
						
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
	jbra _?L974				
_?L976:						
						
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
	jbra _?L975				
_?L1172:					
						
	pea 2934.w				
	pea _?LC10				
	pea _?LC16				
						
	pea _?LC12				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
_?L1023:					
						
	moveq #-17,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (116,sp),sp				
	rts					
_?L1178:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 5.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1014				
	jbra _?L1181				
_?L1174:					
						
	pea 3318.w				
	pea _?LC10				
	pea _?LC17				
	pea _?LC12				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
_?L1028:					
						
	moveq #-3,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (116,sp),sp				
	rts					
_?L1177:					
	lea _miniflac_bitreader_fill,a5		
	jbra _?L910				
_?L972:						
	jbsr (_miniflac_bitreader_read?part?0)	
_?L1021:					
	moveq #-16,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (116,sp),sp				
	rts					
						
	.align	2				
						
_miniflac_streaminfo_read_total_samples:	
	movem.l d3/d4/d5/d6/d7/a3/a4/a5,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),a3			
						
	move.l (a4),d0				
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcc _?L1183				
	subq.l #7,d0				
	jbne _?L1210				
_?L1184:					
						
	move.b 8(a3),d3				
						
	cmp.b #35,d3				
	jbhi _?L1195				
						
	move.l 16(a3),a0			
						
	move.l 12(a3),d2			
						
	cmp.l a0,d2				
	jbcc _?L1189				
						
	move.l 20(a3),a1			
						
	move.l d2,a2				
	addq.l #1,a2				
	move.l a2,12(a3)			
						
	move.l (a3),d4				
	move.l 4(a3),d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d0				
	move.l d5,d1				
	or.b (a1,d2.l),d1			
						
	move.l d0,(a3)				
	move.l d1,4(a3)				
						
	move.b d3,d5				
	addq.b #8,d5				
	move.b d5,8(a3)				
						
	move.l 24(a3),d4			
						
	move.l d4,d6				
	addq.l #1,d6				
	move.l d6,24(a3)			
						
	cmp.b #35,d5				
	jbhi _?L1195				
	cmp.l a2,a0				
	jbls _?L1189				
						
	move.l d2,d5				
	addq.l #2,d5				
	move.l d5,12(a3)			
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d6				
	move.l d1,d7				
	or.b (a1,a2.l),d7			
						
	move.l d6,(a3)				
	move.l d7,4(a3)				
						
	move.b d3,d0				
	add.b #16,d0				
	move.b d0,8(a3)				
						
	move.l d4,d1				
	addq.l #2,d1				
	move.l d1,24(a3)			
						
	cmp.b #35,d0				
	jbhi _?L1195				
	cmp.l d5,a0				
	jbls _?L1189				
						
	addq.l #2,a2				
	move.l a2,12(a3)			
						
	move.l d6,d0				
	move.l d7,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d6				
	move.l d1,d7				
	or.b (a1,d5.l),d7			
						
	move.l d6,(a3)				
	move.l d7,4(a3)				
						
	move.b d3,d0				
	add.b #24,d0				
	move.b d0,8(a3)				
						
	move.l d4,d1				
	addq.l #3,d1				
	move.l d1,24(a3)			
						
	cmp.b #35,d0				
	jbhi _?L1195				
	cmp.l a0,a2				
	jbcc _?L1189				
						
	addq.l #2,d5				
	move.l d5,12(a3)			
						
	move.l d6,d0				
	move.l d7,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d6				
	move.l d1,d7				
	or.b (a1,a2.l),d7			
						
	move.l d6,(a3)				
	move.l d7,4(a3)				
						
	move.b d3,d0				
	add.b #32,d0				
	move.b d0,8(a3)				
						
	move.l d4,d1				
	addq.l #4,d1				
	move.l d1,24(a3)			
						
	cmp.b #35,d0				
	jbhi _?L1195				
	cmp.l a0,d5				
	jbcc _?L1189				
						
	addq.l #5,d2				
	move.l d2,12(a3)			
						
	clr.l d2				
	move.b (a1,d5.l),d2			
						
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	clr.l d0				
	or.l d6,d0				
	move.l d0,(a3)				
	or.l d7,d2				
	move.l d2,4(a3)				
						
	add.b #40,d3				
	move.b d3,8(a3)				
						
	addq.l #5,d4				
	move.l d4,24(a3)			
_?L1195:					
						
	pea 36.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 44(sp)				
	jbeq _?L1194				
						
	move.l 44(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L1194:					
						
	moveq #8,d0				
	move.l d0,(a4)				
	moveq #1,d0				
_?L1182:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L1210:					
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L1183:					
						
	moveq #6,d1				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d1				
	jbeq _?L1186				
						
	moveq #5,d6				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d6				
	jbne _?L1211				
						
	pea 3.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1212				
_?L1189:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L1212:					
						
	pea 3.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d1				
	move.l d1,(a4)				
_?L1186:					
						
	pea 5.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1189				
						
	pea 5.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
	move.b d1,10(a4)			
						
	moveq #7,d6				
	move.l d6,(a4)				
	jbra _?L1184				
_?L1211:					
						
	subq.l #4,d0				
	jbeq _?L1191				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
						
	moveq #1,d6				
	cmp.l d0,d6				
	jbne _?L1182				
_?L1191:					
						
	pea 20.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1189				
						
	pea 20.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,6(a4)				
						
	moveq #5,d0				
	move.l d0,(a4)				
						
	pea 3.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1189				
	jbra _?L1212				
						
	.globl	___lshrdi3			
	.align	2				
						
_miniflac_sync_internal:			
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 44(sp),a4			
	move.l 48(sp),a3			
						
	moveq #5,d0				
	cmp.l (a4),d0				
	jbcs _?L1330				
	move.l (a4),d0				
	add.l d0,d0				
	move.w _?L1216(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1216:					
	.dc.w _?L1221-_?L1216			
	.dc.w _?L1220-_?L1216			
	.dc.w _?L1219-_?L1216			
	.dc.w _?L1218-_?L1216			
	.dc.w _?L1217-_?L1216			
	.dc.w _?L1215-_?L1216			
_?L1220:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	move.b 8(a3),d0				
	cmp.b #7,d0				
	jbls _?L1254				
						
	and.l #255,d0				
						
	move.l d0,d2				
	subq.l #8,d2				
						
	move.w #-40,a0				
	add.l d0,a0				
	move.l (a3),d0				
	tst.l a0				
	jblt _?L1243				
	move.l a0,d1				
	lsr.l d1,d0				
_?L1244:					
						
	cmp.b #102,d0				
	jbeq _?L1463				
						
	cmp.b #-1,d0				
	jbne _?L1330				
_?L1255:					
						
	moveq #5,d3				
	move.l d3,(a4)				
_?L1215:					
						
	move.l a4,d4				
	add.l #210,d4				
						
	lea (122,a4),a5				
						
	lea _miniflac_frame_decode,a6		
_?L1363:					
						
	tst.l 210(a4)				
	jbeq _?L1464				
						
	clr.l -(sp)				
	move.l a5,-(sp)				
	move.l a3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a6)				
	lea (16,sp),sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L1363				
_?L1213:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L1247:					
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	subq.l #3,d0				
	jbne _?L1330				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
_?L1468:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #67,d1				
	jbne _?L1252				
						
	clr.l 96(a4)				
						
	tst.b 8(a3)				
	jbne _?L1465				
						
	clr.b 9(a3)				
						
	clr.w 10(a3)				
						
	moveq #3,d1				
	move.l d1,(a4)				
_?L1218:					
						
	pea 16.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
_?L1469:					
						
	move.b 8(a3),d0				
	cmp.b #13,d0				
	jbls _?L1254				
						
	and.l #255,d0				
	move.l d0,a0				
						
	lea (-14,a0),a1				
						
	lea (-46,a0),a0				
	move.l (a3),d0				
	tst.l a0				
	jblt _?L1256				
	move.l a0,d2				
	lsr.l d2,d0				
_?L1257:					
						
	and.l #16383,d0				
						
	cmp.w #16382,d0				
	jbeq _?L1255				
						
	moveq #4,d7				
	move.l d7,(a4)				
_?L1217:					
						
	move.l 100(a4),d0			
						
	jbeq _?L1466				
						
	subq.l #1,d0				
	jbne _?L1330				
	moveq #6,d2				
	cmp.l 114(a4),d2			
	jbcs _?L1258				
	move.l 114(a4),d0			
	add.l d0,d0				
	move.w _?L1260(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1260:					
	.dc.w _?L1266-_?L1260			
	.dc.w _?L1265-_?L1260			
	.dc.w _?L1264-_?L1260			
	.dc.w _?L1263-_?L1260			
	.dc.w _?L1262-_?L1260			
	.dc.w _?L1261-_?L1260			
	.dc.w _?L1259-_?L1260			
_?L1366:					
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	clr.l 92(a4)				
_?L1223:					
						
	move.b #1,468(a4)			
						
	move.l 78(a4),464(a4)			
						
	moveq #2,d7				
	move.l d7,(a4)				
_?L1219:					
						
	move.l 96(a4),d0			
						
	moveq #2,d7				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d7				
	jbeq _?L1246				
_?L1474:					
	moveq #2,d1				
	cmp.l d0,d1				
	jbcs _?L1247				
	tst.l d0				
	jbeq _?L1248				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1467				
_?L1285:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L1221:					
						
	moveq #7,d1				
	cmp.l 92(a4),d1				
	jbcs _?L1223				
	move.l 92(a4),d0			
	add.l d0,d0				
	move.w _?L1225(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1225:					
	.dc.w _?L1232-_?L1225			
	.dc.w _?L1397-_?L1225			
	.dc.w _?L1398-_?L1225			
	.dc.w _?L1399-_?L1225			
	.dc.w _?L1400-_?L1225			
	.dc.w _?L1401-_?L1225			
	.dc.w _?L1402-_?L1225			
	.dc.w _?L1396-_?L1225			
_?L1466:					
						
	move.l a3,48(sp)			
						
	lea (100,a4),a4				
	move.l a4,44(sp)			
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
						
	jbra _miniflac_metadata_sync		
_?L1467:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #76,d1				
	jbne _?L1252				
						
	moveq #2,d7				
	move.l d7,96(a4)			
_?L1246:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #97,d1				
	jbne _?L1252				
						
	moveq #3,d0				
	move.l d0,96(a4)			
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
	jbra _?L1468				
_?L1464:					
						
	move.l a5,-(sp)				
	move.l a3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L1256:					
						
	add.l d0,d0				
	moveq #31,d2				
	sub.l a1,d2				
	move.l d0,d1				
	lsl.l d2,d1				
	move.l 4(a3),d0				
	move.l a1,d3				
	lsr.l d3,d0				
	or.l d1,d0				
	jbra _?L1257				
_?L1267:					
						
	subq.l #2,d0				
	jbeq _?L1329				
_?L1330:					
						
	moveq #-1,d0				
_?L1476:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L1402:					
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1226:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.b d1				
	jbne _?L1330				
						
	moveq #7,d3				
	move.l d3,92(a4)			
_?L1224:					
						
	pea 16.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	move.b 8(a3),d0				
	cmp.b #15,d0				
	jbls _?L1354				
						
	add.b #-16,d0				
	move.b d0,8(a3)				
						
	jbeq _?L1366				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L1240				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	clr.l 92(a4)				
	jbra _?L1223				
_?L1401:					
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1227:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #1,d1				
	jbne _?L1330				
						
	moveq #6,d2				
	move.l d2,92(a4)			
	jbra _?L1226				
_?L1400:					
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1228:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #67,d1				
	jbne _?L1330				
						
	moveq #5,d1				
	move.l d1,92(a4)			
	jbra _?L1227				
_?L1399:					
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1229:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #65,d1				
	jbne _?L1330				
						
	moveq #4,d0				
	move.l d0,92(a4)			
	jbra _?L1228				
_?L1398:					
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1230:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #76,d1				
	jbne _?L1330				
						
	moveq #3,d7				
	move.l d7,92(a4)			
	jbra _?L1229				
_?L1397:					
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1231:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #70,d1				
	jbne _?L1330				
						
	moveq #2,d3				
	move.l d3,92(a4)			
	jbra _?L1230				
_?L1396:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1224				
_?L1232:					
						
	pea 8.w					
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #127,d1				
	jbne _?L1365				
						
	moveq #1,d2				
	move.l d2,92(a4)			
	jbra _?L1231				
_?L1261:					
						
	move.l a4,d3				
	add.l #166,d3				
	lea _miniflac_cuesheet_read_track_indexpoints,a5
_?L1328:					
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1328				
_?L1298:					
						
	moveq #2,d3				
	cmp.l d0,d3				
	jbne _?L1213				
_?L1270:					
						
	tst.b 8(a3)				
	jbne _?L1359				
_?L1360:					
						
	clr.b 9(a3)				
						
	clr.w 10(a3)				
						
	clr.l 100(a4)				
						
	clr.l 104(a4)				
						
	moveq #3,d1				
	move.l d1,(a4)				
						
	pea 16.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1469				
	jbra _?L1285				
_?L1265:					
						
	move.l 206(a4),d3			
						
	move.l 202(a4),d6			
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_read,a6		
						
	cmp.l d6,d3				
	jbcc _?L1270				
_?L1269:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	addq.l #1,d3				
	move.l d3,206(a4)			
						
	cmp.l d6,d3				
	jbne _?L1269				
						
	tst.b 8(a3)				
	jbeq _?L1360				
	jbra _?L1359				
_?L1263:					
						
	move.l 178(a4),d0			
						
	moveq #1,d3				
	cmp.l d0,d3				
	jbcs _?L1267				
						
	subq.l #1,d0				
	jbne _?L1333				
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1331:					
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,178(a4)			
_?L1329:					
						
	move.b 8(a3),d3				
						
	cmp.b #15,d3				
	jbhi _?L1335				
						
	move.l 16(a3),a1			
						
	move.l 12(a3),d2			
						
	cmp.l a1,d2				
	jbcc _?L1285				
						
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
	jbhi _?L1335				
	cmp.l a1,a0				
	jbcc _?L1285				
						
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
_?L1335:					
						
	pea 16.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.l #1,186(a4)			
						
	clr.l 178(a4)				
_?L1333:					
						
	move.l 186(a4),d7			
	cmp.l 182(a4),d7			
	jbeq _?L1270				
						
	pea 64.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 64.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,178(a4)			
	jbra _?L1331				
_?L1264:					
						
	move.l 190(a4),d0			
						
	jbeq _?L1337				
	subq.l #1,d0				
	jbne _?L1330				
						
	move.l 198(a4),d0			
						
	move.l 194(a4),a6			
						
	move.b 8(a3),d6				
	move.l d0,a5				
	addq.l #1,a5				
						
	cmp.l a6,d0				
	jbcc _?L1270				
_?L1343:					
						
	cmp.b #7,d6				
	jbhi _?L1470				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L1285				
						
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
_?L1339:					
						
	move.b d3,8(a3)				
	clr.l d0				
						
	tst.b d3				
	jbeq _?L1371				
						
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
_?L1341:					
	move.l d0,(a3)				
	move.l d1,4(a3)				
						
	move.l a5,198(a4)			
						
	cmp.l a6,a5				
	jbeq _?L1270				
	move.l a5,d0				
	addq.l #1,d0				
	cmp.b #7,d6				
	jbhi _?L1372				
						
	move.l 16(a3),a1			
						
	clr.l d2				
	move.b d3,d2				
	moveq #64,d0				
	sub.l d2,d0				
						
	moveq #32,d1				
	sub.l d2,d1				
	jbmi _?L1344				
	moveq #-1,d2				
	lsr.l d1,d2				
	clr.l d6				
_?L1350:					
						
	move.l 12(a3),d0			
						
	cmp.l a1,d0				
	jbcc _?L1285				
						
	move.l 20(a3),a0			
						
	move.l d0,d7				
	addq.l #1,d7				
	move.l d7,12(a3)			
						
	move.b (a0,d0.l),d7			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
						
	addq.l #1,24(a3)			
						
	move.b d3,8(a3)				
						
	jbeq _?L1347				
						
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
	jbcs _?L1350				
						
	tst.b 8(a3)				
	jbeq _?L1360				
	jbra _?L1359				
_?L1262:					
						
	move.l a4,d3				
	add.l #134,d3				
	lea _miniflac_vorbis_comment_read_length,a5
_?L1297:					
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1298				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1297				
	jbra _?L1298				
_?L1259:					
						
	move.l 154(a4),d0			
						
	moveq #9,d2				
	cmp.l d0,d2				
	jbcs _?L1471				
						
	moveq #9,d7				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d7				
	jbeq _?L1301				
						
	moveq #8,d1				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d1				
	jbeq _?L1302				
						
	moveq #7,d2				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d2				
	jbeq _?L1303				
						
	moveq #6,d3				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d3				
	jbeq _?L1304				
						
	moveq #5,d7				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d7				
	jbeq _?L1305				
						
	subq.l #4,d0				
	jbeq _?L1310				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_description_length
	lea (12,sp),sp				
						
	moveq #1,d3				
	cmp.l d0,d3				
	jbeq _?L1310				
						
	moveq #2,d7				
	cmp.l d0,d7				
	jbne _?L1213				
						
	tst.b 8(a3)				
	jbeq _?L1360				
	jbra _?L1359				
_?L1266:					
						
	move.l 122(a4),d0			
						
	moveq #7,d7				
	cmp.l d0,d7				
	jbcs _?L1472				
						
	moveq #7,d2				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d2				
	jbeq _?L1274				
						
	moveq #6,d3				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d3				
	jbeq _?L1275				
						
	moveq #5,d7				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d7				
	jbeq _?L1276				
						
	subq.l #4,d0				
	jbeq _?L1280				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbne _?L1279				
_?L1280:					
						
	pea 20.w				
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 20.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,128(a4)			
						
	moveq #5,d3				
	move.l d3,122(a4)			
_?L1276:					
						
	pea 3.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 3.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d7				
	move.l d7,122(a4)			
_?L1275:					
						
	pea 5.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 5.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
	move.b d1,132(a4)			
						
	moveq #7,d0				
	move.l d0,122(a4)			
_?L1274:					
						
	pea 36.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 36.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #8,d1				
	move.l d1,122(a4)			
_?L1273:					
						
	move.b 126(a4),d0			
						
	move.b 8(a3),d7				
						
	cmp.b #16,d0				
	jbeq _?L1270				
	move.b d0,d6				
	addq.b #1,d6				
						
	cmp.b #15,d0				
	jbhi _?L1270				
_?L1288:					
						
	cmp.b #7,d7				
	jbhi _?L1473				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L1285				
						
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
_?L1283:					
						
	move.b d3,8(a3)				
						
	jbeq _?L1367				
						
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
_?L1286:					
	move.l a5,(a3)				
	move.l d1,4(a3)				
						
	move.b d6,126(a4)			
						
	cmp.b #16,d6				
	jbeq _?L1270				
	move.b d6,d0				
	addq.b #1,d0				
	cmp.b #7,d7				
	jbhi _?L1368				
						
	move.l 16(a3),a1			
						
	clr.l d2				
	move.b d3,d2				
	moveq #64,d0				
	sub.l d2,d0				
						
	moveq #32,d1				
	sub.l d2,d1				
	jbmi _?L1289				
	moveq #-1,d2				
	lsr.l d1,d2				
	sub.l a2,a2				
_?L1294:					
						
	move.l 12(a3),d0			
						
	cmp.l a1,d0				
	jbcc _?L1285				
						
	move.l 20(a3),a0			
						
	move.l d0,d7				
	addq.l #1,d7				
	move.l d7,12(a3)			
						
	move.b (a0,d0.l),d7			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
						
	addq.l #1,24(a3)			
						
	move.b d3,8(a3)				
						
	jbeq _?L1292				
						
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
	jbne _?L1294				
						
	tst.b 8(a3)				
	jbeq _?L1360				
	jbra _?L1359				
_?L1248:					
						
	pea 8.w					
	move.l a3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbne _?L1252				
						
	moveq #1,d3				
	move.l d3,96(a4)			
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
	jbra _?L1467				
_?L1243:					
						
	add.l d0,d0				
	moveq #31,d3				
	sub.l d2,d3				
	move.l d0,d1				
	lsl.l d3,d1				
	move.l 4(a3),d0				
	lsr.l d2,d0				
	or.l d1,d0				
	jbra _?L1244				
_?L1463:					
						
	moveq #2,d2				
	move.l d2,(a4)				
						
	move.l 96(a4),d0			
						
	moveq #2,d7				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d7				
	jbne _?L1474				
	jbra _?L1246				
_?L1347:					
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,a5				
	move.l a5,198(a4)			
						
	cmp.l a6,a5				
	jbcs _?L1350				
						
	tst.b 8(a3)				
	jbeq _?L1360				
	jbra _?L1359				
_?L1471:					
						
	moveq #10,d3				
	cmp.l d0,d3				
	jbne _?L1330				
_?L1300:					
						
	move.l 162(a4),d0			
						
	move.l 158(a4),a5			
						
	move.b 8(a3),d7				
						
	cmp.l d0,a5				
	jbeq _?L1270				
	move.l d0,d6				
	addq.l #1,d6				
						
	cmp.l d0,a5				
	jbls _?L1270				
_?L1318:					
						
	cmp.b #7,d7				
	jbhi _?L1475				
						
	move.l 12(a3),d2			
						
	cmp.l 16(a3),d2				
	jbcc _?L1285				
						
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
						
	move.l d0,a6				
	move.l d1,d3				
	or.b (a0,d2.l),d3			
	move.l d3,d2				
						
	addq.l #1,24(a3)			
	move.b d7,d3				
_?L1312:					
						
	move.b d3,8(a3)				
						
	jbeq _?L1369				
						
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
_?L1315:					
	move.l a6,(a3)				
	move.l d1,4(a3)				
						
	move.l d6,162(a4)			
						
	cmp.l a5,d6				
	jbeq _?L1270				
	move.l d6,d0				
	addq.l #1,d0				
	cmp.b #7,d7				
	jbhi _?L1370				
						
	move.l 16(a3),a1			
						
	clr.l d2				
	move.b d3,d2				
	moveq #64,d0				
	sub.l d2,d0				
						
	moveq #32,d1				
	sub.l d2,d1				
	jbmi _?L1319				
	moveq #-1,d2				
	lsr.l d1,d2				
	sub.l a2,a2				
_?L1325:					
						
	move.l 12(a3),d0			
						
	cmp.l d0,a1				
	jbls _?L1285				
						
	move.l 20(a3),a0			
						
	move.l d0,d7				
	addq.l #1,d7				
	move.l d7,12(a3)			
						
	move.b (a0,d0.l),d7			
						
	move.l (a3),d0				
	move.l 4(a3),d1				
						
	addq.l #1,24(a3)			
						
	move.b d3,8(a3)				
						
	jbeq _?L1322				
						
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
						
	cmp.l d6,a5				
	jbhi _?L1325				
						
	tst.b 8(a3)				
	jbeq _?L1360				
	jbra _?L1359				
_?L1322:					
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.l #1,d6				
	move.l d6,162(a4)			
						
	cmp.l d6,a5				
	jbhi _?L1325				
						
	tst.b 8(a3)				
	jbeq _?L1360				
	jbra _?L1359				
_?L1258:					
						
	move.l 104(a4),a6			
						
	move.l 118(a4),d3			
						
	cmp.l d3,a6				
	jbcc _?L1270				
	addq.l #1,a6				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	moveq #-1,d6				
	moveq #-2,d7				
_?L1361:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	move.b 8(a3),d0				
	cmp.b #7,d0				
	jbls _?L1354				
						
	subq.b #8,d0				
	move.b d0,8(a3)				
						
	jbeq _?L1355				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L1356				
	move.l d6,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,(a3)				
	and.l d0,4(a3)				
						
	move.l a6,104(a4)			
						
	move.l a6,d0				
	addq.l #1,d0				
	cmp.l a6,d3				
	jbeq _?L1359				
_?L1358:					
						
	move.l d0,a6				
	jbra _?L1361				
_?L1359:					
						
	pea 5109.w				
	pea _?LC10				
	pea _?LC17				
	pea _?LC12				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
_?L1355:					
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	move.l a6,104(a4)			
						
	move.l a6,d0				
	addq.l #1,d0				
	cmp.l a6,d3				
	jbeq _?L1360				
						
	move.l d0,a6				
	jbra _?L1361				
_?L1356:					
						
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
						
	move.l a6,104(a4)			
						
	move.l a6,d0				
	addq.l #1,d0				
	cmp.l a6,d3				
	jbne _?L1358				
	jbra _?L1359				
_?L1472:					
						
	subq.l #8,d0				
	jbeq _?L1273				
						
	moveq #-1,d0				
	jbra _?L1476				
_?L1292:					
						
	clr.l (a3)				
	clr.l 4(a3)				
						
	addq.b #1,d6				
	move.b d6,126(a4)			
						
	cmp.b #16,d6				
	jbne _?L1294				
						
	tst.b 8(a3)				
	jbeq _?L1360				
	jbra _?L1359				
_?L1240:					
						
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
	jbra _?L1223				
_?L1252:					
						
	moveq #-15,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L1470:					
						
	move.b d6,d3				
	subq.b #8,d3				
						
	move.l (a3),a1				
	move.l 4(a3),d7				
	jbra _?L1339				
_?L1473:					
						
	move.b d7,d3				
	subq.b #8,d3				
						
	move.l (a3),a5				
	move.l 4(a3),d2				
	jbra _?L1283				
_?L1475:					
						
	move.b d7,d3				
	subq.b #8,d3				
						
	move.l (a3),a6				
	move.l 4(a3),d2				
	jbra _?L1312				
_?L1477:					
						
	moveq #5,d2				
	move.l d2,154(a4)			
_?L1305:					
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d7				
	move.l d7,154(a4)			
_?L1304:					
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #7,d0				
	move.l d0,154(a4)			
_?L1303:					
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #8,d1				
	move.l d1,154(a4)			
_?L1302:					
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #9,d2				
	move.l d2,154(a4)			
_?L1301:					
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,158(a4)			
						
	clr.l 162(a4)				
						
	moveq #10,d3				
	move.l d3,154(a4)			
	jbra _?L1300				
_?L1289:					
						
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
	jbra _?L1294				
_?L1319:					
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
	jbra _?L1325				
_?L1344:					
	moveq #-1,d6				
	moveq #31,d2				
	sub.l d0,d2				
	moveq #-2,d1				
	lsl.l d2,d1				
	move.l d6,d2				
	lsr.l d0,d2				
	or.l d1,d2				
	lsr.l d0,d6				
	jbra _?L1350				
_?L1371:					
	clr.l d1				
	jbra _?L1341				
_?L1367:					
	sub.l a5,a5				
	clr.l d1				
	jbra _?L1286				
_?L1369:					
	sub.l a6,a6				
	clr.l d1				
	jbra _?L1315				
_?L1337:					
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,190(a4)			
						
	move.l 198(a4),d0			
						
	move.l 194(a4),a6			
						
	move.b 8(a3),d6				
	move.l d0,a5				
	addq.l #1,a5				
						
	cmp.l a6,d0				
	jbcs _?L1343				
	jbra _?L1270				
_?L1279:					
						
	moveq #2,d2				
	cmp.l d0,d2				
	jbne _?L1213				
						
	tst.b 8(a3)				
	jbeq _?L1360				
	jbra _?L1359				
_?L1365:					
						
	moveq #-18,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L1372:					
						
	move.l d0,a5				
	move.b d3,d6				
	jbra _?L1343				
_?L1370:					
						
	move.l d0,d6				
	move.b d3,d7				
	jbra _?L1318				
_?L1254:					
	jbsr (_miniflac_bitreader_peek?part?0)	
_?L1368:					
						
	move.b d0,d6				
	move.b d3,d7				
	jbra _?L1288				
_?L1310:					
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_read,a6		
_?L1307:					
						
	move.l 162(a4),d3			
						
	cmp.l 158(a4),d3			
	jbcc _?L1477				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1285				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	addq.l #1,d3				
	move.l d3,162(a4)			
	jbra _?L1307				
_?L1354:					
	jbsr (_miniflac_bitreader_discard?part?0)
_?L1465:					
						
	pea 5681.w				
						
	pea _?LC10				
	pea _?LC17				
	pea _?LC12				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
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
_?L1479:					
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1493				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1479				
_?L1480:					
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1493:					
						
	lea _miniflac_sync_internal,a4		
_?L1482:					
						
	tst.l 114(a3)				
	jbeq _?L1494				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1480				
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1482				
_?L1484:					
						
	moveq #-1,d0				
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1494:					
						
	tst.l 122(a3)				
	jbne _?L1484				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1495				
						
	clr.l d0				
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1495:					
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 32(sp)				
	jbeq _?L1485				
						
	move.l 32(sp),a0			
	move.w d1,(a0)				
_?L1485:					
						
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
_?L1497:					
						
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L1511				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1497				
_?L1498:					
						
	move.l 44(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5	
	rts					
_?L1511:					
						
	lea _miniflac_sync_internal,a4		
_?L1500:					
						
	moveq #4,d0				
	cmp.l 114(a3),d0			
	jbeq _?L1512				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1498				
						
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L1500				
_?L1502:					
						
	moveq #-1,d0				
	move.l 44(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5	
	rts					
_?L1512:					
						
	tst.l 134(a3)				
	jbne _?L1502				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1513				
						
	clr.l d0				
						
	move.l 44(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5	
	rts					
_?L1513:					
						
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
	jbeq _?L1503				
						
	move.l 48(sp),a0			
	move.l d0,(a0)				
_?L1503:					
						
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
_?L1515:					
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1529				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1515				
_?L1516:					
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1529:					
						
	lea _miniflac_sync_internal,a4		
_?L1518:					
						
	moveq #6,d1				
	cmp.l 114(a3),d1			
	jbeq _?L1530				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1516				
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1518				
_?L1520:					
						
	moveq #-1,d0				
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1530:					
						
	tst.l 154(a3)				
	jbne _?L1520				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1531				
						
	clr.l d0				
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1531:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 32(sp)				
	jbeq _?L1521				
						
	move.l 32(sp),a0			
	move.l d1,(a0)				
_?L1521:					
						
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
_?L1533:					
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1578				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1533				
_?L1574:					
						
	move.l 20(a3),d2			
_?L1534:					
						
	move.l 44(sp),a0			
	move.l d2,(a0)				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L1578:					
						
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L1536:					
						
	moveq #5,d1				
	cmp.l 114(a3),d1			
	jbeq _?L1579				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1574				
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1536				
_?L1575:					
						
	move.l 20(a3),d2			
	moveq #-1,d0				
	move.l 44(sp),a0			
	move.l d2,(a0)				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L1579:					
						
	tst.l 166(a3)				
	jbne _?L1575				
						
	move.l 170(a3),a1			
						
	cmp.w #128,a1				
	jbcc _?L1540				
	tst.l 48(sp)				
	jbeq _?L1572				
						
	moveq #-1,d4				
	moveq #-2,d5				
_?L1541:					
						
	move.b 16(a3),d3			
						
	cmp.b #7,d3				
	jbhi _?L1580				
						
	move.l 20(a3),d2			
						
	cmp.l 24(a3),d2				
	jbcc _?L1544				
						
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
_?L1551:					
						
	move.b d3,16(a3)			
						
	clr.l d6				
	move.b d3,d6				
						
	jbeq _?L1564				
						
	moveq #64,d7				
	sub.l d6,d7				
						
	moveq #32,d3				
	sub.l d6,d3				
	jbmi _?L1554				
	move.l d4,d2				
	lsr.l d3,d2				
	clr.l d3				
						
	and.l d0,d3				
	and.l d1,d2				
_?L1553:					
	move.l d3,8(a3)				
	move.l d2,12(a3)			
						
	cmp.l 52(sp),a1				
	jbcc _?L1556				
						
	move.w #-32,a0				
	add.l d6,a0				
	tst.l a0				
	jblt _?L1557				
	move.l a0,d1				
	lsr.l d1,d0				
						
	move.l 48(sp),a0			
	move.b d0,(a0,a1.l)			
						
	move.l 170(a3),a1			
	addq.l #1,a1				
	move.l a1,170(a3)			
						
	cmp.w #128,a1				
	jbcs _?L1541				
_?L1540:					
						
	tst.l 56(sp)				
	jbeq _?L1562				
						
	move.l 52(sp),d0			
	cmp.l d0,a1				
	jbcc _?L1563				
	move.l a1,d0				
_?L1563:					
						
	move.l 56(sp),a0			
	move.l d0,(a0)				
_?L1562:					
						
	clr.l 170(a3)				
						
	moveq #1,d0				
	move.l d0,166(a3)			
						
	move.l 20(a3),d2			
	jbra _?L1534				
_?L1544:					
						
	clr.l d0				
						
	move.l 44(sp),a0			
	move.l d2,(a0)				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L1556:					
						
	move.l 170(a3),a1			
	addq.l #1,a1				
	move.l a1,170(a3)			
						
	cmp.w #128,a1				
	jbcs _?L1541				
	jbra _?L1540				
_?L1564:					
	clr.l d3				
	clr.l d2				
	jbra _?L1553				
_?L1554:					
						
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
	jbra _?L1553				
_?L1557:					
						
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
	jbcs _?L1541				
	jbra _?L1540				
_?L1580:					
						
	move.l 8(a3),d0				
	move.l 12(a3),d1			
						
	subq.b #8,d3				
	jbra _?L1551				
_?L1572:					
						
	moveq #-1,d5				
	moveq #-2,d6				
_?L1550:					
						
	move.b 16(a3),d4			
						
	cmp.b #7,d4				
	jbhi _?L1581				
						
	move.l 20(a3),d2			
						
	cmp.l 24(a3),d2				
	jbcc _?L1544				
						
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
_?L1543:					
						
	move.b d4,16(a3)			
						
	jbeq _?L1545				
						
	and.l #255,d4				
						
	moveq #64,d7				
	sub.l d4,d7				
						
	moveq #32,d2				
	sub.l d4,d2				
	jbmi _?L1546				
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
	jbcs _?L1550				
	jbra _?L1540				
_?L1545:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 170(a3),a1			
	addq.l #1,a1				
	move.l a1,170(a3)			
						
	cmp.w #128,a1				
	jbcs _?L1550				
	jbra _?L1540				
_?L1546:					
						
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
	jbcs _?L1550				
	jbra _?L1540				
_?L1581:					
						
	move.l 8(a3),d3				
	move.l 12(a3),d0			
						
	subq.b #8,d4				
	jbra _?L1543				
						
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
_?L1583:					
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1601				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1583				
_?L1584:					
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1601:					
						
	lea _miniflac_sync_internal,a4		
_?L1586:					
						
	moveq #5,d1				
	cmp.l 114(a3),d1			
	jbeq _?L1602				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1584				
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1586				
						
	moveq #-1,d0				
_?L1604:					
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1602:					
						
	move.l 166(a3),d0			
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcs _?L1603				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a3)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1584				
_?L1589:					
						
	tst.l 32(sp)				
	jbeq _?L1591				
						
	moveq #12,d0				
	move.l 32(sp),a0			
	move.l d0,(a0)				
_?L1591:					
						
	moveq #1,d0				
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1603:					
						
	subq.l #7,d0				
	jbeq _?L1589				
						
	moveq #-1,d0				
	jbra _?L1604				
						
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
_?L1606:					
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1621				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1606				
_?L1607:					
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1621:					
						
	lea _miniflac_sync_internal,a4		
_?L1609:					
						
	moveq #3,d1				
	cmp.l 114(a3),d1			
	jbeq _?L1622				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1607				
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1609				
_?L1611:					
						
	moveq #-1,d0				
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1622:					
						
	tst.l 178(a3)				
	jbne _?L1611				
						
	move.l 186(a3),a0			
	cmp.l 182(a3),a0			
	jbeq _?L1613				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1614				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 32(sp)				
	jbeq _?L1612				
						
	move.l 32(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L1612:					
						
	moveq #1,d0				
	move.l d0,178(a3)			
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1614:					
						
	clr.l d0				
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1613:					
						
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
_?L1624:					
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1643				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1624				
_?L1625:					
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1643:					
						
	lea _miniflac_sync_internal,a4		
_?L1627:					
						
	moveq #2,d1				
	cmp.l 114(a3),d1			
	jbeq _?L1644				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1625				
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1627				
_?L1631:					
						
	moveq #-1,d0				
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1644:					
						
	move.l 190(a3),d0			
						
	jbeq _?L1629				
						
	subq.l #1,d0				
	jbne _?L1631				
_?L1630:					
						
	tst.l 32(sp)				
	jbeq _?L1632				
						
	move.l 32(sp),a0			
	move.l 194(a3),(a0)			
_?L1632:					
						
	moveq #1,d0				
						
	move.l 28(sp),a0			
	move.l 20(a3),(a0)			
	movem.l (sp)+,d3/a3/a4			
	rts					
_?L1629:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1633				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,190(a3)			
	jbra _?L1630				
_?L1633:					
						
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
_?L1646:					
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1688				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1646				
_?L1684:					
						
	move.l 20(a3),d2			
_?L1647:					
	move.l 44(sp),a0			
	move.l d2,(a0)				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L1688:					
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L1649:					
						
	moveq #1,d1				
	cmp.l 114(a3),d1			
	jbeq _?L1689				
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1684				
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L1649				
						
	move.l 20(a3),d2			
	moveq #-1,d0				
	move.l 44(sp),a0			
	move.l d2,(a0)				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L1689:					
						
	move.l 206(a3),d3			
						
	move.l 202(a3),a1			
						
	cmp.l a1,d3				
	jbcc _?L1652				
	tst.l 48(sp)				
	jbeq _?L1682				
						
	moveq #-1,d4				
	move.w #-2,a2				
_?L1653:					
						
	move.b 16(a3),d6			
						
	cmp.b #7,d6				
	jbhi _?L1690				
						
	move.l 20(a3),d2			
						
	cmp.l 24(a3),d2				
	jbcc _?L1656				
						
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
_?L1663:					
						
	move.b d6,16(a3)			
						
	clr.l d7				
	move.b d6,d7				
						
	jbeq _?L1677				
						
	moveq #64,d5				
	sub.l d7,d5				
						
	moveq #32,d6				
	sub.l d7,d6				
	jbmi _?L1666				
	move.l d4,d2				
	lsr.l d6,d2				
	clr.l d6				
						
	and.l d0,d6				
	and.l d1,d2				
_?L1665:					
	move.l d6,8(a3)				
	move.l d2,12(a3)			
						
	cmp.l 52(sp),d3				
	jbcc _?L1668				
						
	move.w #-32,a0				
	add.l d7,a0				
	tst.l a0				
	jblt _?L1669				
	move.l a0,d1				
	lsr.l d1,d0				
						
	move.l 48(sp),a0			
	move.b d0,(a0,d3.l)			
						
	move.l 206(a3),d3			
	addq.l #1,d3				
	move.l d3,206(a3)			
						
	move.l 202(a3),a1			
						
	cmp.l d3,a1				
	jbhi _?L1653				
_?L1652:					
						
	tst.l 56(sp)				
	jbeq _?L1685				
						
	move.l 52(sp),d0			
	cmp.l d0,a1				
	jbcs _?L1691				
						
	move.l 56(sp),a0			
	move.l d0,(a0)				
_?L1685:					
						
	move.l 20(a3),d2			
						
	moveq #1,d0				
						
	move.l 44(sp),a0			
	move.l d2,(a0)				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L1656:					
						
	clr.l d0				
						
	move.l 44(sp),a0			
	move.l d2,(a0)				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	rts					
_?L1668:					
						
	move.l 206(a3),d3			
	addq.l #1,d3				
	move.l d3,206(a3)			
						
	cmp.l d3,a1				
	jbhi _?L1653				
	jbra _?L1652				
_?L1677:					
	clr.l d6				
	clr.l d2				
	jbra _?L1665				
_?L1666:					
						
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
	jbra _?L1665				
_?L1669:					
						
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
	jbhi _?L1653				
	jbra _?L1652				
_?L1690:					
						
	move.l 8(a3),d0				
	move.l 12(a3),d1			
						
	subq.b #8,d6				
	jbra _?L1663				
_?L1682:					
						
	moveq #-1,d5				
	moveq #-2,d6				
_?L1662:					
						
	move.b 16(a3),d4			
						
	cmp.b #7,d4				
	jbhi _?L1692				
						
	move.l 20(a3),d2			
						
	cmp.l 24(a3),d2				
	jbcc _?L1656				
						
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
_?L1655:					
						
	move.b d4,16(a3)			
						
	jbeq _?L1657				
						
	and.l #255,d4				
						
	moveq #64,d7				
	sub.l d4,d7				
						
	moveq #32,d2				
	sub.l d4,d2				
	jbmi _?L1658				
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
	jbcs _?L1662				
	jbra _?L1652				
_?L1657:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 206(a3),d0			
	addq.l #1,d0				
	move.l d0,206(a3)			
						
	cmp.l a1,d0				
	jbcs _?L1662				
	jbra _?L1652				
_?L1658:					
						
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
	jbcs _?L1662				
	jbra _?L1652				
_?L1691:					
						
	move.l a1,d0				
						
	move.l 56(sp),a0			
	move.l d0,(a0)				
	jbra _?L1685				
_?L1692:					
						
	move.l 8(a3),d3				
	move.l 12(a3),d0			
						
	subq.b #8,d4				
	jbra _?L1655				
						
	.align	2				
						
_miniflac_picture_read_colordepth:		
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 40(sp),a4			
	move.l 44(sp),a3			
						
	move.l (a4),d0				
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcc _?L1694				
	subq.l #7,d0				
	jbne _?L1724				
_?L1695:					
						
	move.b 8(a3),d3				
						
	cmp.b #31,d3				
	jbhi _?L1709				
						
	move.l 16(a3),a1			
						
	move.l 12(a3),d2			
						
	cmp.l a1,d2				
	jbcc _?L1705				
						
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
	jbhi _?L1709				
	cmp.l a1,a2				
	jbcc _?L1705				
						
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
	jbhi _?L1709				
	cmp.l a1,d7				
	jbcc _?L1705				
						
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
	jbhi _?L1709				
	cmp.l a1,a2				
	jbcc _?L1705				
						
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
_?L1709:					
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 48(sp)				
	jbeq _?L1708				
						
	move.l 48(sp),a0			
	move.l d1,(a0)				
_?L1708:					
						
	moveq #8,d0				
	move.l d0,(a4)				
	moveq #1,d0				
_?L1693:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L1724:					
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L1694:					
						
	moveq #6,d5				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d5				
	jbeq _?L1697				
						
	moveq #5,d1				
	lea _miniflac_bitreader_fill_nocrc,a5	
	cmp.l d0,d1				
	jbne _?L1725				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1726				
_?L1705:					
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	rts					
_?L1726:					
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d4				
	move.l d4,(a4)				
_?L1697:					
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1705				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #7,d5				
	move.l d5,(a4)				
	jbra _?L1695				
_?L1725:					
						
	subq.l #4,d0				
	jbeq _?L1704				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_picture_read_description_length
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1693				
_?L1704:					
						
	move.l 8(a4),d3				
						
	move.l 4(a4),d4				
						
	cmp.l d4,d3				
	jbcc _?L1727				
	addq.l #1,d3				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_read,a6		
_?L1702:					
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1705				
						
	pea 8.w					
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l d3,8(a4)				
						
	move.l d3,d0				
	addq.l #1,d0				
	cmp.l d3,d4				
	jbeq _?L1703				
	move.l d0,d3				
	jbra _?L1702				
_?L1727:					
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L1703:					
						
	moveq #5,d5				
	move.l d5,(a4)				
						
	pea 32.w				
	move.l a3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1705				
	jbra _?L1726				
						
	.align	2				
						
_miniflac_oggfunction_start:			
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
						
	move.l 36(a3),d0			
						
	moveq #12,d1				
	cmp.l d0,d1				
	jbeq _?L1729				
						
	lea (40,a3),a4				
						
	moveq #13,d2				
	cmp.l d0,d2				
	jbcs _?L1730				
	add.l d0,d0				
	move.w _?L1732(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1732:					
	.dc.w _?L1780-_?L1732			
	.dc.w _?L1781-_?L1732			
	.dc.w _?L1782-_?L1732			
	.dc.w _?L1783-_?L1732			
	.dc.w _?L1784-_?L1732			
	.dc.w _?L1785-_?L1732			
	.dc.w _?L1786-_?L1732			
	.dc.w _?L1787-_?L1732			
	.dc.w _?L1788-_?L1732			
	.dc.w _?L1789-_?L1732			
	.dc.w _?L1790-_?L1732			
	.dc.w _?L1733-_?L1732			
	.dc.w _?L1730-_?L1732			
	.dc.w _?L1731-_?L1732			
_?L1733:					
						
	move.b 86(a3),d3			
						
	move.b 87(a3),d6			
_?L1746:					
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	cmp.b d6,d3				
	jbls _?L1773				
						
	move.w #-2,a6				
_?L1763:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1756				
						
	move.b 48(a3),d0			
	cmp.b #7,d0				
	jbls _?L1798				
						
	subq.b #8,d0				
	move.b d0,48(a3)			
						
	move.l 40(a3),d7			
	move.l 44(a3),d5			
						
	clr.l d2				
	move.b d0,d2				
						
	move.w #-32,a0				
	add.l d2,a0				
	tst.l a0				
	jblt _?L1767				
	move.l d7,d1				
	move.l a0,d4				
	lsr.l d4,d1				
_?L1768:					
						
	moveq #0,d4				
	not.b d4				
	and.l d4,d1				
						
	tst.b d0				
	jbeq _?L1769				
						
	move.w #64,a2				
	sub.l d2,a2				
						
	move.w #32,a0				
	sub.l d2,a0				
	tst.l a0				
	jblt _?L1770				
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
	jbne _?L1763				
_?L1773:					
						
	clr.w 90(a3)				
						
	moveq #12,d2				
	move.l d2,36(a3)			
						
	tst.b 468(a3)				
	jbne _?L1799				
						
	btst #1,69(a3)				
	jbne _?L1800				
_?L1774:					
						
	clr.l d1				
	clr.w d0				
_?L1776:					
						
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
	jbcc _?L1777				
_?L1802:					
						
	and.l #65535,d0				
						
	sub.l d0,d2				
	move.l 68(sp),a0			
	move.l d2,(a0)				
_?L1777:					
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L1800:					
						
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
	jbra _?L1776				
_?L1730:					
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L1799:					
						
	move.l 464(a3),a0			
	cmp.l 78(a3),a0				
	jbeq _?L1774				
						
	moveq #13,d0				
	move.l d0,36(a3)			
_?L1731:					
						
	move.w 90(a3),d6			
						
	move.w 88(a3),d3			
						
	cmp.w d3,d6				
	jbcc _?L1801				
	addq.w #1,d6				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	moveq #-1,d4				
	moveq #-2,d5				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1756				
_?L1748:					
						
	move.b 48(a3),d0			
	cmp.b #7,d0				
	jbls _?L1759				
						
	subq.b #8,d0				
	move.b d0,48(a3)			
						
	jbeq _?L1750				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L1751				
	move.l d4,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,40(a3)				
	and.l d0,44(a3)				
						
	move.w d6,90(a3)			
						
	move.w d6,d0				
	addq.w #1,d0				
	cmp.w d3,d6				
	jbeq _?L1754				
_?L1753:					
						
	move.w d0,d6				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1748				
_?L1756:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L1769:					
						
	clr.l 40(a3)				
	clr.l 44(a3)				
						
	add.w d1,88(a3)				
						
	addq.b #1,d6				
	move.b d6,87(a3)			
						
	cmp.b d6,d3				
	jbne _?L1763				
	jbra _?L1773				
_?L1767:					
						
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
	jbra _?L1768				
_?L1750:					
						
	clr.l 40(a3)				
	clr.l 44(a3)				
						
	move.w d6,90(a3)			
						
	move.w d6,d0				
	addq.w #1,d0				
	cmp.w d3,d6				
	jbne _?L1753				
_?L1754:					
						
	clr.l 36(a3)				
_?L1744:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1756				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #79,d1				
	jbne _?L1730				
						
	moveq #1,d4				
	move.l d4,36(a3)			
_?L1743:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1756				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #103,d1				
	jbne _?L1730				
						
	moveq #2,d0				
	move.l d0,36(a3)			
_?L1742:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1756				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #103,d1				
	jbne _?L1730				
						
	moveq #3,d1				
	move.l d1,36(a3)			
_?L1741:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1756				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #83,d1				
	jbne _?L1730				
						
	moveq #4,d2				
	move.l d2,36(a3)			
_?L1740:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1756				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,68(a3)			
						
	jbne _?L1730				
						
	moveq #5,d4				
	move.l d4,36(a3)			
_?L1739:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1756				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,69(a3)			
						
	moveq #6,d0				
	move.l d0,36(a3)			
_?L1738:					
						
	pea 64.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1756				
						
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
_?L1737:					
						
	pea 32.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1756				
						
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
_?L1736:					
						
	pea 32.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1756				
						
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
_?L1735:					
						
	pea 32.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1756				
						
	move.b 48(a3),d0			
	cmp.b #31,d0				
	jbls _?L1759				
						
	add.b #-32,d0				
	move.b d0,48(a3)			
						
	jbeq _?L1778				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L1761				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,40(a3)				
	and.l d0,44(a3)				
						
	moveq #10,d0				
	move.l d0,36(a3)			
_?L1734:					
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1756				
						
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
	jbra _?L1746				
_?L1770:					
						
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
	jbne _?L1763				
	jbra _?L1773				
_?L1751:					
						
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
	jbne _?L1753				
	jbra _?L1754				
_?L1778:					
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,40(a3)				
	and.l d0,44(a3)				
						
	moveq #10,d0				
	move.l d0,36(a3)			
	jbra _?L1734				
_?L1761:					
						
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
	jbra _?L1734				
_?L1784:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1740				
_?L1785:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1739				
_?L1786:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1738				
_?L1787:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1737				
_?L1788:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1736				
_?L1789:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1735				
_?L1790:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1734				
_?L1782:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1742				
_?L1780:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1744				
_?L1781:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1743				
_?L1783:					
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbra _?L1741				
_?L1729:					
						
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
	jbcc _?L1777				
	jbra _?L1802				
_?L1801:					
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	clr.l 36(a3)				
	jbra _?L1744				
_?L1798:					
	jbsr (_miniflac_bitreader_read?part?0)	
_?L1759:					
	jbsr (_miniflac_bitreader_discard?part?0)
						
	.align	2				
	.globl	_mflac_size			
						
_mflac_size:					
						
	move.l #16870,d0			
	rts					
						
	.align	2				
	.globl	_mflac_init			
						
_mflac_init:					
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
						
	move.l 16(sp),470(a3)			
						
	move.l 20(sp),474(a3)			
						
	clr.l 478(a3)				
						
	clr.l 482(a3)				
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_mflac_is_frame			
						
_mflac_is_frame:				
						
	move.l 4(sp),a0				
	moveq #5,d1				
	cmp.l (a0),d1				
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_mflac_is_metadata		
						
_mflac_is_metadata:				
						
	move.l 4(sp),a0				
	moveq #4,d1				
	cmp.l (a0),d1				
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_mflac_metadata_is_last		
						
_mflac_metadata_is_last:			
						
	move.l 4(sp),a0				
	move.b 112(a0),d0			
	rts					
						
	.align	2				
	.globl	_mflac_metadata_type		
						
_mflac_metadata_type:				
						
	move.l 4(sp),a0				
	move.l 114(a0),d0			
	rts					
						
	.align	2				
	.globl	_mflac_metadata_length		
						
_mflac_metadata_length:				
						
	move.l 4(sp),a0				
	move.l 118(a0),d0			
	rts					
						
	.align	2				
	.globl	_mflac_metadata_is_streaminfo	
						
_mflac_metadata_is_streaminfo:			
						
	move.l 4(sp),a0				
	tst.l 114(a0)				
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_mflac_metadata_is_padding	
						
_mflac_metadata_is_padding:			
						
	move.l 4(sp),a0				
	moveq #1,d1				
	cmp.l 114(a0),d1			
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_mflac_metadata_is_application	
						
_mflac_metadata_is_application:			
						
	move.l 4(sp),a0				
	moveq #2,d1				
	cmp.l 114(a0),d1			
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_mflac_metadata_is_seektable	
						
_mflac_metadata_is_seektable:			
						
	move.l 4(sp),a0				
	moveq #3,d1				
	cmp.l 114(a0),d1			
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_mflac_metadata_is_vorbis_comment
						
_mflac_metadata_is_vorbis_comment:		
						
	move.l 4(sp),a0				
	moveq #4,d1				
	cmp.l 114(a0),d1			
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_mflac_metadata_is_cuesheet	
						
_mflac_metadata_is_cuesheet:			
						
	move.l 4(sp),a0				
	moveq #5,d1				
	cmp.l 114(a0),d1			
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_mflac_metadata_is_picture	
						
_mflac_metadata_is_picture:			
						
	move.l 4(sp),a0				
	moveq #6,d1				
	cmp.l 114(a0),d1			
	seq d0					
						
	neg.b d0				
	rts					
						
	.align	2				
	.globl	_mflac_frame_blocking_strategy	
						
_mflac_frame_blocking_strategy:			
						
	move.l 4(sp),a0				
	move.b 225(a0),d0			
	rts					
						
	.align	2				
	.globl	_mflac_frame_block_size		
						
_mflac_frame_block_size:			
						
	move.l 4(sp),a0				
	move.w 226(a0),d0			
	rts					
						
	.align	2				
	.globl	_mflac_frame_sample_rate	
						
_mflac_frame_sample_rate:			
						
	move.l 4(sp),a0				
	move.l 228(a0),d0			
	rts					
						
	.align	2				
	.globl	_mflac_frame_channels		
						
_mflac_frame_channels:				
						
	move.l 4(sp),a0				
	move.b 236(a0),d0			
	rts					
						
	.align	2				
	.globl	_mflac_frame_bps		
						
_mflac_frame_bps:				
						
	move.l 4(sp),a0				
	move.b 237(a0),d0			
	rts					
						
	.align	2				
	.globl	_mflac_frame_sample_number	
						
_mflac_frame_sample_number:			
						
	move.l 4(sp),a0				
	move.l 238(a0),d0			
	move.l 242(a0),d1			
	rts					
						
	.align	2				
	.globl	_mflac_frame_frame_number	
						
_mflac_frame_frame_number:			
						
	move.l 4(sp),a0				
	move.l 238(a0),d0			
	rts					
						
	.align	2				
	.globl	_mflac_version_major		
						
_mflac_version_major:				
	moveq #1,d0				
	rts					
						
	.align	2				
	.globl	_mflac_version_minor		
						
_mflac_version_minor:				
	moveq #1,d0				
	rts					
						
	.align	2				
	.globl	_mflac_version_patch		
						
_mflac_version_patch:				
	moveq #1,d0				
	rts					
						
	.data					
_?LC18:						
	.dc.b $31,$2e,$31,$2e,$31
	.dc.b $00				
	.text					
	.align	2				
	.globl	_mflac_version_string		
						
_mflac_version_string:				
	move.l #_?LC18,d0			
	rts					
						
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
						
	.align	2				
	.globl	_miniflac_version_string	
						
_miniflac_version_string:			
						
	move.l #_?LC18,d0			
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
						
	jbne _?L1866				
						
	tst.l d4				
	jbeq _?L1879				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1883				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1883:					
						
	move.l 4(a6),d0				
_?L1866:					
						
	subq.l #1,d0				
	jbeq _?L1884				
						
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
_?L1878:					
						
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1872				
						
	move.l 40(sp),28(a6)			
						
	move.l 44(sp),24(a6)			
						
	clr.l 20(a6)				
_?L1873:					
						
	moveq #5,d0				
	cmp.l (a6),d0				
	jbeq _?L1885				
						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1873				
_?L1874:					
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
						
	move.l 36(sp),d0			
						
	move.l 52(a6),d1			
						
	tst.l d0				
	jbne _?L1877				
	cmp.l d4,d1				
	jbcs _?L1878				
_?L1877:					
						
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L1887:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1884:					
						
	move.l a4,28(a6)			
						
	move.l d4,24(a6)			
						
	clr.l 20(a6)				
						
	move.l a6,d3				
	addq.l #8,d3				
						
	lea _miniflac_sync_internal,a3		
_?L1869:					
						
	moveq #5,d0				
	cmp.l (a6),d0				
	jbeq _?L1886				
						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1869				
_?L1870:					
						
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
_?L1888:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1885:					
						
	move.l 68(sp),-(sp)			
	pea 122(a6)				
	move.l d3,-(sp)				
	move.l d7,-(sp)				
	jbsr _miniflac_frame_decode		
	lea (16,sp),sp				
	jbra _?L1874				
_?L1879:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L1872:					
						
	move.l 52(a6),d1			
						
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L1887				
_?L1886:					
						
	move.l 68(sp),-(sp)			
	pea 122(a6)				
	move.l d3,-(sp)				
	pea 210(a6)				
	jbsr _miniflac_frame_decode		
	lea (16,sp),sp				
						
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1888				
						
	.align	2				
	.globl	_mflac_decode			
						
_mflac_decode:					
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_decode,a4			
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L1900				
_?L1892:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L1889				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L1892				
_?L1900:					
						
	tst.l d0				
	jble _?L1889				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L1889:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_sync			
						
_miniflac_sync:					
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a3			
	move.l 56(sp),d3			
						
	move.l 4(a3),d0				
						
	jbne _?L1902				
						
	tst.l d3				
	jbeq _?L1910				
	subq.l #4,sp				
	move.l 56(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbeq _?L1917				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1917:					
						
	move.l 4(a3),d0				
_?L1902:					
						
	subq.l #1,d0				
	jbeq _?L1918				
						
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
_?L1909:					
						
	move.l d5,-(sp)				
	move.l d4,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbne _?L1905				
						
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
	jbeq _?L1919				
						
	tst.l d6				
	jbne _?L1905				
						
	move.l 52(a3),d1			
						
	cmp.l d3,d1				
	jbcs _?L1909				
_?L1921:					
	clr.l d6				
						
	move.l 60(sp),a0			
	move.l d1,(a0)				
_?L1920:					
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1918:					
						
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
_?L1905:					
						
	move.l 52(a3),d1			
						
	move.l 60(sp),a0			
	move.l d1,(a0)				
	jbra _?L1920				
_?L1919:					
						
	moveq #13,d0				
	move.l d0,36(a3)			
						
	move.l 52(a3),d1			
						
	cmp.l d3,d1				
	jbcs _?L1909				
	jbra _?L1921				
_?L1910:					
						
	clr.l d6				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
						
	.align	2				
	.globl	_mflac_sync			
						
_mflac_sync:					
	subq.l #4,sp				
	movem.l d3/a3/a4,-(sp)			
	move.l 20(sp),a3			
						
	clr.l 12(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	lea _miniflac_sync,a4			
	move.l a3,d3				
	add.l #486,d3				
	pea 12(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
	tst.l d0				
	jbne _?L1933				
_?L1925:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d3,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L1922				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	pea 12(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
	tst.l d0				
	jbeq _?L1925				
_?L1933:					
						
	tst.l d0				
	jble _?L1922				
						
	move.l 12(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L1922:					
						
	movem.l (sp)+,d3/a3/a4			
	addq.l #4,sp				
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
	jbne _?L1973				
						
	tst.l d3				
	jbeq _?L1980				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbeq _?L1984				
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L1984:					
	move.l 4(a3),d0				
_?L1973:					
						
	subq.l #1,d0				
	jbeq _?L1985				
						
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
_?L1979:					
	move.l d5,-(sp)				
	move.l d7,-(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d6				
	moveq #1,d0				
	cmp.l d6,d0				
	jbne _?L1976				
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
	jbne _?L1978				
	cmp.l d3,d1				
	jbcs _?L1979				
_?L1978:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L1986:					
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L1985:					
	move.l d4,72(sp)			
	move.l 36(sp),68(sp)			
	move.l d3,64(sp)			
	move.l a4,60(sp)			
	move.l a3,56(sp)			
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	jbra _miniflac_streaminfo_min_block_size_native
_?L1980:					
						
	clr.l d6				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L1976:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L1986				
						
	.align	2				
	.globl	_mflac_streaminfo_min_block_size
						
_mflac_streaminfo_min_block_size:		
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_streaminfo_min_block_size,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L1998				
_?L1990:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L1987				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L1990				
_?L1998:					
						
	tst.l d0				
	jble _?L1987				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L1987:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_max_block_size
						
_miniflac_streaminfo_max_block_size:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L2000				
						
	tst.l 60(sp)				
	jbeq _?L2030				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2050				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2050:					
	move.l 4(a4),d0				
_?L2000:					
						
	subq.l #1,d0				
	jbeq _?L2051				
						
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
_?L2029:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2014				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L2015:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2018				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2015				
_?L2016:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2052				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2029				
_?L2056:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L2054:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2018:					
	tst.l 114(a4)				
	jbeq _?L2053				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2016				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2018				
_?L2019:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2054				
_?L2051:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2003:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2055				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2003				
_?L2004:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L2058:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2053:					
						
	move.l 122(a4),d0			
						
	jbeq _?L2021				
	subq.l #1,d0				
	jbne _?L2019				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2026				
_?L2047:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2029				
	jbra _?L2056				
_?L2026:					
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L2027				
						
	move.l 68(sp),a0			
	move.w d1,(a0)				
_?L2027:					
						
	moveq #2,d0				
	move.l d0,122(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2054				
_?L2030:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2014:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2054				
_?L2055:					
	lea _miniflac_sync_internal,a3		
_?L2006:					
	tst.l 114(a4)				
	jbeq _?L2057				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2004				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2006				
_?L2010:					
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2058				
_?L2021:					
						
	pea 16.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2047				
						
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
	jbne _?L2047				
	jbra _?L2026				
_?L2057:					
						
	move.l 122(a4),d0			
						
	jbeq _?L2008				
	subq.l #1,d0				
	jbne _?L2010				
	lea _miniflac_bitreader_fill_nocrc,a1	
_?L2009:					
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2012				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L2013				
						
	move.l 68(sp),a0			
	move.w d1,(a0)				
_?L2013:					
						
	moveq #2,d0				
	move.l d0,122(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2058				
_?L2012:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2058				
_?L2008:					
						
	pea 16.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2012				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
	jbra _?L2009				
_?L2052:					
						
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2054				
						
	.align	2				
	.globl	_mflac_streaminfo_max_block_size
						
_mflac_streaminfo_max_block_size:		
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_streaminfo_max_block_size,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L2070				
_?L2062:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L2059				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L2062				
_?L2070:					
						
	tst.l d0				
	jble _?L2059				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L2059:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_min_frame_size
						
_miniflac_streaminfo_min_frame_size:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L2072				
						
	tst.l 60(sp)				
	jbeq _?L2105				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2132				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2132:					
	move.l 4(a4),d0				
_?L2072:					
						
	subq.l #1,d0				
	jbeq _?L2133				
						
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
_?L2104:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2087				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L2088:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2091				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2088				
_?L2089:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2134				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2104				
_?L2139:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L2136:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2091:					
	tst.l 114(a4)				
	jbeq _?L2135				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2089				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2091				
_?L2092:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2136				
_?L2133:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2075:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2137				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2075				
_?L2076:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L2141:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2135:					
						
	move.l 122(a4),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L2138				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a1	
	jbeq _?L2097				
						
	pea 16.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2098				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
_?L2097:					
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2098				
						
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
	jbeq _?L2101				
_?L2098:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2104				
	jbra _?L2139				
_?L2138:					
						
	subq.l #2,d0				
	jbne _?L2092				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2098				
_?L2101:					
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L2102				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L2102:					
						
	moveq #3,d0				
	move.l d0,122(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2136				
_?L2105:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2087:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2136				
_?L2137:					
	lea _miniflac_sync_internal,a3		
_?L2078:					
	tst.l 114(a4)				
	jbeq _?L2140				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2076				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2078				
	moveq #-1,d4				
_?L2143:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2141				
_?L2140:					
						
	move.l 122(a4),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L2142				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a1	
	jbeq _?L2083				
						
	pea 16.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2085				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
_?L2083:					
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2085				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,122(a4)			
	move.l 36(sp),a1			
_?L2081:					
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2085				
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L2086				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L2086:					
						
	moveq #3,d0				
	move.l d0,122(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2141				
_?L2142:					
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	subq.l #2,d0				
	jbeq _?L2081				
						
	moveq #-1,d4				
	jbra _?L2143				
_?L2085:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2141				
_?L2134:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2136				
						
	.align	2				
	.globl	_mflac_streaminfo_min_frame_size
						
_mflac_streaminfo_min_frame_size:		
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_streaminfo_min_frame_size,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L2155				
_?L2147:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L2144				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L2147				
_?L2155:					
						
	tst.l d0				
	jble _?L2144				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L2144:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_max_frame_size
						
_miniflac_streaminfo_max_frame_size:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L2157				
						
	tst.l 60(sp)				
	jbeq _?L2185				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2205				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2205:					
	move.l 4(a4),d0				
_?L2157:					
						
	subq.l #1,d0				
	jbeq _?L2206				
						
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
_?L2184:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2165				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L2166:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2169				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2166				
_?L2167:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2207				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2184				
_?L2213:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L2209:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2169:					
	tst.l 114(a4)				
	jbeq _?L2208				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2167				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2169				
_?L2170:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2209				
_?L2206:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2160:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2210				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2160				
_?L2161:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L2215:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2208:					
						
	move.l 122(a4),d0			
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbcs _?L2211				
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbne _?L2212				
_?L2175:					
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2177				
						
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
	jbeq _?L2181				
_?L2177:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2184				
	jbra _?L2213				
_?L2211:					
						
	subq.l #3,d0				
	jbne _?L2170				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2177				
_?L2181:					
						
	pea 24.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L2182				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L2182:					
						
	moveq #4,d0				
	move.l d0,122(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2209				
_?L2185:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2212:					
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a1	
	jbeq _?L2176				
						
	pea 16.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2177				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
_?L2176:					
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2177				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,122(a4)			
	move.l 36(sp),a1			
	jbra _?L2175				
_?L2165:					
						
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2209				
_?L2210:					
	lea _miniflac_sync_internal,a3		
_?L2163:					
	tst.l 114(a4)				
	jbeq _?L2214				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2161				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2163				
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2215				
_?L2214:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2215				
_?L2207:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2209				
						
	.align	2				
	.globl	_mflac_streaminfo_max_frame_size
						
_mflac_streaminfo_max_frame_size:		
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_streaminfo_max_frame_size,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L2227				
_?L2219:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L2216				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L2219				
_?L2227:					
						
	tst.l d0				
	jble _?L2216				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L2216:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_sample_rate
						
_miniflac_streaminfo_sample_rate:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L2229				
						
	tst.l 60(sp)				
	jbeq _?L2263				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2293				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2293:					
	move.l 4(a4),d0				
_?L2229:					
						
	subq.l #1,d0				
	jbeq _?L2294				
						
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
_?L2262:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2241				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L2242:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2245				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2242				
_?L2243:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2295				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2262				
_?L2301:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L2297:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2245:					
	tst.l 114(a4)				
	jbeq _?L2296				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2243				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2245				
_?L2246:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2297				
_?L2294:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2232:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2298				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2232				
_?L2233:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L2303:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2296:					
						
	move.l 122(a4),d0			
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbcs _?L2299				
						
	moveq #3,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbne _?L2300				
_?L2251:					
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2255				
						
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
	jbeq _?L2259				
_?L2255:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2262				
	jbra _?L2301				
_?L2299:					
						
	subq.l #4,d0				
	jbne _?L2246				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 20.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2255				
_?L2259:					
						
	pea 20.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,128(a4)			
						
	tst.l 68(sp)				
	jbeq _?L2260				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L2260:					
						
	moveq #5,d0				
	move.l d0,122(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2297				
_?L2263:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2300:					
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbeq _?L2252				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a1	
	jbeq _?L2253				
						
	pea 16.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2255				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
_?L2253:					
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2255				
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,122(a4)			
	move.l 36(sp),a1			
_?L2252:					
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2255				
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #3,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
	jbra _?L2251				
_?L2241:					
						
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2297				
_?L2298:					
	lea _miniflac_sync_internal,a3		
_?L2235:					
	tst.l 114(a4)				
	jbeq _?L2302				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2233				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2235				
	moveq #-1,d4				
_?L2305:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2303				
_?L2302:					
						
	move.l 122(a4),d0			
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbcs _?L2304				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2233				
_?L2238:					
						
	pea 20.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2264				
						
	pea 20.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,128(a4)			
						
	tst.l 68(sp)				
	jbeq _?L2240				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L2240:					
						
	moveq #5,d0				
	move.l d0,122(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2303				
_?L2304:					
						
	subq.l #4,d0				
	jbeq _?L2238				
						
	moveq #-1,d4				
	jbra _?L2305				
_?L2264:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2303				
_?L2295:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2297				
						
	.align	2				
	.globl	_mflac_streaminfo_sample_rate	
						
_mflac_streaminfo_sample_rate:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_streaminfo_sample_rate,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L2317				
_?L2309:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L2306				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L2309				
_?L2317:					
						
	tst.l d0				
	jble _?L2306				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L2306:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_channels	
						
_miniflac_streaminfo_channels:			
	lea (-36,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 76(sp),a4			
	move.l 80(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L2319				
						
	tst.l 84(sp)				
	jbeq _?L2355				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2382				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (36,sp),sp				
	rts					
_?L2382:					
	move.l 4(a4),d0				
_?L2319:					
						
	subq.l #1,d0				
	jbeq _?L2383				
						
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
_?L2354:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2327				
	move.l 64(sp),28(a4)			
	move.l 68(sp),24(a4)			
	clr.l 20(a4)				
_?L2328:					
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L2331				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2328				
_?L2329:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,54(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 46(sp),d0			
	jbne _?L2384				
	move.l 52(a4),d1			
	cmp.l 84(sp),d1				
	jbcs _?L2354				
_?L2390:					
	clr.l d4				
	move.l 88(sp),a0			
	move.l d1,(a0)				
_?L2386:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (36,sp),sp				
	rts					
_?L2331:					
	tst.l 114(a4)				
	jbeq _?L2385				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2329				
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L2331				
_?L2332:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 88(sp),a0			
	move.l d1,(a0)				
	jbra _?L2386				
_?L2383:					
	move.l d5,28(a4)			
	move.l 84(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2322:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2387				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L2322				
_?L2323:					
	move.l 88(sp),a0			
	move.l 20(a4),(a0)			
_?L2392:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (36,sp),sp				
	rts					
_?L2385:					
						
	move.l 122(a4),d0			
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbcs _?L2388				
						
	moveq #4,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbne _?L2389				
_?L2337:					
						
	pea 20.w				
	move.l d3,-(sp)				
	move.l a1,54(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 46(sp),a1			
	tst.l d0				
	jbne _?L2348				
						
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
	jbeq _?L2351				
_?L2348:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 84(sp),d1				
	jbcs _?L2354				
	jbra _?L2390				
_?L2388:					
						
	subq.l #5,d0				
	jbne _?L2332				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 3.w					
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2348				
_?L2351:					
						
	pea 3.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 92(sp)				
	jbeq _?L2352				
						
	addq.b #1,d1				
	move.l 92(sp),a0			
	move.b d1,(a0)				
_?L2352:					
						
	moveq #6,d0				
	move.l d0,122(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 88(sp),a0			
	move.l d1,(a0)				
	jbra _?L2386				
_?L2355:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (36,sp),sp				
	rts					
_?L2389:					
						
	moveq #3,d2				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d2				
	jbeq _?L2338				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbeq _?L2339				
						
	subq.l #1,d0				
	jbeq _?L2340				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2348				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,122(a4)			
_?L2340:					
						
	move.b 16(a4),59(sp)			
						
	cmp.b #15,59(sp)			
	jbhi _?L2345				
						
	move.l 24(a4),a0			
						
	move.l 20(a4),d2			
						
	cmp.l d2,a0				
	jbls _?L2357				
						
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
	jbhi _?L2345				
	cmp.l a1,a0				
	jbls _?L2343				
						
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
_?L2345:					
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,122(a4)			
_?L2339:					
						
	pea 24.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,54(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 46(sp),a1			
	tst.l d0				
	jbne _?L2348				
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,54(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #3,d2				
	move.l d2,122(a4)			
	move.l 46(sp),a1			
_?L2338:					
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,54(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 46(sp),a1			
	tst.l d0				
	jbne _?L2348				
						
	pea 24.w				
	move.l d3,-(sp)				
	move.l a1,54(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #4,d0				
	move.l d0,122(a4)			
	move.l 46(sp),a1			
	jbra _?L2337				
_?L2327:					
						
	move.l 52(a4),d1			
	move.l 88(sp),a0			
	move.l d1,(a0)				
	jbra _?L2386				
_?L2387:					
	lea _miniflac_sync_internal,a3		
_?L2325:					
	tst.l 114(a4)				
	jbeq _?L2391				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2323				
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L2325				
	moveq #-1,d4				
	move.l 88(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2392				
_?L2391:					
	move.l 92(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_channels	
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 88(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2392				
_?L2357:					
						
	move.l d2,a1				
_?L2343:					
						
	move.l a1,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 84(sp),d1				
	jbcs _?L2354				
	jbra _?L2390				
_?L2384:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 88(sp),a0			
	move.l d1,(a0)				
	jbra _?L2386				
						
	.align	2				
	.globl	_mflac_streaminfo_channels	
						
_mflac_streaminfo_channels:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_streaminfo_channels,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L2404				
_?L2396:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L2393				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L2396				
_?L2404:					
						
	tst.l d0				
	jble _?L2393				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L2393:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_bps	
						
_miniflac_streaminfo_bps:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L2406				
						
	tst.l 60(sp)				
	jbeq _?L2439				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2466				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2466:					
	move.l 4(a4),d0				
_?L2406:					
						
	subq.l #1,d0				
	jbeq _?L2467				
						
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
_?L2438:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2418				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L2419:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2422				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2419				
_?L2420:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2468				
_?L2434:					
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2438				
_?L2474:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L2470:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2422:					
	tst.l 114(a4)				
	jbeq _?L2469				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2420				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2422				
_?L2423:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2470				
_?L2467:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2409:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2471				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2409				
_?L2410:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L2476:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2469:					
						
	move.l 122(a4),d0			
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2472				
						
	moveq #5,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbne _?L2473				
_?L2428:					
						
	pea 3.w					
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2430				
						
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
	jbeq _?L2435				
_?L2430:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2438				
	jbra _?L2474				
_?L2472:					
						
	subq.l #6,d0				
	jbne _?L2423				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2430				
_?L2435:					
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
						
	move.b d1,132(a4)			
						
	tst.l 68(sp)				
	jbeq _?L2436				
						
	move.l 68(sp),a0			
	move.b d1,(a0)				
_?L2436:					
						
	moveq #7,d0				
	move.l d0,122(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2470				
_?L2439:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2473:					
						
	subq.l #4,d0				
	jbne _?L2429				
_?L2432:					
						
	pea 20.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2430				
						
	pea 20.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,128(a4)			
						
	moveq #5,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
	jbra _?L2428				
_?L2418:					
						
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2470				
_?L2471:					
	lea _miniflac_sync_internal,a3		
_?L2412:					
	tst.l 114(a4)				
	jbeq _?L2475				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2410				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2412				
	moveq #-1,d4				
_?L2478:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2476				
_?L2429:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2432				
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbeq _?L2434				
	jbra _?L2468				
_?L2475:					
						
	move.l 122(a4),d0			
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2477				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_channels	
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2410				
_?L2415:					
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2440				
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
						
	move.b d1,132(a4)			
						
	tst.l 68(sp)				
	jbeq _?L2417				
						
	move.l 68(sp),a0			
	move.b d1,(a0)				
_?L2417:					
						
	moveq #7,d0				
	move.l d0,122(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2476				
_?L2477:					
						
	subq.l #6,d0				
	jbeq _?L2415				
						
	moveq #-1,d4				
	jbra _?L2478				
_?L2440:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2476				
_?L2468:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2470				
						
	.align	2				
	.globl	_mflac_streaminfo_bps		
						
_mflac_streaminfo_bps:				
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_streaminfo_bps,a4		
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L2490				
_?L2482:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L2479				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L2482				
_?L2490:					
						
	tst.l d0				
	jble _?L2479				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L2479:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_total_samples
						
_miniflac_streaminfo_total_samples:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L2492				
						
	tst.l 60(sp)				
	jbeq _?L2523				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2544				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2544:					
	move.l 4(a4),d0				
_?L2492:					
						
	subq.l #1,d0				
	jbeq _?L2545				
						
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
_?L2522:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2500				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L2501:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2504				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2501				
_?L2502:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2546				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2522				
_?L2552:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L2548:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2504:					
	tst.l 114(a4)				
	jbeq _?L2547				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2502				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2504				
_?L2505:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2548				
_?L2545:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2495:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2549				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2495				
_?L2496:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L2554:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2547:					
						
	move.l 122(a4),d0			
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcs _?L2550				
						
	moveq #6,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbne _?L2551				
_?L2510:					
						
	pea 5.w					
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2513				
						
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
	jbeq _?L2519				
_?L2513:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L2522				
	jbra _?L2552				
_?L2550:					
						
	subq.l #7,d0				
	jbne _?L2505				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 36.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2513				
_?L2519:					
						
	pea 36.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L2520				
						
	move.l 68(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L2520:					
						
	moveq #8,d0				
	move.l d0,122(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2548				
_?L2523:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L2551:					
						
	moveq #5,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbeq _?L2511				
						
	subq.l #4,d0				
	jbeq _?L2515				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2502				
_?L2515:					
						
	pea 20.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2513				
						
	pea 20.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,128(a4)			
						
	moveq #5,d0				
	move.l d0,122(a4)			
	move.l 36(sp),a1			
_?L2511:					
						
	pea 3.w					
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L2513				
						
	pea 3.w					
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d1				
	move.l d1,122(a4)			
	move.l 36(sp),a1			
	jbra _?L2510				
_?L2500:					
						
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2548				
_?L2549:					
	lea _miniflac_sync_internal,a3		
_?L2498:					
	tst.l 114(a4)				
	jbeq _?L2553				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2496				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2498				
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2554				
_?L2553:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_total_samples
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2554				
_?L2546:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L2548				
						
	.align	2				
	.globl	_mflac_streaminfo_total_samples	
						
_mflac_streaminfo_total_samples:		
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_streaminfo_total_samples,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L2566				
_?L2558:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L2555				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L2558				
_?L2566:					
						
	tst.l d0				
	jble _?L2555				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L2555:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_md5_length	
						
_miniflac_streaminfo_md5_length:		
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a4			
	move.l 60(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L2568				
						
	tst.l 64(sp)				
	jbeq _?L2602				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2622				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2622:					
	move.l 4(a4),d0				
_?L2568:					
						
	subq.l #1,d0				
	jbeq _?L2623				
						
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
_?L2601:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2580				
	move.l 44(sp),28(a4)			
	move.l 48(sp),24(a4)			
	clr.l 20(a4)				
_?L2581:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2584				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2581				
_?L2582:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2624				
	move.l 52(a4),d1			
	cmp.l 64(sp),d1				
	jbcs _?L2601				
_?L2632:					
	clr.l d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L2626:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2584:					
	tst.l 114(a4)				
	jbeq _?L2625				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2582				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L2584				
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L2626				
_?L2623:					
	move.l d5,28(a4)			
	move.l 64(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2571:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2627				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2571				
_?L2572:					
	move.l 68(sp),a0			
	move.l 20(a4),(a0)			
_?L2631:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2625:					
						
	move.l 122(a4),d0			
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcc _?L2628				
_?L2587:					
						
	tst.l 72(sp)				
	jbeq _?L2618				
						
	moveq #16,d1				
	move.l 72(sp),a0			
	move.l d1,(a0)				
_?L2618:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L2626				
_?L2628:					
						
	cmp.l d0,d1				
	jbne _?L2614				
	move.l #_miniflac_bitreader_fill_nocrc,40(sp)
_?L2588:					
						
	pea 36.w				
	move.l d3,-(sp)				
	move.l 48(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2595				
						
	pea 36.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #8,d0				
	move.l d0,122(a4)			
	jbra _?L2587				
_?L2602:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2614:					
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbeq _?L2629				
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbne _?L2616				
	move.l #_miniflac_bitreader_fill_nocrc,40(sp)
_?L2590:					
						
	pea 3.w					
	move.l d3,-(sp)				
	move.l 48(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2595				
						
	pea 3.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d0				
	move.l d0,122(a4)			
_?L2589:					
						
	pea 5.w					
	move.l d3,-(sp)				
	move.l 48(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2595				
						
	pea 5.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
	move.b d1,132(a4)			
						
	moveq #7,d0				
	move.l d0,122(a4)			
	jbra _?L2588				
_?L2580:					
						
	move.l 52(a4),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L2626				
_?L2627:					
	lea _miniflac_sync_internal,a3		
_?L2574:					
	tst.l 114(a4)				
	jbeq _?L2630				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2572				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L2574				
	moveq #-1,d4				
	move.l 68(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2631				
_?L2595:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 64(sp),d1				
	jbcs _?L2601				
	jbra _?L2632				
_?L2629:					
	move.l #_miniflac_bitreader_fill_nocrc,40(sp)
	jbra _?L2589				
_?L2630:					
						
	moveq #7,d0				
	cmp.l 122(a4),d0			
	jbcc _?L2576				
_?L2579:					
						
	tst.l 72(sp)				
	jbeq _?L2578				
						
	moveq #16,d0				
	move.l 72(sp),a0			
	move.l d0,(a0)				
_?L2578:					
						
	moveq #1,d4				
						
	move.l 68(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2631				
_?L2576:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_total_samples
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2579				
						
	move.l 68(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L2631				
_?L2616:					
						
	subq.l #4,d0				
	jbeq _?L2594				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a4)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2582				
_?L2594:					
						
	pea 20.w				
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_fill_nocrc,48(sp)
	lea _miniflac_bitreader_fill_nocrc,a0	
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2595				
						
	pea 20.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,128(a4)			
						
	moveq #5,d0				
	move.l d0,122(a4)			
	jbra _?L2590				
_?L2624:					
						
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L2626				
						
	.align	2				
	.globl	_mflac_streaminfo_md5_length	
						
_mflac_streaminfo_md5_length:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_streaminfo_md5_length,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L2644				
_?L2636:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L2633				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L2636				
_?L2644:					
						
	tst.l d0				
	jble _?L2633				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L2633:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_md5_data	
						
_miniflac_streaminfo_md5_data:			
	lea (-20,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 60(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L2646				
						
	tst.l 68(sp)				
	jbeq _?L2709				
	subq.l #4,sp				
	move.l 68(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2736				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2736:					
	move.l 4(a3),d0				
_?L2646:					
						
	subq.l #1,d0				
	jbeq _?L2737				
						
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
_?L2708:					
	move.l d5,-(sp)				
	pea 52(sp)				
	move.l 72(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2669				
	move.l 48(sp),28(a3)			
	move.l 52(sp),24(a3)			
	clr.l 20(a3)				
_?L2670:					
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L2673				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2670				
_?L2671:					
	move.l 20(a3),d1			
_?L2675:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbne _?L2738				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L2708				
_?L2744:					
	clr.l d4				
	move.l 72(sp),a1			
	move.l d1,(a1)				
_?L2740:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2673:					
	tst.l 114(a3)				
	jbeq _?L2739				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2671				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L2673				
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
_?L2746:					
	move.l 72(sp),a1			
	move.l d1,(a1)				
	jbra _?L2740				
_?L2737:					
	move.l 64(sp),28(a3)			
	move.l 68(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L2649:					
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L2741				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L2649				
_?L2650:					
	move.l 72(sp),a1			
	move.l 20(a3),(a1)			
_?L2748:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2739:					
						
	move.l 122(a3),d0			
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcs _?L2742				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a3)				
	jbsr _miniflac_streaminfo_read_total_samples
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2671				
_?L2679:					
						
	move.b 126(a3),d0			
						
	cmp.b #16,d0				
	jbeq _?L2681				
						
	cmp.b #15,d0				
	jbhi _?L2682				
	tst.l 76(sp)				
	jbeq _?L2731				
						
	move.w #-1,a2				
_?L2683:					
						
	move.b 16(a3),d2			
						
	cmp.b #7,d2				
	jbhi _?L2743				
_?L2704:					
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L2686				
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
						
	jbeq _?L2711				
_?L2745:					
						
	move.w #64,a0				
	sub.l d7,a0				
						
	moveq #32,d2				
	sub.l d7,d2				
	jbmi _?L2698				
	move.l a2,d1				
	lsr.l d2,d1				
	move.l d1,a1				
	clr.l d2				
						
	and.l d6,d2				
	move.l d2,a0				
	move.l a1,d2				
	and.l 36(sp),d2				
_?L2697:					
	move.l a0,8(a3)				
	move.l d2,12(a3)			
						
	and.l #255,d0				
						
	cmp.l 80(sp),d0				
	jbcc _?L2700				
						
	move.w #-32,a0				
	add.l d7,a0				
	tst.l a0				
	jblt _?L2701				
	move.l a0,d2				
	lsr.l d2,d6				
						
	move.l 76(sp),a0			
	move.b d6,(a0,d0.l)			
						
	move.b 126(a3),d0			
	addq.b #1,d0				
	move.b d0,126(a3)			
						
	cmp.b #15,d0				
	jbls _?L2683				
_?L2682:					
						
	tst.l 84(sp)				
	jbeq _?L2733				
						
	move.l 80(sp),d0			
	moveq #16,d1				
	cmp.l d0,d1				
	jbcc _?L2707				
	moveq #16,d0				
_?L2707:					
						
	move.l 84(sp),a0			
	move.l d0,(a0)				
_?L2733:					
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	move.l 72(sp),a1			
	move.l d1,(a1)				
	jbra _?L2740				
_?L2686:					
	move.l 44(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L2708				
	jbra _?L2744				
_?L2700:					
						
	move.b 126(a3),d0			
	addq.b #1,d0				
	move.b d0,126(a3)			
						
	cmp.b #15,d0				
	jbhi _?L2682				
						
	move.b 16(a3),d2			
						
	cmp.b #7,d2				
	jbls _?L2704				
_?L2743:					
						
	move.l 8(a3),d6				
	move.l 12(a3),36(sp)			
						
	subq.b #8,d2				
	move.b d2,16(a3)			
						
	clr.l d7				
	move.b d2,d7				
						
	jbne _?L2745				
_?L2711:					
	sub.l a0,a0				
	clr.l d2				
	jbra _?L2697				
_?L2742:					
						
	subq.l #8,d0				
	jbeq _?L2679				
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	jbra _?L2746				
_?L2698:					
						
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
	jbra _?L2697				
_?L2701:					
						
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
	jbls _?L2683				
	jbra _?L2682				
_?L2709:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2669:					
	move.l 52(a3),d1			
	move.l 72(sp),a1			
	move.l d1,(a1)				
	jbra _?L2740				
_?L2741:					
	lea _miniflac_sync_internal,a4		
_?L2652:					
	tst.l 114(a3)				
	jbeq _?L2747				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2650				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L2652				
	moveq #-1,d4				
_?L2751:					
	move.l 72(sp),a1			
	move.l 20(a3),(a1)			
	jbra _?L2748				
_?L2731:					
						
	move.w #-1,a1				
_?L2692:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L2749				
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d2			
	cmp.l 24(a3),d2				
	jbcc _?L2686				
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
_?L2685:					
						
	move.b d0,16(a3)			
						
	jbeq _?L2687				
						
	and.l #255,d0				
						
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d6				
	sub.l d0,d6				
	jbmi _?L2688				
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
	jbls _?L2692				
	jbra _?L2682				
_?L2687:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.b 126(a3),d0			
	addq.b #1,d0				
	move.b d0,126(a3)			
						
	cmp.b #15,d0				
	jbls _?L2692				
	jbra _?L2682				
_?L2688:					
						
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
	jbls _?L2692				
	jbra _?L2682				
_?L2681:					
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
						
	moveq #2,d4				
						
	move.l 72(sp),a1			
	move.l d1,(a1)				
	jbra _?L2740				
_?L2749:					
						
	move.l 8(a3),d2				
	move.l 12(a3),a0			
						
	subq.b #8,d0				
	jbra _?L2685				
_?L2747:					
						
	move.l 122(a3),d0			
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcs _?L2750				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 122(a3)				
	jbsr _miniflac_streaminfo_read_total_samples
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2650				
_?L2655:					
						
	move.b 126(a3),d4			
						
	cmp.b #16,d4				
	jbeq _?L2710				
						
	cmp.b #15,d4				
	jbhi _?L2667				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
	tst.l 76(sp)				
	jbeq _?L2662				
_?L2660:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2661				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	and.l #255,d4				
						
	cmp.l 80(sp),d4				
	jbcc _?L2665				
						
	move.l 76(sp),a0			
	move.b d1,(a0,d4.l)			
						
	move.b 126(a3),d4			
	addq.b #1,d4				
	move.b d4,126(a3)			
						
	cmp.b #15,d4				
	jbls _?L2660				
_?L2667:					
						
	tst.l 84(sp)				
	jbeq _?L2659				
						
	move.l 80(sp),d0			
	moveq #16,d1				
	cmp.l d0,d1				
	jbcc _?L2668				
	moveq #16,d0				
_?L2668:					
						
	move.l 84(sp),a0			
	move.l d0,(a0)				
_?L2659:					
						
	moveq #1,d4				
						
	move.l 72(sp),a1			
	move.l 20(a3),(a1)			
	jbra _?L2748				
_?L2662:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2661				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b 126(a3),d0			
	addq.b #1,d0				
	move.b d0,126(a3)			
						
	cmp.b #15,d0				
	jbls _?L2662				
	jbra _?L2667				
_?L2665:					
						
	move.b 126(a3),d4			
	addq.b #1,d4				
	move.b d4,126(a3)			
						
	cmp.b #15,d4				
	jbls _?L2660				
	jbra _?L2667				
_?L2750:					
						
	subq.l #8,d0				
	jbeq _?L2655				
						
	moveq #-1,d4				
	jbra _?L2751				
_?L2661:					
						
	clr.l d4				
						
	move.l 72(sp),a1			
	move.l 20(a3),(a1)			
	jbra _?L2748				
_?L2710:					
						
	moveq #2,d4				
						
	move.l 72(sp),a1			
	move.l 20(a3),(a1)			
	jbra _?L2748				
_?L2738:					
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 72(sp),a1			
	move.l d1,(a1)				
	jbra _?L2740				
						
	.align	2				
	.globl	_mflac_streaminfo_md5_data	
						
_mflac_streaminfo_md5_data:			
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),d6			
	move.l 44(sp),d5			
	move.l 48(sp),d4			
						
	clr.l 28(sp)				
	move.l 482(a4),d0			
	move.l 478(a4),d1			
	moveq #28,d3				
	add.l sp,d3				
	lea _miniflac_streaminfo_md5_data,a3	
	move.l a4,d7				
	add.l #486,d7				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbne _?L2763				
_?L2755:					
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L2752				
						
	move.l d0,482(a4)			
	clr.l 478(a4)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbeq _?L2755				
_?L2763:					
						
	tst.l d0				
	jble _?L2752				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L2752:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
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
	jbne _?L2765				
						
	tst.l d3				
	jbeq _?L2772				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbeq _?L2776				
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2776:					
	move.l 4(a3),d0				
_?L2765:					
						
	subq.l #1,d0				
	jbeq _?L2777				
						
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
_?L2771:					
	move.l d5,-(sp)				
	move.l d7,-(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d6				
	moveq #1,d0				
	cmp.l d6,d0				
	jbne _?L2768				
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
	jbne _?L2770				
	cmp.l d3,d1				
	jbcs _?L2771				
_?L2770:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L2778:					
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2777:					
	move.l d4,72(sp)			
	move.l 36(sp),68(sp)			
	move.l d3,64(sp)			
	move.l a4,60(sp)			
	move.l a3,56(sp)			
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	jbra _miniflac_vorbis_comment_vendor_length_native
_?L2772:					
						
	clr.l d6				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L2768:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L2778				
						
	.align	2				
	.globl	_mflac_vorbis_comment_vendor_length
						
_mflac_vorbis_comment_vendor_length:		
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_vorbis_comment_vendor_length,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L2790				
_?L2782:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L2779				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L2782				
_?L2790:					
						
	tst.l d0				
	jble _?L2779				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L2779:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_vorbis_comment_vendor_string
						
_miniflac_vorbis_comment_vendor_string:		
	lea (-20,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 60(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L2792				
						
	tst.l 68(sp)				
	jbeq _?L2855				
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
_?L2792:					
						
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
_?L2854:					
	move.l d5,-(sp)				
	pea 52(sp)				
	move.l 72(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2815				
	move.l 48(sp),28(a3)			
	move.l 52(sp),24(a3)			
	clr.l 20(a3)				
_?L2816:					
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L2819				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2816				
_?L2817:					
	move.l 20(a3),d1			
_?L2821:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2879				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L2854				
_?L2885:					
	clr.l d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
_?L2881:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2819:					
	moveq #4,d0				
	cmp.l 114(a3),d0			
	jbeq _?L2880				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2817				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L2819				
_?L2822:					
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
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
_?L2795:					
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L2882				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L2795				
_?L2796:					
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
_?L2888:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2880:					
						
	move.l 134(a3),d0			
						
	jbeq _?L2824				
	subq.l #1,d0				
	jbne _?L2822				
						
	move.l 138(a3),d0			
_?L2826:					
						
	move.l 142(a3),a1			
						
	cmp.l d0,a1				
	jbcc _?L2844				
	tst.l 76(sp)				
	jbeq _?L2883				
_?L2845:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L2884				
						
	move.l 20(a3),40(sp)			
						
	move.l 40(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L2848				
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
_?L2827:					
						
	move.b d0,16(a3)			
						
	clr.l d6				
	move.b d0,d6				
						
	jbeq _?L2856				
						
	move.w #64,a2				
	sub.l d6,a2				
						
	moveq #32,d0				
	sub.l d6,d0				
	jbmi _?L2831				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,a0				
	clr.l d7				
						
	and.l d2,d7				
	move.l a0,d0				
	and.l 40(sp),d0				
_?L2830:					
	move.l d7,8(a3)				
	move.l d0,12(a3)			
						
	cmp.l 80(sp),a1				
	jbcc _?L2833				
						
	move.w #-32,a0				
	add.l d6,a0				
	tst.l a0				
	jblt _?L2834				
	move.l a0,d0				
	lsr.l d0,d2				
						
	move.l 76(sp),a0			
	move.b d2,(a0,a1.l)			
_?L2833:					
						
	move.l 142(a3),a1			
	addq.l #1,a1				
	move.l a1,142(a3)			
						
	move.l 138(a3),d0			
						
	cmp.l a1,d0				
	jbhi _?L2845				
_?L2844:					
						
	tst.l 84(sp)				
	jbeq _?L2840				
						
	move.l 80(sp),d1			
	cmp.l d1,d0				
	jbcc _?L2841				
	move.l d0,d1				
_?L2841:					
						
	move.l 84(sp),a2			
	move.l d1,(a2)				
_?L2840:					
						
	moveq #2,d0				
	move.l d0,134(a3)			
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L2881				
_?L2848:					
	move.l 40(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L2854				
	jbra _?L2885				
_?L2856:					
	clr.l d7				
	clr.l d0				
	jbra _?L2830				
_?L2831:					
						
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
	jbra _?L2830				
_?L2834:					
						
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
	jbra _?L2833				
_?L2855:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L2883:					
						
	move.w #-1,a1				
_?L2853:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L2886				
						
	move.l 20(a3),40(sp)			
						
	move.l 40(sp),d2			
	cmp.l 24(a3),d2				
	jbcc _?L2848				
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
_?L2847:					
						
	move.b d0,16(a3)			
						
	jbeq _?L2849				
						
	and.l #255,d0				
						
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d6				
	sub.l d0,d6				
	jbmi _?L2850				
	move.l a1,d0				
	lsr.l d6,d0				
	clr.l d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
_?L2874:					
						
	move.l 142(a3),d1			
	addq.l #1,d1				
	move.l d1,142(a3)			
						
	move.l 138(a3),d0			
						
	cmp.l d1,d0				
	jbhi _?L2853				
	jbra _?L2844				
_?L2849:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 142(a3),d1			
	addq.l #1,d1				
	move.l d1,142(a3)			
						
	move.l 138(a3),d0			
						
	cmp.l d1,d0				
	jbhi _?L2853				
	jbra _?L2844				
_?L2850:					
						
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
	jbra _?L2874				
_?L2815:					
						
	move.l 52(a3),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L2881				
_?L2884:					
						
	move.l 8(a3),d2				
	move.l 12(a3),40(sp)			
						
	subq.b #8,d0				
	jbra _?L2827				
_?L2882:					
						
	lea _miniflac_sync_internal,a4		
_?L2798:					
	moveq #4,d0				
	cmp.l 114(a3),d0			
	jbeq _?L2887				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2796				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L2798				
_?L2799:					
	moveq #-1,d4				
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L2888				
_?L2824:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2843				
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L2854				
	jbra _?L2885				
_?L2886:					
						
	move.l 8(a3),d2				
	move.l 12(a3),a0			
						
	subq.b #8,d0				
	jbra _?L2847				
_?L2843:					
						
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
	jbra _?L2826				
_?L2887:					
						
	move.l 134(a3),d0			
						
	jbeq _?L2801				
	subq.l #1,d0				
	jbne _?L2799				
						
	move.l 138(a3),d0			
_?L2802:					
						
	move.l 142(a3),d4			
						
	cmp.l d0,d4				
	jbcc _?L2814				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
	tst.l 76(sp)				
	jbeq _?L2805				
_?L2803:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2812				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	cmp.l 80(sp),d4				
	jbcc _?L2808				
						
	move.l 76(sp),a0			
	move.b d1,(a0,d4.l)			
_?L2808:					
						
	move.l 142(a3),d4			
	addq.l #1,d4				
	move.l d4,142(a3)			
						
	move.l 138(a3),d0			
						
	cmp.l d4,d0				
	jbhi _?L2803				
_?L2814:					
						
	tst.l 84(sp)				
	jbeq _?L2810				
						
	move.l 80(sp),d1			
	cmp.l d1,d0				
	jbcc _?L2811				
	move.l d0,d1				
_?L2811:					
						
	move.l 84(sp),a2			
	move.l d1,(a2)				
_?L2810:					
						
	moveq #2,d0				
	move.l d0,134(a3)			
						
	moveq #1,d4				
						
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L2888				
_?L2805:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2812				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 142(a3),d1			
	addq.l #1,d1				
	move.l d1,142(a3)			
						
	move.l 138(a3),d0			
						
	cmp.l d0,d1				
	jbcs _?L2805				
	jbra _?L2814				
_?L2812:					
						
	clr.l d4				
						
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L2888				
_?L2801:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2812				
						
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
	jbra _?L2802				
_?L2879:					
						
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L2881				
						
	.align	2				
	.globl	_mflac_vorbis_comment_vendor_string
						
_mflac_vorbis_comment_vendor_string:		
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),d6			
	move.l 44(sp),d5			
	move.l 48(sp),d4			
						
	clr.l 28(sp)				
	move.l 482(a4),d0			
	move.l 478(a4),d1			
	moveq #28,d3				
	add.l sp,d3				
	lea _miniflac_vorbis_comment_vendor_string,a3
	move.l a4,d7				
	add.l #486,d7				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbne _?L2900				
_?L2892:					
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L2889				
						
	move.l d0,482(a4)			
	clr.l 478(a4)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbeq _?L2892				
_?L2900:					
						
	tst.l d0				
	jble _?L2889				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L2889:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_vorbis_comment_total	
						
_miniflac_vorbis_comment_total:			
	lea (-24,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 64(sp),a6			
						
	move.l 4(a6),d0				
	jbne _?L2902				
						
	tst.l 72(sp)				
	jbeq _?L2960				
	subq.l #4,sp				
	move.l 72(sp),a0			
	move.b (a0),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L2997				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L2997:					
	move.l 4(a6),d0				
_?L2902:					
						
	subq.l #1,d0				
	jbeq _?L2998				
						
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
_?L2959:					
	move.l d6,-(sp)				
	pea 56(sp)				
	move.l 76(sp),-(sp)			
	move.l a6,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L2934				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
_?L2935:					
	moveq #4,d2				
	cmp.l (a6),d2				
	jbeq _?L2938				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2935				
_?L2936:					
	move.l 20(a6),d1			
_?L2940:					
	move.l d1,-(sp)				
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr (a5)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L2999				
	move.l 52(a6),d1			
	cmp.l 72(sp),d1				
	jbcs _?L2959				
_?L3006:					
	clr.l d4				
	move.l 76(sp),a0			
	move.l d1,(a0)				
_?L3001:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L2938:					
	moveq #4,d0				
	cmp.l 114(a6),d0			
	jbeq _?L3000				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d5				
	cmp.l d0,d5				
	jbne _?L2936				
	moveq #4,d7				
	cmp.l (a6),d7				
	jbeq _?L2938				
_?L2941:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d4				
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L3001				
_?L2998:					
	move.l 68(sp),28(a6)			
	move.l 72(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2905:					
	moveq #4,d4				
	cmp.l (a6),d4				
	jbeq _?L3002				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L2905				
_?L2992:					
	move.l 20(a6),d2			
_?L2906:					
	move.l 76(sp),a0			
	move.l d2,(a0)				
_?L3008:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L3000:					
						
	move.l 134(a6),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L3003				
						
	subq.l #1,d0				
	jbeq _?L3004				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2953				
						
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
	jbcc _?L2951				
_?L2954:					
						
	move.b 16(a6),d7			
						
	cmp.b #7,d7				
	jbhi _?L2948				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L3005				
						
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
_?L2948:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	addq.l #1,a1				
	move.l a1,142(a6)			
						
	cmp.l 40(sp),a1				
	jbne _?L2954				
_?L2951:					
						
	moveq #2,d7				
	move.l d7,134(a6)			
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2955				
_?L2953:					
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 72(sp),d1				
	jbcs _?L2959				
	jbra _?L3006				
_?L3003:					
						
	subq.l #2,d0				
	jbne _?L2941				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2953				
	jbra _?L2955				
_?L2960:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L2955:					
						
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
	jbeq _?L2957				
						
	move.l 80(sp),a0			
	move.l d0,(a0)				
_?L2957:					
						
	moveq #3,d0				
	move.l d0,134(a6)			
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L3001				
_?L3004:					
						
	move.l 138(a6),40(sp)			
						
	move.l 142(a6),a1			
						
	cmp.l 40(sp),a1				
	jbcs _?L2954				
	jbra _?L2951				
_?L3005:					
						
	move.l d2,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 72(sp),d1				
	jbcs _?L2959				
	jbra _?L3006				
_?L2934:					
	move.l 52(a6),d1			
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L3001				
_?L3002:					
	lea _miniflac_sync_internal,a3		
_?L2908:					
	moveq #4,d0				
	cmp.l 114(a6),d0			
	jbeq _?L3007				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d5				
	cmp.l d0,d5				
	jbne _?L2992				
	moveq #4,d7				
	cmp.l (a6),d7				
	jbeq _?L2908				
	move.l 20(a6),d2			
						
	moveq #-1,d4				
_?L3011:					
						
	move.l 76(sp),a0			
	move.l d2,(a0)				
	jbra _?L3008				
_?L3007:					
						
	move.l 134(a6),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L3009				
						
	subq.l #1,d0				
	jbeq _?L2913				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2991				
						
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
_?L2913:					
						
	move.l 142(a6),a1			
						
	move.l 138(a6),d6			
						
	cmp.l a1,d6				
	jbls _?L2931				
						
	move.b 16(a6),d4			
	addq.l #1,a1				
_?L2921:					
						
	cmp.b #7,d4				
	jbhi _?L3010				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L2990				
						
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
_?L2915:					
						
	move.b d0,16(a6)			
						
	jbeq _?L2961				
						
	clr.l d1				
	move.b d0,d1				
						
	moveq #64,d5				
	sub.l d1,d5				
						
	moveq #32,d2				
	sub.l d1,d2				
	jbmi _?L2918				
	moveq #-1,d1				
	lsr.l d2,d1				
	clr.l d2				
						
	move.l a4,d5				
	and.l d5,d2				
	move.l a2,d7				
	and.l d7,d1				
_?L2917:					
	move.l d2,8(a6)				
	move.l d1,12(a6)			
						
	move.l a1,142(a6)			
						
	cmp.l a1,d6				
	jbeq _?L2931				
	move.l a1,d1				
	addq.l #1,d1				
	cmp.b #7,d4				
	jbhi _?L2962				
						
	move.l 24(a6),d1			
						
	clr.l d5				
	move.b d0,d5				
	moveq #64,d2				
	sub.l d5,d2				
						
	moveq #32,d4				
	sub.l d5,d4				
	jbmi _?L2922				
	moveq #-1,d7				
	lsr.l d4,d7				
	sub.l a2,a2				
_?L2927:					
						
	move.l 20(a6),d2			
						
	cmp.l d1,d2				
	jbcc _?L2990				
						
	move.l 28(a6),a0			
						
	move.l d2,d4				
	addq.l #1,d4				
	move.l d4,20(a6)			
						
	move.b (a0,d2.l),d2			
						
	move.l 8(a6),d4				
	move.l 12(a6),d5			
						
	addq.l #1,32(a6)			
						
	move.b d0,16(a6)			
						
	jbeq _?L2925				
						
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
	jbhi _?L2927				
_?L2931:					
						
	moveq #2,d4				
	move.l d4,134(a6)			
_?L2912:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2991				
						
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
	jbeq _?L2933				
						
	move.l 80(sp),a0			
	move.l d0,(a0)				
_?L2933:					
						
	moveq #3,d0				
	move.l d0,134(a6)			
						
	move.l 20(a6),d2			
	moveq #1,d4				
	move.l 76(sp),a0			
	move.l d2,(a0)				
	jbra _?L3008				
_?L3009:					
						
	subq.l #2,d0				
	jbeq _?L2912				
						
	move.l 20(a6),d2			
						
	moveq #-1,d4				
	jbra _?L3011				
_?L2991:					
						
	move.l 20(a6),d2			
_?L2990:					
						
	clr.l d4				
						
	move.l 76(sp),a0			
	move.l d2,(a0)				
	jbra _?L3008				
_?L3010:					
						
	move.b d4,d0				
	subq.b #8,d0				
						
	move.l 8(a6),a4				
	move.l 12(a6),a2			
	jbra _?L2915				
_?L2925:					
						
	clr.l 8(a6)				
	clr.l 12(a6)				
						
	addq.l #1,a1				
	move.l a1,142(a6)			
						
	cmp.l a1,d6				
	jbhi _?L2927				
						
	moveq #2,d4				
	move.l d4,134(a6)			
	jbra _?L2912				
_?L2922:					
						
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
	jbra _?L2927				
_?L2962:					
						
	move.l d1,a1				
	move.b d0,d4				
	jbra _?L2921				
_?L2999:					
						
	move.l 52(a6),d1			
	move.l d0,d4				
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L3001				
_?L2918:					
						
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
	jbra _?L2917				
_?L2961:					
	clr.l d2				
	clr.l d1				
	jbra _?L2917				
						
	.align	2				
	.globl	_mflac_vorbis_comment_total	
						
_mflac_vorbis_comment_total:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_vorbis_comment_total,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L3023				
_?L3015:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L3012				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L3015				
_?L3023:					
						
	tst.l d0				
	jble _?L3012				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L3012:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_vorbis_comment_length	
						
_miniflac_vorbis_comment_length:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a6			
	move.l 56(sp),a4			
	move.l 60(sp),d4			
						
	move.l 4(a6),d0				
	jbne _?L3025				
						
	tst.l d4				
	jbeq _?L3043				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3048				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3048:					
	move.l 4(a6),d0				
_?L3025:					
						
	subq.l #1,d0				
	jbeq _?L3049				
						
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
_?L3042:					
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3033				
	move.l 40(sp),28(a6)			
	move.l 44(sp),24(a6)			
	clr.l 20(a6)				
_?L3034:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3037				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3034				
_?L3035:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	move.l 52(a6),d1			
	tst.l d0				
	jbne _?L3041				
	cmp.l d4,d1				
	jbcs _?L3042				
_?L3041:					
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L3051:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3037:					
	moveq #4,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3050				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3035				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3037				
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d0				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3051				
_?L3049:					
	move.l a4,28(a6)			
	move.l d4,24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3028:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3052				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3028				
_?L3029:					
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
_?L3054:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3050:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	move.l d7,-(sp)				
	jbsr _miniflac_vorbis_comment_read_length
	lea (12,sp),sp				
	jbra _?L3035				
_?L3043:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3033:					
	move.l 52(a6),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3051				
_?L3052:					
	lea _miniflac_sync_internal,a3		
_?L3031:					
	moveq #4,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3053				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3029				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3031				
	moveq #-1,d0				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3054				
_?L3053:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 134(a6)				
	jbsr _miniflac_vorbis_comment_read_length
	lea (12,sp),sp				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3054				
						
	.align	2				
	.globl	_mflac_vorbis_comment_length	
						
_mflac_vorbis_comment_length:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_vorbis_comment_length,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L3066				
_?L3058:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L3055				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L3058				
_?L3066:					
						
	tst.l d0				
	jble _?L3055				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L3055:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_vorbis_comment_string	
						
_miniflac_vorbis_comment_string:		
	lea (-20,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 60(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L3068				
						
	tst.l 68(sp)				
	jbeq _?L3144				
	subq.l #4,sp				
	move.l 68(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3180				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L3180:					
	move.l 4(a3),d0				
_?L3068:					
						
	subq.l #1,d0				
	jbeq _?L3181				
						
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
_?L3143:					
	move.l d5,-(sp)				
	pea 52(sp)				
	move.l 72(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3104				
	move.l 48(sp),28(a3)			
	move.l 52(sp),24(a3)			
	clr.l 20(a3)				
_?L3105:					
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3108				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3105				
_?L3106:					
	move.l 20(a3),d1			
_?L3110:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbne _?L3182				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L3143				
_?L3190:					
	clr.l d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
_?L3184:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L3108:					
	moveq #4,d1				
	cmp.l 114(a3),d1			
	jbeq _?L3183				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d6				
	cmp.l d0,d6				
	jbne _?L3106				
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L3108				
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
_?L3192:					
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L3184				
_?L3181:					
	move.l 64(sp),28(a3)			
	move.l 68(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L3071:					
	moveq #4,d5				
	cmp.l (a3),d5				
	jbeq _?L3185				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L3071				
_?L3175:					
	move.l 20(a3),d2			
_?L3072:					
	move.l 72(sp),a0			
	move.l d2,(a0)				
_?L3194:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L3183:					
						
	move.l 134(a3),d0			
						
	moveq #3,d2				
	cmp.l d0,d2				
	jbcs _?L3186				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 134(a3)				
	jbsr _miniflac_vorbis_comment_read_length
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3106				
_?L3126:					
						
	move.l 142(a3),d2			
						
	move.l 138(a3),a1			
						
	cmp.l d2,a1				
	jbls _?L3115				
	tst.l 76(sp)				
	jbeq _?L3125				
_?L3116:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L3187				
_?L3138:					
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L3119				
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
						
	jbeq _?L3146				
_?L3191:					
						
	move.w #64,a0				
	sub.l d7,a0				
						
	moveq #32,d0				
	sub.l d7,d0				
	jbmi _?L3131				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,a2				
	clr.l d0				
						
	and.l d6,d0				
	move.l d0,a0				
	move.l a2,d0				
	and.l 36(sp),d0				
_?L3130:					
	move.l a0,8(a3)				
	move.l d0,12(a3)			
						
	cmp.l 80(sp),d2				
	jbcc _?L3133				
						
	move.w #-32,a0				
	add.l d7,a0				
	tst.l a0				
	jblt _?L3134				
	move.l a0,d0				
	lsr.l d0,d6				
						
	move.l 76(sp),a0			
	move.b d6,(a0,d2.l)			
						
	move.l 142(a3),d2			
	addq.l #1,d2				
	move.l d2,142(a3)			
						
	move.l 138(a3),a1			
						
	cmp.l d2,a1				
	jbhi _?L3116				
_?L3115:					
						
	tst.l 84(sp)				
	jbeq _?L3140				
						
	move.l 80(sp),d0			
	cmp.l d0,a1				
	jbcc _?L3141				
	move.l a1,d0				
_?L3141:					
						
	move.l 84(sp),a2			
	move.l d0,(a2)				
_?L3140:					
						
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
	jbra _?L3184				
_?L3188:					
						
	move.l 8(a3),d2				
	move.l 12(a3),44(sp)			
						
	subq.b #8,d0				
	move.b d0,16(a3)			
						
	jbeq _?L3120				
_?L3189:					
						
	and.l #255,d0				
						
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d6				
	sub.l d0,d6				
	jbmi _?L3121				
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
	jbcc _?L3115				
_?L3125:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L3188				
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d6			
	cmp.l 24(a3),d6				
	jbcc _?L3119				
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
						
	jbne _?L3189				
_?L3120:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 142(a3),d0			
	addq.l #1,d0				
	move.l d0,142(a3)			
						
	cmp.l a1,d0				
	jbcs _?L3125				
	jbra _?L3115				
_?L3119:					
						
	move.l 44(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L3143				
	jbra _?L3190				
_?L3133:					
						
	move.l 142(a3),d2			
	addq.l #1,d2				
	move.l d2,142(a3)			
						
	cmp.l d2,a1				
	jbls _?L3115				
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbls _?L3138				
_?L3187:					
						
	move.l 8(a3),d6				
	move.l 12(a3),36(sp)			
						
	subq.b #8,d0				
	move.b d0,16(a3)			
						
	clr.l d7				
	move.b d0,d7				
						
	jbne _?L3191				
_?L3146:					
	sub.l a0,a0				
	clr.l d0				
	jbra _?L3130				
_?L3186:					
						
	cmp.l d0,d1				
	jbeq _?L3126				
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	jbra _?L3192				
_?L3131:					
						
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
	jbra _?L3130				
_?L3134:					
						
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
	jbhi _?L3116				
	jbra _?L3115				
_?L3144:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L3121:					
						
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
	jbcs _?L3125				
	jbra _?L3115				
_?L3104:					
						
	move.l 52(a3),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L3184				
_?L3185:					
	lea _miniflac_sync_internal,a4		
_?L3074:					
	moveq #4,d1				
	cmp.l 114(a3),d1			
	jbeq _?L3193				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d6				
	cmp.l d0,d6				
	jbne _?L3175				
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L3074				
	move.l 20(a3),d2			
						
	moveq #-1,d4				
_?L3197:					
						
	move.l 72(sp),a0			
	move.l d2,(a0)				
	jbra _?L3194				
_?L3193:					
						
	move.l 134(a3),d0			
						
	moveq #3,d2				
	cmp.l d0,d2				
	jbcs _?L3195				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 134(a3)				
	jbsr _miniflac_vorbis_comment_read_length
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3175				
_?L3078:					
						
	move.l 142(a3),d3			
						
	move.l 138(a3),a1			
						
	cmp.l a1,d3				
	jbcc _?L3079				
	tst.l 76(sp)				
	jbeq _?L3171				
						
	moveq #-1,d4				
	move.w #-2,a2				
_?L3080:					
						
	move.b 16(a3),d6			
						
	cmp.b #7,d6				
	jbhi _?L3196				
						
	move.l 20(a3),d2			
						
	cmp.l 24(a3),d2				
	jbcc _?L3083				
						
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
_?L3090:					
						
	move.b d6,16(a3)			
						
	clr.l d2				
	move.b d6,d2				
						
	jbeq _?L3145				
						
	move.w #64,a0				
	sub.l d2,a0				
						
	moveq #32,d6				
	sub.l d2,d6				
	jbmi _?L3093				
	move.l d4,d1				
	lsr.l d6,d1				
	clr.l d6				
						
	and.l d7,d6				
	and.l d0,d1				
_?L3092:					
	move.l d6,8(a3)				
	move.l d1,12(a3)			
						
	cmp.l 80(sp),d3				
	jbcc _?L3095				
						
	moveq #-32,d1				
	add.l d2,d1				
	jbmi _?L3096				
	move.l d7,d0				
	lsr.l d1,d0				
						
	move.l 76(sp),a0			
	move.b d0,(a0,d3.l)			
						
	move.l 142(a3),d3			
	addq.l #1,d3				
	move.l d3,142(a3)			
						
	move.l 138(a3),a1			
						
	cmp.l d3,a1				
	jbhi _?L3080				
_?L3079:					
						
	tst.l 84(sp)				
	jbeq _?L3102				
						
	move.l 80(sp),d0			
	cmp.l d0,a1				
	jbcc _?L3103				
	move.l a1,d0				
_?L3103:					
						
	move.l 84(sp),a2			
	move.l d0,(a2)				
_?L3102:					
						
	addq.l #1,150(a3)			
						
	moveq #3,d0				
	move.l d0,134(a3)			
						
	move.l 20(a3),d2			
	moveq #1,d4				
	move.l 72(sp),a0			
	move.l d2,(a0)				
	jbra _?L3194				
_?L3083:					
						
	clr.l d4				
						
	move.l 72(sp),a0			
	move.l d2,(a0)				
	jbra _?L3194				
_?L3095:					
						
	move.l 142(a3),d3			
	addq.l #1,d3				
	move.l d3,142(a3)			
						
	cmp.l d3,a1				
	jbhi _?L3080				
	jbra _?L3079				
_?L3145:					
	clr.l d6				
	clr.l d1				
	jbra _?L3092				
_?L3195:					
						
	cmp.l d0,d1				
	jbeq _?L3078				
						
	move.l 20(a3),d2			
						
	moveq #-1,d4				
	jbra _?L3197				
_?L3093:					
						
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
	jbra _?L3092				
_?L3096:					
						
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
	jbhi _?L3080				
	jbra _?L3079				
_?L3171:					
						
	moveq #-1,d5				
	moveq #-2,d6				
_?L3089:					
						
	move.b 16(a3),d4			
						
	cmp.b #7,d4				
	jbhi _?L3198				
						
	move.l 20(a3),d2			
						
	cmp.l 24(a3),d2				
	jbcc _?L3083				
						
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
_?L3082:					
						
	move.b d4,16(a3)			
						
	jbeq _?L3084				
						
	and.l #255,d4				
						
	moveq #64,d2				
	sub.l d4,d2				
						
	moveq #32,d7				
	sub.l d4,d7				
	jbmi _?L3085				
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
	jbcs _?L3089				
	jbra _?L3079				
_?L3084:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 142(a3),d0			
	addq.l #1,d0				
	move.l d0,142(a3)			
						
	cmp.l d0,a1				
	jbhi _?L3089				
	jbra _?L3079				
_?L3085:					
						
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
	jbcs _?L3089				
	jbra _?L3079				
_?L3196:					
						
	move.l 8(a3),d7				
	move.l 12(a3),d0			
						
	subq.b #8,d6				
	jbra _?L3090				
_?L3198:					
						
	move.l 8(a3),d3				
	move.l 12(a3),d0			
						
	subq.b #8,d4				
	jbra _?L3082				
_?L3182:					
						
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L3184				
						
	.align	2				
	.globl	_mflac_vorbis_comment_string	
						
_mflac_vorbis_comment_string:			
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),d6			
	move.l 44(sp),d5			
	move.l 48(sp),d4			
						
	clr.l 28(sp)				
	move.l 482(a4),d0			
	move.l 478(a4),d1			
	moveq #28,d3				
	add.l sp,d3				
	lea _miniflac_vorbis_comment_string,a3	
	move.l a4,d7				
	add.l #486,d7				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbne _?L3210				
_?L3202:					
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L3199				
						
	move.l d0,482(a4)			
	clr.l 478(a4)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbeq _?L3202				
_?L3210:					
						
	tst.l d0				
	jble _?L3199				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L3199:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
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
	jbne _?L3212				
						
	tst.l d3				
	jbeq _?L3219				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbeq _?L3223				
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3223:					
	move.l 4(a3),d0				
_?L3212:					
						
	subq.l #1,d0				
	jbeq _?L3224				
						
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
_?L3218:					
	move.l d5,-(sp)				
	move.l d7,-(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d6				
	moveq #1,d0				
	cmp.l d6,d0				
	jbne _?L3215				
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
	jbne _?L3217				
	cmp.l d3,d1				
	jbcs _?L3218				
_?L3217:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L3225:					
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3224:					
	move.l d4,72(sp)			
	move.l 36(sp),68(sp)			
	move.l d3,64(sp)			
	move.l a4,60(sp)			
	move.l a3,56(sp)			
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	jbra _miniflac_picture_type_native	
_?L3219:					
						
	clr.l d6				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3215:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L3225				
						
	.align	2				
	.globl	_mflac_picture_type		
						
_mflac_picture_type:				
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_picture_type,a4		
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L3237				
_?L3229:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L3226				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L3229				
_?L3237:					
						
	tst.l d0				
	jble _?L3226				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L3226:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_picture_mime_length	
						
_miniflac_picture_mime_length:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L3239				
						
	tst.l 60(sp)				
	jbeq _?L3269				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3289				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3289:					
	move.l 4(a4),d0				
_?L3239:					
						
	subq.l #1,d0				
	jbeq _?L3290				
						
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
_?L3268:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3253				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L3254:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3257				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3254				
_?L3255:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L3291				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L3268				
_?L3295:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L3293:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3257:					
	moveq #6,d1				
	cmp.l 114(a4),d1			
	jbeq _?L3292				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3255				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3257				
_?L3258:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3293				
_?L3290:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3242:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3294				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3242				
_?L3243:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L3297:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3292:					
						
	move.l 154(a4),d0			
						
	jbeq _?L3260				
	subq.l #1,d0				
	jbne _?L3258				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3265				
_?L3286:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L3268				
	jbra _?L3295				
_?L3265:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,158(a4)			
						
	clr.l 162(a4)				
						
	tst.l 68(sp)				
	jbeq _?L3266				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L3266:					
						
	moveq #2,d0				
	move.l d0,154(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3293				
_?L3269:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3253:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3293				
_?L3294:					
	lea _miniflac_sync_internal,a3		
_?L3245:					
	moveq #6,d0				
	cmp.l 114(a4),d0			
	jbeq _?L3296				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3243				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3245				
_?L3249:					
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3297				
_?L3260:					
						
	pea 32.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L3286				
						
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
	jbne _?L3286				
	jbra _?L3265				
_?L3296:					
						
	move.l 154(a4),d0			
						
	jbeq _?L3247				
	subq.l #1,d0				
	jbne _?L3249				
	lea _miniflac_bitreader_fill_nocrc,a1	
_?L3248:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3251				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,158(a4)			
						
	clr.l 162(a4)				
						
	tst.l 68(sp)				
	jbeq _?L3252				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L3252:					
						
	moveq #2,d0				
	move.l d0,154(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3297				
_?L3251:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3297				
_?L3247:					
						
	pea 32.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L3251				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,154(a4)			
	move.l 36(sp),a1			
	jbra _?L3248				
_?L3291:					
						
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3293				
						
	.align	2				
	.globl	_mflac_picture_mime_length	
						
_mflac_picture_mime_length:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_picture_mime_length,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L3309				
_?L3301:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L3298				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L3301				
_?L3309:					
						
	tst.l d0				
	jble _?L3298				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L3298:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_picture_mime_string	
						
_miniflac_picture_mime_string:			
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L3311				
						
	tst.l 64(sp)				
	jbeq _?L3383				
	subq.l #4,sp				
	move.l 64(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3417				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3417:					
	move.l 4(a3),d0				
_?L3311:					
						
	subq.l #1,d0				
	jbeq _?L3418				
						
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
_?L3382:					
	move.l d5,-(sp)				
	pea 48(sp)				
	move.l 68(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3341				
	move.l 44(sp),28(a3)			
	move.l 48(sp),24(a3)			
	clr.l 20(a3)				
_?L3342:					
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3345				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3342				
_?L3343:					
	move.l 20(a3),d1			
_?L3347:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbne _?L3419				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3382				
_?L3426:					
	clr.l d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L3421:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3345:					
	moveq #6,d0				
	cmp.l 114(a3),d0			
	jbeq _?L3420				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3343				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3345				
_?L3348:					
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3421				
_?L3418:					
	move.l 60(sp),28(a3)			
	move.l 64(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L3314:					
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L3422				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L3314				
_?L3315:					
	move.l 20(a3),a0			
_?L3319:					
	move.l 68(sp),a1			
	move.l a0,(a1)				
_?L3429:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3420:					
						
	move.l 154(a3),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L3423				
						
	subq.l #1,d0				
	move.l #_miniflac_bitreader_fill_nocrc,d6
	tst.l d0				
	jbeq _?L3369				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_fill_nocrc,d6
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3370				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,154(a3)			
_?L3369:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3370				
						
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
_?L3352:					
						
	cmp.l a1,d0				
	jbls _?L3372				
	tst.l 72(sp)				
	jbeq _?L3424				
_?L3373:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L3425				
						
	move.l 20(a3),36(sp)			
						
	move.l 36(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L3376				
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
_?L3353:					
						
	move.b d0,16(a3)			
						
	clr.l d6				
	move.b d0,d6				
						
	jbeq _?L3387				
						
	move.w #64,a2				
	sub.l d6,a2				
						
	moveq #32,d0				
	sub.l d6,d0				
	jbmi _?L3357				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,a0				
	clr.l d7				
						
	and.l d2,d7				
	move.l a0,d0				
	and.l 36(sp),d0				
_?L3356:					
	move.l d7,8(a3)				
	move.l d0,12(a3)			
						
	cmp.l 76(sp),a1				
	jbcc _?L3359				
						
	move.w #-32,a0				
	add.l d6,a0				
	tst.l a0				
	jblt _?L3360				
	move.l a0,d0				
	lsr.l d0,d2				
						
	move.l 72(sp),a0			
	move.b d2,(a0,a1.l)			
_?L3359:					
						
	move.l 162(a3),a1			
	addq.l #1,a1				
	move.l a1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l a1,d0				
	jbhi _?L3373				
_?L3372:					
						
	tst.l 80(sp)				
	jbeq _?L3366				
						
	move.l 76(sp),d1			
	cmp.l d1,d0				
	jbcc _?L3367				
	move.l d0,d1				
_?L3367:					
						
	move.l 80(sp),a1			
	move.l d1,(a1)				
_?L3366:					
						
	moveq #3,d0				
	move.l d0,154(a3)			
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3421				
_?L3423:					
						
	subq.l #2,d0				
	jbne _?L3348				
						
	move.l 158(a3),d0			
						
	move.l 162(a3),a1			
	jbra _?L3352				
_?L3376:					
						
	move.l 36(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3382				
	jbra _?L3426				
_?L3387:					
	clr.l d7				
	clr.l d0				
	jbra _?L3356				
_?L3357:					
						
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
	jbra _?L3356				
_?L3360:					
						
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
	jbra _?L3359				
_?L3383:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3424:					
						
	move.w #-1,a1				
_?L3381:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L3427				
						
	move.l 20(a3),36(sp)			
						
	move.l 36(sp),d2			
	cmp.l 24(a3),d2				
	jbcc _?L3376				
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
_?L3375:					
						
	move.b d0,16(a3)			
						
	jbeq _?L3377				
						
	and.l #255,d0				
						
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d6				
	sub.l d0,d6				
	jbmi _?L3378				
	move.l a1,d0				
	lsr.l d6,d0				
	clr.l d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
_?L3414:					
						
	move.l 162(a3),d1			
	addq.l #1,d1				
	move.l d1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d1,d0				
	jbhi _?L3381				
	jbra _?L3372				
_?L3377:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 162(a3),d1			
	addq.l #1,d1				
	move.l d1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d1,d0				
	jbhi _?L3381				
	jbra _?L3372				
_?L3378:					
						
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
	jbra _?L3414				
_?L3341:					
						
	move.l 52(a3),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3421				
_?L3425:					
						
	move.l 8(a3),d2				
	move.l 12(a3),36(sp)			
						
	subq.b #8,d0				
	jbra _?L3353				
_?L3422:					
						
	lea _miniflac_sync_internal,a4		
_?L3317:					
	moveq #6,d0				
	cmp.l 114(a3),d0			
	jbeq _?L3428				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3315				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3317				
_?L3322:					
	move.l 20(a3),a0			
						
	moveq #-1,d4				
						
	move.l 68(sp),a1			
	move.l a0,(a1)				
	jbra _?L3429				
_?L3370:					
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3382				
	jbra _?L3426				
_?L3427:					
						
	move.l 8(a3),d2				
	move.l 12(a3),a0			
						
	subq.b #8,d0				
	jbra _?L3375				
_?L3428:					
						
	move.l 154(a3),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L3430				
						
	subq.l #1,d0				
	jbeq _?L3333				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3412				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d2				
	move.l d2,154(a3)			
_?L3333:					
						
	move.b 16(a3),d4			
						
	cmp.b #31,d4				
	jbhi _?L3336				
						
	move.l 24(a3),a2			
						
	move.l 20(a3),d2			
						
	cmp.l a2,d2				
	jbcc _?L3384				
						
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
	jbhi _?L3336				
	cmp.l a0,a2				
	jbls _?L3411				
						
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
	jbhi _?L3336				
	cmp.l a4,a2				
	jbls _?L3386				
						
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
	jbhi _?L3336				
	cmp.l a0,a2				
	jbls _?L3411				
						
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
_?L3336:					
						
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
_?L3323:					
						
	cmp.l d4,d0				
	jbls _?L3340				
	move.l #_miniflac_bitreader_fill_nocrc,d6
						
	lea _miniflac_bitreader_read,a4		
	tst.l 72(sp)				
	jbeq _?L3326				
_?L3324:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d6,a1				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3412				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	cmp.l 76(sp),d4				
	jbcc _?L3329				
						
	move.l 72(sp),a2			
	move.b d1,(a2,d4.l)			
_?L3329:					
						
	move.l 162(a3),d4			
	addq.l #1,d4				
	move.l d4,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d4,d0				
	jbhi _?L3324				
_?L3340:					
						
	tst.l 80(sp)				
	jbeq _?L3331				
						
	move.l 76(sp),d1			
	cmp.l d1,d0				
	jbcc _?L3332				
	move.l d0,d1				
_?L3332:					
						
	move.l 80(sp),a0			
	move.l d1,(a0)				
_?L3331:					
						
	moveq #3,d0				
	move.l d0,154(a3)			
						
	move.l 20(a3),a0			
						
	moveq #1,d4				
						
	move.l 68(sp),a1			
	move.l a0,(a1)				
	jbra _?L3429				
_?L3430:					
						
	subq.l #2,d0				
	jbne _?L3322				
						
	move.l 162(a3),d4			
						
	move.l 158(a3),d0			
	jbra _?L3323				
_?L3326:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3412				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 162(a3),d1			
	addq.l #1,d1				
	move.l d1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d0,d1				
	jbcs _?L3326				
	jbra _?L3340				
_?L3412:					
						
	move.l 20(a3),a0			
						
	clr.l d4				
						
	move.l 68(sp),a1			
	move.l a0,(a1)				
	jbra _?L3429				
_?L3419:					
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3421				
_?L3386:					
						
	move.l a4,a0				
_?L3411:					
						
	clr.l d4				
						
	move.l 68(sp),a1			
	move.l a0,(a1)				
	jbra _?L3429				
_?L3384:					
						
	move.l d2,a0				
						
	clr.l d4				
						
	move.l 68(sp),a1			
	move.l a0,(a1)				
	jbra _?L3429				
						
	.align	2				
	.globl	_mflac_picture_mime_string	
						
_mflac_picture_mime_string:			
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),d6			
	move.l 44(sp),d5			
	move.l 48(sp),d4			
						
	clr.l 28(sp)				
	move.l 482(a4),d0			
	move.l 478(a4),d1			
	moveq #28,d3				
	add.l sp,d3				
	lea _miniflac_picture_mime_string,a3	
	move.l a4,d7				
	add.l #486,d7				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbne _?L3442				
_?L3434:					
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L3431				
						
	move.l d0,482(a4)			
	clr.l 478(a4)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbeq _?L3434				
_?L3442:					
						
	tst.l d0				
	jble _?L3431				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L3431:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_picture_description_length
						
_miniflac_picture_description_length:		
	lea (-28,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 68(sp),a4			
						
	move.l 4(a4),d0				
	jbne _?L3444				
						
	tst.l 76(sp)				
	jbeq _?L3490				
	subq.l #4,sp				
	move.l 76(sp),a0			
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
	lea (28,sp),sp				
	rts					
_?L3512:					
	move.l 4(a4),d0				
_?L3444:					
						
	subq.l #1,d0				
	jbeq _?L3513				
						
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
_?L3489:					
	move.l d6,-(sp)				
	pea 60(sp)				
	move.l 80(sp),-(sp)			
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3452				
	move.l 56(sp),28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
_?L3453:					
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L3456				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3453				
_?L3454:					
	move.l 20(a4),d1			
_?L3458:					
	move.l d1,-(sp)				
	move.l a4,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbne _?L3514				
	move.l 52(a4),d1			
	cmp.l 76(sp),d1				
	jbcs _?L3489				
_?L3520:					
	clr.l d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
_?L3516:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3456:					
	moveq #6,d1				
	cmp.l 114(a4),d1			
	jbeq _?L3515				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d5				
	cmp.l d0,d5				
	jbne _?L3454				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3456				
_?L3459:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3516				
_?L3513:					
	move.l 72(sp),28(a4)			
	move.l 76(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3447:					
	moveq #4,d5				
	cmp.l (a4),d5				
	jbeq _?L3517				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L3447				
_?L3448:					
	move.l 80(sp),a0			
	move.l 20(a4),(a0)			
_?L3522:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3515:					
						
	move.l 154(a4),d0			
						
	moveq #2,d2				
	cmp.l d0,d2				
	jbcs _?L3518				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbne _?L3464				
						
	move.l 158(a4),44(sp)			
						
	move.l 162(a4),d0			
_?L3465:					
						
	cmp.l 44(sp),d0				
	jbcc _?L3485				
						
	move.b 16(a4),d7			
	move.l d0,a2				
	addq.l #1,a2				
_?L3473:					
						
	cmp.b #7,d7				
	jbhi _?L3519				
						
	move.l 20(a4),d2			
						
	cmp.l 24(a4),d2				
	jbcc _?L3476				
						
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
						
	jbeq _?L3492				
_?L3523:					
						
	clr.l d1				
	move.b d0,d1				
						
	move.w #64,a1				
	sub.l d1,a1				
						
	moveq #32,d2				
	sub.l d1,d2				
	move.l d2,48(sp)			
	jbmi _?L3470				
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
_?L3469:					
	move.l a0,8(a4)				
	move.l d2,12(a4)			
						
	move.l a2,162(a4)			
						
	cmp.l 44(sp),a2				
	jbeq _?L3485				
	move.l a2,d1				
	addq.l #1,d1				
	cmp.b #7,d7				
	jbhi _?L3493				
						
	move.l 24(a4),d7			
						
	clr.l d1				
	move.b d0,d1				
	move.w #64,a1				
	sub.l d1,a1				
						
	moveq #32,d2				
	sub.l d1,d2				
	moveq #-1,d1				
	tst.l d2				
	jblt _?L3474				
	lsr.l d2,d1				
	move.l d1,48(sp)			
	clr.l 52(sp)				
_?L3479:					
						
	move.l 20(a4),d2			
						
	cmp.l d2,d7				
	jbls _?L3476				
						
	move.l 28(a4),a1			
						
	move.l d2,d5				
	addq.l #1,d5				
	move.l d5,20(a4)			
						
	move.b (a1,d2.l),d5			
						
	move.l 8(a4),a0				
	move.l 12(a4),a1			
						
	addq.l #1,32(a4)			
						
	move.b d0,16(a4)			
						
	jbeq _?L3477				
						
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
	jbcs _?L3479				
_?L3485:					
						
	moveq #3,d0				
	move.l d0,154(a4)			
_?L3462:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3486				
_?L3483:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 76(sp),d1				
	jbcs _?L3489				
	jbra _?L3520				
_?L3518:					
						
	subq.l #3,d0				
	jbne _?L3459				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3483				
_?L3486:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,158(a4)			
						
	clr.l 162(a4)				
						
	tst.l 84(sp)				
	jbeq _?L3487				
						
	move.l 84(sp),a0			
	move.l d1,(a0)				
_?L3487:					
						
	moveq #4,d0				
	move.l d0,154(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3516				
_?L3490:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3464:					
						
	subq.l #1,d0				
	move.l #_miniflac_bitreader_fill_nocrc,d7
	tst.l d0				
	jbeq _?L3482				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_fill_nocrc,d7
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3483				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,154(a4)			
_?L3482:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3483				
						
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
	jbra _?L3465				
_?L3476:					
						
	move.l d2,-(sp)				
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 76(sp),d1				
	jbcs _?L3489				
	jbra _?L3520				
_?L3452:					
	move.l 52(a4),d1			
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3516				
_?L3517:					
	lea _miniflac_sync_internal,a3		
_?L3450:					
	moveq #6,d2				
	cmp.l 114(a4),d2			
	jbeq _?L3521				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3448				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3450				
	moveq #-1,d4				
	move.l 80(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3522				
_?L3519:					
						
	move.b d7,d0				
	subq.b #8,d0				
						
	move.l 8(a4),a0				
	move.l 12(a4),d5			
						
	move.b d0,16(a4)			
						
	jbne _?L3523				
_?L3492:					
	sub.l a0,a0				
	clr.l d2				
	jbra _?L3469				
_?L3477:					
						
	clr.l 8(a4)				
	clr.l 12(a4)				
						
	addq.l #1,a2				
	move.l a2,162(a4)			
						
	cmp.l 44(sp),a2				
	jbcs _?L3479				
						
	moveq #3,d0				
	move.l d0,154(a4)			
	jbra _?L3462				
_?L3521:					
						
	move.l 84(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_description_length
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 80(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3522				
_?L3474:					
						
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
	jbra _?L3479				
_?L3470:					
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
	jbra _?L3469				
_?L3493:					
						
	move.l d1,a2				
	move.b d0,d7				
	jbra _?L3473				
_?L3514:					
						
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3516				
						
	.align	2				
	.globl	_mflac_picture_description_length
						
_mflac_picture_description_length:		
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_picture_description_length,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L3535				
_?L3527:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L3524				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L3527				
_?L3535:					
						
	tst.l d0				
	jble _?L3524				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L3524:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_picture_description_string
						
_miniflac_picture_description_string:		
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L3537				
						
	tst.l 64(sp)				
	jbeq _?L3607				
	subq.l #4,sp				
	move.l 64(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3643				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3643:					
	move.l 4(a3),d0				
_?L3537:					
						
	subq.l #1,d0				
	jbeq _?L3644				
						
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
_?L3606:					
	move.l d5,-(sp)				
	pea 48(sp)				
	move.l 68(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3558				
	move.l 44(sp),28(a3)			
	move.l 48(sp),24(a3)			
	clr.l 20(a3)				
_?L3559:					
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3562				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3559				
_?L3560:					
	move.l 20(a3),d1			
_?L3564:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L3645				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3606				
_?L3653:					
	clr.l d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L3647:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3562:					
	moveq #6,d0				
	cmp.l 114(a3),d0			
	jbeq _?L3646				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3560				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3562				
_?L3565:					
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3647				
_?L3644:					
	move.l 60(sp),28(a3)			
	move.l 64(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L3540:					
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L3648				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L3540				
_?L3541:					
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
_?L3657:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3646:					
						
	move.l 154(a3),d0			
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbcs _?L3649				
						
	moveq #3,d1				
	move.l #_miniflac_bitreader_fill_nocrc,d7
	cmp.l d0,d1				
	jbne _?L3650				
_?L3586:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3592				
						
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
_?L3569:					
						
	cmp.l d0,a1				
	jbcc _?L3596				
	tst.l 72(sp)				
	jbeq _?L3651				
_?L3597:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L3652				
						
	move.l 20(a3),40(sp)			
						
	move.l 40(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L3600				
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
_?L3570:					
						
	move.b d0,16(a3)			
						
	clr.l d6				
	move.b d0,d6				
						
	jbeq _?L3608				
						
	move.w #64,a2				
	sub.l d6,a2				
						
	moveq #32,d0				
	sub.l d6,d0				
	jbmi _?L3574				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,a0				
	clr.l d7				
						
	and.l d2,d7				
	move.l a0,d0				
	and.l 40(sp),d0				
_?L3573:					
	move.l d7,8(a3)				
	move.l d0,12(a3)			
						
	cmp.l 76(sp),a1				
	jbcc _?L3576				
						
	move.w #-32,a0				
	add.l d6,a0				
	tst.l a0				
	jblt _?L3577				
	move.l a0,d0				
	lsr.l d0,d2				
						
	move.l 72(sp),a0			
	move.b d2,(a0,a1.l)			
_?L3576:					
						
	move.l 162(a3),a1			
	addq.l #1,a1				
	move.l a1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l a1,d0				
	jbhi _?L3597				
_?L3596:					
						
	tst.l 80(sp)				
	jbeq _?L3583				
						
	move.l 76(sp),d1			
	cmp.l d1,d0				
	jbcc _?L3584				
	move.l d0,d1				
_?L3584:					
						
	move.l 80(sp),a2			
	move.l d1,(a2)				
_?L3583:					
						
	moveq #5,d0				
	move.l d0,154(a3)			
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3647				
_?L3649:					
						
	subq.l #4,d0				
	jbne _?L3565				
						
	move.l 158(a3),d0			
						
	move.l 162(a3),a1			
	jbra _?L3569				
_?L3600:					
						
	move.l 40(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3606				
	jbra _?L3653				
_?L3608:					
	clr.l d7				
	clr.l d0				
	jbra _?L3573				
_?L3574:					
						
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
	jbra _?L3573				
_?L3577:					
						
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
	jbra _?L3576				
_?L3607:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L3651:					
						
	move.w #-1,a1				
_?L3605:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L3654				
						
	move.l 20(a3),40(sp)			
						
	move.l 40(sp),d2			
	cmp.l 24(a3),d2				
	jbcc _?L3600				
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
_?L3599:					
						
	move.b d0,16(a3)			
						
	jbeq _?L3601				
						
	and.l #255,d0				
						
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d6				
	sub.l d0,d6				
	jbmi _?L3602				
	move.l a1,d0				
	lsr.l d6,d0				
	clr.l d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
_?L3638:					
						
	move.l 162(a3),d1			
	addq.l #1,d1				
	move.l d1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d0,d1				
	jbcs _?L3605				
	jbra _?L3596				
_?L3650:					
						
	moveq #2,d2				
	cmp.l d0,d2				
	jbeq _?L3655				
						
	subq.l #1,d0				
	move.l #_miniflac_bitreader_fill_nocrc,d7
	tst.l d0				
	jbeq _?L3591				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_fill_nocrc,d7
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3592				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,154(a3)			
_?L3591:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3592				
						
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
	jbcc _?L3594				
_?L3590:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3592				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.l #1,d6				
	move.l d6,162(a3)			
						
	cmp.l 40(sp),d6				
	jbne _?L3590				
_?L3594:					
						
	moveq #3,d0				
	move.l d0,154(a3)			
	jbra _?L3586				
_?L3601:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 162(a3),d1			
	addq.l #1,d1				
	move.l d1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d0,d1				
	jbcs _?L3605				
	jbra _?L3596				
_?L3602:					
						
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
	jbra _?L3638				
_?L3558:					
						
	move.l 52(a3),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3647				
_?L3652:					
						
	move.l 8(a3),d2				
	move.l 12(a3),40(sp)			
						
	subq.b #8,d0				
	jbra _?L3570				
_?L3648:					
						
	lea _miniflac_sync_internal,a4		
_?L3543:					
	moveq #6,d0				
	cmp.l 114(a3),d0			
	jbeq _?L3656				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3541				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L3543				
	moveq #-1,d4				
_?L3659:					
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L3657				
_?L3592:					
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L3606				
	jbra _?L3653				
_?L3654:					
						
	move.l 8(a3),d2				
	move.l 12(a3),a0			
						
	subq.b #8,d0				
	jbra _?L3599				
_?L3655:					
						
	move.l 162(a3),d6			
						
	move.l 158(a3),40(sp)			
	move.l #_miniflac_bitreader_fill_nocrc,d7
						
	cmp.l 40(sp),d6				
	jbcs _?L3590				
	jbra _?L3594				
_?L3656:					
						
	move.l 154(a3),d0			
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbcs _?L3658				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a3)				
	jbsr _miniflac_picture_read_description_length
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3541				
_?L3557:					
						
	move.l 162(a3),d4			
						
	move.l 158(a3),d5			
						
	cmp.l d4,d5				
	jbls _?L3547				
	move.l #_miniflac_bitreader_fill_nocrc,d7
						
	lea _miniflac_bitreader_read,a4		
	tst.l 72(sp)				
	jbeq _?L3550				
_?L3548:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d7,a2				
	jbsr (a2)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3549				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	cmp.l 76(sp),d4				
	jbcc _?L3553				
						
	move.l 72(sp),a0			
	move.b d1,(a0,d4.l)			
_?L3553:					
						
	move.l 162(a3),d4			
	addq.l #1,d4				
	move.l d4,162(a3)			
						
	move.l 158(a3),d5			
						
	cmp.l d4,d5				
	jbhi _?L3548				
_?L3547:					
						
	tst.l 80(sp)				
	jbeq _?L3555				
						
	move.l 76(sp),d0			
	cmp.l d0,d5				
	jbcc _?L3556				
	move.l d5,d0				
_?L3556:					
						
	move.l 80(sp),a2			
	move.l d0,(a2)				
_?L3555:					
						
	moveq #5,d0				
	move.l d0,154(a3)			
						
	moveq #1,d4				
						
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L3657				
_?L3550:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3549				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 162(a3),d0			
	addq.l #1,d0				
	move.l d0,162(a3)			
						
	cmp.l d0,d5				
	jbhi _?L3550				
	jbra _?L3547				
_?L3658:					
						
	subq.l #4,d0				
	jbeq _?L3557				
						
	moveq #-1,d4				
	jbra _?L3659				
_?L3549:					
						
	clr.l d4				
						
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L3657				
_?L3645:					
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L3647				
						
	.align	2				
	.globl	_mflac_picture_description_string
						
_mflac_picture_description_string:		
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),d6			
	move.l 44(sp),d5			
	move.l 48(sp),d4			
						
	clr.l 28(sp)				
	move.l 482(a4),d0			
	move.l 478(a4),d1			
	moveq #28,d3				
	add.l sp,d3				
	lea _miniflac_picture_description_string,a3
	move.l a4,d7				
	add.l #486,d7				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbne _?L3671				
_?L3663:					
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L3660				
						
	move.l d0,482(a4)			
	clr.l 478(a4)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbeq _?L3663				
_?L3671:					
						
	tst.l d0				
	jble _?L3660				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L3660:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_picture_width		
						
_miniflac_picture_width:			
	lea (-28,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 68(sp),a6			
						
	move.l 4(a6),d0				
	jbne _?L3673				
						
	tst.l 76(sp)				
	jbeq _?L3729				
	subq.l #4,sp				
	move.l 76(sp),a0			
	move.b (a0),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3754				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3754:					
	move.l 4(a6),d0				
_?L3673:					
						
	subq.l #1,d0				
	jbeq _?L3755				
						
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
_?L3728:					
	move.l d6,-(sp)				
	pea 60(sp)				
	move.l 80(sp),-(sp)			
	move.l a6,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3681				
	move.l 56(sp),28(a6)			
	move.l 60(sp),24(a6)			
	clr.l 20(a6)				
_?L3682:					
	moveq #4,d2				
	cmp.l (a6),d2				
	jbeq _?L3685				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3682				
_?L3683:					
	move.l 20(a6),d1			
_?L3687:					
	move.l d1,-(sp)				
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr (a5)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L3756				
	move.l 52(a6),d1			
	cmp.l 76(sp),d1				
	jbcs _?L3728				
_?L3762:					
	clr.l d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
_?L3758:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3685:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3757				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d5				
	cmp.l d0,d5				
	jbne _?L3683				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3685				
_?L3688:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3758				
_?L3755:					
	move.l 72(sp),28(a6)			
	move.l 76(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3676:					
	moveq #4,d5				
	cmp.l (a6),d5				
	jbeq _?L3759				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L3676				
_?L3677:					
	move.l 80(sp),a0			
	move.l 20(a6),(a0)			
_?L3765:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3757:					
						
	move.l 154(a6),d0			
						
	moveq #4,d2				
	cmp.l d0,d2				
	jbcs _?L3760				
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L3693				
						
	move.l 162(a6),d0			
						
	move.l 158(a6),40(sp)			
_?L3694:					
						
	cmp.l 40(sp),d0				
	jbcc _?L3698				
	move.l d0,a1				
	addq.l #1,a1				
_?L3724:					
						
	move.b 16(a6),d7			
						
	cmp.b #7,d7				
	jbhi _?L3695				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L3761				
						
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
_?L3695:					
						
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
	jbeq _?L3698				
	move.l d0,a1				
	jbra _?L3724				
_?L3760:					
						
	subq.l #5,d0				
	jbne _?L3688				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3725				
_?L3721:					
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 76(sp),d1				
	jbcs _?L3728				
	jbra _?L3762				
_?L3725:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 84(sp)				
	jbeq _?L3726				
						
	move.l 84(sp),a0			
	move.l d1,(a0)				
_?L3726:					
						
	moveq #6,d0				
	move.l d0,154(a6)			
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3758				
_?L3729:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L3693:					
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbne _?L3763				
_?L3700:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3721				
						
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
	jbra _?L3694				
_?L3761:					
						
	move.l d2,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 76(sp),d1				
	jbcs _?L3728				
	jbra _?L3762				
_?L3681:					
	move.l 52(a6),d1			
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3758				
_?L3759:					
	lea _miniflac_sync_internal,a3		
_?L3679:					
	moveq #6,d2				
	cmp.l 114(a6),d2			
	jbeq _?L3764				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3677				
	moveq #4,d1				
	cmp.l (a6),d1				
	jbeq _?L3679				
	moveq #-1,d4				
	move.l 80(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3765				
_?L3698:					
						
	moveq #5,d0				
	move.l d0,154(a6)			
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3721				
	jbra _?L3725				
_?L3763:					
						
	moveq #2,d2				
	cmp.l d0,d2				
	jbne _?L3701				
						
	move.l 158(a6),a2			
						
	move.l 162(a6),d7			
_?L3702:					
						
	cmp.l d7,a2				
	jbls _?L3722				
						
	move.b 16(a6),d1			
	move.w d1,a1				
_?L3710:					
						
	move.w a1,d0				
	cmp.b #7,d0				
	jbhi _?L3766				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L3713				
						
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
_?L3703:					
						
	move.b d0,16(a6)			
	clr.l d1				
						
	tst.b d0				
	jbeq _?L3731				
						
	move.b d0,d1				
						
	move.w #64,a0				
	sub.l d1,a0				
						
	moveq #32,d5				
	sub.l d1,d5				
	jbmi _?L3707				
	moveq #-1,d2				
	lsr.l d5,d2				
	clr.l d1				
						
	and.l 44(sp),d1				
	and.l 48(sp),d2				
_?L3706:					
	move.l d1,8(a6)				
	move.l d2,12(a6)			
						
	addq.l #1,d7				
	move.l d7,162(a6)			
						
	cmp.l d7,a2				
	jbeq _?L3722				
	move.w a1,d1				
	cmp.b #7,d1				
	jbhi _?L3732				
						
	move.l 24(a6),48(sp)			
						
	clr.l d2				
	move.b d0,d2				
	move.w #64,a1				
	sub.l d2,a1				
						
	move.w #32,a0				
	sub.l d2,a0				
	tst.l a0				
	jblt _?L3711				
	moveq #-1,d2				
	move.l a0,d5				
	lsr.l d5,d2				
	move.l d2,40(sp)			
	clr.l 44(sp)				
_?L3716:					
						
	move.l 20(a6),d2			
						
	cmp.l 48(sp),d2				
	jbcc _?L3713				
						
	move.l 28(a6),a0			
						
	move.l d2,d5				
	addq.l #1,d5				
	move.l d5,20(a6)			
						
	move.b (a0,d2.l),d5			
						
	move.l 8(a6),a0				
	move.l 12(a6),a1			
						
	addq.l #1,32(a6)			
						
	move.b d0,16(a6)			
						
	jbeq _?L3714				
						
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
						
	cmp.l a2,d7				
	jbcs _?L3716				
_?L3722:					
						
	moveq #3,d1				
	move.l d1,154(a6)			
	jbra _?L3700				
_?L3713:					
						
	move.l d2,-(sp)				
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 76(sp),d1				
	jbcs _?L3728				
	jbra _?L3762				
_?L3764:					
	move.l 84(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 80(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3765				
_?L3701:					
						
	subq.l #1,d0				
	move.l #_miniflac_bitreader_fill_nocrc,d7
	tst.l d0				
	jbeq _?L3719				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_fill_nocrc,d7
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3721				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,154(a6)			
_?L3719:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3721				
						
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
	jbra _?L3702				
_?L3766:					
						
	move.w a1,d0				
	subq.b #8,d0				
						
	move.l 8(a6),44(sp)			
	move.l 12(a6),48(sp)			
	jbra _?L3703				
_?L3731:					
	clr.l d2				
	jbra _?L3706				
_?L3714:					
						
	clr.l 8(a6)				
	clr.l 12(a6)				
						
	addq.l #1,d7				
	move.l d7,162(a6)			
						
	cmp.l a2,d7				
	jbcs _?L3716				
						
	moveq #3,d1				
	move.l d1,154(a6)			
	jbra _?L3700				
_?L3711:					
						
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
	jbra _?L3716				
_?L3732:					
						
	move.w d0,a1				
	jbra _?L3710				
_?L3756:					
						
	move.l 52(a6),d1			
	move.l d0,d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L3758				
_?L3707:					
						
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
	jbra _?L3706				
						
	.align	2				
	.globl	_mflac_picture_width		
						
_mflac_picture_width:				
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_picture_width,a4		
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L3778				
_?L3770:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L3767				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L3770				
_?L3778:					
						
	tst.l d0				
	jble _?L3767				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L3767:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_picture_height	
						
_miniflac_picture_height:			
	lea (-24,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 64(sp),a4			
	move.l 68(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L3780				
						
	tst.l 72(sp)				
	jbeq _?L3815				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3842				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L3842:					
	move.l 4(a4),d0				
_?L3780:					
						
	subq.l #1,d0				
	jbeq _?L3843				
						
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
_?L3814:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3792				
	move.l 52(sp),28(a4)			
	move.l 56(sp),24(a4)			
	clr.l 20(a4)				
_?L3793:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3796				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3793				
_?L3794:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L3844				
_?L3810:					
	move.l 52(a4),d1			
	cmp.l 72(sp),d1				
	jbcs _?L3814				
_?L3849:					
	clr.l d4				
	move.l 76(sp),a0			
	move.l d1,(a0)				
_?L3846:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L3796:					
	moveq #6,d1				
	cmp.l 114(a4),d1			
	jbeq _?L3845				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3794				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3796				
_?L3797:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L3846				
_?L3843:					
	move.l d5,28(a4)			
	move.l 72(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3783:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3847				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3783				
_?L3784:					
	move.l 76(sp),a0			
	move.l 20(a4),(a0)			
_?L3852:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L3845:					
						
	move.l 154(a4),d0			
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L3848				
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbne _?L3837				
	move.l #_miniflac_bitreader_fill_nocrc,40(sp)
_?L3802:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l 48(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3805				
						
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
	jbeq _?L3811				
_?L3805:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 72(sp),d1				
	jbcs _?L3814				
	jbra _?L3849				
_?L3848:					
						
	subq.l #6,d0				
	jbne _?L3797				
	move.l #_miniflac_bitreader_fill_nocrc,40(sp)
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l 48(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3805				
_?L3811:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 80(sp)				
	jbeq _?L3812				
						
	move.l 80(sp),a0			
	move.l d1,(a0)				
_?L3812:					
						
	moveq #7,d0				
	move.l d0,154(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L3846				
_?L3815:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (24,sp),sp				
	rts					
_?L3837:					
						
	subq.l #4,d0				
	jbne _?L3803				
_?L3808:					
						
	move.l 162(a4),d0			
						
	move.l 158(a4),48(sp)			
						
	cmp.l 48(sp),d0				
	jbcc _?L3850				
	addq.l #1,d0				
	move.l d0,44(sp)			
	move.l #_miniflac_bitreader_fill_nocrc,40(sp)
_?L3806:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l 48(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3805				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l 44(sp),162(a4)			
						
	move.l 44(sp),d0			
	addq.l #1,d0				
	move.l 44(sp),a0			
	cmp.l 48(sp),a0				
	jbeq _?L3807				
	move.l d0,44(sp)			
	jbra _?L3806				
_?L3792:					
						
	move.l 52(a4),d1			
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L3846				
_?L3847:					
	lea _miniflac_sync_internal,a3		
_?L3786:					
	moveq #6,d0				
	cmp.l 114(a4),d0			
	jbeq _?L3851				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3784				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3786				
	moveq #-1,d4				
_?L3854:					
	move.l 76(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3852				
_?L3803:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_description_length
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3808				
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbeq _?L3810				
	jbra _?L3844				
_?L3851:					
						
	move.l 154(a4),d0			
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L3853				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3784				
_?L3789:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3816				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 80(sp)				
	jbeq _?L3791				
						
	move.l 80(sp),a0			
	move.l d1,(a0)				
_?L3791:					
						
	moveq #7,d0				
	move.l d0,154(a4)			
	moveq #1,d4				
						
	move.l 76(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3852				
_?L3853:					
						
	subq.l #6,d0				
	jbeq _?L3789				
						
	moveq #-1,d4				
	jbra _?L3854				
_?L3850:					
	move.l #_miniflac_bitreader_fill_nocrc,40(sp)
_?L3807:					
						
	moveq #5,d0				
	move.l d0,154(a4)			
	jbra _?L3802				
_?L3816:					
						
	clr.l d4				
						
	move.l 76(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3852				
_?L3844:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 76(sp),a0			
	move.l d1,(a0)				
	jbra _?L3846				
						
	.align	2				
	.globl	_mflac_picture_height		
						
_mflac_picture_height:				
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_picture_height,a4		
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L3866				
_?L3858:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L3855				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L3858				
_?L3866:					
						
	tst.l d0				
	jble _?L3855				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L3855:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_picture_colordepth	
						
_miniflac_picture_colordepth:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L3868				
						
	tst.l 60(sp)				
	jbeq _?L3895				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3911				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3911:					
	move.l 4(a4),d0				
_?L3868:					
						
	subq.l #1,d0				
	jbeq _?L3912				
						
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
_?L3894:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3876				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L3877:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3880				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3877				
_?L3878:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L3913				
_?L3890:					
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L3894				
_?L3919:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L3915:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3880:					
	moveq #6,d1				
	cmp.l 114(a4),d1			
	jbeq _?L3914				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3878				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3880				
_?L3881:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3915				
_?L3912:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3871:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3916				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3871				
_?L3872:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L3921:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3914:					
						
	move.l 154(a4),d0			
						
	cmp.l d0,d1				
	jbcs _?L3917				
						
	subq.l #6,d0				
	jbne _?L3886				
_?L3889:					
						
	pea 32.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L3891				
						
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
	jbeq _?L3918				
_?L3891:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L3894				
	jbra _?L3919				
_?L3917:					
						
	subq.l #7,d0				
	jbne _?L3881				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3891				
_?L3918:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L3892				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L3892:					
						
	moveq #8,d0				
	move.l d0,154(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3915				
_?L3895:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3886:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3889				
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbeq _?L3890				
	jbra _?L3913				
_?L3876:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3915				
_?L3916:					
	lea _miniflac_sync_internal,a3		
_?L3874:					
	moveq #6,d0				
	cmp.l 114(a4),d0			
	jbeq _?L3920				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3872				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3874				
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3921				
_?L3920:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_colordepth	
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L3921				
_?L3913:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3915				
						
	.align	2				
	.globl	_mflac_picture_colordepth	
						
_mflac_picture_colordepth:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_picture_colordepth,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L3933				
_?L3925:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L3922				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L3925				
_?L3933:					
						
	tst.l d0				
	jble _?L3922				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L3922:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_picture_totalcolors	
						
_miniflac_picture_totalcolors:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L3935				
						
	tst.l 60(sp)				
	jbeq _?L3968				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3995				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3995:					
	move.l 4(a4),d0				
_?L3935:					
						
	subq.l #1,d0				
	jbeq _?L3996				
						
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
_?L3967:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3947				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L3948:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3951				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3948				
_?L3949:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L3997				
_?L3963:					
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L3967				
_?L4003:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L3999:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3951:					
	moveq #6,d1				
	cmp.l 114(a4),d1			
	jbeq _?L3998				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3949				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L3951				
_?L3952:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3999				
_?L3996:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3938:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L4000				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L3938				
_?L3939:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L4005:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L3998:					
						
	move.l 154(a4),d0			
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcs _?L4001				
						
	moveq #7,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbne _?L4002				
_?L3957:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L3959				
						
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
	jbeq _?L3964				
_?L3959:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L3967				
	jbra _?L4003				
_?L4001:					
						
	subq.l #8,d0				
	jbne _?L3952				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3959				
_?L3964:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L3965				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L3965:					
						
	moveq #9,d0				
	move.l d0,154(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3999				
_?L3968:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4002:					
						
	subq.l #6,d0				
	jbne _?L3958				
_?L3961:					
						
	pea 32.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L3959				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #7,d0				
	move.l d0,154(a4)			
	move.l 36(sp),a1			
	jbra _?L3957				
_?L3947:					
						
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3999				
_?L4000:					
	lea _miniflac_sync_internal,a3		
_?L3941:					
	moveq #6,d0				
	cmp.l 114(a4),d0			
	jbeq _?L4004				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3939				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L3941				
	moveq #-1,d4				
_?L4007:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4005				
_?L3958:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3961				
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbeq _?L3963				
	jbra _?L3997				
_?L4004:					
						
	move.l 154(a4),d0			
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcs _?L4006				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_colordepth	
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L3939				
_?L3944:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3969				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L3946				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L3946:					
						
	moveq #9,d0				
	move.l d0,154(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4005				
_?L4006:					
						
	subq.l #8,d0				
	jbeq _?L3944				
						
	moveq #-1,d4				
	jbra _?L4007				
_?L3969:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4005				
_?L3997:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L3999				
						
	.align	2				
	.globl	_mflac_picture_totalcolors	
						
_mflac_picture_totalcolors:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_picture_totalcolors,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L4019				
_?L4011:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L4008				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L4011				
_?L4019:					
						
	tst.l d0				
	jble _?L4008				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L4008:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_picture_length	
						
_miniflac_picture_length:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L4021				
						
	tst.l 60(sp)				
	jbeq _?L4052				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4073				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4073:					
	move.l 4(a4),d0				
_?L4021:					
						
	subq.l #1,d0				
	jbeq _?L4074				
						
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
_?L4051:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4029				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L4030:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L4033				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4030				
_?L4031:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L4075				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L4051				
_?L4081:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L4077:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4033:					
	moveq #6,d1				
	cmp.l 114(a4),d1			
	jbeq _?L4076				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4031				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L4033				
_?L4034:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4077				
_?L4074:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4024:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L4078				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4024				
_?L4025:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L4083:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4076:					
						
	move.l 154(a4),d0			
						
	moveq #8,d1				
	cmp.l d0,d1				
	jbcs _?L4079				
						
	moveq #8,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbne _?L4080				
_?L4039:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L4042				
						
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
	jbeq _?L4048				
_?L4042:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L4051				
	jbra _?L4081				
_?L4079:					
						
	moveq #9,d1				
	cmp.l d0,d1				
	jbne _?L4034				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4042				
_?L4048:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,158(a4)			
						
	clr.l 162(a4)				
						
	tst.l 68(sp)				
	jbeq _?L4049				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L4049:					
						
	moveq #10,d0				
	move.l d0,154(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4077				
_?L4052:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4080:					
						
	moveq #7,d1				
	lea _miniflac_bitreader_fill_nocrc,a1	
	cmp.l d0,d1				
	jbeq _?L4040				
						
	subq.l #6,d0				
	jbeq _?L4044				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4031				
_?L4044:					
						
	pea 32.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L4042				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #7,d0				
	move.l d0,154(a4)			
	move.l 36(sp),a1			
_?L4040:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L4042				
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #8,d1				
	move.l d1,154(a4)			
	move.l 36(sp),a1			
	jbra _?L4039				
_?L4029:					
						
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4077				
_?L4078:					
	lea _miniflac_sync_internal,a3		
_?L4027:					
	moveq #6,d0				
	cmp.l 114(a4),d0			
	jbeq _?L4082				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4025				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L4027				
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4083				
_?L4082:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a4)				
	jbsr _miniflac_picture_read_length	
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4083				
_?L4075:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4077				
						
	.align	2				
	.globl	_mflac_picture_length		
						
_mflac_picture_length:				
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_picture_length,a4		
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L4095				
_?L4087:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L4084				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L4087				
_?L4095:					
						
	tst.l d0				
	jble _?L4084				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L4084:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_picture_data		
						
_miniflac_picture_data:				
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L4097				
						
	tst.l 64(sp)				
	jbeq _?L4163				
	subq.l #4,sp				
	move.l 64(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4200				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4200:					
	move.l 4(a3),d0				
_?L4097:					
						
	subq.l #1,d0				
	jbeq _?L4201				
						
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
_?L4162:					
	move.l d5,-(sp)				
	pea 48(sp)				
	move.l 68(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4118				
	move.l 44(sp),28(a3)			
	move.l 48(sp),24(a3)			
	clr.l 20(a3)				
_?L4119:					
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L4122				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4119				
_?L4120:					
	move.l 20(a3),d1			
_?L4124:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbne _?L4202				
_?L4135:					
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L4162				
_?L4210:					
	clr.l d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L4204:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4122:					
	moveq #6,d0				
	cmp.l 114(a3),d0			
	jbeq _?L4203				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4120				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L4122				
_?L4125:					
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4204				
_?L4201:					
	move.l 60(sp),28(a3)			
	move.l 64(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L4100:					
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L4205				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L4100				
_?L4101:					
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
_?L4214:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4203:					
						
	move.l 154(a3),d0			
						
	moveq #9,d1				
	cmp.l d0,d1				
	jbcs _?L4206				
						
	moveq #9,d1				
	move.l #_miniflac_bitreader_fill_nocrc,d6
	cmp.l d0,d1				
	jbne _?L4207				
_?L4131:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4133				
						
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
	jbeq _?L4129				
	sub.l a1,a1				
	tst.l 72(sp)				
	jbeq _?L4208				
_?L4138:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L4209				
						
	move.l 20(a3),36(sp)			
						
	move.l 36(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L4141				
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
_?L4149:					
						
	move.b d0,16(a3)			
						
	clr.l d6				
	move.b d0,d6				
						
	jbeq _?L4165				
						
	move.w #64,a2				
	sub.l d6,a2				
						
	moveq #32,d0				
	sub.l d6,d0				
	jbmi _?L4152				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,a0				
	clr.l d7				
						
	and.l d2,d7				
	move.l a0,d0				
	and.l 36(sp),d0				
_?L4151:					
	move.l d7,8(a3)				
	move.l d0,12(a3)			
						
	cmp.l 76(sp),a1				
	jbcc _?L4154				
						
	move.w #-32,a0				
	add.l d6,a0				
	tst.l a0				
	jblt _?L4155				
	move.l a0,d0				
	lsr.l d0,d2				
						
	move.l 72(sp),a0			
	move.b d2,(a0,a1.l)			
_?L4154:					
						
	move.l 162(a3),a1			
	addq.l #1,a1				
	move.l a1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l a1,d0				
	jbhi _?L4138				
_?L4137:					
						
	tst.l 80(sp)				
	jbeq _?L4197				
						
	move.l 76(sp),d1			
	cmp.l d1,d0				
	jbcc _?L4161				
	move.l d0,d1				
_?L4161:					
						
	move.l 80(sp),a2			
	move.l d1,(a2)				
_?L4197:					
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4204				
_?L4206:					
						
	moveq #10,d2				
	cmp.l d0,d2				
	jbne _?L4125				
						
	move.l 162(a3),a1			
						
	move.l 158(a3),d0			
						
	cmp.l d0,a1				
	jbeq _?L4129				
						
	jbcc _?L4137				
	tst.l 72(sp)				
	jbne _?L4138				
	jbra _?L4208				
_?L4141:					
						
	move.l 36(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L4162				
	jbra _?L4210				
_?L4165:					
	clr.l d7				
	clr.l d0				
	jbra _?L4151				
_?L4152:					
						
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
	jbra _?L4151				
_?L4155:					
						
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
	jbra _?L4154				
_?L4163:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4208:					
						
	move.w #-1,a1				
_?L4147:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L4211				
						
	move.l 20(a3),36(sp)			
						
	move.l 36(sp),d2			
	cmp.l 24(a3),d2				
	jbcc _?L4141				
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
_?L4140:					
						
	move.b d0,16(a3)			
						
	jbeq _?L4142				
						
	and.l #255,d0				
						
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d6				
	sub.l d0,d6				
	jbmi _?L4143				
	move.l a1,d0				
	lsr.l d6,d0				
	clr.l d6				
						
	and.l d2,d6				
	move.l d6,8(a3)				
	move.l a0,d1				
	and.l d0,d1				
	move.l d1,12(a3)			
_?L4196:					
						
	move.l 162(a3),d1			
	addq.l #1,d1				
	move.l d1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d1,d0				
	jbhi _?L4147				
	jbra _?L4137				
_?L4207:					
						
	subq.l #8,d0				
	jbne _?L4212				
_?L4132:					
						
	pea 32.w				
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_fill_nocrc,d6
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4133				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #9,d0				
	move.l d0,154(a3)			
	jbra _?L4131				
_?L4142:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 162(a3),d1			
	addq.l #1,d1				
	move.l d1,162(a3)			
						
	move.l 158(a3),d0			
						
	cmp.l d1,d0				
	jbhi _?L4147				
	jbra _?L4137				
_?L4143:					
						
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
	jbra _?L4196				
_?L4118:					
						
	move.l 52(a3),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4204				
_?L4205:					
	lea _miniflac_sync_internal,a4		
_?L4103:					
	moveq #6,d0				
	cmp.l 114(a3),d0			
	jbeq _?L4213				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4101				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L4103				
	moveq #-1,d4				
_?L4216:					
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L4214				
_?L4209:					
						
	move.l 8(a3),d2				
	move.l 12(a3),36(sp)			
						
	subq.b #8,d0				
	jbra _?L4149				
_?L4133:					
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 64(sp),d1				
	jbcs _?L4162				
	jbra _?L4210				
_?L4212:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a3)				
	jbsr _miniflac_picture_read_colordepth	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4132				
						
	move.l 20(a3),d1			
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbeq _?L4135				
	jbra _?L4202				
_?L4211:					
						
	move.l 8(a3),d2				
	move.l 12(a3),a0			
						
	subq.b #8,d0				
	jbra _?L4140				
_?L4129:					
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
						
	moveq #2,d4				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4204				
_?L4213:					
						
	move.l 154(a3),d0			
						
	moveq #9,d1				
	cmp.l d0,d1				
	jbcs _?L4215				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 154(a3)				
	jbsr _miniflac_picture_read_length	
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4101				
_?L4106:					
						
	move.l 162(a3),d4			
						
	move.l 158(a3),d5			
						
	cmp.l d4,d5				
	jbeq _?L4164				
						
	jbls _?L4108				
	move.l #_miniflac_bitreader_fill_nocrc,d6
						
	lea _miniflac_bitreader_read,a4		
	tst.l 72(sp)				
	jbeq _?L4111				
_?L4109:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d6,a2				
	jbsr (a2)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4110				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	cmp.l 76(sp),d4				
	jbcc _?L4114				
						
	move.l 72(sp),a0			
	move.b d1,(a0,d4.l)			
_?L4114:					
						
	move.l 162(a3),d4			
	addq.l #1,d4				
	move.l d4,162(a3)			
						
	move.l 158(a3),d5			
						
	cmp.l d4,d5				
	jbhi _?L4109				
_?L4108:					
						
	tst.l 80(sp)				
	jbeq _?L4116				
						
	move.l 76(sp),d0			
	cmp.l d0,d5				
	jbcc _?L4117				
	move.l d5,d0				
_?L4117:					
						
	move.l 80(sp),a2			
	move.l d0,(a2)				
_?L4116:					
						
	moveq #1,d4				
						
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L4214				
_?L4111:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4110				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 162(a3),d0			
	addq.l #1,d0				
	move.l d0,162(a3)			
						
	cmp.l d5,d0				
	jbcs _?L4111				
	jbra _?L4108				
_?L4215:					
						
	moveq #10,d2				
	cmp.l d0,d2				
	jbeq _?L4106				
						
	moveq #-1,d4				
	jbra _?L4216				
_?L4110:					
						
	clr.l d4				
						
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L4214				
_?L4164:					
						
	moveq #2,d4				
						
	move.l 68(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L4214				
_?L4202:					
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4204				
						
	.align	2				
	.globl	_mflac_picture_data		
						
_mflac_picture_data:				
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),d6			
	move.l 44(sp),d5			
	move.l 48(sp),d4			
						
	clr.l 28(sp)				
	move.l 482(a4),d0			
	move.l 478(a4),d1			
	moveq #28,d3				
	add.l sp,d3				
	lea _miniflac_picture_data,a3		
	move.l a4,d7				
	add.l #486,d7				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbne _?L4228				
_?L4220:					
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L4217				
						
	move.l d0,482(a4)			
	clr.l 478(a4)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbeq _?L4220				
_?L4228:					
						
	tst.l d0				
	jble _?L4217				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L4217:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_catalog_length
						
_miniflac_cuesheet_catalog_length:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a6			
	move.l 56(sp),a4			
	move.l 60(sp),d5			
						
	move.l 4(a6),d0				
	jbne _?L4230				
						
	tst.l d5				
	jbeq _?L4252				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4261				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4261:					
	move.l 4(a6),d0				
_?L4230:					
						
	subq.l #1,d0				
	jbeq _?L4262				
						
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
_?L4251:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4240				
	move.l 40(sp),28(a6)			
	move.l 44(sp),24(a6)			
	clr.l 20(a6)				
_?L4241:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4244				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4241				
_?L4242:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	move.l 52(a6),d1			
	tst.l d0				
	jbne _?L4263				
	cmp.l d5,d1				
	jbcs _?L4251				
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L4265:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4244:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L4264				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4242				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4244				
_?L4245:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4265				
_?L4262:					
	move.l a4,28(a6)			
	move.l d5,24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4233:					
	moveq #4,d1				
	cmp.l (a6),d1				
	jbeq _?L4266				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4233				
_?L4234:					
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
_?L4268:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4264:					
						
	tst.l 166(a6)				
	jbne _?L4245				
						
	tst.l 68(sp)				
	jbeq _?L4258				
						
	move.l 68(sp),a0			
	move.l #128,(a0)			
_?L4258:					
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4265				
_?L4252:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4240:					
	move.l 52(a6),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4265				
_?L4266:					
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4236:					
	moveq #5,d0				
	cmp.l 114(a6),d0			
	jbeq _?L4267				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4234				
	moveq #4,d1				
	cmp.l (a6),d1				
	jbeq _?L4236				
_?L4238:					
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L4268				
_?L4267:					
						
	tst.l 166(a6)				
	jbne _?L4238				
						
	tst.l 68(sp)				
	jbeq _?L4239				
						
	move.l 68(sp),a0			
	move.l #128,(a0)			
_?L4239:					
						
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L4268				
_?L4263:					
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4265				
						
	.align	2				
	.globl	_mflac_cuesheet_catalog_length	
						
_mflac_cuesheet_catalog_length:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_cuesheet_catalog_length,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L4280				
_?L4272:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L4269				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L4272				
_?L4280:					
						
	tst.l d0				
	jble _?L4269				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L4269:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L4282				
						
	tst.l d3				
	jbeq _?L4289				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d7				
						
	moveq #1,d0				
	cmp.l d7,d0				
	jbeq _?L4293				
	move.l d7,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4293:					
	move.l 4(a3),d0				
_?L4282:					
						
	subq.l #1,d0				
	jbeq _?L4294				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l a4,60(a3)			
	move.l d3,56(a3)			
	clr.l 52(a3)				
	lea _miniflac_oggfunction_start,a5	
	lea _miniflac_oggfunction_end,a6	
_?L4288:					
	pea 44(sp)				
	pea 44(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d7				
	moveq #1,d0				
	cmp.l d7,d0				
	jbne _?L4285				
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
	jbne _?L4287				
	cmp.l d3,d1				
	jbcs _?L4288				
_?L4287:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L4295:					
	move.l d7,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4294:					
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
_?L4289:					
						
	clr.l d7				
						
	move.l d7,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4285:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L4295				
						
	.align	2				
	.globl	_mflac_cuesheet_catalog_string	
						
_mflac_cuesheet_catalog_string:			
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),d6			
	move.l 44(sp),d5			
	move.l 48(sp),d4			
						
	clr.l 28(sp)				
	move.l 482(a4),d0			
	move.l 478(a4),d1			
	moveq #28,d3				
	add.l sp,d3				
	lea _miniflac_cuesheet_catalog_string,a3
	move.l a4,d7				
	add.l #486,d7				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbne _?L4307				
_?L4299:					
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L4296				
						
	move.l d0,482(a4)			
	clr.l 478(a4)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbeq _?L4299				
_?L4307:					
						
	tst.l d0				
	jble _?L4296				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L4296:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_leadin	
						
_miniflac_cuesheet_leadin:			
	lea (-32,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 72(sp),a6			
						
	move.l 4(a6),d0				
	jbne _?L4309				
						
	tst.l 80(sp)				
	jbeq _?L4377				
	subq.l #4,sp				
	move.l 80(sp),a0			
	move.b (a0),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4413				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L4413:					
	move.l 4(a6),d0				
_?L4309:					
						
	subq.l #1,d0				
	jbeq _?L4414				
						
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
_?L4376:					
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l 84(sp),-(sp)			
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4345				
	move.l 60(sp),28(a6)			
	move.l 64(sp),24(a6)			
	clr.l 20(a6)				
_?L4346:					
	moveq #4,d2				
	cmp.l (a6),d2				
	jbeq _?L4349				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4346				
_?L4347:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,52(sp)			
	jbsr (a4)				
	addq.l #8,sp				
	move.l 44(sp),d0			
	jbne _?L4415				
	move.l 52(a6),d1			
	cmp.l 80(sp),d1				
	jbcs _?L4376				
_?L4419:					
	clr.l d4				
	move.l 84(sp),a0			
	move.l d1,(a0)				
_?L4417:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L4349:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L4416				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d7				
	cmp.l d0,d7				
	jbne _?L4347				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4349				
_?L4350:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d4				
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L4417				
_?L4414:					
	move.l 76(sp),28(a6)			
	move.l 80(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4312:					
	moveq #4,d5				
	cmp.l (a6),d5				
	jbeq _?L4418				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L4312				
_?L4410:					
	move.l 20(a6),d2			
_?L4313:					
	move.l 84(sp),a0			
	move.l d2,(a0)				
_?L4423:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L4416:					
						
	move.l 166(a6),d0			
						
	jbeq _?L4352				
	subq.l #1,d0				
	jbne _?L4350				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L4373				
_?L4421:					
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 80(sp),d1				
	jbcs _?L4376				
	jbra _?L4419				
_?L4352:					
						
	move.l 170(a6),a1			
						
	cmp.w #128,a1				
	jbcc _?L4355				
						
	move.b 16(a6),d7			
	move.w d7,a2				
_?L4356:					
						
	move.w a2,d7				
	cmp.b #7,d7				
	jbhi _?L4420				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L4366				
						
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
_?L4357:					
						
	move.b d7,16(a6)			
						
	jbeq _?L4387				
						
	clr.l d0				
	move.b d7,d0				
						
	move.w #64,a0				
	sub.l d0,a0				
						
	moveq #32,d1				
	sub.l d0,d1				
	move.l d1,52(sp)			
	jbmi _?L4361				
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
_?L4360:					
	move.l a0,8(a6)				
	move.l d1,12(a6)			
						
	addq.l #1,a1				
	move.l a1,170(a6)			
						
	cmp.w #128,a1				
	jbeq _?L4355				
	move.w a2,d1				
	cmp.b #7,d1				
	jbhi _?L4388				
						
	move.l 24(a6),a2			
						
	clr.l d1				
	move.b d7,d1				
	moveq #64,d2				
	sub.l d1,d2				
						
	moveq #32,d0				
	sub.l d1,d0				
	jbmi _?L4364				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,52(sp)			
	clr.l 48(sp)				
_?L4370:					
						
	move.l 20(a6),d2			
						
	cmp.l d2,a2				
	jbls _?L4366				
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a6)			
						
	move.l 28(a6),a0			
	move.b (a0,d2.l),d2			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
						
	addq.l #1,32(a6)			
						
	move.b d7,16(a6)			
						
	jbeq _?L4367				
						
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
	jbne _?L4370				
_?L4355:					
						
	clr.l 170(a6)				
						
	moveq #1,d0				
	move.l d0,166(a6)			
_?L4424:					
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4421				
_?L4373:					
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 88(sp)				
	jbeq _?L4374				
						
	move.l 88(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L4374:					
						
	moveq #2,d0				
	move.l d0,166(a6)			
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L4417				
_?L4377:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L4366:					
	move.l d2,-(sp)				
	move.l a6,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 80(sp),d1				
	jbcs _?L4376				
	jbra _?L4419				
_?L4345:					
	move.l 52(a6),d1			
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L4417				
_?L4418:					
	lea _miniflac_sync_internal,a3		
_?L4315:					
	moveq #5,d0				
	cmp.l 114(a6),d0			
	jbeq _?L4422				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d6				
	cmp.l d0,d6				
	jbne _?L4410				
	moveq #4,d7				
	cmp.l (a6),d7				
	jbeq _?L4315				
_?L4319:					
	move.l 20(a6),d2			
						
	moveq #-1,d4				
						
	move.l 84(sp),a0			
	move.l d2,(a0)				
	jbra _?L4423				
_?L4420:					
						
	move.w a2,d7				
	subq.b #8,d7				
						
	move.l 8(a6),40(sp)			
	move.l 12(a6),d2			
	jbra _?L4357				
_?L4387:					
	sub.l a0,a0				
	clr.l d1				
	jbra _?L4360				
_?L4367:					
						
	clr.l 8(a6)				
	clr.l 12(a6)				
						
	addq.l #1,a1				
	move.l a1,170(a6)			
						
	cmp.w #128,a1				
	jbne _?L4370				
						
	clr.l 170(a6)				
						
	moveq #1,d0				
	move.l d0,166(a6)			
	jbra _?L4424				
_?L4364:					
						
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
	jbra _?L4370				
_?L4361:					
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
	jbra _?L4360				
_?L4422:					
						
	move.l 166(a6),d0			
						
	jbeq _?L4318				
	subq.l #1,d0				
	jbne _?L4319				
						
	move.b 16(a6),d4			
_?L4320:					
						
	cmp.b #63,d4				
	jbhi _?L4342				
	move.l 24(a6),a0			
_?L4336:					
						
	move.l 20(a6),d5			
						
	cmp.l a0,d5				
	jbcc _?L4380				
						
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
	jbhi _?L4342				
	cmp.l d2,a0				
	jbls _?L4409				
						
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
	jbhi _?L4342				
	cmp.l d7,a0				
	jbls _?L4386				
						
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
	jbhi _?L4342				
	cmp.l d2,a0				
	jbls _?L4409				
						
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
	jbhi _?L4342				
	cmp.l d7,a0				
	jbls _?L4386				
						
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
	jbhi _?L4342				
	cmp.l d2,a0				
	jbls _?L4409				
						
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
	jbhi _?L4342				
	cmp.l d7,a0				
	jbls _?L4386				
						
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
	jbhi _?L4342				
	cmp.l d2,a0				
	jbls _?L4409				
						
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
_?L4342:					
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 88(sp)				
	jbeq _?L4341				
						
	move.l 88(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L4341:					
						
	moveq #2,d0				
	move.l d0,166(a6)			
						
	move.l 20(a6),d2			
	moveq #1,d4				
	move.l 84(sp),a0			
	move.l d2,(a0)				
	jbra _?L4423				
_?L4386:					
						
	move.l d7,d2				
_?L4409:					
						
	clr.l d4				
						
	move.l 84(sp),a0			
	move.l d2,(a0)				
	jbra _?L4423				
_?L4318:					
						
	move.l 170(a6),d5			
						
	move.b 16(a6),d4			
						
	cmp.l #128,d5				
	jbcc _?L4322				
	addq.l #1,d5				
	move.b d4,d7				
						
	moveq #-1,d6				
	move.w #-2,a1				
_?L4329:					
						
	cmp.b #7,d4				
	jbhi _?L4425				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L4409				
						
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
_?L4323:					
						
	move.b d4,16(a6)			
						
	jbeq _?L4378				
						
	clr.l d0				
	move.b d4,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L4326				
	move.l d6,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	move.l a2,d2				
	and.l d2,d1				
	move.l a0,d2				
	and.l d2,d0				
_?L4325:					
	move.l d1,8(a6)				
	move.l d0,12(a6)			
						
	move.l d5,170(a6)			
						
	cmp.l #128,d5				
	jbeq _?L4322				
	move.l d5,d0				
	addq.l #1,d0				
	cmp.b #7,d7				
	jbhi _?L4379				
						
	move.l 24(a6),a0			
						
	clr.l d2				
	move.b d4,d2				
	moveq #64,d0				
	sub.l d2,d0				
						
	moveq #32,d1				
	sub.l d2,d1				
	jbmi _?L4330				
	moveq #-1,d6				
	lsr.l d1,d6				
	clr.l d7				
_?L4337:					
						
	move.l 20(a6),d2			
						
	cmp.l a0,d2				
	jbcc _?L4409				
						
	move.l 28(a6),a1			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a6)			
						
	move.b (a1,d2.l),d2			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
						
	addq.l #1,32(a6)			
						
	move.b d4,16(a6)			
						
	jbeq _?L4333				
						
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
	jbne _?L4337				
_?L4322:					
						
	clr.l 170(a6)				
						
	moveq #1,d6				
	move.l d6,166(a6)			
	jbra _?L4320				
_?L4388:					
						
	move.w d7,a2				
	jbra _?L4356				
_?L4425:					
						
	subq.b #8,d4				
						
	move.l 8(a6),a2				
	move.l 12(a6),a0			
	jbra _?L4323				
_?L4333:					
						
	clr.l 8(a6)				
	clr.l 12(a6)				
						
	addq.l #1,d5				
	move.l d5,170(a6)			
						
	cmp.l #128,d5				
	jbne _?L4337				
						
	clr.l 170(a6)				
						
	moveq #1,d5				
	move.l d5,166(a6)			
	jbra _?L4336				
_?L4330:					
						
	moveq #-1,d7				
	moveq #31,d2				
	sub.l d0,d2				
	moveq #-2,d1				
	lsl.l d2,d1				
	move.l d7,d6				
	lsr.l d0,d6				
	or.l d1,d6				
	lsr.l d0,d7				
	jbra _?L4337				
_?L4378:					
	clr.l d1				
	clr.l d0				
	jbra _?L4325				
_?L4379:					
						
	move.l d0,d5				
	move.b d4,d7				
	jbra _?L4329				
_?L4326:					
						
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
	jbra _?L4325				
_?L4415:					
						
	move.l 52(a6),d1			
	move.l d0,d4				
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L4417				
_?L4380:					
						
	move.l d5,d2				
						
	clr.l d4				
						
	move.l 84(sp),a0			
	move.l d2,(a0)				
	jbra _?L4423				
						
	.align	2				
	.globl	_mflac_cuesheet_leadin		
						
_mflac_cuesheet_leadin:				
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_cuesheet_leadin,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L4437				
_?L4429:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L4426				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L4429				
_?L4437:					
						
	tst.l d0				
	jble _?L4426				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L4426:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_cd_flag	
						
_miniflac_cuesheet_cd_flag:			
	lea (-20,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 60(sp),a4			
	move.l 64(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L4439				
						
	tst.l 68(sp)				
	jbeq _?L4500				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4542				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L4542:					
	move.l 4(a4),d0				
_?L4439:					
						
	subq.l #1,d0				
	jbeq _?L4543				
						
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
_?L4499:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4475				
	move.l 48(sp),28(a4)			
	move.l 52(sp),24(a4)			
	clr.l 20(a4)				
_?L4476:					
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L4479				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4476				
_?L4477:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L4544				
	move.l 52(a4),d1			
	cmp.l 68(sp),d1				
	jbcs _?L4499				
_?L4551:					
	clr.l d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
_?L4546:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L4479:					
	moveq #5,d0				
	cmp.l 114(a4),d0			
	jbeq _?L4545				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4477				
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L4479				
_?L4480:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L4546				
_?L4543:					
	move.l d5,28(a4)			
	move.l 68(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4442:					
	moveq #4,d6				
	cmp.l (a4),d6				
	jbeq _?L4547				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L4442				
_?L4537:					
	move.l 20(a4),d2			
_?L4443:					
	move.l 72(sp),a0			
	move.l d2,(a0)				
_?L4553:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L4545:					
						
	move.l 166(a4),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L4548				
						
	subq.l #1,d0				
	jbeq _?L4549				
						
	move.l 170(a4),d0			
						
	cmp.l #128,d0				
	jbcc _?L4550				
	addq.l #1,d0				
	move.l d0,40(sp)			
	move.l #_miniflac_bitreader_fill_nocrc,44(sp)
_?L4488:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l 52(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4539				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l 40(sp),170(a4)			
						
	addq.l #1,40(sp)			
	cmp.l #129,40(sp)			
	jbne _?L4488				
						
	clr.l 170(a4)				
						
	moveq #1,d2				
	move.l d2,166(a4)			
_?L4485:					
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l 52(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4539				
						
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
	jbeq _?L4492				
_?L4539:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 68(sp),d1				
	jbcs _?L4499				
	jbra _?L4551				
_?L4548:					
						
	subq.l #2,d0				
	jbne _?L4480				
	move.l #_miniflac_bitreader_fill_nocrc,44(sp)
						
	pea 1.w					
	move.l d3,-(sp)				
	move.l 52(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4539				
_?L4492:					
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 76(sp)				
	jbeq _?L4493				
						
	move.l 76(sp),a0			
	move.b d1,(a0)				
_?L4493:					
						
	move.b 16(a4),d0			
	cmp.b #6,d0				
	jbls _?L4494				
						
	subq.b #7,d0				
	move.b d0,16(a4)			
						
	jbeq _?L4504				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L4496				
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
_?L4554:					
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L4546				
_?L4500:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L4549:					
	move.l #_miniflac_bitreader_fill_nocrc,44(sp)
	jbra _?L4485				
_?L4475:					
	move.l 52(a4),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L4546				
_?L4547:					
	lea _miniflac_sync_internal,a3		
_?L4445:					
	moveq #5,d2				
	cmp.l 114(a4),d2			
	jbeq _?L4552				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4537				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L4445				
	move.l 20(a4),d2			
						
	moveq #-1,d4				
_?L4557:					
						
	move.l 72(sp),a0			
	move.l d2,(a0)				
	jbra _?L4553				
_?L4504:					
						
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
	jbra _?L4554				
_?L4552:					
						
	move.l 166(a4),d0			
						
	moveq #1,d6				
	cmp.l d0,d6				
	jbcs _?L4555				
						
	subq.l #1,d0				
	jbeq _?L4450				
						
	move.l 170(a4),d4			
						
	cmp.l #128,d4				
	jbcc _?L4451				
						
	move.b 16(a4),d5			
_?L4452:					
						
	cmp.b #7,d5				
	jbhi _?L4556				
						
	move.l 20(a4),d2			
						
	cmp.l 24(a4),d2				
	jbcc _?L4535				
						
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
_?L4453:					
						
	move.b d0,16(a4)			
						
	jbeq _?L4501				
						
	clr.l d1				
	move.b d0,d1				
						
	moveq #64,d6				
	sub.l d1,d6				
						
	moveq #32,d2				
	sub.l d1,d2				
	jbmi _?L4456				
	moveq #-1,d1				
	lsr.l d2,d1				
	clr.l d2				
						
	move.l a2,d6				
	and.l d6,d2				
	move.l a1,d6				
	and.l d6,d1				
_?L4455:					
	move.l d2,8(a4)				
	move.l d1,12(a4)			
						
	addq.l #1,d4				
	move.l d4,170(a4)			
						
	cmp.l #128,d4				
	jbeq _?L4451				
	cmp.b #7,d5				
	jbhi _?L4502				
						
	move.l 24(a4),d1			
						
	clr.l d5				
	move.b d0,d5				
	moveq #64,d2				
	sub.l d5,d2				
						
	moveq #32,d6				
	sub.l d5,d6				
	jbmi _?L4459				
	moveq #-1,d5				
	lsr.l d6,d5				
	sub.l a2,a2				
_?L4465:					
						
	move.l 20(a4),d2			
						
	cmp.l d1,d2				
	jbcc _?L4535				
						
	move.l 28(a4),a1			
						
	move.l d2,d6				
	addq.l #1,d6				
	move.l d6,20(a4)			
						
	move.b (a1,d2.l),d2			
						
	move.l 8(a4),d6				
	move.l 12(a4),d7			
						
	addq.l #1,32(a4)			
						
	move.b d0,16(a4)			
						
	jbeq _?L4462				
						
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
	jbne _?L4465				
_?L4451:					
						
	clr.l 170(a4)				
						
	moveq #1,d6				
	move.l d6,166(a4)			
_?L4450:					
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l #_miniflac_bitreader_fill_nocrc,52(sp)
	lea _miniflac_bitreader_fill_nocrc,a0	
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4536				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d0				
	move.l d0,166(a4)			
_?L4449:					
						
	pea 1.w					
	move.l d3,-(sp)				
	move.l 52(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4536				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 76(sp)				
	jbeq _?L4470				
						
	move.l 76(sp),a0			
	move.b d1,(a0)				
_?L4470:					
						
	move.b 16(a4),d0			
	cmp.b #6,d0				
	jbls _?L4494				
						
	subq.b #7,d0				
	move.b d0,16(a4)			
						
	jbeq _?L4503				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L4473				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	moveq #3,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),d2			
	moveq #1,d4				
_?L4558:					
	move.l 72(sp),a0			
	move.l d2,(a0)				
	jbra _?L4553				
_?L4555:					
	move.l #_miniflac_bitreader_fill_nocrc,44(sp)
						
	subq.l #2,d0				
	jbeq _?L4449				
						
	move.l 20(a4),d2			
						
	moveq #-1,d4				
	jbra _?L4557				
_?L4496:					
						
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
	jbra _?L4554				
_?L4536:					
	move.l 20(a4),d2			
_?L4535:					
						
	clr.l d4				
						
	move.l 72(sp),a0			
	move.l d2,(a0)				
	jbra _?L4553				
_?L4556:					
						
	move.b d5,d0				
	subq.b #8,d0				
						
	move.l 8(a4),a2				
	move.l 12(a4),a1			
	jbra _?L4453				
_?L4473:					
						
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
	jbra _?L4558				
_?L4503:					
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	moveq #3,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),d2			
	moveq #1,d4				
	jbra _?L4558				
_?L4550:					
	move.l #_miniflac_bitreader_fill_nocrc,44(sp)
						
	clr.l 170(a4)				
						
	moveq #1,d2				
	move.l d2,166(a4)			
	jbra _?L4485				
_?L4544:					
						
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L4546				
_?L4494:					
	jbsr (_miniflac_bitreader_discard?part?0)
_?L4462:					
						
	clr.l 8(a4)				
	clr.l 12(a4)				
						
	addq.l #1,d4				
	move.l d4,170(a4)			
						
	cmp.l #128,d4				
	jbne _?L4465				
						
	clr.l 170(a4)				
						
	moveq #1,d6				
	move.l d6,166(a4)			
	jbra _?L4450				
_?L4459:					
						
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
	jbra _?L4465				
_?L4502:					
						
	move.b d0,d5				
	jbra _?L4452				
_?L4456:					
						
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
	jbra _?L4455				
_?L4501:					
	clr.l d2				
	clr.l d1				
	jbra _?L4455				
						
	.align	2				
	.globl	_mflac_cuesheet_cd_flag		
						
_mflac_cuesheet_cd_flag:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_cuesheet_cd_flag,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L4570				
_?L4562:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L4559				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L4562				
_?L4570:					
						
	tst.l d0				
	jble _?L4559				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L4559:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_tracks	
						
_miniflac_cuesheet_tracks:			
	lea (-32,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 72(sp),a6			
						
	move.l 4(a6),d0				
	jbne _?L4572				
						
	tst.l 80(sp)				
	jbeq _?L4627				
	subq.l #4,sp				
	move.l 80(sp),a0			
	move.b (a0),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4660				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L4660:					
	move.l 4(a6),d0				
_?L4572:					
						
	subq.l #1,d0				
	jbeq _?L4661				
						
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
_?L4626:					
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l 84(sp),-(sp)			
	move.l a6,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4580				
	move.l 60(sp),28(a6)			
	move.l 64(sp),24(a6)			
	clr.l 20(a6)				
_?L4581:					
	moveq #4,d2				
	cmp.l (a6),d2				
	jbeq _?L4584				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4581				
_?L4582:					
	move.l 20(a6),d1			
_?L4586:					
	move.l d1,-(sp)				
	move.l a6,-(sp)				
	move.l d0,52(sp)			
	jbsr (a5)				
	addq.l #8,sp				
	move.l 44(sp),d0			
	jbne _?L4662				
	move.l 52(a6),d1			
	cmp.l 80(sp),d1				
	jbcs _?L4626				
_?L4667:					
	clr.l d4				
	move.l 84(sp),a0			
	move.l d1,(a0)				
_?L4664:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L4584:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L4663				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d7				
	cmp.l d0,d7				
	jbne _?L4582				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L4584				
_?L4587:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d4				
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L4664				
_?L4661:					
	move.l 76(sp),28(a6)			
	move.l 80(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4575:					
	moveq #4,d7				
	cmp.l (a6),d7				
	jbeq _?L4665				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L4575				
_?L4576:					
	move.l 84(sp),a0			
	move.l 20(a6),(a0)			
_?L4672:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L4663:					
						
	move.l 166(a6),d0			
						
	moveq #3,d2				
	cmp.l d0,d2				
	jbeq _?L4589				
	jbcs _?L4666				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbne _?L4654				
	move.l #_miniflac_bitreader_fill_nocrc,48(sp)
						
	pea 1.w					
	move.l d3,-(sp)				
	move.l 56(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L4601				
_?L4600:					
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 80(sp),d1				
	jbcs _?L4626				
	jbra _?L4667				
_?L4666:					
						
	subq.l #4,d0				
	jbne _?L4587				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4600				
_?L4623:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,175(a6)			
						
	tst.l 88(sp)				
	jbeq _?L4624				
						
	move.l 88(sp),a0			
	move.b d1,(a0)				
_?L4624:					
						
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
	jbra _?L4664				
_?L4629:					
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,8(a6)				
	and.l d0,12(a6)				
						
	moveq #3,d0				
	move.l d0,166(a6)			
_?L4589:					
						
	move.l 170(a6),a1			
						
	cmp.w #257,a1				
	jbhi _?L4606				
						
	move.b 16(a6),d1			
	move.w d1,a2				
	addq.l #1,a1				
_?L4607:					
						
	move.w a2,d7				
	cmp.b #7,d7				
	jbhi _?L4668				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L4616				
						
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
_?L4608:					
						
	move.b d7,16(a6)			
						
	jbeq _?L4630				
						
	clr.l d0				
	move.b d7,d0				
						
	move.w #64,a0				
	sub.l d0,a0				
						
	moveq #32,d1				
	sub.l d0,d1				
	move.l d1,52(sp)			
	jbmi _?L4611				
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
_?L4610:					
	move.l a0,8(a6)				
	move.l d1,12(a6)			
						
	move.l a1,170(a6)			
						
	cmp.w #258,a1				
	jbeq _?L4606				
	move.l a1,d0				
	addq.l #1,d0				
	move.w a2,d1				
	cmp.b #7,d1				
	jbhi _?L4631				
						
	move.l 24(a6),a2			
						
	clr.l d1				
	move.b d7,d1				
	moveq #64,d2				
	sub.l d1,d2				
						
	moveq #32,d0				
	sub.l d1,d0				
	jbmi _?L4614				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,52(sp)			
	clr.l 48(sp)				
_?L4620:					
						
	move.l 20(a6),d2			
						
	cmp.l d2,a2				
	jbls _?L4616				
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a6)			
						
	move.l 28(a6),a0			
	move.b (a0,d2.l),d2			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
						
	addq.l #1,32(a6)			
						
	move.b d7,16(a6)			
						
	jbeq _?L4617				
						
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
	jbne _?L4620				
_?L4606:					
						
	clr.l 170(a6)				
						
	moveq #4,d0				
	move.l d0,166(a6)			
_?L4673:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4600				
	jbra _?L4623				
_?L4627:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (32,sp),sp				
	rts					
_?L4654:					
						
	subq.l #1,d0				
	jbeq _?L4669				
						
	move.l 170(a6),d0			
						
	cmp.l #128,d0				
	jbcc _?L4670				
	move.l d0,d7				
	addq.l #1,d7				
	move.l #_miniflac_bitreader_fill_nocrc,48(sp)
_?L4598:					
						
	pea 8.w					
	move.l d3,-(sp)				
	move.l 56(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4600				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d7,170(a6)			
						
	addq.l #1,d7				
	cmp.l #129,d7				
	jbne _?L4598				
						
	clr.l 170(a6)				
						
	moveq #1,d7				
	move.l d7,166(a6)			
_?L4594:					
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l 56(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4600				
						
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
	jbne _?L4600				
	jbra _?L4601				
_?L4616:					
						
	move.l d2,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l 80(sp),d1				
	jbcs _?L4626				
	jbra _?L4667				
_?L4580:					
	move.l 52(a6),d1			
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L4664				
_?L4668:					
						
	move.w a2,d7				
	subq.b #8,d7				
						
	move.l 8(a6),40(sp)			
	move.l 12(a6),d2			
	jbra _?L4608				
_?L4665:					
						
	lea _miniflac_sync_internal,a3		
_?L4578:					
	moveq #5,d2				
	cmp.l 114(a6),d2			
	jbeq _?L4671				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4576				
	moveq #4,d1				
	cmp.l (a6),d1				
	jbeq _?L4578				
	moveq #-1,d4				
	move.l 84(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L4672				
_?L4630:					
	sub.l a0,a0				
	clr.l d1				
	jbra _?L4610				
_?L4617:					
						
	clr.l 8(a6)				
	clr.l 12(a6)				
						
	addq.l #1,a1				
	move.l a1,170(a6)			
						
	cmp.w #258,a1				
	jbne _?L4620				
						
	clr.l 170(a6)				
						
	moveq #4,d0				
	move.l d0,166(a6)			
	jbra _?L4673				
_?L4614:					
						
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
	jbra _?L4620				
_?L4601:					
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b 16(a6),d0			
	cmp.b #6,d0				
	jbls _?L4674				
						
	subq.b #7,d0				
	move.b d0,16(a6)			
						
	jbeq _?L4629				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L4604				
	moveq #-1,d0				
	lsr.l d1,d0				
	clr.l d1				
						
	and.l d1,8(a6)				
	and.l d0,12(a6)				
						
	moveq #3,d0				
	move.l d0,166(a6)			
	jbra _?L4589				
_?L4611:					
						
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
	jbra _?L4610				
_?L4669:					
	move.l #_miniflac_bitreader_fill_nocrc,48(sp)
	jbra _?L4594				
_?L4671:					
						
	move.l 88(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_tracks	
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 84(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L4672				
_?L4631:					
						
	move.l d0,a1				
	move.w d7,a2				
	jbra _?L4607				
_?L4604:					
						
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
	jbra _?L4589				
_?L4670:					
	move.l #_miniflac_bitreader_fill_nocrc,48(sp)
						
	clr.l 170(a6)				
						
	moveq #1,d7				
	move.l d7,166(a6)			
	jbra _?L4594				
_?L4674:					
	jbsr (_miniflac_bitreader_discard?part?0)
_?L4662:					
						
	move.l 52(a6),d1			
	move.l d0,d4				
	move.l 84(sp),a0			
	move.l d1,(a0)				
	jbra _?L4664				
						
	.align	2				
	.globl	_mflac_cuesheet_tracks		
						
_mflac_cuesheet_tracks:				
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_cuesheet_tracks,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L4686				
_?L4678:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L4675				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L4678				
_?L4686:					
						
	tst.l d0				
	jble _?L4675				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L4675:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_track_offset	
						
_miniflac_cuesheet_track_offset:		
	lea (-16,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),a6			
	move.l 60(sp),a4			
	move.l 64(sp),d5			
						
	move.l 4(a6),d0				
	jbne _?L4688				
						
	tst.l d5				
	jbeq _?L4751				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4798				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4798:					
	move.l 4(a6),d0				
_?L4688:					
						
	subq.l #1,d0				
	jbeq _?L4799				
						
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
_?L4750:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4734				
	move.l 44(sp),28(a6)			
	move.l 48(sp),24(a6)			
	clr.l 20(a6)				
_?L4735:					
	moveq #4,d2				
	cmp.l (a6),d2				
	jbeq _?L4738				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4735				
_?L4736:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L4800				
_?L4747:					
	move.l 52(a6),d1			
	cmp.l d5,d1				
	jbcs _?L4750				
_?L4806:					
	clr.l d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L4802:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4738:					
	moveq #5,d0				
	cmp.l 114(a6),d0			
	jbeq _?L4801				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4736				
	moveq #4,d2				
	cmp.l (a6),d2				
	jbeq _?L4738				
_?L4739:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4802				
_?L4799:					
	move.l a4,28(a6)			
	move.l d5,24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4691:					
	moveq #4,d4				
	cmp.l (a6),d4				
	jbeq _?L4803				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L4691				
_?L4733:					
	move.l 20(a6),d2			
_?L4692:					
	move.l 68(sp),a0			
	move.l d2,(a0)				
_?L4808:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4801:					
						
	move.l 166(a6),a1			
						
	cmp.l a1,d0				
	jbeq _?L4741				
	jbcs _?L4804				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l 48(sp),-(sp)			
	jbsr _miniflac_cuesheet_read_tracks	
	lea (12,sp),sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbne _?L4736				
_?L4741:					
						
	move.b 174(a6),d0			
	cmp.b 175(a6),d0			
	jbeq _?L4805				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L4746				
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	cmp.l d5,d1				
	jbcs _?L4750				
	jbra _?L4806				
_?L4804:					
						
	lea (-12,a1),a1				
	moveq #2,d1				
	cmp.l a1,d1				
	jbcs _?L4739				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l 48(sp),-(sp)			
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbeq _?L4741				
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbeq _?L4747				
	jbra _?L4800				
_?L4751:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4746:					
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 72(sp)				
	jbeq _?L4748				
						
	move.l 72(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L4748:					
						
	moveq #6,d0				
	move.l d0,166(a6)			
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4802				
_?L4734:					
	move.l 52(a6),d1			
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4802				
_?L4803:					
	lea _miniflac_sync_internal,a3		
_?L4694:					
	moveq #5,d2				
	cmp.l 114(a6),d2			
	jbeq _?L4807				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4733				
	moveq #4,d1				
	cmp.l (a6),d1				
	jbeq _?L4694				
_?L4699:					
	move.l 20(a6),d2			
						
	moveq #-1,d4				
						
	move.l 68(sp),a0			
	move.l d2,(a0)				
	jbra _?L4808				
_?L4805:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
						
	moveq #2,d4				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4802				
_?L4807:					
						
	move.l 166(a6),a1			
						
	cmp.l a1,d2				
	jbeq _?L4792				
	jbcs _?L4809				
						
	moveq #3,d0				
	cmp.l a1,d0				
	jbeq _?L4702				
	moveq #4,d1				
	cmp.l a1,d1				
	jbne _?L4810				
_?L4703:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4795				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,175(a6)			
						
	clr.b 174(a6)				
						
	moveq #5,d0				
	move.l d0,166(a6)			
	clr.b d0				
_?L4701:					
						
	cmp.b d1,d0				
	jbeq _?L4811				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4795				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 72(sp)				
	jbeq _?L4732				
						
	move.l 72(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L4732:					
						
	moveq #6,d0				
	move.l d0,166(a6)			
						
	move.l 20(a6),d2			
	moveq #1,d4				
	move.l 68(sp),a0			
	move.l d2,(a0)				
	jbra _?L4808				
_?L4810:					
						
	moveq #2,d2				
	lea _miniflac_bitreader_fill_nocrc,a3	
	cmp.l a1,d2				
	jbeq _?L4704				
						
	moveq #1,d4				
	lea _miniflac_bitreader_fill_nocrc,a3	
	cmp.l a1,d4				
	jbeq _?L4705				
						
	move.l 170(a6),d4			
						
	cmp.l #128,d4				
	jbcc _?L4812				
	addq.l #1,d4				
	lea _miniflac_bitreader_fill_nocrc,a3	
						
	lea _miniflac_bitreader_read,a4		
_?L4708:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4795				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d4,170(a6)			
						
	addq.l #1,d4				
	cmp.l #129,d4				
	jbne _?L4708				
						
	clr.l 170(a6)				
						
	moveq #1,d0				
	move.l d0,166(a6)			
_?L4705:					
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4795				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,166(a6)			
_?L4704:					
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4795				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b 16(a6),d0			
	cmp.b #6,d0				
	jbls _?L4813				
						
	subq.b #7,d0				
	move.b d0,16(a6)			
						
	jbeq _?L4752				
						
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
_?L4702:					
						
	move.l 170(a6),d5			
						
	cmp.l #257,d5				
	jbhi _?L4714				
						
	move.b 16(a6),d6			
	addq.l #1,d5				
_?L4715:					
						
	cmp.b #7,d6				
	jbhi _?L4814				
						
	move.l 20(a6),d2			
						
	cmp.l 24(a6),d2				
	jbcc _?L4794				
						
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
_?L4716:					
						
	move.b d4,16(a6)			
	clr.l d0				
						
	tst.b d4				
	jbeq _?L4753				
						
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
_?L4718:					
	move.l d0,8(a6)				
	move.l d1,12(a6)			
						
	move.l d5,170(a6)			
						
	cmp.l #258,d5				
	jbeq _?L4714				
	move.l d5,d0				
	addq.l #1,d0				
	cmp.b #7,d6				
	jbhi _?L4754				
						
	move.l 24(a6),d6			
						
	clr.l d2				
	move.b d4,d2				
	moveq #64,d0				
	sub.l d2,d0				
						
	moveq #32,d1				
	sub.l d2,d1				
	jbmi _?L4720				
	moveq #-1,d7				
	lsr.l d1,d7				
	sub.l a2,a2				
_?L4726:					
						
	move.l 20(a6),d2			
						
	cmp.l d2,d6				
	jbls _?L4794				
						
	move.l 28(a6),a1			
						
	move.l d2,d0				
	addq.l #1,d0				
	move.l d0,20(a6)			
						
	move.b (a1,d2.l),d2			
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
						
	addq.l #1,32(a6)			
						
	move.b d4,16(a6)			
						
	jbeq _?L4723				
						
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
	jbne _?L4726				
_?L4714:					
						
	clr.l 170(a6)				
						
	moveq #4,d4				
	move.l d4,166(a6)			
	jbra _?L4703				
_?L4809:					
						
	lea (-12,a1),a1				
	moveq #2,d4				
	cmp.l a1,d4				
	jbcs _?L4699				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbne _?L4733				
_?L4792:					
						
	move.b 174(a6),d0			
						
	move.b 175(a6),d1			
	jbra _?L4701				
_?L4795:					
						
	move.l 20(a6),d2			
_?L4794:					
						
	clr.l d4				
						
	move.l 68(sp),a0			
	move.l d2,(a0)				
	jbra _?L4808				
_?L4811:					
	move.l 20(a6),d2			
						
	moveq #2,d4				
						
	move.l 68(sp),a0			
	move.l d2,(a0)				
	jbra _?L4808				
_?L4814:					
						
	move.b d6,d4				
	subq.b #8,d4				
						
	move.l 8(a6),d7				
	move.l 12(a6),a3			
	jbra _?L4716				
_?L4723:					
						
	clr.l 8(a6)				
	clr.l 12(a6)				
						
	addq.l #1,d5				
	move.l d5,170(a6)			
						
	cmp.l #258,d5				
	jbne _?L4726				
						
	clr.l 170(a6)				
						
	moveq #4,d4				
	move.l d4,166(a6)			
	jbra _?L4703				
_?L4720:					
						
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
	jbra _?L4726				
_?L4754:					
						
	move.l d0,d5				
	move.b d4,d6				
	jbra _?L4715				
_?L4753:					
	clr.l d1				
	jbra _?L4718				
_?L4812:					
	lea _miniflac_bitreader_fill_nocrc,a3	
						
	clr.l 170(a6)				
						
	moveq #1,d0				
	move.l d0,166(a6)			
	jbra _?L4705				
_?L4800:					
						
	move.l 52(a6),d1			
	move.l d0,d4				
	move.l 68(sp),a0			
	move.l d1,(a0)				
	jbra _?L4802				
_?L4752:					
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,8(a6)				
	and.l d0,12(a6)				
						
	moveq #3,d4				
	move.l d4,166(a6)			
	jbra _?L4702				
_?L4813:					
	jbsr (_miniflac_bitreader_discard?part?0)
						
	.align	2				
	.globl	_mflac_cuesheet_track_offset	
						
_mflac_cuesheet_track_offset:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_cuesheet_track_offset,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L4826				
_?L4818:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L4815				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L4818				
_?L4826:					
						
	tst.l d0				
	jble _?L4815				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L4815:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_track_number	
						
_miniflac_cuesheet_track_number:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L4828				
						
	tst.l 60(sp)				
	jbeq _?L4856				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4872				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4872:					
	move.l 4(a4),d0				
_?L4828:					
						
	subq.l #1,d0				
	jbeq _?L4873				
						
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
_?L4855:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4836				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L4837:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L4840				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4837				
_?L4838:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L4874				
_?L4852:					
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L4855				
_?L4880:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L4876:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4840:					
	moveq #5,d1				
	cmp.l 114(a4),d1			
	jbeq _?L4875				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4838				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L4840				
_?L4841:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4876				
_?L4873:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L4831:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L4877				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L4831				
_?L4832:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L4882:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4875:					
						
	move.l 166(a4),d0			
						
	cmp.l d0,d1				
	jbcs _?L4878				
						
	subq.l #5,d0				
	jbne _?L4846				
_?L4849:					
						
	move.b 174(a4),d0			
	cmp.b 175(a4),d0			
	jbeq _?L4879				
						
	pea 64.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbeq _?L4851				
_?L4853:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L4855				
	jbra _?L4880				
_?L4878:					
						
	subq.l #6,d0				
	jbne _?L4841				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4853				
_?L4883:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L4854				
						
	move.l 68(sp),a0			
	move.b d1,(a0)				
_?L4854:					
						
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
	jbra _?L4876				
_?L4856:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L4846:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_tracks	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4849				
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbeq _?L4852				
	jbra _?L4874				
_?L4836:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4876				
_?L4877:					
	lea _miniflac_sync_internal,a3		
_?L4834:					
	moveq #5,d0				
	cmp.l 114(a4),d0			
	jbeq _?L4881				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4832				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L4834				
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4882				
_?L4851:					
						
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
	jbne _?L4853				
	jbra _?L4883				
_?L4881:					
						
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L4882				
_?L4879:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
						
	moveq #2,d4				
						
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4876				
_?L4874:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L4876				
						
	.align	2				
	.globl	_mflac_cuesheet_track_number	
						
_mflac_cuesheet_track_number:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_cuesheet_track_number,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L4895				
_?L4887:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L4884				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L4887				
_?L4895:					
						
	tst.l d0				
	jble _?L4884				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L4884:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L4897				
						
	tst.l d3				
	jbeq _?L4904				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbeq _?L4908				
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4908:					
	move.l 4(a3),d0				
_?L4897:					
						
	subq.l #1,d0				
	jbeq _?L4909				
						
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
_?L4903:					
	move.l d5,-(sp)				
	move.l d7,-(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d6				
	moveq #1,d0				
	cmp.l d6,d0				
	jbne _?L4900				
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
	jbne _?L4902				
	cmp.l d3,d1				
	jbcs _?L4903				
_?L4902:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L4910:					
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4909:					
	move.l d4,72(sp)			
	move.l 36(sp),68(sp)			
	move.l d3,64(sp)			
	move.l a4,60(sp)			
	move.l a3,56(sp)			
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	jbra _miniflac_cuesheet_track_isrc_length_native
_?L4904:					
						
	clr.l d6				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L4900:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L4910				
						
	.align	2				
	.globl	_mflac_cuesheet_track_isrc_length
						
_mflac_cuesheet_track_isrc_length:		
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_cuesheet_track_isrc_length,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L4922				
_?L4914:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L4911				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L4914				
_?L4922:					
						
	tst.l d0				
	jble _?L4911				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L4911:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_track_isrc_string
						
_miniflac_cuesheet_track_isrc_string:		
	lea (-20,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 60(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L4924				
						
	tst.l 68(sp)				
	jbeq _?L4984				
	subq.l #4,sp				
	move.l 68(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5013				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L5013:					
	move.l 4(a3),d0				
_?L4924:					
						
	subq.l #1,d0				
	jbeq _?L5014				
						
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
_?L4983:					
	move.l d5,-(sp)				
	pea 52(sp)				
	move.l 72(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L4945				
	move.l 48(sp),28(a3)			
	move.l 52(sp),24(a3)			
	clr.l 20(a3)				
_?L4946:					
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L4949				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L4946				
_?L4947:					
	move.l 20(a3),d1			
_?L4951:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbne _?L5015				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L4983				
_?L5021:					
	clr.l d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
_?L5017:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L4949:					
	moveq #5,d0				
	cmp.l 114(a3),d0			
	jbeq _?L5016				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4947				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L4949				
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
_?L5023:					
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L5017				
_?L5014:					
	move.l 64(sp),28(a3)			
	move.l 68(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L4927:					
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L5018				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L4927				
_?L4928:					
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
_?L5025:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L5016:					
						
	move.l 166(a3),d0			
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcs _?L5019				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a3)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4947				
_?L4982:					
						
	move.l 170(a3),d0			
						
	moveq #11,d1				
	cmp.l d0,d1				
	jbcs _?L4956				
	tst.l 76(sp)				
	jbeq _?L5007				
						
	move.w #-1,a2				
_?L4957:					
						
	move.b 16(a3),d2			
						
	cmp.b #7,d2				
	jbhi _?L5020				
_?L4977:					
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L4960				
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
						
	jbeq _?L4985				
_?L5022:					
						
	move.w #64,a0				
	sub.l d7,a0				
						
	moveq #32,d2				
	sub.l d7,d2				
	jbmi _?L4971				
	move.l a2,d1				
	lsr.l d2,d1				
	move.l d1,a1				
	clr.l d2				
						
	and.l d6,d2				
	move.l d2,a0				
	move.l a1,d2				
	and.l 36(sp),d2				
_?L4970:					
	move.l a0,8(a3)				
	move.l d2,12(a3)			
						
	cmp.l 80(sp),d0				
	jbcc _?L4973				
						
	move.w #-32,a0				
	add.l d7,a0				
	tst.l a0				
	jblt _?L4974				
	move.l a0,d2				
	lsr.l d2,d6				
						
	move.l 76(sp),a0			
	move.b d6,(a0,d0.l)			
						
	move.l 170(a3),d0			
	addq.l #1,d0				
	move.l d0,170(a3)			
						
	moveq #11,d1				
	cmp.l d0,d1				
	jbcc _?L4957				
_?L4956:					
						
	tst.l 84(sp)				
	jbeq _?L4979				
						
	move.l 80(sp),d1			
	cmp.l d1,d0				
	jbcc _?L4980				
	move.l d0,d1				
_?L4980:					
						
	move.l 84(sp),a0			
	move.l d1,(a0)				
_?L4979:					
						
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
	jbra _?L5017				
_?L4960:					
	move.l 44(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L4983				
	jbra _?L5021				
_?L4973:					
						
	move.l 170(a3),d0			
	addq.l #1,d0				
	move.l d0,170(a3)			
						
	moveq #11,d2				
	cmp.l d0,d2				
	jbcs _?L4956				
						
	move.b 16(a3),d2			
						
	cmp.b #7,d2				
	jbls _?L4977				
_?L5020:					
						
	move.l 8(a3),d6				
	move.l 12(a3),36(sp)			
						
	subq.b #8,d2				
	move.b d2,16(a3)			
						
	clr.l d7				
	move.b d2,d7				
						
	jbne _?L5022				
_?L4985:					
	sub.l a0,a0				
	clr.l d2				
	jbra _?L4970				
_?L5019:					
						
	subq.l #7,d0				
	jbeq _?L4982				
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	jbra _?L5023				
_?L4971:					
						
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
	jbra _?L4970				
_?L4974:					
						
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
	jbcc _?L4957				
	jbra _?L4956				
_?L4984:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L4945:					
	move.l 52(a3),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L5017				
_?L5018:					
	lea _miniflac_sync_internal,a4		
_?L4930:					
	moveq #5,d0				
	cmp.l 114(a3),d0			
	jbeq _?L5024				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4928				
	moveq #4,d2				
	cmp.l (a3),d2				
	jbeq _?L4930				
	moveq #-1,d4				
_?L5028:					
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L5025				
_?L5007:					
						
	move.w #-1,a1				
_?L4966:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L5026				
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d2			
	cmp.l 24(a3),d2				
	jbcc _?L4960				
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
_?L4959:					
						
	move.b d0,16(a3)			
						
	jbeq _?L4961				
						
	and.l #255,d0				
						
	moveq #64,d7				
	sub.l d0,d7				
						
	moveq #32,d6				
	sub.l d0,d6				
	jbmi _?L4962				
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
	jbcc _?L4966				
	jbra _?L4956				
_?L4961:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 170(a3),d0			
	addq.l #1,d0				
	move.l d0,170(a3)			
						
	moveq #11,d1				
	cmp.l d0,d1				
	jbcc _?L4966				
	jbra _?L4956				
_?L4962:					
						
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
	jbcc _?L4966				
	jbra _?L4956				
_?L5026:					
						
	move.l 8(a3),d2				
	move.l 12(a3),a0			
						
	subq.b #8,d0				
	jbra _?L4959				
_?L5024:					
						
	move.l 166(a3),d0			
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcs _?L5027				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a3)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L4928				
_?L4944:					
						
	move.l 170(a3),d4			
						
	moveq #11,d0				
	cmp.l d4,d0				
	jbcs _?L4934				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
	tst.l 76(sp)				
	jbeq _?L4937				
_?L4935:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4936				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	cmp.l 80(sp),d4				
	jbcc _?L4940				
						
	move.l 76(sp),a0			
	move.b d1,(a0,d4.l)			
						
	move.l 170(a3),d4			
	addq.l #1,d4				
	move.l d4,170(a3)			
						
	moveq #11,d0				
	cmp.l d4,d0				
	jbcc _?L4935				
_?L4934:					
						
	tst.l 84(sp)				
	jbeq _?L4942				
						
	move.l 80(sp),d0			
	cmp.l d0,d4				
	jbcc _?L4943				
	move.l d4,d0				
_?L4943:					
						
	move.l 84(sp),a0			
	move.l d0,(a0)				
_?L4942:					
						
	clr.l 170(a3)				
						
	moveq #8,d0				
	move.l d0,166(a3)			
						
	moveq #1,d4				
						
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L5025				
_?L4937:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L4936				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 170(a3),d4			
	addq.l #1,d4				
	move.l d4,170(a3)			
						
	moveq #11,d1				
	cmp.l d4,d1				
	jbcc _?L4937				
	jbra _?L4934				
_?L4940:					
						
	move.l 170(a3),d4			
	addq.l #1,d4				
	move.l d4,170(a3)			
						
	moveq #11,d1				
	cmp.l d4,d1				
	jbcc _?L4935				
	jbra _?L4934				
_?L5027:					
						
	subq.l #7,d0				
	jbeq _?L4944				
						
	moveq #-1,d4				
	jbra _?L5028				
_?L4936:					
						
	clr.l d4				
						
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L5025				
_?L5015:					
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L5017				
						
	.align	2				
	.globl	_mflac_cuesheet_track_isrc_string
						
_mflac_cuesheet_track_isrc_string:		
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),d6			
	move.l 44(sp),d5			
	move.l 48(sp),d4			
						
	clr.l 28(sp)				
	move.l 482(a4),d0			
	move.l 478(a4),d1			
	moveq #28,d3				
	add.l sp,d3				
	lea _miniflac_cuesheet_track_isrc_string,a3
	move.l a4,d7				
	add.l #486,d7				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbne _?L5040				
_?L5032:					
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5029				
						
	move.l d0,482(a4)			
	clr.l 478(a4)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbeq _?L5032				
_?L5040:					
						
	tst.l d0				
	jble _?L5029				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L5029:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_track_audio_flag
						
_miniflac_cuesheet_track_audio_flag:		
	lea (-28,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 68(sp),a4			
						
	move.l 4(a4),d0				
	jbne _?L5042				
						
	tst.l 76(sp)				
	jbeq _?L5086				
	subq.l #4,sp				
	move.l 76(sp),a0			
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5111				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L5111:					
	move.l 4(a4),d0				
_?L5042:					
						
	subq.l #1,d0				
	jbeq _?L5112				
						
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
_?L5085:					
	pea 60(sp)				
	move.l d5,-(sp)				
	move.l 80(sp),-(sp)			
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5050				
	move.l 56(sp),28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
_?L5051:					
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L5054				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5051				
_?L5052:					
	move.l 20(a4),d1			
_?L5056:					
	move.l d1,-(sp)				
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L5113				
_?L5067:					
	move.l 52(a4),d1			
	cmp.l 76(sp),d1				
	jbcs _?L5085				
_?L5119:					
	clr.l d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
_?L5115:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L5054:					
	moveq #5,d0				
	cmp.l 114(a4),d0			
	jbeq _?L5114				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d6				
	cmp.l d0,d6				
	jbne _?L5052				
	moveq #4,d7				
	cmp.l (a4),d7				
	jbeq _?L5054				
_?L5057:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L5115				
_?L5112:					
	move.l 72(sp),28(a4)			
	move.l 76(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5045:					
	moveq #4,d6				
	cmp.l (a4),d6				
	jbeq _?L5116				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L5045				
_?L5046:					
	move.l 80(sp),a0			
	move.l 20(a4),(a0)			
_?L5122:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L5114:					
						
	move.l 166(a4),d0			
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcs _?L5117				
						
	subq.l #7,d0				
	jbne _?L5062				
_?L5081:					
						
	move.l 170(a4),d0			
						
	moveq #11,d7				
	cmp.l d0,d7				
	jbcs _?L5063				
						
	move.b 16(a4),40(sp)			
	move.l d0,a2				
	addq.l #1,a2				
_?L5064:					
						
	cmp.b #7,40(sp)				
	jbhi _?L5118				
						
	move.l 20(a4),d2			
						
	cmp.l 24(a4),d2				
	jbcc _?L5074				
						
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
						
	jbeq _?L5088				
_?L5123:					
						
	clr.l d1				
	move.b d0,d1				
						
	moveq #64,d6				
	sub.l d1,d6				
						
	moveq #32,d7				
	sub.l d1,d7				
	jbmi _?L5069				
	moveq #-1,d2				
	lsr.l d7,d2				
	clr.l d7				
						
	move.l a1,d6				
	and.l d7,d6				
	move.l d6,a1				
	move.l a0,d7				
	and.l d7,d2				
_?L5068:					
	move.l a1,8(a4)				
	move.l d2,12(a4)			
						
	move.l a2,170(a4)			
						
	moveq #12,d1				
	cmp.l a2,d1				
	jbeq _?L5063				
	move.l a2,d1				
	addq.l #1,d1				
	cmp.b #7,40(sp)				
	jbhi _?L5089				
						
	move.l 24(a4),d1			
						
	clr.l d2				
	move.b d0,d2				
	move.w #64,a1				
	sub.l d2,a1				
						
	move.w #32,a0				
	sub.l d2,a0				
	tst.l a0				
	jblt _?L5072				
	moveq #-1,d2				
	move.l a0,d6				
	lsr.l d6,d2				
	move.l d2,40(sp)			
	clr.l 44(sp)				
_?L5078:					
						
	move.l 20(a4),d2			
						
	cmp.l d1,d2				
	jbcc _?L5074				
						
	move.l 28(a4),a0			
						
	move.l d2,d6				
	addq.l #1,d6				
	move.l d6,20(a4)			
						
	move.b (a0,d2.l),d2			
						
	move.l 8(a4),a0				
	move.l 12(a4),a1			
						
	addq.l #1,32(a4)			
						
	move.b d0,16(a4)			
						
	jbeq _?L5075				
						
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
	jbne _?L5078				
_?L5063:					
						
	clr.l 170(a4)				
						
	moveq #8,d0				
	move.l d0,166(a4)			
_?L5060:					
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L5082				
_?L5120:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 76(sp),d1				
	jbcs _?L5085				
	jbra _?L5119				
_?L5117:					
						
	subq.l #8,d0				
	jbne _?L5057				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5120				
	jbra _?L5082				
_?L5086:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
_?L5082:					
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 84(sp)				
	jbeq _?L5083				
						
	move.l 84(sp),a0			
	move.b d1,(a0)				
_?L5083:					
						
	moveq #9,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L5115				
_?L5062:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5081				
						
	move.l 20(a4),d1			
	move.l d1,-(sp)				
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbeq _?L5067				
	jbra _?L5113				
_?L5074:					
	move.l d2,-(sp)				
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 76(sp),d1				
	jbcs _?L5085				
	jbra _?L5119				
_?L5050:					
	move.l 52(a4),d1			
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L5115				
_?L5116:					
	lea _miniflac_sync_internal,a3		
_?L5048:					
	moveq #5,d1				
	cmp.l 114(a4),d1			
	jbeq _?L5121				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d7				
	cmp.l d0,d7				
	jbne _?L5046				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5048				
	moveq #-1,d4				
	move.l 80(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5122				
_?L5118:					
						
	move.b 40(sp),d0			
	subq.b #8,d0				
						
	move.l 8(a4),a1				
	move.l 12(a4),a0			
						
	move.b d0,16(a4)			
						
	jbne _?L5123				
_?L5088:					
	sub.l a1,a1				
	clr.l d2				
	jbra _?L5068				
_?L5075:					
						
	clr.l 8(a4)				
	clr.l 12(a4)				
						
	addq.l #1,a2				
	move.l a2,170(a4)			
						
	moveq #12,d7				
	cmp.l a2,d7				
	jbne _?L5078				
						
	clr.l 170(a4)				
						
	moveq #8,d0				
	move.l d0,166(a4)			
	jbra _?L5060				
_?L5072:					
						
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
	jbra _?L5078				
_?L5121:					
						
	move.l 84(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_track_audio_flag
	lea (12,sp),sp				
	move.l d0,d4				
	move.l 80(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5122				
_?L5069:					
						
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
	jbra _?L5068				
_?L5089:					
						
	move.l d1,a2				
	move.b d0,40(sp)			
	jbra _?L5064				
_?L5113:					
						
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 80(sp),a0			
	move.l d1,(a0)				
	jbra _?L5115				
						
	.align	2				
	.globl	_mflac_cuesheet_track_audio_flag
						
_mflac_cuesheet_track_audio_flag:		
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_cuesheet_track_audio_flag,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L5135				
_?L5127:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5124				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L5127				
_?L5135:					
						
	tst.l d0				
	jble _?L5124				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L5124:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_track_preemph_flag
						
_miniflac_cuesheet_track_preemph_flag:		
	lea (-40,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 80(sp),a4			
	move.l 84(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L5137				
						
	tst.l 88(sp)				
	jbeq _?L5215				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5269				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (40,sp),sp				
	rts					
_?L5269:					
	move.l 4(a4),d0				
_?L5137:					
						
	subq.l #1,d0				
	jbeq _?L5270				
						
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
_?L5214:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5173				
	move.l 68(sp),28(a4)			
	move.l 72(sp),24(a4)			
	clr.l 20(a4)				
_?L5174:					
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L5177				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5174				
_?L5175:					
	move.l 20(a4),d1			
_?L5179:					
	move.l d1,-(sp)				
	move.l a4,-(sp)				
	move.l d0,56(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 48(sp),d0			
	jbne _?L5271				
_?L5191:					
	move.l 52(a4),d1			
	cmp.l 88(sp),d1				
	jbcs _?L5214				
_?L5277:					
	clr.l d4				
	move.l 92(sp),a0			
	move.l d1,(a0)				
_?L5273:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (40,sp),sp				
	rts					
_?L5177:					
	moveq #5,d0				
	cmp.l 114(a4),d0			
	jbeq _?L5272				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5175				
	moveq #4,d2				
	cmp.l (a4),d2				
	jbeq _?L5177				
_?L5180:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 92(sp),a0			
	move.l d1,(a0)				
	jbra _?L5273				
_?L5270:					
	move.l d5,28(a4)			
	move.l 88(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5140:					
	moveq #4,d5				
	cmp.l (a4),d5				
	jbeq _?L5274				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L5140				
_?L5262:					
	move.l 20(a4),d2			
_?L5141:					
	move.l 92(sp),a0			
	move.l d2,(a0)				
_?L5280:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (40,sp),sp				
	rts					
_?L5272:					
						
	move.l 166(a4),d0			
						
	moveq #8,d1				
	cmp.l d0,d1				
	jbcs _?L5275				
						
	moveq #8,d1				
	cmp.l d0,d1				
	jbne _?L5276				
_?L5185:					
						
	pea 1.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,56(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 48(sp),a1			
	tst.l d0				
	jbne _?L5266				
						
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
	jbeq _?L5207				
_?L5266:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 88(sp),d1				
	jbcs _?L5214				
	jbra _?L5277				
_?L5275:					
						
	moveq #9,d2				
	cmp.l d0,d2				
	jbne _?L5180				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5266				
_?L5207:					
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 96(sp)				
	jbeq _?L5208				
						
	move.l 96(sp),a0			
	move.b d1,(a0)				
_?L5208:					
						
	move.b 16(a4),d0			
	cmp.b #5,d0				
	jbls _?L5209				
						
	subq.b #6,d0				
	move.b d0,16(a4)			
						
	jbeq _?L5221				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L5211				
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
_?L5281:					
	move.l 92(sp),a0			
	move.l d1,(a0)				
	jbra _?L5273				
_?L5215:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (40,sp),sp				
	rts					
_?L5276:					
						
	subq.l #7,d0				
	jbne _?L5186				
_?L5205:					
						
	move.l 170(a4),a0			
						
	moveq #11,d0				
	cmp.l a0,d0				
	jbcs _?L5187				
						
	move.b 16(a4),d1			
	move.w d1,a2				
_?L5188:					
						
	move.w a2,d2				
	cmp.b #7,d2				
	jbhi _?L5278				
						
	move.l 20(a4),d2			
						
	cmp.l 24(a4),d2				
	jbcc _?L5198				
						
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
_?L5189:					
						
	move.b d0,16(a4)			
						
	jbeq _?L5219				
						
	clr.l d1				
	move.b d0,d1				
						
	move.w #64,a1				
	sub.l d1,a1				
						
	moveq #32,d2				
	sub.l d1,d2				
	move.l d2,60(sp)			
	jbmi _?L5193				
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
_?L5192:					
	move.l a1,8(a4)				
	move.l d2,12(a4)			
						
	addq.l #1,a0				
	move.l a0,170(a4)			
						
	moveq #12,d2				
	cmp.l a0,d2				
	jbeq _?L5187				
	move.w a2,d1				
	cmp.b #7,d1				
	jbhi _?L5220				
						
	move.l 24(a4),a2			
						
	clr.l d1				
	move.b d0,d1				
	move.w #64,a1				
	sub.l d1,a1				
						
	moveq #32,d2				
	sub.l d1,d2				
	jbmi _?L5196				
	moveq #-1,d1				
	lsr.l d2,d1				
	move.l d1,52(sp)			
	clr.l 56(sp)				
_?L5202:					
						
	move.l 20(a4),d2			
						
	cmp.l a2,d2				
	jbcc _?L5198				
						
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
						
	jbeq _?L5199				
						
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
	jbne _?L5202				
_?L5187:					
						
	clr.l 170(a4)				
						
	moveq #8,d0				
	move.l d0,166(a4)			
	jbra _?L5185				
_?L5173:					
						
	move.l 52(a4),d1			
	move.l 92(sp),a0			
	move.l d1,(a0)				
	jbra _?L5273				
_?L5274:					
	lea _miniflac_sync_internal,a3		
_?L5143:					
	moveq #5,d2				
	cmp.l 114(a4),d2			
	jbeq _?L5279				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5262				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L5143				
	move.l 20(a4),d2			
						
	moveq #-1,d4				
_?L5284:					
						
	move.l 92(sp),a0			
	move.l d2,(a0)				
	jbra _?L5280				
_?L5221:					
						
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
	jbra _?L5281				
_?L5186:					
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5205				
						
	move.l 20(a4),d1			
	move.l d1,-(sp)				
	move.l a4,-(sp)				
	move.l d0,56(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 48(sp),d0			
	jbeq _?L5191				
	jbra _?L5271				
_?L5198:					
	move.l d2,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 88(sp),d1				
	jbcs _?L5214				
	jbra _?L5277				
_?L5199:					
						
	clr.l 8(a4)				
	clr.l 12(a4)				
						
	addq.l #1,a0				
	move.l a0,170(a4)			
						
	moveq #12,d1				
	cmp.l a0,d1				
	jbne _?L5202				
						
	clr.l 170(a4)				
						
	moveq #8,d0				
	move.l d0,166(a4)			
	jbra _?L5185				
_?L5279:					
						
	move.l 166(a4),d0			
						
	moveq #8,d5				
	cmp.l d0,d5				
	jbcs _?L5282				
						
	moveq #8,d2				
	cmp.l d0,d2				
	jbeq _?L5148				
						
	subq.l #7,d0				
	jbeq _?L5165				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d5				
	cmp.l d0,d5				
	jbne _?L5262				
_?L5165:					
						
	move.l 170(a4),d4			
						
	moveq #11,d0				
	cmp.l d4,d0				
	jbcs _?L5150				
						
	move.b 16(a4),d6			
	addq.l #1,d4				
_?L5151:					
						
	cmp.b #7,d6				
	jbhi _?L5283				
						
	move.l 20(a4),d2			
						
	cmp.l 24(a4),d2				
	jbcc _?L5263				
						
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
_?L5152:					
						
	move.b d5,16(a4)			
	clr.l d0				
						
	tst.b d5				
	jbeq _?L5216				
						
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
_?L5154:					
	move.l d0,8(a4)				
	move.l d1,12(a4)			
						
	move.l d4,170(a4)			
						
	moveq #12,d0				
	cmp.l d4,d0				
	jbeq _?L5150				
	move.l d4,d0				
	addq.l #1,d0				
	cmp.b #7,d6				
	jbhi _?L5217				
						
	move.l 24(a4),a2			
						
	clr.l d2				
	move.b d5,d2				
	moveq #64,d0				
	sub.l d2,d0				
						
	moveq #32,d1				
	sub.l d2,d1				
	jbmi _?L5156				
	moveq #-1,d6				
	lsr.l d1,d6				
	clr.l d7				
_?L5162:					
						
	move.l 20(a4),d2			
						
	cmp.l a2,d2				
	jbcc _?L5263				
						
	move.l 28(a4),a1			
						
	move.l d2,d1				
	addq.l #1,d1				
	move.l d1,20(a4)			
						
	move.b (a1,d2.l),d2			
						
	move.l 8(a4),d0				
	move.l 12(a4),d1			
						
	addq.l #1,32(a4)			
						
	move.b d5,16(a4)			
						
	jbeq _?L5159				
						
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
	jbne _?L5162				
_?L5150:					
						
	clr.l 170(a4)				
						
	moveq #8,d2				
	move.l d2,166(a4)			
_?L5148:					
						
	pea 1.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,56(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 48(sp),a1			
	tst.l d0				
	jbne _?L5264				
						
	pea 1.w					
	move.l d3,-(sp)				
	move.l a1,56(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #9,d0				
	move.l d0,166(a4)			
	move.l 48(sp),a1			
_?L5147:					
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5264				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 96(sp)				
	jbeq _?L5168				
						
	move.l 96(sp),a0			
	move.b d1,(a0)				
_?L5168:					
						
	move.b 16(a4),d0			
	cmp.b #5,d0				
	jbls _?L5209				
						
	subq.b #6,d0				
	move.b d0,16(a4)			
						
	jbeq _?L5218				
						
	and.l #255,d0				
						
	moveq #64,d2				
	sub.l d0,d2				
						
	moveq #32,d1				
	sub.l d0,d1				
	jbmi _?L5171				
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
_?L5285:					
	move.l 92(sp),a0			
	move.l d2,(a0)				
	jbra _?L5280				
_?L5282:					
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	moveq #9,d1				
	cmp.l d0,d1				
	jbeq _?L5147				
						
	move.l 20(a4),d2			
						
	moveq #-1,d4				
	jbra _?L5284				
_?L5211:					
						
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
	jbra _?L5281				
_?L5278:					
						
	move.w a2,d0				
	subq.b #8,d0				
						
	move.l 8(a4),36(sp)			
	move.l 12(a4),52(sp)			
	jbra _?L5189				
_?L5196:					
						
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
	jbra _?L5202				
_?L5264:					
						
	move.l 20(a4),d2			
_?L5263:					
						
	clr.l d4				
						
	move.l 92(sp),a0			
	move.l d2,(a0)				
	jbra _?L5280				
_?L5219:					
	sub.l a1,a1				
	clr.l d2				
	jbra _?L5192				
_?L5193:					
						
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
	jbra _?L5192				
_?L5218:					
						
	clr.l d1				
	clr.l d0				
						
	and.l d1,8(a4)				
	and.l d0,12(a4)				
						
	clr.l 170(a4)				
						
	moveq #10,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),d2			
	moveq #1,d4				
	jbra _?L5285				
_?L5171:					
						
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
	jbra _?L5285				
_?L5220:					
						
	move.w d0,a2				
	jbra _?L5188				
_?L5283:					
						
	move.b d6,d5				
	subq.b #8,d5				
						
	move.l 8(a4),d7				
	move.l 12(a4),a3			
	jbra _?L5152				
_?L5209:					
	jbsr (_miniflac_bitreader_discard?part?0)
_?L5271:					
						
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 92(sp),a0			
	move.l d1,(a0)				
	jbra _?L5273				
_?L5159:					
						
	clr.l 8(a4)				
	clr.l 12(a4)				
						
	addq.l #1,d4				
	move.l d4,170(a4)			
						
	moveq #12,d1				
	cmp.l d4,d1				
	jbne _?L5162				
						
	clr.l 170(a4)				
						
	moveq #8,d2				
	move.l d2,166(a4)			
	jbra _?L5148				
_?L5156:					
						
	moveq #-1,d7				
	moveq #31,d2				
	sub.l d0,d2				
	moveq #-2,d1				
	lsl.l d2,d1				
	move.l d7,d6				
	lsr.l d0,d6				
	or.l d1,d6				
	lsr.l d0,d7				
	jbra _?L5162				
_?L5217:					
						
	move.l d0,d4				
	move.b d5,d6				
	jbra _?L5151				
_?L5216:					
	clr.l d1				
	jbra _?L5154				
						
	.align	2				
	.globl	_mflac_cuesheet_track_preemph_flag
						
_mflac_cuesheet_track_preemph_flag:		
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_cuesheet_track_preemph_flag,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L5297				
_?L5289:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5286				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L5289				
_?L5297:					
						
	tst.l d0				
	jble _?L5286				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L5286:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_track_indexpoints
						
_miniflac_cuesheet_track_indexpoints:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a6			
	move.l 56(sp),a4			
	move.l 60(sp),d4			
						
	move.l 4(a6),d0				
	jbne _?L5299				
						
	tst.l d4				
	jbeq _?L5317				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5322				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5322:					
	move.l 4(a6),d0				
_?L5299:					
						
	subq.l #1,d0				
	jbeq _?L5323				
						
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
_?L5316:					
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5307				
	move.l 40(sp),28(a6)			
	move.l 44(sp),24(a6)			
	clr.l 20(a6)				
_?L5308:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L5311				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5308				
_?L5309:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	move.l 52(a6),d1			
	tst.l d0				
	jbne _?L5315				
	cmp.l d4,d1				
	jbcs _?L5316				
_?L5315:					
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L5325:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5311:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L5324				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5309				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L5311				
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d0				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5325				
_?L5323:					
	move.l a4,28(a6)			
	move.l d4,24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5302:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L5326				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5302				
_?L5303:					
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
_?L5328:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5324:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	move.l d7,-(sp)				
	jbsr _miniflac_cuesheet_read_track_indexpoints
	lea (12,sp),sp				
	jbra _?L5309				
_?L5317:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5307:					
	move.l 52(a6),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5325				
_?L5326:					
	lea _miniflac_sync_internal,a3		
_?L5305:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L5327				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5303				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L5305				
	moveq #-1,d0				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L5328				
_?L5327:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_indexpoints
	lea (12,sp),sp				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L5328				
						
	.align	2				
	.globl	_mflac_cuesheet_track_indexpoints
						
_mflac_cuesheet_track_indexpoints:		
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_cuesheet_track_indexpoints,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L5340				
_?L5332:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5329				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L5332				
_?L5340:					
						
	tst.l d0				
	jble _?L5329				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L5329:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_index_point_offset
						
_miniflac_cuesheet_index_point_offset:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a6			
	move.l 56(sp),a4			
	move.l 60(sp),d4			
						
	move.l 4(a6),d0				
	jbne _?L5342				
						
	tst.l d4				
	jbeq _?L5360				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5365				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5365:					
	move.l 4(a6),d0				
_?L5342:					
						
	subq.l #1,d0				
	jbeq _?L5366				
						
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
_?L5359:					
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5350				
	move.l 40(sp),28(a6)			
	move.l 44(sp),24(a6)			
	clr.l 20(a6)				
_?L5351:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L5354				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5351				
_?L5352:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	move.l 52(a6),d1			
	tst.l d0				
	jbne _?L5358				
	cmp.l d4,d1				
	jbcs _?L5359				
_?L5358:					
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L5368:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5354:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L5367				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5352				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L5354				
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d0				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5368				
_?L5366:					
	move.l a4,28(a6)			
	move.l d4,24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5345:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L5369				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5345				
_?L5346:					
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
_?L5371:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5367:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	move.l d7,-(sp)				
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
	jbra _?L5352				
_?L5360:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5350:					
	move.l 52(a6),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5368				
_?L5369:					
	lea _miniflac_sync_internal,a3		
_?L5348:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L5370				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5346				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L5348				
	moveq #-1,d0				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L5371				
_?L5370:					
	move.l 68(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L5371				
						
	.align	2				
	.globl	_mflac_cuesheet_index_point_offset
						
_mflac_cuesheet_index_point_offset:		
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_cuesheet_index_point_offset,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L5383				
_?L5375:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5372				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L5375				
_?L5383:					
						
	tst.l d0				
	jble _?L5372				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L5372:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_index_point_number
						
_miniflac_cuesheet_index_point_number:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L5385				
						
	tst.l 60(sp)				
	jbeq _?L5415				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5440				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5440:					
	move.l 4(a4),d0				
_?L5385:					
						
	subq.l #1,d0				
	jbeq _?L5441				
						
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
_?L5414:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5401				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L5402:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5405				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5402				
_?L5403:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L5442				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L5414				
_?L5447:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L5444:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5405:					
	moveq #5,d1				
	cmp.l 114(a4),d1			
	jbeq _?L5443				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5403				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5405				
_?L5406:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5444				
_?L5441:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5388:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5445				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d5				
	cmp.l d0,d5				
	jbeq _?L5388				
_?L5435:					
	move.l 20(a4),d2			
_?L5389:					
	move.l 64(sp),a0			
	move.l d2,(a0)				
_?L5450:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5443:					
						
	move.l 166(a4),d0			
						
	moveq #12,d1				
	cmp.l d0,d1				
	jbcs _?L5446				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5403				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L5411				
_?L5448:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L5414				
	jbra _?L5447				
_?L5446:					
						
	moveq #13,d1				
	cmp.l d0,d1				
	jbne _?L5406				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5448				
	jbra _?L5411				
_?L5415:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5411:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L5413				
						
	move.l 68(sp),a0			
	move.b d1,(a0)				
_?L5413:					
						
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
	jbra _?L5444				
_?L5401:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5444				
_?L5445:					
	lea _miniflac_sync_internal,a3		
_?L5391:					
	moveq #5,d0				
	cmp.l 114(a4),d0			
	jbeq _?L5449				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5435				
	moveq #4,d5				
	cmp.l (a4),d5				
	jbeq _?L5391				
	move.l 20(a4),d2			
						
	moveq #-1,d4				
_?L5453:					
						
	move.l 64(sp),a0			
	move.l d2,(a0)				
	jbra _?L5450				
_?L5449:					
						
	move.l 166(a4),d0			
						
	moveq #12,d1				
	cmp.l d0,d1				
	jbcs _?L5451				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	pea 166(a4)				
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5435				
_?L5395:					
						
	move.b 16(a4),d4			
						
	cmp.b #7,d4				
	jbhi _?L5399				
						
	move.l 20(a4),d2			
						
	cmp.l 24(a4),d2				
	jbcc _?L5452				
						
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
_?L5399:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L5398				
						
	move.l 68(sp),a0			
	move.b d1,(a0)				
_?L5398:					
						
	clr.l 170(a4)				
						
	moveq #14,d0				
	move.l d0,166(a4)			
						
	move.l 20(a4),d2			
	moveq #1,d4				
	move.l 64(sp),a0			
	move.l d2,(a0)				
	jbra _?L5450				
_?L5451:					
						
	moveq #13,d5				
	cmp.l d0,d5				
	jbeq _?L5395				
						
	move.l 20(a4),d2			
						
	moveq #-1,d4				
	jbra _?L5453				
_?L5452:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l d2,(a0)				
	jbra _?L5450				
_?L5442:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5444				
						
	.align	2				
	.globl	_mflac_cuesheet_index_point_number
						
_mflac_cuesheet_index_point_number:		
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_cuesheet_index_point_number,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L5465				
_?L5457:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5454				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L5457				
_?L5465:					
						
	tst.l d0				
	jble _?L5454				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L5454:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_seektable_seekpoints	
						
_miniflac_seektable_seekpoints:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a6			
	move.l 56(sp),a4			
	move.l 60(sp),d5			
						
	move.l 4(a6),d0				
	jbne _?L5467				
						
	tst.l d5				
	jbeq _?L5489				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a6,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5498				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5498:					
	move.l 4(a6),d0				
_?L5467:					
						
	subq.l #1,d0				
	jbeq _?L5499				
						
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
_?L5488:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5477				
	move.l 40(sp),28(a6)			
	move.l 44(sp),24(a6)			
	clr.l 20(a6)				
_?L5478:					
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L5481				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5478				
_?L5479:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	move.l 52(a6),d1			
	tst.l d0				
	jbne _?L5500				
	cmp.l d5,d1				
	jbcs _?L5488				
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L5502:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5481:					
	moveq #3,d1				
	cmp.l 114(a6),d1			
	jbeq _?L5501				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5479				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L5481				
_?L5482:					
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5502				
_?L5499:					
	move.l a4,28(a6)			
	move.l d5,24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5470:					
	moveq #4,d1				
	cmp.l (a6),d1				
	jbeq _?L5503				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5470				
_?L5471:					
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
_?L5505:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5501:					
						
	tst.l 178(a6)				
	jbne _?L5482				
						
	tst.l 68(sp)				
	jbeq _?L5495				
						
	move.l 68(sp),a0			
	move.l 182(a6),(a0)			
_?L5495:					
						
	move.l 20(a6),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a6),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5502				
_?L5489:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5477:					
	move.l 52(a6),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5502				
_?L5503:					
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5473:					
	moveq #3,d0				
	cmp.l 114(a6),d0			
	jbeq _?L5504				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5471				
	moveq #4,d1				
	cmp.l (a6),d1				
	jbeq _?L5473				
_?L5475:					
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L5505				
_?L5504:					
						
	tst.l 178(a6)				
	jbne _?L5475				
						
	tst.l 68(sp)				
	jbeq _?L5476				
						
	move.l 68(sp),a0			
	move.l 182(a6),(a0)			
_?L5476:					
						
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L5505				
_?L5500:					
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5502				
						
	.align	2				
	.globl	_mflac_seektable_seekpoints	
						
_mflac_seektable_seekpoints:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_seektable_seekpoints,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L5517				
_?L5509:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5506				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L5509				
_?L5517:					
						
	tst.l d0				
	jble _?L5506				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L5506:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L5519				
						
	tst.l d3				
	jbeq _?L5526				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbeq _?L5530				
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5530:					
	move.l 4(a3),d0				
_?L5519:					
						
	subq.l #1,d0				
	jbeq _?L5531				
						
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
_?L5525:					
	move.l d5,-(sp)				
	move.l d7,-(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d6				
	moveq #1,d0				
	cmp.l d6,d0				
	jbne _?L5522				
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
	jbne _?L5524				
	cmp.l d3,d1				
	jbcs _?L5525				
_?L5524:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L5532:					
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5531:					
	move.l d4,72(sp)			
	move.l 36(sp),68(sp)			
	move.l d3,64(sp)			
	move.l a4,60(sp)			
	move.l a3,56(sp)			
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	jbra _miniflac_seektable_sample_number_native
_?L5526:					
						
	clr.l d6				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5522:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L5532				
						
	.align	2				
	.globl	_mflac_seektable_sample_number	
						
_mflac_seektable_sample_number:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_seektable_sample_number,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L5544				
_?L5536:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5533				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L5536				
_?L5544:					
						
	tst.l d0				
	jble _?L5533				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L5533:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_seektable_sample_offset
						
_miniflac_seektable_sample_offset:		
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L5546				
						
	tst.l 60(sp)				
	jbeq _?L5577				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5598				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5598:					
	move.l 4(a4),d0				
_?L5546:					
						
	subq.l #1,d0				
	jbeq _?L5599				
						
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
_?L5576:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5560				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L5561:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5564				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5561				
_?L5562:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L5600				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L5576				
_?L5604:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L5602:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5564:					
	moveq #3,d1				
	cmp.l 114(a4),d1			
	jbeq _?L5601				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5562				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5564				
_?L5565:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5602				
_?L5599:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5549:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L5603				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5549				
_?L5550:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L5607:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5601:					
						
	move.l 178(a4),d0			
						
	jbeq _?L5567				
	subq.l #1,d0				
	jbne _?L5565				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L5574				
_?L5595:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L5576				
	jbra _?L5604				
_?L5567:					
						
	move.l 186(a4),a0			
	cmp.l 182(a4),a0			
	jbeq _?L5605				
						
	pea 64.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L5595				
						
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
	jbne _?L5595				
_?L5574:					
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L5575				
						
	move.l 68(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L5575:					
						
	moveq #2,d0				
	move.l d0,178(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5602				
_?L5577:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5605:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
						
	moveq #2,d4				
						
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5602				
_?L5560:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5602				
_?L5603:					
	lea _miniflac_sync_internal,a3		
_?L5552:					
	moveq #3,d0				
	cmp.l 114(a4),d0			
	jbeq _?L5606				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5550				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L5552				
_?L5556:					
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5607				
_?L5606:					
						
	move.l 178(a4),d0			
						
	jbeq _?L5554				
	subq.l #1,d0				
	jbne _?L5556				
	lea _miniflac_bitreader_fill_nocrc,a1	
_?L5555:					
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5558				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L5559				
						
	move.l 68(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L5559:					
						
	moveq #2,d0				
	move.l d0,178(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5607				
_?L5558:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5607				
_?L5554:					
						
	move.l 186(a4),a0			
	cmp.l 182(a4),a0			
	jbeq _?L5578				
						
	pea 64.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L5558				
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,178(a4)			
	move.l 36(sp),a1			
	jbra _?L5555				
_?L5578:					
						
	moveq #2,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5607				
_?L5600:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5602				
						
	.align	2				
	.globl	_mflac_seektable_sample_offset	
						
_mflac_seektable_sample_offset:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_seektable_sample_offset,a4
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L5619				
_?L5611:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5608				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L5611				
_?L5619:					
						
	tst.l d0				
	jble _?L5608				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L5608:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_seektable_samples	
						
_miniflac_seektable_samples:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L5621				
						
	tst.l 60(sp)				
	jbeq _?L5655				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5683				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5683:					
	move.l 4(a4),d0				
_?L5621:					
						
	subq.l #1,d0				
	jbeq _?L5684				
						
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
_?L5654:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5636				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L5637:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5640				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5637				
_?L5638:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L5685				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L5654				
_?L5691:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L5687:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5640:					
	moveq #3,d1				
	cmp.l 114(a4),d1			
	jbeq _?L5686				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5638				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5640				
_?L5641:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5687				
_?L5684:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5624:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L5688				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5624				
_?L5625:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L5693:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5686:					
						
	move.l 178(a4),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L5689				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a1	
	jbeq _?L5646				
						
	move.l 186(a4),a0			
	cmp.l 182(a4),a0			
	jbeq _?L5647				
						
	pea 64.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbeq _?L5690				
_?L5648:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L5654				
	jbra _?L5691				
_?L5689:					
						
	subq.l #2,d0				
	jbne _?L5641				
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5648				
_?L5651:					
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L5652				
						
	move.l 68(sp),a0			
	move.w d1,(a0)				
_?L5652:					
						
	addq.l #1,186(a4)			
						
	clr.l 178(a4)				
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5687				
_?L5655:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5690:					
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,178(a4)			
	move.l 36(sp),a1			
_?L5646:					
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L5648				
						
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
	jbne _?L5648				
	jbra _?L5651				
_?L5636:					
						
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5687				
_?L5688:					
	lea _miniflac_sync_internal,a3		
_?L5627:					
	moveq #3,d0				
	cmp.l 114(a4),d0			
	jbeq _?L5692				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5625				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L5627				
	moveq #-1,d4				
_?L5695:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5693				
_?L5692:					
						
	move.l 178(a4),d0			
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcs _?L5694				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a1	
	jbeq _?L5632				
						
	move.l 186(a4),a0			
	cmp.l 182(a4),a0			
	jbeq _?L5656				
						
	pea 64.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a1	
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L5634				
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,178(a4)			
	move.l 36(sp),a1			
_?L5632:					
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 36(sp),a1			
	tst.l d0				
	jbne _?L5634				
						
	pea 64.w				
	move.l d3,-(sp)				
	move.l a1,44(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,178(a4)			
	move.l 36(sp),a1			
_?L5630:					
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5634				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L5635				
						
	move.l 68(sp),a0			
	move.w d1,(a0)				
_?L5635:					
						
	addq.l #1,186(a4)			
						
	clr.l 178(a4)				
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5693				
_?L5694:					
	lea _miniflac_bitreader_fill_nocrc,a1	
						
	subq.l #2,d0				
	jbeq _?L5630				
						
	moveq #-1,d4				
	jbra _?L5695				
_?L5647:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
						
	moveq #2,d4				
						
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5687				
_?L5634:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5693				
_?L5685:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5687				
_?L5656:					
						
	moveq #2,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5693				
						
	.align	2				
	.globl	_mflac_seektable_samples	
						
_mflac_seektable_samples:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_seektable_samples,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L5707				
_?L5699:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5696				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L5699				
_?L5707:					
						
	tst.l d0				
	jble _?L5696				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L5696:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_application_id	
						
_miniflac_application_id:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L5709				
						
	tst.l 60(sp)				
	jbeq _?L5732				
	subq.l #4,sp				
	move.l d5,a0				
	move.b (a0),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5747				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5747:					
	move.l 4(a4),d0				
_?L5709:					
						
	subq.l #1,d0				
	jbeq _?L5748				
						
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
_?L5731:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5719				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L5720:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5723				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5720				
_?L5721:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 36(sp),d0			
	jbne _?L5749				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L5731				
_?L5753:					
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L5751:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5723:					
	moveq #2,d1				
	cmp.l 114(a4),d1			
	jbeq _?L5750				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5721				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5723				
_?L5724:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5751				
_?L5748:					
	move.l d5,28(a4)			
	move.l 60(sp),24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5712:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L5752				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5712				
_?L5713:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L5755:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5750:					
						
	tst.l 190(a4)				
	jbne _?L5724				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L5727				
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	cmp.l 60(sp),d1				
	jbcs _?L5731				
	jbra _?L5753				
_?L5732:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5727:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L5729				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L5729:					
						
	moveq #1,d0				
	move.l d0,190(a4)			
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5751				
_?L5719:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5751				
_?L5752:					
	lea _miniflac_sync_internal,a3		
_?L5715:					
	moveq #2,d0				
	cmp.l 114(a4),d0			
	jbeq _?L5754				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5713				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L5715				
_?L5717:					
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5755				
_?L5754:					
						
	tst.l 190(a4)				
	jbne _?L5717				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5733				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 68(sp)				
	jbeq _?L5718				
						
	move.l 68(sp),a0			
	move.l d1,(a0)				
_?L5718:					
						
	moveq #1,d0				
	move.l d0,190(a4)			
	moveq #1,d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5755				
_?L5733:					
						
	clr.l d4				
						
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5755				
_?L5749:					
	move.l 52(a4),d1			
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5751				
						
	.align	2				
	.globl	_mflac_application_id		
						
_mflac_application_id:				
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_application_id,a4		
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L5767				
_?L5759:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5756				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L5759				
_?L5767:					
						
	tst.l d0				
	jble _?L5756				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L5756:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L5769				
						
	tst.l d3				
	jbeq _?L5776				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d6				
						
	moveq #1,d0				
	cmp.l d6,d0				
	jbeq _?L5780				
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5780:					
	move.l 4(a3),d0				
_?L5769:					
						
	subq.l #1,d0				
	jbeq _?L5781				
						
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
_?L5775:					
	move.l d5,-(sp)				
	move.l d7,-(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d6				
	moveq #1,d0				
	cmp.l d6,d0				
	jbne _?L5772				
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
	jbne _?L5774				
	cmp.l d3,d1				
	jbcs _?L5775				
_?L5774:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L5782:					
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5781:					
	move.l d4,72(sp)			
	move.l 36(sp),68(sp)			
	move.l d3,64(sp)			
	move.l a4,60(sp)			
	move.l a3,56(sp)			
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	jbra _miniflac_application_length_native
_?L5776:					
						
	clr.l d6				
						
	move.l d6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5772:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L5782				
						
	.align	2				
	.globl	_mflac_application_length	
						
_mflac_application_length:			
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_application_length,a4	
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L5794				
_?L5786:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5783				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L5786				
_?L5794:					
						
	tst.l d0				
	jble _?L5783				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L5783:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_application_data	
						
_miniflac_application_data:			
	lea (-20,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 60(sp),a3			
						
	move.l 4(a3),d0				
	jbne _?L5796				
						
	tst.l 68(sp)				
	jbeq _?L5860				
	subq.l #4,sp				
	move.l 68(sp),a0			
	move.b (a0),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5884				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L5884:					
	move.l 4(a3),d0				
_?L5796:					
						
	subq.l #1,d0				
	jbeq _?L5885				
						
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
_?L5859:					
	move.l d5,-(sp)				
	pea 52(sp)				
	move.l 72(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5819				
	move.l 48(sp),28(a3)			
	move.l 52(sp),24(a3)			
	clr.l 20(a3)				
_?L5820:					
	moveq #4,d6				
	cmp.l (a3),d6				
	jbeq _?L5823				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5820				
_?L5821:					
	move.l 20(a3),d1			
_?L5825:					
	move.l d1,-(sp)				
	move.l a3,-(sp)				
	move.l d0,48(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l 40(sp),d0			
	jbne _?L5886				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L5859				
_?L5892:					
	clr.l d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
_?L5888:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L5823:					
	moveq #2,d0				
	cmp.l 114(a3),d0			
	jbeq _?L5887				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5821				
	moveq #4,d6				
	cmp.l (a3),d6				
	jbeq _?L5823				
_?L5826:					
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	moveq #-1,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L5888				
_?L5885:					
	move.l 64(sp),28(a3)			
	move.l 68(sp),24(a3)			
	clr.l 20(a3)				
	move.l a3,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a4		
_?L5799:					
	moveq #4,d0				
	cmp.l (a3),d0				
	jbeq _?L5889				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d6				
	cmp.l d0,d6				
	jbeq _?L5799				
_?L5800:					
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
_?L5896:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L5887:					
						
	move.l 190(a3),d0			
						
	jbeq _?L5828				
	subq.l #1,d0				
	jbne _?L5826				
_?L5829:					
						
	move.l 198(a3),a1			
						
	move.l 194(a3),d2			
						
	cmp.l d2,a1				
	jbcc _?L5848				
	tst.l 76(sp)				
	jbeq _?L5890				
_?L5849:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L5891				
_?L5842:					
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L5852				
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
						
	jbeq _?L5861				
_?L5893:					
						
	move.w #64,a0				
	sub.l d7,a0				
						
	moveq #32,d0				
	sub.l d7,d0				
	jbmi _?L5835				
	moveq #-1,d1				
	lsr.l d0,d1				
	move.l d1,a2				
	clr.l d0				
						
	and.l d6,d0				
	move.l d0,a0				
	move.l a2,d0				
	and.l 36(sp),d0				
_?L5834:					
	move.l a0,8(a3)				
	move.l d0,12(a3)			
						
	cmp.l 80(sp),a1				
	jbcc _?L5837				
						
	move.w #-32,a0				
	add.l d7,a0				
	tst.l a0				
	jblt _?L5838				
	move.l a0,d0				
	lsr.l d0,d6				
						
	move.l 76(sp),a0			
	move.b d6,(a0,a1.l)			
						
	move.l 198(a3),a1			
	addq.l #1,a1				
	move.l a1,198(a3)			
						
	move.l 194(a3),d2			
						
	cmp.l d2,a1				
	jbcs _?L5849				
_?L5848:					
						
	tst.l 84(sp)				
	jbeq _?L5844				
						
	move.l 80(sp),d0			
	cmp.l d0,d2				
	jbcc _?L5845				
	move.l d2,d0				
_?L5845:					
						
	move.l 84(sp),a2			
	move.l d0,(a2)				
_?L5844:					
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L5888				
_?L5852:					
	move.l 44(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L5859				
	jbra _?L5892				
_?L5837:					
						
	move.l 198(a3),a1			
	addq.l #1,a1				
	move.l a1,198(a3)			
						
	cmp.l a1,d2				
	jbls _?L5848				
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbls _?L5842				
_?L5891:					
						
	move.l 8(a3),d6				
	move.l 12(a3),36(sp)			
						
	subq.b #8,d0				
	move.b d0,16(a3)			
						
	clr.l d7				
	move.b d0,d7				
						
	jbne _?L5893				
_?L5861:					
	sub.l a0,a0				
	clr.l d0				
	jbra _?L5834				
_?L5835:					
						
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
	jbra _?L5834				
_?L5838:					
						
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
						
	cmp.l d2,a1				
	jbcs _?L5849				
	jbra _?L5848				
_?L5860:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (20,sp),sp				
	rts					
_?L5890:					
						
	move.w #-1,a1				
_?L5858:					
						
	move.b 16(a3),d0			
						
	cmp.b #7,d0				
	jbhi _?L5894				
						
	move.l 20(a3),44(sp)			
						
	move.l 44(sp),d1			
	cmp.l 24(a3),d1				
	jbcc _?L5852				
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
_?L5851:					
						
	move.b d0,16(a3)			
						
	jbeq _?L5853				
						
	and.l #255,d0				
						
	move.w #64,a0				
	sub.l d0,a0				
						
	moveq #32,d7				
	sub.l d0,d7				
	jbmi _?L5854				
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
	jbcs _?L5858				
	jbra _?L5848				
_?L5853:					
						
	clr.l 8(a3)				
	clr.l 12(a3)				
						
	move.l 198(a3),d0			
	addq.l #1,d0				
	move.l d0,198(a3)			
						
	cmp.l d2,d0				
	jbcs _?L5858				
	jbra _?L5848				
_?L5854:					
						
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
	jbcs _?L5858				
	jbra _?L5848				
_?L5819:					
						
	move.l 52(a3),d1			
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L5888				
_?L5889:					
	lea _miniflac_sync_internal,a4		
_?L5802:					
	moveq #2,d0				
	cmp.l 114(a3),d0			
	jbeq _?L5895				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5800				
	moveq #4,d6				
	cmp.l (a3),d6				
	jbeq _?L5802				
_?L5803:					
	moveq #-1,d4				
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L5896				
_?L5828:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L5847				
						
	move.l 20(a3),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a3),d1			
	cmp.l 68(sp),d1				
	jbcs _?L5859				
	jbra _?L5892				
_?L5894:					
						
	move.l 8(a3),d6				
	move.l 12(a3),44(sp)			
						
	subq.b #8,d0				
	jbra _?L5851				
_?L5847:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,190(a3)			
	jbra _?L5829				
_?L5895:					
						
	move.l 190(a3),d0			
						
	jbeq _?L5805				
	subq.l #1,d0				
	jbne _?L5803				
_?L5806:					
						
	move.l 198(a3),d4			
						
	move.l 194(a3),d5			
						
	cmp.l d4,d5				
	jbls _?L5818				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
	tst.l 76(sp)				
	jbeq _?L5809				
_?L5807:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5816				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	cmp.l 80(sp),d4				
	jbcc _?L5812				
						
	move.l 76(sp),a0			
	move.b d1,(a0,d4.l)			
_?L5812:					
						
	move.l 198(a3),d4			
	addq.l #1,d4				
	move.l d4,198(a3)			
						
	move.l 194(a3),d5			
						
	cmp.l d4,d5				
	jbhi _?L5807				
_?L5818:					
						
	tst.l 84(sp)				
	jbeq _?L5814				
						
	move.l 80(sp),d0			
	cmp.l d0,d5				
	jbcc _?L5815				
	move.l d5,d0				
_?L5815:					
						
	move.l 84(sp),a2			
	move.l d0,(a2)				
_?L5814:					
						
	moveq #1,d4				
						
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L5896				
_?L5809:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5816				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 198(a3),d0			
	addq.l #1,d0				
	move.l d0,198(a3)			
						
	cmp.l d0,d5				
	jbhi _?L5809				
	jbra _?L5818				
_?L5816:					
						
	clr.l d4				
						
	move.l 72(sp),a0			
	move.l 20(a3),(a0)			
	jbra _?L5896				
_?L5805:					
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L5816				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,190(a3)			
	jbra _?L5806				
_?L5886:					
						
	move.l 52(a3),d1			
	move.l d0,d4				
	move.l 72(sp),a0			
	move.l d1,(a0)				
	jbra _?L5888				
						
	.align	2				
	.globl	_mflac_application_data		
						
_mflac_application_data:			
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),d6			
	move.l 44(sp),d5			
	move.l 48(sp),d4			
						
	clr.l 28(sp)				
	move.l 482(a4),d0			
	move.l 478(a4),d1			
	moveq #28,d3				
	add.l sp,d3				
	lea _miniflac_application_data,a3	
	move.l a4,d7				
	add.l #486,d7				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbne _?L5908				
_?L5900:					
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5897				
						
	move.l d0,482(a4)			
	clr.l 478(a4)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbeq _?L5900				
_?L5908:					
						
	tst.l d0				
	jble _?L5897				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L5897:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
	.align	2				
	.globl	_miniflac_padding_length	
						
_miniflac_padding_length:			
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 52(sp),a4			
	move.l 56(sp),a5			
	move.l 60(sp),d5			
						
	move.l 4(a4),d0				
	jbne _?L5910				
						
	tst.l d5				
	jbeq _?L5930				
	subq.l #4,sp				
	move.b (a5),3(sp)			
	move.l a4,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5938				
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5938:					
	move.l 4(a4),d0				
_?L5910:					
						
	subq.l #1,d0				
	jbeq _?L5939				
						
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
_?L5929:					
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l a5,-(sp)				
	move.l a4,-(sp)				
	jbsr (a6)				
	lea (16,sp),sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5919				
	move.l 40(sp),28(a4)			
	move.l 44(sp),24(a4)			
	clr.l 20(a4)				
_?L5920:					
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5923				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L5920				
_?L5921:					
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	move.l d0,44(sp)			
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 36(sp),d0			
	move.l 52(a4),d1			
	tst.l d0				
	jbne _?L5940				
	cmp.l d5,d1				
	jbcs _?L5929				
	clr.l d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
_?L5942:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5923:					
	moveq #1,d1				
	cmp.l 114(a4),d1			
	jbeq _?L5941				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L5921				
	moveq #4,d0				
	cmp.l (a4),d0				
	jbeq _?L5923				
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5942				
_?L5939:					
	move.l a5,28(a4)			
	move.l d5,24(a4)			
	clr.l 20(a4)				
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5913:					
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L5943				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbeq _?L5913				
_?L5914:					
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
_?L5945:					
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5941:					
						
	tst.l 68(sp)				
	jbeq _?L5926				
						
	move.l 68(sp),a0			
	move.l 202(a4),(a0)			
_?L5926:					
						
	move.l 20(a4),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_oggfunction_end		
	addq.l #8,sp				
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5942				
_?L5930:					
						
	clr.l d4				
						
	move.l d4,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (12,sp),sp				
	rts					
_?L5919:					
	move.l 52(a4),d1			
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5942				
_?L5943:					
	move.l a4,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L5916:					
	moveq #1,d0				
	cmp.l 114(a4),d0			
	jbeq _?L5944				
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
	moveq #1,d0				
	cmp.l d4,d0				
	jbne _?L5914				
	moveq #4,d1				
	cmp.l (a4),d1				
	jbeq _?L5916				
	moveq #-1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5945				
_?L5944:					
						
	tst.l 68(sp)				
	jbeq _?L5918				
						
	move.l 68(sp),a0			
	move.l 202(a4),(a0)			
_?L5918:					
						
	moveq #1,d4				
	move.l 64(sp),a0			
	move.l 20(a4),(a0)			
	jbra _?L5945				
_?L5940:					
	move.l d0,d4				
	move.l 64(sp),a0			
	move.l d1,(a0)				
	jbra _?L5942				
						
	.align	2				
	.globl	_mflac_padding_length		
						
_mflac_padding_length:				
	subq.l #4,sp				
	movem.l d3/d4/d5/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d4			
						
	clr.l 20(sp)				
	move.l 482(a3),d0			
	move.l 478(a3),d1			
	moveq #20,d3				
	add.l sp,d3				
	lea _miniflac_padding_length,a4		
	move.l a3,d5				
	add.l #486,d5				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbne _?L5957				
_?L5949:					
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5946				
						
	move.l d0,482(a3)			
	clr.l 478(a3)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a3,d1.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
	tst.l d0				
	jbeq _?L5949				
_?L5957:					
						
	tst.l d0				
	jble _?L5946				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L5946:					
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L5959				
						
	tst.l d3				
	jbeq _?L5966				
	subq.l #4,sp				
	move.b (a4),3(sp)			
	move.l a3,-(sp)				
	jbsr (_miniflac_probe?part?0?isra?0)	
	addq.l #8,sp				
	move.l d0,d7				
						
	moveq #1,d0				
	cmp.l d7,d0				
	jbeq _?L5970				
	move.l d7,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5970:					
	move.l 4(a3),d0				
_?L5959:					
						
	subq.l #1,d0				
	jbeq _?L5971				
						
	clr.l 40(sp)				
	clr.l 44(sp)				
	clr.l 48(sp)				
	move.l a4,60(a3)			
	move.l d3,56(a3)			
	clr.l 52(a3)				
	lea _miniflac_oggfunction_start,a5	
	lea _miniflac_oggfunction_end,a6	
_?L5965:					
	pea 44(sp)				
	pea 44(sp)				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
	move.l d0,d7				
	moveq #1,d0				
	cmp.l d7,d0				
	jbne _?L5962				
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
	jbne _?L5964				
	cmp.l d3,d1				
	jbcs _?L5965				
_?L5964:					
	move.l 36(sp),a0			
	move.l d1,(a0)				
_?L5972:					
	move.l d7,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5971:					
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
_?L5966:					
						
	clr.l d7				
						
	move.l d7,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (16,sp),sp				
	rts					
_?L5962:					
	move.l 52(a3),d1			
	move.l 36(sp),a0			
	move.l d1,(a0)				
	jbra _?L5972				
						
	.align	2				
	.globl	_mflac_padding_data		
						
_mflac_padding_data:				
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4,-(sp)	
	move.l 36(sp),a4			
	move.l 40(sp),d6			
	move.l 44(sp),d5			
	move.l 48(sp),d4			
						
	clr.l 28(sp)				
	move.l 482(a4),d0			
	move.l 478(a4),d1			
	moveq #28,d3				
	add.l sp,d3				
	lea _miniflac_padding_data,a3		
	move.l a4,d7				
	add.l #486,d7				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbne _?L5984				
_?L5976:					
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5973				
						
	move.l d0,482(a4)			
	clr.l 478(a4)				
	clr.l d1				
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	pea 486(a4,d1.l)			
	move.l a4,-(sp)				
	jbsr (a3)				
	lea (28,sp),sp				
	tst.l d0				
	jbeq _?L5976				
_?L5984:					
						
	tst.l d0				
	jble _?L5973				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L5973:					
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
	.data					
_?LC19:						
	.dc.b $50,$43,$4d,$38,$41
	.dc.b $00				
_?LC20:						
	.dc.b $50,$43,$4d,$38,$50,$50
	.dc.b $00				
_?LC21:						
	.dc.b $6d,$6f,$6e,$6f
	.dc.b $00				
_?LC22:						
	.dc.b $73,$74,$65,$72,$65,$6f
	.dc.b $00				
_?LC23:						
	.dc.b $2e,$66,$6c,$61
	.dc.b $00				
_?LC24:						
	.dc.b $72,$62
	.dc.b $00				
_?LC25:						
	.dc.b $0d,$4c,$6f,$61,$64,$69,$6e,$67
	.dc.b $20,$46,$4c,$41,$43,$20,$66,$69
	.dc.b $6c,$65,$2e,$2e,$2e,$1b,$5b,$30
	.dc.b $4b
	.dc.b $00				
_?LC26:						
	.dc.b $0d,$1b,$5b,$30,$4b
	.dc.b $00				
_?LC27:						
	.dc.b $46,$69,$6c,$65,$20,$6e,$61,$6d
	.dc.b $65,$20,$20,$20,$20,$20,$20,$3a
	.dc.b $20,$25,$73,$0a
	.dc.b $00				
_?LC28:						
	.dc.b $44,$61,$74,$61,$20,$73,$69,$7a
	.dc.b $65,$20,$20,$20,$20,$20,$20,$3a
	.dc.b $20,$25,$64,$20,$5b,$62,$79,$74
	.dc.b $65,$73,$5d,$0a
	.dc.b $00				
_?LC29:						
	.dc.b $46,$4c,$41,$43
	.dc.b $00				
_?LC30:						
	.dc.b $44,$61,$74,$61,$20,$66,$6f,$72
	.dc.b $6d,$61,$74,$20,$20,$20,$20,$3a
	.dc.b $20,$25,$73,$0a
	.dc.b $00				
_?LC31:						
	.dc.b $50,$43,$4d,$20,$64,$72,$69,$76
	.dc.b $65,$72,$20,$20,$20,$20,$20,$3a
	.dc.b $20,$25,$73,$20,$28,$76,$6f,$6c
	.dc.b $75,$6d,$65,$3a,$25,$64,$29,$0a
	.dc.b $00				
_?LC32:						
	.dc.b $46,$4c,$41,$43,$20,$66,$72,$65
	.dc.b $71,$75,$65,$6e,$63,$79,$20,$3a
	.dc.b $20,$25,$64,$20,$5b,$48,$7a,$5d
	.dc.b $0a
	.dc.b $00				
_?LC33:						
	.dc.b $46,$4c,$41,$43,$20,$63,$68,$61
	.dc.b $6e,$6e,$65,$6c,$73,$20,$20,$3a
	.dc.b $20,$25,$73,$0a
	.dc.b $00				
_?LC34:						
	.dc.b $46,$4c,$41,$43,$20,$62,$69,$74
	.dc.b $20,$64,$65,$70,$74,$68,$20,$3a
	.dc.b $20,$25,$64,$20,$5b,$62,$69,$74
	.dc.b $73,$5d,$0a
	.dc.b $00				
_?LC35:						
	.dc.b $46,$4c,$41,$43,$20,$74,$69,$74
	.dc.b $6c,$65,$20,$20,$20,$20,$20,$3a
	.dc.b $20,$25,$73,$0a
	.dc.b $00				
_?LC36:						
	.dc.b $46,$4c,$41,$43,$20,$61,$72,$74
	.dc.b $69,$73,$74,$20,$20,$20,$20,$3a
	.dc.b $20,$25,$73,$0a
	.dc.b $00				
_?LC37:						
	.dc.b $46,$4c,$41,$43,$20,$61,$6c,$62
	.dc.b $75,$6d,$20,$20,$20,$20,$20,$3a
	.dc.b $20,$25,$73,$0a
	.dc.b $00				
_?LC38:						
	.dc.b $0d,$4e,$6f,$77,$20,$62,$75,$66
	.dc.b $66,$65,$72,$69,$6e,$67,$20,$28
	.dc.b $25,$64,$2f,$25,$64,$29,$20,$2e
	.dc.b $2e,$2e,$20,$5b,$53,$48,$49,$46
	.dc.b $54,$5d,$20,$6b,$65,$79,$20,$74
	.dc.b $6f,$20,$63,$61,$6e,$63,$65,$6c
	.dc.b $2e
	.dc.b $00				
_?LC39:						
	.dc.b $0d,$1b,$5b,$4b,$43,$61,$6e,$63
	.dc.b $65,$6c,$65,$64,$2e
	.dc.b $00				
_?LC40:						
	.dc.b $0d,$1b,$5b,$30,$4b,$1b,$4d
	.dc.b $00				
_?LC41:						
	.dc.b $0a,$4e,$6f,$77,$20,$70,$6c,$61
	.dc.b $79,$69,$6e,$67,$20,$2e,$2e,$2e
	.dc.b $20,$70,$75,$73,$68,$20,$5b,$45
	.dc.b $53,$43,$5d,$2f,$5b,$51,$5d,$20
	.dc.b $6b,$65,$79,$20,$74,$6f,$20,$71
	.dc.b $75,$69,$74,$2e,$20,$5b,$53,$50
	.dc.b $41,$43,$45,$5d,$20,$74,$6f,$20
	.dc.b $70,$61,$75,$73,$65,$2e,$1b,$5b
	.dc.b $30,$4b
	.dc.b $00				
_?LC42:						
	.dc.b $0d,$0a,$53,$74,$6f,$70,$70,$65
	.dc.b $64,$2e
	.dc.b $00				
_?LC43:						
	.dc.b $0d,$0a,$46,$69,$6e,$69,$73,$68
	.dc.b $65,$64,$2e,$0d,$0a
	.dc.b $00				
_?LC44:						
	.dc.b $0a,$25,$73,$0a
	.dc.b $00				
_?LC45:						
	.dc.b $7c
	.dc.b $00				
_?LC46:						
	.dc.b $3e
	.dc.b $00				
_?LC47:						
	.dc.b $2a
	.dc.b $00				
_?LC48:						
	.dc.b $0d,$0a
	.dc.b $00				
_?LC49:						
	.dc.b $65,$72,$72,$6f,$72,$3a,$20,$25
	.dc.b $73,$0a
	.dc.b $00				
	.text					
	.align	2				
	.xref __main	* workaround for libc.
	.globl	_main				
						
_main:						
	link.w a6,#-904				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5,-(sp)	
	move.l 8(a6),d4				
	move.l 12(a6),d5			
						
	pea _abort_application			
	move.l #65521,-(sp)			
	jbsr _INTVCS				
	addq.l #8,sp				
						
	move.l d0,_g_abort_vector1		
						
	pea _abort_application			
	move.l #65522,-(sp)			
	jbsr _INTVCS				
	addq.l #8,sp				
						
	move.l d0,_g_abort_vector2		
						
	pea -1.w				
	jbsr _C_FNKMOD				
	addq.l #4,sp				
						
	move.l d0,_g_funckey_mode		
						
	clr.b -782(a6)				
						
	jbsr _ROMVER				
						
	cmp.l #318767103,d0			
	jbhi _?L6318				
_?L5987:					
						
	pea _cp932rsc_mpu_type			
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	moveq #1,d2				
	move.l d2,-896(a6)			
_?L5990:					
						
	jbsr _C_CURON				
						
	move.l _g_funckey_mode,d0		
						
	jbpl _?L6319				
_?L6157:					
						
	move.l _g_abort_vector1,-(sp)		
	move.l #65521,-(sp)			
	jbsr _INTVCS				
						
	addq.l #4,sp				
	move.l _g_abort_vector2,(sp)		
	move.l #65522,-(sp)			
	jbsr _INTVCS				
	addq.l #8,sp				
						
	pea 255.w				
	jbsr _KFLUSHIO				
	addq.l #4,sp				
						
	tst.b -782(a6)				
	jbne _?L6320				
_?L5985:					
						
	move.l -896(a6),d0			
	movem.l -936(a6),d3/d4/d5/d6/d7/a3/a4/a5
	unlk a6					
	rts					
_?L6318:					
						
	pea 52.w				
	clr.l -(sp)				
	pea -834(a6)				
	jbsr _memset				
						
	addq.l #8,sp				
	moveq #56,d6				
	move.l d6,(sp)				
	clr.l -(sp)				
	pea -526(a6)				
	jbsr _memset				
	lea (12,sp),sp				
						
	move.l #172,-838(a6)			
						
	pea -526(a6)				
	pea -838(a6)				
	jbsr _TRAP15				
	addq.l #8,sp				
						
	moveq #0,d0				
	not.b d0				
	and.l -526(a6),d0			
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbge _?L5987				
						
	moveq #1,d2				
	cmp.l d4,d2				
	jbge _?L6321				
						
	moveq #1,d3				
						
	clr.w -868(a6)				
						
	clr.w -892(a6)				
						
	clr.w -870(a6)				
						
	move.w #4,-884(a6)			
						
	move.w #1,-890(a6)			
						
	move.w #6,-872(a6)			
						
	clr.l d7				
	moveq #1,d0				
						
	lea _strlen,a3				
						
	lea _stricmp,a4				
	move.l #_?L5998,d6			
_?L5988:					
						
	lsl.l #2,d0				
	add.l d5,d0				
	move.l d0,-896(a6)			
	move.l d0,a0				
	move.l (a0),a5				
						
	cmp.b #45,(a5)				
	jbeq _?L6322				
_?L5991:					
						
	tst.l d7				
	jbne _?L6323				
						
	move.l a5,-(sp)				
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #4,d2				
	cmp.l d0,d2				
	jbcc _?L6006				
						
	pea _?LC23				
	pea -4(a5,d0.l)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L6006				
						
	move.l a5,d7				
_?L5994:					
	addq.w #1,d3				
						
	move.w d3,d0				
	ext.l d0				
	cmp.l d0,d4				
	jbgt _?L5988				
_?L6334:					
						
	tst.l d7				
	jbeq _?L6007				
						
	move.l d7,-(sp)				
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #4,d2				
	cmp.l d0,d2				
	jbcc _?L6007				
						
	jbsr _himem_isavailable			
						
	tst.l d0				
	jbeq _?L6010				
						
	jbsr _pcm8a_isavailable			
						
	tst.l d0				
	jbeq _?L6324				
						
	tst.w -892(a6)				
	jbeq _?L6017				
						
	jbsr _pcm8a_pause			
						
	jbsr _pcm8a_stop			
						
	clr.w d3				
_?L6016:					
						
	jbsr _C_CUROFF				
						
	tst.w -892(a6)				
	jble _?L6018				
						
	clr.l -(sp)				
	jbsr _B_SUPER				
	addq.l #4,sp				
_?L6018:					
						
	move.w #1,-878(a6)			
	clr.l -882(a6)				
	moveq #1,d2				
	move.l d2,-896(a6)			
						
	move.w -884(a6),a0			
	move.l a0,-854(a6)			
						
	move.l d7,-866(a6)			
	move.w d3,d7				
_?L6155:					
						
	tst.w -892(a6)				
	jbgt _?L6325				
_?L6021:					
						
	pea 526.w				
	clr.l -(sp)				
	pea -526(a6)				
	jbsr _memset				
	lea (12,sp),sp				
						
	pea -526(a6)				
	jbsr _flac_decode_init			
	addq.l #4,sp				
						
	tst.l d0				
	jbne _?L6326				
_?L6022:					
						
	pea _?LC24				
	move.l -866(a6),-(sp)			
	jbsr _fopen				
	addq.l #8,sp				
	move.l d0,d3				
						
	jbeq _?L6327				
						
	tst.w -892(a6)				
	jbgt _?L6328				
_?L6025:					
						
	pea 2.w					
	clr.l -(sp)				
	move.l d3,-(sp)				
	lea _fseek,a3				
	jbsr (a3)				
						
	addq.l #8,sp				
	move.l d3,(sp)				
	jbsr _ftell				
	move.l d0,d4				
						
	clr.l (sp)				
	clr.l -(sp)				
	move.l d3,-(sp)				
	jbsr (a3)				
						
	addq.l #8,sp				
	moveq #1,d2				
	move.l d2,(sp)				
	move.l d4,-(sp)				
	lea _himem_malloc,a5			
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,a3				
						
	tst.l d0				
	jbeq _?L6329				
						
	tst.w -870(a6)				
	jbeq _?L6161				
						
	pea _?LC25				
	move.l #_printf,-888(a6)		
	lea _printf,a1				
	jbsr (a1)				
						
	clr.l (sp)				
	move.l #524288,-(sp)			
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,d6				
						
	jbeq _?L6330				
						
	clr.l d5				
	lea _fread,a4				
_?L6028:					
						
	move.l d3,-(sp)				
	move.l #524288,-(sp)			
	pea 1.w					
	move.l d6,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
	move.l d0,-862(a6)			
						
	move.l d0,-(sp)				
	move.l d6,-(sp)				
	pea (a3,d5.l)				
	jbsr _memcpy				
	lea (12,sp),sp				
						
	add.l -862(a6),d5			
						
	cmp.l d4,d5				
	jbcs _?L6028				
						
	clr.l -(sp)				
	move.l d6,-(sp)				
	jbsr _himem_free			
						
	addq.l #4,sp				
	move.l #_?LC26,(sp)			
	move.l -888(a6),a0			
	jbsr (a0)				
	addq.l #4,sp				
_?L6029:					
						
	move.l d3,-(sp)				
	jbsr _fclose				
						
	move.l d4,(sp)				
	move.l a3,-(sp)				
	pea -526(a6)				
	jbsr _flac_decode_setup			
	lea (12,sp),sp				
						
	tst.l d0				
	jbne _?L6331				
						
	moveq #-9,d0				
	and.l -494(a6),d0			
	moveq #16,d1				
	cmp.l d0,d1				
	jbeq _?L6032				
						
	pea _cp932rsc_flac_bps_error		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,d6			
_?L6023:					
						
	tst.w d7				
	jbeq _?L6054				
_?L6063:					
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
_?L6140:					
						
	jbsr (a4)				
						
	move.w #19,a5				
	add.l d0,a5				
_?L6141:					
						
	jbsr (a4)				
						
	cmp.l a5,d0				
	jble _?L6141				
						
	tst.l d3				
	jbeq _?L6142				
						
	move.l d3,-(sp)				
	jbsr _fclose				
	addq.l #4,sp				
_?L6142:					
						
	tst.l a3				
	jbeq _?L6143				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
_?L6143:					
						
	pea -526(a6)				
	jbsr _flac_decode_close			
	addq.l #4,sp				
						
	tst.w d7				
	jbeq _?L6332				
						
	move.l _g_init_chain_table_ex,a3	
	lea _himem_free,a4			
						
	tst.l a3				
	jbeq _?L6152				
_?L6150:					
						
	move.l (a3),d0				
						
	jbeq _?L6151				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
_?L6151:					
						
	move.l 8(a3),d3				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d3				
	jbeq _?L6152				
						
	move.l d3,a3				
	jbra _?L6150				
_?L6322:					
						
	move.l a5,-(sp)				
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcc _?L5991				
						
	move.b 1(a5),d1				
						
	cmp.b #118,d1				
	jbeq _?L6333				
	move.b d1,d0				
	add.b #-98,d0				
	cmp.b #18,d0				
	jbhi _?L5996				
	and.l #255,d0				
	add.l d0,d0				
	move.l d0,a0				
	move.w (a0,d6.l),d0			
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L5998:					
	.dc.w _?L6001-_?L5998			
	.dc.w _?L5996-_?L5998			
	.dc.w _?L5996-_?L5998			
	.dc.w _?L5996-_?L5998			
	.dc.w _?L5996-_?L5998			
	.dc.w _?L5996-_?L5998			
	.dc.w _?L5996-_?L5998			
	.dc.w _?L5996-_?L5998			
	.dc.w _?L5996-_?L5998			
	.dc.w _?L5996-_?L5998			
	.dc.w _?L6000-_?L5998			
	.dc.w _?L5996-_?L5998			
	.dc.w _?L6160-_?L5998			
	.dc.w _?L5996-_?L5998			
	.dc.w _?L5996-_?L5998			
	.dc.w _?L5996-_?L5998			
	.dc.w _?L5996-_?L5998			
	.dc.w _?L5999-_?L5998			
	.dc.w _?L5997-_?L5998			
_?L5996:					
						
	cmp.b #104,d1				
	jbeq _?L6303				
						
	move.l a5,-(sp)				
	pea _cp932rsc_unknown_option		
	pea -782(a6)				
	jbsr _sprintf				
	lea (12,sp),sp				
						
	moveq #1,d2				
	move.l d2,-896(a6)			
_?L5995:					
						
	tst.w -892(a6)				
	jble _?L5990				
						
	clr.l -(sp)				
	clr.l -(sp)				
	clr.l -(sp)				
	lea _SCROLL,a3				
	jbsr (a3)				
						
	addq.l #8,sp				
	clr.l (sp)				
	clr.l -(sp)				
	pea 1.w					
	jbsr (a3)				
						
	addq.l #8,sp				
	clr.l (sp)				
	clr.l -(sp)				
	pea 2.w					
	jbsr (a3)				
						
	addq.l #8,sp				
	clr.l (sp)				
	clr.l -(sp)				
	pea 3.w					
	jbsr (a3)				
	lea (12,sp),sp				
						
	move.w #2,-838(a6)			
	clr.w -836(a6)				
	clr.w -834(a6)				
	move.w #768,-832(a6)			
	move.w #512,-830(a6)			
	clr.w -828(a6)				
						
	pea -838(a6)				
	jbsr _TXFILL				
						
	moveq #-2,d0				
	move.l d0,(sp)				
	pea 4.w					
	lea _TPALET2,a3				
	jbsr (a3)				
	addq.l #8,sp				
						
	pea -2.w				
	pea 5.w					
	jbsr (a3)				
	addq.l #8,sp				
						
	pea -2.w				
	pea 6.w					
	jbsr (a3)				
	addq.l #8,sp				
						
	pea -2.w				
	pea 7.w					
	jbsr (a3)				
	addq.l #8,sp				
						
	jbsr _C_CLS_AL				
						
	jbsr _G_CLR_ON				
						
	jbsr _C_CURON				
						
	move.l _g_funckey_mode,d0		
						
	jbmi _?L6157				
_?L6319:					
						
	move.l d0,-(sp)				
	jbsr _C_FNKMOD				
	addq.l #4,sp				
						
	move.l _g_abort_vector1,-(sp)		
	move.l #65521,-(sp)			
	jbsr _INTVCS				
						
	addq.l #4,sp				
	move.l _g_abort_vector2,(sp)		
	move.l #65522,-(sp)			
	jbsr _INTVCS				
	addq.l #8,sp				
						
	pea 255.w				
	jbsr _KFLUSHIO				
	addq.l #4,sp				
						
	tst.b -782(a6)				
	jbeq _?L5985				
_?L6320:					
						
	pea -782(a6)				
	pea _?LC49				
	jbsr _printf				
	addq.l #8,sp				
						
	move.l -896(a6),d0			
	movem.l -936(a6),d3/d4/d5/d6/d7/a3/a4/a5
	unlk a6					
	rts					
_?L5997:					
						
	pea 2(a5)				
	jbsr _atoi				
	addq.l #4,sp				
						
	move.w d0,-892(a6)			
						
	cmp.w #100,d0				
	jbhi _?L6002				
						
	move.l -896(a6),a0			
	move.l (a0),-(sp)			
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbcs _?L5994				
_?L6002:					
						
	jbsr _show_help_message			
						
	moveq #1,d2				
	move.l d2,-896(a6)			
						
	jbra _?L5995				
_?L6000:					
						
	pea 2(a5)				
	jbsr _atoi				
	addq.l #4,sp				
						
	move.w d0,-890(a6)			
	addq.w #1,d3				
						
	move.w d3,d0				
	ext.l d0				
	cmp.l d0,d4				
	jbgt _?L5988				
	jbra _?L6334				
_?L6001:					
						
	pea 2(a5)				
	jbsr _atoi				
	addq.l #4,sp				
						
	move.w d0,-884(a6)			
						
	subq.w #3,d0				
						
	cmp.w #29,d0				
	jbls _?L5994				
_?L6303:					
						
	jbsr _show_help_message			
						
	moveq #1,d1				
	move.l d1,-896(a6)			
						
	jbra _?L5995				
_?L6333:					
						
	pea 2(a5)				
	jbsr _atoi				
	addq.l #4,sp				
						
	move.w d0,-872(a6)			
						
	subq.w #1,d0				
						
	cmp.w #14,d0				
	jbhi _?L6002				
						
	move.l -896(a6),a0			
	move.l (a0),-(sp)			
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbcs _?L5994				
	jbra _?L6002				
_?L6006:					
						
	pea _cp932rsc_not_flac_file		
						
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
_?L6009:					
						
	moveq #1,d1				
	move.l d1,-896(a6)			
	jbra _?L5995				
_?L6160:					
						
	move.w #1,-868(a6)			
	addq.w #1,d3				
						
	move.w d3,d0				
	ext.l d0				
	cmp.l d0,d4				
	jbgt _?L5988				
	jbra _?L6334				
_?L5999:					
						
	move.w #1,-870(a6)			
	addq.w #1,d3				
						
	move.w d3,d0				
	ext.l d0				
	cmp.l d0,d4				
	jbgt _?L5988				
	jbra _?L6334				
_?L6323:					
						
	pea _cp932rsc_too_many_files		
						
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
	jbra _?L6009				
_?L6007:					
						
	jbsr _show_help_message			
						
	moveq #1,d1				
	move.l d1,-896(a6)			
	jbra _?L5995				
_?L6010:					
						
	pea _cp932rsc_himem_not_available	
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
	jbra _?L6009				
_?L6325:					
						
	jbsr _G_CLR_ON				
						
	clr.l -(sp)				
	jbsr _crtc_set_extra_mode		
						
	moveq #3,d3				
	move.l d3,(sp)				
	jbsr _C_FNKMOD				
	addq.l #4,sp				
						
	jbsr _C_CLS_AL				
						
	pea 1.w					
	pea 4.w					
	lea _TPALET2,a3				
	jbsr (a3)				
	addq.l #8,sp				
						
	pea -1.w				
	pea 1.w					
	jbsr (a3)				
	addq.l #4,sp				
	move.l d0,(sp)				
	pea 5.w					
	jbsr (a3)				
	addq.l #8,sp				
						
	pea -1.w				
	pea 2.w					
	jbsr (a3)				
	addq.l #4,sp				
	move.l d0,(sp)				
	pea 6.w					
	jbsr (a3)				
	addq.l #8,sp				
						
	pea -1.w				
	pea 3.w					
	jbsr (a3)				
	addq.l #4,sp				
	move.l d0,(sp)				
	pea 7.w					
	jbsr (a3)				
	addq.l #8,sp				
						
	move.w #2,-838(a6)			
	clr.w -836(a6)				
	clr.w -834(a6)				
	move.w #768,-832(a6)			
	move.w #512,-830(a6)			
	move.w #-1,-828(a6)			
						
	pea -838(a6)				
	jbsr _TXFILL				
	addq.l #4,sp				
						
	pea 526.w				
	clr.l -(sp)				
	pea -526(a6)				
	jbsr _memset				
	lea (12,sp),sp				
						
	pea -526(a6)				
	jbsr _flac_decode_init			
	addq.l #4,sp				
						
	tst.l d0				
	jbeq _?L6022				
_?L6326:					
						
	pea _cp932rsc_flac_decoder_init_error	
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	sub.l a3,a3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,d6			
						
	tst.w d7				
	jbne _?L6063				
	jbra _?L6054				
_?L6328:					
						
	clr.l -(sp)				
	pea 384.w				
	clr.l -(sp)				
	lea _SCROLL,a3				
	jbsr (a3)				
						
	addq.l #8,sp				
	clr.l (sp)				
	pea 384.w				
	pea 1.w					
	jbsr (a3)				
						
	addq.l #8,sp				
	clr.l (sp)				
	pea 384.w				
	pea 2.w					
	jbsr (a3)				
						
	addq.l #8,sp				
	clr.l (sp)				
	pea 384.w				
	pea 3.w					
	jbsr (a3)				
	lea (12,sp),sp				
						
	move.w #2,-838(a6)			
	move.w #128,-836(a6)			
	clr.w -834(a6)				
	move.w #512,-832(a6)			
	move.w #512,-830(a6)			
	clr.w -828(a6)				
						
	pea -838(a6)				
	jbsr _TXFILL				
	addq.l #4,sp				
	jbra _?L6025				
_?L6047:					
						
	move.l -862(a6),a3			
	pea _cp932rsc_himem_shortage		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.w -878(a6)				
						
	clr.l d3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,d6			
_?L6054:					
						
	jbsr _pcm8a_pause			
						
	jbsr _pcm8a_stop			
_?L6370:					
						
	jbsr (a4)				
						
	move.w #19,a5				
	add.l d0,a5				
	jbra _?L6141				
_?L6152:					
						
	clr.l _g_init_chain_table_ex		
_?L6146:					
						
	tst.l -896(a6)				
	jbne _?L6153				
						
	tst.w -890(a6)				
	jbeq _?L6154				
						
	subq.w #1,-890(a6)			
						
	tst.w -890(a6)				
	jble _?L6153				
_?L6154:					
						
	pea _?LC48				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #4,sp				
						
	tst.w -892(a6)				
	jble _?L6021				
	jbra _?L6325				
_?L6153:					
						
	pea _?LC48				
	move.l d6,a1				
	jbsr (a1)				
	addq.l #4,sp				
	jbra _?L5995				
_?L6032:					
						
	move.l -502(a6),d0			
						
	cmp.l #44100,d0				
	jbeq _?L6034				
						
	cmp.l #48000,d0				
	jbeq _?L6034				
						
	cmp.l #96000,d0				
	jbne _?L6335				
_?L6034:					
						
	moveq #2,d2				
	cmp.l -498(a6),d2			
	jbeq _?L6035				
						
	pea _cp932rsc_flac_channel_error	
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,d6			
	jbra _?L6023				
_?L6335:					
						
	pea _cp932rsc_flac_freq_error		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,d6			
	jbra _?L6023				
_?L6332:					
						
	move.l _g_init_chain_table,a3		
	lea _himem_free,a4			
						
	tst.l a3				
	jbeq _?L6149				
_?L6145:					
						
	move.l (a3),d0				
						
	jbeq _?L6147				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
_?L6147:					
						
	move.l 6(a3),d3				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d3				
	jbeq _?L6149				
						
	move.l d3,a3				
	jbra _?L6145				
_?L6149:					
						
	clr.l _g_init_chain_table		
	jbra _?L6146				
_?L6161:					
						
	clr.l d6				
	lea _fread,a4				
						
	move.l #16777216,d5			
_?L6027:					
						
	move.l d3,-(sp)				
						
	move.l d4,d0				
	sub.l d6,d0				
						
	cmp.l #16777216,d0			
	jbls _?L6030				
	move.l d5,d0				
_?L6030:					
						
	move.l d0,-(sp)				
	pea 1.w					
	pea (a3,d6.l)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	add.l d0,d6				
						
	cmp.l d4,d6				
	jbcs _?L6027				
	jbra _?L6029				
_?L6035:					
						
	tst.w -878(a6)				
	jbne _?L6036				
						
	tst.w -892(a6)				
	jble _?L6336				
_?L6036:					
						
	pea 10.w				
	lea _putchar,a4				
	jbsr (a4)				
						
	move.l -866(a6),(sp)			
	pea _?LC27				
	move.l #_printf,-888(a6)		
	lea _printf,a0				
	jbsr (a0)				
						
	addq.l #4,sp				
	move.l d4,(sp)				
	pea _?LC28				
	move.l -888(a6),a1			
	jbsr (a1)				
						
	addq.l #4,sp				
	move.l #_?LC29,(sp)			
	pea _?LC30				
	move.l -888(a6),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	move.w -872(a6),a0			
	cmp.w #1,d7				
	jbeq _?L6163				
						
	move.l #_?LC19,d0			
						
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	pea _?LC31				
	move.l -888(a6),a1			
	jbsr (a1)				
						
	addq.l #8,sp				
	move.l -502(a6),(sp)			
	pea _?LC32				
	move.l -888(a6),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l #_?LC22,d0			
	moveq #1,d1				
	cmp.l -498(a6),d1			
	jbeq _?L6337				
_?L6039:					
						
	move.l d0,-(sp)				
	pea _?LC33				
	move.l -888(a6),a0			
	jbsr (a0)				
						
	addq.l #4,sp				
	move.l -494(a6),(sp)			
	pea _?LC34				
	move.l -888(a6),a1			
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l -514(a6),d0			
						
	jbeq _?L6040				
						
	move.l d0,-(sp)				
	pea _?LC35				
	move.l -888(a6),a0			
	jbsr (a0)				
	addq.l #8,sp				
_?L6040:					
						
	move.l -510(a6),d0			
						
	jbeq _?L6041				
						
	move.l d0,-(sp)				
	pea _?LC36				
	move.l -888(a6),a1			
	jbsr (a1)				
	addq.l #8,sp				
_?L6041:					
						
	move.l -506(a6),d0			
						
	jbeq _?L6042				
						
	move.l d0,-(sp)				
	pea _?LC37				
	move.l -888(a6),a0			
	jbsr (a0)				
	addq.l #8,sp				
_?L6042:					
						
	pea 10.w				
	jbsr (a4)				
	addq.l #4,sp				
	move.l -882(a6),d4			
	addq.l #1,d4				
						
	clr.l d3				
	clr.l d5				
	clr.l -878(a6)				
						
	lea _flac_decode_full,a4		
	move.l a3,-862(a6)			
	move.l -854(a6),d6			
_?L6043:					
	move.l d4,d1				
	subq.l #1,d1				
	move.l d1,-882(a6)			
						
	cmp.w -884(a6),d3			
	jbge _?L6338				
	addq.l #1,d3				
						
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	pea _?LC38				
	move.l -888(a6),a1			
	jbsr (a1)				
	lea (12,sp),sp				
						
	tst.w d7				
	jbeq _?L6339				
						
	pea 1.w					
	pea 12.w				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,a3				
						
	tst.l d0				
	jbeq _?L6057				
						
	pea 12.w				
	clr.l -(sp)				
	move.l d0,-(sp)				
	jbsr _memset				
						
	addq.l #8,sp				
	moveq #1,d0				
	move.l d0,(sp)				
	move.l #176400,-(sp)			
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l d0,(a3)				
						
	jbeq _?L6057				
						
	pea -838(a6)				
	move.l #176400,-(sp)			
	move.l d0,-(sp)				
	pea -526(a6)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	tst.l d0				
	jbne _?L6340				
						
	move.l -838(a6),d0			
						
	jbeq _?L6341				
						
	move.l d0,4(a3)				
						
	tst.l _g_init_chain_table_ex		
	jbeq _?L6342				
_?L6061:					
						
	tst.l d5				
	jbeq _?L6062				
						
	move.l d5,a0				
	move.l a3,8(a0)				
_?L6062:					
						
	move.l a3,d5				
_?L6053:					
						
	jbsr _B_SFTSNS				
						
	addq.l #1,d4				
	btst #0,d0				
	jbeq _?L6043				
						
	pea _?LC39				
	jbsr _puts				
	addq.l #4,sp				
						
	jbra _?L5995				
_?L6342:					
						
	move.l a3,_g_init_chain_table_ex	
	jbra _?L6061				
_?L6336:					
	move.l #_printf,-888(a6)		
	move.l -882(a6),d4			
	addq.l #1,d4				
						
	clr.l d3				
	clr.l d5				
	clr.l -878(a6)				
						
	lea _flac_decode_full,a4		
	move.l a3,-862(a6)			
	move.l -854(a6),d6			
	jbra _?L6043				
_?L6337:					
						
	move.l #_?LC21,d0			
	jbra _?L6039				
_?L6339:					
						
	pea 1.w					
	pea 10.w				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,a3				
						
	tst.l d0				
	jbeq _?L6047				
						
	pea 10.w				
	clr.l -(sp)				
	move.l d0,-(sp)				
	jbsr _memset				
						
	addq.l #8,sp				
	moveq #1,d1				
	move.l d1,(sp)				
	pea 31250.w				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l d0,(a3)				
						
	jbeq _?L6047				
						
	pea -838(a6)				
	pea 15625.w				
	pea 31250.w				
	move.l d0,-(sp)				
	pea -526(a6)				
	jbsr _flac_decode_resample		
	lea (20,sp),sp				
						
	tst.l d0				
	jbne _?L6343				
						
	move.l -838(a6),d0			
						
	jbeq _?L6344				
						
	move.w d0,4(a3)				
						
	tst.l _g_init_chain_table		
	jbeq _?L6345				
_?L6051:					
						
	tst.l -878(a6)				
	jbeq _?L6052				
						
	move.l -878(a6),a0			
	move.l a3,6(a0)				
_?L6052:					
						
	move.l a3,-878(a6)			
	jbra _?L6053				
_?L6345:					
						
	move.l a3,_g_init_chain_table		
	jbra _?L6051				
_?L6331:					
						
	pea _cp932rsc_flac_decoder_setup_error	
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,d6			
						
	tst.w d7				
	jbne _?L6063				
	jbra _?L6054				
_?L6330:					
						
	pea _cp932rsc_mainmem_shortage		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
	lea _ONTIME,a4				
	move.l #_B_PRINT,d6			
_?L6346:					
						
	tst.w d7				
	jbne _?L6063				
	jbra _?L6054				
_?L6327:					
						
	pea _cp932rsc_file_open_error		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	sub.l a3,a3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,d6			
						
	tst.w d7				
	jbne _?L6063				
	jbra _?L6054				
_?L6329:					
						
	pea _cp932rsc_himem_shortage		
						
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
	lea _ONTIME,a4				
	move.l #_B_PRINT,d6			
	jbra _?L6346				
_?L6324:					
						
	jbsr _pcm8pp_isavailable		
						
	tst.l d0				
	jbeq _?L6013				
						
	jbsr _pcm8pp_get_frequency_mode		
						
	move.l d0,_g_original_pcm8pp_frequency_mode
						
	tst.w -892(a6)				
	jbeq _?L6347				
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
						
	moveq #1,d3				
	jbra _?L6016				
_?L6163:					
						
	move.l #_?LC20,d0			
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	pea _?LC31				
	move.l -888(a6),a1			
	jbsr (a1)				
						
	addq.l #8,sp				
	move.l -502(a6),(sp)			
	pea _?LC32				
	move.l -888(a6),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l #_?LC22,d0			
	moveq #1,d1				
	cmp.l -498(a6),d1			
	jbne _?L6039				
	jbra _?L6337				
_?L6338:					
						
	move.l -862(a6),a3			
	move.w -872(a6),d3			
	swap d3					
	clr.w d3				
						
	move.l d3,d2				
	or.w #5123,d2				
	move.l d2,-842(a6)			
						
	clr.w d4				
						
	tst.w d7				
	jbeq _?L6050				
_?L6060:					
						
	move.l -502(a6),-850(a6)		
						
	move.l -498(a6),d0			
						
	cmp.l #22050,-850(a6)			
	jbeq _?L6348				
						
	cmp.l #24000,-850(a6)			
	jbeq _?L6349				
						
	cmp.l #32000,-850(a6)			
	jbeq _?L6350				
						
	cmp.l #44100,-850(a6)			
	jbeq _?L6351				
						
	cmp.l #48000,-850(a6)			
	jbne _?L6075				
						
	cmp.w #1,d0				
	jbne _?L6352				
						
	or.w #3587,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L6353				
_?L6083:					
						
	pea _?LC40				
	move.l -888(a6),a0			
	jbsr (a0)				
						
	move.l #_?LC41,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a1				
	add.l d0,a1				
	move.l a1,-862(a6)			
_?L6091:					
						
	jbsr (a4)				
						
	cmp.l -862(a6),d0			
	jble _?L6091				
	move.w -884(a6),-862(a6)		
						
	clr.l -846(a6)				
						
	clr.w d3				
	move.l #_B_PRINT,d6			
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbne _?L6354				
_?L6093:					
						
	tst.w d3				
	jbne _?L6103				
						
	tst.w d7				
	jbeq _?L6097				
_?L6098:					
						
	clr.l -(sp)				
	jbsr _pcm8pp_get_data_length		
	addq.l #4,sp				
						
	tst.l d0				
	jbeq _?L6104				
						
	tst.w d4				
	jbne _?L6300				
	clr.w d3				
_?L6102:					
						
	pea 1.w					
	pea 12.w				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,-904(a6)			
						
	jbeq _?L6126				
						
	pea 12.w				
	clr.l -(sp)				
	move.l -904(a6),-(sp)			
	jbsr _memset				
						
	addq.l #8,sp				
	moveq #1,d1				
	move.l d1,(sp)				
	move.l #176400,-(sp)			
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l -904(a6),a0			
	move.l d0,(a0)				
						
	jbeq _?L6126				
						
	pea -838(a6)				
	move.l #176400,-(sp)			
	move.l d0,-(sp)				
	pea -526(a6)				
	jbsr _flac_decode_full			
	lea (16,sp),sp				
						
	tst.l d0				
	jbne _?L6355				
						
	move.l -838(a6),d0			
						
	jbeq _?L6308				
						
	move.l -904(a6),a1			
	move.l d0,4(a1)				
						
	move.l d5,a0				
	move.l a1,8(a0)				
						
	addq.l #1,-882(a6)			
						
	move.w -880(a6),d5			
						
	clr.l -(sp)				
	jbsr _pcm8pp_get_block_counter		
	addq.l #4,sp				
						
	move.w -880(a6),d4			
	sub.w -844(a6),d4			
	sub.w d0,d4				
						
	cmp.w -862(a6),d4			
	jblt _?L6130				
						
	tst.w -868(a6)				
	jbeq _?L6356				
						
	move.w -862(a6),d4			
_?L6133:					
						
	clr.l -(sp)				
	jbsr _pcm8pp_get_data_length		
	addq.l #4,sp				
						
	tst.l d0				
	jbeq _?L6357				
_?L6137:					
	move.w d4,-862(a6)			
	move.l -904(a6),d5			
	clr.w d4				
_?L6374:					
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L6093				
	jbra _?L6354				
_?L6344:					
						
	move.l a3,d6				
	move.l -862(a6),a3			
	pea 1.w					
	move.l d6,a0				
	move.l (a0),-(sp)			
	lea _himem_free,a4			
	jbsr (a4)				
	addq.l #8,sp				
						
	pea 1.w					
	move.l d6,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.w -872(a6),d3			
	swap d3					
	clr.w d3				
						
	move.l d3,d1				
	or.w #5123,d1				
	move.l d1,-842(a6)			
						
	moveq #1,d4				
_?L6050:					
						
	pea 1.w					
	jbsr _pcm8a_set_polyphonic_mode		
						
	move.l _g_init_chain_table,(sp)		
	move.l -842(a6),-(sp)			
	clr.l -(sp)				
	jbsr _pcm8a_play_linked_array_chain	
	lea (12,sp),sp				
	jbra _?L6060				
_?L6354:					
						
	jbsr _B_KEYINP				
						
	asr.l #8,d0				
						
	move.w d0,d1				
						
	and.w #-17,d0				
	cmp.w #1,d0				
	jbeq _?L6358				
						
	cmp.w #53,d1				
	jbne _?L6093				
						
	tst.w d3				
	jbeq _?L6095				
						
	tst.w d7				
	jbne _?L6096				
						
	jbsr _pcm8a_resume			
_?L6097:					
						
	clr.l -(sp)				
	jbsr _pcm8a_get_data_length		
	addq.l #4,sp				
						
	tst.l d0				
	jbne _?L6359				
_?L6104:					
						
	tst.w d4				
	jbne _?L6360				
						
	pea _cp932rsc_buffer_underrun		
	pea _?LC44				
	move.l -888(a6),a1			
	jbsr (a1)				
	addq.l #8,sp				
	clr.w d3				
_?L6107:					
						
	tst.w d7				
	jbne _?L6102				
_?L6100:					
						
	pea 1.w					
	pea 10.w				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,-904(a6)			
						
	jbeq _?L6110				
						
	pea 10.w				
	clr.l -(sp)				
	move.l -904(a6),-(sp)			
	jbsr _memset				
						
	addq.l #8,sp				
	moveq #1,d2				
	move.l d2,(sp)				
	pea 31250.w				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l -904(a6),a0			
	move.l d0,(a0)				
						
	jbeq _?L6110				
						
	pea -838(a6)				
	pea 15625.w				
	pea 31250.w				
	move.l d0,-(sp)				
	pea -526(a6)				
	jbsr _flac_decode_resample		
	lea (20,sp),sp				
	move.l d0,d4				
						
	jbne _?L6361				
						
	move.l -838(a6),d0			
						
	jbne _?L6112				
_?L6308:					
						
	pea 1.w					
	move.l -904(a6),a1			
	move.l (a1),-(sp)			
	move.l #_himem_free,d4			
	move.l d4,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	pea 1.w					
	move.l -904(a6),-(sp)			
	move.l d4,a1				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.w -868(a6)				
	jbeq _?L6362				
						
	moveq #1,d4				
_?L6363:					
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L6093				
	jbra _?L6354				
_?L6359:					
						
	tst.w d4				
	jbne _?L6300				
	clr.w d3				
	jbra _?L6100				
_?L6112:					
						
	move.l -904(a6),a1			
	move.w d0,4(a1)				
						
	move.l -878(a6),a0			
	move.l a1,6(a0)				
						
	addq.l #1,-882(a6)			
						
	clr.l -(sp)				
	jbsr _pcm8a_get_access_address		
	addq.l #4,sp				
						
	move.l _g_init_chain_table,a0		
_?L6114:					
						
	tst.l a0				
	jbeq _?L6116				
						
	move.l (a0),a1				
						
	cmp.l a1,d0				
	jbcs _?L6115				
						
	clr.l d1				
	move.w 4(a0),d1				
	add.l d1,d1				
						
	add.l a1,d1				
						
	cmp.l d0,d1				
	jbhi _?L6116				
_?L6115:					
						
	addq.l #1,d4				
						
	move.l 6(a0),a0				
	jbra _?L6114				
_?L6362:					
						
	pea _?LC45				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #4,sp				
						
	moveq #1,d4				
	jbra _?L6363				
_?L6116:					
						
	move.w -880(a6),a1			
	sub.w d4,a1				
	move.w a1,-878(a6)			
						
	move.w a1,d1				
	cmp.w -862(a6),d1			
	jblt _?L6118				
						
	tst.w -868(a6)				
	jbeq _?L6364				
_?L6121:					
						
	clr.l -(sp)				
	move.l a0,-900(a6)			
	jbsr _pcm8a_get_data_length		
	addq.l #4,sp				
						
	move.l -900(a6),a0			
	tst.l d0				
	jbne _?L6123				
						
	move.l -882(a6),d0			
	sub.l d4,d0				
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbge _?L6123				
						
	tst.l a0				
	jbeq _?L6123				
						
	move.l a0,-(sp)				
	move.l -842(a6),-(sp)			
	clr.l -(sp)				
	jbsr _pcm8a_play_linked_array_chain	
	lea (12,sp),sp				
						
	move.w -878(a6),-862(a6)		
_?L6123:					
	move.l -904(a6),-878(a6)		
	clr.w d4				
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L6093				
	jbra _?L6354				
_?L6357:					
						
	clr.l -(sp)				
	move.l d0,-900(a6)			
	jbsr _pcm8pp_get_block_counter		
	addq.l #4,sp				
						
	move.l -846(a6),a1			
	add.l d0,a1				
						
	move.l -882(a6),d0			
	sub.l a1,d0				
						
	move.l -900(a6),d1			
	moveq #6,d2				
	cmp.l d0,d2				
	jbge _?L6137				
						
	move.l _g_init_chain_table_ex,a0	
_?L6138:					
						
	cmp.l d1,a1				
	jble _?L6365				
						
	move.l 8(a0),a0				
						
	tst.l a0				
	jbeq _?L6137				
						
	addq.l #1,d1				
	jbra _?L6138				
_?L6364:					
						
	pea _?LC46				
	move.l a0,-900(a6)			
	move.l d6,a1				
	jbsr (a1)				
	addq.l #4,sp				
	move.l -900(a6),a0			
	jbra _?L6121				
_?L6356:					
						
	pea _?LC46				
	move.l d6,a1				
	jbsr (a1)				
	addq.l #4,sp				
						
	move.w -862(a6),d4			
	jbra _?L6133				
_?L6353:					
						
	jbsr _pcm8pp_get_frequency_mode		
						
	subq.l #2,d0				
	jbne _?L6088				
_?L6084:					
						
	move.l _g_init_chain_table_ex,-(sp)	
						
	move.l -850(a6),d0			
	lsl.l #8,d0				
						
	move.l d0,-(sp)				
	pea 1.w					
	move.l -858(a6),-(sp)			
	clr.l -(sp)				
	jbsr _pcm8pp_play_ex_linked_array_chain	
	lea (20,sp),sp				
_?L6366:					
						
	pea _?LC40				
	move.l -888(a6),a0			
	jbsr (a0)				
						
	move.l #_?LC41,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a1				
	add.l d0,a1				
	move.l a1,-862(a6)			
	jbra _?L6091				
_?L6352:					
						
	cmp.w #2,d0				
	jbne _?L6075				
						
	or.w #7683,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbne _?L6083				
						
	jbsr _pcm8pp_get_frequency_mode		
						
	subq.l #2,d0				
	jbeq _?L6084				
_?L6088:					
						
	pea 2.w					
	jbsr _pcm8pp_set_frequency_mode		
	addq.l #4,sp				
						
	move.l _g_init_chain_table_ex,-(sp)	
						
	move.l -850(a6),d0			
	lsl.l #8,d0				
						
	move.l d0,-(sp)				
	pea 1.w					
	move.l -858(a6),-(sp)			
	clr.l -(sp)				
	jbsr _pcm8pp_play_ex_linked_array_chain	
	lea (20,sp),sp				
	jbra _?L6366				
_?L6103:					
						
	tst.w d4				
	jbeq _?L6107				
_?L6101:					
						
	moveq #1,d3				
	moveq #1,d4				
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L6093				
	jbra _?L6354				
_?L6300:					
						
	clr.w d3				
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L6093				
	jbra _?L6354				
_?L6095:					
						
	tst.w d7				
	jbne _?L6099				
						
	jbsr _pcm8a_pause			
						
	tst.w d4				
	jbne _?L6101				
						
	moveq #1,d3				
	jbra _?L6100				
_?L6118:					
						
	tst.w -868(a6)				
	jbeq _?L6120				
						
	move.w -878(a6),-862(a6)		
	jbra _?L6121				
_?L6120:					
						
	pea _?LC47				
	move.l a0,-900(a6)			
	move.l d6,a1				
	jbsr (a1)				
	addq.l #4,sp				
	move.l -900(a6),a0			
						
	move.w -878(a6),-862(a6)		
	jbra _?L6121				
_?L6096:					
						
	jbsr _pcm8pp_resume			
	jbra _?L6098				
_?L6099:					
						
	jbsr _pcm8pp_pause			
						
	tst.w d4				
	jbne _?L6101				
						
	move.w d7,d3				
	jbra _?L6102				
_?L6130:					
						
	tst.w -868(a6)				
	jbne _?L6133				
						
	pea _?LC47				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #4,sp				
						
	clr.l -(sp)				
	jbsr _pcm8pp_get_data_length		
	addq.l #4,sp				
						
	tst.l d0				
	jbne _?L6137				
	jbra _?L6357				
_?L6017:					
						
	pea _?LC0				
	jbsr _puts				
	addq.l #4,sp				
						
	jbsr _pcm8a_pause			
						
	jbsr _pcm8a_stop			
						
	jbsr _C_CUROFF				
	clr.w d3				
	move.w #1,-878(a6)			
	clr.l -882(a6)				
	moveq #1,d2				
	move.l d2,-896(a6)			
						
	move.w -884(a6),a0			
	move.l a0,-854(a6)			
						
	move.l d7,-866(a6)			
	move.w d3,d7				
	jbra _?L6155				
_?L6321:					
						
	jbsr _show_help_message			
						
	moveq #1,d1				
	move.l d1,-896(a6)			
						
	jbsr _C_CURON				
						
	move.l _g_funckey_mode,d0		
						
	jbmi _?L6157				
	jbra _?L6319				
_?L6358:					
						
	pea _?LC42				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #4,sp				
						
	clr.l d3				
						
	clr.w -878(a6)				
						
	moveq #1,d1				
	move.l d1,-896(a6)			
						
	tst.w d7				
	jbne _?L6063				
	jbra _?L6054				
_?L6057:					
						
	move.l -862(a6),a3			
	pea _cp932rsc_himem_shortage		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -878(a6)				
	lea _ONTIME,a4				
	move.l #_B_PRINT,d6			
_?L6371:					
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
	jbra _?L6140				
_?L6347:					
						
	pea _?LC0				
	jbsr _puts				
	addq.l #4,sp				
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
						
	jbsr _C_CUROFF				
	moveq #1,d3				
	move.w #1,-878(a6)			
	clr.l -882(a6)				
	moveq #1,d2				
	move.l d2,-896(a6)			
						
	move.w -884(a6),a0			
	move.l a0,-854(a6)			
						
	move.l d7,-866(a6)			
	move.w d3,d7				
	jbra _?L6155				
_?L6348:					
						
	cmp.w #1,d0				
	jbeq _?L6367				
						
	cmp.w #2,d0				
	jbeq _?L6368				
_?L6075:					
						
	or.w #7427,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbne _?L6083				
_?L6086:					
						
	jbsr _pcm8pp_get_frequency_mode		
						
	subq.l #1,d0				
	jbeq _?L6084				
						
	pea 1.w					
	jbsr _pcm8pp_set_frequency_mode		
	addq.l #4,sp				
						
	move.l _g_init_chain_table_ex,-(sp)	
						
	move.l -850(a6),d0			
	lsl.l #8,d0				
						
	move.l d0,-(sp)				
	pea 1.w					
	move.l -858(a6),-(sp)			
	clr.l -(sp)				
	jbsr _pcm8pp_play_ex_linked_array_chain	
	lea (20,sp),sp				
	jbra _?L6366				
_?L6368:					
						
	or.w #6659,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L6084				
						
	pea _?LC40				
	move.l -888(a6),a0			
	jbsr (a0)				
						
	move.l #_?LC41,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a1				
	add.l d0,a1				
	move.l a1,-862(a6)			
	jbra _?L6091				
_?L6013:					
						
	pea _cp932rsc_pcm8_not_available	
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	moveq #1,d1				
	move.l d1,-896(a6)			
	jbra _?L5995				
_?L6349:					
						
	cmp.w #1,d0				
	jbne _?L6369				
						
	or.w #2819,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L6084				
						
	pea _?LC40				
	move.l -888(a6),a0			
	jbsr (a0)				
						
	move.l #_?LC41,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a1				
	add.l d0,a1				
	move.l a1,-862(a6)			
	jbra _?L6091				
_?L6110:					
						
	pea _cp932rsc_himem_shortage		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -878(a6)				
_?L6373:					
						
	jbsr _pcm8a_pause			
						
	jbsr _pcm8a_stop			
	jbra _?L6370				
_?L6343:					
						
	move.l -862(a6),a3			
	pea _cp932rsc_flac_decode_error		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.w -878(a6)				
						
	clr.l d3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,d6			
	jbra _?L6054				
_?L6340:					
						
	move.l -862(a6),a3			
	pea _cp932rsc_flac_decode_error		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -878(a6)				
	lea _ONTIME,a4				
	move.l #_B_PRINT,d6			
	jbra _?L6371				
_?L6341:					
						
	move.l a3,d6				
	move.l -862(a6),a3			
	pea 1.w					
	move.l d6,a1				
	move.l (a1),-(sp)			
	lea _himem_free,a4			
	jbsr (a4)				
	addq.l #8,sp				
						
	pea 1.w					
	move.l d6,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.w -872(a6),d3			
	swap d3					
	clr.w d3				
						
	move.l d3,d1				
	or.w #5123,d1				
	move.l d1,-842(a6)			
						
	move.w d7,d4				
	jbra _?L6060				
_?L6369:					
						
	cmp.w #2,d0				
	jbne _?L6075				
						
	or.w #6915,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L6084				
						
	pea _?LC40				
	move.l -888(a6),a0			
	jbsr (a0)				
						
	move.l #_?LC41,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a1				
	add.l d0,a1				
	move.l a1,-862(a6)			
	jbra _?L6091				
_?L6367:					
						
	or.w #2563,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L6084				
						
	pea _?LC40				
	move.l -888(a6),a0			
	jbsr (a0)				
						
	move.l #_?LC41,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a1				
	add.l d0,a1				
	move.l a1,-862(a6)			
	jbra _?L6091				
_?L6350:					
						
	cmp.w #1,d0				
	jbne _?L6372				
						
	or.w #3075,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L6084				
						
	pea _?LC40				
	move.l -888(a6),a0			
	jbsr (a0)				
						
	move.l #_?LC41,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a1				
	add.l d0,a1				
	move.l a1,-862(a6)			
	jbra _?L6091				
_?L6351:					
						
	cmp.w #1,d0				
	jbne _?L6075				
						
	or.w #3331,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L6086				
						
	pea _?LC40				
	move.l -888(a6),a0			
	jbsr (a0)				
						
	move.l #_?LC41,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a1				
	add.l d0,a1				
	move.l a1,-862(a6)			
	jbra _?L6091				
_?L6372:					
						
	cmp.w #2,d0				
	jbne _?L6075				
						
	or.w #7171,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L6084				
						
	pea _?LC40				
	move.l -888(a6),a0			
	jbsr (a0)				
						
	move.l #_?LC41,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a1				
	add.l d0,a1				
	move.l a1,-862(a6)			
	jbra _?L6091				
_?L6361:					
						
	pea _cp932rsc_flac_decode_error		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -878(a6)				
	jbra _?L6373				
_?L6126:					
						
	pea _cp932rsc_himem_shortage		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -878(a6)				
_?L6375:					
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
	jbra _?L6140				
_?L6360:					
						
	pea _?LC43				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #4,sp				
						
	clr.l -896(a6)				
						
	clr.l d3				
						
	clr.w -878(a6)				
						
	tst.w d7				
	jbne _?L6063				
	jbra _?L6054				
_?L6365:					
						
	tst.l a0				
	jbeq _?L6137				
						
	move.l a0,-(sp)				
						
	move.l -850(a6),d0			
	lsl.l #8,d0				
						
	move.l d0,-(sp)				
	pea 1.w					
	move.l -858(a6),-(sp)			
	clr.l -(sp)				
	move.l a1,-900(a6)			
	jbsr _pcm8pp_play_ex_linked_array_chain	
						
	lea (16,sp),sp				
	clr.l (sp)				
	jbsr _pcm8pp_get_block_counter		
	addq.l #4,sp				
						
	move.l -900(a6),a1			
	sub.w a1,d5				
	move.w d5,d4				
	sub.w d0,d4				
						
	move.l a1,-846(a6)			
	move.w d4,-862(a6)			
	move.l -904(a6),d5			
	clr.w d4				
	jbra _?L6374				
_?L6355:					
						
	pea _cp932rsc_flac_decode_error		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -878(a6)				
	jbra _?L6375				
						
						
	.align 2	* workaround for 3 args .comm directive.
	.comm	_g_original_pcm8pp_frequency_mode,4
	.data					
	.align	2				
						
						
_g_funckey_mode:				
	.dc.l	-1				
						
	.align 2	* workaround for 3 args .comm directive.
	.comm	_g_init_chain_table_ex,4	
						
	.align 2	* workaround for 3 args .comm directive.
	.comm	_g_init_chain_table,4		
						
	.align 2	* workaround for 3 args .comm directive.
	.comm	_g_abort_vector2,4		
						
	.align 2	* workaround for 3 args .comm directive.
	.comm	_g_abort_vector1,4		
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
						
