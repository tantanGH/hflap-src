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
	movem.l d3/a3/a4/a5,-(sp)		
	move.l 20(sp),a4			
						
	clr.l (a4)				
						
	clr.l 4(a4)				
						
	clr.l 12(a4)				
						
	clr.l 16(a4)				
						
	clr.l 20(a4)				
						
	moveq #-1,d0				
	move.l d0,24(a4)			
						
	move.l d0,28(a4)			
						
	move.l d0,32(a4)			
						
	clr.l 36(a4)				
	clr.l 40(a4)				
						
	clr.l 44(a4)				
						
	clr.l 52(a4)				
						
	pea 470.w				
	clr.l -(sp)				
	pea 56(a4)				
	jbsr _memset				
						
	addq.l #8,sp				
	moveq #1,d0				
	move.l d0,(sp)				
	pea 32.w				
	lea _himem_malloc,a5			
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,a3				
						
	move.l d0,48(a4)			
	clr.l d3				
						
	tst.l d0				
	jbeq _?L4				
_?L2:						
						
	add.l d3,a3				
						
	pea 1.w					
	move.l #262140,-(sp)			
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l d0,(a3)				
						
	move.l 48(a4),a3			
						
	tst.l (a3,d3.l)				
	jbeq _?L4				
						
	addq.l #4,d3				
	moveq #32,d0				
	cmp.l d3,d0				
	jbne _?L2				
						
	clr.l d0				
_?L3:						
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L4:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
						
	.align	2				
	.globl	_flac_decode_close		
						
_flac_decode_close:				
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a3			
						
	move.l 48(a3),a0			
						
	tst.l a0				
	jbeq _?L11				
	clr.l d3				
	lea _himem_free,a4			
_?L13:						
						
	move.l (a0,d3.l),d0			
						
	jbeq _?L12				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 48(a3),a0			
						
	clr.l (a0,d3.l)				
_?L12:						
						
	addq.l #4,d3				
	moveq #32,d0				
	cmp.l d3,d0				
	jbne _?L13				
						
	pea 1.w					
	move.l a0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	clr.l 48(a3)				
_?L11:						
						
	move.l 12(a3),d0			
						
	jbeq _?L14				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
						
	clr.l 12(a3)				
_?L14:						
						
	move.l 16(a3),d0			
						
	jbeq _?L15				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
						
	clr.l 16(a3)				
_?L15:						
						
	move.l 20(a3),d0			
						
	jbeq _?L10				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
						
	clr.l 20(a3)				
_?L10:						
						
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.align	2				
	.globl	_flac_decode_setup		
						
