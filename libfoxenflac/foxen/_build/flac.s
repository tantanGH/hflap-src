* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"flac.c"			
						
						
						
						
						
	.text					
	.data					
_?LC0:						
	.dc.b $66,$6c,$61,$63,$2e,$63
	.dc.b $00				
_?LC1:						
	.dc.b $28,$28,$28,$75,$69,$6e,$74,$70
	.dc.b $74,$72,$5f,$74,$29,$6d,$65,$6d
	.dc.b $29,$20,$26,$20,$28,$46,$58,$5f
	.dc.b $41,$4c,$49,$47,$4e,$20,$2d,$20
	.dc.b $31,$29,$29,$20,$3d,$3d,$20,$30
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
						
_fx_mem_zero_aligned?part?0:			
						
	pea 457.w				
	pea _?LC0				
	pea _?LC1				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.align	2				
	.globl	_fx_flac_size			
						
_fx_flac_size:					
	movem.l d3/d4/d5,-(sp)			
	move.l 16(sp),d0			
	move.l 20(sp),d3			
	move.b d3,d4				
						
	tst.w d0				
	jbne _?L4				
						
	tst.b d3				
	jbeq _?L12				
						
	clr.b d3				
						
	lsl.l #2,d0				
	move.w #15,a0				
	add.l d0,a0				
	move.l #400,d0				
						
	clr.b d1				
_?L8:						
						
	tst.b d3				
	jbeq _?L7				
						
	move.l d0,d2				
	add.l a0,d2				
						
	moveq #-16,d5				
	and.l d5,d2				
						
	cmp.l d0,d2				
	jbcs _?L19				
						
	move.l d2,d0				
_?L7:						
						
	addq.b #1,d1				
						
	cmp.b d4,d1				
	jbcs _?L8				
_?L21:						
						
	tst.b d3				
	jbeq _?L12				
						
	movem.l (sp)+,d3/d4/d5			
	rts					
_?L4:						
						
	tst.b d3				
	jbne _?L20				
_?L12:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5			
	rts					
_?L20:						
						
	cmp.b #8,d3				
	sls d3					
	neg.b d3				
						
	lsl.l #2,d0				
	move.w #15,a0				
	add.l d0,a0				
	move.l #400,d0				
						
	clr.b d1				
	jbra _?L8				
_?L19:						
						
	clr.b d3				
						
	addq.b #1,d1				
						
	cmp.b d4,d1				
	jbcs _?L8				
	jbra _?L21				
						
	.align	2				
	.globl	_fx_flac_reset			
						
