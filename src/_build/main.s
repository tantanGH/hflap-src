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
	.dc.b $2e,$36,$20,$28,$32,$30,$32,$34
	.dc.b $2f,$30,$33,$2f,$31,$35,$29,$20
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
	movem.l d3/a3/a4,-(sp)			
						
	move.l _g_abort_vector1,-(sp)		
	move.l #65521,-(sp)			
	lea _INTVCS,a3				
	jbsr (a3)				
						
	addq.l #4,sp				
	move.l _g_abort_vector2,(sp)		
	move.l #65522,-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
						
	jbsr _pcm8a_isavailable			
						
	tst.l d0				
	jbne _?L43				
						
	jbsr _pcm8pp_isavailable		
						
	tst.l d0				
	jbne _?L44				
_?L9:						
						
	move.l _fread_staging_buffer,d0		
						
	jbeq _?L14				
						
	clr.l -(sp)				
	move.l d0,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
						
	clr.l _fread_staging_buffer		
_?L14:						
						
	move.l _fread_buffer,d0			
						
	jbeq _?L15				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
						
	clr.l _fread_buffer			
_?L15:						
						
	jbsr _C_CURON				
						
	move.l _g_funckey_mode,d0		
						
	jbpl _?L45				
						
	pea 255.w				
	jbsr _KFLUSHIO				
						
	move.l #_?LC9,(sp)			
	jbsr _puts				
						
	moveq #1,d0				
	move.l d0,(sp)				
	jbsr _exit				
_?L45:						
						
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
_?L44:						
						
	jbsr _pcm8pp_stop			
						
	move.w _g_original_pcm8pp_frequency_mode+2,a0
	move.l a0,-(sp)				
	jbsr _pcm8pp_set_frequency_mode		
	addq.l #4,sp				
						
	move.l _g_init_chain_table_ex,a3	
						
	tst.l a3				
	jbeq _?L10				
	lea _himem_free,a4			
_?L13:						
						
	move.l (a3),d0				
						
	jbeq _?L11				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
_?L11:						
						
	move.l 8(a3),d3				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d3				
	jbeq _?L10				
						
	move.l d3,a3				
	jbra _?L13				
_?L43:						
						
	jbsr _pcm8a_stop			
						
	move.l _g_init_chain_table,a3		
						
	tst.l a3				
	jbeq _?L5				
	lea _himem_free,a4			
_?L8:						
						
	move.l (a3),d0				
						
	jbeq _?L6				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
_?L6:						
						
	move.l 6(a3),d3				
						
	pea 1.w					
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d3				
	jbeq _?L5				
						
	move.l d3,a3				
	jbra _?L8				
_?L5:						
						
	clr.l _g_init_chain_table		
						
	jbsr _pcm8pp_isavailable		
						
	tst.l d0				
	jbeq _?L9				
	jbra _?L44				
_?L10:						
						
	clr.l _g_init_chain_table_ex		
	jbra _?L9				
						
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
	.dc.b $0d,$1b,$5b,$30,$4b,$1b,$4d
	.dc.b $00				
_?LC32:						
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
_?LC33:						
	.dc.b $0d,$0a,$53,$74,$6f,$70,$70,$65
	.dc.b $64,$2e
	.dc.b $00				
_?LC34:						
	.dc.b $0d,$0a,$46,$69,$6e,$69,$73,$68
	.dc.b $65,$64,$2e,$0d,$0a
	.dc.b $00				
_?LC35:						
	.dc.b $0a,$25,$73,$0a
	.dc.b $00				
_?LC36:						
	.dc.b $7c
	.dc.b $00				
_?LC37:						
	.dc.b $3e
	.dc.b $00				
_?LC38:						
	.dc.b $2a
	.dc.b $00				
_?LC39:						
	.dc.b $0d,$0a
	.dc.b $00				
_?LC40:						
	.dc.b $65,$72,$72,$6f,$72,$3a,$20,$25
	.dc.b $73,$0a
	.dc.b $00				
	.text					
	.align	2				
	.xref __main	* workaround for libc.
	.globl	_main				
						
_main:						
	link.w a6,#-440				
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
						
	clr.b -256(a6)				
						
	jbsr _ROMVER				
						
	cmp.l #318767103,d0			
	jbhi _?L388				
_?L48:						
						
	pea _cp932rsc_mpu_type			
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	moveq #1,d1				
	move.l d1,-434(a6)			
_?L51:						
						
	jbsr _C_CURON				
						
	move.l _g_funckey_mode,d0		
						
	jbpl _?L389				
_?L225:						
						
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
						
	tst.b -256(a6)				
	jbne _?L390				
_?L46:						
						
	move.l -434(a6),d0			
	movem.l -472(a6),d3/d4/d5/d6/d7/a3/a4/a5
	unlk a6					
	rts					
_?L388:						
						
	pea 52.w				
	clr.l -(sp)				
	pea -376(a6)				
	jbsr _memset				
						
	addq.l #8,sp				
	moveq #56,d6				
	move.l d6,(sp)				
	clr.l -(sp)				
	pea -324(a6)				
	jbsr _memset				
	lea (12,sp),sp				
						
	move.l #172,-380(a6)			
						
	pea -324(a6)				
	pea -380(a6)				
	jbsr _TRAP15				
	addq.l #8,sp				
						
	moveq #0,d0				
	not.b d0				
	and.l -324(a6),d0			
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbge _?L48				
						
	moveq #1,d0				
	cmp.l d4,d0				
	jbge _?L391				
						
	moveq #1,d3				
						
	clr.w -408(a6)				
						
	clr.w -430(a6)				
						
	clr.w -414(a6)				
						
	move.w #4,-416(a6)			
						
	move.w #1,-428(a6)			
						
	move.w #6,-418(a6)			
						
	sub.l a5,a5				
	moveq #1,d0				
						
	lea _strlen,a3				
						
	move.l #_stricmp,d7			
	move.l #_?L59,d6			
_?L49:						
						
	lsl.l #2,d0				
	add.l d5,d0				
	move.l d0,-434(a6)			
	move.l d0,a0				
	move.l (a0),a4				
						
	cmp.b #45,(a4)				
	jbeq _?L392				
