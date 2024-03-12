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
	.dc.b $38,$30,$78,$30,$20,$2b,$20,$4d
	.dc.b $65,$72,$63,$75,$72,$79,$2d,$55
	.dc.b $4e,$49,$54,$20,$76,$65,$72,$73
	.dc.b $69,$6f,$6e,$20,$30,$2e,$31,$2e
	.dc.b $30,$20,$28,$32,$30,$32,$34,$2f
	.dc.b $30,$33,$2f,$31,$31,$29,$20,$62
	.dc.b $79,$20,$74,$61,$6e,$74,$61,$6e
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
	.dc.b $50,$43,$4d,$38,$41
	.dc.b $00				
_?LC11:						
	.dc.b $50,$43,$4d,$38,$50,$50
	.dc.b $00				
_?LC12:						
	.dc.b $6d,$6f,$6e,$6f
	.dc.b $00				
_?LC13:						
	.dc.b $73,$74,$65,$72,$65,$6f
	.dc.b $00				
_?LC14:						
	.dc.b $2e,$66,$6c,$61
	.dc.b $00				
_?LC15:						
	.dc.b $72,$62
	.dc.b $00				
_?LC16:						
	.dc.b $0d,$4c,$6f,$61,$64,$69,$6e,$67
	.dc.b $20,$46,$4c,$41,$43,$20,$66,$69
	.dc.b $6c,$65,$2e,$2e,$2e,$1b,$5b,$30
	.dc.b $4b
	.dc.b $00				
_?LC17:						
	.dc.b $0d,$1b,$5b,$30,$4b
	.dc.b $00				
_?LC18:						
	.dc.b $46,$69,$6c,$65,$20,$6e,$61,$6d
	.dc.b $65,$20,$20,$20,$20,$20,$20,$3a
	.dc.b $20,$25,$73,$0a
	.dc.b $00				
_?LC19:						
	.dc.b $44,$61,$74,$61,$20,$73,$69,$7a
	.dc.b $65,$20,$20,$20,$20,$20,$20,$3a
	.dc.b $20,$25,$64,$20,$5b,$62,$79,$74
	.dc.b $65,$73,$5d,$0a
	.dc.b $00				
_?LC20:						
	.dc.b $46,$4c,$41,$43
	.dc.b $00				
_?LC21:						
	.dc.b $44,$61,$74,$61,$20,$66,$6f,$72
	.dc.b $6d,$61,$74,$20,$20,$20,$20,$3a
	.dc.b $20,$25,$73,$0a
	.dc.b $00				
_?LC22:						
	.dc.b $50,$43,$4d,$20,$64,$72,$69,$76
	.dc.b $65,$72,$20,$20,$20,$20,$20,$3a
	.dc.b $20,$25,$73,$20,$28,$76,$6f,$6c
	.dc.b $75,$6d,$65,$3a,$25,$64,$29,$0a
	.dc.b $00				
_?LC23:						
	.dc.b $46,$4c,$41,$43,$20,$66,$72,$65
	.dc.b $71,$75,$65,$6e,$63,$79,$20,$3a
	.dc.b $20,$25,$64,$20,$5b,$48,$7a,$5d
	.dc.b $0a
	.dc.b $00				
_?LC24:						
	.dc.b $46,$4c,$41,$43,$20,$63,$68,$61
	.dc.b $6e,$6e,$65,$6c,$73,$20,$20,$3a
	.dc.b $20,$25,$73,$0a
	.dc.b $00				
_?LC25:						
	.dc.b $46,$4c,$41,$43,$20,$62,$69,$74
	.dc.b $20,$64,$65,$70,$74,$68,$20,$3a
	.dc.b $20,$25,$64,$20,$5b,$62,$69,$74
	.dc.b $73,$5d,$0a
	.dc.b $00				
_?LC26:						
	.dc.b $46,$4c,$41,$43,$20,$74,$69,$74
	.dc.b $6c,$65,$20,$20,$20,$20,$20,$3a
	.dc.b $20,$25,$73,$0a
	.dc.b $00				
_?LC27:						
	.dc.b $46,$4c,$41,$43,$20,$61,$72,$74
	.dc.b $69,$73,$74,$20,$20,$20,$20,$3a
	.dc.b $20,$25,$73,$0a
	.dc.b $00				
_?LC28:						
	.dc.b $46,$4c,$41,$43,$20,$61,$6c,$62
	.dc.b $75,$6d,$20,$20,$20,$20,$20,$3a
	.dc.b $20,$25,$73,$0a
	.dc.b $00				
_?LC29:						
	.dc.b $0d,$4e,$6f,$77,$20,$62,$75,$66
	.dc.b $66,$65,$72,$69,$6e,$67,$20,$28
	.dc.b $25,$64,$2f,$25,$64,$29,$20,$2e
	.dc.b $2e,$2e,$20,$5b,$53,$48,$49,$46
	.dc.b $54,$5d,$20,$6b,$65,$79,$20,$74
	.dc.b $6f,$20,$63,$61,$6e,$63,$65,$6c
	.dc.b $2e
	.dc.b $00				
_?LC30:						
	.dc.b $0d,$1b,$5b,$4b,$43,$61,$6e,$63
	.dc.b $65,$6c,$65,$64,$2e
	.dc.b $00				
_?LC31:						
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
_?LC32:						
	.dc.b $0d,$0a,$53,$74,$6f,$70,$70,$65
	.dc.b $64,$2e
	.dc.b $00				
_?LC33:						
	.dc.b $0d,$0a,$46,$69,$6e,$69,$73,$68
	.dc.b $65,$64,$2e,$0d,$0a
	.dc.b $00				
_?LC34:						
	.dc.b $0a,$25,$73,$0a
	.dc.b $00				
