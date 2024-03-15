* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"flac_decode.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_flac_decode_init		
						
_flac_decode_init:				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	clr.l (a3)				
						
	clr.l 4(a3)				
						
	clr.l 12(a3)				
						
	clr.l 16(a3)				
						
	clr.l 20(a3)				
						
	moveq #-1,d0				
	move.l d0,24(a3)			
						
	move.l d0,28(a3)			
						
	move.l d0,32(a3)			
						
	clr.l 36(a3)				
	clr.l 40(a3)				
						
	clr.l 44(a3)				
						
	clr.l 56(a3)				
						
	clr.l 60(a3)				
						
	clr.l 64(a3)				
						
	pea 8.w					
	move.l #65535,-(sp)			
	jbsr _fx_flac_size			
	addq.l #8,sp				
						
	pea 1.w					
	move.l d0,-(sp)				
	lea _himem_malloc,a4			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,60(a3)			
						
	jbeq _?L3				
						
	pea 8.w					
	move.l #65535,-(sp)			
	move.l d0,-(sp)				
	jbsr _fx_flac_init			
	lea (12,sp),sp				
						
	move.l d0,64(a3)			
						
	move.l #2097120,52(a3)			
						
	pea 1.w					
	move.l #2097120,-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,48(a3)			
						
	seq d0					
	extb.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L3:						
						
	moveq #-1,d0				
_?L2:						
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
						
	.align	2				
	.globl	_flac_decode_close		
						
_flac_decode_close:				
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	tst.l 64(a3)				
	jbeq _?L7				
						
	clr.l 64(a3)				
_?L7:						
						
	move.l 60(a3),d0			
						
	jbeq _?L8				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
						
	clr.l 60(a3)				
_?L8:						
						
	move.l 48(a3),d0			
						
	jbeq _?L9				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
						
	clr.l 48(a3)				
_?L9:						
						
	move.l 12(a3),d0			
						
	jbeq _?L10				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
						
	clr.l 12(a3)				
_?L10:						
						
	move.l 16(a3),d0			
						
	jbeq _?L11				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
						
	clr.l 16(a3)				
_?L11:						
						
	move.l 20(a3),d0			
						
	jbeq _?L6				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
						
	clr.l 20(a3)				
_?L6:						
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_flac_decode_setup		
						
_flac_decode_setup:				
	subq.l #8,sp				
	movem.l d3/d4/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),a0			
	move.l 36(sp),d0			
						
	move.l a0,(a3)				
						
	move.l d0,4(a3)				
						
	clr.l 8(a3)				
						
	moveq #-1,d1				
	move.l d1,24(a3)			
						
	move.l d1,28(a3)			
						
	move.l d1,32(a3)			
						
	clr.l 36(a3)				
	clr.l 40(a3)				
						
	clr.l 44(a3)				
	clr.l d1				
	moveq #20,d4				
	add.l sp,d4				
	moveq #16,d3				
	add.l sp,d3				
	lea _fx_flac_process,a4			
						
	sub.l d1,d0				
	move.l d0,16(sp)			
						
	move.l 52(a3),20(sp)			
						
	move.l d4,-(sp)				
	move.l 48(a3),-(sp)			
	move.l d3,-(sp)				
	pea (a0,d1.l)				
	move.l 64(a3),-(sp)			
	jbsr (a4)				
	lea (20,sp),sp				
						
	moveq #-1,d2				
	cmp.l d0,d2				
	jbeq _?L30				
_?L37:						
						
	move.l 8(a3),d1				
	add.l 16(sp),d1				
	move.l d1,8(a3)				
						
	subq.l #2,d0				
	jbeq _?L33				
						
	move.l 4(a3),d0				
						
	move.l (a3),a0				
						
	sub.l d1,d0				
	move.l d0,16(sp)			
						
	move.l 52(a3),20(sp)			
						
	move.l d4,-(sp)				
	move.l 48(a3),-(sp)			
	move.l d3,-(sp)				
	pea (a0,d1.l)				
	move.l 64(a3),-(sp)			
	jbsr (a4)				
	lea (20,sp),sp				
						
	moveq #-1,d2				
	cmp.l d0,d2				
	jbne _?L37				
_?L30:						
						
	movem.l (sp)+,d3/d4/a3/a4		
	addq.l #8,sp				
	rts					
_?L33:						
						
	pea 4.w					
	move.l 64(a3),-(sp)			
	lea _fx_flac_get_streaminfo,a4		
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d1,24(a3)			
						
	pea 5.w					
	move.l 64(a3),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d1,28(a3)			
						
	pea 6.w					
	move.l 64(a3),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d1,32(a3)			
						
	pea 7.w					
	move.l 64(a3),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,36(a3)			
	move.l d1,40(a3)			
						
	clr.l d0				
_?L32:						
						
	movem.l (sp)+,d3/d4/a3/a4		
	addq.l #8,sp				
	rts					
						
	.align	2				
	.globl	_flac_decode_full		
						