_?L52:						
						
	tst.l a5				
	jbne _?L393				
						
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbcc _?L67				
						
	pea _?LC14				
	pea -4(a4,d0.l)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L67				
						
	move.l a4,a5				
_?L55:						
	addq.w #1,d3				
						
	move.w d3,d0				
	ext.l d0				
	cmp.l d0,d4				
	jbgt _?L49				
_?L404:						
						
	tst.l a5				
	jbeq _?L68				
						
	move.l a5,-(sp)				
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbcc _?L68				
						
	jbsr _himem_isavailable			
						
	tst.l d0				
	jbeq _?L71				
						
	jbsr _pcm8a_isavailable			
						
	tst.l d0				
	jbeq _?L394				
						
	tst.w -430(a6)				
	jbeq _?L78				
						
	jbsr _pcm8a_pause			
						
	jbsr _pcm8a_stop			
						
	clr.w d6				
_?L77:						
						
	jbsr _C_CUROFF				
						
	tst.w -430(a6)				
	jble _?L79				
						
	clr.l -(sp)				
	jbsr _B_SUPER				
	addq.l #4,sp				
_?L79:						
						
	move.w #1,-412(a6)			
	clr.l -424(a6)				
	moveq #1,d1				
	move.l d1,-434(a6)			
						
	move.w -416(a6),a0			
	move.l a0,-396(a6)			
						
	move.l a5,-406(a6)			
	move.w -428(a6),d7			
_?L223:						
						
	tst.w -430(a6)				
	jbgt _?L395				
_?L82:						
						
	pea 68.w				
	clr.l -(sp)				
	pea -324(a6)				
	jbsr _memset				
	lea (12,sp),sp				
						
	pea -324(a6)				
	jbsr _flac_decode_init			
	addq.l #4,sp				
						
	tst.l d0				
	jbne _?L396				
_?L83:						
						
	pea _?LC15				
	move.l -406(a6),-(sp)			
	jbsr _fopen				
	addq.l #8,sp				
	move.l d0,d3				
						
	jbeq _?L397				
						
	tst.w -430(a6)				
	jbgt _?L398				
_?L87:						
						
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
	lea _himem_malloc,a4			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,_fread_buffer			
						
	jbeq _?L399				
						
	pea _?LC16				
	jbsr _printf				
	addq.l #4,sp				
						
	tst.w -414(a6)				
	jbeq _?L229				
						
	clr.l -(sp)				
	move.l #524288,-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,-428(a6)			
						
	move.l d0,_fread_staging_buffer		
						
	jbeq _?L400				
						
	clr.l d5				
	lea _fread,a3				
_?L91:						
						
	move.l d3,-(sp)				
	move.l #524288,-(sp)			
	pea 1.w					
	move.l -428(a6),-(sp)			
	jbsr (a3)				
	lea (16,sp),sp				
	move.l d0,a5				
						
	move.l _fread_staging_buffer,-428(a6)	
	move.l d0,-(sp)				
	move.l -428(a6),-(sp)			
	move.l _fread_buffer,d0			
	add.l d5,d0				
	move.l d0,-(sp)				
	jbsr _memcpy				
	lea (12,sp),sp				
						
	add.l a5,d5				
						
	cmp.l d4,d5				
	jbcs _?L91				
						
	clr.l -(sp)				
	move.l -428(a6),-(sp)			
	jbsr _himem_free			
	addq.l #8,sp				
						
	clr.l _fread_staging_buffer		
_?L93:						
						
	move.l d3,-(sp)				
	jbsr _fclose				
						
	move.l #_?LC17,(sp)			
	jbsr _printf				
						
	move.l d4,(sp)				
	move.l _fread_buffer,-(sp)		
	pea -324(a6)				
	jbsr _flac_decode_setup			
	lea (12,sp),sp				
						
	tst.l d0				
	jbne _?L401				
						
	moveq #-9,d0				
	and.l -292(a6),d0			
	moveq #16,d1				
	cmp.l d0,d1				
	jbeq _?L97				
						
	pea _cp932rsc_flac_bps_error		
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
	lea _ONTIME,a3				
	move.l #_B_PRINT,d4			
_?L89:						
						
	tst.w d6				
	jbeq _?L119				
_?L128:						
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
_?L207:						
						
	jbsr (a3)				
						
	move.w #19,a4				
	add.l d0,a4				
_?L208:						
						
	jbsr (a3)				
						
	cmp.l a4,d0				
	jble _?L208				
						
	tst.l d3				
	jbeq _?L209				
						
	move.l d3,-(sp)				
	jbsr _fclose				
	addq.l #4,sp				
_?L209:						
						
	move.l _fread_staging_buffer,d0		
						
	jbeq _?L210				
						
	clr.l -(sp)				
	move.l d0,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
						
	clr.l _fread_staging_buffer		
_?L210:						
						
	move.l _fread_buffer,d0			
						
	jbeq _?L211				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
						
	clr.l _fread_buffer			
_?L211:						
						
	pea -324(a6)				
	jbsr _flac_decode_close			
	addq.l #4,sp				
						
	tst.w d6				
	jbeq _?L402				
						
	move.l _g_init_chain_table_ex,a4	
	lea _himem_free,a3			
						
	tst.l a4				
	jbeq _?L220				
_?L218:						
						
	move.l (a4),d0				
						
	jbeq _?L219				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
_?L219:						
						
	move.l 8(a4),d3				
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	tst.l d3				
	jbeq _?L220				
						
	move.l d3,a4				
	jbra _?L218				
_?L392:						
						
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcc _?L52				
						
	move.b 1(a4),d1				
						
	cmp.b #118,d1				
	jbeq _?L403				
	move.b d1,d0				
	add.b #-98,d0				
	cmp.b #18,d0				
	jbhi _?L57				
	and.l #255,d0				
	add.l d0,d0				
	move.l d0,a0				
	move.w (a0,d6.l),d0			
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L59:						
	.dc.w _?L62-_?L59			
	.dc.w _?L57-_?L59			
	.dc.w _?L57-_?L59			
	.dc.w _?L57-_?L59			
	.dc.w _?L57-_?L59			
	.dc.w _?L57-_?L59			
	.dc.w _?L57-_?L59			
	.dc.w _?L57-_?L59			
	.dc.w _?L57-_?L59			
	.dc.w _?L57-_?L59			
	.dc.w _?L61-_?L59			
	.dc.w _?L57-_?L59			
	.dc.w _?L228-_?L59			
	.dc.w _?L57-_?L59			
	.dc.w _?L57-_?L59			
	.dc.w _?L57-_?L59			
	.dc.w _?L57-_?L59			
	.dc.w _?L60-_?L59			
	.dc.w _?L58-_?L59			