_?LC35:						
	.dc.b $7c
	.dc.b $00				
_?LC36:						
	.dc.b $3e
	.dc.b $00				
_?LC37:						
	.dc.b $2a
	.dc.b $00				
_?LC38:						
	.dc.b $0d,$0a
	.dc.b $00				
_?LC39:						
	.dc.b $65,$72,$72,$6f,$72,$3a,$20,$25
	.dc.b $73,$0a
	.dc.b $00				
	.text					
	.align	2				
	.xref __main	* workaround for libc.
	.globl	_main				
						
_main:						
	link.w a6,#-900				
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
	jbhi _?L375				
_?L43:						
						
	pea _cp932rsc_mpu_type			
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	moveq #1,d1				
	move.l d1,-892(a6)			
_?L46:						
						
	jbsr _C_CURON				
						
	move.l _g_funckey_mode,d0		
						
	jbpl _?L376				
_?L215:						
						
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
	jbne _?L377				
_?L41:						
						
	move.l -892(a6),d0			
	movem.l -932(a6),d3/d4/d5/d6/d7/a3/a4/a5
	unlk a6					
	rts					
_?L375:						
						
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
	jbge _?L43				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbge _?L378				
						
	moveq #1,d3				
						
	clr.w -868(a6)				
						
	clr.w -888(a6)				
						
	clr.w -874(a6)				
						
	move.w #4,-884(a6)			
						
	move.w #1,-886(a6)			
						
	move.w #6,-876(a6)			
						
	clr.l d7				
	moveq #1,d0				
						
	lea _strlen,a3				
						
	lea _stricmp,a4				
	move.l #_?L54,d6			
_?L44:						
						
	lsl.l #2,d0				
	add.l d5,d0				
	move.l d0,-892(a6)			
	move.l d0,a0				
	move.l (a0),a5				
						
	cmp.b #45,(a5)				
	jbeq _?L379				
_?L47:						
						
	tst.l d7				
	jbne _?L380				
						
	move.l a5,-(sp)				
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbcc _?L62				
						
	pea _?LC14				
	pea -4(a5,d0.l)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L62				
						
	move.l a5,d7				
_?L50:						
	addq.w #1,d3				
						
	move.w d3,d0				
	ext.l d0				
	cmp.l d0,d4				
	jbgt _?L44				
_?L391:						
						
	tst.l d7				
	jbeq _?L63				
						
	move.l d7,-(sp)				
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbcc _?L63				
						
	jbsr _himem_isavailable			
						
	tst.l d0				
	jbeq _?L66				
						
	jbsr _pcm8a_isavailable			
						
	tst.l d0				
	jbeq _?L381				
						
	tst.w -888(a6)				
	jbeq _?L73				
						
	jbsr _pcm8a_pause			
						
	jbsr _pcm8a_stop			
						
	clr.w d3				
_?L72:						
						
	jbsr _C_CUROFF				
						
	tst.w -888(a6)				
	jble _?L74				
						
	clr.l -(sp)				
	jbsr _B_SUPER				
	addq.l #4,sp				
_?L74:						
						
	move.w #1,-872(a6)			
	clr.l -882(a6)				
	moveq #1,d1				
	move.l d1,-892(a6)			
						
	move.w -884(a6),a0			
	move.l a0,-854(a6)			
	move.l d7,-866(a6)			
	move.w d3,d7				
_?L213:						
						
	tst.w -888(a6)				
	jbgt _?L382				
_?L77:						
						
	pea 526.w				
	clr.l -(sp)				
	pea -526(a6)				
	jbsr _memset				
	lea (12,sp),sp				
						
	pea -526(a6)				
	jbsr _flac_decode_init			
	addq.l #4,sp				
						
	tst.l d0				
	jbne _?L383				
_?L78:						
						
	pea _?LC15				
	move.l -866(a6),-(sp)			
	jbsr _fopen				
	addq.l #8,sp				
	move.l d0,d3				
						
	jbeq _?L384				
						
	tst.w -888(a6)				
	jbgt _?L385				
_?L81:						
						
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
	jbeq _?L386				
						
	tst.w -874(a6)				
	jbeq _?L219				
						
	pea _?LC16				
	jbsr _printf				
						
	clr.l (sp)				
	move.l #524288,-(sp)			
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,d6				
						
	jbeq _?L387				
						
	clr.l d5				
	lea _fread,a4				
_?L84:						
						
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
	jbcs _?L84				
						
	clr.l -(sp)				
	move.l d6,-(sp)				
	jbsr _himem_free			
						
	addq.l #4,sp				
	move.l #_?LC17,(sp)			
	jbsr _printf				
	addq.l #4,sp				
_?L85:						
						
	move.l d3,-(sp)				
	jbsr _fclose				
						
	move.l d4,(sp)				
	move.l a3,-(sp)				
	pea -526(a6)				
	jbsr _flac_decode_setup			
	lea (12,sp),sp				
						
	tst.l d0				
	jbne _?L388				
						
	moveq #-9,d0				
	and.l -494(a6),d0			
	moveq #16,d1				
	cmp.l d0,d1				
	jbeq _?L88				
						
	pea _cp932rsc_flac_bps_error		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,-900(a6)		
_?L79:						
						
	tst.w d7				
	jbeq _?L110				
_?L119:						
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
_?L198:						
						
	jbsr (a4)				
						
	move.w #19,a5				
	add.l d0,a5				
_?L199:						
						
	jbsr (a4)				
						
	cmp.l a5,d0				
	jble _?L199				
						
	tst.l d3				
	jbeq _?L200				
						
	move.l d3,-(sp)				
	jbsr _fclose				
	addq.l #4,sp				
_?L200:						
						
	tst.l a3				
	jbeq _?L201				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