_flac_decode_full:				
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/a3/a4/a5,-(sp)	
	move.l 40(sp),a3			
	move.l 44(sp),d4			
	move.l 48(sp),d6			
						
	sub.l a5,a5				
						
	moveq #32,d3				
	add.l sp,d3				
	lea _fx_flac_process,a4			
	move.l d4,d5				
	addq.l #4,d5				
_?L53:						
						
	move.l 52(a3),28(sp)			
						
	move.l 56(a3),d1			
						
	jbeq _?L39				
_?L70:						
						
	move.l d1,28(sp)			
						
	clr.l 56(a3)				
						
	move.l d1,d0				
	muls.l 28(a3),d0			
						
	add.l a5,d0				
	add.l d0,d0				
						
	cmp.l d0,d6				
	jbcs _?L66				
_?L43:						
						
	move.l 32(a3),d0			
						
	moveq #16,d2				
	cmp.l d0,d2				
	jbeq _?L67				
						
	moveq #24,d2				
	cmp.l d0,d2				
	jbne _?L53				
						
	tst.l d1				
	jbeq _?L53				
	move.l 48(a3),a1			
	move.l a5,d0				
	add.l d0,d0				
	move.l d4,a0				
	add.l d0,a0				
	subq.l #1,d1				
	moveq #-2,d0				
	and.l d0,d1				
	move.l d1,d2				
	add.l a5,d2				
	add.l d2,d2				
	add.l d5,d2				
_?L52:						
						
	move.l (a1),d0				
	jbmi _?L68				
	swap d0					
	ext.l d0				
						
	move.w d0,(a0)				
						
	move.l 4(a1),d0				
	jbmi _?L69				
_?L51:						
	swap d0					
	ext.l d0				
						
	move.w d0,2(a0)				
						
	addq.l #8,a1				
	addq.l #4,a0				
	cmp.l d2,a0				
	jbne _?L52				
_?L62:						
						
	lea 2(a5,d1.l),a5			
						
	move.l 52(a3),28(sp)			
						
	move.l 56(a3),d1			
						
	jbne _?L70				
_?L39:						
						
	move.l 8(a3),d0				
						
	move.l 4(a3),d1				
	sub.l d0,d1				
	move.l d1,32(sp)			
						
	pea 28(sp)				
	move.l 48(a3),-(sp)			
	move.l d3,-(sp)				
	add.l (a3),d0				
	move.l d0,-(sp)				
	move.l 64(a3),-(sp)			
	jbsr (a4)				
	lea (20,sp),sp				
						
	moveq #-1,d2				
	cmp.l d0,d2				
	jbeq _?L42				
						
	move.l 32(sp),d0			
	add.l d0,8(a3)				
						
	move.l 28(sp),d1			
	move.l d1,d0				
	muls.l 28(a3),d0			
						
	add.l a5,d0				
	add.l d0,d0				
						
	cmp.l d0,d6				
	jbcc _?L43				
_?L66:						
						
	move.l d1,56(a3)			
						
	clr.l d0				
_?L42:						
						
	move.l a5,d1				
	add.l d1,d1				
						
	move.l 52(sp),a0			
	move.l d1,(a0)				
						
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5	
	addq.l #8,sp				
	rts					
_?L69:						
						
	add.l #65535,d0				
	swap d0					
	ext.l d0				
						
	move.w d0,2(a0)				
						
	addq.l #8,a1				
	addq.l #4,a0				
	cmp.l d2,a0				
	jbne _?L52				
	jbra _?L62				
_?L68:						
						
	add.l #65535,d0				
	swap d0					
	ext.l d0				
						
	move.w d0,(a0)				
						
	move.l 4(a1),d0				
	jbpl _?L51				
	jbra _?L69				
_?L67:						
						
	tst.l d1				
	jbeq _?L53				
	move.l 48(a3),a1			
	move.l a5,d0				
	add.l d0,d0				
	move.l d4,a0				
	add.l d0,a0				
	subq.l #1,d1				
	moveq #-2,d0				
	and.l d0,d1				
	move.l d1,d2				
	add.l a5,d2				
	add.l d2,d2				
	add.l d5,d2				
						
	move.l (a1),d0				
	jbmi _?L71				
_?L46:						
						
	swap d0					
	ext.l d0				
						
	move.w d0,(a0)				
						
	move.l 4(a1),d0				
	jbmi _?L72				
_?L47:						
	swap d0					
	ext.l d0				
						
	move.w d0,2(a0)				
						
	addq.l #8,a1				
	addq.l #4,a0				
	cmp.l d2,a0				
	jbeq _?L62				
_?L65:						
						
	move.l (a1),d0				
	jbpl _?L46				
_?L71:						
						
	add.l #65535,d0				
	swap d0					
	ext.l d0				
						
	move.w d0,(a0)				
						
	move.l 4(a1),d0				
	jbpl _?L47				
_?L72:						
	add.l #65535,d0				
	swap d0					
	ext.l d0				
						
	move.w d0,2(a0)				
						
	addq.l #8,a1				
	addq.l #4,a0				
	cmp.l d2,a0				
	jbne _?L65				
	jbra _?L62				
						
	.align	2				
	.globl	_flac_decode_resample		
						