_?L57:						
						
	cmp.b #104,d1				
	jbeq _?L373				
						
	move.l a4,-(sp)				
	pea _cp932rsc_unknown_option		
	pea -256(a6)				
	jbsr _sprintf				
	lea (12,sp),sp				
						
	moveq #1,d1				
	move.l d1,-434(a6)			
_?L56:						
						
	tst.w -430(a6)				
	jble _?L51				
						
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
						
	move.w #2,-380(a6)			
	clr.w -378(a6)				
	clr.w -376(a6)				
	move.w #768,-374(a6)			
	move.w #512,-372(a6)			
	clr.w -370(a6)				
						
	pea -380(a6)				
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
						
	jbmi _?L225				
_?L389:						
						
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
						
	tst.b -256(a6)				
	jbeq _?L46				
_?L390:						
						
	pea -256(a6)				
	pea _?LC40				
	jbsr _printf				
	addq.l #8,sp				
						
	move.l -434(a6),d0			
	movem.l -472(a6),d3/d4/d5/d6/d7/a3/a4/a5
	unlk a6					
	rts					
_?L58:						
						
	pea 2(a4)				
	jbsr _atoi				
	addq.l #4,sp				
						
	move.w d0,-430(a6)			
						
	cmp.w #100,d0				
	jbhi _?L373				
						
	move.l -434(a6),a0			
	move.l (a0),-(sp)			
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbcs _?L55				
_?L373:						
						
	jbsr _show_help_message			
						
	moveq #1,d1				
	move.l d1,-434(a6)			
						
	jbra _?L56				
_?L61:						
						
	pea 2(a4)				
	jbsr _atoi				
	addq.l #4,sp				
						
	move.w d0,-428(a6)			
	addq.w #1,d3				
						
	move.w d3,d0				
	ext.l d0				
	cmp.l d0,d4				
	jbgt _?L49				
	jbra _?L404				
_?L62:						
						
	pea 2(a4)				
	jbsr _atoi				
	addq.l #4,sp				
						
	move.w d0,-416(a6)			
						
	subq.w #3,d0				
						
	cmp.w #29,d0				
	jbhi _?L373				
	addq.w #1,d3				
						
	move.w d3,d0				
	ext.l d0				
	cmp.l d0,d4				
	jbgt _?L49				
	jbra _?L404				
_?L403:						
						
	pea 2(a4)				
	jbsr _atoi				
	addq.l #4,sp				
						
	move.w d0,-418(a6)			
						
	subq.w #1,d0				
						
	cmp.w #14,d0				
	jbhi _?L373				
						
	move.l -434(a6),a0			
	move.l (a0),-(sp)			
	jbsr (a3)				
	addq.l #4,sp				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbcs _?L55				
	jbra _?L373				
_?L67:						
						
	pea _cp932rsc_not_flac_file		
						
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
_?L70:						
						
	moveq #1,d1				
	move.l d1,-434(a6)			
	jbra _?L56				
_?L228:						
						
	move.w #1,-408(a6)			
	addq.w #1,d3				
						
	move.w d3,d0				
	ext.l d0				
	cmp.l d0,d4				
	jbgt _?L49				
	jbra _?L404				
_?L60:						
						
	move.w #1,-414(a6)			
	addq.w #1,d3				
						
	move.w d3,d0				
	ext.l d0				
	cmp.l d0,d4				
	jbgt _?L49				
	jbra _?L404				
_?L393:						
						
	pea _cp932rsc_too_many_files		
						
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
	jbra _?L70				
_?L68:						
						
	jbsr _show_help_message			
						
	moveq #1,d1				
	move.l d1,-434(a6)			
	jbra _?L56				
_?L71:						
						
	pea _cp932rsc_himem_not_available	
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
	jbra _?L70				
_?L395:						
						
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
						
	move.w #2,-380(a6)			
	clr.w -378(a6)				
	clr.w -376(a6)				
	move.w #768,-374(a6)			
	move.w #512,-372(a6)			
	move.w #-1,-370(a6)			
						
	pea -380(a6)				
	jbsr _TXFILL				
	addq.l #4,sp				
						
	pea 68.w				
	clr.l -(sp)				
	pea -324(a6)				
	jbsr _memset				
	lea (12,sp),sp				
						
	pea -324(a6)				
	jbsr _flac_decode_init			
	addq.l #4,sp				
						
	tst.l d0				
	jbeq _?L83				
_?L396:						
						
	pea _cp932rsc_flac_decoder_init_error	
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
	lea _ONTIME,a3				
	move.l #_B_PRINT,d4			
	jbra _?L89				
_?L398:						
						
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
						
	move.w #2,-380(a6)			
	move.w #128,-378(a6)			
	clr.w -376(a6)				
	move.w #512,-374(a6)			
	move.w #512,-372(a6)			
	clr.w -370(a6)				
						
	pea -380(a6)				
	jbsr _TXFILL				
	addq.l #4,sp				
	jbra _?L87				
_?L112:						
						
	move.w -402(a6),d7			
	pea _cp932rsc_himem_shortage		
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.w -412(a6)				
						
	clr.l d3				
	lea _ONTIME,a3				
	move.l #_B_PRINT,d4			
_?L119:						
						
	jbsr _pcm8a_pause			
						
	jbsr _pcm8a_stop			
_?L437:						
						
	jbsr (a3)				
						
	move.w #19,a4				
	add.l d0,a4				
	jbra _?L208				
_?L220:						
						
	clr.l _g_init_chain_table_ex		
_?L214:						
						
	tst.l -434(a6)				
	jbne _?L221				
						
	tst.w d7				
	jbeq _?L222				
						
	subq.w #1,d7				
						
	tst.w d7				
	jble _?L221				
_?L222:						
						
	pea _?LC39				
	move.l d4,a0				
	jbsr (a0)				
	addq.l #4,sp				
						
	tst.w -430(a6)				
	jble _?L82				
	jbra _?L395				