_?L201:						
						
	pea -526(a6)				
	jbsr _flac_decode_close			
	addq.l #4,sp				
						
	tst.w d7				
	jbeq _?L389				
						
	move.l _g_init_chain_table_ex,a3	
	lea _himem_free,a4			
						
	tst.l a3				
	jbeq _?L210				
_?L208:						
						
	move.l (a3),d0				
						
	jbeq _?L209				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
_?L209:						
						
	move.l 8(a3),d3				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d3				
	jbeq _?L210				
						
	move.l d3,a3				
	jbra _?L208				
_?L379:						
						
	move.l a5,-(sp)				
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcc _?L47				
						
	move.b 1(a5),d1				
						
	cmp.b #118,d1				
	jbeq _?L390				
	move.b d1,d0				
	add.b #-98,d0				
	cmp.b #18,d0				
	jbhi _?L52				
	and.l #255,d0				
	add.l d0,d0				
	move.l d0,a0				
	move.w (a0,d6.l),d0			
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L54:						
	.dc.w _?L57-_?L54			
	.dc.w _?L52-_?L54			
	.dc.w _?L52-_?L54			
	.dc.w _?L52-_?L54			
	.dc.w _?L52-_?L54			
	.dc.w _?L52-_?L54			
	.dc.w _?L52-_?L54			
	.dc.w _?L52-_?L54			
	.dc.w _?L52-_?L54			
	.dc.w _?L52-_?L54			
	.dc.w _?L56-_?L54			
	.dc.w _?L52-_?L54			
	.dc.w _?L218-_?L54			
	.dc.w _?L52-_?L54			
	.dc.w _?L52-_?L54			
	.dc.w _?L52-_?L54			
	.dc.w _?L52-_?L54			
	.dc.w _?L55-_?L54			
	.dc.w _?L53-_?L54			
_?L52:						
						
	cmp.b #104,d1				
	jbeq _?L360				
						
	move.l a5,-(sp)				
	pea _cp932rsc_unknown_option		
	pea -782(a6)				
	jbsr _sprintf				
	lea (12,sp),sp				
						
	moveq #1,d1				
	move.l d1,-892(a6)			
_?L51:						
						
	tst.w -888(a6)				
	jble _?L46				
						
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
						
	jbmi _?L215				
_?L376:						
						
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
	jbeq _?L41				
_?L377:						
						
	pea -782(a6)				
	pea _?LC39				
	jbsr _printf				
	addq.l #8,sp				
						
	move.l -892(a6),d0			
	movem.l -932(a6),d3/d4/d5/d6/d7/a3/a4/a5
	unlk a6					
	rts					
_?L53:						
						
	pea 2(a5)				
	jbsr _atoi				
	addq.l #4,sp				
						
	move.w d0,-888(a6)			
						
	cmp.w #100,d0				
	jbhi _?L360				
						
	move.l -892(a6),a0			
	move.l (a0),-(sp)			
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbcs _?L50				
_?L360:						
						
	jbsr _show_help_message			
						
	moveq #1,d1				
	move.l d1,-892(a6)			
						
	jbra _?L51				
_?L56:						
						
	pea 2(a5)				
	jbsr _atoi				
	addq.l #4,sp				
						
	move.w d0,-886(a6)			
	addq.w #1,d3				
						
	move.w d3,d0				
	ext.l d0				
	cmp.l d0,d4				
	jbgt _?L44				
	jbra _?L391				
_?L57:						
						
	pea 2(a5)				
	jbsr _atoi				
	addq.l #4,sp				
						
	move.w d0,-884(a6)			
						
	subq.w #3,d0				
						
	cmp.w #29,d0				
	jbhi _?L360				
	addq.w #1,d3				
						
	move.w d3,d0				
	ext.l d0				
	cmp.l d0,d4				
	jbgt _?L44				
	jbra _?L391				
_?L390:						
						
	pea 2(a5)				
	jbsr _atoi				
	addq.l #4,sp				
						
	move.w d0,-876(a6)			
						
	subq.w #1,d0				
						
	cmp.w #14,d0				
	jbhi _?L360				
						
	move.l -892(a6),a0			
	move.l (a0),-(sp)			
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbcs _?L50				
	jbra _?L360				
_?L62:						
						
	pea _cp932rsc_not_flac_file		
						
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
_?L65:						
						
	moveq #1,d1				
	move.l d1,-892(a6)			
	jbra _?L51				
_?L218:						
						
	move.w #1,-868(a6)			
	addq.w #1,d3				
						
	move.w d3,d0				
	ext.l d0				
	cmp.l d0,d4				
	jbgt _?L44				
	jbra _?L391				
_?L55:						
						
	move.w #1,-874(a6)			
	addq.w #1,d3				
						
	move.w d3,d0				
	ext.l d0				
	cmp.l d0,d4				
	jbgt _?L44				
	jbra _?L391				
_?L380:						
						
	pea _cp932rsc_too_many_files		
						
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
	jbra _?L65				
_?L63:						
						
	jbsr _show_help_message			
						
	moveq #1,d1				
	move.l d1,-892(a6)			
	jbra _?L51				
_?L66:						
						
	pea _cp932rsc_himem_not_available	
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
	jbra _?L65				
_?L382:						
						
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
	jbeq _?L78				
_?L383:						
						
	pea _cp932rsc_flac_decoder_init_error	
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	sub.l a3,a3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,-900(a6)		
						
	tst.w d7				
	jbne _?L119				
	jbra _?L110				
_?L385:						
						
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
	jbra _?L81				
_?L103:						
						
	move.l -862(a6),a3			
	pea _cp932rsc_himem_shortage		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.w -872(a6)				
						
	clr.l d3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,-900(a6)		