_fx_flac_reset:					
						
	moveq #15,d0				
	add.l 4(sp),d0				
	moveq #-16,d1				
	and.l d0,d1				
	move.l d1,a0				
						
	clr.l (a0)				
	clr.l 4(a0)				
						
	move.b #64,16(a0)			
						
	clr.l 8(a0)				
						
	clr.l 12(a0)				
						
	move.l 48(a0),a1			
						
	move.l a1,d0				
	bftst d0{#28:#4}			
	jbne _?L24				
						
	clr.l (a1)				
	clr.l 4(a1)				
						
	clr.l 8(a1)				
	clr.l 12(a1)				
						
	moveq #127,d1				
	move.l d1,2(a1)				
						
	move.l 52(a0),a1			
						
	move.l a1,d0				
	bftst d0{#28:#4}			
	jbne _?L24				
						
	clr.l (a1)				
	clr.l 4(a1)				
						
	clr.l 8(a1)				
	clr.l 12(a1)				
						
	clr.l 16(a1)				
	clr.l 20(a1)				
						
	clr.l 24(a1)				
	clr.l 28(a1)				
						
	clr.l 32(a1)				
	clr.l 36(a1)				
						
	clr.l 40(a1)				
	clr.l 44(a1)				
						
	move.l 56(a0),a1			
						
	move.l a1,d1				
	bftst d1{#28:#4}			
	jbne _?L24				
						
	clr.l (a1)				
	clr.l 4(a1)				
						
	clr.l 8(a1)				
	clr.l 12(a1)				
						
	clr.l 16(a1)				
	clr.l 20(a1)				
						
	clr.l 24(a1)				
	clr.l 28(a1)				
						
	clr.l 32(a1)				
	clr.l 36(a1)				
						
	clr.l 40(a1)				
	clr.l 44(a1)				
						
	move.l 60(a0),a1			
						
	move.l a1,d0				
	bftst d0{#28:#4}			
	jbne _?L24				
						
	clr.l (a1)				
	clr.l 4(a1)				
						
	clr.l 8(a1)				
	clr.l 12(a1)				
						
	clr.l 16(a1)				
	clr.l 20(a1)				
						
	clr.l 24(a1)				
	clr.l 28(a1)				
						
	clr.l 18(a0)				
						
	clr.l 22(a0)				
						
	clr.l 26(a0)				
						
	clr.b 44(a0)				
						
	clr.b 33(a0)				
						
	clr.w 34(a0)				
						
	clr.l 36(a0)				
						
	clr.b 40(a0)				
						
	clr.w 42(a0)				
						
	rts					
_?L24:						
	jbsr (_fx_mem_zero_aligned?part?0)	
						
	.align	2				
	.globl	_fx_flac_init			
						
_fx_flac_init:					
	movem.l d3/d4/a3,-(sp)			
	move.l 16(sp),a3			
	move.l 20(sp),d1			
	move.l 24(sp),d2			
						
	tst.w d1				
	jbeq _?L31				
						
	move.b d2,d3				
	subq.b #1,d3				
	cmp.b #7,d3				
	jbhi _?L31				
						
	tst.l a3				
	jbeq _?L28				
						
	lea (15,a3),a0				
	move.l a0,d3				
	moveq #-16,d4				
	and.l d4,d3				
	move.l d3,a0				
						
	move.w d1,30(a0)			
						
	move.b d2,32(a0)			
						
	lea (112,a0),a2				
						
	move.l a2,48(a0)			
						
	lea (16,a2),a2				
						
	move.l a2,52(a0)			
						
	lea (48,a2),a2				
						
	move.l a2,56(a0)			
						
	lea (48,a2),a2				
						
	move.l a2,60(a0)			
						
	lea (32,a2),a2				
						
	move.l a2,64(a0)			
						
	clr.l 72(a0)				
	clr.l 76(a0)				
	clr.l 80(a0)				
	clr.l 84(a0)				
	clr.l 88(a0)				
	clr.l 92(a0)				
	clr.l 96(a0)				
						
	lea (128,a2),a2				
						
	and.l #65535,d1				
	lsl.l #2,d1				
	move.w #15,a1				
	add.l d1,a1				
						
	move.l a2,68(a0)			
						
	cmp.b #1,d2				
	jbeq _?L29				
						
	move.l a2,d1				
	add.l a1,d1				
	and.l d4,d1				
						
	move.l d1,72(a0)			
						
	cmp.b #2,d2				
	jbeq _?L29				
						
	add.l a1,d1				
	and.l d4,d1				
						
	move.l d1,76(a0)			
						
	cmp.b #3,d2				
	jbeq _?L29				
						
	add.l a1,d1				
	and.l d4,d1				
						
	move.l d1,80(a0)			
						
	cmp.b #4,d2				
	jbeq _?L29				
						
	add.l a1,d1				
	and.l d4,d1				
						
	move.l d1,84(a0)			
						
	cmp.b #5,d2				
	jbeq _?L29				
						
	add.l a1,d1				
	and.l d4,d1				
						
	move.l d1,88(a0)			
						
	cmp.b #6,d2				
	jbeq _?L29				
						
	add.l a1,d1				
	and.l d4,d1				
						
	move.l d1,92(a0)			
						
	cmp.b #8,d2				
	jbne _?L29				
						
	add.l a1,d1				
	moveq #-16,d0				
	and.l d1,d0				
	move.l d0,96(a0)			
_?L29:						
						
	move.l a0,-(sp)				
	jbsr _fx_flac_reset			
	addq.l #4,sp				
_?L28:						
						
	move.l a3,d0				
	movem.l (sp)+,d3/d4/a3			
	rts					
_?L31:						
						
	sub.l a3,a3				
						
	move.l a3,d0				
	movem.l (sp)+,d3/d4/a3			
	rts					
						
	.align	2				
	.globl	_fx_flac_get_state		
						
_fx_flac_get_state:				
						
	moveq #15,d0				
	add.l 4(sp),d0				
	moveq #-16,d1				
	and.l d1,d0				
						
	move.l d0,a0				
	move.l 18(a0),d0			
	rts					
						
	.align	2				
	.globl	_fx_flac_get_streaminfo		
						
_fx_flac_get_streaminfo:			
	move.l 8(sp),a0				
						
	moveq #15,d1				
	add.l 4(sp),d1				
	moveq #-16,d0				
	and.l d0,d1				
						
	moveq #7,d0				
	cmp.l a0,d0				
	jbcs _?L58				
	move.l a0,d0				
	add.l d0,d0				
	move.w _?L61(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L61:						
	.dc.w _?L59-_?L61			
	.dc.w _?L67-_?L61			
	.dc.w _?L66-_?L61			
	.dc.w _?L65-_?L61			
	.dc.w _?L64-_?L61			
	.dc.w _?L63-_?L61			
	.dc.w _?L62-_?L61			
	.dc.w _?L60-_?L61			
_?L58:						
	lea (-128,a0),a0			
	moveq #15,d0				
	cmp.l a0,d0				
	jbcs _?L74				
						
	move.l d1,a2				
	move.l 52(a2),a1			
	clr.l d1				
	move.b 26(a1,a0.l),d1			
	clr.l d0				
						
	rts					
_?L74:						
						
	move.l #2147483647,d0			
	moveq #-1,d1				
						
	rts					
_?L62:						
						
	move.l d1,a1				
	move.l 52(a1),a0			
	clr.l d1				
	move.b 17(a0),d1			
	clr.l d0				
						
	rts					
_?L60:						
						
	move.l d1,a2				
	move.l 52(a2),a0			
	move.l 18(a0),d0			
	move.l 22(a0),d1			
						
	rts					
_?L67:						
						
	move.l d1,a2				
	move.l 52(a2),a0			
	clr.l d1				
	move.w 2(a0),d1				
	clr.l d0				
						
	rts					
_?L66:						
						
	move.l d1,a1				
	move.l 52(a1),a0			
	move.l 4(a0),d1				
	clr.l d0				
						
	rts					
_?L65:						
						
	move.l d1,a2				
	move.l 52(a2),a0			
	move.l 8(a0),d1				
	clr.l d0				
						
	rts					
_?L64:						
						
	move.l d1,a1				
	move.l 52(a1),a0			
	move.l 12(a0),d1			
	clr.l d0				
						
	rts					
_?L63:						
						
	move.l d1,a2				
	move.l 52(a2),a0			
	clr.l d1				
	move.b 16(a0),d1			
	clr.l d0				
						
	rts					
_?L59:						
						
	move.l d1,a1				
	move.l 52(a1),a0			
	clr.l d1				
	move.w (a0),d1				
	clr.l d0				
						
	rts					
						
	.data					
_?LC3:						
	.dc.b $28,$6e,$5f,$62,$69,$74,$73,$20
	.dc.b $3e,$3d,$20,$31,$55,$29,$20,$26
	.dc.b $26,$20,$28,$6e,$5f,$62,$69,$74
	.dc.b $73,$20,$3c,$3d,$20,$28,$42,$55
	.dc.b $46,$53,$49,$5a,$45,$20,$2d,$20
	.dc.b $37,$55,$29,$29
	.dc.b $00				
	.globl	___ashldi3			
	.text					
	.align	2				
	.globl	_fx_flac_process		
						
_fx_flac_process:				
	lea (-976,sp),sp			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
						
	moveq #15,d0				
	add.l 1016(sp),d0			
	moveq #-16,d1				
	and.l d0,d1				
	move.l d1,a4				
						
	move.l 1024(sp),a0			
	move.l (a0),a1				
						
	move.l 1020(sp),8(a4)			
						
	add.l 1020(sp),a1			
						
	move.l a1,12(a4)			
						
	move.b 16(a4),d2			
						
	move.l 1020(sp),a0			
	cmp.b #7,d2				
	jbls _?L78				
_?L76:						
	cmp.l a1,a0				
	jbeq _?L78				
						
	move.l (a4),d0				
	move.l 4(a4),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	clr.l d3				
	move.b -1(a0),d3			
						
	clr.l d4				
	or.l d0,d4				
	move.l d4,(a4)				
	or.l d1,d3				
	move.l d3,4(a4)				
						
	subq.b #8,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbhi _?L76				
_?L78:						
						
	move.l 18(a4),a2			
	move.l a2,a6				
						
	clr.l 44(sp)				
	move.l a2,d3				
_?L77:						
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbeq _?L814				
_?L724:						
						
	cmp.l d3,a6				
	jbeq _?L81				
						
	moveq #-5,d0				
	and.l d3,d0				
	moveq #2,d6				
	move.l d3,a6				
	cmp.l d0,d6				
	jbeq _?L80				
_?L81:						
						
	moveq #6,d7				
	cmp.l d3,d7				
	jbcs _?L82				
	move.l d3,d0				
	add.l d0,d0				
	move.w _?L84(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L84:						
	.dc.w _?L760-_?L84			
	.dc.w _?L88-_?L84			
	.dc.w _?L83-_?L84			
	.dc.w _?L87-_?L84			
	.dc.w _?L86-_?L84			
	.dc.w _?L85-_?L84			
	.dc.w _?L83-_?L84			
_?L83:						
						
	moveq #3,d1				
	move.l d1,18(a4)			
						
	move.l #300,22(a4)			
	move.w #3,a6				
_?L87:						
	move.l 56(a4),a5			
	move.l 52(a4),a2			
						
	move.l 22(a4),d0			
						
	cmp.l #401,d0				
	jbeq _?L211				
_?L851:						
	cmp.l #401,d0				
	jbls _?L838				
	cmp.l #402,d0				
	jbeq _?L216				
	cmp.l #403,d0				
	jbne _?L816				
						
	move.b 16(a4),d0			
						
	cmp.b #56,d0				
	jbhi _?L839				
						
	move.l (a4),d2				
	move.l 4(a4),d3				
						
	clr.l d1				
	move.b d0,d1				
						
	move.w #-32,a0				
	add.l d1,a0				
	tst.l a0				
	jblt _?L337				
	move.l d3,d4				
	move.l a0,d5				
	lsl.l d5,d4				
	move.l d4,140(sp)			
	clr.l 144(sp)				
_?L338:						
						
	move.b d0,d1				
	addq.b #8,d1				
	move.b d1,16(a4)			
						
	move.l 12(a4),d1			
						
	move.l 8(a4),a0				
						
	cmp.l d1,a0				
	jbeq _?L339				
						
	lea (1,a0),a1				
	move.l a1,8(a4)				
						
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,148(sp)			
	move.l d3,d4				
	or.b (a0),d4				
	move.l d4,152(sp)			
						
	move.l 148(sp),(a4)			
	move.l 152(sp),4(a4)			
						
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L339				
	cmp.l d1,a1				
	jbeq _?L339				
						
	lea (2,a0),a1				
	move.l a1,8(a4)				
						
	move.l 148(sp),d2			
	move.l 152(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,160(sp)			
	move.l d3,d5				
	or.b 1(a0),d5				
	move.l d5,164(sp)			
						
	move.l 160(sp),(a4)			
	move.l 164(sp),4(a4)			
						
	move.b d0,d2				
	subq.b #8,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L339				
	cmp.l d1,a1				
	jbeq _?L339				
						
	lea (3,a0),a1				
	move.l a1,8(a4)				
						
	move.l 160(sp),d2			
	move.l 164(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,176(sp)			
	move.l d3,d6				
	or.b 2(a0),d6				
	move.l d6,180(sp)			
						
	move.l 176(sp),(a4)			
	move.l 180(sp),4(a4)			
						
	move.b d0,d2				
	add.b #-16,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L339				
	cmp.l d1,a1				
	jbeq _?L339				
						
	lea (4,a0),a1				
	move.l a1,8(a4)				
						
	move.l 176(sp),d2			
	move.l 180(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,200(sp)			
	move.l d3,d7				
	or.b 3(a0),d7				
	move.l d7,204(sp)			
						
	move.l 200(sp),(a4)			
	move.l 204(sp),4(a4)			
						
	move.b d0,d2				
	add.b #-24,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L339				
	cmp.l d1,a1				
	jbeq _?L339				
						
	lea (5,a0),a1				
	move.l a1,8(a4)				
						
	move.l 200(sp),d2			
	move.l 204(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,208(sp)			
	move.l d3,d4				
	or.b 4(a0),d4				
	move.l d4,212(sp)			
						
	move.l 208(sp),(a4)			
	move.l 212(sp),4(a4)			
						
	move.b d0,d2				
	add.b #-32,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L339				
	cmp.l d1,a1				
	jbeq _?L339				
						
	lea (6,a0),a1				
	move.l a1,8(a4)				
						
	move.l 208(sp),d2			
	move.l 212(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,224(sp)			
	move.l d3,d5				
	or.b 5(a0),d5				
	move.l d5,228(sp)			
						
	move.l 224(sp),(a4)			
	move.l 228(sp),4(a4)			
						
	move.b d0,d2				
	add.b #-40,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L339				
	cmp.l d1,a1				
	jbeq _?L339				
						
	lea (7,a0),a1				
	move.l a1,8(a4)				
						
	move.l 224(sp),d2			
	move.l 228(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,284(sp)			
	move.l d3,d6				
	or.b 6(a0),d6				
	move.l d6,288(sp)			
						
	move.l 284(sp),(a4)			
	move.l 288(sp),4(a4)			
						
	add.b #-48,d0				
	move.b d0,16(a4)			
						
	cmp.b #8,d0				
	jbne _?L339				
	cmp.l d1,a1				
	jbeq _?L339				
						
	lea (8,a0),a1				
	move.l a1,8(a4)				
						
	clr.l d2				
	move.b 7(a0),d2				
						
	move.l 284(sp),d0			
	move.l 288(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	clr.l d3				
	or.l d0,d3				
	move.l d3,(a4)				
	or.l d1,d2				
	move.l d2,4(a4)				
						
	clr.b 16(a4)				
_?L339:						
						
	move.l 140(sp),d0			
	move.l 144(sp),d1			
	moveq #24,d1				
	lsr.l d1,d0				
						
	move.b d0,38(a5)			
						
	clr.l d0				
	move.w 30(a4),d0			
						
	cmp.l 20(a5),d0				
	jbcs _?L818				
						
	move.b 28(a5),d4			
	cmp.b 32(a4),d4				
	jbhi _?L818				
						
	moveq #4,d5				
	move.l d5,18(a4)			
						
	move.l #500,22(a4)			
						
	clr.b 40(a4)				
	moveq #4,d3				
	jbra _?L724				
_?L564:						
						
	clr.b 40(a4)				
						
	addq.w #1,d5				
	move.w d5,42(a4)			
						
	cmp.l a0,d4				
	jbeq _?L840				
	clr.b d0				
	clr.l d2				
	move.w d5,d2				
_?L565:						
	clr.l d1				
	move.b d0,d1				
_?L567:						
						
	move.l d2,d6				
						
	move.l 68(a4,d1.l*4),a1			
						
	move.l d2,d1				
	lsl.l #2,d1				
	move.l (a1,d1.l),(a0)+			
						
	addq.b #1,d0				
						
	cmp.b d7,d0				
	jbeq _?L564				
						
	move.b d0,40(a4)			
						
	cmp.l a0,d4				
	jbne _?L565				
						
	move.l 20(a5),a1			
_?L563:						
						
	cmp.l d6,a1				
	jbeq _?L841				
_?L814:						
	move.l d3,a6				
_?L80:						
						
	tst.l 1032(sp)				
	jbeq _?L568				
						
	move.l 1032(sp),a0			
	move.l 44(sp),(a0)			
_?L568:						
						
	move.l 8(a4),d0				
	sub.l 1020(sp),d0			
	move.l 1024(sp),a0			
	move.l d0,(a0)				
						
	move.l a6,d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (976,sp),sp				
	rts					
_?L88:						
						
	move.l 22(a4),d0			
						
	cmp.l #201,d0				
	jbeq _?L842				
	cmp.l #202,d0				
	jbeq _?L110				
	cmp.l #200,d0				
	jbeq _?L843				
_?L348:						
						
	moveq #-1,d0				
	move.l d0,18(a4)			
	move.w #-1,a6				
	jbra _?L80				
_?L86:						
						
	move.l 56(a4),a5			
						
	move.l 60(a4),a1			
						
	move.b 40(a4),d1			
						
	moveq #7,d0				
	and.l d1,d0				
						
	move.l 68(a4,d0.l*4),a3			
						
	move.l 20(a5),136(sp)			
						
	move.b 29(a5),d2			
						
	move.b 5(a1),d6				
						
	move.b d2,d5				
	sub.b d6,d5				
						
	move.l 12(a5),d4			
						
	moveq #8,d0				
	cmp.l d4,d0				
	jbeq _?L346				
						
	moveq #9,d7				
	cmp.l d4,d7				
	jbeq _?L844				
						
	moveq #10,d0				
	cmp.l d4,d0				
	jbeq _?L346				
_?L821:						
						
	move.b d5,d0				
	subq.b #1,d0				
						
	cmp.b #31,d0				
	jbhi _?L822				
_?L347:						
						
	move.l 22(a4),a0			
						
	move.l a0,d0				
	add.l #-500,d0				
	moveq #15,d7				
	cmp.l d0,d7				
	jbcs _?L348				
	add.l d0,d0				
	move.w _?L350(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L350:						
	.dc.w _?L360-_?L350			
	.dc.w _?L348-_?L350			
	.dc.w _?L359-_?L350			
	.dc.w _?L351-_?L350			
	.dc.w _?L356-_?L350			
	.dc.w _?L351-_?L350			
	.dc.w _?L358-_?L350			
	.dc.w _?L357-_?L350			
	.dc.w _?L356-_?L350			
	.dc.w _?L355-_?L350			
	.dc.w _?L354-_?L350			
	.dc.w _?L354-_?L350			
	.dc.w _?L353-_?L350			
	.dc.w _?L352-_?L350			
	.dc.w _?L351-_?L350			
	.dc.w _?L349-_?L350			
_?L760:						
	move.l 128(sp),d6			
	move.l 132(sp),d7			
	move.l d3,a1				
_?L89:						
						
	move.b 16(a4),d0			
						
	cmp.b #56,d0				
	jbhi _?L761				
						
	move.l (a4),d2				
	move.l 4(a4),d3				
						
	clr.l d1				
	move.b d0,d1				
	move.l d1,a3				
						
	lea (-32,a3),a0				
	tst.l a0				
	jblt _?L94				
	move.l d3,d4				
	move.l a0,d1				
	lsl.l d1,d4				
	clr.l d5				
_?L95:						
						
	move.b d0,d1				
	addq.b #8,d1				
	move.b d1,16(a4)			
						
	move.l 12(a4),d1			
						
	move.l 8(a4),a0				
						
	cmp.l d1,a0				
	jbeq _?L96				
						
	lea (1,a0),a2				
	move.l a2,8(a4)				
						
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d6				
	move.l d3,d7				
	or.b (a0),d7				
						
	move.l d6,(a4)				
	move.l d7,4(a4)				
						
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L96				
	cmp.l d1,a2				
	jbeq _?L96				
						
	lea (2,a0),a2				
	move.l a2,8(a4)				
						
	move.l d6,d2				
	move.l d7,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
	move.l d2,56(sp)			
	move.l d3,60(sp)			
						
	move.l d2,48(sp)			
	or.b 1(a0),d3				
	move.l d3,52(sp)			
						
	move.l 48(sp),(a4)			
	move.l 52(sp),4(a4)			
						
	move.b d0,d2				
	subq.b #8,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L96				
	cmp.l d1,a2				
	jbeq _?L96				
						
	lea (3,a0),a2				
	move.l a2,8(a4)				
						
	move.l 48(sp),d2			
	move.l 52(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
	move.l d2,56(sp)			
	move.l d3,60(sp)			
						
	move.l d2,64(sp)			
	or.b 2(a0),d3				
	move.l d3,68(sp)			
						
	move.l 64(sp),(a4)			
	move.l 68(sp),4(a4)			
						
	move.b d0,d2				
	add.b #-16,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L96				
	cmp.l d1,a2				
	jbeq _?L96				
						
	lea (4,a0),a2				
	move.l a2,8(a4)				
						
	move.l 64(sp),d2			
	move.l 68(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
	move.l d2,56(sp)			
	move.l d3,60(sp)			
						
	move.l d2,72(sp)			
	or.b 3(a0),d3				
	move.l d3,76(sp)			
						
	move.l 72(sp),(a4)			
	move.l 76(sp),4(a4)			
						
	move.b d0,d2				
	add.b #-24,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L96				
	cmp.l d1,a2				
	jbeq _?L96				
						
	lea (5,a0),a2				
	move.l a2,8(a4)				
						
	move.l 72(sp),d2			
	move.l 76(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
	move.l d2,56(sp)			
	move.l d3,60(sp)			
						
	move.l d2,80(sp)			
	or.b 4(a0),d3				
	move.l d3,84(sp)			
						
	move.l 80(sp),(a4)			
	move.l 84(sp),4(a4)			
						
	move.b d0,d2				
	add.b #-32,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L96				
	cmp.l d1,a2				
	jbeq _?L96				
						
	lea (6,a0),a2				
	move.l a2,8(a4)				
						
	move.l 80(sp),d2			
	move.l 84(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
	move.l d2,56(sp)			
	move.l d3,60(sp)			
						
	move.l d2,88(sp)			
	or.b 5(a0),d3				
	move.l d3,92(sp)			
						
	move.l 88(sp),(a4)			
	move.l 92(sp),4(a4)			
						
	move.b d0,d2				
	add.b #-40,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L96				
	cmp.l d1,a2				
	jbeq _?L96				
						
	lea (7,a0),a2				
	move.l a2,8(a4)				
						
	move.l 88(sp),d2			
	move.l 92(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
	move.l d2,56(sp)			
	move.l d3,60(sp)			
						
	move.l d2,96(sp)			
	or.b 6(a0),d3				
	move.l d3,100(sp)			
						
	move.l 96(sp),(a4)			
	move.l 100(sp),4(a4)			
						
	add.b #-48,d0				
	move.b d0,16(a4)			
						
	cmp.b #8,d0				
	jbne _?L96				
	cmp.l d1,a2				
	jbeq _?L96				
						
	lea (8,a0),a2				
	move.l a2,8(a4)				
						
	clr.l d2				
	move.b 7(a0),d2				
						
	move.l 96(sp),d0			
	move.l 100(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	clr.l d3				
	or.l d0,d3				
	move.l d3,(a4)				
	or.l d1,d2				
	move.l d2,4(a4)				
						
	clr.b 16(a4)				
_?L96:						
						
	move.l d4,d0				
	move.l d5,d1				
	moveq #24,d1				
	lsr.l d1,d0				
	move.l d0,d1				
						
	move.l 22(a4),d0			
						
	moveq #101,d2				
	cmp.l d0,d2				
	jbeq _?L98				
	jbcs _?L99				
	tst.l d0				
	jbeq _?L100				
	moveq #100,d3				
	cmp.l d0,d3				
	jbne _?L102				
						
	cmp.b #76,d1				
	jbeq _?L845				
_?L592:						
	clr.l d0				
						
	move.l d0,22(a4)			
_?L106:						
						
	move.l a1,a6				
	jbra _?L89				
_?L85:						
						
	tst.l 1028(sp)				
	jbeq _?L560				
						
	tst.l 1032(sp)				
	jbeq _?L560				
						
	move.l 56(a4),a5			
						
	move.b 28(a5),d7			
						
	move.l 20(a5),a1			
						
	move.w 42(a4),d5			
	clr.l d2				
	move.w d5,d2				
	move.l d2,d6				
						
	move.b 40(a4),d0			
						
	move.l a1,d4				
	subq.l #1,d4				
	sub.l d2,d4				
						
	clr.l d1				
	move.b d7,d1				
	move.l d1,a0				
	muls.l d1,d4				
						
	move.b d0,d1				
						
	sub.l d1,a0				
	move.l 1032(sp),a3			
	move.l (a3),a2				
	add.l a0,d4				
	move.l d4,44(sp)			
	cmp.l d4,a2				
	jbcs _?L846				
_?L562:						
						
	tst.l 44(sp)				
	jbeq _?L563				
	move.l 1028(sp),a0			
	move.l 44(sp),d4			
	lsl.l #2,d4				
	add.l a0,d4				
	jbra _?L567				
_?L838:						
						
	cmp.l #300,d0				
	jbeq _?L213				
	cmp.l #400,d0				
	jbne _?L816				
						
	move.b 16(a4),d4			
						
	cmp.b #47,d4				
	jbls _?L847				
_?L234:						
						
	move.w #3,a6				
	jbra _?L80				
_?L82:						
						
	moveq #-1,d1				
	move.l d1,18(a4)			
	move.w #-1,a6				
	jbra _?L80				
_?L94:						
						
	move.w #31,a2				
	sub.l a3,a2				
	move.l d3,d4				
	lsr.l #1,d4				
	move.l a2,d5				
	lsr.l d5,d4				
	move.l d4,a0				
	move.l d2,d4				
	move.l a3,d1				
	lsl.l d1,d4				
	move.l a0,d1				
	or.l d1,d4				
	move.l d3,d5				
	move.l a3,d1				
	lsl.l d1,d5				
	jbra _?L95				
_?L346:						
						
	cmp.b #1,d1				
	jbne _?L821				
						
	move.b d5,d0				
	addq.b #1,d5				
_?L855:						
						
	cmp.b #31,d0				
	jbls _?L347				
_?L822:						
						
	moveq #3,d1				
	move.l d1,18(a4)			
						
	move.l #300,22(a4)			
_?L817:						
	moveq #3,d3				
	jbra _?L724				
_?L560:						
						
	moveq #6,d1				
	move.l d1,18(a4)			
	moveq #6,d3				
	jbra _?L724				
_?L99:						
						
	moveq #102,d2				
	cmp.l d0,d2				
	jbne _?L102				
						
	cmp.b #67,d1				
	jbeq _?L848				
						
	clr.l 22(a4)				
						
	move.l a1,a6				
	jbra _?L89				
_?L216:						
						
	move.b 16(a4),d0			
						
	cmp.b #32,d0				
	jbhi _?L234				
						
	clr.l d2				
	move.b d0,d2				
						
	move.l 4(a5),d1				
	moveq #6,d3				
	cmp.l d1,d3				
	jbeq _?L302				
	subq.l #7,d1				
	jbeq _?L303				
_?L304:						
						
	move.l 8(a5),d0				
	moveq #13,d5				
	cmp.l d0,d5				
	jbeq _?L315				
	moveq #14,d6				
	cmp.l d0,d6				
	jbeq _?L316				
	moveq #12,d7				
	cmp.l d0,d7				
	jbeq _?L849				
						
	move.l #403,d0				
_?L281:						
						
	move.l d0,22(a4)			
	moveq #3,d3				
	jbra _?L724				
_?L213:						
						
	move.b 16(a4),d2			
	move.b d2,d0				
	and.b #7,d0				
	bftst d2{#29:#3}			
	jbeq _?L218				
	moveq #8,d1				
	sub.b d0,d1				
	clr.l d0				
	move.b d1,d0				
						
	clr.l d3				
	move.b d2,d3				
						
	add.l d3,d0				
						
	moveq #64,d3				
	cmp.l d0,d3				
	jblt _?L234				
						
	add.b d1,d2				
						
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L220				
						
	move.l 12(a4),a1			
						
	move.l 8(a4),a0				
_?L221:						
						
	cmp.l a1,a0				
	jbeq _?L218				
						
	move.l (a4),d0				
	move.l 4(a4),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	clr.l d3				
	move.b -1(a0),d3			
						
	clr.l d4				
	or.l d0,d4				
	move.l d4,(a4)				
	or.l d1,d3				
	move.l d3,4(a4)				
						
	subq.b #8,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbhi _?L221				
_?L218:						
						
	cmp.b #49,d2				
	jbhi _?L234				
_?L220:						
						
	move.l (a4),a2				
	move.l 4(a4),a3				
						
	move.l 12(a4),40(sp)			
						
	clr.l d0				
	move.b d2,d0				
						
	move.w #-32,a0				
	add.l d0,a0				
	tst.l a0				
	jblt _?L224				
	move.l a3,d5				
	move.l a0,d6				
	lsl.l d6,d5				
	move.l d5,292(sp)			
	clr.l 296(sp)				
_?L225:						
						
	move.l 292(sp),d0			
	move.l 296(sp),d1			
	moveq #17,d1				
	lsr.l d1,d0				
						
	cmp.w #32764,d0				
	jbeq _?L223				
						
	move.b d2,d3				
	addq.b #8,d3				
	move.b d3,16(a4)			
						
	move.l 8(a4),a0				
						
	cmp.l 40(sp),a0				
	jbeq _?L817				
						
	move.l a0,d0				
	addq.l #1,d0				
	move.l d0,8(a4)				
						
	move.l a2,d4				
	move.l a3,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,396(sp)			
	move.l d5,d6				
	or.b (a0),d6				
	move.l d6,400(sp)			
						
	move.l 396(sp),(a4)			
	move.l 400(sp),4(a4)			
						
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L817				
	cmp.l 40(sp),d0				
	jbeq _?L817				
						
	addq.l #1,d0				
	move.l d0,8(a4)				
						
	move.l 396(sp),d4			
	move.l 400(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,404(sp)			
	move.l d5,d7				
	or.b 1(a0),d7				
	move.l d7,408(sp)			
						
	move.l 404(sp),(a4)			
	move.l 408(sp),4(a4)			
						
	move.b d2,d1				
	subq.b #8,d1				
	move.b d1,16(a4)			
						
	cmp.b #7,d1				
	jbls _?L817				
	cmp.l 40(sp),d0				
	jbeq _?L817				
						
	addq.l #1,d0				
	move.l d0,8(a4)				
						
	move.l 404(sp),d4			
	move.l 408(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,428(sp)			
	move.l d5,d1				
	or.b 2(a0),d1				
	move.l d1,432(sp)			
						
	move.l 428(sp),(a4)			
	move.l 432(sp),4(a4)			
						
	move.b d2,d1				
	add.b #-16,d1				
	move.b d1,16(a4)			
						
	cmp.b #7,d1				
	jbls _?L817				
	cmp.l 40(sp),d0				
	jbeq _?L817				
						
	lea (4,a0),a1				
	move.l a1,8(a4)				
						
	move.l 428(sp),d0			
	move.l 432(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,460(sp)			
	move.l d1,d3				
	or.b 3(a0),d3				
	move.l d3,464(sp)			
						
	move.l 460(sp),(a4)			
	move.l 464(sp),4(a4)			
						
	move.b d2,d0				
	add.b #-24,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L817				
	cmp.l 40(sp),a1				
	jbeq _?L817				
						
	move.l a0,d0				
	addq.l #5,d0				
	move.l d0,8(a4)				
						
	move.l 460(sp),d4			
	move.l 464(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,804(sp)			
	move.l d5,d6				
	or.b 4(a0),d6				
	move.l d6,808(sp)			
						
	move.l 804(sp),(a4)			
	move.l 808(sp),4(a4)			
						
	move.b d2,d1				
	add.b #-32,d1				
	move.b d1,16(a4)			
						
	cmp.b #7,d1				
	jbls _?L817				
	cmp.l 40(sp),d0				
	jbeq _?L817				
						
	addq.l #1,d0				
	move.l d0,8(a4)				
						
	move.l 804(sp),d4			
	move.l 808(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,780(sp)			
	move.l d5,d7				
	or.b 5(a0),d7				
	move.l d7,784(sp)			
						
	move.l 780(sp),(a4)			
	move.l 784(sp),4(a4)			
						
	subq.b #8,d1				
	move.b d1,16(a4)			
						
	cmp.b #7,d1				
	jbls _?L817				
	cmp.l 40(sp),d0				
	jbeq _?L817				
						
	lea (7,a0),a1				
	move.l a1,8(a4)				
						
	clr.l d3				
	move.b 6(a0),d3				
						
	move.l 780(sp),d0			
	move.l 784(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	clr.l d4				
	or.l d0,d4				
	move.l d4,(a4)				
	or.l d1,d3				
	move.l d3,4(a4)				
						
	add.b #-48,d2				
	move.b d2,16(a4)			
						
	moveq #3,d3				
	jbra _?L724				
_?L843:						
						
	move.b 16(a4),d2			
						
	cmp.b #32,d2				
	jbhi _?L814				
						
	move.l (a4),d4				
	move.l 4(a4),d5				
	move.l d4,d0				
	move.l d5,d1				
						
	clr.l d6				
	move.b d2,d6				
	move.l d6,a2				
						
	lea (-32,a2),a0				
	tst.l a0				
	jblt _?L112				
	move.l d5,d7				
	move.l a0,d6				
	lsl.l d6,d7				
	move.l d7,192(sp)			
	clr.l 196(sp)				
_?L113:						
						
	move.b d2,d7				
	addq.b #1,d7				
						
	move.b d7,16(a4)			
						
	move.l 12(a4),d6			
						
	move.l 8(a4),a0				
						
	cmp.b #7,d7				
	jbls _?L114				
	cmp.l d6,a0				
	jbeq _?L114				
						
	lea (1,a0),a1				
	move.l a1,8(a4)				
						
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d0				
	move.l d5,d1				
	or.b (a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	move.b d2,d7				
	subq.b #7,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L115				
	cmp.l d6,a1				
	jbeq _?L825				
						
	lea (2,a0),a1				
	move.l a1,8(a4)				
						
	move.l d0,d4				
	move.l d1,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d0				
	move.l d5,d1				
	or.b 1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	move.b d2,d7				
	add.b #-15,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L115				
	cmp.l d6,a1				
	jbeq _?L825				
						
	lea (3,a0),a1				
	move.l a1,8(a4)				
						
	move.l d0,d4				
	move.l d1,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d0				
	move.l d5,d1				
	or.b 2(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	move.b d2,d7				
	add.b #-23,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L115				
	cmp.l d6,a1				
	jbeq _?L825				
						
	lea (4,a0),a1				
	move.l a1,8(a4)				
						
	move.l d0,d4				
	move.l d1,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d0				
	move.l d5,d1				
	or.b 3(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	move.b d2,d7				
	add.b #-31,d7				
_?L115:						
						
	move.l 48(a4),a1			
						
	move.l 192(sp),d4			
	move.l 196(sp),d5			
	add.l d4,d4				
	clr.l d4				
	clr.l d5				
	addx.l d5,d5				
						
	move.b d5,d2				
	and.b #1,d2				
	move.b d2,(a1)				
						
	clr.l d2				
	move.b d7,d2				
						
	move.w #-32,a0				
	add.l d2,a0				
	tst.l a0				
	jblt _?L118				
	move.l d1,d4				
	move.l a0,d5				
	lsl.l d5,d4				
	move.l d4,168(sp)			
	clr.l 172(sp)				
_?L119:						
						
	addq.b #7,d7				
						
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbeq _?L120				
	move.l 8(a4),a0				
	move.l d3,d4				
_?L121:						
	cmp.l d6,a0				
	jbeq _?L122				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b -1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbhi _?L121				
_?L122:						
						
	move.l d4,d3				
	move.l 168(sp),d4			
	move.l 172(sp),d5			
	moveq #25,d5				
	lsr.l d5,d4				
						
	move.l d4,a0				
						
	move.l d4,2(a1)				
						
	moveq #127,d5				
	cmp.l d4,d5				
	jbeq _?L125				
						
	clr.l d4				
	move.b d7,d4				
						
	move.w #-32,a2				
	add.l d4,a2				
	tst.l a2				
	jblt _?L126				
	move.l d1,d2				
	move.l a2,d4				
	lsl.l d4,d2				
						
	add.b #24,d7				
	move.b d7,d4				
_?L128:						
						
	move.b d4,16(a4)			
						
	move.l 8(a4),a2				
_?L131:						
						
	cmp.l d6,a2				
	jbeq _?L132				
						
	addq.l #1,a2				
	move.l a2,8(a4)				
						
	move.l d0,d4				
	move.l d1,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d0				
	move.l d5,d1				
	or.b -1(a2),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbhi _?L131				
_?L132:						
						
	lsr.l #8,d2				
						
	move.l d2,26(a4)			
						
	move.l d2,6(a1)				
						
	tst.l a0				
	jbne _?L144				
						
	move.l #202,22(a4)			
						
	moveq #34,d5				
	cmp.l d2,d5				
	jbeq _?L77				
_?L125:						
						
	moveq #-1,d6				
	move.l d6,18(a4)			
	move.w #-1,a6				
	jbra _?L80				
_?L110:						
						
	move.l 26(a4),d0			
	moveq #34,d7				
	cmp.l d0,d7				
	jbcs _?L135				
	move.l d0,d1				
	add.l d1,d1				
	move.w _?L137(pc,d1.l),d1		
	jmp 2(pc,d1.w)				
	.align 2,0x284c				
						
_?L137:						
	.dc.w _?L144-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L143-_?L137			
	.dc.w _?L135-_?L137			
	.dc.w _?L135-_?L137			
	.dc.w _?L135-_?L137			
	.dc.w _?L142-_?L137			
	.dc.w _?L135-_?L137			
	.dc.w _?L135-_?L137			
	.dc.w _?L135-_?L137			
	.dc.w _?L141-_?L137			
	.dc.w _?L135-_?L137			
	.dc.w _?L135-_?L137			
	.dc.w _?L140-_?L137			
	.dc.w _?L135-_?L137			
	.dc.w _?L135-_?L137			
	.dc.w _?L139-_?L137			
	.dc.w _?L135-_?L137			
	.dc.w _?L138-_?L137			
	.dc.w _?L135-_?L137			
	.dc.w _?L136-_?L137			
_?L846:						
	move.l a2,44(sp)			
	jbra _?L562				
_?L847:						
						
	move.l (a4),d2				
	move.l 4(a4),d3				
	move.l d2,d0				
	move.l d3,d1				
						
	clr.l d5				
	move.b d4,d5				
						
	move.w #-32,a0				
	add.l d5,a0				
	tst.l a0				
	jblt _?L235				
	move.l d3,d5				
	move.l a0,d6				
	lsl.l d6,d5				
	move.l d5,232(sp)			
	clr.l 236(sp)				
_?L236:						
						
	move.b d4,d5				
	addq.b #1,d5				
						
	move.b d5,16(a4)			
						
	move.l 12(a4),a1			
						
	cmp.b #7,d5				
	jbls _?L237				
						
	move.l 8(a4),a0				
						
	cmp.l a1,a0				
	jbeq _?L238				
						
	move.l a0,d6				
	addq.l #1,d6				
	move.l d6,8(a4)				
						
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b (a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	move.b d4,d5				
	subq.b #7,d5				
	move.b d5,16(a4)			
						
	cmp.b #7,d5				
	jbls _?L237				
	cmp.l d6,a1				
	jbeq _?L826				
						
	move.l a0,d6				
	addq.l #2,d6				
	move.l d6,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b 1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	move.b d4,d5				
	add.b #-15,d5				
	move.b d5,16(a4)			
						
	cmp.b #7,d5				
	jbls _?L237				
	cmp.l d6,a1				
	jbeq _?L826				
						
	move.l a0,d6				
	addq.l #3,d6				
	move.l d6,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b 2(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	move.b d4,d5				
	add.b #-23,d5				
	move.b d5,16(a4)			
						
	cmp.b #7,d5				
	jbls _?L237				
	cmp.l d6,a1				
	jbeq _?L826				
						
	move.l a0,d6				
	addq.l #4,d6				
	move.l d6,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b 3(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	move.b d4,d5				
	add.b #-31,d5				
	move.b d5,16(a4)			
						
	cmp.b #7,d5				
	jbls _?L237				
	cmp.l d6,a1				
	jbeq _?L850				
						
	move.l a0,d6				
	addq.l #5,d6				
	move.l d6,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b 4(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	move.b d4,d5				
	add.b #-39,d5				
	move.b d5,16(a4)			
						
	cmp.b #8,d5				
	jbne _?L237				
	cmp.l d6,a1				
	jbeq _?L826				
						
	lea (6,a0),a3				
	move.l a3,8(a4)				
						
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,184(sp)			
	move.l d1,d2				
	or.b 5(a0),d2				
	move.l d2,188(sp)			
						
	move.l 184(sp),(a4)			
	move.l 188(sp),4(a4)			
						
	move.l 232(sp),d0			
	move.l 236(sp),d1			
	add.l d0,d0				
	clr.l d0				
	clr.l d1				
	addx.l d1,d1				
						
	move.l d1,(a5)				
						
	move.l 184(sp),d0			
	move.l 188(sp),d1			
						
	moveq #4,d5				
_?L240:						
						
	move.l 184(sp),d2			
	move.l 188(sp),d3			
	moveq #28,d3				
	lsr.l d3,d2				
	move.l d2,d3				
	clr.l d2				
	move.l d2,104(sp)			
	move.l d3,108(sp)			
						
	move.l d3,4(a5)				
						
	clr.l d3				
	move.b d5,d3				
						
	move.w #-32,a0				
	add.l d3,a0				
	tst.l a0				
	jblt _?L245				
	move.l d1,d3				
	move.l a0,d4				
	lsl.l d4,d3				
	move.l d3,216(sp)			
	clr.l 220(sp)				
						
	addq.b #4,d5				
						
	move.b d5,16(a4)			
_?L247:						
						
	move.l 8(a4),a3				
_?L254:						
						
	cmp.l a1,a3				
	jbeq _?L253				
						
	addq.l #1,a3				
	move.l a3,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b -1(a3),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d5				
	move.b d5,16(a4)			
						
	cmp.b #7,d5				
	jbhi _?L254				
_?L253:						
						
	move.l 216(sp),d2			
	move.l 220(sp),d3			
	moveq #28,d3				
	lsr.l d3,d2				
	move.l d2,d3				
	clr.l d2				
	move.l d2,56(sp)			
	move.l d3,60(sp)			
						
	move.l d3,8(a5)				
						
	move.b d5,d2				
						
	move.w #-32,a0				
	add.l d2,a0				
	tst.l a0				
	jblt _?L256				
	move.l d1,d3				
	move.l a0,d4				
	lsl.l d4,d3				
	move.l d3,268(sp)			
	clr.l 272(sp)				
_?L257:						
						
	move.b d5,d6				
	addq.b #4,d6				
						
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbls _?L258				
						
	move.l 8(a4),a3				
_?L259:						
						
	cmp.l a1,a3				
	jbeq _?L258				
						
	addq.l #1,a3				
	move.l a3,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b -1(a3),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d6				
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbhi _?L259				
_?L258:						
						
	move.l 268(sp),d4			
	move.l 272(sp),d5			
	moveq #28,d5				
	lsr.l d5,d4				
	move.l d4,d5				
						
	move.l d4,a0				
						
	move.l d4,12(a5)			
						
	clr.l d2				
	move.b d6,d2				
						
	move.w #-32,a3				
	add.l d2,a3				
	tst.l a3				
	jblt _?L261				
	move.l d1,d2				
	move.l a3,d3				
	lsl.l d3,d2				
	move.l d2,260(sp)			
	clr.l 264(sp)				
_?L262:						
						
	addq.b #3,d6				
						
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbls _?L263				
						
	move.l 8(a4),a3				
_?L264:						
						
	cmp.l a1,a3				
	jbeq _?L263				
						
	addq.l #1,a3				
	move.l a3,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b -1(a3),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d6				
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbhi _?L264				
_?L263:						
						
	move.l 260(sp),d2			
	move.l 264(sp),d3			
	moveq #29,d3				
	lsr.l d3,d2				
	move.l d2,d3				
	clr.l d2				
	move.l d2,112(sp)			
	move.l d3,116(sp)			
						
	move.l d3,16(a5)			
						
	move.b d6,d2				
						
	move.w #-32,a3				
	add.l d2,a3				
	tst.l a3				
	jblt _?L266				
	move.l d1,d3				
	move.l a3,d7				
	lsl.l d7,d3				
	move.l d3,252(sp)			
	clr.l 256(sp)				
_?L267:						
						
	addq.b #1,d6				
						
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbls _?L272				
						
	move.l 8(a4),a3				
_?L271:						
						
	cmp.l a1,a3				
	jbeq _?L272				
						
	addq.l #1,a3				
	move.l a3,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b -1(a3),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d6				
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbhi _?L271				
_?L272:						
						
	move.l 252(sp),d6			
	move.l 256(sp),d7			
	neg.l d7				
	negx.l d6				
	jbgt _?L269				
						
	moveq #10,d7				
	cmp.l a0,d7				
	jbcs _?L269				
						
	move.l 12(a2),24(a5)			
						
	move.b 17(a2),29(a5)			
						
	move.l 108(sp),d0			
	move.l _fx_flac_block_sizes_(d0.l*4),d0	
						
	jbmi _?L276				
						
	jbeq _?L277				
						
	move.l d0,20(a5)			
_?L277:						
						
	move.l 60(sp),d0			
	move.l _fx_flac_sample_rates_(d0.l*4),d0
						
	jbmi _?L276				
						
	jbeq _?L278				
						
	move.l d0,24(a5)			
_?L278:						
						
	move.l 112(sp),a1			
	move.l 116(sp),a2			
	move.b _fx_flac_sample_sizes_(a2),d0	
						
	jbmi _?L276				
						
	jbeq _?L279				
						
	move.b d0,29(a5)			
_?L279:						
						
	moveq #7,d0				
	cmp.l a0,d0				
	jbcs _?L594				
	move.b d5,d0				
	addq.b #1,d0				
	move.b d0,28(a5)			
						
	move.l #401,22(a4)			
						
	move.l 18(a4),d3			
_?L873:						
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L841:						
						
	moveq #6,d0				
	move.l d0,18(a4)			
	moveq #6,d3				
	jbra _?L724				
_?L818:						
	move.l 56(a4),a5			
	move.l 52(a4),a2			
_?L269:						
						
	moveq #3,d0				
	move.l d0,18(a4)			
						
	move.l #300,22(a4)			
	move.w #3,a6				
						
	move.l 22(a4),d0			
						
	cmp.l #401,d0				
	jbne _?L851				
_?L211:						
						
	moveq #1,d1				
	cmp.l (a5),d1				
	jbeq _?L852				
	moveq #48,d0				
	moveq #6,d7				
_?L282:						
						
	move.b 16(a4),d4			
	clr.l d2				
	move.b d4,d2				
						
	add.l d2,d0				
						
	moveq #64,d3				
	cmp.l d0,d3				
	jblt _?L234				
						
	move.l (a4),d0				
	move.l 4(a4),d1				
						
	move.w #-32,a0				
	add.l d2,a0				
	tst.l a0				
	jblt _?L283				
	move.l d1,d5				
	move.l a0,d6				
	lsl.l d6,d5				
	move.l d5,276(sp)			
	clr.l 280(sp)				
						
	addq.b #8,d4				
						
	move.b d4,16(a4)			
						
	move.l 12(a4),40(sp)			
						
	move.l 8(a4),a0				
	move.l 40(sp),d6			
_?L285:						
						
	cmp.l d6,a0				
	jbeq _?L288				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b -1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d4				
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbhi _?L285				
_?L288:						
						
	move.l 276(sp),d2			
	move.l 280(sp),d3			
	moveq #24,d3				
	lsr.l d3,d2				
	move.l d2,d3				
	clr.l d2				
						
	move.b d3,d0				
						
	clr.b d1				
						
	tst.b d3				
	jbge _?L853				
_?L286:						
						
	lsl.b #1,d0				
	move.b d1,d5				
						
	addq.b #1,d1				
						
	tst.b d0				
	jblt _?L286				
						
	cmp.b d1,d7				
	jbcs _?L291				
						
	and.l #255,d0				
	clr.l d2				
	move.b d1,d2				
	asr.l d2,d0				
	move.l d0,34(a5)			
	smi d7					
	extb.l d7				
	move.l d7,30(a5)			
						
	cmp.b #1,d1				
	jbls _?L291				
						
	moveq #1,d7				
	move.w d7,a3				
	move.w d5,a0				
	move.l 40(sp),d6			
						
	move.l (a4),d0				
	move.l 4(a4),d1				
						
	move.b 16(a4),d7			
	clr.l d3				
	move.b d7,d3				
						
	move.w #-32,a1				
	add.l d3,a1				
	tst.l a1				
	jblt _?L294				
_?L854:						
	move.l d1,d4				
	move.l a1,d2				
	lsl.l d2,d4				
	clr.l d5				
_?L295:						
						
	addq.b #8,d7				
						
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L299				
						
	move.l 8(a4),a1				
_?L298:						
						
	cmp.l d6,a1				
	jbeq _?L299				
						
	addq.l #1,a1				
	move.l a1,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b -1(a1),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbhi _?L298				
_?L299:						
						
	move.l d4,d2				
	move.l d5,d3				
	moveq #24,d3				
	lsr.l d3,d2				
	move.l d2,d3				
						
	move.b d2,d0				
	and.b #-64,d0				
	cmp.b #-128,d0				
	jbne _?L819				
						
	move.l 34(a5),d1			
	move.l d1,d7				
	moveq #26,d0				
	lsr.l d0,d7				
	move.l 30(a5),d0			
	lsl.l #6,d0				
	lsl.l #6,d1				
						
	moveq #63,d2				
	and.l d3,d2				
						
	or.l d0,d7				
	move.l d7,30(a5)			
	or.l d2,d1				
	move.l d1,34(a5)			
						
	move.w a3,d0				
	addq.b #1,d0				
						
	move.w a3,d1				
	move.w a0,d2				
	cmp.b d1,d2				
	jbeq _?L819				
						
	move.w d0,a3				
						
	move.l (a4),d0				
	move.l 4(a4),d1				
						
	move.b 16(a4),d7			
	clr.l d3				
	move.b d7,d3				
						
	move.w #-32,a1				
	add.l d3,a1				
	tst.l a1				
	jbge _?L854				
_?L294:						
	move.w #31,a2				
	sub.l d3,a2				
	move.l d1,d2				
	lsr.l #1,d2				
	move.l a2,d4				
	lsr.l d4,d2				
	move.l d0,d4				
	lsl.l d3,d4				
	or.l d2,d4				
	move.l d1,d5				
	lsl.l d3,d5				
	jbra _?L295				
_?L842:						
						
	move.l 26(a4),a1			
						
	tst.l a1				
	jbne _?L204				
						
	move.l 48(a4),a0			
						
	tst.b (a0)				
	jbeq _?L205				
						
	moveq #2,d4				
	move.l d4,18(a4)			
	moveq #2,d3				
	jbra _?L724				
_?L844:						
						
	tst.b d1				
	jbne _?L821				
						
	move.b d5,d0				
	addq.b #1,d5				
	jbra _?L855				
_?L100:						
						
	cmp.b #102,d1				
	jbne _?L106				
						
	moveq #100,d3				
	move.l d3,22(a4)			
						
	move.l a1,a6				
	jbra _?L89				
_?L98:						
						
	cmp.b #97,d1				
	jbne _?L592				
	moveq #102,d0				
						
	move.l d0,22(a4)			
	jbra _?L106				
_?L391:						
						
	move.w a2,d2				
	tst.b d2				
	jbne _?L401				
_?L400:						
						
	moveq #3,d6				
	move.l d6,18(a4)			
_?L816:						
						
	move.l #300,22(a4)			
	moveq #3,d3				
	jbra _?L724				
_?L204:						
						
	move.l a1,d4				
	moveq #7,d5				
	cmp.l a1,d5				
	jbcs _?L856				
_?L207:						
						
	move.b d4,d2				
	lsl.b #3,d2				
						
	move.b 16(a4),d1			
						
	clr.l d0				
	move.b d2,d0				
						
	clr.l d5				
	move.b d1,d5				
						
	add.l d5,d0				
						
	moveq #64,d6				
	cmp.l d0,d6				
	jblt _?L814				
						
	add.b d1,d2				
						
	move.b d2,16(a4)			
						
	move.l 12(a4),d6			
						
	move.l 8(a4),a0				
_?L208:						
						
	cmp.l d6,a0				
	jbeq _?L209				
						
	move.l (a4),d0				
	move.l 4(a4),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	clr.l d5				
	move.b -1(a0),d5			
						
	clr.l d7				
	or.l d0,d7				
	move.l d7,(a4)				
	or.l d1,d5				
	move.l d5,4(a4)				
						
	subq.b #8,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbhi _?L208				
_?L209:						
						
	sub.l d4,a1				
	move.l a1,26(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L840:						
						
	clr.l d6				
	move.w d5,d6				
						
	move.l 20(a5),a1			
	jbra _?L563				
_?L351:						
						
	move.l a1,56(sp)			
	move.l 136(sp),40(sp)			
	move.w d5,a2				
	move.l a0,240(sp)			
	moveq #1,d1				
	cmp.l (a1),d1				
	jbeq _?L414				
	clr.l d2				
	move.b 4(a1),d2				
	move.l d2,40(sp)			
_?L414:						
						
	move.w 42(a4),a1			
	clr.l d4				
	move.w a1,d4				
	move.l d4,a5				
						
	cmp.l 40(sp),a5				
	jbcc _?L415				
						
	move.w a2,d5				
	and.l #255,d5				
	move.l d5,56(sp)			
						
	move.l d5,d0				
	subq.l #1,d0				
	moveq #1,d1				
	lsl.l d0,d1				
						
	moveq #64,d6				
	sub.l d5,d6				
	move.l d6,136(sp)			
						
	moveq #32,d0				
	sub.l d5,d0				
	moveq #-33,d7				
	add.l d5,d7				
	move.l d7,156(sp)			
	move.w a2,d2				
	move.b d2,104(sp)			
	move.l a5,d7				
	move.l d1,a5				
	move.l a6,504(sp)			
	move.l d3,484(sp)			
	move.l d0,a2				
_?L422:						
						
	move.b 16(a4),d0			
	clr.l d1				
	move.b d0,d1				
						
	move.l 56(sp),a0			
	add.l d1,a0				
						
	moveq #64,d3				
	cmp.l a0,d3				
	jblt _?L416				
						
	move.l (a4),d2				
	move.l 4(a4),d3				
						
	move.w #-32,a0				
	add.l d1,a0				
	tst.l a0				
	jblt _?L417				
	move.l d3,d6				
	move.l a0,d4				
	lsl.l d4,d6				
	sub.l a6,a6				
_?L418:						
						
	add.b 104(sp),d0			
						
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L424				
						
	move.l 12(a4),d1			
						
	move.l 8(a4),a0				
_?L423:						
						
	cmp.l d1,a0				
	jbeq _?L424				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d2,d4				
	move.l d3,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d2				
	move.l d5,d3				
	or.b -1(a0),d3				
						
	move.l d2,(a4)				
	move.l d3,4(a4)				
						
	subq.b #8,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbhi _?L423				
_?L424:						
						
	tst.l a2				
	jblt _?L420				
	move.l a2,d0				
	lsr.l d0,d6				
_?L421:						
						
	move.l a5,d3				
	eor.l d3,d6				
	sub.l a5,d6				
	move.l d6,(a3,d7.l*4)			
						
	addq.w #1,a1				
	move.w a1,42(a4)			
						
	clr.l d7				
	move.w a1,d7				
						
	cmp.l 40(sp),d7				
	jbcs _?L422				
	move.l 504(sp),a6			
	move.l 484(sp),d3			
_?L415:						
						
	move.l 240(sp),d5			
	addq.l #1,d5				
	move.l d5,22(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L143:						
						
	move.b 16(a4),d1			
						
	move.l 52(a4),a3			
						
	move.w #16,a2				
	sub.l d0,a2				
						
	cmp.b #56,d1				
	jbhi _?L198				
						
	move.l (a4),d4				
	move.l 4(a4),d5				
						
	clr.l d2				
	move.b d1,d2				
						
	move.w #-32,a0				
	add.l d2,a0				
	tst.l a0				
	jblt _?L199				
	move.l d5,d7				
	move.l a0,d2				
	lsl.l d2,d7				
	move.l d7,372(sp)			
	clr.l 376(sp)				
_?L200:						
						
	move.b d1,d7				
	addq.b #8,d7				
	move.b d7,16(a4)			
						
	move.l 12(a4),a1			
						
	move.l 8(a4),a0				
						
	cmp.l a1,a0				
	jbeq _?L201				
						
	move.l a0,d2				
	addq.l #1,d2				
	move.l d2,8(a4)				
						
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,892(sp)			
	move.l d5,d6				
	or.b (a0),d6				
	move.l d6,896(sp)			
						
	move.l 892(sp),(a4)			
	move.l 896(sp),4(a4)			
						
	move.b d1,16(a4)			
						
	cmp.b #7,d1				
	jbls _?L201				
	cmp.l a1,d2				
	jbeq _?L201				
						
	addq.l #1,d2				
	move.l d2,8(a4)				
						
	move.l 892(sp),d4			
	move.l 896(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,908(sp)			
	move.l d5,d7				
	or.b 1(a0),d7				
	move.l d7,912(sp)			
						
	move.l 908(sp),(a4)			
	move.l 912(sp),4(a4)			
						
	move.b d1,d4				
	subq.b #8,d4				
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbls _?L201				
	cmp.l a1,d2				
	jbeq _?L201				
						
	addq.l #1,d2				
	move.l d2,8(a4)				
						
	move.l 908(sp),d4			
	move.l 912(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,900(sp)			
	move.l d5,d6				
	or.b 2(a0),d6				
	move.l d6,904(sp)			
						
	move.l 900(sp),(a4)			
	move.l 904(sp),4(a4)			
						
	move.b d1,d4				
	add.b #-16,d4				
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbls _?L201				
	cmp.l a1,d2				
	jbeq _?L201				
						
	addq.l #1,d2				
	move.l d2,8(a4)				
						
	move.l 900(sp),d4			
	move.l 904(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,884(sp)			
	move.l d5,d7				
	or.b 3(a0),d7				
	move.l d7,888(sp)			
						
	move.l 884(sp),(a4)			
	move.l 888(sp),4(a4)			
						
	move.b d1,d4				
	add.b #-24,d4				
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbls _?L201				
	cmp.l a1,d2				
	jbeq _?L201				
						
	addq.l #1,d2				
	move.l d2,8(a4)				
						
	move.l 884(sp),d4			
	move.l 888(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,876(sp)			
	move.l d5,d6				
	or.b 4(a0),d6				
	move.l d6,880(sp)			
						
	move.l 876(sp),(a4)			
	move.l 880(sp),4(a4)			
						
	move.b d1,d4				
	add.b #-32,d4				
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbls _?L201				
	cmp.l a1,d2				
	jbeq _?L201				
						
	addq.l #1,d2				
	move.l d2,8(a4)				
						
	move.l 876(sp),d4			
	move.l 880(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,868(sp)			
	move.l d5,d7				
	or.b 5(a0),d7				
	move.l d7,872(sp)			
						
	move.l 868(sp),(a4)			
	move.l 872(sp),4(a4)			
						
	move.b d1,d4				
	add.b #-40,d4				
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbls _?L201				
	cmp.l a1,d2				
	jbeq _?L201				
						
	addq.l #1,d2				
	move.l d2,8(a4)				
						
	move.l 868(sp),d4			
	move.l 872(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,852(sp)			
	move.l d5,d6				
	or.b 6(a0),d6				
	move.l d6,856(sp)			
						
	move.l 852(sp),(a4)			
	move.l 856(sp),4(a4)			
						
	add.b #-48,d1				
	move.b d1,16(a4)			
						
	cmp.b #8,d1				
	jbne _?L201				
	cmp.l a1,d2				
	jbeq _?L201				
						
	lea (8,a0),a1				
	move.l a1,8(a4)				
						
	clr.l d1				
	move.b 7(a0),d1				
						
	move.l 852(sp),d4			
	move.l 856(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
	clr.l d2				
	or.l d4,d2				
	move.l d2,(a4)				
	or.l d5,d1				
	move.l d1,4(a4)				
						
	clr.b 16(a4)				
_?L201:						
						
	move.l 372(sp),d4			
	move.l 376(sp),d5			
	moveq #24,d5				
	lsr.l d5,d4				
						
	move.b d4,26(a3,a2.l)			
						
	subq.l #1,d0				
	move.l d0,26(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L356:						
						
	move.b 16(a4),d2			
						
	cmp.b #58,d2				
	jbhi _?L814				
						
	move.l (a4),a2				
	move.l 4(a4),a3				
	move.l a2,d4				
	move.l a3,d5				
						
	clr.l d0				
	move.b d2,d0				
						
	move.w #-32,a0				
	add.l d0,a0				
	tst.l a0				
	jblt _?L453				
	move.l a3,d6				
	move.l a0,d7				
	lsl.l d7,d6				
	move.l d6,420(sp)			
	clr.l 424(sp)				
_?L454:						
						
	move.b d2,d7				
	addq.b #2,d7				
						
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L455				
						
	move.l 12(a4),40(sp)			
						
	move.l 8(a4),a0				
						
	cmp.l 40(sp),a0				
	jbeq _?L456				
						
	lea (1,a0),a5				
	move.l a5,8(a4)				
						
	move.l a2,d0				
	move.l a3,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b (a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L455				
	cmp.l 40(sp),a5				
	jbeq _?L456				
						
	lea (2,a0),a2				
	move.l a2,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 1(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L455				
	cmp.l 40(sp),a2				
	jbeq _?L456				
						
	lea (3,a0),a2				
	move.l a2,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 2(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L455				
	cmp.l 40(sp),a2				
	jbeq _?L456				
						
	lea (4,a0),a2				
	move.l a2,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 3(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L455				
	cmp.l 40(sp),a2				
	jbeq _?L456				
						
	lea (5,a0),a2				
	move.l a2,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 4(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L455				
	cmp.l 40(sp),a2				
	jbeq _?L456				
						
	lea (6,a0),a2				
	move.l a2,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 5(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L455				
	cmp.l 40(sp),a2				
	jbeq _?L456				
						
	lea (7,a0),a2				
	move.l a2,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 6(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	move.b d2,d7				
	add.b #-54,d7				
	move.b d7,16(a4)			
_?L455:						
						
	move.l 420(sp),d0			
	move.l 424(sp),d1			
	moveq #30,d1				
	lsr.l d1,d0				
						
	move.l d0,12(a1)			
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbcc _?L459				
_?L583:						
						
	moveq #3,d3				
	move.l d3,18(a4)			
						
	move.l #300,22(a4)			
	moveq #3,d3				
	jbra _?L724				
_?L354:						
						
	move.l a1,56(sp)			
	move.l a0,240(sp)			
	move.w 36(a4),d2			
						
	jbeq _?L524				
						
	cmp.l #511,240(sp)			
	jbeq _?L509				
_?L488:						
						
	move.l #510,22(a4)			
						
	move.l 56(sp),a0			
	move.b 17(a0),d7			
						
	clr.l d0				
	move.b d7,d0				
	move.l d0,a2				
						
	jbeq _?L602				
						
	move.b 16(a4),40(sp)			
	clr.l d4				
	move.b 40(sp),d4			
						
	add.l d4,d0				
						
	moveq #64,d1				
	cmp.l d0,d1				
	jblt _?L814				
						
	move.b d7,d0				
	subq.b #1,d0				
	cmp.b #56,d0				
	jbhi _?L442				
						
	move.l (a4),d0				
	move.l 4(a4),d1				
						
	move.w #-32,a0				
	add.l d4,a0				
	tst.l a0				
	jblt _?L500				
	move.l d1,d4				
	move.l a0,d5				
	lsl.l d5,d4				
	move.l d4,a1				
	sub.l a5,a5				
_?L501:						
						
	add.b 40(sp),d7				
						
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L506				
						
	move.l 12(a4),d6			
						
	move.l 8(a4),a0				
_?L505:						
						
	cmp.l d6,a0				
	jbeq _?L506				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d0,d4				
	move.l d1,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d0				
	move.l d5,d1				
	or.b -1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbhi _?L505				
_?L506:						
						
	moveq #64,d1				
	sub.l a2,d1				
						
	moveq #32,d0				
	sub.l a2,d0				
	jbmi _?L503				
	move.l a1,d4				
	lsr.l d0,d4				
_?L499:						
						
	clr.l d0				
	move.w 38(a4),d0			
	move.l a2,d7				
	lsl.l d7,d0				
						
	or.l d4,d0				
						
	move.w 42(a4),d1			
						
	clr.l d4				
	move.w d1,d4				
	lsl.l #2,d4				
	lea (a3,d4.l),a0			
						
	move.l d0,d4				
	lsr.l #1,d4				
						
	btst #0,d0				
	jbeq _?L508				
						
	not.l d4				
_?L508:						
						
	move.l d4,(a0)				
						
	clr.w 38(a4)				
						
	move.l #511,22(a4)			
						
	addq.w #1,d1				
	move.w d1,42(a4)			
						
	subq.w #1,d2				
	move.w d2,36(a4)			
						
	jbeq _?L524				
_?L509:						
						
	move.b 16(a4),d6			
						
	cmp.b #63,d6				
	jbhi _?L814				
	move.l (a4),d4				
	move.l 4(a4),d5				
	move.w d2,d7				
	move.l d3,a2				
_?L498:						
						
	move.l d4,104(sp)			
	move.l d5,108(sp)			
						
	clr.l d1				
	move.b d6,d1				
	move.l d1,a0				
						
	lea (-32,a0),a1				
	tst.l a1				
	jblt _?L489				
_?L858:						
	move.l d5,d2				
	move.l a1,d0				
	lsl.l d0,d2				
	clr.l d3				
_?L490:						
						
	addq.b #1,d6				
						
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbls _?L857				
						
	move.l 12(a4),a1			
						
	move.l 8(a4),a0				
	move.l 104(sp),d0			
	move.l 108(sp),d1			
_?L494:						
						
	cmp.l a1,a0				
	jbeq _?L495				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d0,d4				
	move.l d1,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d0				
	move.l d5,d1				
	or.b -1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d6				
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbhi _?L494				
_?L495:						
						
	sub.l d4,d4				
	tst.l d3				
	subx.l d4,d2				
	jblt _?L805				
						
	addq.w #1,38(a4)			
						
	cmp.b #63,d6				
	jbhi _?L806				
	move.l (a4),d4				
	move.l 4(a4),d5				
						
	move.l d4,104(sp)			
	move.l d5,108(sp)			
						
	clr.l d1				
	move.b d6,d1				
	move.l d1,a0				
						
	lea (-32,a0),a1				
	tst.l a1				
	jbge _?L858				
_?L489:						
	move.w #31,a5				
	sub.l a0,a5				
	move.l d5,d1				
	lsr.l #1,d1				
	move.l a5,d2				
	lsr.l d2,d1				
	move.l d4,d2				
	move.l a0,d0				
	lsl.l d0,d2				
	or.l d1,d2				
	move.l d5,d3				
	lsl.l d0,d3				
	jbra _?L490				
_?L856:						
						
	moveq #7,d4				
	jbra _?L207				
_?L205:						
						
	move.l #200,22(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L303:						
						
	move.l (a4),a2				
	move.l 4(a4),a3				
						
	move.w #-32,a0				
	add.l d2,a0				
	tst.l a0				
	jblt _?L310				
	move.l a3,d1				
	move.l a0,d5				
	lsl.l d5,d1				
_?L311:						
						
	move.b d0,d6				
	add.b #16,d6				
	move.b d6,16(a4)			
						
	move.l 12(a4),40(sp)			
						
	move.l 8(a4),a0				
						
	cmp.l 40(sp),a0				
	jbeq _?L312				
						
	lea (1,a0),a1				
	move.l a1,8(a4)				
						
	move.l a2,d2				
	move.l a3,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,436(sp)			
	move.l d3,d7				
	or.b (a0),d7				
	move.l d7,440(sp)			
						
	move.l 436(sp),(a4)			
	move.l 440(sp),4(a4)			
						
	move.b d0,d2				
	addq.b #8,d2				
	move.b d2,16(a4)			
						
	cmp.l 40(sp),a1				
	jbeq _?L312				
						
	lea (2,a0),a1				
	move.l a1,8(a4)				
						
	move.l 436(sp),d2			
	move.l 440(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,444(sp)			
	move.l d3,d4				
	or.b 1(a0),d4				
	move.l d4,448(sp)			
						
	move.l 444(sp),(a4)			
	move.l 448(sp),4(a4)			
						
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L312				
	cmp.l 40(sp),a1				
	jbeq _?L312				
						
	lea (3,a0),a1				
	move.l a1,8(a4)				
						
	move.l 444(sp),d2			
	move.l 448(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,476(sp)			
	move.l d3,d5				
	or.b 2(a0),d5				
	move.l d5,480(sp)			
						
	move.l 476(sp),(a4)			
	move.l 480(sp),4(a4)			
						
	move.b d0,d2				
	subq.b #8,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L312				
	cmp.l 40(sp),a1				
	jbeq _?L312				
						
	lea (4,a0),a1				
	move.l a1,8(a4)				
						
	move.l 476(sp),d2			
	move.l 480(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,924(sp)			
	move.l d3,d6				
	or.b 3(a0),d6				
	move.l d6,928(sp)			
						
	move.l 924(sp),(a4)			
	move.l 928(sp),4(a4)			
						
	move.b d0,d2				
	add.b #-16,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L312				
	cmp.l 40(sp),a1				
	jbeq _?L312				
						
	lea (5,a0),a1				
	move.l a1,8(a4)				
						
	move.l 924(sp),d2			
	move.l 928(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,932(sp)			
	move.l d3,d7				
	or.b 4(a0),d7				
	move.l d7,936(sp)			
						
	move.l 932(sp),(a4)			
	move.l 936(sp),4(a4)			
						
	add.b #-24,d0				
	move.b d0,16(a4)			
						
	cmp.b #8,d0				
	jbne _?L312				
	cmp.l 40(sp),a1				
	jbeq _?L312				
						
	lea (6,a0),a1				
	move.l a1,8(a4)				
						
	clr.l d0				
	move.b 5(a0),d0				
						
	move.l 932(sp),d2			
	move.l 936(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
	clr.l d4				
	or.l d2,d4				
	move.l d4,(a4)				
	or.l d3,d0				
	move.l d0,4(a4)				
						
	clr.b 16(a4)				
_?L312:						
						
	clr.w d1				
	swap d1					
						
	addq.l #1,d1				
	move.l d1,20(a5)			
						
	jbra _?L304				
_?L845:						
						
	moveq #101,d0				
						
	move.l d0,22(a4)			
	jbra _?L106				
_?L848:						
						
	move.l d4,120(sp)			
	move.l d5,124(sp)			
	move.l d6,128(sp)			
	move.l d7,132(sp)			
	moveq #1,d4				
	move.l d4,18(a4)			
						
	move.l #200,22(a4)			
	moveq #1,d3				
	jbra _?L724				
_?L135:						
						
	moveq #-1,d3				
	move.l d3,18(a4)			
	move.w #-1,a6				
	jbra _?L80				
_?L352:						
						
	move.l a1,56(sp)			
	move.l 136(sp),40(sp)			
	move.w 34(a4),d0			
	addq.w #1,d0				
	move.w d0,34(a4)			
						
	and.l #65535,d0				
						
	clr.l d2				
	move.b 16(a1),d2			
						
	moveq #1,d1				
	lsl.l d2,d1				
	move.w #509,a0				
						
	cmp.l d0,d1				
	jbeq _?L859				
						
	move.l a0,22(a4)			
_?L867:						
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L349:						
						
	tst.b d6				
	jbeq _?L535				
						
	tst.l 136(sp)				
	jbeq _?L535				
						
	and.l #255,d6				
						
	sub.l a1,a1				
						
	clr.l d0				
	move.l 136(sp),d7			
_?L536:						
						
	lsl.l #2,d0				
	lea (a3,d0.l),a0			
						
	move.l (a0),d0				
	lsl.l d6,d0				
						
	move.l d0,(a0)				
						
	addq.w #1,a1				
						
	clr.l d0				
	move.w a1,d0				
	cmp.l d7,d0				
	jbcs _?L536				
	move.l d7,136(sp)			
_?L535:						
						
	addq.b #1,d1				
	move.b d1,40(a4)			
						
	move.b 28(a5),d6			
	move.w d6,a1				
						
	cmp.b d1,d6				
	jbls _?L860				
						
	move.l #500,22(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L360:						
						
	move.b 16(a4),d0			
	move.w d0,a5				
						
	cmp.b #24,d0				
	jbhi _?L814				
						
	clr.w 42(a4)				
						
	clr.l (a3)				
						
	move.l (a4),a2				
	move.l 4(a4),a3				
	move.l a2,d0				
	move.l a3,d1				
						
	move.w a5,d5				
	clr.l d4				
	move.b d5,d4				
						
	move.w #-32,a0				
	add.l d4,a0				
	tst.l a0				
	jblt _?L365				
	move.l a3,d6				
	move.l a0,d7				
	lsl.l d7,d6				
	move.l d6,348(sp)			
	clr.l 352(sp)				
_?L366:						
						
	move.w a5,d4				
	addq.b #1,d4				
						
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbls _?L367				
						
	move.l 12(a4),40(sp)			
						
	move.l 8(a4),a0				
						
	cmp.l 40(sp),a0				
	jbeq _?L368				
						
	move.l a0,d6				
	addq.l #1,d6				
	move.l d6,8(a4)				
						
	move.l a2,d4				
	move.l a3,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d0				
	move.l d5,d1				
	or.b (a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	move.w a5,d4				
	subq.b #7,d4				
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbls _?L367				
	cmp.l 40(sp),d6				
	jbeq _?L827				
						
	lea (2,a0),a2				
	move.l a2,8(a4)				
						
	move.l d0,d4				
	move.l d1,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d0				
	move.l d5,d1				
	or.b 1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	move.w a5,d4				
	add.b #-15,d4				
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbls _?L367				
	cmp.l 40(sp),a2				
	jbeq _?L827				
						
	lea (3,a0),a2				
	move.l a2,8(a4)				
						
	move.l d0,d4				
	move.l d1,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d0				
	move.l d5,d1				
	or.b 2(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	move.l 348(sp),d4			
	move.l 352(sp),d5			
	add.l d4,d4				
	clr.l d4				
	clr.l d5				
	addx.l d5,d5				
						
	move.b d5,56(sp)			
						
	move.b d5,d6				
	eor.b #1,d6				
	and.b #1,d6				
	move.w d6,a2				
						
	move.w a5,d4				
	add.b #-23,d4				
						
	and.l #255,d4				
						
	move.w #-32,a0				
	add.l d4,a0				
	tst.l a0				
	jblt _?L370				
	move.l d1,d7				
	move.l a0,d4				
	lsl.l d4,d7				
	move.l d7,244(sp)			
	clr.l 248(sp)				
						
	move.w a5,d4				
	add.b #-17,d4				
	move.w d4,a5				
						
	move.b d4,16(a4)			
_?L372:						
						
	move.l 244(sp),d4			
	move.l 248(sp),d5			
	moveq #26,d5				
	lsr.l d5,d4				
						
	move.b d4,d6				
	and.b #32,d6				
	jbeq _?L378				
						
	and.b #31,d4				
						
	addq.b #1,d4				
	move.b d4,4(a1)				
						
	moveq #3,d6				
	move.l d6,(a1)				
						
	move.l 64(a4),8(a1)			
	move.w #505,a0				
						
	move.l a0,22(a4)			
_?L383:						
						
	move.w a5,d4				
	clr.l d5				
	move.b d4,d5				
						
	move.w #-32,a0				
	add.l d5,a0				
	tst.l a0				
	jblt _?L386				
	move.l d1,d5				
	move.l a0,d6				
	lsl.l d6,d5				
	move.l d5,452(sp)			
	clr.l 456(sp)				
_?L387:						
						
	move.w a5,d6				
	addq.b #1,d6				
						
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbls _?L388				
						
	move.l 12(a4),a3			
						
	move.l 8(a4),a0				
	move.l 136(sp),d7			
_?L389:						
						
	cmp.l a3,a0				
	jbeq _?L788				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d0,d4				
	move.l d1,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d0				
	move.l d5,d1				
	or.b -1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d6				
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbhi _?L389				
_?L788:						
	move.l d7,136(sp)			
_?L388:						
						
	move.l 452(sp),d5			
	move.l 456(sp),d6			
	add.l d5,d5				
	clr.l d5				
	clr.l d6				
	addx.l d6,d6				
	move.l d5,56(sp)			
	move.l d6,60(sp)			
						
	move.b d6,5(a1)				
						
	or.l d5,d6				
	jbeq _?L391				
						
	move.b 63(sp),d7			
	move.l a1,104(sp)			
	move.w d2,a5				
	move.b d7,d5				
	move.l 136(sp),a3			
	move.l d3,112(sp)			
_?L399:						
						
	move.b 16(a4),d4			
	clr.l d6				
	move.b d4,d6				
						
	move.w #-32,a0				
	add.l d6,a0				
	tst.l a0				
	jblt _?L392				
	move.l d1,d2				
	move.l a0,d6				
	lsl.l d6,d2				
	clr.l d3				
_?L393:						
						
	addq.b #1,d4				
						
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbls _?L394				
						
	move.l 12(a4),a1			
						
	move.l 8(a4),a0				
_?L395:						
						
	cmp.l a1,a0				
	jbeq _?L394				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d0,d6				
	move.l d1,d7				
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d6,d0				
	move.l d7,d1				
	or.b -1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d4				
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbhi _?L395				
_?L394:						
						
	sub.l d4,d4				
	tst.l d3				
	subx.l d4,d2				
	jblt _?L861				
						
	addq.b #1,d5				
						
	cmp.b #31,d5				
	jbne _?L399				
						
	move.l 104(sp),a1			
	move.l a3,136(sp)			
	move.l d2,996(sp)			
	move.l d3,1000(sp)			
	move.w a5,d2				
	move.l 112(sp),d3			
	move.w a2,d7				
	tst.b d7				
	jbeq _?L400				
						
	move.b 63(sp),d0			
	move.w d0,a3				
_?L398:						
						
	move.w a3,d1				
	cmp.b d1,d2				
	jbls _?L400				
_?L401:						
						
	clr.l d0				
	move.b 4(a1),d0				
						
	cmp.l 136(sp),d0			
	jbhi _?L400				
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L358:						
						
	move.b 16(a4),d7			
						
	cmp.b #55,d7				
	jbhi _?L814				
						
	move.l (a4),a2				
	move.l 4(a4),a3				
	move.l a2,d4				
	move.l a3,d5				
						
	clr.l d0				
	move.b d7,d0				
						
	move.w #-32,a0				
	add.l d0,a0				
	tst.l a0				
	jblt _?L426				
	move.l a3,d6				
	move.l a0,d0				
	lsl.l d0,d6				
	move.l d6,412(sp)			
	clr.l 416(sp)				
_?L427:						
						
	move.b d7,d2				
	addq.b #4,d2				
						
	move.b d2,16(a4)			
						
	move.l 12(a4),40(sp)			
						
	move.l 8(a4),a0				
						
	cmp.b #7,d2				
	jbls _?L428				
	cmp.l 40(sp),a0				
	jbeq _?L428				
						
	lea (1,a0),a5				
	move.l a5,8(a4)				
						
	move.l a2,d0				
	move.l a3,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b (a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	move.b d7,d2				
	subq.b #4,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L429				
	cmp.l 40(sp),a5				
	jbeq _?L829				
						
	lea (2,a0),a2				
	move.l a2,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 1(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	move.b d7,d2				
	add.b #-12,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L429				
	cmp.l 40(sp),a2				
	jbeq _?L829				
						
	lea (3,a0),a2				
	move.l a2,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 2(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	move.b d7,d2				
	add.b #-20,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L429				
	cmp.l 40(sp),a2				
	jbeq _?L829				
						
	lea (4,a0),a2				
	move.l a2,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 3(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	move.b d7,d2				
	add.b #-28,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L429				
	cmp.l 40(sp),a2				
	jbeq _?L862				
						
	lea (5,a0),a2				
	move.l a2,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 4(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	move.b d7,d2				
	add.b #-36,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L429				
	cmp.l 40(sp),a2				
	jbeq _?L829				
						
	lea (6,a0),a2				
	move.l a2,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 5(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	move.b d7,d2				
	add.b #-44,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L429				
	cmp.l 40(sp),a2				
	jbeq _?L829				
						
	lea (7,a0),a2				
	move.l a2,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 6(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	move.b d7,d2				
	add.b #-52,d2				
_?L429:						
						
	move.l 412(sp),d0			
	move.l 416(sp),d1			
	moveq #28,d1				
	lsr.l d1,d0				
						
	move.b d0,d7				
						
	clr.l d1				
	move.b d2,d1				
						
	moveq #-32,d0				
	add.l d1,d0				
	jbmi _?L432				
	move.l d5,d1				
	lsl.l d0,d1				
	move.l d1,308(sp)			
	clr.l 312(sp)				
_?L433:						
						
	addq.b #5,d2				
						
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L438				
	move.l 8(a4),a0				
	move.l 40(sp),d6			
_?L437:						
	cmp.l d6,a0				
	jbeq _?L438				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b -1(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbhi _?L437				
_?L438:						
						
	move.l 308(sp),d0			
	move.l 312(sp),d1			
	moveq #27,d1				
	lsr.l d1,d0				
						
	cmp.b #15,d7				
	jbeq _?L822				
						
	addq.b #1,d7				
	move.b d7,6(a1)				
						
	eor.b #16,d0				
	add.b #-16,d0				
						
	move.b d0,7(a1)				
						
	jbmi _?L822				
						
	clr.b 33(a4)				
						
	move.l #507,22(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L357:						
						
	move.l a1,56(sp)			
	move.b 33(a4),d2			
						
	move.b 4(a1),112(sp)			
						
	cmp.b 112(sp),d2			
	jbcc _?L448				
						
	move.b 6(a1),104(sp)			
	clr.l d0				
	move.b 104(sp),d0			
	move.l d0,a5				
						
	move.b 16(a4),d0			
	clr.l d1				
	move.b d0,d1				
						
	lea (a5,d1.l),a0			
						
	moveq #64,d4				
	cmp.l a0,d4				
	jblt _?L814				
						
	move.b 104(sp),d4			
	subq.b #1,d4				
	cmp.b #56,d4				
	jbhi _?L442				
	move.b d2,d5				
	addq.b #1,d5				
	and.l #255,d2				
	lsl.l #2,d2				
	move.l d2,a2				
						
	move.l a5,d2				
	subq.l #1,d2				
	moveq #1,d4				
	lsl.l d2,d4				
	move.l d4,a3				
	moveq #64,d6				
	sub.l a5,d6				
	move.l d6,136(sp)			
						
	moveq #32,d2				
	sub.l a5,d2				
	lea (-33,a5),a0				
	move.l a0,156(sp)			
	move.l a6,240(sp)			
	move.l 56(sp),a6			
	move.b d5,d7				
	move.l d3,56(sp)			
	move.l d2,a1				
						
	move.l (a4),d2				
	move.l 4(a4),d3				
						
	move.w #-32,a0				
	add.l d1,a0				
	tst.l a0				
	jblt _?L443				
_?L864:						
	move.l d3,d6				
	move.l a0,d1				
	lsl.l d1,d6				
	clr.l 40(sp)				
_?L444:						
						
	add.b 104(sp),d0			
						
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L451				
						
	move.l 12(a4),d1			
						
	move.l 8(a4),a0				
_?L450:						
						
	cmp.l d1,a0				
	jbeq _?L451				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d2,d4				
	move.l d3,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d2				
	move.l d5,d3				
	or.b -1(a0),d3				
						
	move.l d2,(a4)				
	move.l d3,4(a4)				
						
	subq.b #8,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbhi _?L450				
_?L451:						
						
	move.l 8(a6),a0				
						
	tst.l a1				
	jblt _?L446				
	move.l a1,d5				
	lsr.l d5,d6				
_?L447:						
						
	move.l a3,d2				
	eor.l d2,d6				
	sub.l a3,d6				
	move.l d6,(a0,a2.l)			
						
	move.b d7,33(a4)			
						
	move.b d7,d2				
	addq.b #1,d2				
	addq.l #4,a2				
	cmp.b 112(sp),d7			
	jbeq _?L796				
						
	move.b 16(a4),d0			
	clr.l d1				
	move.b d0,d1				
						
	lea (a5,d1.l),a0			
						
	moveq #64,d3				
	cmp.l a0,d3				
	jblt _?L863				
	move.b d2,d7				
						
	move.l (a4),d2				
	move.l 4(a4),d3				
						
	move.w #-32,a0				
	add.l d1,a0				
	tst.l a0				
	jbge _?L864				
_?L443:						
	moveq #31,d5				
	sub.l d1,d5				
	move.l d3,d4				
	lsr.l #1,d4				
	lsr.l d5,d4				
	move.l d2,d6				
	lsl.l d1,d6				
	or.l d4,d6				
	move.l d3,d4				
	lsl.l d1,d4				
	move.l d4,40(sp)			
	jbra _?L444				
_?L359:						
						
	move.l 136(sp),40(sp)			
	move.w d5,a2				
	move.b 16(a4),d5			
	clr.l d4				
	move.b d5,d4				
						
	move.w a2,d6				
	clr.l d7				
	move.b d6,d7				
						
	move.l d7,d0				
	add.l d4,d0				
						
	moveq #64,d1				
	cmp.l d0,d1				
	jblt _?L865				
						
	move.l (a4),d0				
	move.l 4(a4),d1				
						
	move.w #-32,a0				
	add.l d4,a0				
	tst.l a0				
	jblt _?L403				
	move.l d1,d4				
	move.l a0,d6				
	lsl.l d6,d4				
	move.l d4,a5				
	sub.l a1,a1				
_?L404:						
						
	move.w a2,d2				
	add.b d5,d2				
						
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L411				
						
	move.l 12(a4),d6			
						
	move.l 8(a4),a0				
_?L410:						
						
	cmp.l d6,a0				
	jbeq _?L411				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d0,d4				
	move.l d1,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d0				
	move.l d5,d1				
	or.b -1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbhi _?L410				
_?L411:						
						
	move.l d7,d1				
	subq.l #1,d1				
	moveq #1,d0				
	lsl.l d1,d0				
						
	moveq #64,d4				
	sub.l d7,d4				
						
	moveq #32,d1				
	sub.l d7,d1				
	jbmi _?L406				
	move.l a5,d2				
	lsr.l d1,d2				
_?L407:						
						
	eor.l d0,d2				
	sub.l d0,d2				
						
	move.l d2,(a3)				
						
	moveq #1,d7				
	cmp.l 40(sp),d7				
	jbcc _?L409				
						
	move.l d2,4(a3)				
						
	moveq #2,d0				
	cmp.l 40(sp),d0				
	jbeq _?L409				
						
	moveq #2,d1				
						
	move.l 40(sp),a0			
_?L413:						
						
	move.l (a3),(a3,d0.l*4)			
						
	addq.w #1,d1				
						
	clr.l d0				
	move.w d1,d0				
	cmp.l a0,d0				
	jbcs _?L413				
_?L409:						
						
	move.l #515,22(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L355:						
						
	move.b 16(a4),d6			
						
	cmp.b #54,d6				
	jbhi _?L814				
						
	tst.l 12(a1)				
	jbne _?L601				
	move.w #15,a2				
	move.w #60,a5				
	moveq #4,d2				
_?L467:						
						
	move.l (a4),d4				
	move.l 4(a4),d5				
						
	clr.l d0				
	move.b d6,d0				
						
	move.w #-32,a0				
	add.l d0,a0				
	tst.l a0				
	jblt _?L468				
	move.l d5,d0				
	move.l a0,d1				
	lsl.l d1,d0				
	move.l d0,a3				
	clr.l 40(sp)				
_?L469:						
						
	add.b d2,d6				
						
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbls _?L470				
						
	move.l 12(a4),d2			
						
	move.l 8(a4),a0				
	move.l 136(sp),d7			
_?L471:						
						
	cmp.l d2,a0				
	jbeq _?L472				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b -1(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d6				
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbhi _?L471				
_?L472:						
						
	move.l d7,136(sp)			
	lea (-32,a5),a0				
	tst.l a0				
	jblt _?L474				
	move.l a3,d0				
	move.l a0,d2				
	lsr.l d2,d0				
						
	move.b d0,17(a1)			
						
	cmp.l a2,d0				
	jbeq _?L866				
_?L476:						
						
	move.l #511,22(a4)			
						
	clr.w 38(a4)				
_?L480:						
						
	clr.l d0				
	move.b 16(a1),d0			
						
	move.l 136(sp),d1			
	lsr.l d0,d1				
						
	move.w d1,d0				
	move.w d1,36(a4)			
						
	tst.w 34(a4)				
	jbne _?L485				
						
	clr.w d2				
	move.b 4(a1),d2				
						
	cmp.w d1,d2				
	jbhi _?L487				
						
	sub.w d2,d0				
	move.w d0,36(a4)			
_?L485:						
						
	clr.l d1				
	move.w 42(a4),d1			
						
	and.l #65535,d0				
						
	add.l d1,d0				
						
	cmp.l 136(sp),d0			
	jbls _?L77				
_?L487:						
						
	moveq #3,d0				
	move.l d0,18(a4)			
						
	move.l #300,22(a4)			
	moveq #3,d3				
	jbra _?L724				
_?L353:						
						
	move.b 17(a1),d6			
						
	move.w 36(a4),d7			
						
	jbeq _?L524				
						
	move.b d6,d0				
	subq.b #1,d0				
	move.b d0,56(sp)			
						
	clr.l d1				
	move.b d6,d1				
	move.l d1,a2				
	move.l a2,d0				
	subq.l #1,d0				
	moveq #1,d1				
	lsl.l d0,d1				
	move.l d1,a5				
						
	moveq #64,d2				
	sub.l a2,d2				
	move.l d2,112(sp)			
						
	moveq #32,d4				
	sub.l a2,d4				
	move.l d4,40(sp)			
	lea (-33,a2),a0				
	move.l a0,136(sp)			
	move.l a6,240(sp)			
	move.l d3,156(sp)			
_?L523:						
						
	tst.b d6				
	jbne _?L512				
						
	move.w 42(a4),d0			
						
	clr.l d1				
	move.w d0,d1				
	lsl.l #2,d1				
	lea (a3,d1.l),a0			
						
	clr.l (a0)				
	clr.l d1				
_?L513:						
						
	move.l d1,(a0)				
						
	addq.w #1,d0				
	move.w d0,42(a4)			
						
	subq.w #1,d7				
	move.w d7,36(a4)			
						
	jbne _?L523				
	move.l 240(sp),a6			
	move.l 156(sp),d3			
_?L524:						
						
	move.l #513,22(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L118:						
						
	moveq #31,d5				
	sub.l d2,d5				
	move.l d1,d4				
	lsr.l #1,d4				
	lsr.l d5,d4				
	move.l d0,d5				
	lsl.l d2,d5				
	move.l d5,168(sp)			
	or.l d4,168(sp)				
	move.l d1,d4				
	lsl.l d2,d4				
	move.l d4,172(sp)			
	jbra _?L119				
_?L849:						
						
	move.l (a4),d0				
	move.l 4(a4),d1				
						
	move.b 16(a4),d4			
	clr.l d2				
	move.b d4,d2				
						
	move.w #-32,a0				
	add.l d2,a0				
	tst.l a0				
	jblt _?L318				
	move.l d1,d2				
	move.l a0,d3				
	lsl.l d3,d2				
	move.l d2,388(sp)			
	clr.l 392(sp)				
_?L319:						
						
	addq.b #8,d4				
						
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbls _?L322				
						
	move.l 12(a4),40(sp)			
						
	move.l 8(a4),a0				
	move.l 40(sp),d6			
_?L321:						
						
	cmp.l d6,a0				
	jbeq _?L322				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b -1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d4				
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbhi _?L321				
_?L322:						
						
	move.l 388(sp),d0			
	move.l 392(sp),d1			
	moveq #24,d1				
	lsr.l d1,d0				
	move.l d0,d1				
						
	lsl.l #5,d0				
	sub.l d1,d0				
	lsl.l #2,d0				
	add.l d1,d0				
	lsl.l #3,d0				
	move.l d0,24(a5)			
						
	move.l #403,d0				
	jbra _?L281				
_?L283:						
						
	moveq #31,d5				
	sub.l d2,d5				
	move.l d1,d3				
	lsr.l #1,d3				
	lsr.l d5,d3				
	move.l d0,d5				
	lsl.l d2,d5				
	move.l d5,276(sp)			
	or.l d3,276(sp)				
	move.l d1,d6				
	lsl.l d2,d6				
	move.l d6,280(sp)			
						
	addq.b #8,d4				
						
	move.b d4,16(a4)			
						
	move.l 12(a4),40(sp)			
						
	move.l 8(a4),a0				
	move.l 40(sp),d6			
	jbra _?L285				
_?L235:						
						
	moveq #31,d7				
	sub.l d5,d7				
	move.l d3,d6				
	lsr.l #1,d6				
	lsr.l d7,d6				
	move.l d2,d7				
	lsl.l d5,d7				
	move.l d7,232(sp)			
	or.l d6,232(sp)				
	move.l d3,d6				
	lsl.l d5,d6				
	move.l d6,236(sp)			
	jbra _?L236				
_?L224:						
						
	moveq #31,d3				
	sub.l d0,d3				
	move.l a3,d1				
	lsr.l #1,d1				
	lsr.l d3,d1				
	move.l a2,d7				
	lsl.l d0,d7				
	move.l d7,292(sp)			
	or.l d1,292(sp)				
	move.l a3,d1				
	lsl.l d0,d1				
	move.l d1,296(sp)			
	jbra _?L225				
_?L859:						
						
	move.b 7(a1),d5				
	extb.l d5				
	move.l d5,104(sp)			
						
	move.b 4(a1),d6				
						
	move.l 8(a1),d7				
						
	clr.l d0				
	move.b d6,d0				
						
	cmp.l 40(sp),d0				
	jbcc _?L526				
	move.l d0,d2				
	lsl.l #2,d2				
	lea (a3,d2.l),a2			
	move.l d0,a3				
	add.l #1073741823,a3			
	move.l 40(sp),d0			
	add.l #1073741823,d0			
	move.l d0,40(sp)			
	add.l d7,d2				
						
	move.w #-32,a5				
	add.l d5,a5				
	moveq #31,d1				
	sub.l d5,d1				
	move.l d1,56(sp)			
	move.l a4,112(sp)			
	move.l a6,136(sp)			
	move.l d2,a4				
	move.l d3,a6				
	move.l 1004(sp),d0			
	move.l 1008(sp),d1			
_?L527:						
						
	clr.l d2				
	tst.b d6				
	jbeq _?L531				
	move.l a2,a1				
	move.l d7,a0				
						
	clr.l d2				
	clr.l d3				
_?L528:						
						
	move.l (a0)+,d5				
						
	move.l -(a1),d4				
	move.l d5,d1				
	muls.l d4,d0:d1				
						
	add.l d1,d3				
	addx.l d0,d2				
						
	cmp.l a0,a4				
	jbne _?L528				
						
	tst.l a5				
	jblt _?L529				
	move.l a5,d4				
	asr.l d4,d2				
_?L531:						
						
	move.l (a2),a0				
						
	add.l a0,d2				
	move.l d2,(a2)+				
						
	addq.l #1,a3				
	cmp.l 40(sp),a3				
	jbne _?L527				
	move.l 112(sp),a4			
	move.l a6,d3				
	move.l 136(sp),a6			
	move.l d0,1004(sp)			
	move.l d1,1008(sp)			
_?L526:						
	move.w #515,a0				
						
	move.l a0,22(a4)			
	jbra _?L867				
_?L853:						
						
	move.l d2,30(a5)			
	move.l d3,34(a5)			
_?L291:						
						
	move.l #402,d0				
_?L868:						
						
	move.l d0,22(a4)			
	moveq #3,d3				
	jbra _?L724				
_?L144:						
						
	move.l #201,22(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L142:						
						
	move.b 16(a4),d2			
						
	move.l 52(a4),a3			
						
	cmp.b #28,d2				
	jbhi _?L192				
						
	move.l (a4),d4				
	move.l 4(a4),d5				
						
	clr.l d0				
	move.b d2,d0				
						
	move.w #-32,a0				
	add.l d0,a0				
	tst.l a0				
	jblt _?L193				
	move.l d5,d7				
	move.l a0,d6				
	lsl.l d6,d7				
	sub.l a1,a1				
_?L194:						
						
	move.b d2,d6				
	add.b #36,d6				
	move.b d6,16(a4)			
						
	move.l 12(a4),d6			
						
	move.l 8(a4),a0				
						
	cmp.l d6,a0				
	jbeq _?L195				
						
	lea (1,a0),a2				
	move.l a2,8(a4)				
						
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,844(sp)			
	move.l d5,d0				
	or.b (a0),d0				
	move.l d0,848(sp)			
						
	move.l 844(sp),(a4)			
	move.l 848(sp),4(a4)			
						
	move.b d2,d1				
	add.b #28,d1				
	move.b d1,16(a4)			
						
	cmp.l d6,a2				
	jbeq _?L195				
						
	move.l a0,d4				
	addq.l #2,d4				
	move.l d4,8(a4)				
						
	move.l 844(sp),d0			
	move.l 848(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,836(sp)			
	move.l d1,d5				
	or.b 1(a0),d5				
	move.l d5,840(sp)			
						
	move.l 836(sp),(a4)			
	move.l 840(sp),4(a4)			
						
	move.b d2,d0				
	add.b #20,d0				
	move.b d0,16(a4)			
						
	cmp.l d6,d4				
	jbeq _?L195				
						
	addq.l #1,d4				
	move.l d4,8(a4)				
						
	move.l 836(sp),d0			
	move.l 840(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,828(sp)			
	move.l d1,d5				
	or.b 2(a0),d5				
	move.l d5,832(sp)			
						
	move.l 828(sp),(a4)			
	move.l 832(sp),4(a4)			
						
	move.b d2,d0				
	add.b #12,d0				
	move.b d0,16(a4)			
						
	cmp.l d6,d4				
	jbeq _?L195				
						
	addq.l #1,d4				
	move.l d4,8(a4)				
						
	move.l 828(sp),d0			
	move.l 832(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,820(sp)			
	move.l d1,d5				
	or.b 3(a0),d5				
	move.l d5,824(sp)			
						
	move.l 820(sp),(a4)			
	move.l 824(sp),4(a4)			
						
	move.b d2,d0				
	addq.b #4,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L195				
	cmp.l d6,d4				
	jbeq _?L195				
						
	addq.l #1,d4				
	move.l d4,8(a4)				
						
	move.l 820(sp),d0			
	move.l 824(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,812(sp)			
	move.l d1,d5				
	or.b 4(a0),d5				
	move.l d5,816(sp)			
						
	move.l 812(sp),(a4)			
	move.l 816(sp),4(a4)			
						
	move.b d2,d0				
	subq.b #4,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L195				
	cmp.l d6,d4				
	jbeq _?L195				
						
	addq.l #1,d4				
	move.l d4,8(a4)				
						
	move.l 812(sp),d0			
	move.l 816(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,796(sp)			
	move.l d1,d5				
	or.b 5(a0),d5				
	move.l d5,800(sp)			
						
	move.l 796(sp),(a4)			
	move.l 800(sp),4(a4)			
						
	move.b d2,d0				
	add.b #-12,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L195				
	cmp.l d6,d4				
	jbeq _?L195				
						
	addq.l #1,d4				
	move.l d4,8(a4)				
						
	move.l 796(sp),d0			
	move.l 800(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,772(sp)			
	move.l d1,d5				
	or.b 6(a0),d5				
	move.l d5,776(sp)			
						
	move.l 772(sp),(a4)			
	move.l 776(sp),4(a4)			
						
	add.b #-20,d2				
	move.b d2,16(a4)			
						
	cmp.b #8,d2				
	jbne _?L195				
	cmp.l d6,d4				
	jbeq _?L195				
						
	lea (8,a0),a2				
	move.l a2,8(a4)				
						
	clr.l d2				
	move.b 7(a0),d2				
						
	move.l 772(sp),d0			
	move.l 776(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	clr.l d4				
	or.l d0,d4				
	move.l d4,(a4)				
	or.l d1,d2				
	move.l d2,4(a4)				
						
	clr.b 16(a4)				
_?L195:						
						
	move.l d7,d0				
	lsl.l #4,d0				
	move.l a1,d1				
	moveq #28,d5				
	lsr.l d5,d1				
	or.l d0,d1				
	move.l d1,22(a3)			
	lsr.l d5,d7				
	move.l d7,18(a3)			
						
	moveq #16,d6				
	move.l d6,26(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L138:						
						
	move.b 16(a4),d2			
						
	move.l 52(a4),a3			
						
	cmp.b #48,d2				
	jbhi _?L153				
						
	move.l (a4),d4				
	move.l 4(a4),d5				
						
	clr.l d1				
	move.b d2,d1				
						
	move.w #-32,a0				
	add.l d1,a0				
	tst.l a0				
	jblt _?L154				
	move.l d5,d7				
	move.l a0,d6				
	lsl.l d6,d7				
_?L155:						
						
	move.b d2,d0				
	add.b #16,d0				
	move.b d0,16(a4)			
						
	move.l 12(a4),d6			
						
	move.l 8(a4),a0				
						
	cmp.l d6,a0				
	jbeq _?L156				
						
	lea (1,a0),a1				
	move.l a1,8(a4)				
						
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,612(sp)			
	move.l d5,d1				
	or.b (a0),d1				
	move.l d1,616(sp)			
						
	move.l 612(sp),(a4)			
	move.l 616(sp),4(a4)			
						
	move.b d2,d4				
	addq.b #8,d4				
	move.b d4,16(a4)			
						
	cmp.l d6,a1				
	jbeq _?L156				
						
	lea (2,a0),a1				
	move.l a1,8(a4)				
						
	move.l 612(sp),d0			
	move.l 616(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,604(sp)			
	move.l d1,d5				
	or.b 1(a0),d5				
	move.l d5,608(sp)			
						
	move.l 604(sp),(a4)			
	move.l 608(sp),4(a4)			
						
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L156				
	cmp.l d6,a1				
	jbeq _?L156				
						
	lea (3,a0),a1				
	move.l a1,8(a4)				
						
	move.l 604(sp),d0			
	move.l 608(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,596(sp)			
	move.l d1,d4				
	or.b 2(a0),d4				
	move.l d4,600(sp)			
						
	move.l 596(sp),(a4)			
	move.l 600(sp),4(a4)			
						
	move.b d2,d0				
	subq.b #8,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L156				
	cmp.l d6,a1				
	jbeq _?L156				
						
	lea (4,a0),a1				
	move.l a1,8(a4)				
						
	move.l 596(sp),d0			
	move.l 600(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,588(sp)			
	move.l d1,d5				
	or.b 3(a0),d5				
	move.l d5,592(sp)			
						
	move.l 588(sp),(a4)			
	move.l 592(sp),4(a4)			
						
	move.b d2,d0				
	add.b #-16,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L156				
	cmp.l d6,a1				
	jbeq _?L156				
						
	lea (5,a0),a1				
	move.l a1,8(a4)				
						
	move.l 588(sp),d0			
	move.l 592(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,572(sp)			
	move.l d1,d4				
	or.b 4(a0),d4				
	move.l d4,576(sp)			
						
	move.l 572(sp),(a4)			
	move.l 576(sp),4(a4)			
						
	move.b d2,d0				
	add.b #-24,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L156				
	cmp.l d6,a1				
	jbeq _?L156				
						
	lea (6,a0),a1				
	move.l a1,8(a4)				
						
	move.l 572(sp),d0			
	move.l 576(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,564(sp)			
	move.l d1,d5				
	or.b 5(a0),d5				
	move.l d5,568(sp)			
						
	move.l 564(sp),(a4)			
	move.l 568(sp),4(a4)			
						
	move.b d2,d0				
	add.b #-32,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L156				
	cmp.l a1,d6				
	jbeq _?L156				
						
	lea (7,a0),a1				
	move.l a1,8(a4)				
						
	move.l 564(sp),d0			
	move.l 568(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,548(sp)			
	move.l d1,d4				
	or.b 6(a0),d4				
	move.l d4,552(sp)			
						
	move.l 548(sp),(a4)			
	move.l 552(sp),4(a4)			
						
	add.b #-40,d2				
	move.b d2,16(a4)			
						
	cmp.b #8,d2				
	jbne _?L156				
	cmp.l a1,d6				
	jbeq _?L156				
						
	lea (8,a0),a1				
	move.l a1,8(a4)				
						
	clr.l d2				
	move.b 7(a0),d2				
						
	move.l 548(sp),d0			
	move.l 552(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	clr.l d4				
	or.l d0,d4				
	move.l d4,(a4)				
	or.l d1,d2				
	move.l d2,4(a4)				
						
	clr.b 16(a4)				
_?L156:						
						
	clr.w d7				
	swap d7					
						
	move.w d7,2(a3)				
						
	moveq #30,d5				
	move.l d5,26(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L139:						
						
	move.b 16(a4),d2			
						
	move.l 52(a4),a3			
						
	cmp.b #40,d2				
	jbhi _?L159				
						
	move.l (a4),d4				
	move.l 4(a4),d5				
						
	clr.l d1				
	move.b d2,d1				
						
	move.w #-32,a0				
	add.l d1,a0				
	tst.l a0				
	jblt _?L160				
	move.l d5,d7				
	move.l a0,d6				
	lsl.l d6,d7				
_?L161:						
						
	move.b d2,d0				
	add.b #24,d0				
	move.b d0,16(a4)			
						
	move.l 12(a4),d6			
						
	move.l 8(a4),a0				
						
	cmp.l d6,a0				
	jbeq _?L162				
						
	lea (1,a0),a1				
	move.l a1,8(a4)				
						
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,684(sp)			
	move.l d5,d1				
	or.b (a0),d1				
	move.l d1,688(sp)			
						
	move.l 684(sp),(a4)			
	move.l 688(sp),4(a4)			
						
	move.b d2,d4				
	add.b #16,d4				
	move.b d4,16(a4)			
						
	cmp.l d6,a1				
	jbeq _?L162				
						
	lea (2,a0),a1				
	move.l a1,8(a4)				
						
	move.l 684(sp),d0			
	move.l 688(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,676(sp)			
	move.l d1,d5				
	or.b 1(a0),d5				
	move.l d5,680(sp)			
						
	move.l 676(sp),(a4)			
	move.l 680(sp),4(a4)			
						
	move.b d2,d0				
	addq.b #8,d0				
	move.b d0,16(a4)			
						
	cmp.l d6,a1				
	jbeq _?L162				
						
	lea (3,a0),a1				
	move.l a1,8(a4)				
						
	move.l 676(sp),d0			
	move.l 680(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,668(sp)			
	move.l d1,d4				
	or.b 2(a0),d4				
	move.l d4,672(sp)			
						
	move.l 668(sp),(a4)			
	move.l 672(sp),4(a4)			
						
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L162				
	cmp.l d6,a1				
	jbeq _?L162				
						
	lea (4,a0),a1				
	move.l a1,8(a4)				
						
	move.l 668(sp),d0			
	move.l 672(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,660(sp)			
	move.l d1,d5				
	or.b 3(a0),d5				
	move.l d5,664(sp)			
						
	move.l 660(sp),(a4)			
	move.l 664(sp),4(a4)			
						
	move.b d2,d0				
	subq.b #8,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L162				
	cmp.l d6,a1				
	jbeq _?L162				
						
	lea (5,a0),a1				
	move.l a1,8(a4)				
						
	move.l 660(sp),d0			
	move.l 664(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,636(sp)			
	move.l d1,d4				
	or.b 4(a0),d4				
	move.l d4,640(sp)			
						
	move.l 636(sp),(a4)			
	move.l 640(sp),4(a4)			
						
	move.b d2,d0				
	add.b #-16,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L162				
	cmp.l d6,a1				
	jbeq _?L162				
						
	lea (6,a0),a1				
	move.l a1,8(a4)				
						
	move.l 636(sp),d0			
	move.l 640(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,628(sp)			
	move.l d1,d5				
	or.b 5(a0),d5				
	move.l d5,632(sp)			
						
	move.l 628(sp),(a4)			
	move.l 632(sp),4(a4)			
						
	move.b d2,d0				
	add.b #-24,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L162				
	cmp.l d6,a1				
	jbeq _?L162				
						
	lea (7,a0),a1				
	move.l a1,8(a4)				
						
	move.l 628(sp),d0			
	move.l 632(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,620(sp)			
	move.l d1,d4				
	or.b 6(a0),d4				
	move.l d4,624(sp)			
						
	move.l 620(sp),(a4)			
	move.l 624(sp),4(a4)			
						
	add.b #-32,d2				
	move.b d2,16(a4)			
						
	cmp.b #8,d2				
	jbne _?L162				
	cmp.l d6,a1				
	jbeq _?L162				
						
	lea (8,a0),a1				
	move.l a1,8(a4)				
						
	clr.l d2				
	move.b 7(a0),d2				
						
	move.l 620(sp),d0			
	move.l 624(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	clr.l d4				
	or.l d0,d4				
	move.l d4,(a4)				
	or.l d1,d2				
	move.l d2,4(a4)				
						
	clr.b 16(a4)				
_?L162:						
						
	lsr.l #8,d7				
						
	move.l d7,4(a3)				
						
	moveq #27,d5				
	move.l d5,26(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L140:						
						
	move.b 16(a4),d2			
						
	move.l 52(a4),a3			
						
	cmp.b #40,d2				
	jbhi _?L165				
						
	move.l (a4),d4				
	move.l 4(a4),d5				
						
	clr.l d1				
	move.b d2,d1				
						
	move.w #-32,a0				
	add.l d1,a0				
	tst.l a0				
	jblt _?L166				
	move.l d5,d7				
	move.l a0,d0				
	lsl.l d0,d7				
_?L167:						
						
	move.b d2,d1				
	add.b #24,d1				
	move.b d1,16(a4)			
						
	move.l 12(a4),d6			
						
	move.l 8(a4),a0				
						
	cmp.l d6,a0				
	jbeq _?L168				
						
	lea (1,a0),a1				
	move.l a1,8(a4)				
						
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,756(sp)			
	move.l d5,d0				
	or.b (a0),d0				
	move.l d0,760(sp)			
						
	move.l 756(sp),(a4)			
	move.l 760(sp),4(a4)			
						
	subq.b #8,d1				
	move.b d1,16(a4)			
						
	cmp.l d6,a1				
	jbeq _?L168				
						
	lea (2,a0),a1				
	move.l a1,8(a4)				
						
	move.l 756(sp),d0			
	move.l 760(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,748(sp)			
	move.l d1,d4				
	or.b 1(a0),d4				
	move.l d4,752(sp)			
						
	move.l 748(sp),(a4)			
	move.l 752(sp),4(a4)			
						
	move.b d2,d5				
	addq.b #8,d5				
	move.b d5,16(a4)			
						
	cmp.l d6,a1				
	jbeq _?L168				
						
	lea (3,a0),a1				
	move.l a1,8(a4)				
						
	move.l 748(sp),d0			
	move.l 752(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,732(sp)			
	move.l d1,d4				
	or.b 2(a0),d4				
	move.l d4,736(sp)			
						
	move.l 732(sp),(a4)			
	move.l 736(sp),4(a4)			
						
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L168				
	cmp.l d6,a1				
	jbeq _?L168				
						
	lea (4,a0),a1				
	move.l a1,8(a4)				
						
	move.l 732(sp),d0			
	move.l 736(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,724(sp)			
	move.l d1,d5				
	or.b 3(a0),d5				
	move.l d5,728(sp)			
						
	move.l 724(sp),(a4)			
	move.l 728(sp),4(a4)			
						
	move.b d2,d0				
	subq.b #8,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L168				
	cmp.l d6,a1				
	jbeq _?L168				
						
	lea (5,a0),a1				
	move.l a1,8(a4)				
						
	move.l 724(sp),d0			
	move.l 728(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,716(sp)			
	move.l d1,d4				
	or.b 4(a0),d4				
	move.l d4,720(sp)			
						
	move.l 716(sp),(a4)			
	move.l 720(sp),4(a4)			
						
	move.b d2,d0				
	add.b #-16,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L168				
	cmp.l d6,a1				
	jbeq _?L168				
						
	lea (6,a0),a1				
	move.l a1,8(a4)				
						
	move.l 716(sp),d0			
	move.l 720(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,708(sp)			
	move.l d1,d5				
	or.b 5(a0),d5				
	move.l d5,712(sp)			
						
	move.l 708(sp),(a4)			
	move.l 712(sp),4(a4)			
						
	move.b d2,d0				
	add.b #-24,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L168				
	cmp.l d6,a1				
	jbeq _?L168				
						
	lea (7,a0),a1				
	move.l a1,8(a4)				
						
	move.l 708(sp),d0			
	move.l 712(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,700(sp)			
	move.l d1,d4				
	or.b 6(a0),d4				
	move.l d4,704(sp)			
						
	move.l 700(sp),(a4)			
	move.l 704(sp),4(a4)			
						
	add.b #-32,d2				
	move.b d2,16(a4)			
						
	cmp.b #8,d2				
	jbne _?L168				
	cmp.l d6,a1				
	jbeq _?L168				
						
	lea (8,a0),a1				
	move.l a1,8(a4)				
						
	clr.l d2				
	move.b 7(a0),d2				
						
	move.l 700(sp),d0			
	move.l 704(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	clr.l d4				
	or.l d0,d4				
	move.l d4,(a4)				
	or.l d1,d2				
	move.l d2,4(a4)				
						
	clr.b 16(a4)				
_?L168:						
						
	lsr.l #8,d7				
						
	move.l d7,8(a3)				
						
	moveq #24,d5				
	move.l d5,26(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L141:						
						
	move.b 16(a4),d2			
						
	cmp.b #36,d2				
	jbhi _?L814				
						
	move.l (a4),d4				
	move.l 4(a4),d5				
						
	clr.l d1				
	move.b d2,d1				
						
	moveq #-32,d0				
	add.l d1,d0				
	jbmi _?L172				
	move.l d5,d7				
	lsl.l d0,d7				
	move.l d7,340(sp)			
	clr.l 344(sp)				
_?L173:						
						
	move.b d2,d7				
	add.b #20,d7				
						
	move.b d7,16(a4)			
						
	move.l 12(a4),d6			
						
	move.l 8(a4),a0				
						
	cmp.l d6,a0				
	jbeq _?L593				
						
	lea (1,a0),a3				
	move.l a3,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b (a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.l d6,a3				
	jbeq _?L174				
						
	lea (2,a0),a3				
	move.l a3,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 1(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L175				
	cmp.l d6,a3				
	jbeq _?L174				
						
	lea (3,a0),a3				
	move.l a3,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 2(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L175				
	cmp.l d6,a3				
	jbeq _?L174				
						
	lea (4,a0),a3				
	move.l a3,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 3(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L175				
	cmp.l d6,a3				
	jbeq _?L174				
						
	lea (5,a0),a3				
	move.l a3,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 4(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L175				
	cmp.l d6,a3				
	jbeq _?L174				
						
	lea (6,a0),a3				
	move.l a3,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 5(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #8,d7				
	jbne _?L175				
	cmp.l d6,a3				
	jbeq _?L174				
						
	lea (7,a0),a3				
	move.l a3,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b 6(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	move.l 52(a4),a5			
						
	move.l 340(sp),d0			
	move.l 344(sp),d1			
	moveq #12,d1				
	lsr.l d1,d0				
						
	move.l d0,12(a5)			
						
	move.l d4,300(sp)			
	move.l d5,304(sp)			
						
	moveq #3,d7				
_?L177:						
						
	move.l 300(sp),d0			
	move.l 304(sp),d1			
	moveq #29,d1				
	lsr.l d1,d0				
						
	move.b d0,d2				
	addq.b #1,d2				
	move.b d2,16(a5)			
						
	clr.l d0				
	move.b d7,d0				
						
	move.l d0,-(sp)				
	move.l d5,-(sp)				
	move.l d4,-(sp)				
	jbsr ___ashldi3				
	lea (12,sp),sp				
	move.l d0,324(sp)			
	move.l d1,328(sp)			
						
	addq.b #5,d7				
						
	move.b d7,16(a4)			
_?L188:						
						
	cmp.l d6,a3				
	jbeq _?L189				
						
	addq.l #1,a3				
	move.l a3,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b -1(a3),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbhi _?L188				
_?L189:						
						
	move.l 324(sp),d0			
	move.l 328(sp),d1			
	moveq #27,d1				
	lsr.l d1,d0				
						
	move.b d0,d2				
	addq.b #1,d2				
	move.b d2,17(a5)			
						
	moveq #20,d4				
	move.l d4,26(a4)			
_?L872:						
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L136:						
						
	move.b 16(a4),d2			
						
	move.l 52(a4),a3			
						
	cmp.b #48,d2				
	jbhi _?L145				
						
	move.l (a4),d4				
	move.l 4(a4),d5				
						
	clr.l d1				
	move.b d2,d1				
						
	move.w #-32,a0				
	add.l d1,a0				
	tst.l a0				
	jblt _?L146				
	move.l d5,d7				
	move.l a0,d0				
	lsl.l d0,d7				
_?L147:						
						
	move.b d2,d1				
	add.b #16,d1				
	move.b d1,16(a4)			
						
	move.l 12(a4),d6			
						
	move.l 8(a4),a0				
						
	cmp.l d6,a0				
	jbeq _?L148				
						
	lea (1,a0),a1				
	move.l a1,8(a4)				
						
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,540(sp)			
	move.l d5,d0				
	or.b (a0),d0				
	move.l d0,544(sp)			
						
	move.l 540(sp),(a4)			
	move.l 544(sp),4(a4)			
						
	subq.b #8,d1				
	move.b d1,16(a4)			
						
	cmp.l a1,d6				
	jbeq _?L148				
						
	lea (2,a0),a1				
	move.l a1,8(a4)				
						
	move.l 540(sp),d0			
	move.l 544(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,532(sp)			
	move.l d1,d4				
	or.b 1(a0),d4				
	move.l d4,536(sp)			
						
	move.l 532(sp),(a4)			
	move.l 536(sp),4(a4)			
						
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L148				
	cmp.l a1,d6				
	jbeq _?L148				
						
	lea (3,a0),a1				
	move.l a1,8(a4)				
						
	move.l 532(sp),d0			
	move.l 536(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,524(sp)			
	move.l d1,d5				
	or.b 2(a0),d5				
	move.l d5,528(sp)			
						
	move.l 524(sp),(a4)			
	move.l 528(sp),4(a4)			
						
	move.b d2,d0				
	subq.b #8,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L148				
	cmp.l a1,d6				
	jbeq _?L148				
						
	lea (4,a0),a1				
	move.l a1,8(a4)				
						
	move.l 524(sp),d0			
	move.l 528(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,508(sp)			
	move.l d1,d4				
	or.b 3(a0),d4				
	move.l d4,512(sp)			
						
	move.l 508(sp),(a4)			
	move.l 512(sp),4(a4)			
						
	move.b d2,d0				
	add.b #-16,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L148				
	cmp.l a1,d6				
	jbeq _?L148				
						
	lea (5,a0),a1				
	move.l a1,8(a4)				
						
	move.l 508(sp),d0			
	move.l 512(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,860(sp)			
	move.l d1,d5				
	or.b 4(a0),d5				
	move.l d5,864(sp)			
						
	move.l 860(sp),(a4)			
	move.l 864(sp),4(a4)			
						
	move.b d2,d0				
	add.b #-24,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L148				
	cmp.l d6,a1				
	jbeq _?L148				
						
	lea (6,a0),a1				
	move.l a1,8(a4)				
						
	move.l 860(sp),d0			
	move.l 864(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,516(sp)			
	move.l d1,d4				
	or.b 5(a0),d4				
	move.l d4,520(sp)			
						
	move.l 516(sp),(a4)			
	move.l 520(sp),4(a4)			
						
	move.b d2,d0				
	add.b #-32,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L148				
	cmp.l d6,a1				
	jbeq _?L148				
						
	lea (7,a0),a1				
	move.l a1,8(a4)				
						
	move.l 516(sp),d0			
	move.l 520(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,764(sp)			
	move.l d1,d5				
	or.b 6(a0),d5				
	move.l d5,768(sp)			
						
	move.l 764(sp),(a4)			
	move.l 768(sp),4(a4)			
						
	add.b #-40,d2				
	move.b d2,16(a4)			
						
	cmp.b #8,d2				
	jbne _?L148				
	cmp.l a1,d6				
	jbeq _?L148				
						
	lea (8,a0),a1				
	move.l a1,8(a4)				
						
	clr.l d2				
	move.b 7(a0),d2				
						
	move.l 764(sp),d0			
	move.l 768(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	clr.l d4				
	or.l d0,d4				
	move.l d4,(a4)				
	or.l d1,d2				
	move.l d2,4(a4)				
						
	clr.b 16(a4)				
_?L148:						
						
	clr.w d7				
	swap d7					
						
	move.w d7,(a3)				
						
	moveq #32,d5				
	move.l d5,26(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L459:						
						
	move.l a1,56(sp)			
	clr.l d1				
	move.b d7,d1				
						
	moveq #-32,d0				
	add.l d1,d0				
	jbmi _?L460				
	move.l d5,d6				
	lsl.l d0,d6				
	move.l d6,316(sp)			
	clr.l 320(sp)				
_?L461:						
						
	addq.b #4,d7				
						
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L464				
	move.l 12(a4),d6			
						
	move.l 8(a4),a0				
_?L463:						
						
	cmp.l a0,d6				
	jbeq _?L464				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b -1(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbhi _?L463				
_?L464:						
						
	move.l 316(sp),d0			
	move.l 320(sp),d1			
	moveq #28,d1				
	lsr.l d1,d0				
						
	move.l 56(sp),a0			
	move.b d0,16(a0)			
						
	clr.w 34(a4)				
						
	move.l #509,22(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L839:						
						
	st 38(a5)				
						
	move.w #3,a6				
	jbra _?L80				
_?L866:						
						
	clr.l d1				
	move.b d6,d1				
						
	moveq #-32,d0				
	add.l d1,d0				
	jbmi _?L477				
	move.l d5,d1				
	lsl.l d0,d1				
	move.l d1,332(sp)			
	clr.l 336(sp)				
						
	addq.b #5,d6				
						
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbls _?L482				
_?L479:						
						
	move.l 12(a4),d2			
						
	move.l 8(a4),a0				
	move.l 136(sp),d7			
_?L481:						
						
	cmp.l d2,a0				
	jbeq _?L801				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b -1(a0),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d6				
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbhi _?L481				
_?L801:						
	move.l d7,136(sp)			
_?L482:						
						
	move.l 332(sp),d0			
	move.l 336(sp),d1			
	moveq #27,d1				
	lsr.l d1,d0				
						
	move.b d0,17(a1)			
						
	move.l #512,22(a4)			
	jbra _?L480				
_?L512:						
						
	move.b 16(a4),d0			
	clr.l d4				
	move.b d0,d4				
						
	move.l a2,d1				
	add.l d4,d1				
						
	moveq #64,d2				
	cmp.l d1,d2				
	jblt _?L514				
						
	cmp.b #56,56(sp)			
	jbhi _?L442				
						
	move.l (a4),d2				
	move.l 4(a4),d3				
						
	move.w #-32,a0				
	add.l d4,a0				
	tst.l a0				
	jblt _?L515				
	move.l d3,d1				
	move.l a0,d4				
	lsl.l d4,d1				
	sub.l a6,a6				
_?L516:						
						
	add.b d6,d0				
						
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L521				
						
	move.l 12(a4),a1			
						
	move.l 8(a4),a0				
_?L520:						
						
	cmp.l a0,a1				
	jbeq _?L521				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d2,d4				
	move.l d3,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,d2				
	move.l d5,d3				
	or.b -1(a0),d3				
						
	move.l d2,(a4)				
	move.l d3,4(a4)				
						
	subq.b #8,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbhi _?L520				
_?L521:						
						
	tst.l 40(sp)				
	jblt _?L518				
	move.l 40(sp),d0			
	lsr.l d0,d1				
						
	move.w 42(a4),d0			
						
	clr.l d2				
	move.w d0,d2				
	lsl.l #2,d2				
	lea (a3,d2.l),a0			
						
	move.l d1,(a0)				
						
	move.l a5,d3				
	eor.l d3,d1				
	sub.l a5,d1				
	jbra _?L513				
_?L446:						
						
	move.l d6,d0				
	add.l d0,d0				
	move.l 156(sp),d6			
	lsl.l d6,d0				
	move.l 40(sp),d6			
	move.l 136(sp),d1			
	lsr.l d1,d6				
	or.l d0,d6				
	jbra _?L447				
_?L420:						
	move.l d6,d0				
	add.l d0,d0				
	move.l 156(sp),d1			
	lsl.l d1,d0				
	move.l a6,d6				
	move.l 136(sp),d2			
	lsr.l d2,d6				
	or.l d0,d6				
	jbra _?L421				
_?L417:						
						
	moveq #31,d5				
	sub.l d1,d5				
	move.l d3,d4				
	lsr.l #1,d4				
	lsr.l d5,d4				
	move.l d2,d6				
	lsl.l d1,d6				
	or.l d4,d6				
	move.l d3,d5				
	lsl.l d1,d5				
	move.l d5,a6				
	jbra _?L418				
_?L602:						
						
	clr.l d4				
	jbra _?L499				
_?L518:						
						
	move.l d1,d0				
	add.l d0,d0				
	move.l 136(sp),d1			
	lsl.l d1,d0				
	move.l a6,d1				
	move.l 112(sp),d2			
	lsr.l d2,d1				
	or.l d0,d1				
						
	move.w 42(a4),d0			
						
	clr.l d2				
	move.w d0,d2				
	lsl.l #2,d2				
	lea (a3,d2.l),a0			
						
	move.l d1,(a0)				
						
	move.l a5,d3				
	eor.l d3,d1				
	sub.l a5,d1				
	jbra _?L513				
_?L515:						
						
	moveq #31,d1				
	sub.l d4,d1				
	move.l d3,d5				
	lsr.l #1,d5				
	lsr.l d1,d5				
	move.l d2,d1				
	lsl.l d4,d1				
	or.l d5,d1				
	move.l d3,d5				
	lsl.l d4,d5				
	move.l d5,a6				
	jbra _?L516				
_?L337:						
	moveq #31,d5				
	sub.l d1,d5				
	move.l d3,d4				
	lsr.l #1,d4				
	lsr.l d5,d4				
	move.l d2,d6				
	lsl.l d1,d6				
	move.l d6,140(sp)			
	or.l d4,140(sp)				
	move.l d3,d7				
	lsl.l d1,d7				
	move.l d7,144(sp)			
	jbra _?L338				
_?L503:						
						
	move.l a1,d0				
	add.l d0,d0				
	moveq #31,d4				
	sub.l d1,d4				
	lsl.l d4,d0				
	move.l a5,d4				
	lsr.l d1,d4				
	or.l d0,d4				
	jbra _?L499				
_?L500:						
						
	move.w #31,a0				
	sub.l d4,a0				
	move.l d1,d6				
	lsr.l #1,d6				
	move.l a0,d5				
	lsr.l d5,d6				
	move.l d6,a5				
	move.l d0,d6				
	lsl.l d4,d6				
	move.l a5,d5				
	or.l d5,d6				
	move.l d6,a1				
	move.l d1,d6				
	lsl.l d4,d6				
	move.l d6,a5				
	jbra _?L501				
_?L852:						
						
	moveq #56,d0				
	moveq #7,d7				
	jbra _?L282				
_?L237:						
						
	move.l 232(sp),d2			
	move.l 236(sp),d3			
	add.l d2,d2				
	clr.l d2				
	clr.l d3				
	addx.l d3,d3				
						
	move.l d3,(a5)				
						
	clr.l d2				
	move.b d5,d2				
						
	move.w #-32,a0				
	add.l d2,a0				
	tst.l a0				
	jblt _?L242				
	move.l d1,d3				
	move.l a0,d4				
	lsl.l d4,d3				
	move.l d3,184(sp)			
	clr.l 188(sp)				
_?L243:						
						
	addq.b #4,d5				
						
	move.b d5,16(a4)			
						
	cmp.b #7,d5				
	jbls _?L240				
	move.l 8(a4),a0				
_?L248:						
	cmp.l a1,a0				
	jbeq _?L249				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b -1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d5				
	move.b d5,16(a4)			
						
	cmp.b #7,d5				
	jbhi _?L248				
_?L249:						
						
	move.l 184(sp),d2			
	move.l 188(sp),d3			
	moveq #28,d3				
	lsr.l d3,d2				
	move.l d2,d3				
	clr.l d2				
	move.l d2,104(sp)			
	move.l d3,108(sp)			
						
	move.l d3,4(a5)				
						
	move.b d5,d2				
						
	move.w #-32,a0				
	add.l d2,a0				
	tst.l a0				
	jblt _?L251				
	move.l d1,d3				
	move.l a0,d4				
	lsl.l d4,d3				
	move.l d3,216(sp)			
	clr.l 220(sp)				
						
	addq.b #4,d5				
						
	move.b d5,16(a4)			
						
	cmp.b #7,d5				
	jbls _?L253				
_?L869:						
						
	move.l 8(a4),a3				
	jbra _?L254				
_?L819:						
	move.l d4,488(sp)			
	move.l d5,492(sp)			
						
	move.l #402,d0				
	jbra _?L868				
_?L112:						
						
	move.w #31,a0				
	sub.l a2,a0				
	move.l d5,d7				
	lsr.l #1,d7				
	move.l a0,d6				
	lsr.l d6,d7				
	move.l d7,a1				
	move.l d4,d7				
	move.l a2,d6				
	lsl.l d6,d7				
	move.l d7,192(sp)			
	move.l a1,d7				
	or.l d7,192(sp)				
	move.l d5,d7				
	lsl.l d6,d7				
	move.l d7,196(sp)			
	jbra _?L113				
_?L392:						
	move.w #31,a0				
	sub.l d6,a0				
	move.l d1,d7				
	lsr.l #1,d7				
	move.l a0,d2				
	lsr.l d2,d7				
	move.l d0,d2				
	lsl.l d6,d2				
	or.l d7,d2				
	move.l d1,d3				
	lsl.l d6,d3				
	jbra _?L393				
_?L761:						
	move.l a1,a6				
	jbra _?L80				
_?L102:						
						
	moveq #-1,d5				
	move.l d5,18(a4)			
	move.w #-1,a6				
	jbra _?L80				
_?L302:						
						
	move.l (a4),a2				
	move.l 4(a4),a3				
						
	move.w #-32,a0				
	add.l d2,a0				
	tst.l a0				
	jblt _?L305				
	move.l a3,d5				
	move.l a0,d6				
	lsl.l d6,d5				
	move.l d5,380(sp)			
	clr.l 384(sp)				
_?L306:						
						
	move.b d0,d2				
	addq.b #8,d2				
	move.b d2,16(a4)			
						
	move.l 12(a4),40(sp)			
						
	move.l 8(a4),a0				
						
	cmp.l 40(sp),a0				
	jbeq _?L307				
						
	move.l a0,d1				
	addq.l #1,d1				
	move.l d1,8(a4)				
						
	move.l a2,d2				
	move.l a3,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,364(sp)			
	move.l d3,d4				
	or.b (a0),d4				
	move.l d4,368(sp)			
						
	move.l 364(sp),(a4)			
	move.l 368(sp),4(a4)			
						
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L307				
	cmp.l 40(sp),d1				
	jbeq _?L307				
						
	addq.l #1,d1				
	move.l d1,8(a4)				
						
	move.l 364(sp),d2			
	move.l 368(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,356(sp)			
	move.l d3,d5				
	or.b 1(a0),d5				
	move.l d5,360(sp)			
						
	move.l 356(sp),(a4)			
	move.l 360(sp),4(a4)			
						
	move.b d0,d2				
	subq.b #8,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L307				
	cmp.l 40(sp),d1				
	jbeq _?L307				
						
	addq.l #1,d1				
	move.l d1,8(a4)				
						
	move.l 356(sp),d2			
	move.l 360(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,468(sp)			
	move.l d3,d6				
	or.b 2(a0),d6				
	move.l d6,472(sp)			
						
	move.l 468(sp),(a4)			
	move.l 472(sp),4(a4)			
						
	move.b d0,d2				
	add.b #-16,d2				
	move.b d2,16(a4)			
						
	cmp.b #7,d2				
	jbls _?L307				
	cmp.l 40(sp),d1				
	jbeq _?L307				
						
	addq.l #1,d1				
	move.l d1,8(a4)				
						
	move.l 468(sp),d2			
	move.l 472(sp),d3			
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,916(sp)			
	move.l d3,d7				
	or.b 3(a0),d7				
	move.l d7,920(sp)			
						
	move.l 916(sp),(a4)			
	move.l 920(sp),4(a4)			
						
	add.b #-24,d0				
	move.b d0,16(a4)			
						
	cmp.b #8,d0				
	jbne _?L307				
	cmp.l 40(sp),d1				
	jbeq _?L307				
						
	lea (5,a0),a1				
	move.l a1,8(a4)				
						
	clr.l d2				
	move.b 4(a0),d2				
						
	move.l 916(sp),d0			
	move.l 920(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	clr.l d3				
	or.l d0,d3				
	move.l d3,(a4)				
	or.l d1,d2				
	move.l d2,4(a4)				
						
	clr.b 16(a4)				
_?L307:						
						
	move.l 380(sp),d0			
	move.l 384(sp),d1			
	moveq #24,d1				
	lsr.l d1,d0				
						
	move.l d0,d4				
	addq.l #1,d4				
	move.l d4,20(a5)			
						
	jbra _?L304				
_?L266:						
						
	moveq #31,d7				
	sub.l d2,d7				
	move.l d1,d3				
	lsr.l #1,d3				
	lsr.l d7,d3				
	move.l d0,d7				
	lsl.l d2,d7				
	move.l d7,252(sp)			
	or.l d3,252(sp)				
	move.l d1,d3				
	lsl.l d2,d3				
	move.l d3,256(sp)			
	jbra _?L267				
_?L261:						
	moveq #31,d7				
	sub.l d2,d7				
	move.l d1,d3				
	lsr.l #1,d3				
	lsr.l d7,d3				
	move.l d0,d7				
	lsl.l d2,d7				
	move.l d7,260(sp)			
	or.l d3,260(sp)				
	move.l d1,d3				
	lsl.l d2,d3				
	move.l d3,264(sp)			
	jbra _?L262				
_?L256:						
	moveq #31,d4				
	sub.l d2,d4				
	move.l d1,d3				
	lsr.l #1,d3				
	lsr.l d4,d3				
	move.l d0,d6				
	lsl.l d2,d6				
	move.l d6,268(sp)			
	or.l d3,268(sp)				
	move.l d1,d7				
	lsl.l d2,d7				
	move.l d7,272(sp)			
	jbra _?L257				
_?L529:						
						
	move.l d2,d4				
	add.l d4,d4				
	move.l 56(sp),d5			
	lsl.l d5,d4				
	move.l d3,d2				
	move.l 104(sp),d5			
	lsr.l d5,d2				
	or.l d4,d2				
	jbra _?L531				
_?L251:						
						
	moveq #31,d4				
	sub.l d2,d4				
	move.l d1,d3				
	lsr.l #1,d3				
	lsr.l d4,d3				
	move.l d0,d6				
	lsl.l d2,d6				
	move.l d6,216(sp)			
	or.l d3,216(sp)				
	move.l d1,d7				
	lsl.l d2,d7				
	move.l d7,220(sp)			
						
	addq.b #4,d5				
						
	move.b d5,16(a4)			
						
	cmp.b #7,d5				
	jbhi _?L869				
	jbra _?L253				
_?L126:						
						
	moveq #31,d2				
	sub.l d4,d2				
	move.l d1,d5				
	lsr.l #1,d5				
	lsr.l d2,d5				
	move.l d0,d2				
	lsl.l d4,d2				
	or.l d5,d2				
						
	add.b #24,d7				
	move.b d7,d4				
	jbra _?L128				
_?L825:						
	move.l d6,a0				
_?L114:						
						
	move.l 48(a4),a1			
						
	move.l 192(sp),d4			
	move.l 196(sp),d5			
	add.l d4,d4				
	clr.l d4				
	clr.l d5				
	addx.l d5,d5				
						
	move.b d5,d2				
	and.b #1,d2				
	move.b d2,(a1)				
						
	clr.l d2				
	move.b d7,d2				
						
	move.w #-32,a2				
	add.l d2,a2				
	tst.l a2				
	jblt _?L571				
	move.l d1,d4				
	move.l a2,d5				
	lsl.l d5,d4				
	move.l d4,168(sp)			
	clr.l 172(sp)				
						
	addq.b #7,d7				
						
	move.b d7,16(a4)			
_?L871:						
	move.l d3,d4				
	jbra _?L121				
_?L316:						
						
	move.l (a4),d0				
	move.l 4(a4),d1				
						
	move.b 16(a4),d4			
	clr.l d3				
	move.b d4,d3				
						
	move.w #-32,a0				
	add.l d3,a0				
	tst.l a0				
	jblt _?L330				
	move.l d1,d5				
	move.l a0,d2				
	lsl.l d2,d5				
_?L331:						
						
	add.b #16,d4				
						
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbls _?L334				
						
	move.l 12(a4),40(sp)			
						
	move.l 8(a4),a0				
	move.l 40(sp),d6			
_?L333:						
						
	cmp.l d6,a0				
	jbeq _?L334				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b -1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d4				
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbhi _?L333				
_?L334:						
						
	clr.w d5				
	swap d5					
						
	move.l d5,d0				
	lsl.l #2,d0				
	add.l d5,d0				
	add.l d0,d0				
	move.l d0,24(a5)			
						
	move.l #403,d0				
	jbra _?L281				
_?L860:						
						
	move.b 16(a4),d5			
	move.b d5,d0				
	and.b #7,d0				
	bftst d5{#29:#3}			
	jbeq _?L537				
	moveq #8,d1				
	sub.b d0,d1				
	clr.l d0				
	move.b d1,d0				
						
	clr.l d6				
	move.b d5,d6				
						
	add.l d6,d0				
						
	moveq #64,d7				
	cmp.l d0,d7				
	jblt _?L814				
						
	add.b d1,d5				
						
	move.b d5,16(a4)			
						
	cmp.b #7,d5				
	jbls _?L539				
						
	move.l 12(a4),a2			
						
	move.l 8(a4),a0				
	move.l 136(sp),d7			
	move.l d3,a3				
_?L540:						
						
	cmp.l a0,a2				
	jbeq _?L812				
						
	move.l (a4),d0				
	move.l 4(a4),d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	clr.l d6				
	move.b -1(a0),d6			
						
	clr.l d3				
	or.l d0,d3				
	move.l d3,(a4)				
	or.l d1,d6				
	move.l d6,4(a4)				
						
	subq.b #8,d5				
	move.b d5,16(a4)			
						
	cmp.b #7,d5				
	jbhi _?L540				
_?L812:						
	move.l d7,136(sp)			
	move.l a3,d3				
_?L537:						
						
	cmp.b #48,d5				
	jbhi _?L814				
_?L539:						
						
	move.b d5,d6				
	add.b #16,d6				
	move.b d6,16(a4)			
						
	move.l 12(a4),40(sp)			
						
	move.l 8(a4),a0				
						
	cmp.l 40(sp),a0				
	jbeq _?L542				
						
	move.l (a4),a2				
	move.l 4(a4),a3				
	move.l a2,d0				
	move.l a3,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l a0,d3				
	addq.l #1,d3				
	move.l d3,8(a4)				
						
	move.l d0,940(sp)			
	move.l d1,d7				
	or.b (a0),d7				
	move.l d7,944(sp)			
						
	move.l 940(sp),(a4)			
	move.l 944(sp),4(a4)			
						
	move.b d5,d0				
	addq.b #8,d0				
	move.b d0,16(a4)			
						
	cmp.l 40(sp),d3				
	jbeq _?L542				
						
	addq.l #1,d3				
	move.l d3,8(a4)				
						
	move.l 940(sp),d0			
	move.l 944(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,948(sp)			
	move.l d1,d6				
	or.b 1(a0),d6				
	move.l d6,952(sp)			
						
	move.l 948(sp),(a4)			
	move.l 952(sp),4(a4)			
						
	move.b d5,16(a4)			
						
	cmp.b #7,d5				
	jbls _?L542				
	cmp.l 40(sp),d3				
	jbeq _?L542				
						
	addq.l #1,d3				
	move.l d3,8(a4)				
						
	move.l 948(sp),d0			
	move.l 952(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,956(sp)			
	move.l d1,d7				
	or.b 2(a0),d7				
	move.l d7,960(sp)			
						
	move.l 956(sp),(a4)			
	move.l 960(sp),4(a4)			
						
	move.b d5,d0				
	subq.b #8,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L542				
	cmp.l 40(sp),d3				
	jbeq _?L542				
						
	addq.l #1,d3				
	move.l d3,8(a4)				
						
	move.l 956(sp),d0			
	move.l 960(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,964(sp)			
	move.l d1,d6				
	or.b 3(a0),d6				
	move.l d6,968(sp)			
						
	move.l 964(sp),(a4)			
	move.l 968(sp),4(a4)			
						
	move.b d5,d0				
	add.b #-16,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L542				
	cmp.l 40(sp),d3				
	jbeq _?L542				
						
	addq.l #1,d3				
	move.l d3,8(a4)				
						
	move.l 964(sp),d0			
	move.l 968(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,972(sp)			
	move.l d1,d7				
	or.b 4(a0),d7				
	move.l d7,976(sp)			
						
	move.l 972(sp),(a4)			
	move.l 976(sp),4(a4)			
						
	move.b d5,d0				
	add.b #-24,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L542				
	cmp.l 40(sp),d3				
	jbeq _?L542				
						
	addq.l #1,d3				
	move.l d3,8(a4)				
						
	move.l 972(sp),d0			
	move.l 976(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,980(sp)			
	move.l d1,d6				
	or.b 5(a0),d6				
	move.l d6,984(sp)			
						
	move.l 980(sp),(a4)			
	move.l 984(sp),4(a4)			
						
	move.b d5,d0				
	add.b #-32,d0				
	move.b d0,16(a4)			
						
	cmp.b #7,d0				
	jbls _?L542				
	cmp.l 40(sp),d3				
	jbeq _?L542				
						
	addq.l #1,d3				
	move.l d3,8(a4)				
						
	move.l 980(sp),d0			
	move.l 984(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,988(sp)			
	move.l d1,d7				
	or.b 6(a0),d7				
	move.l d7,992(sp)			
						
	move.l 988(sp),(a4)			
	move.l 992(sp),4(a4)			
						
	add.b #-40,d5				
	move.b d5,16(a4)			
						
	cmp.b #8,d5				
	jbne _?L542				
	cmp.l 40(sp),d3				
	jbeq _?L542				
						
	lea (8,a0),a2				
	move.l a2,8(a4)				
						
	clr.l d3				
	move.b 7(a0),d3				
						
	move.l 988(sp),d0			
	move.l 992(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	clr.l d5				
	or.l d0,d5				
	move.l d5,(a4)				
	or.l d1,d3				
	move.l d3,4(a4)				
						
	clr.b 16(a4)				
_?L542:						
						
	move.l 68(a4),a0			
						
	move.l 72(a4),a2			
	moveq #9,d6				
	cmp.l d4,d6				
	jbeq _?L544				
	moveq #10,d7				
	cmp.l d4,d7				
	jbeq _?L545				
	subq.l #8,d4				
	jbeq _?L870				
						
	moveq #32,d0				
	sub.b d2,d0				
						
	cmp.b #32,d2				
	jbeq _?L550				
						
	move.w a1,d5				
	tst.b d5				
	jbeq _?L550				
	tst.l 136(sp)				
	jbeq _?L550				
	lea (68,a4),a2				
	move.w a1,d6				
	clr.l d3				
	move.b d6,d3				
	lsl.l #2,d3				
	add.l a2,d3				
	clr.l d2				
	move.b d0,d2				
	move.l 136(sp),d7			
_?L558:						
						
	move.l (a2)+,a1				
						
	clr.w d1				
						
	clr.l d0				
_?L557:						
						
	lsl.l #2,d0				
	lea (a1,d0.l),a0			
						
	move.l (a0),d0				
	lsl.l d2,d0				
						
	move.l d0,(a0)				
						
	addq.w #1,d1				
						
	clr.l d0				
	move.w d1,d0				
	cmp.l d7,d0				
	jbcs _?L557				
						
	cmp.l d3,a2				
	jbne _?L558				
_?L550:						
						
	clr.w 42(a4)				
						
	clr.b 40(a4)				
						
	moveq #5,d7				
	move.l d7,18(a4)			
	moveq #5,d3				
	jbra _?L724				
_?L315:						
						
	move.l (a4),d0				
	move.l 4(a4),d1				
						
	move.b 16(a4),d4			
	clr.l d3				
	move.b d4,d3				
						
	move.w #-32,a0				
	add.l d3,a0				
	tst.l a0				
	jblt _?L324				
	move.l d1,d5				
	move.l a0,d7				
	lsl.l d7,d5				
_?L325:						
						
	add.b #16,d4				
						
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbls _?L328				
						
	move.l 12(a4),40(sp)			
						
	move.l 8(a4),a0				
	move.l 40(sp),d6			
_?L327:						
						
	cmp.l d6,a0				
	jbeq _?L328				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d0,d2				
	move.l d1,d3				
	rol.l #8,d2				
	rol.l #8,d3				
	move.b d3,d2				
	clr.b d3				
						
	move.l d2,d0				
	move.l d3,d1				
	or.b -1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d4				
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbhi _?L327				
_?L328:						
						
	clr.w d5				
	swap d5					
						
	move.l d5,24(a5)			
						
	move.l #403,d0				
	jbra _?L281				
_?L857:						
						
	sub.l d1,d1				
	tst.l d3				
	subx.l d1,d2				
	jblt _?L805				
						
	addq.w #1,38(a4)			
	jbra _?L498				
_?L242:						
						
	moveq #31,d4				
	sub.l d2,d4				
	move.l d1,d3				
	lsr.l #1,d3				
	lsr.l d4,d3				
	move.l d0,d6				
	lsl.l d2,d6				
	move.l d6,184(sp)			
	or.l d3,184(sp)				
	move.l d1,d7				
	lsl.l d2,d7				
	move.l d7,188(sp)			
	jbra _?L243				
_?L406:						
						
	move.l a5,d1				
	add.l d1,d1				
	moveq #31,d2				
	sub.l d4,d2				
	lsl.l d2,d1				
	move.l a1,d2				
	lsr.l d4,d2				
	or.l d1,d2				
	jbra _?L407				
_?L403:						
						
	moveq #31,d2				
	sub.l d4,d2				
	move.l d1,d6				
	lsr.l #1,d6				
	lsr.l d2,d6				
	move.l d0,d2				
	lsl.l d4,d2				
	or.l d6,d2				
	move.l d2,a5				
	move.l d1,d6				
	lsl.l d4,d6				
	move.l d6,a1				
	jbra _?L404				
_?L367:						
						
	move.l 348(sp),d5			
	move.l 352(sp),d6			
	add.l d5,d5				
	clr.l d5				
	clr.l d6				
	addx.l d6,d6				
						
	move.b d6,56(sp)			
						
	move.b d6,d7				
	eor.b #1,d7				
	and.b #1,d7				
	move.w d7,a2				
						
	clr.l d6				
	move.b d4,d6				
						
	move.w #-32,a0				
	add.l d6,a0				
	tst.l a0				
	jblt _?L374				
	move.l d1,d5				
	move.l a0,d6				
	lsl.l d6,d5				
	move.l d5,244(sp)			
	clr.l 248(sp)				
_?L375:						
						
	addq.b #6,d4				
	move.w d4,a5				
						
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbls _?L372				
	move.l 12(a4),40(sp)			
	move.l 8(a4),a0				
	move.w a5,d4				
	move.l 136(sp),a3			
	move.l 40(sp),d5			
_?L376:						
	cmp.l d5,a0				
	jbeq _?L787				
						
	addq.l #1,a0				
	move.l a0,8(a4)				
						
	move.l d0,d6				
	move.l d1,d7				
	rol.l #8,d6				
	rol.l #8,d7				
	move.b d7,d6				
	clr.b d7				
						
	move.l d6,d0				
	move.l d7,d1				
	or.b -1(a0),d1				
						
	move.l d0,(a4)				
	move.l d1,4(a4)				
						
	subq.b #8,d4				
	move.b d4,16(a4)			
						
	cmp.b #7,d4				
	jbhi _?L376				
_?L787:						
	move.w d4,a5				
	move.l a3,136(sp)			
	jbra _?L372				
_?L276:						
						
	move.l #300,d0				
						
	move.l d0,22(a4)			
	moveq #3,d3				
	jbra _?L724				
_?L796:						
	move.l 240(sp),a6			
	move.l 56(sp),d3			
_?L448:						
						
	move.l #508,22(a4)			
						
	moveq #-1,d5				
	cmp.l d3,d5				
	jbne _?L724				
	jbra _?L814				
_?L416:						
						
	move.l 484(sp),a6			
	moveq #-1,d4				
	move.l d4,(a3,d7.l*4)			
	jbra _?L80				
_?L826:						
	move.l a1,a0				
_?L238:						
						
	move.l 232(sp),d2			
	move.l 236(sp),d3			
	add.l d2,d2				
	clr.l d2				
	clr.l d3				
	addx.l d3,d3				
						
	move.l d3,(a5)				
						
	clr.l d3				
	move.b d5,d3				
						
	moveq #-32,d2				
	add.l d3,d2				
	jbmi _?L576				
	move.l d1,d3				
	lsl.l d2,d3				
	move.l d3,184(sp)			
	clr.l 188(sp)				
						
	addq.b #4,d5				
						
	move.b d5,16(a4)			
	jbra _?L248				
_?L863:						
	move.l 56(sp),a6			
	jbra _?L80				
_?L806:						
	move.l a2,a6				
	jbra _?L80				
_?L805:						
	move.l d2,496(sp)			
	move.l d3,500(sp)			
	move.w d7,d2				
	move.l a2,d3				
	jbra _?L488				
_?L601:						
	move.w #31,a2				
	move.w #59,a5				
						
	moveq #5,d2				
	jbra _?L467				
_?L310:						
						
	moveq #31,d1				
	sub.l d2,d1				
	move.l a3,d3				
	lsr.l #1,d3				
	lsr.l d1,d3				
	move.l a2,d1				
	lsl.l d2,d1				
	or.l d3,d1				
	jbra _?L311				
_?L305:						
	moveq #31,d3				
	sub.l d2,d3				
	move.l a3,d1				
	lsr.l #1,d1				
	lsr.l d3,d1				
	move.l a2,d7				
	lsl.l d2,d7				
	move.l d7,380(sp)			
	or.l d1,380(sp)				
	move.l a3,d1				
	lsl.l d2,d1				
	move.l d1,384(sp)			
	jbra _?L306				
_?L865:						
						
	move.l d3,a6				
	moveq #-1,d2				
	move.l d2,(a3)				
						
	jbra _?L80				
_?L474:						
						
	move.l a3,d1				
	add.l d1,d1				
	moveq #31,d0				
	sub.l a5,d0				
	lsl.l d0,d1				
	move.l 40(sp),d0			
	move.l a5,d7				
	lsr.l d7,d0				
	or.l d1,d0				
						
	move.b d0,17(a1)			
						
	cmp.l a2,d0				
	jbne _?L476				
	jbra _?L866				
_?L468:						
						
	move.w #31,a0				
	sub.l d0,a0				
	move.l d5,d1				
	lsr.l #1,d1				
	move.l a0,d7				
	lsr.l d7,d1				
	move.l d4,d7				
	lsl.l d0,d7				
	or.l d1,d7				
	move.l d7,a3				
	move.l d5,d1				
	lsl.l d0,d1				
	move.l d1,40(sp)			
	jbra _?L469				
_?L378:						
						
	move.b d4,d6				
	and.b #16,d6				
	jbne _?L384				
						
	move.b d4,d6				
	and.b #8,d6				
	jbeq _?L382				
						
	and.b #7,d4				
						
	move.b d4,4(a1)				
						
	moveq #2,d5				
	move.l d5,(a1)				
						
	clr.b 7(a1)				
						
	move.l #503,22(a4)			
						
	tst.b 56(sp)				
	jbne _?L599				
	cmp.b #4,d4				
	jbhi _?L599				
						
	moveq #7,d6				
	and.l d6,d4				
	lsl.l #4,d4				
	add.l #__fx_flac_fixed_coeffs,d4	
	move.l d4,8(a1)				
						
	move.w #1,a2				
	jbra _?L383				
_?L571:						
						
	moveq #31,d5				
	sub.l d2,d5				
	move.l d1,d4				
	lsr.l #1,d4				
	lsr.l d5,d4				
	move.l d0,d5				
	lsl.l d2,d5				
	move.l d5,168(sp)			
	or.l d4,168(sp)				
	move.l d1,d4				
	lsl.l d2,d4				
	move.l d4,172(sp)			
						
	addq.b #7,d7				
						
	move.b d7,16(a4)			
	jbra _?L871				
_?L330:						
						
	moveq #31,d5				
	sub.l d3,d5				
	move.l d1,d2				
	lsr.l #1,d2				
	lsr.l d5,d2				
	move.l d0,d5				
	lsl.l d3,d5				
	or.l d2,d5				
	jbra _?L331				
_?L324:						
	moveq #31,d5				
	sub.l d3,d5				
	move.l d1,d2				
	lsr.l #1,d2				
	lsr.l d5,d2				
	move.l d0,d5				
	lsl.l d3,d5				
	or.l d2,d5				
	jbra _?L325				
_?L318:						
	moveq #31,d5				
	sub.l d2,d5				
	move.l d1,d3				
	lsr.l #1,d3				
	lsr.l d5,d3				
	move.l d0,d5				
	lsl.l d2,d5				
	move.l d5,388(sp)			
	or.l d3,388(sp)				
	move.l d1,d6				
	lsl.l d2,d6				
	move.l d6,392(sp)			
	jbra _?L319				
_?L365:						
	moveq #31,d6				
	sub.l d4,d6				
	move.l a3,d5				
	lsr.l #1,d5				
	lsr.l d6,d5				
	move.l a2,d6				
	lsl.l d4,d6				
	move.l d6,348(sp)			
	or.l d5,348(sp)				
	move.l a3,d7				
	lsl.l d4,d7				
	move.l d7,352(sp)			
	jbra _?L366				
_?L223:						
						
	clr.b 44(a4)				
						
	clr.w 46(a4)				
						
	move.l #400,22(a4)			
						
	move.b d2,d5				
	add.b #15,d5				
	move.b d5,16(a4)			
						
	move.l 8(a4),a0				
						
	cmp.l 40(sp),a0				
	jbeq _?L817				
						
	move.l a0,d0				
	addq.l #1,d0				
	move.l d0,8(a4)				
						
	move.l a2,d4				
	move.l a3,d5				
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,740(sp)			
	move.l d5,d6				
	or.b (a0),d6				
	move.l d6,744(sp)			
						
	move.l 740(sp),(a4)			
	move.l 744(sp),4(a4)			
						
	move.b d2,d1				
	addq.b #7,d1				
	move.b d1,16(a4)			
						
	cmp.b #7,d1				
	jbeq _?L817				
	cmp.l 40(sp),d0				
	jbeq _?L817				
						
	addq.l #1,d0				
	move.l d0,8(a4)				
						
	move.l 740(sp),d4			
	move.l 744(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,692(sp)			
	move.l d5,d7				
	or.b 1(a0),d7				
	move.l d7,696(sp)			
						
	move.l 692(sp),(a4)			
	move.l 696(sp),4(a4)			
						
	subq.b #8,d1				
	move.b d1,16(a4)			
						
	cmp.b #7,d1				
	jbls _?L817				
	cmp.l 40(sp),d0				
	jbeq _?L817				
						
	addq.l #1,d0				
	move.l d0,8(a4)				
						
	move.l 692(sp),d4			
	move.l 696(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,652(sp)			
	move.l d5,d1				
	or.b 2(a0),d1				
	move.l d1,656(sp)			
						
	move.l 652(sp),(a4)			
	move.l 656(sp),4(a4)			
						
	move.b d2,d1				
	add.b #-9,d1				
	move.b d1,16(a4)			
						
	cmp.b #7,d1				
	jbls _?L817				
	cmp.l 40(sp),d0				
	jbeq _?L817				
						
	addq.l #1,d0				
	move.l d0,8(a4)				
						
	move.l 652(sp),d4			
	move.l 656(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,644(sp)			
	move.l d5,d3				
	or.b 3(a0),d3				
	move.l d3,648(sp)			
						
	move.l 644(sp),(a4)			
	move.l 648(sp),4(a4)			
						
	subq.b #8,d1				
	move.b d1,16(a4)			
						
	cmp.b #7,d1				
	jbls _?L817				
	cmp.l 40(sp),d0				
	jbeq _?L817				
						
	addq.l #1,d0				
	move.l d0,8(a4)				
						
	move.l 644(sp),d4			
	move.l 648(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,580(sp)			
	move.l d5,d6				
	or.b 4(a0),d6				
	move.l d6,584(sp)			
						
	move.l 580(sp),(a4)			
	move.l 584(sp),4(a4)			
						
	subq.b #8,d1				
	move.b d1,16(a4)			
						
	cmp.b #7,d1				
	jbls _?L817				
	cmp.l 40(sp),d0				
	jbeq _?L817				
						
	addq.l #1,d0				
	move.l d0,8(a4)				
						
	move.l 580(sp),d4			
	move.l 584(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,788(sp)			
	move.l d5,d7				
	or.b 5(a0),d7				
	move.l d7,792(sp)			
						
	move.l 788(sp),(a4)			
	move.l 792(sp),4(a4)			
						
	subq.b #8,d1				
	move.b d1,16(a4)			
						
	cmp.b #7,d1				
	jbls _?L817				
	cmp.l 40(sp),d0				
	jbeq _?L817				
						
	move.l a0,d1				
	addq.l #7,d1				
	move.l d1,8(a4)				
						
	move.l 788(sp),d4			
	move.l 792(sp),d5			
	rol.l #8,d4				
	rol.l #8,d5				
	move.b d5,d4				
	clr.b d5				
						
	move.l d4,556(sp)			
	move.l d5,d0				
	or.b 6(a0),d0				
	move.l d0,560(sp)			
						
	move.l 556(sp),(a4)			
	move.l 560(sp),4(a4)			
						
	add.b #-41,d2				
	move.b d2,16(a4)			
						
	cmp.b #8,d2				
	jbne _?L817				
	cmp.l 40(sp),d1				
	jbeq _?L817				
						
	lea (8,a0),a1				
	move.l a1,8(a4)				
						
	clr.l d2				
	move.b 7(a0),d2				
						
	move.l 556(sp),d0			
	move.l 560(sp),d1			
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
	clr.l d3				
	or.l d0,d3				
	move.l d3,(a4)				
	or.l d1,d2				
	move.l d2,4(a4)				
						
	clr.b 16(a4)				
						
	moveq #3,d3				
	jbra _?L724				
_?L426:						
						
	moveq #31,d2				
	sub.l d0,d2				
	move.l a3,d1				
	lsr.l #1,d1				
	lsr.l d2,d1				
	move.l a2,d2				
	lsl.l d0,d2				
	move.l d2,412(sp)			
	or.l d1,412(sp)				
	move.l a3,d6				
	lsl.l d0,d6				
	move.l d6,416(sp)			
	jbra _?L427				
_?L154:						
	moveq #31,d6				
	sub.l d1,d6				
	move.l d5,d0				
	lsr.l #1,d0				
	lsr.l d6,d0				
	move.l d4,d7				
	lsl.l d1,d7				
	or.l d0,d7				
	jbra _?L155				
_?L160:						
	moveq #31,d6				
	sub.l d1,d6				
	move.l d5,d0				
	lsr.l #1,d0				
	lsr.l d6,d0				
	move.l d4,d7				
	lsl.l d1,d7				
	or.l d0,d7				
	jbra _?L161				
_?L146:						
	moveq #31,d6				
	sub.l d1,d6				
	move.l d5,d0				
	lsr.l #1,d0				
	lsr.l d6,d0				
	move.l d4,d7				
	lsl.l d1,d7				
	or.l d0,d7				
	jbra _?L147				
_?L166:						
	moveq #31,d6				
	sub.l d1,d6				
	move.l d5,d0				
	lsr.l #1,d0				
	lsr.l d6,d0				
	move.l d4,d7				
	lsl.l d1,d7				
	or.l d0,d7				
	jbra _?L167				
_?L193:						
	moveq #31,d6				
	sub.l d0,d6				
	move.l d5,d1				
	lsr.l #1,d1				
	lsr.l d6,d1				
	move.l d4,d7				
	lsl.l d0,d7				
	or.l d1,d7				
	move.l d5,d1				
	lsl.l d0,d1				
	move.l d1,a1				
	jbra _?L194				
_?L453:						
	moveq #31,d6				
	sub.l d0,d6				
	move.l a3,d1				
	lsr.l #1,d1				
	lsr.l d6,d1				
	move.l a2,d6				
	lsl.l d0,d6				
	move.l d6,420(sp)			
	or.l d1,420(sp)				
	move.l a3,d7				
	lsl.l d0,d7				
	move.l d7,424(sp)			
	jbra _?L454				
_?L199:						
	move.w #31,a0				
	sub.l d2,a0				
	move.l d5,d6				
	lsr.l #1,d6				
	move.l a0,d7				
	lsr.l d7,d6				
	move.l d6,a1				
	move.l d4,d6				
	lsl.l d2,d6				
	move.l d6,372(sp)			
	move.l a1,d7				
	or.l d7,372(sp)				
	move.l d5,d6				
	lsl.l d2,d6				
	move.l d6,376(sp)			
	jbra _?L200				
_?L374:						
	move.w #31,a0				
	sub.l d6,a0				
	move.l d1,d5				
	lsr.l #1,d5				
	move.l a0,d7				
	lsr.l d7,d5				
	move.l d0,d7				
	lsl.l d6,d7				
	move.l d7,244(sp)			
	or.l d5,244(sp)				
	move.l d1,d5				
	lsl.l d6,d5				
	move.l d5,248(sp)			
	jbra _?L375				
_?L386:						
	moveq #31,d6				
	sub.l d5,d6				
	move.l d1,d4				
	lsr.l #1,d4				
	lsr.l d6,d4				
	move.l d0,d7				
	lsl.l d5,d7				
	move.l d7,452(sp)			
	or.l d4,452(sp)				
	move.l d1,d4				
	lsl.l d5,d4				
	move.l d4,456(sp)			
	jbra _?L387				
_?L175:						
						
	move.l 52(a4),a5			
						
	move.l 340(sp),d0			
	move.l 344(sp),d1			
	moveq #12,d1				
	lsr.l d1,d0				
						
	move.l d0,12(a5)			
						
	clr.l d1				
	move.b d7,d1				
						
	moveq #-32,d0				
	add.l d1,d0				
	jbmi _?L179				
	move.l d5,d1				
	lsl.l d0,d1				
	move.l d1,300(sp)			
	clr.l 304(sp)				
						
	addq.b #3,d7				
						
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbls _?L177				
_?L182:						
	cmp.l d6,a3				
	jbeq _?L183				
						
	addq.l #1,a3				
	move.l a3,8(a4)				
						
	move.l d4,d0				
	move.l d5,d1				
	rol.l #8,d0				
	rol.l #8,d1				
	move.b d1,d0				
	clr.b d1				
						
	move.l d0,d4				
	move.l d1,d5				
	or.b -1(a3),d5				
						
	move.l d4,(a4)				
	move.l d5,4(a4)				
						
	subq.b #8,d7				
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbhi _?L182				
_?L183:						
						
	move.l 300(sp),d0			
	move.l 304(sp),d1			
	moveq #29,d1				
	lsr.l d1,d0				
						
	move.b d0,d2				
	addq.b #1,d2				
	move.b d2,16(a5)			
						
	clr.l d1				
	move.b d7,d1				
						
	moveq #-32,d0				
	add.l d1,d0				
	jbmi _?L185				
	move.l d5,d1				
	lsl.l d0,d1				
	move.l d1,324(sp)			
	clr.l 328(sp)				
						
	addq.b #5,d7				
						
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbhi _?L188				
_?L874:						
						
	move.l 324(sp),d0			
	move.l 328(sp),d1			
	moveq #27,d1				
	lsr.l d1,d0				
						
	move.b d0,d2				
	addq.b #1,d2				
	move.b d2,17(a5)			
						
	moveq #20,d4				
	move.l d4,26(a4)			
	jbra _?L872				
_?L514:						
						
	move.l 156(sp),a6			
	clr.l d0				
	move.w 42(a4),d0			
						
	moveq #-1,d4				
	move.l d4,(a3,d0.l*4)			
	jbra _?L80				
_?L829:						
	move.l 40(sp),a0			
_?L428:						
						
	move.l 412(sp),d0			
	move.l 416(sp),d1			
	moveq #28,d1				
	lsr.l d1,d0				
						
	move.b d0,d7				
						
	clr.l d1				
	move.b d2,d1				
						
	moveq #-32,d0				
	add.l d1,d0				
	jbmi _?L585				
	move.l d5,d6				
	lsl.l d0,d6				
	move.l d6,308(sp)			
	clr.l 312(sp)				
						
	addq.b #5,d2				
						
	move.b d2,16(a4)			
_?L875:						
	move.l 40(sp),d6			
	jbra _?L437				
_?L432:						
						
	move.w #31,a0				
	sub.l d1,a0				
	move.l d5,d0				
	lsr.l #1,d0				
	move.l a0,d6				
	lsr.l d6,d0				
	move.l d4,d6				
	lsl.l d1,d6				
	move.l d6,308(sp)			
	or.l d0,308(sp)				
	move.l d5,d0				
	lsl.l d1,d0				
	move.l d0,312(sp)			
	jbra _?L433				
_?L456:						
						
	move.l 420(sp),d0			
	move.l 424(sp),d1			
	moveq #30,d1				
	lsr.l d1,d0				
						
	move.l d0,12(a1)			
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbcs _?L583				
	move.l a1,56(sp)			
	move.l 40(sp),d6			
						
	clr.l d1				
	move.b d7,d1				
						
	moveq #-32,d0				
	add.l d1,d0				
	jbmi _?L581				
	move.l d5,d1				
	lsl.l d0,d1				
	move.l d1,316(sp)			
	clr.l 320(sp)				
						
	addq.b #4,d7				
						
	move.b d7,16(a4)			
_?L877:						
						
	move.l 8(a4),a0				
	jbra _?L463				
_?L370:						
						
	moveq #31,d6				
	sub.l d4,d6				
	move.l d1,d5				
	lsr.l #1,d5				
	lsr.l d6,d5				
	move.l d0,d6				
	lsl.l d4,d6				
	move.l d6,244(sp)			
	or.l d5,244(sp)				
	move.l d1,d7				
	lsl.l d4,d7				
	move.l d7,248(sp)			
						
	move.w a5,d4				
	add.b #-17,d4				
	move.w d4,a5				
						
	move.b d4,16(a4)			
	jbra _?L372				
_?L576:						
						
	moveq #31,d4				
	sub.l d3,d4				
	move.l d1,d2				
	lsr.l #1,d2				
	lsr.l d4,d2				
	move.l d0,d4				
	lsl.l d3,d4				
	move.l d4,184(sp)			
	or.l d2,184(sp)				
	move.l d1,d6				
	lsl.l d3,d6				
	move.l d6,188(sp)			
						
	addq.b #4,d5				
						
	move.b d5,16(a4)			
	jbra _?L248				
_?L861:						
						
	move.l 104(sp),a1			
	move.l a3,136(sp)			
	move.w d5,a3				
	move.l d2,996(sp)			
	move.l d3,1000(sp)			
	move.w a5,d2				
	move.l 112(sp),d3			
	move.b d5,5(a1)				
						
	move.w a2,d5				
	tst.b d5				
	jbne _?L398				
						
	moveq #3,d6				
	move.l d6,18(a4)			
	jbra _?L816				
_?L120:						
						
	move.l 168(sp),d4			
	move.l 172(sp),d5			
	moveq #25,d5				
	lsr.l d5,d4				
						
	move.l d4,a0				
						
	move.l d4,2(a1)				
						
	moveq #127,d7				
	cmp.l d4,d7				
	jbeq _?L125				
						
	move.l d0,d2				
	lsl.l #7,d2				
	move.l d1,d4				
	moveq #25,d5				
	lsr.l d5,d4				
	or.l d4,d2				
	moveq #31,d4				
						
	moveq #31,d7				
						
	move.b d4,16(a4)			
						
	move.l 8(a4),a2				
	jbra _?L131				
_?L594:						
						
	moveq #2,d0				
	move.b d0,28(a5)			
						
	move.l #401,22(a4)			
						
	move.l 18(a4),d3			
	jbra _?L873				
_?L185:						
						
	moveq #31,d2				
	sub.l d1,d2				
	move.l d5,d0				
	lsr.l #1,d0				
	lsr.l d2,d0				
	move.l d4,d2				
	lsl.l d1,d2				
	move.l d2,324(sp)			
	or.l d0,324(sp)				
	move.l d5,d0				
	lsl.l d1,d0				
	move.l d0,328(sp)			
						
	addq.b #5,d7				
						
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbhi _?L188				
	jbra _?L874				
_?L172:						
						
	moveq #31,d6				
	sub.l d1,d6				
	move.l d5,d0				
	lsr.l #1,d0				
	lsr.l d6,d0				
	move.l d4,d6				
	lsl.l d1,d6				
	move.l d6,340(sp)			
	or.l d0,340(sp)				
	move.l d5,d7				
	lsl.l d1,d7				
	move.l d7,344(sp)			
	jbra _?L173				
_?L382:						
						
	move.b d4,d6				
	and.b #6,d6				
	jbne _?L384				
						
	and.b #1,d4				
	jbeq _?L385				
						
	moveq #1,d7				
	move.l d7,(a1)				
	move.w #514,a0				
						
	move.l a0,22(a4)			
	jbra _?L383				
_?L384:						
						
	moveq #3,d7				
	move.l d7,18(a4)			
						
	move.l #300,22(a4)			
	moveq #3,d3				
	jbra _?L724				
_?L593:						
						
	move.l d6,a3				
_?L174:						
						
	move.l 52(a4),a5			
						
	move.l 340(sp),d0			
	move.l 344(sp),d1			
	moveq #12,d1				
	lsr.l d1,d0				
						
	move.l d0,12(a5)			
						
	clr.l d1				
	move.b d7,d1				
						
	moveq #-32,d0				
	add.l d1,d0				
	jbmi _?L574				
	move.l d5,d1				
	lsl.l d0,d1				
	move.l d1,300(sp)			
	clr.l 304(sp)				
						
	addq.b #3,d7				
						
	move.b d7,16(a4)			
	jbra _?L182				
_?L827:						
	move.l 40(sp),a0			
_?L368:						
						
	move.l 348(sp),d5			
	move.l 352(sp),d6			
	add.l d5,d5				
	clr.l d5				
	clr.l d6				
	addx.l d6,d6				
	move.l d5,a2				
	move.l d6,a3				
						
	move.w a3,d6				
	move.b d6,56(sp)			
						
	move.w a3,d7				
	eor.b #1,d7				
	and.b #1,d7				
	move.w d7,a2				
						
	clr.l d5				
	move.b d4,d5				
	move.l d5,a3				
						
	moveq #-32,d5				
	add.l a3,d5				
	jbmi _?L578				
	move.l d1,d6				
	lsl.l d5,d6				
	move.l d6,244(sp)			
	clr.l 248(sp)				
						
	addq.b #6,d4				
	move.w d4,a5				
						
	move.b d4,16(a4)			
_?L876:						
	move.w a5,d4				
	move.l 136(sp),a3			
	move.l 40(sp),d5			
	jbra _?L376				
_?L179:						
						
	moveq #31,d2				
	sub.l d1,d2				
	move.l d5,d0				
	lsr.l #1,d0				
	lsr.l d2,d0				
	move.l d4,d2				
	lsl.l d1,d2				
	move.l d2,300(sp)			
	or.l d0,300(sp)				
	move.l d5,d0				
	lsl.l d1,d0				
	move.l d0,304(sp)			
						
	addq.b #3,d7				
						
	move.b d7,16(a4)			
						
	cmp.b #7,d7				
	jbhi _?L182				
	jbra _?L177				
_?L870:						
						
	tst.l 136(sp)				
	jbeq _?L550				
	move.l 136(sp),d0			
	lsl.l #2,d0				
	add.l a0,d0				
	move.l 136(sp),d7			
_?L552:						
						
	move.l (a0)+,d1				
	sub.l (a2),d1				
	move.l d1,(a2)+				
						
	cmp.l a0,d0				
	jbne _?L552				
_?L823:						
	move.l d7,136(sp)			
						
	moveq #32,d0				
	sub.b d2,d0				
						
	cmp.b #32,d2				
	jbeq _?L550				
						
	move.w a1,d4				
	tst.b d4				
	jbeq _?L550				
	lea (68,a4),a2				
	move.w a1,d6				
	clr.l d3				
	move.b d6,d3				
	lsl.l #2,d3				
	add.l a2,d3				
	clr.l d2				
	move.b d0,d2				
	move.l 136(sp),d7			
	jbra _?L558				
_?L585:						
						
	move.w #31,a2				
	sub.l d1,a2				
	move.l d5,d0				
	lsr.l #1,d0				
	move.l a2,d6				
	lsr.l d6,d0				
	move.l d4,d6				
	lsl.l d1,d6				
	move.l d6,308(sp)			
	or.l d0,308(sp)				
	move.l d5,d0				
	lsl.l d1,d0				
	move.l d0,312(sp)			
						
	addq.b #5,d2				
						
	move.b d2,16(a4)			
	jbra _?L875				
_?L599:						
						
	sub.l a2,a2				
	jbra _?L383				
_?L545:						
						
	tst.l 136(sp)				
	jbeq _?L550				
	move.l 136(sp),d4			
	lsl.l #2,d4				
	add.l a0,d4				
	move.l 136(sp),d7			
_?L555:						
						
	move.l (a0),d0				
						
	move.l (a2),d1				
						
	move.l d0,d3				
	add.l d3,d3				
						
	moveq #1,d0				
	and.l d1,d0				
						
	or.l d3,d0				
						
	move.l d1,d3				
	add.l d0,d3				
						
	asr.l #1,d3				
						
	move.l d3,(a0)+				
						
	sub.l d1,d0				
						
	asr.l #1,d0				
						
	move.l d0,(a2)+				
						
	cmp.l a0,d4				
	jbeq _?L823				
						
	move.l (a0),d0				
						
	move.l (a2),d1				
						
	move.l d0,d3				
	add.l d3,d3				
						
	moveq #1,d0				
	and.l d1,d0				
						
	or.l d3,d0				
						
	move.l d1,d3				
	add.l d0,d3				
						
	asr.l #1,d3				
						
	move.l d3,(a0)+				
						
	sub.l d1,d0				
						
	asr.l #1,d0				
						
	move.l d0,(a2)+				
						
	cmp.l a0,d4				
	jbne _?L555				
	jbra _?L823				
_?L544:						
						
	tst.l 136(sp)				
	jbeq _?L550				
	move.l 136(sp),d0			
	lsl.l #2,d0				
	add.l a0,d0				
	move.l 136(sp),d7			
_?L554:						
						
	move.l (a0),d3				
	add.l (a2)+,d3				
	move.l d3,(a0)+				
						
	cmp.l d0,a0				
	jbeq _?L823				
						
	move.l (a0),d3				
	add.l (a2)+,d3				
	move.l d3,(a0)+				
						
	cmp.l d0,a0				
	jbne _?L554				
	jbra _?L823				
_?L470:						
						
	moveq #-32,d0				
	add.l a5,d0				
	jbmi _?L587				
	move.l a3,d1				
	lsr.l d0,d1				
_?L588:						
						
	move.b d1,17(a1)			
						
	cmp.l a2,d1				
	jbne _?L476				
						
	clr.l d0				
	move.b d6,d0				
						
	move.l d0,-(sp)				
	move.l d5,-(sp)				
	move.l d4,-(sp)				
	move.l a1,48(sp)			
	jbsr ___ashldi3				
	lea (12,sp),sp				
	move.l d0,332(sp)			
	move.l d1,336(sp)			
						
	addq.b #5,d6				
						
	move.b d6,16(a4)			
	move.l 36(sp),a1			
						
	move.l 12(a4),d2			
						
	move.l 8(a4),a0				
	move.l 136(sp),d7			
	jbra _?L481				
_?L460:						
						
	moveq #31,d2				
	sub.l d1,d2				
	move.l d5,d0				
	lsr.l #1,d0				
	lsr.l d2,d0				
	move.l d4,d2				
	lsl.l d1,d2				
	move.l d2,316(sp)			
	or.l d0,316(sp)				
	move.l d5,d6				
	lsl.l d1,d6				
	move.l d6,320(sp)			
	jbra _?L461				
_?L477:						
	moveq #31,d2				
	sub.l d1,d2				
	move.l d5,d0				
	lsr.l #1,d0				
	lsr.l d2,d0				
	move.l d4,d2				
	lsl.l d1,d2				
	move.l d2,332(sp)			
	or.l d0,332(sp)				
	move.l d5,d7				
	lsl.l d1,d7				
	move.l d7,336(sp)			
						
	addq.b #5,d6				
						
	move.b d6,16(a4)			
						
	cmp.b #7,d6				
	jbhi _?L479				
	jbra _?L482				
_?L850:						
	move.l d6,a0				
	jbra _?L238				
_?L192:						
						
	move.l d3,a6				
	move.l #-1,18(a3)			
	move.l #-1,22(a3)			
	jbra _?L80				
_?L153:						
						
	move.l d3,a6				
	move.w #-1,2(a3)			
	jbra _?L80				
_?L578:						
						
	move.w #31,a5				
	sub.l a3,a5				
	move.l d1,d5				
	lsr.l #1,d5				
	move.l a5,d7				
	lsr.l d7,d5				
	move.l d0,d6				
	move.l a3,d7				
	lsl.l d7,d6				
	move.l d6,244(sp)			
	or.l d5,244(sp)				
	move.l d1,d5				
	lsl.l d7,d5				
	move.l d5,248(sp)			
						
	addq.b #6,d4				
	move.w d4,a5				
						
	move.b d4,16(a4)			
	jbra _?L876				
_?L245:						
						
	moveq #31,d4				
	sub.l d3,d4				
	move.l d1,d2				
	lsr.l #1,d2				
	lsr.l d4,d2				
	move.l d0,d6				
	lsl.l d3,d6				
	move.l d6,216(sp)			
	or.l d2,216(sp)				
	move.l d1,d7				
	lsl.l d3,d7				
	move.l d7,220(sp)			
						
	addq.b #4,d5				
						
	move.b d5,16(a4)			
	jbra _?L247				
_?L587:						
						
	move.l a3,d0				
	add.l d0,d0				
	moveq #31,d1				
	sub.l a5,d1				
	lsl.l d1,d0				
	move.l 40(sp),d1			
	move.l a5,d2				
	lsr.l d2,d1				
	or.l d0,d1				
	jbra _?L588				
_?L574:						
						
	moveq #31,d2				
	sub.l d1,d2				
	move.l d5,d0				
	lsr.l #1,d0				
	lsr.l d2,d0				
	move.l d4,d2				
	lsl.l d1,d2				
	move.l d2,300(sp)			
	or.l d0,300(sp)				
	move.l d5,d0				
	lsl.l d1,d0				
	move.l d0,304(sp)			
						
	addq.b #3,d7				
						
	move.b d7,16(a4)			
	jbra _?L182				
_?L145:						
						
	move.l d3,a6				
	move.w #-1,(a3)				
	jbra _?L80				
_?L165:						
						
	move.l d3,a6				
	moveq #-1,d6				
	move.l d6,8(a3)				
	jbra _?L80				
_?L385:						
						
	clr.l (a1)				
	move.w #502,a0				
						
	move.l a0,22(a4)			
	jbra _?L383				
_?L581:						
						
	moveq #31,d2				
	sub.l d1,d2				
	move.l d5,d0				
	lsr.l #1,d0				
	lsr.l d2,d0				
	move.l d4,d2				
	lsl.l d1,d2				
	move.l d2,316(sp)			
	or.l d0,316(sp)				
	move.l d5,d0				
	lsl.l d1,d0				
	move.l d0,320(sp)			
						
	addq.b #4,d7				
						
	move.b d7,16(a4)			
	jbra _?L877				
_?L862:						
	move.l a2,a0				
	jbra _?L428				
_?L198:						
						
	move.l d3,a6				
	st 26(a3,a2.l)				
	jbra _?L80				
_?L159:						
						
	move.l d3,a6				
	moveq #-1,d6				
	move.l d6,4(a3)				
	jbra _?L80				
_?L442:						
						
	pea 256.w				
	pea _?LC0				
	pea _?LC3				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.data					
	.align	2				
						
						
__fx_flac_fixed_coeffs:				
	.dc.l	0				
	.dc.l	0				
	.dc.l	0				
	.dc.l	0				
	.dc.l	1				
	.dc.l	0				
	.dc.l	0				
	.dc.l	0				
	.dc.l	2				
	.dc.l	-1				
	.dc.l	0				
	.dc.l	0				
	.dc.l	3				
	.dc.l	-3				
	.dc.l	1				
	.dc.l	0				
	.dc.l	4				
	.dc.l	-6				
	.dc.l	4				
	.dc.l	-1				
						
						
_fx_flac_sample_sizes_:				

	.dc.b $00				
	.dc.b $08,$0c,$ff,$10,$14,$18,$ff	
	.align	2				
						
						
_fx_flac_sample_rates_:				
	.dc.l	0				
	.dc.l	88200				
	.dc.l	176400				
	.dc.l	192000				
	.dc.l	8000				
	.dc.l	16000				
	.dc.l	22050				
	.dc.l	24000				
	.dc.l	32000				
	.dc.l	44100				
	.dc.l	48000				
	.dc.l	96000				
	.dc.l	0				
	.dc.l	0				
	.dc.l	0				
	.dc.l	-1				
	.align	2				
						
						
_fx_flac_block_sizes_:				
	.dc.l	-1				
	.dc.l	192				
	.dc.l	576				
	.dc.l	1152				
	.dc.l	2304				
	.dc.l	4608				
	.dc.l	0				
	.dc.l	0				
	.dc.l	256				
	.dc.l	512				
	.dc.l	1024				
	.dc.l	2048				
	.dc.l	4096				
	.dc.l	8192				
	.dc.l	16384				
	.dc.l	32768				
						