_?L221:						
						
	pea _?LC39				
	move.l d4,a1				
	jbsr (a1)				
	addq.l #4,sp				
	jbra _?L56				
_?L97:						
						
	move.l -300(a6),d0			
						
	cmp.l #44100,d0				
	jbeq _?L99				
						
	cmp.l #48000,d0				
	jbeq _?L99				
						
	cmp.l #96000,d0				
	jbne _?L405				
_?L99:						
						
	moveq #2,d0				
	cmp.l -296(a6),d0			
	jbeq _?L100				
						
	pea _cp932rsc_flac_channel_error	
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
	lea _ONTIME,a3				
	move.l #_B_PRINT,d4			
	jbra _?L89				
_?L405:						
						
	pea _cp932rsc_flac_freq_error		
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
	lea _ONTIME,a3				
	move.l #_B_PRINT,d4			
	jbra _?L89				
_?L402:						
						
	move.l _g_init_chain_table,a4		
	lea _himem_free,a3			
						
	tst.l a4				
	jbeq _?L217				
_?L213:						
						
	move.l (a4),d0				
						
	jbeq _?L215				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
_?L215:						
						
	move.l 6(a4),d3				
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	tst.l d3				
	jbeq _?L217				
						
	move.l d3,a4				
	jbra _?L213				
_?L217:						
						
	clr.l _g_init_chain_table		
	jbra _?L214				
_?L229:						
						
	clr.l -428(a6)				
	lea _fread,a3				
						
	move.l #16777216,d5			
_?L90:						
						
	move.l d3,-(sp)				
						
	move.l d4,d0				
	sub.l -428(a6),d0			
						
	cmp.l #16777216,d0			
	jbls _?L94				
	move.l d5,d0				
_?L94:						
						
	move.l d0,-(sp)				
	pea 1.w					
	move.l -428(a6),d1			
	add.l _fread_buffer,d1			
	move.l d1,-(sp)				
	jbsr (a3)				
	lea (16,sp),sp				
						
	add.l d0,-428(a6)			
						
	cmp.l -428(a6),d4			
	jbhi _?L90				
	jbra _?L93				
_?L399:						
						
	pea _cp932rsc_himem_shortage		
						
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
	lea _ONTIME,a3				
	move.l #_B_PRINT,d4			
_?L415:						
						
	tst.w d6				
	jbne _?L128				
	jbra _?L119				
_?L100:						
						
	tst.w -412(a6)				
	jbne _?L101				
						
	tst.w -430(a6)				
	jble _?L102				
_?L101:						
						
	pea 10.w				
	lea _putchar,a3				
	jbsr (a3)				
						
	move.l -406(a6),(sp)			
	pea _?LC18				
	jbsr _printf				
						
	addq.l #4,sp				
	move.l d4,(sp)				
	pea _?LC19				
	jbsr _printf				
						
	addq.l #4,sp				
	move.l #_?LC20,(sp)			
	pea _?LC21				
	jbsr _printf				
	addq.l #8,sp				
						
	move.w -418(a6),a0			
	cmp.w #1,d6				
	jbeq _?L231				
						
	move.l #_?LC10,d0			
						
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	pea _?LC22				
	jbsr _printf				
						
	addq.l #8,sp				
	move.l -300(a6),(sp)			
	pea _?LC23				
	jbsr _printf				
	addq.l #8,sp				
						
	move.l #_?LC13,d0			
	moveq #1,d1				
	cmp.l -296(a6),d1			
	jbeq _?L406				
_?L104:						
						
	move.l d0,-(sp)				
	pea _?LC24				
	jbsr _printf				
						
	addq.l #4,sp				
	move.l -292(a6),(sp)			
	pea _?LC25				
	jbsr _printf				
	addq.l #8,sp				
						
	move.l -312(a6),d0			
						
	jbeq _?L105				
						
	move.l d0,-(sp)				
	pea _?LC26				
	jbsr _printf				
	addq.l #8,sp				
_?L105:						
						
	move.l -308(a6),d0			
						
	jbeq _?L106				
						
	move.l d0,-(sp)				
	pea _?LC27				
	jbsr _printf				
	addq.l #8,sp				
_?L106:						
						
	move.l -304(a6),d0			
						
	jbeq _?L107				
						
	move.l d0,-(sp)				
	pea _?LC28				
	jbsr _printf				
	addq.l #8,sp				
_?L107:						
						
	pea 10.w				
	jbsr (a3)				
	addq.l #4,sp				
_?L102:						
	move.l -424(a6),d4			
	addq.l #1,d4				
						
	clr.l d3				
	clr.l -412(a6)				
	clr.l -428(a6)				
						
	lea _flac_decode_full,a3		
	move.w d7,-402(a6)			
	move.w -416(a6),d7			
	move.l -396(a6),d5			
_?L108:						
	move.l d4,d1				
	subq.l #1,d1				
	move.l d1,-424(a6)			
						
	cmp.w d7,d3				
	jbge _?L407				
	addq.l #1,d3				
						
	move.l d5,-(sp)				
	move.l d3,-(sp)				
	pea _?LC29				
	jbsr _printf				
	lea (12,sp),sp				
						
	tst.w d6				
	jbeq _?L408				
						
	pea 1.w					
	pea 12.w				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,a5				
						
	tst.l d0				
	jbeq _?L122				
						
	pea 12.w				
	clr.l -(sp)				
	move.l d0,-(sp)				
	jbsr _memset				
						
	addq.l #8,sp				
	moveq #1,d0				
	move.l d0,(sp)				
	move.l #176400,-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,(a5)				
						
	jbeq _?L122				
						
	pea -380(a6)				
	move.l #176400,-(sp)			
	move.l d0,-(sp)				
	pea -324(a6)				
	jbsr (a3)				
	lea (16,sp),sp				
						
	tst.l d0				
	jbne _?L409				
						
	move.l -380(a6),d0			
						
	jbeq _?L410				
						
	move.l d0,4(a5)				
						
	tst.l _g_init_chain_table_ex		
	jbeq _?L411				
_?L126:						
						
	tst.l -412(a6)				
	jbeq _?L127				
						
	move.l -412(a6),a0			
	move.l a5,8(a0)				
_?L127:						
						
	move.l a5,-412(a6)			