_?L110:						
						
	jbsr _pcm8a_pause			
						
	jbsr _pcm8a_stop			
_?L425:						
						
	jbsr (a4)				
						
	move.w #19,a5				
	add.l d0,a5				
	jbra _?L199				
_?L210:						
						
	clr.l _g_init_chain_table_ex		
_?L204:						
						
	tst.l -892(a6)				
	jbne _?L211				
						
	tst.w -886(a6)				
	jbeq _?L212				
						
	subq.w #1,-886(a6)			
						
	tst.w -886(a6)				
	jble _?L211				
_?L212:						
						
	pea _?LC38				
	move.l -900(a6),a0			
	jbsr (a0)				
	addq.l #4,sp				
						
	tst.w -888(a6)				
	jble _?L77				
	jbra _?L382				
_?L211:						
						
	move.l -900(a6),-882(a6)		
	pea _?LC38				
	move.l -882(a6),a1			
	jbsr (a1)				
	addq.l #4,sp				
	jbra _?L51				
_?L88:						
						
	move.l -502(a6),d0			
						
	cmp.l #44100,d0				
	jbeq _?L90				
						
	cmp.l #48000,d0				
	jbeq _?L90				
						
	cmp.l #96000,d0				
	jbne _?L392				
_?L90:						
						
	moveq #2,d0				
	cmp.l -498(a6),d0			
	jbeq _?L91				
						
	pea _cp932rsc_flac_channel_error	
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,-900(a6)		
	jbra _?L79				
_?L392:						
						
	pea _cp932rsc_flac_freq_error		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,-900(a6)		
	jbra _?L79				
_?L389:						
						
	move.l _g_init_chain_table,a3		
	lea _himem_free,a4			
						
	tst.l a3				
	jbeq _?L207				
_?L203:						
						
	move.l (a3),d0				
						
	jbeq _?L205				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
_?L205:						
						
	move.l 6(a3),d3				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d3				
	jbeq _?L207				
						
	move.l d3,a3				
	jbra _?L203				
_?L207:						
						
	clr.l _g_init_chain_table		
	jbra _?L204				
_?L219:						
						
	clr.l d6				
	lea _fread,a4				
						
	move.l #16777216,d5			
_?L83:						
						
	move.l d3,-(sp)				
						
	move.l d4,d0				
	sub.l d6,d0				
						
	cmp.l #16777216,d0			
	jbls _?L86				
	move.l d5,d0				
_?L86:						
						
	move.l d0,-(sp)				
	pea 1.w					
	pea (a3,d6.l)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	add.l d0,d6				
						
	cmp.l d4,d6				
	jbcs _?L83				
	jbra _?L85				
_?L91:						
						
	tst.w -872(a6)				
	jbne _?L92				
						
	tst.w -888(a6)				
	jble _?L93				
_?L92:						
						
	pea 10.w				
	jbsr _putchar				
						
	move.l -866(a6),(sp)			
	pea _?LC18				
	lea _printf,a4				
	jbsr (a4)				
						
	addq.l #4,sp				
	move.l d4,(sp)				
	pea _?LC19				
	jbsr (a4)				
						
	addq.l #4,sp				
	move.l #_?LC20,(sp)			
	pea _?LC21				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.w -876(a6),a0			
	cmp.w #1,d7				
	jbeq _?L221				
						
	move.l #_?LC10,d0			
						
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	pea _?LC22				
	jbsr (a4)				
						
	addq.l #8,sp				
	move.l -502(a6),(sp)			
	pea _?LC23				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l #_?LC13,d0			
	moveq #1,d1				
	cmp.l -498(a6),d1			
	jbeq _?L393				
_?L95:						
						
	move.l d0,-(sp)				
	pea _?LC24				
	jbsr (a4)				
						
	addq.l #4,sp				
	move.l -494(a6),(sp)			
	pea _?LC25				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l -514(a6),d0			
						
	jbeq _?L96				
						
	move.l d0,-(sp)				
	pea _?LC26				
	jbsr (a4)				
	addq.l #8,sp				
_?L96:						
						
	move.l -510(a6),d0			
						
	jbeq _?L97				
						
	move.l d0,-(sp)				
	pea _?LC27				
	jbsr (a4)				
	addq.l #8,sp				
_?L97:						
						
	move.l -506(a6),d0			
						
	jbeq _?L98				
						
	move.l d0,-(sp)				
	pea _?LC28				
	jbsr (a4)				
	addq.l #8,sp				
_?L98:						
						
	pea 10.w				
	jbsr _putchar				
	addq.l #4,sp				
_?L93:						
	move.l -882(a6),d4			
	addq.l #1,d4				
						
	clr.l d3				
	clr.l -872(a6)				
	clr.l d6				
						
	lea _flac_decode_full,a4		
	move.l a3,-862(a6)			
	move.l -854(a6),d5			
_?L99:						
	move.l d4,d1				
	subq.l #1,d1				
	move.l d1,-882(a6)			
						
	cmp.w -884(a6),d3			
	jbge _?L394				
	addq.l #1,d3				
						
	move.l d5,-(sp)				
	move.l d3,-(sp)				
	pea _?LC29				
	jbsr _printf				
	lea (12,sp),sp				
						
	tst.w d7				
	jbeq _?L395				
						
	pea 1.w					
	pea 12.w				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,a3				
						
	tst.l d0				
	jbeq _?L113				
						
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
						
	jbeq _?L113				
						
	pea -838(a6)				
	move.l #176400,-(sp)			
	move.l d0,-(sp)				
	pea -526(a6)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	tst.l d0				
	jbne _?L396				
						
	move.l -838(a6),d0			
						
	jbeq _?L397				
						
	move.l d0,4(a3)				
						
	tst.l _g_init_chain_table_ex		
	jbeq _?L398				