_flac_decode_resample:				
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a3			
	move.l 52(sp),a5			
						
	clr.l d3				
						
	move.w 62(sp),a6			
_?L92:						
						
	move.l 52(a3),36(sp)			
						
	move.l 56(a3),d1			
						
	jbeq _?L74				
_?L102:						
						
	move.l d1,36(sp)			
						
	clr.l 56(a3)				
_?L75:						
						
	move.l d1,d0				
	add.l d3,d0				
	add.l d0,d0				
						
	cmp.l 56(sp),d0				
	jbhi _?L79				
						
	move.l 32(a3),d0			
						
	moveq #16,d5				
	cmp.l d0,d5				
	jbeq _?L99				
						
	moveq #24,d5				
	cmp.l d0,d5				
	jbne _?L92				
	move.l 44(a3),a0			
						
	move.l 24(a3),d6			
						
	sub.l a1,a1				
						
	clr.l d2				
_?L91:						
						
	add.l a6,a0				
						
	cmp.l a0,d6				
	jbhi _?L88				
						
	move.l 48(a3),a2			
						
	move.l d3,d7				
	addq.l #1,d7				
						
	move.l 4(a2,a1.l),d0			
	jbmi _?L100				
	moveq #20,d4				
	asr.l d4,d0				
						
	move.l (a2,a1.l),a2			
	tst.l a2				
	jblt _?L101				
_?L90:						
	move.l a2,d5				
	moveq #20,d4				
	asr.l d4,d5				
						
	add.l d5,d0				
						
	move.l d0,d0				
	jbpl _?L106				
	addq.l #1,d0				
_?L106:						
	asr.l #1,d0				
						
	move.w d0,(a5,d3.l*2)			
						
	sub.l d6,a0				
						
	move.l d7,d3				
_?L88:						
						
	addq.l #2,d2				
						
	addq.l #8,a1				
	cmp.l d1,d2				
	jbcs _?L91				
	move.l a0,44(a3)			
_?L105:						
						
	move.l 52(a3),36(sp)			
						
	move.l 56(a3),d1			
						
	jbne _?L102				
_?L74:						
						
	move.l 8(a3),d0				
						
	move.l 4(a3),d1				
	sub.l d0,d1				
	move.l d1,40(sp)			
						
	pea 36(sp)				
	move.l 48(a3),-(sp)			
	pea 48(sp)				
	add.l (a3),d0				
	move.l d0,-(sp)				
	move.l 64(a3),-(sp)			
	jbsr _fx_flac_process			
	lea (20,sp),sp				
						
	moveq #-1,d2				
	cmp.l d0,d2				
	jbeq _?L77				
						
	move.l 40(sp),d4			
	add.l d4,8(a3)				
						
	move.l 36(sp),d1			
						
	jbne _?L75				
						
	clr.l d0				
_?L77:						
						
	add.l d3,d3				
						
	move.l 64(sp),a0			
	move.l d3,(a0)				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L101:						
						
	add.l #1048575,a2			
	move.l a2,d5				
	moveq #20,d4				
	asr.l d4,d5				
						
	add.l d5,d0				
						
	move.l d0,d0				
	jbpl _?L107				
	addq.l #1,d0				
_?L107:						
	asr.l #1,d0				
						
	move.w d0,(a5,d3.l*2)			
						
	sub.l d6,a0				
						
	move.l d7,d3				
	jbra _?L88				
_?L100:						
						
	add.l #1048575,d0			
	moveq #20,d4				
	asr.l d4,d0				
						
	move.l (a2,a1.l),a2			
	tst.l a2				
	jbge _?L90				
	jbra _?L101				
_?L99:						
	move.l 44(a3),a0			
						
	move.l 24(a3),a2			
						
	sub.l a1,a1				
						
	clr.l d2				
_?L81:						
						
	add.l a6,a0				
						
	cmp.l a0,a2				
	jbhi _?L83				
						
	move.l 48(a3),a4			
						
	move.l d3,d6				
	addq.l #1,d6				
						
	move.l (a4,a1.l),d0			
	jbmi _?L103				
	moveq #20,d7				
	asr.l d7,d0				
						
	add.l 4(a4,a1.l),d0			
						
	jbmi _?L104				
_?L85:						
	moveq #21,d4				
	asr.l d4,d0				
						
	move.w d0,(a5,d3.l*2)			
						
	sub.l a2,a0				
						
	move.l d6,d3				
_?L83:						
						
	addq.l #2,d2				
						
	addq.l #8,a1				
	cmp.l d1,d2				
	jbcs _?L81				
	move.l a0,44(a3)			
	jbra _?L105				
_?L103:						
						
	add.l #1048575,d0			
	moveq #20,d7				
	asr.l d7,d0				
						
	add.l 4(a4,a1.l),d0			
						
	jbpl _?L85				
_?L104:						
	add.l #2097151,d0			
	moveq #21,d4				
	asr.l d4,d0				
						
	move.w d0,(a5,d3.l*2)			
						
	sub.l a2,a0				
						
	move.l d6,d3				
	jbra _?L83				
_?L79:						
						
	move.l d1,56(a3)			
						
	clr.l d0				
	jbra _?L77				
						
						