_?L118:						
						
	jbsr _B_SFTSNS				
						
	addq.l #1,d4				
	btst #0,d0				
	jbeq _?L108				
						
	pea _?LC30				
	jbsr _puts				
	addq.l #4,sp				
						
	jbra _?L56				
_?L411:						
						
	move.l a5,_g_init_chain_table_ex	
	jbra _?L126				
_?L406:						
						
	move.l #_?LC12,d0			
	jbra _?L104				
_?L408:						
						
	pea 1.w					
	pea 10.w				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,a5				
						
	tst.l d0				
	jbeq _?L112				
						
	pea 10.w				
	clr.l -(sp)				
	move.l d0,-(sp)				
	jbsr _memset				
						
	addq.l #8,sp				
	moveq #1,d1				
	move.l d1,(sp)				
	pea 31250.w				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,(a5)				
						
	jbeq _?L112				
						
	pea -380(a6)				
	pea 15625.w				
	pea 31250.w				
	move.l d0,-(sp)				
	pea -324(a6)				
	jbsr _flac_decode_resample		
	lea (20,sp),sp				
						
	tst.l d0				
	jbne _?L412				
						
	move.l -380(a6),d0			
						
	jbeq _?L413				
						
	move.w d0,4(a5)				
						
	tst.l _g_init_chain_table		
	jbeq _?L414				
_?L116:						
						
	tst.l -428(a6)				
	jbeq _?L117				
						
	move.l -428(a6),a0			
	move.l a5,6(a0)				
_?L117:						
						
	move.l a5,-428(a6)			
	jbra _?L118				
_?L414:						
						
	move.l a5,_g_init_chain_table		
	jbra _?L116				
_?L401:						
						
	pea _cp932rsc_flac_decoder_setup_error	
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
	lea _ONTIME,a3				
	move.l #_B_PRINT,d4			
	jbra _?L89				
_?L397:						
						
	pea _cp932rsc_file_open_error		
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
	lea _ONTIME,a3				
	move.l #_B_PRINT,d4			
	jbra _?L89				
_?L400:						
						
	pea _cp932rsc_mainmem_shortage		
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
	lea _ONTIME,a3				
	move.l #_B_PRINT,d4			
	jbra _?L415				
_?L394:						
						
	jbsr _pcm8pp_isavailable		
						
	tst.l d0				
	jbeq _?L74				
						
	jbsr _pcm8pp_get_frequency_mode		
						
	move.l d0,_g_original_pcm8pp_frequency_mode
						
	tst.w -430(a6)				
	jbeq _?L416				
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
						
	moveq #1,d6				
	jbra _?L77				
_?L231:						
						
	move.l #_?LC11,d0			
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	pea _?LC22				
	jbsr _printf				
						
	addq.l #8,sp				
	move.l -300(a6),(sp)			
	pea _?LC23				
	jbsr _printf				
	addq.l #8,sp				
						
	move.l #_?LC13,d0			
	moveq #1,d1				
	cmp.l -296(a6),d1			
	jbne _?L104				
	jbra _?L406				
_?L407:						
						
	move.w -402(a6),d7			
	move.w -418(a6),d3			
	swap d3					
	clr.w d3				
						
	move.l d3,d1				
	or.w #5123,d1				
	move.l d1,-384(a6)			
						
	clr.w d5				
						
	tst.w d6				
	jbeq _?L115				
_?L125:						
						
	move.l -300(a6),-392(a6)		
						
	move.l -296(a6),d0			
						
	cmp.l #22050,-392(a6)			
	jbeq _?L417				
						
	cmp.l #24000,-392(a6)			
	jbeq _?L418				
						
	cmp.l #32000,-392(a6)			
	jbeq _?L419				
						
	cmp.l #44100,-392(a6)			
	jbeq _?L420				
						
	cmp.l #48000,-392(a6)			
	jbne _?L140				
						
	cmp.w #1,d0				
	jbne _?L421				
						
	or.w #3587,d3				
	move.l d3,-400(a6)			
						
	cmp.w #1,d6				
	jbeq _?L152				
_?L148:						
						
	pea _?LC31				
	jbsr _printf				
						
	move.l #_?LC32,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a3				
	jbsr (a3)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-388(a6)			
_?L156:						
						
	jbsr (a3)				
						
	cmp.l -388(a6),d0			
	jble _?L156				
	move.w -416(a6),-402(a6)		
						
	clr.l -388(a6)				
						
	clr.w d3				
	move.l #_B_PRINT,d4			
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbne _?L422				
_?L158:						
						
	tst.w d3				
	jbne _?L168				
						
	tst.w d6				
	jbeq _?L162				
_?L163:						
						
	clr.l -(sp)				
	jbsr _pcm8pp_get_data_length		
	addq.l #4,sp				
						
	tst.l d0				
	jbeq _?L169				
						
	tst.w d5				
	jbne _?L371				
	clr.w d3				
_?L167:						
						
	pea 1.w					
	pea 12.w				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,a5				
						
	tst.l d0				
	jbeq _?L192				
						
	pea 12.w				
	clr.l -(sp)				
	move.l d0,-(sp)				
	jbsr _memset				
						
	addq.l #8,sp				
	moveq #1,d1				
	move.l d1,(sp)				
	move.l #176400,-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,(a5)				
						
	jbeq _?L192				
						
	pea -380(a6)				
	move.l #176400,-(sp)			
	move.l d0,-(sp)				
	pea -324(a6)				
	jbsr _flac_decode_full			
	lea (16,sp),sp				
						
	tst.l d0				
	jbne _?L423				
						
	move.l -380(a6),d0			
						
	jbeq _?L424				
						
	move.l d0,4(a5)				
						
	move.l -412(a6),a1			
	move.l a5,8(a1)				
						
	addq.l #1,-424(a6)			
						
	move.w -422(a6),-412(a6)		
						
	clr.l -(sp)				
	jbsr _pcm8pp_get_block_counter		
	addq.l #4,sp				
						
	move.w -422(a6),d5			
	sub.w -386(a6),d5			
	sub.w d0,d5				
						
	cmp.w -402(a6),d5			
	jblt _?L196				
						
	tst.w -408(a6)				
	jbeq _?L197				
						
	move.w -402(a6),d5			