_?L117:						
						
	tst.l -872(a6)				
	jbeq _?L118				
						
	move.l -872(a6),a0			
	move.l a3,8(a0)				
_?L118:						
						
	move.l a3,-872(a6)			
_?L109:						
						
	jbsr _B_SFTSNS				
						
	addq.l #1,d4				
	btst #0,d0				
	jbeq _?L99				
						
	pea _?LC30				
	jbsr _puts				
	addq.l #4,sp				
						
	jbra _?L51				
_?L398:						
						
	move.l a3,_g_init_chain_table_ex	
	jbra _?L117				
_?L393:						
						
	move.l #_?LC12,d0			
	jbra _?L95				
_?L395:						
						
	pea 1.w					
	pea 10.w				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,a3				
						
	tst.l d0				
	jbeq _?L103				
						
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
						
	jbeq _?L103				
						
	pea -838(a6)				
	pea 15625.w				
	pea 31250.w				
	move.l d0,-(sp)				
	pea -526(a6)				
	jbsr _flac_decode_resample		
	lea (20,sp),sp				
						
	tst.l d0				
	jbne _?L399				
						
	move.l -838(a6),d0			
						
	jbeq _?L400				
						
	move.w d0,4(a3)				
						
	tst.l _g_init_chain_table		
	jbeq _?L401				
_?L107:						
						
	tst.l d6				
	jbeq _?L108				
						
	move.l d6,a0				
	move.l a3,6(a0)				
_?L108:						
						
	move.l a3,d6				
	jbra _?L109				
_?L401:						
						
	move.l a3,_g_init_chain_table		
	jbra _?L107				
_?L388:						
						
	pea _cp932rsc_flac_decoder_setup_error	
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,-900(a6)		
						
	tst.w d7				
	jbne _?L119				
	jbra _?L110				
_?L387:						
						
	pea _cp932rsc_mainmem_shortage		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
	lea _ONTIME,a4				
	move.l #_B_PRINT,-900(a6)		
_?L402:						
						
	tst.w d7				
	jbne _?L119				
	jbra _?L110				
_?L384:						
						
	pea _cp932rsc_file_open_error		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	sub.l a3,a3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,-900(a6)		
						
	tst.w d7				
	jbne _?L119				
	jbra _?L110				
_?L386:						
						
	pea _cp932rsc_himem_shortage		
						
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
	lea _ONTIME,a4				
	move.l #_B_PRINT,-900(a6)		
	jbra _?L402				
_?L381:						
						
	jbsr _pcm8pp_isavailable		
						
	tst.l d0				
	jbeq _?L69				
						
	jbsr _pcm8pp_get_frequency_mode		
						
	move.l d0,_g_original_pcm8pp_frequency_mode
						
	tst.w -888(a6)				
	jbeq _?L403				
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
						
	moveq #1,d3				
	jbra _?L72				
_?L221:						
						
	move.l #_?LC11,d0			
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	pea _?LC22				
	jbsr (a4)				
						
	addq.l #8,sp				
	move.l -502(a6),(sp)			
	pea _?LC23				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l #_?LC13,d0			
	moveq #1,d1				
	cmp.l -498(a6),d1			
	jbne _?L95				
	jbra _?L393				
_?L394:						
						
	move.l -862(a6),a3			
	move.w -876(a6),d3			
	swap d3					
	clr.w d3				
						
	move.l d3,d1				
	or.w #5123,d1				
	move.l d1,-842(a6)			
						
	clr.w d4				
						
	tst.w d7				
	jbeq _?L106				
_?L116:						
						
	move.l -502(a6),-850(a6)		
						
	move.l -498(a6),d0			
						
	cmp.l #22050,-850(a6)			
	jbeq _?L404				
						
	cmp.l #24000,-850(a6)			
	jbeq _?L405				
						
	cmp.l #32000,-850(a6)			
	jbeq _?L406				
						
	cmp.l #44100,-850(a6)			
	jbeq _?L407				
						
	cmp.l #48000,-850(a6)			
	jbne _?L131				
						
	cmp.w #1,d0				
	jbne _?L408				
						
	or.w #3587,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L143				
_?L139:						
						
	pea _?LC31				
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-862(a6)			
_?L147:						
						
	jbsr (a4)				
						
	cmp.l -862(a6),d0			
	jble _?L147				
	move.w -884(a6),-862(a6)		
						
	clr.l -846(a6)				
						
	clr.w d3				
	move.l #_B_PRINT,-900(a6)		
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbne _?L409				
_?L149:						
						
	tst.w d3				
	jbne _?L159				
						
	tst.w d7				
	jbeq _?L153				
_?L154:						
						
	clr.l -(sp)				
	jbsr _pcm8pp_get_data_length		
	addq.l #4,sp				
						
	tst.l d0				
	jbeq _?L160				
						
	tst.w d4				
	jbne _?L358				
	clr.w d3				
_?L158:						
						
	pea 1.w					
	pea 12.w				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,d5				
						
	jbeq _?L183				
						
	pea 12.w				
	clr.l -(sp)				
	move.l d0,-(sp)				
	jbsr _memset				
						
	addq.l #8,sp				
	moveq #1,d1				
	move.l d1,(sp)				
	move.l #176400,-(sp)			
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l d5,a0				
	move.l d0,(a0)				
						
	jbeq _?L183				
						
	pea -838(a6)				
	move.l #176400,-(sp)			
	move.l d0,-(sp)				
	pea -526(a6)				
	jbsr _flac_decode_full			
	lea (16,sp),sp				
						
	tst.l d0				
	jbne _?L410				
						
	move.l -838(a6),d0			
						
	jbeq _?L411				
						
	move.l d5,a1				
	move.l d0,4(a1)				
						
	move.l -872(a6),a0			
	move.l d5,8(a0)				
						
	addq.l #1,-882(a6)			
						
	move.w -880(a6),-872(a6)		
						
	clr.l -(sp)				
	jbsr _pcm8pp_get_block_counter		
	addq.l #4,sp				
						
	move.w -880(a6),d4			
	sub.w -844(a6),d4			
	sub.w d0,d4				
						
	cmp.w -862(a6),d4			
	jblt _?L187				
						
	tst.w -868(a6)				
	jbeq _?L188				
						
	move.w -862(a6),d4			