_flac_decode_setup:				
	lea (-20,sp),sp				
	movem.l d3/d4/d5/d6/a3/a4/a5/a6,-(sp)	
	move.l 56(sp),a3			
						
	move.l 60(sp),(a3)			
						
	move.l 64(sp),4(a3)			
						
	clr.l 8(a3)				
						
	moveq #-1,d0				
	move.l d0,24(a3)			
						
	move.l d0,28(a3)			
						
	move.l d0,32(a3)			
						
	clr.l 36(a3)				
	clr.l 40(a3)				
						
	clr.l 44(a3)				
						
	lea (56,a3),a4				
						
	clr.l -(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_init			
	addq.l #8,sp				
						
	clr.l 36(sp)				
						
	move.l 8(a3),d0				
						
	lea (36,sp),a5				
	move.l a5,-(sp)				
	move.l 4(a3),d1				
	sub.l d0,d1				
	move.l d1,-(sp)				
	add.l (a3),d0				
	move.l d0,-(sp)				
	move.l a4,-(sp)				
	lea _miniflac_sync,a6			
	jbsr (a6)				
	lea (16,sp),sp				
						
	subq.l #1,d0				
	jbne _?L37				
						
	move.l 8(a3),d0				
	add.l 36(sp),d0				
	move.l d0,8(a3)				
						
	moveq #4,d1				
	cmp.l 56(a3),d1				
	jbne _?L43				
						
	moveq #40,d5				
	add.l sp,d5				
	move.l #_miniflac_streaminfo_sample_rate,d4
						
	moveq #35,d3				
	add.l sp,d3				
						
	moveq #44,d6				
	add.l sp,d6				
_?L38:						
						
	move.l 4(a3),d1				
						
	move.l (a3),a0				
						
	tst.l 170(a3)				
	jbne _?L40				
						
	move.l d5,-(sp)				
	move.l a5,-(sp)				
	sub.l d0,d1				
	move.l d1,-(sp)				
	pea (a0,d0.l)				
	move.l a4,-(sp)				
	move.l d4,a0				
	jbsr (a0)				
	lea (20,sp),sp				
						
	subq.l #1,d0				
	jbne _?L37				
						
	move.l 8(a3),d0				
	add.l 36(sp),d0				
	move.l d0,8(a3)				
						
	move.l 40(sp),24(a3)			
						
	move.l d3,-(sp)				
	move.l a5,-(sp)				
	move.l 4(a3),d2				
	sub.l d0,d2				
	move.l d2,-(sp)				
	add.l (a3),d0				
	move.l d0,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_streaminfo_channels	
	lea (20,sp),sp				
						
	subq.l #1,d0				
	jbne _?L37				
						
	move.l 8(a3),d0				
	add.l 36(sp),d0				
	move.l d0,8(a3)				
						
	clr.l d1				
	move.b 35(sp),d1			
	move.l d1,28(a3)			
						
	move.l d3,-(sp)				
	move.l a5,-(sp)				
	move.l 4(a3),d2				
	sub.l d0,d2				
	move.l d2,-(sp)				
	add.l (a3),d0				
	move.l d0,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_streaminfo_bps		
	lea (20,sp),sp				
						
	subq.l #1,d0				
	jbne _?L37				
						
	move.l 8(a3),d0				
	add.l 36(sp),d0				
	move.l d0,8(a3)				
						
	clr.l d1				
	move.b 35(sp),d1			
	move.l d1,32(a3)			
						
	move.l d6,-(sp)				
	move.l a5,-(sp)				
	move.l 4(a3),d2				
	sub.l d0,d2				
	move.l d2,-(sp)				
	add.l (a3),d0				
	move.l d0,-(sp)				
	move.l a4,-(sp)				
	jbsr _miniflac_streaminfo_total_samples	
	lea (20,sp),sp				
						
	subq.l #1,d0				
	jbne _?L37				
						
	move.l 8(a3),d0				
	add.l 36(sp),d0				
	move.l d0,8(a3)				
						
	move.l 44(sp),d1			
	move.l 48(sp),d2			
	move.l d1,36(a3)			
	move.l d2,40(a3)			
_?L40:						
						
	move.l a5,-(sp)				
	move.l 4(a3),d2				
	sub.l d0,d2				
	move.l d2,-(sp)				
	add.l (a3),d0				
	move.l d0,-(sp)				
	move.l a4,-(sp)				
	jbsr (a6)				
	lea (16,sp),sp				
						
	subq.l #1,d0				
	jbne _?L37				
						
	move.l 8(a3),d0				
	add.l 36(sp),d0				
	move.l d0,8(a3)				
						
	moveq #4,d2				
	cmp.l 56(a3),d2				
	jbeq _?L38				
_?L43:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5/a6	
	lea (20,sp),sp				
	rts					
_?L37:						
						
	moveq #-1,d0				
_?L39:						
						
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5/a6	
	lea (20,sp),sp				
	rts					
						
	.align	2				
	.globl	_flac_decode_full		
						
_flac_decode_full:				
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/a3/a4/a5,-(sp)	
	move.l 36(sp),a3			
	move.l 40(sp),d4			
	move.l 44(sp),d6			
						
	clr.l 28(sp)				
						
	lea (56,a3),a5				
						
	clr.l d5				
						
	moveq #28,d3				
	add.l sp,d3				
	lea _miniflac_decode,a4			
_?L49:						
						
	move.l 52(a3),d1			
						
	jbeq _?L50				
_?L73:						
						
	clr.l 52(a3)				
						
	clr.l d0				
	move.b 292(a3),d0			
						
	muls.l d1,d0				
						
	add.l d5,d0				
	add.l d0,d0				
						
	cmp.l d0,d6				
	jbcs _?L71				
_?L53:						
						
	move.b 293(a3),d0			
						
	cmp.b #16,d0				
	jbeq _?L72				
						
	cmp.b #24,d0				
	jbne _?L49				
						
	tst.l d1				
	jbeq _?L49				
						
	move.l 48(a3),a2			
	move.l 4(a2),a1				
	move.l d5,d0				
	add.l d0,d0				
	move.l d4,a0				
	add.l d0,a0				
	move.l (a2),a2				
	move.l d1,d2				
	lsl.l #2,d2				
	add.l a1,d2				
_?L58:						
						
	move.l (a1)+,d0				
						
	asr.l #8,d0				
						
	move.w d0,(a0)				
						
	move.l (a2)+,d0				
						
	asr.l #8,d0				
						
	move.w d0,2(a0)				
						
	addq.l #4,a0				
	cmp.l d2,a1				
	jbne _?L58				
_?L67:						
						
	add.l d1,d1				
	add.l d1,d5				
						
	move.l 52(a3),d1			
						
	jbne _?L73				
_?L50:						
						
	move.l 8(a3),d0				
						
	move.l 48(a3),-(sp)			
	move.l d3,-(sp)				
	move.l 4(a3),d1				
	sub.l d0,d1				
	move.l d1,-(sp)				
	add.l (a3),d0				
	move.l d0,-(sp)				
	move.l a5,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
						
	subq.l #1,d0				
	jbne _?L54				
						
	move.l 28(sp),d0			
	add.l d0,8(a3)				
						
	clr.l d1				
	move.w 282(a3),d1			
						
	clr.l d0				
	move.b 292(a3),d0			
						
	muls.l d1,d0				
						
	add.l d5,d0				
	add.l d0,d0				
						
	cmp.l d0,d6				
	jbcc _?L53				
_?L71:						
						
	move.l d1,52(a3)			
_?L54:						
						
	add.l d5,d5				
						
	move.l 48(sp),a0			
	move.l d5,(a0)				
						
	clr.l d0				
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5	
	addq.l #4,sp				
	rts					
_?L72:						
						
	tst.l d1				
	jbeq _?L49				
						
	move.l 48(a3),a2			
	move.l 4(a2),a1				
	move.l d5,d0				
	add.l d0,d0				
	move.l d4,a0				
	add.l d0,a0				
	move.l (a2),a2				
	move.l d1,d2				
	lsl.l #2,d2				
	add.l a1,d2				
_?L57:						
						
	move.l (a1)+,d0				
						
	move.w d0,(a0)				
						
	move.l (a2)+,d0				
						
	move.w d0,2(a0)				
						
	addq.l #4,a0				
	cmp.l d2,a1				
	jbeq _?L67				
						
	move.l (a1)+,d0				
						
	move.w d0,(a0)				
						
	move.l (a2)+,d0				
						
	move.w d0,2(a0)				
						
	addq.l #4,a0				
	cmp.l d2,a1				
	jbne _?L57				
	jbra _?L67				
						
	.align	2				
	.globl	_flac_decode_resample		
						
_flac_decode_resample:				
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 44(sp),a3			
	move.l 48(sp),a5			
	move.l 52(sp),d5			
						
	clr.l 36(sp)				
						
	moveq #56,d6				
	add.l a3,d6				
						
	clr.l d3				
						
	move.w 58(sp),a6			
						
	moveq #36,d4				
	add.l sp,d4				
	lea _miniflac_decode,a4			
_?L75:						
						
	move.l 52(a3),d0			
						
	jbeq _?L76				
_?L101:						
						
	clr.l 52(a3)				
						
	move.l d0,d1				
	add.l d3,d1				
	add.l d1,d1				
						
	cmp.l d5,d1				
	jbhi _?L77				
						
	move.b 293(a3),d1			
						
	cmp.b #16,d1				
	jbeq _?L78				
_?L79:						
						
	cmp.b #24,d1				
	jbne _?L75				
						
	tst.l d0				
	jbeq _?L75				
	move.l 44(a3),d1			
						
	move.l 24(a3),a1			
						
	clr.l d2				
_?L89:						
						
	add.l a6,d1				
						
	cmp.l d1,a1				
	jbhi _?L88				
						
	move.l 48(a3),a2			
						
	move.l (a2),a0				
						
	move.l 4(a2),a2				
						
	move.l d2,d1				
	lsl.l #2,d1				
	move.l (a0,d1.l),d7			
	add.l (a2,d1.l),d7			
	move.l d7,d1				
						
	moveq #12,d7				
	asr.l d7,d1				
						
	move.w d1,(a5,d3.l*2)			
						
	addq.l #1,d3				
						
	clr.l d1				
_?L88:						
						
	addq.l #1,d2				
						
	cmp.l d2,d0				
	jbne _?L89				
	move.l d1,44(a3)			
_?L102:						
						
	move.l 52(a3),d0			
						
	jbne _?L101				
_?L76:						
						
	move.l 8(a3),d0				
						
	move.l 48(a3),-(sp)			
	move.l d4,-(sp)				
	move.l 4(a3),d1				
	sub.l d0,d1				
	move.l d1,-(sp)				
	add.l (a3),d0				
	move.l d0,-(sp)				
	move.l d6,-(sp)				
	jbsr (a4)				
	lea (20,sp),sp				
						
	subq.l #1,d0				
	jbne _?L82				
						
	move.l 36(sp),d0			
	add.l d0,8(a3)				
						
	clr.l d0				
	move.w 282(a3),d0			
						
	move.l d3,d1				
	add.l d0,d1				
	add.l d1,d1				
						
	cmp.l d1,d5				
	jbcs _?L77				
						
	move.b 293(a3),d1			
						
	cmp.b #16,d1				
	jbne _?L79				
						
	tst.l d0				
	jbeq _?L75				
_?L78:						
	move.l 44(a3),d1			
						
	move.l 24(a3),a1			
						
	clr.l d2				
_?L85:						
						
	add.l a6,d1				
						
	cmp.l d1,a1				
	jbhi _?L84				
						
	move.l 48(a3),a2			
						
	move.l (a2),a0				
						
	move.l 4(a2),a2				
						
	move.l d2,d1				
	lsl.l #2,d1				
	move.l (a0,d1.l),d7			
	add.l (a2,d1.l),d7			
	move.l d7,d1				
						
	asr.l #4,d1				
						
	move.w d1,(a5,d3.l*2)			
						
	addq.l #1,d3				
						
	clr.l d1				
_?L84:						
						
	addq.l #1,d2				
						
	cmp.l d2,d0				
	jbne _?L85				
	move.l d1,44(a3)			
	jbra _?L102				
_?L77:						
						
	move.l d0,52(a3)			
_?L82:						
						
	add.l d3,d3				
						
	move.l 60(sp),a0			
	move.l d3,(a0)				
						
	clr.l d0				
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
						
						