_?L198:						
						
	clr.l -(sp)				
	jbsr _pcm8pp_get_data_length		
	addq.l #4,sp				
						
	tst.l d0				
	jbeq _?L425				
_?L204:						
	move.w d5,-402(a6)			
	move.l a5,-412(a6)			
	clr.w d5				
_?L441:						
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L158				
	jbra _?L422				
_?L413:						
						
	move.w -402(a6),d7			
	pea 1.w					
	move.l (a5),-(sp)			
	lea _himem_free,a3			
	jbsr (a3)				
	addq.l #8,sp				
						
	pea 1.w					
	move.l a5,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	move.w -418(a6),d3			
	swap d3					
	clr.w d3				
						
	move.l d3,d1				
	or.w #5123,d1				
	move.l d1,-384(a6)			
						
	moveq #1,d5				
_?L115:						
						
	pea 1.w					
	jbsr _pcm8a_set_polyphonic_mode		
						
	move.l _g_init_chain_table,(sp)		
	move.l -384(a6),-(sp)			
	clr.l -(sp)				
	jbsr _pcm8a_play_linked_array_chain	
	lea (12,sp),sp				
	jbra _?L125				
_?L422:						
						
	jbsr _B_KEYINP				
						
	asr.l #8,d0				
						
	move.w d0,d1				
						
	and.w #-17,d0				
	cmp.w #1,d0				
	jbeq _?L426				
						
	cmp.w #53,d1				
	jbne _?L158				
						
	tst.w d3				
	jbeq _?L160				
						
	tst.w d6				
	jbne _?L161				
						
	jbsr _pcm8a_resume			
_?L162:						
						
	clr.l -(sp)				
	jbsr _pcm8a_get_data_length		
	addq.l #4,sp				
						
	tst.l d0				
	jbne _?L427				
_?L169:						
						
	tst.w d5				
	jbne _?L428				
						
	pea _cp932rsc_buffer_underrun		
	pea _?LC35				
	jbsr _printf				
	addq.l #8,sp				
	clr.w d3				
_?L172:						
						
	tst.w d6				
	jbne _?L167				
_?L165:						
						
	pea 1.w					
	pea 10.w				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,a5				
						
	tst.l d0				
	jbeq _?L175				
						
	pea 10.w				
	clr.l -(sp)				
	move.l d0,-(sp)				
	jbsr _memset				
						
	addq.l #8,sp				
	moveq #1,d2				
	move.l d2,(sp)				
	pea 31250.w				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,(a5)				
						
	jbeq _?L175				
						
	pea -380(a6)				
	pea 15625.w				
	pea 31250.w				
	move.l d0,-(sp)				
	pea -324(a6)				
	jbsr _flac_decode_resample		
	lea (20,sp),sp				
	move.l d0,d5				
						
	jbne _?L429				
						
	move.l -380(a6),d0			
						
	jbne _?L177				
						
	pea 1.w					
	move.l (a5),-(sp)			
	move.l #_himem_free,d5			
	move.l d5,a1				
	jbsr (a1)				
	addq.l #8,sp				
						
	pea 1.w					
	move.l a5,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.w -408(a6)				
	jbeq _?L430				
_?L195:						
						
	moveq #1,d5				
_?L431:						
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L158				
	jbra _?L422				
_?L427:						
						
	tst.w d5				
	jbne _?L371				
	clr.w d3				
	jbra _?L165				
_?L430:						
						
	pea _?LC36				
	move.l d4,a1				
	jbsr (a1)				
	addq.l #4,sp				
						
	moveq #1,d5				
	jbra _?L431				
_?L425:						
						
	clr.l -(sp)				
	move.l d0,-438(a6)			
	jbsr _pcm8pp_get_block_counter		
	addq.l #4,sp				
						
	move.l -388(a6),d2			
	add.l d0,d2				
						
	move.l -424(a6),a0			
	sub.l d2,a0				
						
	move.l -438(a6),d1			
	moveq #6,d0				
	cmp.l a0,d0				
	jbge _?L204				
						
	move.l _g_init_chain_table_ex,a1	
_?L205:						
						
	cmp.l d1,d2				
	jble _?L432				
						
	move.l 8(a1),a1				
						
	tst.l a1				
	jbeq _?L204				
						
	addq.l #1,d1				
	jbra _?L205				
_?L197:						
						
	pea _?LC37				
	move.l d4,a0				
	jbsr (a0)				
	addq.l #4,sp				
						
	move.w -402(a6),d5			
	jbra _?L198				
_?L421:						
						
	cmp.w #2,d0				
	jbne _?L140				
						
	or.w #7683,d3				
	move.l d3,-400(a6)			
						
	cmp.w #1,d6				
	jbne _?L148				
_?L152:						
						
	jbsr _pcm8pp_get_frequency_mode		
						
	subq.l #2,d0				
	jbeq _?L149				
						
	pea 2.w					
	jbsr _pcm8pp_set_frequency_mode		
	addq.l #4,sp				
_?L149:						
						
	move.l _g_init_chain_table_ex,-(sp)	
						
	move.l -392(a6),d0			
	lsl.l #8,d0				
						
	move.l d0,-(sp)				
	pea 1.w					
	move.l -400(a6),-(sp)			
	clr.l -(sp)				
	jbsr _pcm8pp_play_ex_linked_array_chain	
	lea (20,sp),sp				
_?L434:						
						
	pea _?LC31				
	jbsr _printf				
						
	move.l #_?LC32,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a3				
	jbsr (a3)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-388(a6)			
	jbra _?L156				
_?L168:						
						
	tst.w d5				
	jbeq _?L172				
_?L166:						
						
	moveq #1,d3				
	moveq #1,d5				
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L158				
	jbra _?L422				
_?L371:						
						
	clr.w d3				
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L158				
	jbra _?L422				
_?L177:						
						
	move.w d0,4(a5)				
						
	move.l -428(a6),a0			
	move.l a5,6(a0)				
						
	addq.l #1,-424(a6)			
						
	clr.l -(sp)				
	jbsr _pcm8a_get_access_address		
	addq.l #4,sp				
						
	move.l _g_init_chain_table,a0		
_?L179:						
						
	tst.l a0				
	jbeq _?L181				
						
	move.l (a0),a1				
						
	cmp.l a1,d0				
	jbcs _?L180				
						
	clr.l d1				
	move.w 4(a0),d1				
	add.l d1,d1				
						
	add.l a1,d1				
						
	cmp.l d0,d1				
	jbhi _?L181				