_?L189:						
						
	clr.l -(sp)				
	jbsr _pcm8pp_get_data_length		
	addq.l #4,sp				
						
	tst.l d0				
	jbeq _?L412				
_?L195:						
	move.w d4,-862(a6)			
	move.l d5,-872(a6)			
	clr.w d4				
_?L429:						
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L149				
	jbra _?L409				
_?L400:						
						
	move.l a3,d5				
	move.l -862(a6),a3			
	pea 1.w					
	move.l d5,a0				
	move.l (a0),-(sp)			
	lea _himem_free,a4			
	jbsr (a4)				
	addq.l #8,sp				
						
	pea 1.w					
	move.l d5,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.w -876(a6),d3			
	swap d3					
	clr.w d3				
						
	move.l d3,d1				
	or.w #5123,d1				
	move.l d1,-842(a6)			
						
	moveq #1,d4				
_?L106:						
						
	pea 1.w					
	jbsr _pcm8a_set_polyphonic_mode		
						
	move.l _g_init_chain_table,(sp)		
	move.l -842(a6),-(sp)			
	clr.l -(sp)				
	jbsr _pcm8a_play_linked_array_chain	
	lea (12,sp),sp				
	jbra _?L116				
_?L409:						
						
	jbsr _B_KEYINP				
						
	asr.l #8,d0				
						
	move.w d0,d1				
						
	and.w #-17,d0				
	cmp.w #1,d0				
	jbeq _?L413				
						
	cmp.w #53,d1				
	jbne _?L149				
						
	tst.w d3				
	jbeq _?L151				
						
	tst.w d7				
	jbne _?L152				
						
	jbsr _pcm8a_resume			
_?L153:						
						
	clr.l -(sp)				
	jbsr _pcm8a_get_data_length		
	addq.l #4,sp				
						
	tst.l d0				
	jbne _?L414				
_?L160:						
						
	tst.w d4				
	jbne _?L415				
						
	pea _cp932rsc_buffer_underrun		
	pea _?LC34				
	jbsr _printf				
	addq.l #8,sp				
	clr.w d3				
_?L163:						
						
	tst.w d7				
	jbne _?L158				
_?L156:						
						
	pea 1.w					
	pea 10.w				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,d4				
						
	jbeq _?L166				
						
	pea 10.w				
	clr.l -(sp)				
	move.l d0,-(sp)				
	jbsr _memset				
						
	addq.l #8,sp				
	moveq #1,d2				
	move.l d2,(sp)				
	pea 31250.w				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l d4,a1				
	move.l d0,(a1)				
						
	jbeq _?L166				
						
	pea -838(a6)				
	pea 15625.w				
	pea 31250.w				
	move.l d0,-(sp)				
	pea -526(a6)				
	jbsr _flac_decode_resample		
	lea (20,sp),sp				
	move.l d0,d5				
						
	jbne _?L416				
						
	move.l -838(a6),d0			
						
	jbne _?L168				
						
	pea 1.w					
	move.l d4,a0				
	move.l (a0),-(sp)			
	lea _himem_free,a0			
	move.l a0,-896(a6)			
	jbsr (a0)				
	addq.l #8,sp				
						
	pea 1.w					
	move.l d4,-(sp)				
	move.l -896(a6),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.w -868(a6)				
	jbeq _?L417				
_?L186:						
						
	moveq #1,d4				
_?L418:						
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L149				
	jbra _?L409				
_?L414:						
						
	tst.w d4				
	jbne _?L358				
	clr.w d3				
	jbra _?L156				
_?L417:						
						
	pea _?LC35				
	move.l -900(a6),a1			
	jbsr (a1)				
	addq.l #4,sp				
						
	moveq #1,d4				
	jbra _?L418				
_?L412:						
						
	clr.l -(sp)				
	move.l d0,-896(a6)			
	jbsr _pcm8pp_get_block_counter		
	addq.l #4,sp				
						
	move.l -846(a6),d2			
	add.l d0,d2				
						
	move.l -882(a6),a0			
	sub.l d2,a0				
						
	move.l -896(a6),d1			
	moveq #6,d0				
	cmp.l a0,d0				
	jbge _?L195				
						
	move.l _g_init_chain_table_ex,a1	
_?L196:						
						
	cmp.l d1,d2				
	jble _?L419				
						
	move.l 8(a1),a1				
						
	tst.l a1				
	jbeq _?L195				
						
	addq.l #1,d1				
	jbra _?L196				
_?L188:						
						
	pea _?LC36				
	move.l -900(a6),a1			
	jbsr (a1)				
	addq.l #4,sp				
						
	move.w -862(a6),d4			
	jbra _?L189				
_?L408:						
						
	cmp.w #2,d0				
	jbne _?L131				
						
	or.w #7683,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbne _?L139				
_?L143:						
						
	jbsr _pcm8pp_get_frequency_mode		
						
	subq.l #2,d0				
	jbeq _?L140				
						
	pea 2.w					
	jbsr _pcm8pp_set_frequency_mode		
	addq.l #4,sp				
_?L140:						
						
	move.l _g_init_chain_table_ex,-(sp)	
						
	move.l -850(a6),d0			
	lsl.l #8,d0				
						
	move.l d0,-(sp)				
	pea 1.w					
	move.l -858(a6),-(sp)			
	clr.l -(sp)				
	jbsr _pcm8pp_play_ex_linked_array_chain	
	lea (20,sp),sp				
_?L423:						
						
	pea _?LC31				
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-862(a6)			
	jbra _?L147				
_?L159:						
						
	tst.w d4				
	jbeq _?L163				
_?L157:						
						
	moveq #1,d3				
	moveq #1,d4				
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L149				
	jbra _?L409				
_?L358:						
						
	clr.w d3				
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L149				
	jbra _?L409				
_?L168:						
						
	move.l d4,a0				
	move.w d0,4(a0)				
						
	move.l d6,a1				
	move.l d4,6(a1)				
						
	addq.l #1,-882(a6)			
						
	clr.l -(sp)				
	jbsr _pcm8a_get_access_address		
	addq.l #4,sp				
						
	move.l _g_init_chain_table,a0		
_?L170:						
						
	tst.l a0				
	jbeq _?L172				
						
	move.l (a0),a1				
						
	cmp.l a1,d0				
	jbcs _?L171				
						
	clr.l d1				
	move.w 4(a0),d1				
	add.l d1,d1				
						
	add.l a1,d1				
						
	cmp.l d0,d1				
	jbhi _?L172				
_?L171:						
						
	addq.l #1,d5				
						
	move.l 6(a0),a0				
	jbra _?L170				
_?L172:						
						
	move.w -880(a6),d6			
	sub.w d5,d6				
						
	cmp.w -862(a6),d6			
	jblt _?L174				
						
	tst.w -868(a6)				
	jbeq _?L420				
_?L176:						
						
	clr.l -(sp)				
	move.l a0,-896(a6)			
	jbsr _pcm8a_get_data_length		
	addq.l #4,sp				
						
	move.l -896(a6),a0			
	tst.l d0				
	jbne _?L180				
						
	move.l -882(a6),d0			
	sub.l d5,d0				
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbge _?L180				
						
	tst.l a0				
	jbeq _?L180				
						
	move.l a0,-(sp)				
	move.l -842(a6),-(sp)			
	clr.l -(sp)				
	jbsr _pcm8a_play_linked_array_chain	
	lea (12,sp),sp				
						
	move.w d6,-862(a6)			
_?L180:						
	move.l d4,d6				
	clr.w d4				
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L149				
	jbra _?L409				
_?L420:						
						
	pea _?LC36				
	move.l a0,-896(a6)			
	move.l -900(a6),a1			
	jbsr (a1)				
	addq.l #4,sp				
	move.l -896(a6),a0			
	jbra _?L176				
_?L151:						
						
	tst.w d7				
	jbne _?L155				
						
	jbsr _pcm8a_pause			
						
	tst.w d4				
	jbne _?L157				
						
	moveq #1,d3				
	jbra _?L156				
_?L174:						
						
	tst.w -868(a6)				
	jbeq _?L178				
						
	move.w d6,-862(a6)			
	jbra _?L176				
_?L178:						
						
	pea _?LC37				
	move.l a0,-896(a6)			
	move.l -900(a6),a1			
	jbsr (a1)				
	addq.l #4,sp				
	move.l -896(a6),a0			
						
	move.w d6,-862(a6)			
	jbra _?L176				
_?L152:						
						
	jbsr _pcm8pp_resume			
	jbra _?L154				
_?L155:						
						
	jbsr _pcm8pp_pause			
						
	tst.w d4				
	jbne _?L157				
						
	move.w d7,d3				
	jbra _?L158				
_?L187:						
						
	tst.w -868(a6)				
	jbne _?L189				
						
	pea _?LC37				
	move.l -900(a6),a0			
	jbsr (a0)				
	addq.l #4,sp				
						
	clr.l -(sp)				
	jbsr _pcm8pp_get_data_length		
	addq.l #4,sp				
						
	tst.l d0				
	jbne _?L195				
	jbra _?L412				
_?L411:						
						
	pea 1.w					
	move.l d5,a1				
	move.l (a1),-(sp)			
	lea _himem_free,a0			
	move.l a0,-896(a6)			
	jbsr (a0)				
	addq.l #8,sp				
						
	pea 1.w					
	move.l d5,-(sp)				
	move.l -896(a6),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.w -868(a6)				
	jbne _?L186				
						
	pea _?LC35				
	move.l -900(a6),a0			
	jbsr (a0)				
	addq.l #4,sp				
						
	moveq #1,d4				
	jbra _?L418				
_?L73:						
						
	pea _?LC0				
	jbsr _puts				
	addq.l #4,sp				
						
	jbsr _pcm8a_pause			
						
	jbsr _pcm8a_stop			
						
	jbsr _C_CUROFF				
	clr.w d3				
	move.w #1,-872(a6)			
	clr.l -882(a6)				
	moveq #1,d1				
	move.l d1,-892(a6)			
						
	move.w -884(a6),a0			
	move.l a0,-854(a6)			
	move.l d7,-866(a6)			
	move.w d3,d7				
	jbra _?L213				
_?L378:						
						
	jbsr _show_help_message			
						
	moveq #1,d1				
	move.l d1,-892(a6)			
						
	jbsr _C_CURON				
						
	move.l _g_funckey_mode,d0		
						
	jbmi _?L215				
	jbra _?L376				
_?L413:						
						
	pea _?LC32				
	move.l -900(a6),a1			
	jbsr (a1)				
	addq.l #4,sp				
						
	clr.l d3				
						
	clr.w -872(a6)				
						
	moveq #1,d1				
	move.l d1,-892(a6)			
						
	tst.w d7				
	jbne _?L119				
	jbra _?L110				