_?L180:						
						
	addq.l #1,d5				
						
	move.l 6(a0),a0				
	jbra _?L179				
_?L181:						
						
	move.w -422(a6),a1			
	sub.w d5,a1				
	move.w a1,-428(a6)			
						
	move.w a1,d1				
	cmp.w -402(a6),d1			
	jblt _?L183				
						
	tst.w -408(a6)				
	jbeq _?L433				
_?L185:						
						
	clr.l -(sp)				
	move.l a0,-438(a6)			
	jbsr _pcm8a_get_data_length		
	addq.l #4,sp				
						
	move.l -438(a6),a0			
	tst.l d0				
	jbne _?L189				
						
	move.l -424(a6),d0			
	sub.l d5,d0				
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbge _?L189				
						
	tst.l a0				
	jbeq _?L189				
						
	move.l a0,-(sp)				
	move.l -384(a6),-(sp)			
	clr.l -(sp)				
	jbsr _pcm8a_play_linked_array_chain	
	lea (12,sp),sp				
						
	move.w -428(a6),-402(a6)		
_?L189:						
	move.l a5,-428(a6)			
	clr.w d5				
						
	jbsr _B_KEYSNS				
						
	tst.l d0				
	jbeq _?L158				
	jbra _?L422				
_?L433:						
						
	pea _?LC37				
	move.l a0,-438(a6)			
	move.l d4,a1				
	jbsr (a1)				
	addq.l #4,sp				
	move.l -438(a6),a0			
	jbra _?L185				
_?L160:						
						
	tst.w d6				
	jbne _?L164				
						
	jbsr _pcm8a_pause			
						
	tst.w d5				
	jbne _?L166				
						
	moveq #1,d3				
	jbra _?L165				
_?L183:						
						
	tst.w -408(a6)				
	jbeq _?L187				
						
	move.w -428(a6),-402(a6)		
	jbra _?L185				
_?L187:						
						
	pea _?LC38				
	move.l a0,-438(a6)			
	move.l d4,a1				
	jbsr (a1)				
	addq.l #4,sp				
	move.l -438(a6),a0			
						
	move.w -428(a6),-402(a6)		
	jbra _?L185				
_?L161:						
						
	jbsr _pcm8pp_resume			
	jbra _?L163				
_?L164:						
						
	jbsr _pcm8pp_pause			
						
	tst.w d5				
	jbne _?L166				
						
	move.w d6,d3				
	jbra _?L167				
_?L196:						
						
	tst.w -408(a6)				
	jbne _?L198				
						
	pea _?LC38				
	move.l d4,a1				
	jbsr (a1)				
	addq.l #4,sp				
						
	clr.l -(sp)				
	jbsr _pcm8pp_get_data_length		
	addq.l #4,sp				
						
	tst.l d0				
	jbne _?L204				
	jbra _?L425				
_?L424:						
						
	pea 1.w					
	move.l (a5),-(sp)			
	move.l #_himem_free,d5			
	move.l d5,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	pea 1.w					
	move.l a5,-(sp)				
	move.l d5,a1				
	jbsr (a1)				
	addq.l #8,sp				
						
	tst.w -408(a6)				
	jbne _?L195				
						
	pea _?LC36				
	move.l d4,a0				
	jbsr (a0)				
	addq.l #4,sp				
						
	moveq #1,d5				
	jbra _?L431				
_?L78:						
						
	pea _?LC0				
	jbsr _puts				
	addq.l #4,sp				
						
	jbsr _pcm8a_pause			
						
	jbsr _pcm8a_stop			
						
	jbsr _C_CUROFF				
	clr.w d6				
	move.w #1,-412(a6)			
	clr.l -424(a6)				
	moveq #1,d1				
	move.l d1,-434(a6)			
						
	move.w -416(a6),a0			
	move.l a0,-396(a6)			
						
	move.l a5,-406(a6)			
	move.w -428(a6),d7			
	jbra _?L223				
_?L391:						
						
	jbsr _show_help_message			
						
	moveq #1,d1				
	move.l d1,-434(a6)			
						
	jbsr _C_CURON				
						
	move.l _g_funckey_mode,d0		
						
	jbmi _?L225				
	jbra _?L389				
_?L426:						
						
	pea _?LC33				
	move.l d4,a1				
	jbsr (a1)				
	addq.l #4,sp				
						
	clr.l d3				
						
	clr.w -412(a6)				
						
	moveq #1,d1				
	move.l d1,-434(a6)			
						
	tst.w d6				
	jbne _?L128				
	jbra _?L119				
_?L416:						
						
	pea _?LC0				
	jbsr _puts				
	addq.l #4,sp				
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
						
	jbsr _C_CUROFF				
	moveq #1,d6				
	move.w #1,-412(a6)			
	clr.l -424(a6)				
	moveq #1,d1				
	move.l d1,-434(a6)			
						
	move.w -416(a6),a0			
	move.l a0,-396(a6)			
						
	move.l a5,-406(a6)			
	move.w -428(a6),d7			
	jbra _?L223				
_?L122:						
						
	move.w -402(a6),d7			
	pea _cp932rsc_himem_shortage		
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -412(a6)				
	lea _ONTIME,a3				
	move.l #_B_PRINT,d4			
_?L438:						
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
	jbra _?L207				
_?L74:						
						
	pea _cp932rsc_pcm8_not_available	
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	moveq #1,d1				
	move.l d1,-434(a6)			
	jbra _?L56				
_?L140:						
						
	or.w #7427,d3				
	move.l d3,-400(a6)			
						
	cmp.w #1,d6				
	jbne _?L148				
_?L151:						
						
	jbsr _pcm8pp_get_frequency_mode		
						
	subq.l #1,d0				
	jbeq _?L149				
						
	pea 1.w					
	jbsr _pcm8pp_set_frequency_mode		
	addq.l #4,sp				
						
	move.l _g_init_chain_table_ex,-(sp)	
						
	move.l -392(a6),d0			
	lsl.l #8,d0				
						
	move.l d0,-(sp)				
	pea 1.w					
	move.l -400(a6),-(sp)			
	clr.l -(sp)				
	jbsr _pcm8pp_play_ex_linked_array_chain	
	lea (20,sp),sp				
	jbra _?L434				