_?L113:						
						
	move.l -862(a6),a3			
	pea _cp932rsc_himem_shortage		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -872(a6)				
	lea _ONTIME,a4				
	move.l #_B_PRINT,-900(a6)		
_?L424:						
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
	jbra _?L198				
_?L403:						
						
	pea _?LC0				
	jbsr _puts				
	addq.l #4,sp				
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
						
	jbsr _C_CUROFF				
	moveq #1,d3				
	move.w #1,-872(a6)			
	clr.l -882(a6)				
	moveq #1,d1				
	move.l d1,-892(a6)			
						
	move.w -884(a6),a0			
	move.l a0,-854(a6)			
	move.l d7,-866(a6)			
	move.w d3,d7				
	jbra _?L213				
_?L404:						
						
	cmp.w #1,d0				
	jbeq _?L421				
						
	cmp.w #2,d0				
	jbeq _?L422				
_?L131:						
						
	or.w #7427,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbne _?L139				
_?L142:						
						
	jbsr _pcm8pp_get_frequency_mode		
						
	subq.l #1,d0				
	jbeq _?L140				
						
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
	jbra _?L423				
_?L422:						
						
	or.w #6659,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L140				
						
	pea _?LC31				
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-862(a6)			
	jbra _?L147				
_?L69:						
						
	pea _cp932rsc_pcm8_not_available	
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	moveq #1,d1				
	move.l d1,-892(a6)			
	jbra _?L51				
_?L396:						
						
	move.l -862(a6),a3			
	pea _cp932rsc_flac_decode_error		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -872(a6)				
	lea _ONTIME,a4				
	move.l #_B_PRINT,-900(a6)		
	jbra _?L424				
_?L166:						
						
	pea _cp932rsc_himem_shortage		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -872(a6)				
_?L428:						
						
	jbsr _pcm8a_pause			
						
	jbsr _pcm8a_stop			
	jbra _?L425				
_?L399:						
						
	move.l -862(a6),a3			
	pea _cp932rsc_flac_decode_error		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.w -872(a6)				
						
	clr.l d3				
	lea _ONTIME,a4				
	move.l #_B_PRINT,-900(a6)		
	jbra _?L110				
_?L405:						
						
	cmp.w #1,d0				
	jbne _?L426				
						
	or.w #2819,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L140				
						
	pea _?LC31				
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-862(a6)			
	jbra _?L147				
_?L397:						
						
	move.l a3,d5				
	move.l -862(a6),a3			
	pea 1.w					
	move.l d5,a1				
	move.l (a1),-(sp)			
	lea _himem_free,a4			
	jbsr (a4)				
	addq.l #8,sp				
						
	pea 1.w					
	move.l d5,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.w -876(a6),d3			
	swap d3					
	clr.w d3				
						
	move.l d3,d1				
	or.w #5123,d1				
	move.l d1,-842(a6)			
						
	move.w d7,d4				
	jbra _?L116				
_?L426:						
						
	cmp.w #2,d0				
	jbne _?L131				
						
	or.w #6915,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L140				
						
	pea _?LC31				
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-862(a6)			
	jbra _?L147				
_?L421:						
						
	or.w #2563,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L140				
						
	pea _?LC31				
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-862(a6)			
	jbra _?L147				
_?L406:						
						
	cmp.w #1,d0				
	jbne _?L427				
						
	or.w #3075,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L140				
						
	pea _?LC31				
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-862(a6)			
	jbra _?L147				
_?L407:						
						
	cmp.w #1,d0				
	jbne _?L131				
						
	or.w #3331,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L142				
						
	pea _?LC31				
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-862(a6)			
	jbra _?L147				
_?L427:						
						
	cmp.w #2,d0				
	jbne _?L131				
						
	or.w #7171,d3				
	move.l d3,-858(a6)			
						
	cmp.w #1,d7				
	jbeq _?L140				
						
	pea _?LC31				
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a4				
	jbsr (a4)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-862(a6)			
	jbra _?L147				
_?L416:						
						
	pea _cp932rsc_flac_decode_error		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -872(a6)				
	jbra _?L428				
_?L183:						
						
	pea _cp932rsc_himem_shortage		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -872(a6)				
_?L430:						
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
	jbra _?L198				
_?L415:						
						
	pea _?LC33				
	move.l -900(a6),a0			
	jbsr (a0)				
	addq.l #4,sp				
						
	clr.l -892(a6)				
						
	clr.l d3				
						
	clr.w -872(a6)				
						
	tst.w d7				
	jbne _?L119				
	jbra _?L110				
_?L419:						
						
	tst.l a1				
	jbeq _?L195				
						
	move.l a1,-(sp)				
						
	move.l -850(a6),d0			
	lsl.l #8,d0				
						
	move.l d0,-(sp)				
	pea 1.w					
	move.l -858(a6),-(sp)			
	clr.l -(sp)				
	move.l d2,-896(a6)			
	jbsr _pcm8pp_play_ex_linked_array_chain	
						
	lea (16,sp),sp				
	clr.l (sp)				
	jbsr _pcm8pp_get_block_counter		
	addq.l #4,sp				
						
	move.l -896(a6),d2			
	move.w -872(a6),d1			
	sub.w d2,d1				
	move.w d1,d4				
	sub.w d0,d4				
						
	move.l d2,-846(a6)			
	move.w d4,-862(a6)			
	move.l d5,-872(a6)			
	clr.w d4				
	jbra _?L429				
_?L410:						
						
	pea _cp932rsc_flac_decode_error		
	pea -782(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -872(a6)				
	jbra _?L430				
						
						
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
						