_?L417:						
						
	cmp.w #1,d0				
	jbeq _?L435				
						
	cmp.w #2,d0				
	jbne _?L140				
						
	or.w #6659,d3				
	move.l d3,-400(a6)			
						
	cmp.w #1,d6				
	jbeq _?L149				
						
	pea _?LC31				
	jbsr _printf				
						
	move.l #_?LC32,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a3				
	jbsr (a3)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-388(a6)			
	jbra _?L156				
_?L418:						
						
	cmp.w #1,d0				
	jbne _?L436				
						
	or.w #2819,d3				
	move.l d3,-400(a6)			
						
	cmp.w #1,d6				
	jbeq _?L149				
						
	pea _?LC31				
	jbsr _printf				
						
	move.l #_?LC32,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a3				
	jbsr (a3)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-388(a6)			
	jbra _?L156				
_?L175:						
						
	pea _cp932rsc_himem_shortage		
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -412(a6)				
_?L440:						
						
	jbsr _pcm8a_pause			
						
	jbsr _pcm8a_stop			
	jbra _?L437				
_?L412:						
						
	move.w -402(a6),d7			
	pea _cp932rsc_flac_decode_error		
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.w -412(a6)				
						
	clr.l d3				
	lea _ONTIME,a3				
	move.l #_B_PRINT,d4			
	jbra _?L119				
_?L409:						
						
	move.w -402(a6),d7			
	pea _cp932rsc_flac_decode_error		
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -412(a6)				
	lea _ONTIME,a3				
	move.l #_B_PRINT,d4			
	jbra _?L438				
_?L410:						
						
	move.w -402(a6),d7			
	pea 1.w					
	move.l (a5),-(sp)			
	lea _himem_free,a3			
	jbsr (a3)				
	addq.l #8,sp				
						
	pea 1.w					
	move.l a5,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	move.w -418(a6),d3			
	swap d3					
	clr.w d3				
						
	move.l d3,d1				
	or.w #5123,d1				
	move.l d1,-384(a6)			
						
	move.w d6,d5				
	jbra _?L125				
_?L419:						
						
	cmp.w #1,d0				
	jbne _?L439				
						
	or.w #3075,d3				
	move.l d3,-400(a6)			
						
	cmp.w #1,d6				
	jbeq _?L149				
						
	pea _?LC31				
	jbsr _printf				
						
	move.l #_?LC32,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a3				
	jbsr (a3)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-388(a6)			
	jbra _?L156				
_?L435:						
						
	or.w #2563,d3				
	move.l d3,-400(a6)			
						
	cmp.w #1,d6				
	jbeq _?L149				
						
	pea _?LC31				
	jbsr _printf				
						
	move.l #_?LC32,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a3				
	jbsr (a3)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-388(a6)			
	jbra _?L156				
_?L436:						
						
	cmp.w #2,d0				
	jbne _?L140				
						
	or.w #6915,d3				
	move.l d3,-400(a6)			
						
	cmp.w #1,d6				
	jbeq _?L149				
						
	pea _?LC31				
	jbsr _printf				
						
	move.l #_?LC32,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a3				
	jbsr (a3)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-388(a6)			
	jbra _?L156				
_?L420:						
						
	cmp.w #1,d0				
	jbne _?L140				
						
	or.w #3331,d3				
	move.l d3,-400(a6)			
						
	cmp.w #1,d6				
	jbeq _?L151				
						
	pea _?LC31				
	jbsr _printf				
						
	move.l #_?LC32,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a3				
	jbsr (a3)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-388(a6)			
	jbra _?L156				
_?L429:						
						
	pea _cp932rsc_flac_decode_error		
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -412(a6)				
	jbra _?L440				
_?L428:						
						
	pea _?LC34				
	move.l d4,a0				
	jbsr (a0)				
	addq.l #4,sp				
						
	clr.l -434(a6)				
						
	clr.l d3				
						
	clr.w -412(a6)				
						
	tst.w d6				
	jbne _?L128				
	jbra _?L119				
_?L432:						
						
	tst.l a1				
	jbeq _?L204				
						
	move.l a1,-(sp)				
						
	move.l -392(a6),d0			
	lsl.l #8,d0				
						
	move.l d0,-(sp)				
	pea 1.w					
	move.l -400(a6),-(sp)			
	clr.l -(sp)				
	move.l d2,-438(a6)			
	jbsr _pcm8pp_play_ex_linked_array_chain	
						
	lea (16,sp),sp				
	clr.l (sp)				
	jbsr _pcm8pp_get_block_counter		
	addq.l #4,sp				
						
	move.l -438(a6),d2			
	move.w -412(a6),d1			
	sub.w d2,d1				
	move.w d1,d5				
	sub.w d0,d5				
						
	move.l d2,-388(a6)			
	move.w d5,-402(a6)			
	move.l a5,-412(a6)			
	clr.w d5				
	jbra _?L441				
_?L192:						
						
	pea _cp932rsc_himem_shortage		
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -412(a6)				
_?L442:						
						
	jbsr _pcm8pp_pause			
						
	jbsr _pcm8pp_stop			
	jbra _?L207				
_?L439:						
						
	cmp.w #2,d0				
	jbne _?L140				
						
	or.w #7171,d3				
	move.l d3,-400(a6)			
						
	cmp.w #1,d6				
	jbeq _?L149				
						
	pea _?LC31				
	jbsr _printf				
						
	move.l #_?LC32,(sp)			
	jbsr _puts				
	addq.l #4,sp				
						
	lea _ONTIME,a3				
	jbsr (a3)				
	move.w #19,a0				
	add.l d0,a0				
	move.l a0,-388(a6)			
	jbra _?L156				
_?L423:						
						
	pea _cp932rsc_flac_decode_error		
	pea -256(a6)				
	jbsr _strcpy				
	addq.l #8,sp				
						
	clr.l d3				
						
	clr.w -412(a6)				
	jbra _?L442				
						
						
	.align 2	* workaround for 3 args .comm directive.
	.comm	_fread_staging_buffer,4		
						
	.align 2	* workaround for 3 args .comm directive.
	.comm	_fread_buffer,4			
						
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
						
