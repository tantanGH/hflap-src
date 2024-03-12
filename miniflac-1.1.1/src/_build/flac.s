* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"flac.c"			
						
						
						
						
						
	.text					
	.align	2				
						
_miniflac_sync_internal:			
	movem.l d3/d4/a3/a4/a5,-(sp)		
	move.l 24(sp),a3			
	move.l 28(sp),d3			
						
	moveq #5,d0				
	cmp.l (a3),d0				
	jbcs _?L2				
	move.l (a3),d0				
	add.l d0,d0				
	move.w _?L4(pc,d0.l),d0			
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L4:						
	.dc.w _?L9-_?L4				
	.dc.w _?L8-_?L4				
	.dc.w _?L7-_?L4				
	.dc.w _?L6-_?L4				
	.dc.w _?L5-_?L4				
	.dc.w _?L3-_?L4				
_?L9:						
						
	move.l d3,-(sp)				
	pea 92(a3)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1				
						
	move.b #1,468(a3)			
						
	move.l 78(a3),464(a3)			
						
	moveq #2,d0				
	move.l d0,(a3)				
_?L7:						
						
	move.l d3,-(sp)				
	pea 96(a3)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1				
_?L18:						
						
	moveq #3,d0				
	move.l d0,(a3)				
_?L6:						
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L23				
_?L13:						
						
	clr.l d0				
_?L1:						
						
	movem.l (sp)+,d3/d4/a3/a4/a5		
	rts					
_?L8:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L13				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L24				
						
	cmp.b #-1,d1				
	jbne _?L2				
_?L14:						
						
	moveq #5,d0				
	move.l d0,(a3)				
_?L3:						
						
	lea (122,a3),a4				
						
	move.l a3,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a5		
						
	tst.l 210(a3)				
	jbeq _?L25				
_?L17:						
						
	clr.l -(sp)				
	move.l a4,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1				
						
	tst.l 210(a3)				
	jbne _?L17				
_?L25:						
						
	move.l a4,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	movem.l (sp)+,d3/d4/a3/a4/a5		
	rts					
_?L23:						
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L14				
						
	moveq #4,d1				
	move.l d1,(a3)				
_?L5:						
						
	lea (100,a3),a0				
						
	tst.l 100(a3)				
	jbeq _?L26				
						
	move.l d3,-(sp)				
	move.l a0,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L18				
						
	movem.l (sp)+,d3/d4/a3/a4/a5		
	rts					
_?L26:						
						
	move.l d3,28(sp)			
	move.l a0,24(sp)			
						
	movem.l (sp)+,d3/d4/a3/a4/a5		
						
	jbra _miniflac_metadata_sync		
_?L2:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5		
	rts					
_?L24:						
						
	moveq #2,d1				
	move.l d1,(a3)				
						
	move.l d3,-(sp)				
	pea 96(a3)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1				
	jbra _?L18				
						
	.align	2				
						
_miniflac_oggfunction_start:			
	movem.l d3/d4/d5/d6/a3/a4/a5/a6,-(sp)	
	move.l 36(sp),a3			
						
	moveq #12,d0				
	cmp.l 36(a3),d0				
	jbeq _?L37				
						
	lea (40,a3),a6				
						
	lea (36,a3),a5				
	lea _miniflac_ogg_sync,a4		
						
	move.l a3,d6				
	addq.l #8,d6				
						
	moveq #92,d5				
	add.l a3,d5				
						
	moveq #96,d4				
	add.l a3,d4				
						
	move.l a3,d3				
	add.l #210,d3				
_?L38:						
						
	move.l a6,-(sp)				
	move.l a5,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L27				
						
	tst.b 468(a3)				
	jbne _?L32				
						
	btst #1,69(a3)				
	jbne _?L33				
_?L42:						
						
	move.l 36(a3),d0			
						
	moveq #12,d1				
	cmp.l d0,d1				
	jbne _?L38				
_?L37:						
						
	move.l 52(a3),d0			
						
	move.l 44(sp),a0			
	move.l 40(sp),d1			
	add.l d0,d1				
	move.l d1,(a0)				
						
	move.l 56(a3),d1			
	sub.l d0,d1				
						
	move.l 48(sp),a0			
	move.l d1,(a0)				
						
	clr.l d0				
	move.w 88(a3),d0			
						
	clr.l d2				
	move.w 90(a3),d2			
						
	sub.l d2,d0				
						
	cmp.l d1,d0				
	jbcc _?L30				
						
	move.l d0,(a0)				
_?L30:						
						
	moveq #1,d0				
_?L27:						
						
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5/a6	
	rts					
_?L33:						
						
	move.l d6,-(sp)				
	jbsr _miniflac_bitreader_init		
						
	move.l d5,(sp)				
	jbsr _miniflac_oggheader_init		
						
	move.l d4,(sp)				
	jbsr _miniflac_streammarker_init	
	addq.l #4,sp				
						
	pea 100(a3)				
	jbsr _miniflac_metadata_init		
						
	move.l d3,(sp)				
	jbsr _miniflac_frame_init		
	addq.l #4,sp				
						
	clr.l (a3)				
						
	move.l 36(a3),d0			
						
	moveq #12,d1				
	cmp.l d0,d1				
	jbne _?L38				
	jbra _?L37				
_?L32:						
						
	move.l 464(a3),a0			
	cmp.l 78(a3),a0				
	jbeq _?L42				
						
	moveq #13,d0				
	move.l d0,36(a3)			
	jbra _?L38				
						
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
_?LC0:						
	.dc.b $31,$2e,$31,$2e,$31
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_version_string	
						
_miniflac_version_string:			
						
	move.l #_?LC0,d0			
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
						
	pea 8(a3)				
	jbsr _miniflac_bitreader_init		
	addq.l #4,sp				
						
	pea 36(a3)				
	jbsr _miniflac_ogg_init			
	addq.l #4,sp				
						
	pea 92(a3)				
	jbsr _miniflac_oggheader_init		
	addq.l #4,sp				
						
	pea 96(a3)				
	jbsr _miniflac_streammarker_init	
	addq.l #4,sp				
						
	pea 100(a3)				
	jbsr _miniflac_metadata_init		
	addq.l #4,sp				
						
	pea 210(a3)				
	jbsr _miniflac_frame_init		
	addq.l #4,sp				
						
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
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a3			
						
	move.l 4(a3),d0				
						
	jbeq _?L105				
						
	subq.l #1,d0				
	jbeq _?L106				
						
	clr.l 36(sp)				
						
	clr.l 40(sp)				
						
	move.l 52(sp),60(a3)			
						
	move.l 56(sp),56(a3)			
						
	clr.l 52(a3)				
						
	moveq #100,d6				
	add.l a3,d6				
						
	moveq #96,d7				
	add.l a3,d7				
_?L93:						
						
	pea 40(sp)				
	pea 40(sp)				
	move.l 60(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_oggfunction_start	
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L66				
						
	move.l 36(sp),28(a3)			
						
	move.l 40(sp),24(a3)			
						
	clr.l 20(a3)				
						
	move.l a3,d3				
	addq.l #8,d3				
						
	move.l #_?L70,a6			
						
	move.l #_miniflac_bitreader_fill,d5	
_?L67:						
						
	move.l (a3),d0				
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbeq _?L107				
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbcs _?L97				
	add.l d0,d0				
	move.w (a6,d0.l),d0			
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L70:						
	.dc.w _?L74-_?L70			
	.dc.w _?L73-_?L70			
	.dc.w _?L72-_?L70			
	.dc.w _?L71-_?L70			
	.dc.w _?L69-_?L70			
_?L74:						
						
	move.l d3,-(sp)				
	pea 92(a3)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L68				
						
	move.b #1,468(a3)			
						
	move.l 78(a3),464(a3)			
						
	moveq #2,d0				
	move.l d0,(a3)				
_?L72:						
						
	move.l d3,-(sp)				
	move.l d7,-(sp)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L68				
_?L101:						
						
	moveq #3,d0				
	move.l d0,(a3)				
_?L71:						
						
	pea 16.w				
	move.l d3,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L79				
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L80				
						
	moveq #4,d0				
	move.l d0,(a3)				
_?L69:						
						
	tst.l 100(a3)				
	jbne _?L81				
						
	move.l d3,-(sp)				
	move.l d6,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L67				
_?L68:						
						
	move.l 20(a3),d1			
						
	move.l d1,a0				
	add.l 52(a3),a0				
	move.l a0,52(a3)			
						
	add.w 90(a3),d1				
	move.w d1,90(a3)			
						
	cmp.w 88(a3),d1				
	jbeq _?L108				
_?L85:						
						
	tst.l d0				
	jbne _?L66				
	cmp.l 56(sp),a0				
	jbcs _?L93				
_?L66:						
						
	move.l 52(a3),a0			
_?L92:						
						
	move.l 60(sp),a1			
	move.l a0,(a1)				
_?L57:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L73:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L79				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L109				
						
	cmp.b #-1,d1				
	jbne _?L77				
_?L80:						
						
	moveq #5,d0				
	move.l d0,(a3)				
						
	lea (122,a3),a4				
						
	move.l a3,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a5		
						
	tst.l 210(a3)				
	jbeq _?L110				
_?L83:						
						
	clr.l -(sp)				
	move.l a4,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a5)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L68				
						
	tst.l 210(a3)				
	jbne _?L83				
_?L110:						
						
	move.l a4,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L67				
	jbra _?L68				
_?L108:						
						
	clr.l 36(a3)				
						
	btst #2,69(a3)				
	jbeq _?L85				
						
	cmp.b #1,468(a3)			
	jbne _?L85				
_?L87:						
						
	move.l 464(a3),a1			
	cmp.l 78(a3),a1				
	jbne _?L85				
						
	clr.b 468(a3)				
						
	clr.l 464(a3)				
	jbra _?L85				
_?L79:						
						
	clr.l d0				
						
	move.l 20(a3),d1			
						
	move.l d1,a0				
	add.l 52(a3),a0				
	move.l a0,52(a3)			
						
	add.w 90(a3),d1				
	move.w d1,90(a3)			
						
	cmp.w 88(a3),d1				
	jbne _?L85				
	jbra _?L108				
_?L81:						
						
	move.l d3,-(sp)				
	move.l d6,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L101				
						
	move.l 20(a3),d1			
						
	move.l d1,a0				
	add.l 52(a3),a0				
	move.l a0,52(a3)			
						
	add.w 90(a3),d1				
	move.w d1,90(a3)			
						
	cmp.w 88(a3),d1				
	jbne _?L85				
	jbra _?L108				
_?L105:						
						
	tst.l 56(sp)				
	jbeq _?L95				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L60				
	cmp.b #102,d0				
	jbeq _?L111				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L107:						
						
	move.l 64(sp),-(sp)			
	pea 122(a3)				
	move.l d3,-(sp)				
	pea 210(a3)				
	jbsr _miniflac_frame_decode		
	lea (16,sp),sp				
						
	move.l 20(a3),d1			
						
	move.l d1,a0				
	add.l 52(a3),a0				
	move.l a0,52(a3)			
						
	add.w 90(a3),d1				
	move.w d1,90(a3)			
						
	cmp.w 88(a3),d1				
	jbne _?L85				
	jbra _?L108				
_?L111:						
						
	moveq #1,d0				
	move.l d0,4(a3)				
						
	moveq #2,d1				
	move.l d1,(a3)				
	moveq #2,d0				
						
	move.l 52(sp),28(a3)			
						
	move.l 56(sp),24(a3)			
						
	clr.l 20(a3)				
						
	move.l a3,d3				
	addq.l #8,d3				
						
	lea _miniflac_sync_internal,a4		
_?L63:						
						
	subq.l #5,d0				
	jbeq _?L112				
_?L65:						
						
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L64				
						
	move.l (a3),d0				
						
	subq.l #5,d0				
	jbne _?L65				
_?L112:						
						
	move.l 64(sp),-(sp)			
	pea 122(a3)				
	move.l d3,-(sp)				
	pea 210(a3)				
	jbsr _miniflac_frame_decode		
	lea (16,sp),sp				
_?L64:						
						
	move.l 60(sp),a0			
	move.l 20(a3),(a0)			
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L106:						
						
	move.l (a3),d0				
						
	move.l 52(sp),28(a3)			
						
	move.l 56(sp),24(a3)			
						
	clr.l 20(a3)				
						
	move.l a3,d3				
	addq.l #8,d3				
						
	lea _miniflac_sync_internal,a4		
	jbra _?L63				
_?L95:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L109:						
						
	moveq #2,d1				
	move.l d1,(a3)				
						
	move.l d3,-(sp)				
	move.l d7,-(sp)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L68				
	jbra _?L101				
_?L60:						
						
	moveq #2,d0				
	move.l d0,4(a3)				
						
	clr.l (a3)				
						
	clr.l 36(sp)				
						
	clr.l 40(sp)				
						
	move.l 52(sp),60(a3)			
						
	move.l 56(sp),56(a3)			
						
	clr.l 52(a3)				
						
	moveq #100,d6				
	add.l a3,d6				
						
	moveq #96,d7				
	add.l a3,d7				
	jbra _?L93				
_?L77:						
						
	move.l 20(a3),d0			
						
	move.l d0,a0				
	add.l 52(a3),a0				
	move.l a0,52(a3)			
						
	add.w 90(a3),d0				
	move.w d0,90(a3)			
						
	cmp.w 88(a3),d0				
	jbeq _?L113				
						
	moveq #-1,d0				
						
	move.l 60(sp),a1			
	move.l a0,(a1)				
	jbra _?L57				
_?L113:						
						
	clr.l 36(a3)				
						
	moveq #-1,d0				
						
	btst #2,69(a3)				
	jbeq _?L66				
						
	cmp.b #1,468(a3)			
	jbeq _?L87				
						
	move.l 52(a3),a0			
	jbra _?L92				
_?L97:						
						
	moveq #-1,d0				
						
	move.l 20(a3),d1			
						
	move.l d1,a0				
	add.l 52(a3),a0				
	move.l a0,52(a3)			
						
	add.w 90(a3),d1				
	move.w d1,90(a3)			
						
	cmp.w 88(a3),d1				
	jbne _?L85				
	jbra _?L108				
						
	.align	2				
	.globl	_miniflac_sync			
						
_miniflac_sync:					
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a5			
	move.l 52(sp),d5			
						
	move.l 4(a5),d0				
						
	jbeq _?L162				
						
	subq.l #1,d0				
	jbeq _?L118				
						
	clr.l 36(sp)				
						
	clr.l 40(sp)				
						
	move.l d5,60(a5)			
						
	move.l 56(sp),56(a5)			
						
	clr.l 52(a5)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a6	
						
	move.l a5,d3				
	addq.l #8,d3				
						
	move.l a5,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L146:						
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	move.l a5,-(sp)				
	jbsr (a6)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L120				
						
	move.l 36(sp),28(a5)			
						
	move.l 40(sp),24(a5)			
						
	clr.l 20(a5)				
						
	moveq #5,d2				
	cmp.l (a5),d2				
	jbcs _?L150				
	move.l (a5),d0				
	add.l d0,d0				
	move.w _?L123(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L123:						
	.dc.w _?L128-_?L123			
	.dc.w _?L127-_?L123			
	.dc.w _?L126-_?L123			
	.dc.w _?L125-_?L123			
	.dc.w _?L124-_?L123			
	.dc.w _?L122-_?L123			
_?L162:						
						
	tst.l 56(sp)				
	jbeq _?L148				
	move.l d5,a0				
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L117				
	cmp.b #102,d0				
	jbeq _?L163				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L128:						
						
	move.l d3,-(sp)				
	pea 92(a5)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L159				
						
	move.b #1,468(a5)			
						
	move.l 78(a5),464(a5)			
						
	moveq #2,d2				
	move.l d2,(a5)				
_?L126:						
						
	move.l d3,-(sp)				
	pea 96(a5)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbne _?L159				
_?L133:						
						
	moveq #3,d0				
	move.l d0,(a5)				
_?L125:						
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L130				
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L134				
						
	moveq #4,d1				
	move.l d1,(a5)				
_?L124:						
						
	lea (100,a5),a1				
						
	tst.l 100(a5)				
	jbne _?L136				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	move.l 20(a5),d1			
						
	move.w d1,d2				
						
	add.l 52(a5),d1				
	move.l d1,52(a5)			
						
	add.w 90(a5),d2				
	move.w d2,90(a5)			
						
	cmp.w 88(a5),d2				
	jbeq _?L147				
_?L139:						
						
	moveq #-18,d2				
	cmp.l d0,d2				
	jbeq _?L164				
_?L142:						
						
	tst.l d0				
	jbne _?L120				
_?L143:						
	cmp.l 56(sp),d1				
	jbcs _?L146				
_?L167:						
						
	move.l 52(a5),d1			
	clr.l d0				
						
	move.l 60(sp),a0			
	move.l d1,(a0)				
_?L169:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L127:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L130				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L165				
						
	cmp.b #-1,d1				
	jbne _?L132				
_?L134:						
						
	moveq #5,d1				
	move.l d1,(a5)				
_?L122:						
						
	lea (122,a5),a3				
_?L137:						
						
	tst.l 210(a5)				
	jbeq _?L166				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L137				
_?L159:						
						
	move.l 20(a5),d1			
						
	move.w d1,d2				
_?L168:						
						
	add.l 52(a5),d1				
	move.l d1,52(a5)			
						
	add.w 90(a5),d2				
	move.w d2,90(a5)			
						
	cmp.w 88(a5),d2				
	jbne _?L139				
	jbra _?L147				
_?L130:						
						
	move.l 20(a5),d0			
						
	move.l d0,d1				
	add.l 52(a5),d1				
	move.l d1,52(a5)			
						
	add.w 90(a5),d0				
	move.w d0,90(a5)			
						
	cmp.w 88(a5),d0				
	jbne _?L143				
	clr.l d0				
_?L147:						
						
	clr.l 36(a5)				
						
	btst #2,69(a5)				
	jbeq _?L139				
						
	cmp.b #1,468(a5)			
	jbne _?L139				
						
	move.l 464(a5),d2			
	cmp.l 78(a5),d2				
	jbne _?L139				
						
	clr.b 468(a5)				
						
	clr.l 464(a5)				
						
	moveq #-18,d2				
	cmp.l d0,d2				
	jbne _?L142				
_?L164:						
						
	moveq #13,d0				
	move.l d0,36(a5)			
						
	cmp.l 56(sp),d1				
	jbcs _?L146				
	jbra _?L167				
_?L163:						
						
	moveq #1,d0				
	move.l d0,4(a5)				
						
	moveq #2,d1				
	move.l d1,(a5)				
_?L118:						
						
	move.l d5,28(a5)			
						
	move.l 56(sp),24(a5)			
						
	clr.l 20(a5)				
						
	pea 8(a5)				
	move.l a5,-(sp)				
	jbsr _miniflac_sync_internal		
	addq.l #8,sp				
						
	move.l 60(sp),a0			
	move.l 20(a5),(a0)			
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L166:						
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	move.l 20(a5),d1			
						
	move.w d1,d2				
	jbra _?L168				
_?L136:						
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L133				
						
	move.l 20(a5),d1			
						
	move.w d1,d2				
	jbra _?L168				
_?L148:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L120:						
						
	move.l 52(a5),d1			
						
	move.l 60(sp),a0			
	move.l d1,(a0)				
	jbra _?L169				
_?L117:						
						
	moveq #2,d2				
	move.l d2,4(a5)				
						
	clr.l (a5)				
						
	clr.l 36(sp)				
						
	clr.l 40(sp)				
						
	move.l d5,60(a5)			
						
	move.l 56(sp),56(a5)			
						
	clr.l 52(a5)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	lea _miniflac_oggfunction_start,a6	
						
	move.l a5,d3				
	addq.l #8,d3				
						
	move.l a5,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L146				
_?L165:						
						
	moveq #2,d0				
	move.l d0,(a5)				
						
	move.l d3,-(sp)				
	pea 96(a5)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d2				
	cmp.l d0,d2				
	jbeq _?L133				
	jbra _?L159				
_?L132:						
						
	move.l 20(a5),d0			
						
	move.l d0,d1				
	add.l 52(a5),d1				
	move.l d1,52(a5)			
						
	add.w 90(a5),d0				
	move.w d0,90(a5)			
						
	cmp.w 88(a5),d0				
	jbeq _?L151				
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l d1,(a0)				
	jbra _?L169				
_?L151:						
						
	moveq #-1,d0				
	jbra _?L147				
_?L150:						
						
	clr.w d2				
	clr.l d1				
	moveq #-1,d0				
						
	add.l 52(a5),d1				
	move.l d1,52(a5)			
						
	add.w 90(a5),d2				
	move.w d2,90(a5)			
						
	cmp.w 88(a5),d2				
	jbne _?L139				
	jbra _?L147				
						
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
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L260				
						
	subq.l #1,d0				
	jbeq _?L261				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L249:						
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L219				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea (122,a6),a3				
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L262				
_?L238:						
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L254				
	add.l d0,d0				
	move.w _?L223(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L223:						
	.dc.w _?L227-_?L223			
	.dc.w _?L226-_?L223			
	.dc.w _?L225-_?L223			
	.dc.w _?L224-_?L223			
	.dc.w _?L254-_?L223			
	.dc.w _?L236-_?L223			
_?L226:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L231				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L263				
						
	cmp.b #-1,d1				
	jbne _?L230				
_?L232:						
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L236:						
						
	tst.l 210(a6)				
	jbeq _?L264				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L236				
_?L221:						
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L265				
_?L241:						
						
	tst.l d0				
	jbne _?L219				
	cmp.l 56(sp),a1				
	jbcs _?L249				
_?L219:						
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L208:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L227:						
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L221				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L225:						
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L221				
_?L273:						
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L224:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L231				
_?L266:						
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L232				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L233				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L221				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L266				
_?L231:						
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L241				
	jbra _?L265				
_?L254:						
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L241				
	jbra _?L265				
_?L264:						
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L221				
_?L268:						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L238				
_?L262:						
	lea _miniflac_sync_internal,a3		
_?L239:						
	tst.l 114(a6)				
	jbeq _?L267				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L221				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L239				
_?L230:						
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L256				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L219				
						
	cmp.b #1,468(a6)			
	jbne _?L219				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L241				
_?L270:						
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L241				
_?L233:						
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L268				
	jbra _?L221				
_?L260:						
						
	tst.l 56(sp)				
	jbeq _?L251				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L211				
	cmp.b #102,d0				
	jbeq _?L269				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L265:						
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L241				
						
	cmp.b #1,468(a6)			
	jbne _?L241				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L241				
	jbra _?L270				
_?L269:						
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L214:						
	subq.l #4,d0				
	jbeq _?L271				
_?L216:						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L215				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L216				
_?L271:						
	lea _miniflac_sync_internal,a3		
_?L217:						
	tst.l 114(a6)				
	jbeq _?L272				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L215				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L217				
	moveq #-1,d0				
_?L215:						
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L274:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L261:						
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L214				
_?L267:						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_min_block_size
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L241				
	jbra _?L265				
_?L251:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L263:						
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L221				
	jbra _?L273				
_?L211:						
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L249				
_?L272:						
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_min_block_size
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L274				
_?L256:						
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L208				
						
	.align	2				
	.globl	_miniflac_streaminfo_max_block_size
						
_miniflac_streaminfo_max_block_size:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L327				
						
	subq.l #1,d0				
	jbeq _?L328				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L316:						
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L286				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea (122,a6),a3				
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L329				
_?L305:						
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L321				
	add.l d0,d0				
	move.w _?L290(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L290:						
	.dc.w _?L294-_?L290			
	.dc.w _?L293-_?L290			
	.dc.w _?L292-_?L290			
	.dc.w _?L291-_?L290			
	.dc.w _?L321-_?L290			
	.dc.w _?L303-_?L290			
_?L293:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L298				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L330				
						
	cmp.b #-1,d1				
	jbne _?L297				
_?L299:						
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L303:						
						
	tst.l 210(a6)				
	jbeq _?L331				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L303				
_?L288:						
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L332				
_?L308:						
						
	tst.l d0				
	jbne _?L286				
	cmp.l 56(sp),a1				
	jbcs _?L316				
_?L286:						
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L275:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L294:						
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L288				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L292:						
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L288				
_?L340:						
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L291:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L298				
_?L333:						
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L299				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L300				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L288				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L333				
_?L298:						
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L308				
	jbra _?L332				
_?L321:						
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L308				
	jbra _?L332				
_?L331:						
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L288				
_?L335:						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L305				
_?L329:						
	lea _miniflac_sync_internal,a3		
_?L306:						
	tst.l 114(a6)				
	jbeq _?L334				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L288				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L306				
_?L297:						
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L323				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L286				
						
	cmp.b #1,468(a6)			
	jbne _?L286				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L308				
_?L337:						
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L308				
_?L300:						
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L335				
	jbra _?L288				
_?L327:						
						
	tst.l 56(sp)				
	jbeq _?L318				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L278				
	cmp.b #102,d0				
	jbeq _?L336				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L332:						
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L308				
						
	cmp.b #1,468(a6)			
	jbne _?L308				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L308				
	jbra _?L337				
_?L336:						
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L281:						
	subq.l #4,d0				
	jbeq _?L338				
_?L283:						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L282				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L283				
_?L338:						
	lea _miniflac_sync_internal,a3		
_?L284:						
	tst.l 114(a6)				
	jbeq _?L339				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L282				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L284				
	moveq #-1,d0				
_?L282:						
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L341:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L328:						
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L281				
_?L334:						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_max_block_size
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L308				
	jbra _?L332				
_?L318:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L330:						
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L288				
	jbra _?L340				
_?L278:						
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L316				
_?L339:						
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_max_block_size
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L341				
_?L323:						
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L275				
						
	.align	2				
	.globl	_miniflac_streaminfo_min_frame_size
						
_miniflac_streaminfo_min_frame_size:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L394				
						
	subq.l #1,d0				
	jbeq _?L395				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L383:						
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L353				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea (122,a6),a3				
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L396				
_?L372:						
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L388				
	add.l d0,d0				
	move.w _?L357(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L357:						
	.dc.w _?L361-_?L357			
	.dc.w _?L360-_?L357			
	.dc.w _?L359-_?L357			
	.dc.w _?L358-_?L357			
	.dc.w _?L388-_?L357			
	.dc.w _?L370-_?L357			
_?L360:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L365				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L397				
						
	cmp.b #-1,d1				
	jbne _?L364				
_?L366:						
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L370:						
						
	tst.l 210(a6)				
	jbeq _?L398				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L370				
_?L355:						
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L399				
_?L375:						
						
	tst.l d0				
	jbne _?L353				
	cmp.l 56(sp),a1				
	jbcs _?L383				
_?L353:						
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L342:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L361:						
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L355				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L359:						
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L355				
_?L407:						
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L358:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L365				
_?L400:						
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L366				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L367				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L355				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L400				
_?L365:						
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L375				
	jbra _?L399				
_?L388:						
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L375				
	jbra _?L399				
_?L398:						
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L355				
_?L402:						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L372				
_?L396:						
	lea _miniflac_sync_internal,a3		
_?L373:						
	tst.l 114(a6)				
	jbeq _?L401				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L355				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L373				
_?L364:						
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L390				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L353				
						
	cmp.b #1,468(a6)			
	jbne _?L353				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L375				
_?L404:						
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L375				
_?L367:						
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L402				
	jbra _?L355				
_?L394:						
						
	tst.l 56(sp)				
	jbeq _?L385				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L345				
	cmp.b #102,d0				
	jbeq _?L403				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L399:						
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L375				
						
	cmp.b #1,468(a6)			
	jbne _?L375				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L375				
	jbra _?L404				
_?L403:						
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L348:						
	subq.l #4,d0				
	jbeq _?L405				
_?L350:						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L349				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L350				
_?L405:						
	lea _miniflac_sync_internal,a3		
_?L351:						
	tst.l 114(a6)				
	jbeq _?L406				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L349				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L351				
	moveq #-1,d0				
_?L349:						
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L408:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L395:						
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L348				
_?L401:						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_min_frame_size
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L375				
	jbra _?L399				
_?L385:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L397:						
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L355				
	jbra _?L407				
_?L345:						
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L383				
_?L406:						
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_min_frame_size
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L408				
_?L390:						
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L342				
						
	.align	2				
	.globl	_miniflac_streaminfo_max_frame_size
						
_miniflac_streaminfo_max_frame_size:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L461				
						
	subq.l #1,d0				
	jbeq _?L462				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L450:						
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L420				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea (122,a6),a3				
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L463				
_?L439:						
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L455				
	add.l d0,d0				
	move.w _?L424(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L424:						
	.dc.w _?L428-_?L424			
	.dc.w _?L427-_?L424			
	.dc.w _?L426-_?L424			
	.dc.w _?L425-_?L424			
	.dc.w _?L455-_?L424			
	.dc.w _?L437-_?L424			
_?L427:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L432				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L464				
						
	cmp.b #-1,d1				
	jbne _?L431				
_?L433:						
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L437:						
						
	tst.l 210(a6)				
	jbeq _?L465				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L437				
_?L422:						
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L466				
_?L442:						
						
	tst.l d0				
	jbne _?L420				
	cmp.l 56(sp),a1				
	jbcs _?L450				
_?L420:						
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L409:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L428:						
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L422				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L426:						
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L422				
_?L474:						
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L425:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L432				
_?L467:						
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L433				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L434				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L422				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L467				
_?L432:						
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L442				
	jbra _?L466				
_?L455:						
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L442				
	jbra _?L466				
_?L465:						
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L422				
_?L469:						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L439				
_?L463:						
	lea _miniflac_sync_internal,a3		
_?L440:						
	tst.l 114(a6)				
	jbeq _?L468				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L422				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L440				
_?L431:						
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L457				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L420				
						
	cmp.b #1,468(a6)			
	jbne _?L420				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L442				
_?L471:						
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L442				
_?L434:						
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L469				
	jbra _?L422				
_?L461:						
						
	tst.l 56(sp)				
	jbeq _?L452				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L412				
	cmp.b #102,d0				
	jbeq _?L470				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L466:						
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L442				
						
	cmp.b #1,468(a6)			
	jbne _?L442				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L442				
	jbra _?L471				
_?L470:						
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L415:						
	subq.l #4,d0				
	jbeq _?L472				
_?L417:						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L416				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L417				
_?L472:						
	lea _miniflac_sync_internal,a3		
_?L418:						
	tst.l 114(a6)				
	jbeq _?L473				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L416				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L418				
	moveq #-1,d0				
_?L416:						
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L475:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L462:						
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L415				
_?L468:						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L442				
	jbra _?L466				
_?L452:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L464:						
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L422				
	jbra _?L474				
_?L412:						
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L450				
_?L473:						
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L475				
_?L457:						
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L409				
						
	.align	2				
	.globl	_miniflac_streaminfo_sample_rate
						
_miniflac_streaminfo_sample_rate:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L528				
						
	subq.l #1,d0				
	jbeq _?L529				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L517:						
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L487				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea (122,a6),a3				
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L530				
_?L506:						
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L522				
	add.l d0,d0				
	move.w _?L491(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L491:						
	.dc.w _?L495-_?L491			
	.dc.w _?L494-_?L491			
	.dc.w _?L493-_?L491			
	.dc.w _?L492-_?L491			
	.dc.w _?L522-_?L491			
	.dc.w _?L504-_?L491			
_?L494:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L499				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L531				
						
	cmp.b #-1,d1				
	jbne _?L498				
_?L500:						
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L504:						
						
	tst.l 210(a6)				
	jbeq _?L532				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L504				
_?L489:						
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L533				
_?L509:						
						
	tst.l d0				
	jbne _?L487				
	cmp.l 56(sp),a1				
	jbcs _?L517				
_?L487:						
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L476:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L495:						
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L489				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L493:						
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L489				
_?L541:						
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L492:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L499				
_?L534:						
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L500				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L501				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L489				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L534				
_?L499:						
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L509				
	jbra _?L533				
_?L522:						
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L509				
	jbra _?L533				
_?L532:						
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L489				
_?L536:						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L506				
_?L530:						
	lea _miniflac_sync_internal,a3		
_?L507:						
	tst.l 114(a6)				
	jbeq _?L535				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L489				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L507				
_?L498:						
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L524				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L487				
						
	cmp.b #1,468(a6)			
	jbne _?L487				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L509				
_?L538:						
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L509				
_?L501:						
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L536				
	jbra _?L489				
_?L528:						
						
	tst.l 56(sp)				
	jbeq _?L519				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L479				
	cmp.b #102,d0				
	jbeq _?L537				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L533:						
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L509				
						
	cmp.b #1,468(a6)			
	jbne _?L509				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L509				
	jbra _?L538				
_?L537:						
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L482:						
	subq.l #4,d0				
	jbeq _?L539				
_?L484:						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L483				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L484				
_?L539:						
	lea _miniflac_sync_internal,a3		
_?L485:						
	tst.l 114(a6)				
	jbeq _?L540				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L483				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L485				
	moveq #-1,d0				
_?L483:						
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L542:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L529:						
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L482				
_?L535:						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_sample_rate
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L509				
	jbra _?L533				
_?L519:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L531:						
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L489				
	jbra _?L541				
_?L479:						
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L517				
_?L540:						
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_sample_rate
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L542				
_?L524:						
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L476				
						
	.align	2				
	.globl	_miniflac_streaminfo_channels	
						
_miniflac_streaminfo_channels:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L595				
						
	subq.l #1,d0				
	jbeq _?L596				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L584:						
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L554				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea (122,a6),a3				
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L597				
_?L573:						
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L589				
	add.l d0,d0				
	move.w _?L558(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L558:						
	.dc.w _?L562-_?L558			
	.dc.w _?L561-_?L558			
	.dc.w _?L560-_?L558			
	.dc.w _?L559-_?L558			
	.dc.w _?L589-_?L558			
	.dc.w _?L571-_?L558			
_?L561:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L566				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L598				
						
	cmp.b #-1,d1				
	jbne _?L565				
_?L567:						
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L571:						
						
	tst.l 210(a6)				
	jbeq _?L599				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L571				
_?L556:						
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L600				
_?L576:						
						
	tst.l d0				
	jbne _?L554				
	cmp.l 56(sp),a1				
	jbcs _?L584				
_?L554:						
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L543:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L562:						
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L556				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L560:						
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L556				
_?L608:						
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L559:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L566				
_?L601:						
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L567				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L568				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L556				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L601				
_?L566:						
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L576				
	jbra _?L600				
_?L589:						
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L576				
	jbra _?L600				
_?L599:						
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L556				
_?L603:						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L573				
_?L597:						
	lea _miniflac_sync_internal,a3		
_?L574:						
	tst.l 114(a6)				
	jbeq _?L602				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L556				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L574				
_?L565:						
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L591				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L554				
						
	cmp.b #1,468(a6)			
	jbne _?L554				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L576				
_?L605:						
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L576				
_?L568:						
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L603				
	jbra _?L556				
_?L595:						
						
	tst.l 56(sp)				
	jbeq _?L586				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L546				
	cmp.b #102,d0				
	jbeq _?L604				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L600:						
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L576				
						
	cmp.b #1,468(a6)			
	jbne _?L576				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L576				
	jbra _?L605				
_?L604:						
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L549:						
	subq.l #4,d0				
	jbeq _?L606				
_?L551:						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L550				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L551				
_?L606:						
	lea _miniflac_sync_internal,a3		
_?L552:						
	tst.l 114(a6)				
	jbeq _?L607				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L550				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L552				
	moveq #-1,d0				
_?L550:						
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L609:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L596:						
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L549				
_?L602:						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_channels	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L576				
	jbra _?L600				
_?L586:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L598:						
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L556				
	jbra _?L608				
_?L546:						
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L584				
_?L607:						
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_channels	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L609				
_?L591:						
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L543				
						
	.align	2				
	.globl	_miniflac_streaminfo_bps	
						
_miniflac_streaminfo_bps:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L662				
						
	subq.l #1,d0				
	jbeq _?L663				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L651:						
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L621				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea (122,a6),a3				
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L664				
_?L640:						
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L656				
	add.l d0,d0				
	move.w _?L625(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L625:						
	.dc.w _?L629-_?L625			
	.dc.w _?L628-_?L625			
	.dc.w _?L627-_?L625			
	.dc.w _?L626-_?L625			
	.dc.w _?L656-_?L625			
	.dc.w _?L638-_?L625			
_?L628:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L633				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L665				
						
	cmp.b #-1,d1				
	jbne _?L632				
_?L634:						
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L638:						
						
	tst.l 210(a6)				
	jbeq _?L666				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L638				
_?L623:						
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L667				
_?L643:						
						
	tst.l d0				
	jbne _?L621				
	cmp.l 56(sp),a1				
	jbcs _?L651				
_?L621:						
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L610:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L629:						
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L623				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L627:						
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L623				
_?L675:						
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L626:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L633				
_?L668:						
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L634				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L635				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L623				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L668				
_?L633:						
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L643				
	jbra _?L667				
_?L656:						
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L643				
	jbra _?L667				
_?L666:						
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L623				
_?L670:						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L640				
_?L664:						
	lea _miniflac_sync_internal,a3		
_?L641:						
	tst.l 114(a6)				
	jbeq _?L669				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L623				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L641				
_?L632:						
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L658				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L621				
						
	cmp.b #1,468(a6)			
	jbne _?L621				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L643				
_?L672:						
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L643				
_?L635:						
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L670				
	jbra _?L623				
_?L662:						
						
	tst.l 56(sp)				
	jbeq _?L653				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L613				
	cmp.b #102,d0				
	jbeq _?L671				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L667:						
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L643				
						
	cmp.b #1,468(a6)			
	jbne _?L643				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L643				
	jbra _?L672				
_?L671:						
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L616:						
	subq.l #4,d0				
	jbeq _?L673				
_?L618:						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L617				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L618				
_?L673:						
	lea _miniflac_sync_internal,a3		
_?L619:						
	tst.l 114(a6)				
	jbeq _?L674				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L617				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L619				
	moveq #-1,d0				
_?L617:						
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L676:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L663:						
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L616				
_?L669:						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_bps	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L643				
	jbra _?L667				
_?L653:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L665:						
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L623				
	jbra _?L675				
_?L613:						
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L651				
_?L674:						
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_bps	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L676				
_?L658:						
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L610				
						
	.align	2				
	.globl	_miniflac_streaminfo_total_samples
						
_miniflac_streaminfo_total_samples:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L729				
						
	subq.l #1,d0				
	jbeq _?L730				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L718:						
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L688				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea (122,a6),a3				
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L731				
_?L707:						
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L723				
	add.l d0,d0				
	move.w _?L692(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L692:						
	.dc.w _?L696-_?L692			
	.dc.w _?L695-_?L692			
	.dc.w _?L694-_?L692			
	.dc.w _?L693-_?L692			
	.dc.w _?L723-_?L692			
	.dc.w _?L705-_?L692			
_?L695:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L700				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L732				
						
	cmp.b #-1,d1				
	jbne _?L699				
_?L701:						
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L705:						
						
	tst.l 210(a6)				
	jbeq _?L733				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L705				
_?L690:						
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L734				
_?L710:						
						
	tst.l d0				
	jbne _?L688				
	cmp.l 56(sp),a1				
	jbcs _?L718				
_?L688:						
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L677:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L696:						
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L690				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L694:						
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L690				
_?L742:						
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L693:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L700				
_?L735:						
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L701				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L702				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L690				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L735				
_?L700:						
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L710				
	jbra _?L734				
_?L723:						
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L710				
	jbra _?L734				
_?L733:						
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L690				
_?L737:						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L707				
_?L731:						
	lea _miniflac_sync_internal,a3		
_?L708:						
	tst.l 114(a6)				
	jbeq _?L736				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L690				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L708				
_?L699:						
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L725				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L688				
						
	cmp.b #1,468(a6)			
	jbne _?L688				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L710				
_?L739:						
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L710				
_?L702:						
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L737				
	jbra _?L690				
_?L729:						
						
	tst.l 56(sp)				
	jbeq _?L720				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L680				
	cmp.b #102,d0				
	jbeq _?L738				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L734:						
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L710				
						
	cmp.b #1,468(a6)			
	jbne _?L710				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L710				
	jbra _?L739				
_?L738:						
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L683:						
	subq.l #4,d0				
	jbeq _?L740				
_?L685:						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L684				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L685				
_?L740:						
	lea _miniflac_sync_internal,a3		
_?L686:						
	tst.l 114(a6)				
	jbeq _?L741				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L684				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L686				
	moveq #-1,d0				
_?L684:						
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L743:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L730:						
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L683				
_?L736:						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_total_samples
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L710				
	jbra _?L734				
_?L720:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L732:						
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L690				
	jbra _?L742				
_?L680:						
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L718				
_?L741:						
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_total_samples
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L743				
_?L725:						
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L677				
						
	.align	2				
	.globl	_miniflac_streaminfo_md5_length	
						
_miniflac_streaminfo_md5_length:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L796				
						
	subq.l #1,d0				
	jbeq _?L797				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L785:						
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L755				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea (122,a6),a3				
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L798				
_?L774:						
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L790				
	add.l d0,d0				
	move.w _?L759(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L759:						
	.dc.w _?L763-_?L759			
	.dc.w _?L762-_?L759			
	.dc.w _?L761-_?L759			
	.dc.w _?L760-_?L759			
	.dc.w _?L790-_?L759			
	.dc.w _?L772-_?L759			
_?L762:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L767				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L799				
						
	cmp.b #-1,d1				
	jbne _?L766				
_?L768:						
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L772:						
						
	tst.l 210(a6)				
	jbeq _?L800				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L772				
_?L757:						
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L801				
_?L777:						
						
	tst.l d0				
	jbne _?L755				
	cmp.l 56(sp),a1				
	jbcs _?L785				
_?L755:						
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L744:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L763:						
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L757				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L761:						
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L757				
_?L809:						
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L760:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L767				
_?L802:						
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L768				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L769				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L757				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L802				
_?L767:						
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L777				
	jbra _?L801				
_?L790:						
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L777				
	jbra _?L801				
_?L800:						
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L757				
_?L804:						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L774				
_?L798:						
	lea _miniflac_sync_internal,a3		
_?L775:						
	tst.l 114(a6)				
	jbeq _?L803				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L757				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L775				
_?L766:						
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L792				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L755				
						
	cmp.b #1,468(a6)			
	jbne _?L755				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L777				
_?L806:						
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L777				
_?L769:						
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L804				
	jbra _?L757				
_?L796:						
						
	tst.l 56(sp)				
	jbeq _?L787				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L747				
	cmp.b #102,d0				
	jbeq _?L805				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L801:						
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L777				
						
	cmp.b #1,468(a6)			
	jbne _?L777				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L777				
	jbra _?L806				
_?L805:						
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L750:						
	subq.l #4,d0				
	jbeq _?L807				
_?L752:						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L751				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L752				
_?L807:						
	lea _miniflac_sync_internal,a3		
_?L753:						
	tst.l 114(a6)				
	jbeq _?L808				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L751				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L753				
	moveq #-1,d0				
_?L751:						
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L810:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L797:						
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L750				
_?L803:						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_md5_length
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L777				
	jbra _?L801				
_?L787:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L799:						
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L757				
	jbra _?L809				
_?L747:						
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L785				
_?L808:						
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_md5_length
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L810				
_?L792:						
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L744				
						
	.align	2				
	.globl	_miniflac_streaminfo_md5_data	
						
_miniflac_streaminfo_md5_data:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L863				
						
	subq.l #1,d0				
	jbeq _?L864				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L852:						
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L822				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea (122,a6),a3				
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L865				
_?L841:						
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L857				
	add.l d0,d0				
	move.w _?L826(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L826:						
	.dc.w _?L830-_?L826			
	.dc.w _?L829-_?L826			
	.dc.w _?L828-_?L826			
	.dc.w _?L827-_?L826			
	.dc.w _?L857-_?L826			
	.dc.w _?L839-_?L826			
_?L829:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L834				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L866				
						
	cmp.b #-1,d1				
	jbne _?L833				
_?L835:						
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L839:						
						
	tst.l 210(a6)				
	jbeq _?L867				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L839				
_?L824:						
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L868				
_?L844:						
						
	tst.l d0				
	jbne _?L822				
	cmp.l 56(sp),a1				
	jbcs _?L852				
_?L822:						
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L811:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L830:						
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L824				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L828:						
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L824				
_?L876:						
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L827:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L834				
_?L869:						
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L835				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L836				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L824				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L869				
_?L834:						
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L844				
	jbra _?L868				
_?L857:						
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L844				
	jbra _?L868				
_?L867:						
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L824				
_?L871:						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L841				
_?L865:						
	lea _miniflac_sync_internal,a3		
_?L842:						
	tst.l 114(a6)				
	jbeq _?L870				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L824				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L842				
_?L833:						
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L859				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L822				
						
	cmp.b #1,468(a6)			
	jbne _?L822				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L844				
_?L873:						
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L844				
_?L836:						
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L871				
	jbra _?L824				
_?L863:						
						
	tst.l 56(sp)				
	jbeq _?L854				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L814				
	cmp.b #102,d0				
	jbeq _?L872				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L868:						
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L844				
						
	cmp.b #1,468(a6)			
	jbne _?L844				
						
	move.l 464(a6),d1			
	cmp.l 78(a6),d1				
	jbne _?L844				
	jbra _?L873				
_?L872:						
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L817:						
	subq.l #4,d0				
	jbeq _?L874				
_?L819:						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L818				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L819				
_?L874:						
	lea _miniflac_sync_internal,a3		
_?L820:						
	tst.l 114(a6)				
	jbeq _?L875				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L818				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L820				
	moveq #-1,d0				
_?L818:						
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L877:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L864:						
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L817				
_?L870:						
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_md5_data	
	lea (20,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L844				
	jbra _?L868				
_?L854:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L866:						
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L824				
	jbra _?L876				
_?L814:						
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L852				
_?L875:						
						
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 122(a6)				
	jbsr _miniflac_streaminfo_read_md5_data	
	lea (20,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L877				
_?L859:						
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L811				
						
	.align	2				
	.globl	_miniflac_vorbis_comment_vendor_length
						
_miniflac_vorbis_comment_vendor_length:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L930				
						
	subq.l #1,d0				
	jbeq _?L931				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L919:						
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L889				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L932				
_?L908:						
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L924				
	add.l d0,d0				
	move.w _?L893(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L893:						
	.dc.w _?L897-_?L893			
	.dc.w _?L896-_?L893			
	.dc.w _?L895-_?L893			
	.dc.w _?L894-_?L893			
	.dc.w _?L924-_?L893			
	.dc.w _?L906-_?L893			
_?L896:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L901				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L933				
						
	cmp.b #-1,d1				
	jbne _?L900				
_?L902:						
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L906:						
						
	tst.l 210(a6)				
	jbeq _?L934				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L906				
_?L891:						
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L935				
_?L911:						
						
	tst.l d0				
	jbne _?L889				
	cmp.l 56(sp),a1				
	jbcs _?L919				
_?L889:						
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L878:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L897:						
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L891				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L895:						
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L891				
_?L943:						
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L894:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L901				
_?L936:						
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L902				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L903				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L891				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L936				
_?L901:						
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L911				
	jbra _?L935				
_?L924:						
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L911				
	jbra _?L935				
_?L934:						
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L891				
_?L938:						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L908				
_?L932:						
	lea _miniflac_sync_internal,a3		
_?L909:						
	moveq #4,d1				
	cmp.l 114(a6),d1			
	jbeq _?L937				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L891				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L909				
_?L900:						
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L926				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L889				
						
	cmp.b #1,468(a6)			
	jbne _?L889				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L911				
_?L940:						
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L911				
_?L903:						
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L938				
	jbra _?L891				
_?L930:						
						
	tst.l 56(sp)				
	jbeq _?L921				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L881				
	cmp.b #102,d0				
	jbeq _?L939				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L935:						
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L911				
						
	cmp.b #1,468(a6)			
	jbne _?L911				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L911				
	jbra _?L940				
_?L939:						
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L884:						
	subq.l #4,d0				
	jbeq _?L941				
_?L886:						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L885				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L886				
_?L941:						
	lea _miniflac_sync_internal,a3		
_?L887:						
	moveq #4,d1				
	cmp.l 114(a6),d1			
	jbeq _?L942				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L885				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L887				
	moveq #-1,d0				
_?L885:						
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L944:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L931:						
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L884				
_?L937:						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 134(a6)				
	jbsr _miniflac_vorbis_comment_read_vendor_length
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L911				
	jbra _?L935				
_?L921:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L933:						
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L891				
	jbra _?L943				
_?L881:						
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L919				
_?L942:						
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 134(a6)				
	jbsr _miniflac_vorbis_comment_read_vendor_length
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L944				
_?L926:						
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L878				
						
	.align	2				
	.globl	_miniflac_vorbis_comment_vendor_string
						
_miniflac_vorbis_comment_vendor_string:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L997				
						
	subq.l #1,d0				
	jbeq _?L998				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L986:						
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L956				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L999				
_?L975:						
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L991				
	add.l d0,d0				
	move.w _?L960(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L960:						
	.dc.w _?L964-_?L960			
	.dc.w _?L963-_?L960			
	.dc.w _?L962-_?L960			
	.dc.w _?L961-_?L960			
	.dc.w _?L991-_?L960			
	.dc.w _?L973-_?L960			
_?L963:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L968				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1000				
						
	cmp.b #-1,d1				
	jbne _?L967				
_?L969:						
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L973:						
						
	tst.l 210(a6)				
	jbeq _?L1001				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L973				
_?L958:						
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1002				
_?L978:						
						
	tst.l d0				
	jbne _?L956				
	cmp.l 56(sp),a1				
	jbcs _?L986				
_?L956:						
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L945:						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L964:						
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L958				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L962:						
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L958				
_?L1010:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L961:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L968				
_?L1003:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L969				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L970				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L958				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1003				
_?L968:						
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L978				
	jbra _?L1002				
_?L991:						
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L978				
	jbra _?L1002				
_?L1001:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L958				
_?L1005:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L975				
_?L999:						
	lea _miniflac_sync_internal,a3		
_?L976:						
	moveq #4,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1004				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L958				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L976				
_?L967:						
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L993				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L956				
						
	cmp.b #1,468(a6)			
	jbne _?L956				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L978				
_?L1007:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L978				
_?L970:						
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1005				
	jbra _?L958				
_?L997:						
						
	tst.l 56(sp)				
	jbeq _?L988				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L948				
	cmp.b #102,d0				
	jbeq _?L1006				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1002:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L978				
						
	cmp.b #1,468(a6)			
	jbne _?L978				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L978				
	jbra _?L1007				
_?L1006:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L951:						
	subq.l #4,d0				
	jbeq _?L1008				
_?L953:						
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L952				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L953				
_?L1008:					
	lea _miniflac_sync_internal,a3		
_?L954:						
	moveq #4,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1009				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L952				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L954				
	moveq #-1,d0				
_?L952:						
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1011:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L998:						
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L951				
_?L1004:					
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 134(a6)				
	jbsr _miniflac_vorbis_comment_read_vendor_string
	lea (20,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L978				
	jbra _?L1002				
_?L988:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1000:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L958				
	jbra _?L1010				
_?L948:						
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L986				
_?L1009:					
						
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 134(a6)				
	jbsr _miniflac_vorbis_comment_read_vendor_string
	lea (20,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1011				
_?L993:						
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L945				
						
	.align	2				
	.globl	_miniflac_vorbis_comment_total	
						
_miniflac_vorbis_comment_total:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L1064				
						
	subq.l #1,d0				
	jbeq _?L1065				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1053:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1023				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L1066				
_?L1042:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1058				
	add.l d0,d0				
	move.w _?L1027(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1027:					
	.dc.w _?L1031-_?L1027			
	.dc.w _?L1030-_?L1027			
	.dc.w _?L1029-_?L1027			
	.dc.w _?L1028-_?L1027			
	.dc.w _?L1058-_?L1027			
	.dc.w _?L1040-_?L1027			
_?L1030:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1035				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1067				
						
	cmp.b #-1,d1				
	jbne _?L1034				
_?L1036:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1040:					
						
	tst.l 210(a6)				
	jbeq _?L1068				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1040				
_?L1025:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1069				
_?L1045:					
						
	tst.l d0				
	jbne _?L1023				
	cmp.l 56(sp),a1				
	jbcs _?L1053				
_?L1023:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1012:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1031:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1025				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1029:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1025				
_?L1077:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1028:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1035				
_?L1070:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1036				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1037				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1025				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1070				
_?L1035:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1045				
	jbra _?L1069				
_?L1058:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1045				
	jbra _?L1069				
_?L1068:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1025				
_?L1072:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1042				
_?L1066:					
	lea _miniflac_sync_internal,a3		
_?L1043:					
	moveq #4,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1071				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1025				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1043				
_?L1034:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1060				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1023				
						
	cmp.b #1,468(a6)			
	jbne _?L1023				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1045				
_?L1074:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1045				
_?L1037:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1072				
	jbra _?L1025				
_?L1064:					
						
	tst.l 56(sp)				
	jbeq _?L1055				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1015				
	cmp.b #102,d0				
	jbeq _?L1073				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1069:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1045				
						
	cmp.b #1,468(a6)			
	jbne _?L1045				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1045				
	jbra _?L1074				
_?L1073:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1018:					
	subq.l #4,d0				
	jbeq _?L1075				
_?L1020:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1019				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1020				
_?L1075:					
	lea _miniflac_sync_internal,a3		
_?L1021:					
	moveq #4,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1076				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1019				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1021				
	moveq #-1,d0				
_?L1019:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1078:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1065:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1018				
_?L1071:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 134(a6)				
	jbsr _miniflac_vorbis_comment_read_total
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1045				
	jbra _?L1069				
_?L1055:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1067:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1025				
	jbra _?L1077				
_?L1015:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1053				
_?L1076:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 134(a6)				
	jbsr _miniflac_vorbis_comment_read_total
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1078				
_?L1060:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1012				
						
	.align	2				
	.globl	_miniflac_vorbis_comment_length	
						
_miniflac_vorbis_comment_length:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L1131				
						
	subq.l #1,d0				
	jbeq _?L1132				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1120:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1090				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L1133				
_?L1109:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1125				
	add.l d0,d0				
	move.w _?L1094(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1094:					
	.dc.w _?L1098-_?L1094			
	.dc.w _?L1097-_?L1094			
	.dc.w _?L1096-_?L1094			
	.dc.w _?L1095-_?L1094			
	.dc.w _?L1125-_?L1094			
	.dc.w _?L1107-_?L1094			
_?L1097:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1102				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1134				
						
	cmp.b #-1,d1				
	jbne _?L1101				
_?L1103:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1107:					
						
	tst.l 210(a6)				
	jbeq _?L1135				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1107				
_?L1092:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1136				
_?L1112:					
						
	tst.l d0				
	jbne _?L1090				
	cmp.l 56(sp),a1				
	jbcs _?L1120				
_?L1090:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1079:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1098:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1092				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1096:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1092				
_?L1144:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1095:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1102				
_?L1137:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1103				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1104				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1092				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1137				
_?L1102:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1112				
	jbra _?L1136				
_?L1125:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1112				
	jbra _?L1136				
_?L1135:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1092				
_?L1139:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1109				
_?L1133:					
	lea _miniflac_sync_internal,a3		
_?L1110:					
	moveq #4,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1138				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1092				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1110				
_?L1101:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1127				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1090				
						
	cmp.b #1,468(a6)			
	jbne _?L1090				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1112				
_?L1141:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1112				
_?L1104:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1139				
	jbra _?L1092				
_?L1131:					
						
	tst.l 56(sp)				
	jbeq _?L1122				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1082				
	cmp.b #102,d0				
	jbeq _?L1140				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1136:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1112				
						
	cmp.b #1,468(a6)			
	jbne _?L1112				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1112				
	jbra _?L1141				
_?L1140:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1085:					
	subq.l #4,d0				
	jbeq _?L1142				
_?L1087:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1086				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1087				
_?L1142:					
	lea _miniflac_sync_internal,a3		
_?L1088:					
	moveq #4,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1143				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1086				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1088				
	moveq #-1,d0				
_?L1086:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1145:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1132:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1085				
_?L1138:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 134(a6)				
	jbsr _miniflac_vorbis_comment_read_length
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1112				
	jbra _?L1136				
_?L1122:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1134:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1092				
	jbra _?L1144				
_?L1082:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1120				
_?L1143:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 134(a6)				
	jbsr _miniflac_vorbis_comment_read_length
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1145				
_?L1127:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1079				
						
	.align	2				
	.globl	_miniflac_vorbis_comment_string	
						
_miniflac_vorbis_comment_string:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L1198				
						
	subq.l #1,d0				
	jbeq _?L1199				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1187:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1157				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L1200				
_?L1176:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1192				
	add.l d0,d0				
	move.w _?L1161(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1161:					
	.dc.w _?L1165-_?L1161			
	.dc.w _?L1164-_?L1161			
	.dc.w _?L1163-_?L1161			
	.dc.w _?L1162-_?L1161			
	.dc.w _?L1192-_?L1161			
	.dc.w _?L1174-_?L1161			
_?L1164:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1169				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1201				
						
	cmp.b #-1,d1				
	jbne _?L1168				
_?L1170:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1174:					
						
	tst.l 210(a6)				
	jbeq _?L1202				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1174				
_?L1159:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1203				
_?L1179:					
						
	tst.l d0				
	jbne _?L1157				
	cmp.l 56(sp),a1				
	jbcs _?L1187				
_?L1157:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1146:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1165:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1159				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1163:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1159				
_?L1211:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1162:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1169				
_?L1204:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1170				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1171				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1159				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1204				
_?L1169:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1179				
	jbra _?L1203				
_?L1192:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1179				
	jbra _?L1203				
_?L1202:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1159				
_?L1206:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1176				
_?L1200:					
	lea _miniflac_sync_internal,a3		
_?L1177:					
	moveq #4,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1205				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1159				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1177				
_?L1168:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1194				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1157				
						
	cmp.b #1,468(a6)			
	jbne _?L1157				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1179				
_?L1208:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1179				
_?L1171:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1206				
	jbra _?L1159				
_?L1198:					
						
	tst.l 56(sp)				
	jbeq _?L1189				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1149				
	cmp.b #102,d0				
	jbeq _?L1207				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1203:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1179				
						
	cmp.b #1,468(a6)			
	jbne _?L1179				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1179				
	jbra _?L1208				
_?L1207:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1152:					
	subq.l #4,d0				
	jbeq _?L1209				
_?L1154:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1153				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1154				
_?L1209:					
	lea _miniflac_sync_internal,a3		
_?L1155:					
	moveq #4,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1210				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1153				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1155				
	moveq #-1,d0				
_?L1153:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1212:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1199:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1152				
_?L1205:					
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 134(a6)				
	jbsr _miniflac_vorbis_comment_read_string
	lea (20,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1179				
	jbra _?L1203				
_?L1189:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1201:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1159				
	jbra _?L1211				
_?L1149:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1187				
_?L1210:					
						
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 134(a6)				
	jbsr _miniflac_vorbis_comment_read_string
	lea (20,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1212				
_?L1194:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1146				
						
	.align	2				
	.globl	_miniflac_picture_type		
						
_miniflac_picture_type:				
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L1265				
						
	subq.l #1,d0				
	jbeq _?L1266				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1254:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1224				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L1267				
_?L1243:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1259				
	add.l d0,d0				
	move.w _?L1228(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1228:					
	.dc.w _?L1232-_?L1228			
	.dc.w _?L1231-_?L1228			
	.dc.w _?L1230-_?L1228			
	.dc.w _?L1229-_?L1228			
	.dc.w _?L1259-_?L1228			
	.dc.w _?L1241-_?L1228			
_?L1231:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1236				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1268				
						
	cmp.b #-1,d1				
	jbne _?L1235				
_?L1237:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1241:					
						
	tst.l 210(a6)				
	jbeq _?L1269				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1241				
_?L1226:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1270				
_?L1246:					
						
	tst.l d0				
	jbne _?L1224				
	cmp.l 56(sp),a1				
	jbcs _?L1254				
_?L1224:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1213:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1232:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1226				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1230:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1226				
_?L1278:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1229:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1236				
_?L1271:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1237				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1238				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1226				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1271				
_?L1236:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1246				
	jbra _?L1270				
_?L1259:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1246				
	jbra _?L1270				
_?L1269:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1226				
_?L1273:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1243				
_?L1267:					
	lea _miniflac_sync_internal,a3		
_?L1244:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1272				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1226				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1244				
_?L1235:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1261				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1224				
						
	cmp.b #1,468(a6)			
	jbne _?L1224				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1246				
_?L1275:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1246				
_?L1238:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1273				
	jbra _?L1226				
_?L1265:					
						
	tst.l 56(sp)				
	jbeq _?L1256				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1216				
	cmp.b #102,d0				
	jbeq _?L1274				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1270:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1246				
						
	cmp.b #1,468(a6)			
	jbne _?L1246				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1246				
	jbra _?L1275				
_?L1274:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1219:					
	subq.l #4,d0				
	jbeq _?L1276				
_?L1221:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1220				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1221				
_?L1276:					
	lea _miniflac_sync_internal,a3		
_?L1222:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1277				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1220				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1222				
	moveq #-1,d0				
_?L1220:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1279:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1266:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1219				
_?L1272:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_type	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1246				
	jbra _?L1270				
_?L1256:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1268:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1226				
	jbra _?L1278				
_?L1216:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1254				
_?L1277:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_type	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1279				
_?L1261:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1213				
						
	.align	2				
	.globl	_miniflac_picture_mime_length	
						
_miniflac_picture_mime_length:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L1332				
						
	subq.l #1,d0				
	jbeq _?L1333				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1321:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1291				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L1334				
_?L1310:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1326				
	add.l d0,d0				
	move.w _?L1295(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1295:					
	.dc.w _?L1299-_?L1295			
	.dc.w _?L1298-_?L1295			
	.dc.w _?L1297-_?L1295			
	.dc.w _?L1296-_?L1295			
	.dc.w _?L1326-_?L1295			
	.dc.w _?L1308-_?L1295			
_?L1298:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1303				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1335				
						
	cmp.b #-1,d1				
	jbne _?L1302				
_?L1304:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1308:					
						
	tst.l 210(a6)				
	jbeq _?L1336				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1308				
_?L1293:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1337				
_?L1313:					
						
	tst.l d0				
	jbne _?L1291				
	cmp.l 56(sp),a1				
	jbcs _?L1321				
_?L1291:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1280:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1299:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1293				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1297:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1293				
_?L1345:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1296:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1303				
_?L1338:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1304				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1305				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1293				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1338				
_?L1303:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1313				
	jbra _?L1337				
_?L1326:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1313				
	jbra _?L1337				
_?L1336:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1293				
_?L1340:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1310				
_?L1334:					
	lea _miniflac_sync_internal,a3		
_?L1311:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1339				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1293				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1311				
_?L1302:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1328				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1291				
						
	cmp.b #1,468(a6)			
	jbne _?L1291				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1313				
_?L1342:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1313				
_?L1305:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1340				
	jbra _?L1293				
_?L1332:					
						
	tst.l 56(sp)				
	jbeq _?L1323				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1283				
	cmp.b #102,d0				
	jbeq _?L1341				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1337:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1313				
						
	cmp.b #1,468(a6)			
	jbne _?L1313				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1313				
	jbra _?L1342				
_?L1341:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1286:					
	subq.l #4,d0				
	jbeq _?L1343				
_?L1288:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1287				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1288				
_?L1343:					
	lea _miniflac_sync_internal,a3		
_?L1289:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1344				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1287				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1289				
	moveq #-1,d0				
_?L1287:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1346:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1333:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1286				
_?L1339:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_mime_length	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1313				
	jbra _?L1337				
_?L1323:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1335:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1293				
	jbra _?L1345				
_?L1283:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1321				
_?L1344:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_mime_length	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1346				
_?L1328:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1280				
						
	.align	2				
	.globl	_miniflac_picture_mime_string	
						
_miniflac_picture_mime_string:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L1399				
						
	subq.l #1,d0				
	jbeq _?L1400				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1388:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1358				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L1401				
_?L1377:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1393				
	add.l d0,d0				
	move.w _?L1362(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1362:					
	.dc.w _?L1366-_?L1362			
	.dc.w _?L1365-_?L1362			
	.dc.w _?L1364-_?L1362			
	.dc.w _?L1363-_?L1362			
	.dc.w _?L1393-_?L1362			
	.dc.w _?L1375-_?L1362			
_?L1365:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1370				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1402				
						
	cmp.b #-1,d1				
	jbne _?L1369				
_?L1371:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1375:					
						
	tst.l 210(a6)				
	jbeq _?L1403				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1375				
_?L1360:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1404				
_?L1380:					
						
	tst.l d0				
	jbne _?L1358				
	cmp.l 56(sp),a1				
	jbcs _?L1388				
_?L1358:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1347:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1366:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1360				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1364:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1360				
_?L1412:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1363:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1370				
_?L1405:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1371				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1372				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1360				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1405				
_?L1370:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1380				
	jbra _?L1404				
_?L1393:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1380				
	jbra _?L1404				
_?L1403:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1360				
_?L1407:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1377				
_?L1401:					
	lea _miniflac_sync_internal,a3		
_?L1378:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1406				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1360				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1378				
_?L1369:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1395				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1358				
						
	cmp.b #1,468(a6)			
	jbne _?L1358				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1380				
_?L1409:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1380				
_?L1372:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1407				
	jbra _?L1360				
_?L1399:					
						
	tst.l 56(sp)				
	jbeq _?L1390				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1350				
	cmp.b #102,d0				
	jbeq _?L1408				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1404:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1380				
						
	cmp.b #1,468(a6)			
	jbne _?L1380				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1380				
	jbra _?L1409				
_?L1408:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1353:					
	subq.l #4,d0				
	jbeq _?L1410				
_?L1355:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1354				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1355				
_?L1410:					
	lea _miniflac_sync_internal,a3		
_?L1356:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1411				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1354				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1356				
	moveq #-1,d0				
_?L1354:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1413:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1400:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1353				
_?L1406:					
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_mime_string	
	lea (20,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1380				
	jbra _?L1404				
_?L1390:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1402:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1360				
	jbra _?L1412				
_?L1350:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1388				
_?L1411:					
						
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_mime_string	
	lea (20,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1413				
_?L1395:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1347				
						
	.align	2				
	.globl	_miniflac_picture_description_length
						
_miniflac_picture_description_length:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L1466				
						
	subq.l #1,d0				
	jbeq _?L1467				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1455:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1425				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L1468				
_?L1444:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1460				
	add.l d0,d0				
	move.w _?L1429(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1429:					
	.dc.w _?L1433-_?L1429			
	.dc.w _?L1432-_?L1429			
	.dc.w _?L1431-_?L1429			
	.dc.w _?L1430-_?L1429			
	.dc.w _?L1460-_?L1429			
	.dc.w _?L1442-_?L1429			
_?L1432:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1437				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1469				
						
	cmp.b #-1,d1				
	jbne _?L1436				
_?L1438:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1442:					
						
	tst.l 210(a6)				
	jbeq _?L1470				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1442				
_?L1427:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1471				
_?L1447:					
						
	tst.l d0				
	jbne _?L1425				
	cmp.l 56(sp),a1				
	jbcs _?L1455				
_?L1425:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1414:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1433:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1427				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1431:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1427				
_?L1479:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1430:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1437				
_?L1472:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1438				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1439				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1427				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1472				
_?L1437:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1447				
	jbra _?L1471				
_?L1460:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1447				
	jbra _?L1471				
_?L1470:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1427				
_?L1474:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1444				
_?L1468:					
	lea _miniflac_sync_internal,a3		
_?L1445:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1473				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1427				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1445				
_?L1436:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1462				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1425				
						
	cmp.b #1,468(a6)			
	jbne _?L1425				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1447				
_?L1476:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1447				
_?L1439:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1474				
	jbra _?L1427				
_?L1466:					
						
	tst.l 56(sp)				
	jbeq _?L1457				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1417				
	cmp.b #102,d0				
	jbeq _?L1475				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1471:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1447				
						
	cmp.b #1,468(a6)			
	jbne _?L1447				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1447				
	jbra _?L1476				
_?L1475:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1420:					
	subq.l #4,d0				
	jbeq _?L1477				
_?L1422:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1421				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1422				
_?L1477:					
	lea _miniflac_sync_internal,a3		
_?L1423:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1478				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1421				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1423				
	moveq #-1,d0				
_?L1421:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1480:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1467:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1420				
_?L1473:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_description_length
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1447				
	jbra _?L1471				
_?L1457:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1469:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1427				
	jbra _?L1479				
_?L1417:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1455				
_?L1478:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_description_length
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1480				
_?L1462:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1414				
						
	.align	2				
	.globl	_miniflac_picture_description_string
						
_miniflac_picture_description_string:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L1533				
						
	subq.l #1,d0				
	jbeq _?L1534				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1522:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1492				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L1535				
_?L1511:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1527				
	add.l d0,d0				
	move.w _?L1496(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1496:					
	.dc.w _?L1500-_?L1496			
	.dc.w _?L1499-_?L1496			
	.dc.w _?L1498-_?L1496			
	.dc.w _?L1497-_?L1496			
	.dc.w _?L1527-_?L1496			
	.dc.w _?L1509-_?L1496			
_?L1499:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1504				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1536				
						
	cmp.b #-1,d1				
	jbne _?L1503				
_?L1505:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1509:					
						
	tst.l 210(a6)				
	jbeq _?L1537				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1509				
_?L1494:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1538				
_?L1514:					
						
	tst.l d0				
	jbne _?L1492				
	cmp.l 56(sp),a1				
	jbcs _?L1522				
_?L1492:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1481:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1500:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1494				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1498:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1494				
_?L1546:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1497:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1504				
_?L1539:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1505				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1506				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1494				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1539				
_?L1504:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1514				
	jbra _?L1538				
_?L1527:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1514				
	jbra _?L1538				
_?L1537:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1494				
_?L1541:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1511				
_?L1535:					
	lea _miniflac_sync_internal,a3		
_?L1512:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1540				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1494				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1512				
_?L1503:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1529				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1492				
						
	cmp.b #1,468(a6)			
	jbne _?L1492				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1514				
_?L1543:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1514				
_?L1506:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1541				
	jbra _?L1494				
_?L1533:					
						
	tst.l 56(sp)				
	jbeq _?L1524				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1484				
	cmp.b #102,d0				
	jbeq _?L1542				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1538:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1514				
						
	cmp.b #1,468(a6)			
	jbne _?L1514				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1514				
	jbra _?L1543				
_?L1542:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1487:					
	subq.l #4,d0				
	jbeq _?L1544				
_?L1489:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1488				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1489				
_?L1544:					
	lea _miniflac_sync_internal,a3		
_?L1490:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1545				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1488				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1490				
	moveq #-1,d0				
_?L1488:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1547:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1534:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1487				
_?L1540:					
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_description_string
	lea (20,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1514				
	jbra _?L1538				
_?L1524:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1536:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1494				
	jbra _?L1546				
_?L1484:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1522				
_?L1545:					
						
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_description_string
	lea (20,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1547				
_?L1529:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1481				
						
	.align	2				
	.globl	_miniflac_picture_width		
						
_miniflac_picture_width:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L1600				
						
	subq.l #1,d0				
	jbeq _?L1601				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1589:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1559				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L1602				
_?L1578:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1594				
	add.l d0,d0				
	move.w _?L1563(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1563:					
	.dc.w _?L1567-_?L1563			
	.dc.w _?L1566-_?L1563			
	.dc.w _?L1565-_?L1563			
	.dc.w _?L1564-_?L1563			
	.dc.w _?L1594-_?L1563			
	.dc.w _?L1576-_?L1563			
_?L1566:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1571				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1603				
						
	cmp.b #-1,d1				
	jbne _?L1570				
_?L1572:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1576:					
						
	tst.l 210(a6)				
	jbeq _?L1604				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1576				
_?L1561:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1605				
_?L1581:					
						
	tst.l d0				
	jbne _?L1559				
	cmp.l 56(sp),a1				
	jbcs _?L1589				
_?L1559:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1548:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1567:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1561				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1565:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1561				
_?L1613:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1564:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1571				
_?L1606:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1572				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1573				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1561				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1606				
_?L1571:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1581				
	jbra _?L1605				
_?L1594:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1581				
	jbra _?L1605				
_?L1604:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1561				
_?L1608:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1578				
_?L1602:					
	lea _miniflac_sync_internal,a3		
_?L1579:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1607				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1561				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1579				
_?L1570:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1596				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1559				
						
	cmp.b #1,468(a6)			
	jbne _?L1559				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1581				
_?L1610:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1581				
_?L1573:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1608				
	jbra _?L1561				
_?L1600:					
						
	tst.l 56(sp)				
	jbeq _?L1591				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1551				
	cmp.b #102,d0				
	jbeq _?L1609				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1605:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1581				
						
	cmp.b #1,468(a6)			
	jbne _?L1581				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1581				
	jbra _?L1610				
_?L1609:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1554:					
	subq.l #4,d0				
	jbeq _?L1611				
_?L1556:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1555				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1556				
_?L1611:					
	lea _miniflac_sync_internal,a3		
_?L1557:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1612				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1555				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1557				
	moveq #-1,d0				
_?L1555:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1614:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1601:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1554				
_?L1607:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1581				
	jbra _?L1605				
_?L1591:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1603:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1561				
	jbra _?L1613				
_?L1551:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1589				
_?L1612:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1614				
_?L1596:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1548				
						
	.align	2				
	.globl	_miniflac_picture_height	
						
_miniflac_picture_height:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L1667				
						
	subq.l #1,d0				
	jbeq _?L1668				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1656:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1626				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L1669				
_?L1645:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1661				
	add.l d0,d0				
	move.w _?L1630(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1630:					
	.dc.w _?L1634-_?L1630			
	.dc.w _?L1633-_?L1630			
	.dc.w _?L1632-_?L1630			
	.dc.w _?L1631-_?L1630			
	.dc.w _?L1661-_?L1630			
	.dc.w _?L1643-_?L1630			
_?L1633:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1638				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1670				
						
	cmp.b #-1,d1				
	jbne _?L1637				
_?L1639:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1643:					
						
	tst.l 210(a6)				
	jbeq _?L1671				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1643				
_?L1628:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1672				
_?L1648:					
						
	tst.l d0				
	jbne _?L1626				
	cmp.l 56(sp),a1				
	jbcs _?L1656				
_?L1626:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1615:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1634:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1628				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1632:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1628				
_?L1680:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1631:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1638				
_?L1673:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1639				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1640				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1628				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1673				
_?L1638:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1648				
	jbra _?L1672				
_?L1661:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1648				
	jbra _?L1672				
_?L1671:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1628				
_?L1675:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1645				
_?L1669:					
	lea _miniflac_sync_internal,a3		
_?L1646:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1674				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1628				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1646				
_?L1637:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1663				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1626				
						
	cmp.b #1,468(a6)			
	jbne _?L1626				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1648				
_?L1677:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1648				
_?L1640:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1675				
	jbra _?L1628				
_?L1667:					
						
	tst.l 56(sp)				
	jbeq _?L1658				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1618				
	cmp.b #102,d0				
	jbeq _?L1676				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1672:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1648				
						
	cmp.b #1,468(a6)			
	jbne _?L1648				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1648				
	jbra _?L1677				
_?L1676:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1621:					
	subq.l #4,d0				
	jbeq _?L1678				
_?L1623:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1622				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1623				
_?L1678:					
	lea _miniflac_sync_internal,a3		
_?L1624:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1679				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1622				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1624				
	moveq #-1,d0				
_?L1622:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1681:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1668:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1621				
_?L1674:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_height	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1648				
	jbra _?L1672				
_?L1658:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1670:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1628				
	jbra _?L1680				
_?L1618:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1656				
_?L1679:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_height	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1681				
_?L1663:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1615				
						
	.align	2				
	.globl	_miniflac_picture_colordepth	
						
_miniflac_picture_colordepth:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L1734				
						
	subq.l #1,d0				
	jbeq _?L1735				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1723:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1693				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L1736				
_?L1712:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1728				
	add.l d0,d0				
	move.w _?L1697(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1697:					
	.dc.w _?L1701-_?L1697			
	.dc.w _?L1700-_?L1697			
	.dc.w _?L1699-_?L1697			
	.dc.w _?L1698-_?L1697			
	.dc.w _?L1728-_?L1697			
	.dc.w _?L1710-_?L1697			
_?L1700:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1705				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1737				
						
	cmp.b #-1,d1				
	jbne _?L1704				
_?L1706:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1710:					
						
	tst.l 210(a6)				
	jbeq _?L1738				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1710				
_?L1695:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1739				
_?L1715:					
						
	tst.l d0				
	jbne _?L1693				
	cmp.l 56(sp),a1				
	jbcs _?L1723				
_?L1693:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1682:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1701:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1695				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1699:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1695				
_?L1747:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1698:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1705				
_?L1740:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1706				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1707				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1695				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1740				
_?L1705:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1715				
	jbra _?L1739				
_?L1728:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1715				
	jbra _?L1739				
_?L1738:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1695				
_?L1742:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1712				
_?L1736:					
	lea _miniflac_sync_internal,a3		
_?L1713:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1741				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1695				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1713				
_?L1704:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1730				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1693				
						
	cmp.b #1,468(a6)			
	jbne _?L1693				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1715				
_?L1744:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1715				
_?L1707:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1742				
	jbra _?L1695				
_?L1734:					
						
	tst.l 56(sp)				
	jbeq _?L1725				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1685				
	cmp.b #102,d0				
	jbeq _?L1743				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1739:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1715				
						
	cmp.b #1,468(a6)			
	jbne _?L1715				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1715				
	jbra _?L1744				
_?L1743:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1688:					
	subq.l #4,d0				
	jbeq _?L1745				
_?L1690:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1689				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1690				
_?L1745:					
	lea _miniflac_sync_internal,a3		
_?L1691:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1746				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1689				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1691				
	moveq #-1,d0				
_?L1689:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1748:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1735:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1688				
_?L1741:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_colordepth	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1715				
	jbra _?L1739				
_?L1725:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1737:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1695				
	jbra _?L1747				
_?L1685:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1723				
_?L1746:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_colordepth	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1748				
_?L1730:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1682				
						
	.align	2				
	.globl	_miniflac_picture_totalcolors	
						
_miniflac_picture_totalcolors:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L1801				
						
	subq.l #1,d0				
	jbeq _?L1802				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1790:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1760				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L1803				
_?L1779:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1795				
	add.l d0,d0				
	move.w _?L1764(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1764:					
	.dc.w _?L1768-_?L1764			
	.dc.w _?L1767-_?L1764			
	.dc.w _?L1766-_?L1764			
	.dc.w _?L1765-_?L1764			
	.dc.w _?L1795-_?L1764			
	.dc.w _?L1777-_?L1764			
_?L1767:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1772				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1804				
						
	cmp.b #-1,d1				
	jbne _?L1771				
_?L1773:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1777:					
						
	tst.l 210(a6)				
	jbeq _?L1805				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1777				
_?L1762:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1806				
_?L1782:					
						
	tst.l d0				
	jbne _?L1760				
	cmp.l 56(sp),a1				
	jbcs _?L1790				
_?L1760:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1749:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1768:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1762				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1766:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1762				
_?L1814:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1765:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1772				
_?L1807:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1773				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1774				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1762				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1807				
_?L1772:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1782				
	jbra _?L1806				
_?L1795:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1782				
	jbra _?L1806				
_?L1805:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1762				
_?L1809:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1779				
_?L1803:					
	lea _miniflac_sync_internal,a3		
_?L1780:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1808				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1762				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1780				
_?L1771:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1797				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1760				
						
	cmp.b #1,468(a6)			
	jbne _?L1760				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1782				
_?L1811:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1782				
_?L1774:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1809				
	jbra _?L1762				
_?L1801:					
						
	tst.l 56(sp)				
	jbeq _?L1792				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1752				
	cmp.b #102,d0				
	jbeq _?L1810				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1806:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1782				
						
	cmp.b #1,468(a6)			
	jbne _?L1782				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1782				
	jbra _?L1811				
_?L1810:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1755:					
	subq.l #4,d0				
	jbeq _?L1812				
_?L1757:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1756				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1757				
_?L1812:					
	lea _miniflac_sync_internal,a3		
_?L1758:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1813				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1756				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1758				
	moveq #-1,d0				
_?L1756:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1815:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1802:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1755				
_?L1808:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_totalcolors	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1782				
	jbra _?L1806				
_?L1792:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1804:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1762				
	jbra _?L1814				
_?L1752:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1790				
_?L1813:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_totalcolors	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1815				
_?L1797:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1749				
						
	.align	2				
	.globl	_miniflac_picture_length	
						
_miniflac_picture_length:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L1868				
						
	subq.l #1,d0				
	jbeq _?L1869				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1857:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1827				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L1870				
_?L1846:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1862				
	add.l d0,d0				
	move.w _?L1831(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1831:					
	.dc.w _?L1835-_?L1831			
	.dc.w _?L1834-_?L1831			
	.dc.w _?L1833-_?L1831			
	.dc.w _?L1832-_?L1831			
	.dc.w _?L1862-_?L1831			
	.dc.w _?L1844-_?L1831			
_?L1834:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1839				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1871				
						
	cmp.b #-1,d1				
	jbne _?L1838				
_?L1840:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1844:					
						
	tst.l 210(a6)				
	jbeq _?L1872				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1844				
_?L1829:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1873				
_?L1849:					
						
	tst.l d0				
	jbne _?L1827				
	cmp.l 56(sp),a1				
	jbcs _?L1857				
_?L1827:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1816:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1835:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1829				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1833:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1829				
_?L1881:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1832:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1839				
_?L1874:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1840				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1841				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1829				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1874				
_?L1839:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1849				
	jbra _?L1873				
_?L1862:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1849				
	jbra _?L1873				
_?L1872:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1829				
_?L1876:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1846				
_?L1870:					
	lea _miniflac_sync_internal,a3		
_?L1847:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1875				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1829				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1847				
_?L1838:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1864				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1827				
						
	cmp.b #1,468(a6)			
	jbne _?L1827				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1849				
_?L1878:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1849				
_?L1841:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1876				
	jbra _?L1829				
_?L1868:					
						
	tst.l 56(sp)				
	jbeq _?L1859				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1819				
	cmp.b #102,d0				
	jbeq _?L1877				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1873:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1849				
						
	cmp.b #1,468(a6)			
	jbne _?L1849				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1849				
	jbra _?L1878				
_?L1877:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1822:					
	subq.l #4,d0				
	jbeq _?L1879				
_?L1824:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1823				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1824				
_?L1879:					
	lea _miniflac_sync_internal,a3		
_?L1825:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1880				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1823				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1825				
	moveq #-1,d0				
_?L1823:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1882:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1869:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1822				
_?L1875:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_length	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1849				
	jbra _?L1873				
_?L1859:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1871:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1829				
	jbra _?L1881				
_?L1819:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1857				
_?L1880:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_length	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1882				
_?L1864:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1816				
						
	.align	2				
	.globl	_miniflac_picture_data		
						
_miniflac_picture_data:				
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L1935				
						
	subq.l #1,d0				
	jbeq _?L1936				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1924:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1894				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L1937				
_?L1913:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1929				
	add.l d0,d0				
	move.w _?L1898(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1898:					
	.dc.w _?L1902-_?L1898			
	.dc.w _?L1901-_?L1898			
	.dc.w _?L1900-_?L1898			
	.dc.w _?L1899-_?L1898			
	.dc.w _?L1929-_?L1898			
	.dc.w _?L1911-_?L1898			
_?L1901:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1906				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L1938				
						
	cmp.b #-1,d1				
	jbne _?L1905				
_?L1907:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1911:					
						
	tst.l 210(a6)				
	jbeq _?L1939				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1911				
_?L1896:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L1940				
_?L1916:					
						
	tst.l d0				
	jbne _?L1894				
	cmp.l 56(sp),a1				
	jbcs _?L1924				
_?L1894:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1883:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1902:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1896				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1900:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1896				
_?L1948:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1899:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1906				
_?L1941:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1907				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1908				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1896				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L1941				
_?L1906:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1916				
	jbra _?L1940				
_?L1929:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1916				
	jbra _?L1940				
_?L1939:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1896				
_?L1943:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1913				
_?L1937:					
	lea _miniflac_sync_internal,a3		
_?L1914:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1942				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1896				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1914				
_?L1905:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1931				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1894				
						
	cmp.b #1,468(a6)			
	jbne _?L1894				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1916				
_?L1945:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1916				
_?L1908:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1943				
	jbra _?L1896				
_?L1935:					
						
	tst.l 56(sp)				
	jbeq _?L1926				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1886				
	cmp.b #102,d0				
	jbeq _?L1944				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1940:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1916				
						
	cmp.b #1,468(a6)			
	jbne _?L1916				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1916				
	jbra _?L1945				
_?L1944:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1889:					
	subq.l #4,d0				
	jbeq _?L1946				
_?L1891:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1890				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1891				
_?L1946:					
	lea _miniflac_sync_internal,a3		
_?L1892:					
	moveq #6,d1				
	cmp.l 114(a6),d1			
	jbeq _?L1947				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1890				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1892				
	moveq #-1,d0				
_?L1890:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L1949:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1936:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1889				
_?L1942:					
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_data	
	lea (20,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1916				
	jbra _?L1940				
_?L1926:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1938:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1896				
	jbra _?L1948				
_?L1886:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1924				
_?L1947:					
						
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 154(a6)				
	jbsr _miniflac_picture_read_data	
	lea (20,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L1949				
_?L1931:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1883				
						
	.align	2				
	.globl	_miniflac_cuesheet_catalog_length
						
_miniflac_cuesheet_catalog_length:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2002				
						
	subq.l #1,d0				
	jbeq _?L2003				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L1991:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1961				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2004				
_?L1980:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L1996				
	add.l d0,d0				
	move.w _?L1965(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L1965:					
	.dc.w _?L1969-_?L1965			
	.dc.w _?L1968-_?L1965			
	.dc.w _?L1967-_?L1965			
	.dc.w _?L1966-_?L1965			
	.dc.w _?L1996-_?L1965			
	.dc.w _?L1978-_?L1965			
_?L1968:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1973				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2005				
						
	cmp.b #-1,d1				
	jbne _?L1972				
_?L1974:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L1978:					
						
	tst.l 210(a6)				
	jbeq _?L2006				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L1978				
_?L1963:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2007				
_?L1983:					
						
	tst.l d0				
	jbne _?L1961				
	cmp.l 56(sp),a1				
	jbcs _?L1991				
_?L1961:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L1950:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L1969:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1963				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L1967:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1963				
_?L2015:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L1966:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L1973				
_?L2008:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L1974				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L1975				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1963				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2008				
_?L1973:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1983				
	jbra _?L2007				
_?L1996:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1983				
	jbra _?L2007				
_?L2006:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1963				
_?L2010:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L1980				
_?L2004:					
	lea _miniflac_sync_internal,a3		
_?L1981:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2009				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1963				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1981				
_?L1972:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L1998				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L1961				
						
	cmp.b #1,468(a6)			
	jbne _?L1961				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1983				
_?L2012:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L1983				
_?L1975:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2010				
	jbra _?L1963				
_?L2002:					
						
	tst.l 56(sp)				
	jbeq _?L1993				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L1953				
	cmp.b #102,d0				
	jbeq _?L2011				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2007:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L1983				
						
	cmp.b #1,468(a6)			
	jbne _?L1983				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L1983				
	jbra _?L2012				
_?L2011:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L1956:					
	subq.l #4,d0				
	jbeq _?L2013				
_?L1958:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1957				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L1958				
_?L2013:					
	lea _miniflac_sync_internal,a3		
_?L1959:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2014				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1957				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L1959				
	moveq #-1,d0				
_?L1957:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2016:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2003:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L1956				
_?L2009:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_catalog_length
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L1983				
	jbra _?L2007				
_?L1993:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2005:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L1963				
	jbra _?L2015				
_?L1953:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L1991				
_?L2014:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_catalog_length
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2016				
_?L1998:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L1950				
						
	.align	2				
	.globl	_miniflac_cuesheet_catalog_string
						
_miniflac_cuesheet_catalog_string:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2069				
						
	subq.l #1,d0				
	jbeq _?L2070				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2058:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2028				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2071				
_?L2047:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2063				
	add.l d0,d0				
	move.w _?L2032(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2032:					
	.dc.w _?L2036-_?L2032			
	.dc.w _?L2035-_?L2032			
	.dc.w _?L2034-_?L2032			
	.dc.w _?L2033-_?L2032			
	.dc.w _?L2063-_?L2032			
	.dc.w _?L2045-_?L2032			
_?L2035:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2040				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2072				
						
	cmp.b #-1,d1				
	jbne _?L2039				
_?L2041:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2045:					
						
	tst.l 210(a6)				
	jbeq _?L2073				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2045				
_?L2030:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2074				
_?L2050:					
						
	tst.l d0				
	jbne _?L2028				
	cmp.l 56(sp),a1				
	jbcs _?L2058				
_?L2028:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2017:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2036:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2030				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2034:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2030				
_?L2082:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2033:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2040				
_?L2075:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2041				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2042				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2030				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2075				
_?L2040:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2050				
	jbra _?L2074				
_?L2063:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2050				
	jbra _?L2074				
_?L2073:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2030				
_?L2077:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2047				
_?L2071:					
	lea _miniflac_sync_internal,a3		
_?L2048:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2076				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2030				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2048				
_?L2039:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L2065				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2028				
						
	cmp.b #1,468(a6)			
	jbne _?L2028				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2050				
_?L2079:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2050				
_?L2042:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2077				
	jbra _?L2030				
_?L2069:					
						
	tst.l 56(sp)				
	jbeq _?L2060				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2020				
	cmp.b #102,d0				
	jbeq _?L2078				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2074:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2050				
						
	cmp.b #1,468(a6)			
	jbne _?L2050				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2050				
	jbra _?L2079				
_?L2078:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2023:					
	subq.l #4,d0				
	jbeq _?L2080				
_?L2025:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2024				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2025				
_?L2080:					
	lea _miniflac_sync_internal,a3		
_?L2026:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2081				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2024				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2026				
	moveq #-1,d0				
_?L2024:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2083:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2070:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2023				
_?L2076:					
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_catalog_string
	lea (20,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2050				
	jbra _?L2074				
_?L2060:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2072:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2030				
	jbra _?L2082				
_?L2020:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2058				
_?L2081:					
						
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_catalog_string
	lea (20,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2083				
_?L2065:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2017				
						
	.align	2				
	.globl	_miniflac_cuesheet_leadin	
						
_miniflac_cuesheet_leadin:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2136				
						
	subq.l #1,d0				
	jbeq _?L2137				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2125:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2095				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2138				
_?L2114:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2130				
	add.l d0,d0				
	move.w _?L2099(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2099:					
	.dc.w _?L2103-_?L2099			
	.dc.w _?L2102-_?L2099			
	.dc.w _?L2101-_?L2099			
	.dc.w _?L2100-_?L2099			
	.dc.w _?L2130-_?L2099			
	.dc.w _?L2112-_?L2099			
_?L2102:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2107				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2139				
						
	cmp.b #-1,d1				
	jbne _?L2106				
_?L2108:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2112:					
						
	tst.l 210(a6)				
	jbeq _?L2140				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2112				
_?L2097:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2141				
_?L2117:					
						
	tst.l d0				
	jbne _?L2095				
	cmp.l 56(sp),a1				
	jbcs _?L2125				
_?L2095:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2084:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2103:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2097				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2101:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2097				
_?L2149:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2100:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2107				
_?L2142:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2108				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2109				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2097				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2142				
_?L2107:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2117				
	jbra _?L2141				
_?L2130:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2117				
	jbra _?L2141				
_?L2140:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2097				
_?L2144:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2114				
_?L2138:					
	lea _miniflac_sync_internal,a3		
_?L2115:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2143				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2097				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2115				
_?L2106:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L2132				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2095				
						
	cmp.b #1,468(a6)			
	jbne _?L2095				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2117				
_?L2146:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2117				
_?L2109:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2144				
	jbra _?L2097				
_?L2136:					
						
	tst.l 56(sp)				
	jbeq _?L2127				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2087				
	cmp.b #102,d0				
	jbeq _?L2145				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2141:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2117				
						
	cmp.b #1,468(a6)			
	jbne _?L2117				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2117				
	jbra _?L2146				
_?L2145:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2090:					
	subq.l #4,d0				
	jbeq _?L2147				
_?L2092:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2091				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2092				
_?L2147:					
	lea _miniflac_sync_internal,a3		
_?L2093:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2148				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2091				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2093				
	moveq #-1,d0				
_?L2091:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2150:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2137:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2090				
_?L2143:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_leadin	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2117				
	jbra _?L2141				
_?L2127:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2139:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2097				
	jbra _?L2149				
_?L2087:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2125				
_?L2148:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_leadin	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2150				
_?L2132:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2084				
						
	.align	2				
	.globl	_miniflac_cuesheet_cd_flag	
						
_miniflac_cuesheet_cd_flag:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2203				
						
	subq.l #1,d0				
	jbeq _?L2204				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2192:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2162				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2205				
_?L2181:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2197				
	add.l d0,d0				
	move.w _?L2166(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2166:					
	.dc.w _?L2170-_?L2166			
	.dc.w _?L2169-_?L2166			
	.dc.w _?L2168-_?L2166			
	.dc.w _?L2167-_?L2166			
	.dc.w _?L2197-_?L2166			
	.dc.w _?L2179-_?L2166			
_?L2169:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2174				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2206				
						
	cmp.b #-1,d1				
	jbne _?L2173				
_?L2175:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2179:					
						
	tst.l 210(a6)				
	jbeq _?L2207				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2179				
_?L2164:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2208				
_?L2184:					
						
	tst.l d0				
	jbne _?L2162				
	cmp.l 56(sp),a1				
	jbcs _?L2192				
_?L2162:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2151:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2170:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2164				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2168:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2164				
_?L2216:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2167:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2174				
_?L2209:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2175				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2176				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2164				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2209				
_?L2174:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2184				
	jbra _?L2208				
_?L2197:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2184				
	jbra _?L2208				
_?L2207:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2164				
_?L2211:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2181				
_?L2205:					
	lea _miniflac_sync_internal,a3		
_?L2182:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2210				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2164				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2182				
_?L2173:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L2199				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2162				
						
	cmp.b #1,468(a6)			
	jbne _?L2162				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2184				
_?L2213:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2184				
_?L2176:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2211				
	jbra _?L2164				
_?L2203:					
						
	tst.l 56(sp)				
	jbeq _?L2194				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2154				
	cmp.b #102,d0				
	jbeq _?L2212				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2208:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2184				
						
	cmp.b #1,468(a6)			
	jbne _?L2184				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2184				
	jbra _?L2213				
_?L2212:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2157:					
	subq.l #4,d0				
	jbeq _?L2214				
_?L2159:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2158				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2159				
_?L2214:					
	lea _miniflac_sync_internal,a3		
_?L2160:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2215				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2158				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2160				
	moveq #-1,d0				
_?L2158:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2217:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2204:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2157				
_?L2210:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_cd_flag	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2184				
	jbra _?L2208				
_?L2194:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2206:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2164				
	jbra _?L2216				
_?L2154:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2192				
_?L2215:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_cd_flag	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2217				
_?L2199:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2151				
						
	.align	2				
	.globl	_miniflac_cuesheet_tracks	
						
_miniflac_cuesheet_tracks:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2270				
						
	subq.l #1,d0				
	jbeq _?L2271				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2259:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2229				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2272				
_?L2248:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2264				
	add.l d0,d0				
	move.w _?L2233(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2233:					
	.dc.w _?L2237-_?L2233			
	.dc.w _?L2236-_?L2233			
	.dc.w _?L2235-_?L2233			
	.dc.w _?L2234-_?L2233			
	.dc.w _?L2264-_?L2233			
	.dc.w _?L2246-_?L2233			
_?L2236:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2241				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2273				
						
	cmp.b #-1,d1				
	jbne _?L2240				
_?L2242:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2246:					
						
	tst.l 210(a6)				
	jbeq _?L2274				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2246				
_?L2231:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2275				
_?L2251:					
						
	tst.l d0				
	jbne _?L2229				
	cmp.l 56(sp),a1				
	jbcs _?L2259				
_?L2229:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2218:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2237:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2231				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2235:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2231				
_?L2283:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2234:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2241				
_?L2276:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2242				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2243				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2231				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2276				
_?L2241:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2251				
	jbra _?L2275				
_?L2264:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2251				
	jbra _?L2275				
_?L2274:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2231				
_?L2278:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2248				
_?L2272:					
	lea _miniflac_sync_internal,a3		
_?L2249:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2277				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2231				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2249				
_?L2240:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L2266				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2229				
						
	cmp.b #1,468(a6)			
	jbne _?L2229				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2251				
_?L2280:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2251				
_?L2243:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2278				
	jbra _?L2231				
_?L2270:					
						
	tst.l 56(sp)				
	jbeq _?L2261				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2221				
	cmp.b #102,d0				
	jbeq _?L2279				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2275:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2251				
						
	cmp.b #1,468(a6)			
	jbne _?L2251				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2251				
	jbra _?L2280				
_?L2279:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2224:					
	subq.l #4,d0				
	jbeq _?L2281				
_?L2226:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2225				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2226				
_?L2281:					
	lea _miniflac_sync_internal,a3		
_?L2227:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2282				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2225				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2227				
	moveq #-1,d0				
_?L2225:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2284:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2271:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2224				
_?L2277:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_tracks	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2251				
	jbra _?L2275				
_?L2261:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2273:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2231				
	jbra _?L2283				
_?L2221:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2259				
_?L2282:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_tracks	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2284				
_?L2266:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2218				
						
	.align	2				
	.globl	_miniflac_cuesheet_track_offset	
						
_miniflac_cuesheet_track_offset:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2337				
						
	subq.l #1,d0				
	jbeq _?L2338				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2326:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2296				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2339				
_?L2315:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2331				
	add.l d0,d0				
	move.w _?L2300(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2300:					
	.dc.w _?L2304-_?L2300			
	.dc.w _?L2303-_?L2300			
	.dc.w _?L2302-_?L2300			
	.dc.w _?L2301-_?L2300			
	.dc.w _?L2331-_?L2300			
	.dc.w _?L2313-_?L2300			
_?L2303:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2308				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2340				
						
	cmp.b #-1,d1				
	jbne _?L2307				
_?L2309:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2313:					
						
	tst.l 210(a6)				
	jbeq _?L2341				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2313				
_?L2298:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2342				
_?L2318:					
						
	tst.l d0				
	jbne _?L2296				
	cmp.l 56(sp),a1				
	jbcs _?L2326				
_?L2296:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2285:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2304:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2298				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2302:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2298				
_?L2350:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2301:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2308				
_?L2343:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2309				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2310				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2298				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2343				
_?L2308:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2318				
	jbra _?L2342				
_?L2331:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2318				
	jbra _?L2342				
_?L2341:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2298				
_?L2345:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2315				
_?L2339:					
	lea _miniflac_sync_internal,a3		
_?L2316:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2344				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2298				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2316				
_?L2307:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L2333				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2296				
						
	cmp.b #1,468(a6)			
	jbne _?L2296				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2318				
_?L2347:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2318				
_?L2310:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2345				
	jbra _?L2298				
_?L2337:					
						
	tst.l 56(sp)				
	jbeq _?L2328				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2288				
	cmp.b #102,d0				
	jbeq _?L2346				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2342:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2318				
						
	cmp.b #1,468(a6)			
	jbne _?L2318				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2318				
	jbra _?L2347				
_?L2346:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2291:					
	subq.l #4,d0				
	jbeq _?L2348				
_?L2293:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2292				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2293				
_?L2348:					
	lea _miniflac_sync_internal,a3		
_?L2294:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2349				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2292				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2294				
	moveq #-1,d0				
_?L2292:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2351:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2338:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2291				
_?L2344:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_offset
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2318				
	jbra _?L2342				
_?L2328:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2340:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2298				
	jbra _?L2350				
_?L2288:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2326				
_?L2349:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_offset
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2351				
_?L2333:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2285				
						
	.align	2				
	.globl	_miniflac_cuesheet_track_number	
						
_miniflac_cuesheet_track_number:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2404				
						
	subq.l #1,d0				
	jbeq _?L2405				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2393:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2363				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2406				
_?L2382:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2398				
	add.l d0,d0				
	move.w _?L2367(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2367:					
	.dc.w _?L2371-_?L2367			
	.dc.w _?L2370-_?L2367			
	.dc.w _?L2369-_?L2367			
	.dc.w _?L2368-_?L2367			
	.dc.w _?L2398-_?L2367			
	.dc.w _?L2380-_?L2367			
_?L2370:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2375				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2407				
						
	cmp.b #-1,d1				
	jbne _?L2374				
_?L2376:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2380:					
						
	tst.l 210(a6)				
	jbeq _?L2408				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2380				
_?L2365:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2409				
_?L2385:					
						
	tst.l d0				
	jbne _?L2363				
	cmp.l 56(sp),a1				
	jbcs _?L2393				
_?L2363:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2352:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2371:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2365				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2369:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2365				
_?L2417:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2368:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2375				
_?L2410:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2376				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2377				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2365				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2410				
_?L2375:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2385				
	jbra _?L2409				
_?L2398:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2385				
	jbra _?L2409				
_?L2408:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2365				
_?L2412:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2382				
_?L2406:					
	lea _miniflac_sync_internal,a3		
_?L2383:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2411				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2365				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2383				
_?L2374:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L2400				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2363				
						
	cmp.b #1,468(a6)			
	jbne _?L2363				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2385				
_?L2414:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2385				
_?L2377:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2412				
	jbra _?L2365				
_?L2404:					
						
	tst.l 56(sp)				
	jbeq _?L2395				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2355				
	cmp.b #102,d0				
	jbeq _?L2413				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2409:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2385				
						
	cmp.b #1,468(a6)			
	jbne _?L2385				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2385				
	jbra _?L2414				
_?L2413:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2358:					
	subq.l #4,d0				
	jbeq _?L2415				
_?L2360:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2359				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2360				
_?L2415:					
	lea _miniflac_sync_internal,a3		
_?L2361:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2416				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2359				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2361				
	moveq #-1,d0				
_?L2359:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2418:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2405:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2358				
_?L2411:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2385				
	jbra _?L2409				
_?L2395:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2407:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2365				
	jbra _?L2417				
_?L2355:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2393				
_?L2416:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2418				
_?L2400:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2352				
						
	.align	2				
	.globl	_miniflac_cuesheet_track_isrc_length
						
_miniflac_cuesheet_track_isrc_length:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2471				
						
	subq.l #1,d0				
	jbeq _?L2472				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2460:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2430				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2473				
_?L2449:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2465				
	add.l d0,d0				
	move.w _?L2434(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2434:					
	.dc.w _?L2438-_?L2434			
	.dc.w _?L2437-_?L2434			
	.dc.w _?L2436-_?L2434			
	.dc.w _?L2435-_?L2434			
	.dc.w _?L2465-_?L2434			
	.dc.w _?L2447-_?L2434			
_?L2437:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2442				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2474				
						
	cmp.b #-1,d1				
	jbne _?L2441				
_?L2443:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2447:					
						
	tst.l 210(a6)				
	jbeq _?L2475				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2447				
_?L2432:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2476				
_?L2452:					
						
	tst.l d0				
	jbne _?L2430				
	cmp.l 56(sp),a1				
	jbcs _?L2460				
_?L2430:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2419:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2438:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2432				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2436:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2432				
_?L2484:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2435:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2442				
_?L2477:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2443				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2444				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2432				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2477				
_?L2442:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2452				
	jbra _?L2476				
_?L2465:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2452				
	jbra _?L2476				
_?L2475:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2432				
_?L2479:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2449				
_?L2473:					
	lea _miniflac_sync_internal,a3		
_?L2450:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2478				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2432				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2450				
_?L2441:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L2467				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2430				
						
	cmp.b #1,468(a6)			
	jbne _?L2430				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2452				
_?L2481:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2452				
_?L2444:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2479				
	jbra _?L2432				
_?L2471:					
						
	tst.l 56(sp)				
	jbeq _?L2462				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2422				
	cmp.b #102,d0				
	jbeq _?L2480				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2476:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2452				
						
	cmp.b #1,468(a6)			
	jbne _?L2452				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2452				
	jbra _?L2481				
_?L2480:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2425:					
	subq.l #4,d0				
	jbeq _?L2482				
_?L2427:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2426				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2427				
_?L2482:					
	lea _miniflac_sync_internal,a3		
_?L2428:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2483				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2426				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2428				
	moveq #-1,d0				
_?L2426:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2485:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2472:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2425				
_?L2478:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_isrc_length
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2452				
	jbra _?L2476				
_?L2462:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2474:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2432				
	jbra _?L2484				
_?L2422:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2460				
_?L2483:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_isrc_length
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2485				
_?L2467:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2419				
						
	.align	2				
	.globl	_miniflac_cuesheet_track_isrc_string
						
_miniflac_cuesheet_track_isrc_string:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2538				
						
	subq.l #1,d0				
	jbeq _?L2539				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2527:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2497				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2540				
_?L2516:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2532				
	add.l d0,d0				
	move.w _?L2501(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2501:					
	.dc.w _?L2505-_?L2501			
	.dc.w _?L2504-_?L2501			
	.dc.w _?L2503-_?L2501			
	.dc.w _?L2502-_?L2501			
	.dc.w _?L2532-_?L2501			
	.dc.w _?L2514-_?L2501			
_?L2504:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2509				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2541				
						
	cmp.b #-1,d1				
	jbne _?L2508				
_?L2510:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2514:					
						
	tst.l 210(a6)				
	jbeq _?L2542				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2514				
_?L2499:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2543				
_?L2519:					
						
	tst.l d0				
	jbne _?L2497				
	cmp.l 56(sp),a1				
	jbcs _?L2527				
_?L2497:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2486:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2505:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2499				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2503:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2499				
_?L2551:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2502:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2509				
_?L2544:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2510				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2511				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2499				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2544				
_?L2509:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2519				
	jbra _?L2543				
_?L2532:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2519				
	jbra _?L2543				
_?L2542:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2499				
_?L2546:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2516				
_?L2540:					
	lea _miniflac_sync_internal,a3		
_?L2517:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2545				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2499				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2517				
_?L2508:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L2534				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2497				
						
	cmp.b #1,468(a6)			
	jbne _?L2497				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2519				
_?L2548:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2519				
_?L2511:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2546				
	jbra _?L2499				
_?L2538:					
						
	tst.l 56(sp)				
	jbeq _?L2529				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2489				
	cmp.b #102,d0				
	jbeq _?L2547				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2543:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2519				
						
	cmp.b #1,468(a6)			
	jbne _?L2519				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2519				
	jbra _?L2548				
_?L2547:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2492:					
	subq.l #4,d0				
	jbeq _?L2549				
_?L2494:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2493				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2494				
_?L2549:					
	lea _miniflac_sync_internal,a3		
_?L2495:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2550				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2493				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2495				
	moveq #-1,d0				
_?L2493:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2552:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2539:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2492				
_?L2545:					
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_isrc_string
	lea (20,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2519				
	jbra _?L2543				
_?L2529:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2541:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2499				
	jbra _?L2551				
_?L2489:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2527				
_?L2550:					
						
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_isrc_string
	lea (20,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2552				
_?L2534:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2486				
						
	.align	2				
	.globl	_miniflac_cuesheet_track_audio_flag
						
_miniflac_cuesheet_track_audio_flag:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2605				
						
	subq.l #1,d0				
	jbeq _?L2606				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2594:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2564				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2607				
_?L2583:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2599				
	add.l d0,d0				
	move.w _?L2568(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2568:					
	.dc.w _?L2572-_?L2568			
	.dc.w _?L2571-_?L2568			
	.dc.w _?L2570-_?L2568			
	.dc.w _?L2569-_?L2568			
	.dc.w _?L2599-_?L2568			
	.dc.w _?L2581-_?L2568			
_?L2571:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2576				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2608				
						
	cmp.b #-1,d1				
	jbne _?L2575				
_?L2577:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2581:					
						
	tst.l 210(a6)				
	jbeq _?L2609				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2581				
_?L2566:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2610				
_?L2586:					
						
	tst.l d0				
	jbne _?L2564				
	cmp.l 56(sp),a1				
	jbcs _?L2594				
_?L2564:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2553:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2572:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2566				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2570:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2566				
_?L2618:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2569:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2576				
_?L2611:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2577				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2578				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2566				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2611				
_?L2576:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2586				
	jbra _?L2610				
_?L2599:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2586				
	jbra _?L2610				
_?L2609:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2566				
_?L2613:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2583				
_?L2607:					
	lea _miniflac_sync_internal,a3		
_?L2584:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2612				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2566				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2584				
_?L2575:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L2601				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2564				
						
	cmp.b #1,468(a6)			
	jbne _?L2564				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2586				
_?L2615:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2586				
_?L2578:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2613				
	jbra _?L2566				
_?L2605:					
						
	tst.l 56(sp)				
	jbeq _?L2596				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2556				
	cmp.b #102,d0				
	jbeq _?L2614				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2610:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2586				
						
	cmp.b #1,468(a6)			
	jbne _?L2586				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2586				
	jbra _?L2615				
_?L2614:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2559:					
	subq.l #4,d0				
	jbeq _?L2616				
_?L2561:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2560				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2561				
_?L2616:					
	lea _miniflac_sync_internal,a3		
_?L2562:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2617				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2560				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2562				
	moveq #-1,d0				
_?L2560:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2619:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2606:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2559				
_?L2612:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_audio_flag
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2586				
	jbra _?L2610				
_?L2596:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2608:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2566				
	jbra _?L2618				
_?L2556:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2594				
_?L2617:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_audio_flag
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2619				
_?L2601:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2553				
						
	.align	2				
	.globl	_miniflac_cuesheet_track_preemph_flag
						
_miniflac_cuesheet_track_preemph_flag:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2672				
						
	subq.l #1,d0				
	jbeq _?L2673				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2661:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2631				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2674				
_?L2650:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2666				
	add.l d0,d0				
	move.w _?L2635(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2635:					
	.dc.w _?L2639-_?L2635			
	.dc.w _?L2638-_?L2635			
	.dc.w _?L2637-_?L2635			
	.dc.w _?L2636-_?L2635			
	.dc.w _?L2666-_?L2635			
	.dc.w _?L2648-_?L2635			
_?L2638:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2643				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2675				
						
	cmp.b #-1,d1				
	jbne _?L2642				
_?L2644:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2648:					
						
	tst.l 210(a6)				
	jbeq _?L2676				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2648				
_?L2633:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2677				
_?L2653:					
						
	tst.l d0				
	jbne _?L2631				
	cmp.l 56(sp),a1				
	jbcs _?L2661				
_?L2631:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2620:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2639:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2633				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2637:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2633				
_?L2685:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2636:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2643				
_?L2678:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2644				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2645				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2633				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2678				
_?L2643:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2653				
	jbra _?L2677				
_?L2666:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2653				
	jbra _?L2677				
_?L2676:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2633				
_?L2680:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2650				
_?L2674:					
	lea _miniflac_sync_internal,a3		
_?L2651:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2679				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2633				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2651				
_?L2642:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L2668				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2631				
						
	cmp.b #1,468(a6)			
	jbne _?L2631				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2653				
_?L2682:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2653				
_?L2645:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2680				
	jbra _?L2633				
_?L2672:					
						
	tst.l 56(sp)				
	jbeq _?L2663				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2623				
	cmp.b #102,d0				
	jbeq _?L2681				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2677:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2653				
						
	cmp.b #1,468(a6)			
	jbne _?L2653				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2653				
	jbra _?L2682				
_?L2681:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2626:					
	subq.l #4,d0				
	jbeq _?L2683				
_?L2628:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2627				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2628				
_?L2683:					
	lea _miniflac_sync_internal,a3		
_?L2629:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2684				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2627				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2629				
	moveq #-1,d0				
_?L2627:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2686:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2673:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2626				
_?L2679:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_preemph_flag
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2653				
	jbra _?L2677				
_?L2663:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2675:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2633				
	jbra _?L2685				
_?L2623:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2661				
_?L2684:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_preemph_flag
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2686				
_?L2668:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2620				
						
	.align	2				
	.globl	_miniflac_cuesheet_track_indexpoints
						
_miniflac_cuesheet_track_indexpoints:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2739				
						
	subq.l #1,d0				
	jbeq _?L2740				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2728:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2698				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2741				
_?L2717:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2733				
	add.l d0,d0				
	move.w _?L2702(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2702:					
	.dc.w _?L2706-_?L2702			
	.dc.w _?L2705-_?L2702			
	.dc.w _?L2704-_?L2702			
	.dc.w _?L2703-_?L2702			
	.dc.w _?L2733-_?L2702			
	.dc.w _?L2715-_?L2702			
_?L2705:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2710				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2742				
						
	cmp.b #-1,d1				
	jbne _?L2709				
_?L2711:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2715:					
						
	tst.l 210(a6)				
	jbeq _?L2743				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2715				
_?L2700:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2744				
_?L2720:					
						
	tst.l d0				
	jbne _?L2698				
	cmp.l 56(sp),a1				
	jbcs _?L2728				
_?L2698:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2687:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2706:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2700				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2704:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2700				
_?L2752:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2703:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2710				
_?L2745:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2711				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2712				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2700				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2745				
_?L2710:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2720				
	jbra _?L2744				
_?L2733:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2720				
	jbra _?L2744				
_?L2743:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2700				
_?L2747:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2717				
_?L2741:					
	lea _miniflac_sync_internal,a3		
_?L2718:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2746				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2700				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2718				
_?L2709:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L2735				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2698				
						
	cmp.b #1,468(a6)			
	jbne _?L2698				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2720				
_?L2749:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2720				
_?L2712:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2747				
	jbra _?L2700				
_?L2739:					
						
	tst.l 56(sp)				
	jbeq _?L2730				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2690				
	cmp.b #102,d0				
	jbeq _?L2748				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2744:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2720				
						
	cmp.b #1,468(a6)			
	jbne _?L2720				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2720				
	jbra _?L2749				
_?L2748:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2693:					
	subq.l #4,d0				
	jbeq _?L2750				
_?L2695:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2694				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2695				
_?L2750:					
	lea _miniflac_sync_internal,a3		
_?L2696:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2751				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2694				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2696				
	moveq #-1,d0				
_?L2694:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2753:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2740:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2693				
_?L2746:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_indexpoints
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2720				
	jbra _?L2744				
_?L2730:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2742:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2700				
	jbra _?L2752				
_?L2690:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2728				
_?L2751:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_track_indexpoints
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2753				
_?L2735:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2687				
						
	.align	2				
	.globl	_miniflac_cuesheet_index_point_offset
						
_miniflac_cuesheet_index_point_offset:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2806				
						
	subq.l #1,d0				
	jbeq _?L2807				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2795:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2765				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2808				
_?L2784:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2800				
	add.l d0,d0				
	move.w _?L2769(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2769:					
	.dc.w _?L2773-_?L2769			
	.dc.w _?L2772-_?L2769			
	.dc.w _?L2771-_?L2769			
	.dc.w _?L2770-_?L2769			
	.dc.w _?L2800-_?L2769			
	.dc.w _?L2782-_?L2769			
_?L2772:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2777				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2809				
						
	cmp.b #-1,d1				
	jbne _?L2776				
_?L2778:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2782:					
						
	tst.l 210(a6)				
	jbeq _?L2810				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2782				
_?L2767:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2811				
_?L2787:					
						
	tst.l d0				
	jbne _?L2765				
	cmp.l 56(sp),a1				
	jbcs _?L2795				
_?L2765:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2754:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2773:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2767				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2771:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2767				
_?L2819:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2770:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2777				
_?L2812:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2778				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2779				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2767				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2812				
_?L2777:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2787				
	jbra _?L2811				
_?L2800:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2787				
	jbra _?L2811				
_?L2810:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2767				
_?L2814:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2784				
_?L2808:					
	lea _miniflac_sync_internal,a3		
_?L2785:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2813				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2767				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2785				
_?L2776:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L2802				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2765				
						
	cmp.b #1,468(a6)			
	jbne _?L2765				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2787				
_?L2816:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2787				
_?L2779:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2814				
	jbra _?L2767				
_?L2806:					
						
	tst.l 56(sp)				
	jbeq _?L2797				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2757				
	cmp.b #102,d0				
	jbeq _?L2815				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2811:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2787				
						
	cmp.b #1,468(a6)			
	jbne _?L2787				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2787				
	jbra _?L2816				
_?L2815:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2760:					
	subq.l #4,d0				
	jbeq _?L2817				
_?L2762:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2761				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2762				
_?L2817:					
	lea _miniflac_sync_internal,a3		
_?L2763:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2818				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2761				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2763				
	moveq #-1,d0				
_?L2761:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2820:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2807:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2760				
_?L2813:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2787				
	jbra _?L2811				
_?L2797:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2809:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2767				
	jbra _?L2819				
_?L2757:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2795				
_?L2818:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2820				
_?L2802:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2754				
						
	.align	2				
	.globl	_miniflac_cuesheet_index_point_number
						
_miniflac_cuesheet_index_point_number:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2873				
						
	subq.l #1,d0				
	jbeq _?L2874				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2862:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2832				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2875				
_?L2851:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2867				
	add.l d0,d0				
	move.w _?L2836(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2836:					
	.dc.w _?L2840-_?L2836			
	.dc.w _?L2839-_?L2836			
	.dc.w _?L2838-_?L2836			
	.dc.w _?L2837-_?L2836			
	.dc.w _?L2867-_?L2836			
	.dc.w _?L2849-_?L2836			
_?L2839:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2844				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2876				
						
	cmp.b #-1,d1				
	jbne _?L2843				
_?L2845:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2849:					
						
	tst.l 210(a6)				
	jbeq _?L2877				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2849				
_?L2834:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2878				
_?L2854:					
						
	tst.l d0				
	jbne _?L2832				
	cmp.l 56(sp),a1				
	jbcs _?L2862				
_?L2832:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2821:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2840:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2834				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2838:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2834				
_?L2886:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2837:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2844				
_?L2879:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2845				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2846				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2834				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2879				
_?L2844:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2854				
	jbra _?L2878				
_?L2867:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2854				
	jbra _?L2878				
_?L2877:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2834				
_?L2881:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2851				
_?L2875:					
	lea _miniflac_sync_internal,a3		
_?L2852:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2880				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2834				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2852				
_?L2843:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L2869				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2832				
						
	cmp.b #1,468(a6)			
	jbne _?L2832				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2854				
_?L2883:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2854				
_?L2846:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2881				
	jbra _?L2834				
_?L2873:					
						
	tst.l 56(sp)				
	jbeq _?L2864				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2824				
	cmp.b #102,d0				
	jbeq _?L2882				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2878:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2854				
						
	cmp.b #1,468(a6)			
	jbne _?L2854				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2854				
	jbra _?L2883				
_?L2882:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2827:					
	subq.l #4,d0				
	jbeq _?L2884				
_?L2829:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2828				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2829				
_?L2884:					
	lea _miniflac_sync_internal,a3		
_?L2830:					
	moveq #5,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2885				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2828				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2830				
	moveq #-1,d0				
_?L2828:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2887:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2874:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2827				
_?L2880:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_index_point_number
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2854				
	jbra _?L2878				
_?L2864:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2876:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2834				
	jbra _?L2886				
_?L2824:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2862				
_?L2885:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 166(a6)				
	jbsr _miniflac_cuesheet_read_index_point_number
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2887				
_?L2869:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2821				
						
	.align	2				
	.globl	_miniflac_seektable_seekpoints	
						
_miniflac_seektable_seekpoints:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L2940				
						
	subq.l #1,d0				
	jbeq _?L2941				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2929:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2899				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L2942				
_?L2918:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L2934				
	add.l d0,d0				
	move.w _?L2903(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2903:					
	.dc.w _?L2907-_?L2903			
	.dc.w _?L2906-_?L2903			
	.dc.w _?L2905-_?L2903			
	.dc.w _?L2904-_?L2903			
	.dc.w _?L2934-_?L2903			
	.dc.w _?L2916-_?L2903			
_?L2906:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2911				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L2943				
						
	cmp.b #-1,d1				
	jbne _?L2910				
_?L2912:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2916:					
						
	tst.l 210(a6)				
	jbeq _?L2944				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2916				
_?L2901:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L2945				
_?L2921:					
						
	tst.l d0				
	jbne _?L2899				
	cmp.l 56(sp),a1				
	jbcs _?L2929				
_?L2899:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2888:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2907:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2901				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2905:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2901				
_?L2953:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2904:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2911				
_?L2946:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2912				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2913				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2901				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L2946				
_?L2911:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2921				
	jbra _?L2945				
_?L2934:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2921				
	jbra _?L2945				
_?L2944:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2901				
_?L2948:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2918				
_?L2942:					
	lea _miniflac_sync_internal,a3		
_?L2919:					
	moveq #3,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2947				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2901				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2919				
_?L2910:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L2936				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2899				
						
	cmp.b #1,468(a6)			
	jbne _?L2899				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2921				
_?L2950:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2921				
_?L2913:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2948				
	jbra _?L2901				
_?L2940:					
						
	tst.l 56(sp)				
	jbeq _?L2931				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2891				
	cmp.b #102,d0				
	jbeq _?L2949				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2945:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2921				
						
	cmp.b #1,468(a6)			
	jbne _?L2921				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2921				
	jbra _?L2950				
_?L2949:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2894:					
	subq.l #4,d0				
	jbeq _?L2951				
_?L2896:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2895				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2896				
_?L2951:					
	lea _miniflac_sync_internal,a3		
_?L2897:					
	moveq #3,d1				
	cmp.l 114(a6),d1			
	jbeq _?L2952				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2895				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2897				
	moveq #-1,d0				
_?L2895:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L2954:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2941:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2894				
_?L2947:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 178(a6)				
	jbsr _miniflac_seektable_read_seekpoints
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2921				
	jbra _?L2945				
_?L2931:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2943:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2901				
	jbra _?L2953				
_?L2891:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2929				
_?L2952:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 178(a6)				
	jbsr _miniflac_seektable_read_seekpoints
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L2954				
_?L2936:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2888				
						
	.align	2				
	.globl	_miniflac_seektable_sample_number
						
_miniflac_seektable_sample_number:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L3007				
						
	subq.l #1,d0				
	jbeq _?L3008				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L2996:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2966				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L3009				
_?L2985:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L3001				
	add.l d0,d0				
	move.w _?L2970(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L2970:					
	.dc.w _?L2974-_?L2970			
	.dc.w _?L2973-_?L2970			
	.dc.w _?L2972-_?L2970			
	.dc.w _?L2971-_?L2970			
	.dc.w _?L3001-_?L2970			
	.dc.w _?L2983-_?L2970			
_?L2973:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2978				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L3010				
						
	cmp.b #-1,d1				
	jbne _?L2977				
_?L2979:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L2983:					
						
	tst.l 210(a6)				
	jbeq _?L3011				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L2983				
_?L2968:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L3012				
_?L2988:					
						
	tst.l d0				
	jbne _?L2966				
	cmp.l 56(sp),a1				
	jbcs _?L2996				
_?L2966:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L2955:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L2974:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2968				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L2972:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2968				
_?L3020:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L2971:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L2978				
_?L3013:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L2979				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L2980				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2968				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3013				
_?L2978:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2988				
	jbra _?L3012				
_?L3001:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2988				
	jbra _?L3012				
_?L3011:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2968				
_?L3015:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L2985				
_?L3009:					
	lea _miniflac_sync_internal,a3		
_?L2986:					
	moveq #3,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3014				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2968				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2986				
_?L2977:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L3003				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L2966				
						
	cmp.b #1,468(a6)			
	jbne _?L2966				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2988				
_?L3017:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L2988				
_?L2980:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3015				
	jbra _?L2968				
_?L3007:					
						
	tst.l 56(sp)				
	jbeq _?L2998				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L2958				
	cmp.b #102,d0				
	jbeq _?L3016				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3012:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L2988				
						
	cmp.b #1,468(a6)			
	jbne _?L2988				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L2988				
	jbra _?L3017				
_?L3016:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L2961:					
	subq.l #4,d0				
	jbeq _?L3018				
_?L2963:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2962				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L2963				
_?L3018:					
	lea _miniflac_sync_internal,a3		
_?L2964:					
	moveq #3,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3019				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2962				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L2964				
	moveq #-1,d0				
_?L2962:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L3021:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3008:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L2961				
_?L3014:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 178(a6)				
	jbsr _miniflac_seektable_read_sample_number
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L2988				
	jbra _?L3012				
_?L2998:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3010:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L2968				
	jbra _?L3020				
_?L2958:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L2996				
_?L3019:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 178(a6)				
	jbsr _miniflac_seektable_read_sample_number
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3021				
_?L3003:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L2955				
						
	.align	2				
	.globl	_miniflac_seektable_sample_offset
						
_miniflac_seektable_sample_offset:		
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L3074				
						
	subq.l #1,d0				
	jbeq _?L3075				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L3063:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3033				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L3076				
_?L3052:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L3068				
	add.l d0,d0				
	move.w _?L3037(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L3037:					
	.dc.w _?L3041-_?L3037			
	.dc.w _?L3040-_?L3037			
	.dc.w _?L3039-_?L3037			
	.dc.w _?L3038-_?L3037			
	.dc.w _?L3068-_?L3037			
	.dc.w _?L3050-_?L3037			
_?L3040:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3045				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L3077				
						
	cmp.b #-1,d1				
	jbne _?L3044				
_?L3046:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L3050:					
						
	tst.l 210(a6)				
	jbeq _?L3078				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3050				
_?L3035:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L3079				
_?L3055:					
						
	tst.l d0				
	jbne _?L3033				
	cmp.l 56(sp),a1				
	jbcs _?L3063				
_?L3033:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L3022:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3041:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3035				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L3039:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3035				
_?L3087:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L3038:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3045				
_?L3080:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L3046				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L3047				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3035				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3080				
_?L3045:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3055				
	jbra _?L3079				
_?L3068:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3055				
	jbra _?L3079				
_?L3078:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3035				
_?L3082:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L3052				
_?L3076:					
	lea _miniflac_sync_internal,a3		
_?L3053:					
	moveq #3,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3081				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3035				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3053				
_?L3044:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L3070				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L3033				
						
	cmp.b #1,468(a6)			
	jbne _?L3033				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L3055				
_?L3084:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L3055				
_?L3047:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3082				
	jbra _?L3035				
_?L3074:					
						
	tst.l 56(sp)				
	jbeq _?L3065				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L3025				
	cmp.b #102,d0				
	jbeq _?L3083				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3079:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L3055				
						
	cmp.b #1,468(a6)			
	jbne _?L3055				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L3055				
	jbra _?L3084				
_?L3083:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3028:					
	subq.l #4,d0				
	jbeq _?L3085				
_?L3030:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3029				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L3030				
_?L3085:					
	lea _miniflac_sync_internal,a3		
_?L3031:					
	moveq #3,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3086				
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
_?L3029:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L3088:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3075:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L3028				
_?L3081:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 178(a6)				
	jbsr _miniflac_seektable_read_sample_offset
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3055				
	jbra _?L3079				
_?L3065:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3077:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3035				
	jbra _?L3087				
_?L3025:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L3063				
_?L3086:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 178(a6)				
	jbsr _miniflac_seektable_read_sample_offset
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3088				
_?L3070:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L3022				
						
	.align	2				
	.globl	_miniflac_seektable_samples	
						
_miniflac_seektable_samples:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L3141				
						
	subq.l #1,d0				
	jbeq _?L3142				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L3130:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3100				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L3143				
_?L3119:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L3135				
	add.l d0,d0				
	move.w _?L3104(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L3104:					
	.dc.w _?L3108-_?L3104			
	.dc.w _?L3107-_?L3104			
	.dc.w _?L3106-_?L3104			
	.dc.w _?L3105-_?L3104			
	.dc.w _?L3135-_?L3104			
	.dc.w _?L3117-_?L3104			
_?L3107:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3112				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L3144				
						
	cmp.b #-1,d1				
	jbne _?L3111				
_?L3113:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L3117:					
						
	tst.l 210(a6)				
	jbeq _?L3145				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3117				
_?L3102:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L3146				
_?L3122:					
						
	tst.l d0				
	jbne _?L3100				
	cmp.l 56(sp),a1				
	jbcs _?L3130				
_?L3100:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L3089:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3108:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3102				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L3106:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3102				
_?L3154:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L3105:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3112				
_?L3147:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L3113				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L3114				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3102				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3147				
_?L3112:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3122				
	jbra _?L3146				
_?L3135:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3122				
	jbra _?L3146				
_?L3145:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3102				
_?L3149:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L3119				
_?L3143:					
	lea _miniflac_sync_internal,a3		
_?L3120:					
	moveq #3,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3148				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3102				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3120				
_?L3111:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L3137				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L3100				
						
	cmp.b #1,468(a6)			
	jbne _?L3100				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L3122				
_?L3151:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L3122				
_?L3114:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3149				
	jbra _?L3102				
_?L3141:					
						
	tst.l 56(sp)				
	jbeq _?L3132				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L3092				
	cmp.b #102,d0				
	jbeq _?L3150				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3146:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L3122				
						
	cmp.b #1,468(a6)			
	jbne _?L3122				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L3122				
	jbra _?L3151				
_?L3150:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3095:					
	subq.l #4,d0				
	jbeq _?L3152				
_?L3097:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3096				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L3097				
_?L3152:					
	lea _miniflac_sync_internal,a3		
_?L3098:					
	moveq #3,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3153				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3096				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3098				
	moveq #-1,d0				
_?L3096:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L3155:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3142:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L3095				
_?L3148:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 178(a6)				
	jbsr _miniflac_seektable_read_samples	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3122				
	jbra _?L3146				
_?L3132:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3144:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3102				
	jbra _?L3154				
_?L3092:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L3130				
_?L3153:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 178(a6)				
	jbsr _miniflac_seektable_read_samples	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3155				
_?L3137:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L3089				
						
	.align	2				
	.globl	_miniflac_application_id	
						
_miniflac_application_id:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L3208				
						
	subq.l #1,d0				
	jbeq _?L3209				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L3197:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3167				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L3210				
_?L3186:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L3202				
	add.l d0,d0				
	move.w _?L3171(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L3171:					
	.dc.w _?L3175-_?L3171			
	.dc.w _?L3174-_?L3171			
	.dc.w _?L3173-_?L3171			
	.dc.w _?L3172-_?L3171			
	.dc.w _?L3202-_?L3171			
	.dc.w _?L3184-_?L3171			
_?L3174:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3179				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L3211				
						
	cmp.b #-1,d1				
	jbne _?L3178				
_?L3180:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L3184:					
						
	tst.l 210(a6)				
	jbeq _?L3212				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3184				
_?L3169:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L3213				
_?L3189:					
						
	tst.l d0				
	jbne _?L3167				
	cmp.l 56(sp),a1				
	jbcs _?L3197				
_?L3167:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L3156:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3175:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3169				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L3173:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3169				
_?L3221:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L3172:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3179				
_?L3214:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L3180				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L3181				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3169				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3214				
_?L3179:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3189				
	jbra _?L3213				
_?L3202:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3189				
	jbra _?L3213				
_?L3212:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3169				
_?L3216:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L3186				
_?L3210:					
	lea _miniflac_sync_internal,a3		
_?L3187:					
	moveq #2,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3215				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3169				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3187				
_?L3178:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L3204				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L3167				
						
	cmp.b #1,468(a6)			
	jbne _?L3167				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L3189				
_?L3218:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L3189				
_?L3181:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3216				
	jbra _?L3169				
_?L3208:					
						
	tst.l 56(sp)				
	jbeq _?L3199				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L3159				
	cmp.b #102,d0				
	jbeq _?L3217				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3213:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L3189				
						
	cmp.b #1,468(a6)			
	jbne _?L3189				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L3189				
	jbra _?L3218				
_?L3217:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3162:					
	subq.l #4,d0				
	jbeq _?L3219				
_?L3164:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3163				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L3164				
_?L3219:					
	lea _miniflac_sync_internal,a3		
_?L3165:					
	moveq #2,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3220				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3163				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3165				
	moveq #-1,d0				
_?L3163:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L3222:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3209:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L3162				
_?L3215:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 190(a6)				
	jbsr _miniflac_application_read_id	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3189				
	jbra _?L3213				
_?L3199:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3211:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3169				
	jbra _?L3221				
_?L3159:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L3197				
_?L3220:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 190(a6)				
	jbsr _miniflac_application_read_id	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3222				
_?L3204:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L3156				
						
	.align	2				
	.globl	_miniflac_application_length	
						
_miniflac_application_length:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L3275				
						
	subq.l #1,d0				
	jbeq _?L3276				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L3264:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3234				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L3277				
_?L3253:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L3269				
	add.l d0,d0				
	move.w _?L3238(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L3238:					
	.dc.w _?L3242-_?L3238			
	.dc.w _?L3241-_?L3238			
	.dc.w _?L3240-_?L3238			
	.dc.w _?L3239-_?L3238			
	.dc.w _?L3269-_?L3238			
	.dc.w _?L3251-_?L3238			
_?L3241:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3246				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L3278				
						
	cmp.b #-1,d1				
	jbne _?L3245				
_?L3247:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L3251:					
						
	tst.l 210(a6)				
	jbeq _?L3279				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3251				
_?L3236:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L3280				
_?L3256:					
						
	tst.l d0				
	jbne _?L3234				
	cmp.l 56(sp),a1				
	jbcs _?L3264				
_?L3234:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L3223:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3242:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3236				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L3240:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3236				
_?L3288:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L3239:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3246				
_?L3281:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L3247				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L3248				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3236				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3281				
_?L3246:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3256				
	jbra _?L3280				
_?L3269:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3256				
	jbra _?L3280				
_?L3279:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3236				
_?L3283:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L3253				
_?L3277:					
	lea _miniflac_sync_internal,a3		
_?L3254:					
	moveq #2,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3282				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3236				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3254				
_?L3245:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L3271				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L3234				
						
	cmp.b #1,468(a6)			
	jbne _?L3234				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L3256				
_?L3285:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L3256				
_?L3248:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3283				
	jbra _?L3236				
_?L3275:					
						
	tst.l 56(sp)				
	jbeq _?L3266				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L3226				
	cmp.b #102,d0				
	jbeq _?L3284				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3280:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L3256				
						
	cmp.b #1,468(a6)			
	jbne _?L3256				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L3256				
	jbra _?L3285				
_?L3284:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3229:					
	subq.l #4,d0				
	jbeq _?L3286				
_?L3231:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3230				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L3231				
_?L3286:					
	lea _miniflac_sync_internal,a3		
_?L3232:					
	moveq #2,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3287				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3230				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3232				
	moveq #-1,d0				
_?L3230:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L3289:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3276:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L3229				
_?L3282:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 190(a6)				
	jbsr _miniflac_application_read_length	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3256				
	jbra _?L3280				
_?L3266:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3278:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3236				
	jbra _?L3288				
_?L3226:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L3264				
_?L3287:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 190(a6)				
	jbsr _miniflac_application_read_length	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3289				
_?L3271:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L3223				
						
	.align	2				
	.globl	_miniflac_application_data	
						
_miniflac_application_data:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L3342				
						
	subq.l #1,d0				
	jbeq _?L3343				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L3331:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3301				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L3344				
_?L3320:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L3336				
	add.l d0,d0				
	move.w _?L3305(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L3305:					
	.dc.w _?L3309-_?L3305			
	.dc.w _?L3308-_?L3305			
	.dc.w _?L3307-_?L3305			
	.dc.w _?L3306-_?L3305			
	.dc.w _?L3336-_?L3305			
	.dc.w _?L3318-_?L3305			
_?L3308:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3313				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L3345				
						
	cmp.b #-1,d1				
	jbne _?L3312				
_?L3314:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L3318:					
						
	tst.l 210(a6)				
	jbeq _?L3346				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3318				
_?L3303:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L3347				
_?L3323:					
						
	tst.l d0				
	jbne _?L3301				
	cmp.l 56(sp),a1				
	jbcs _?L3331				
_?L3301:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L3290:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3309:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3303				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L3307:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3303				
_?L3355:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L3306:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3313				
_?L3348:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L3314				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L3315				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3303				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3348				
_?L3313:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3323				
	jbra _?L3347				
_?L3336:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3323				
	jbra _?L3347				
_?L3346:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3303				
_?L3350:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L3320				
_?L3344:					
	lea _miniflac_sync_internal,a3		
_?L3321:					
	moveq #2,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3349				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3303				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3321				
_?L3312:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L3338				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L3301				
						
	cmp.b #1,468(a6)			
	jbne _?L3301				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L3323				
_?L3352:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L3323				
_?L3315:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3350				
	jbra _?L3303				
_?L3342:					
						
	tst.l 56(sp)				
	jbeq _?L3333				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L3293				
	cmp.b #102,d0				
	jbeq _?L3351				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3347:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L3323				
						
	cmp.b #1,468(a6)			
	jbne _?L3323				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L3323				
	jbra _?L3352				
_?L3351:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3296:					
	subq.l #4,d0				
	jbeq _?L3353				
_?L3298:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3297				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L3298				
_?L3353:					
	lea _miniflac_sync_internal,a3		
_?L3299:					
	moveq #2,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3354				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3297				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3299				
	moveq #-1,d0				
_?L3297:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L3356:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3343:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L3296				
_?L3349:					
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 190(a6)				
	jbsr _miniflac_application_read_data	
	lea (20,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3323				
	jbra _?L3347				
_?L3333:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3345:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3303				
	jbra _?L3355				
_?L3293:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L3331				
_?L3354:					
						
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 190(a6)				
	jbsr _miniflac_application_read_data	
	lea (20,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3356				
_?L3338:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L3290				
						
	.align	2				
	.globl	_miniflac_padding_length	
						
_miniflac_padding_length:			
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L3409				
						
	subq.l #1,d0				
	jbeq _?L3410				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L3398:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3368				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L3411				
_?L3387:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L3403				
	add.l d0,d0				
	move.w _?L3372(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L3372:					
	.dc.w _?L3376-_?L3372			
	.dc.w _?L3375-_?L3372			
	.dc.w _?L3374-_?L3372			
	.dc.w _?L3373-_?L3372			
	.dc.w _?L3403-_?L3372			
	.dc.w _?L3385-_?L3372			
_?L3375:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3380				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L3412				
						
	cmp.b #-1,d1				
	jbne _?L3379				
_?L3381:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L3385:					
						
	tst.l 210(a6)				
	jbeq _?L3413				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3385				
_?L3370:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L3414				
_?L3390:					
						
	tst.l d0				
	jbne _?L3368				
	cmp.l 56(sp),a1				
	jbcs _?L3398				
_?L3368:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L3357:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3376:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3370				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L3374:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3370				
_?L3422:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L3373:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3380				
_?L3415:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L3381				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L3382				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3370				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3415				
_?L3380:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3390				
	jbra _?L3414				
_?L3403:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3390				
	jbra _?L3414				
_?L3413:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3370				
_?L3417:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L3387				
_?L3411:					
	lea _miniflac_sync_internal,a3		
_?L3388:					
	moveq #1,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3416				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3370				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3388				
_?L3379:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L3405				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L3368				
						
	cmp.b #1,468(a6)			
	jbne _?L3368				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L3390				
_?L3419:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L3390				
_?L3382:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3417				
	jbra _?L3370				
_?L3409:					
						
	tst.l 56(sp)				
	jbeq _?L3400				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L3360				
	cmp.b #102,d0				
	jbeq _?L3418				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3414:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L3390				
						
	cmp.b #1,468(a6)			
	jbne _?L3390				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L3390				
	jbra _?L3419				
_?L3418:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3363:					
	subq.l #4,d0				
	jbeq _?L3420				
_?L3365:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3364				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L3365				
_?L3420:					
	lea _miniflac_sync_internal,a3		
_?L3366:					
	moveq #1,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3421				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3364				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3366				
	moveq #-1,d0				
_?L3364:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L3423:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3410:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L3363				
_?L3416:					
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 202(a6)				
	jbsr _miniflac_padding_read_length	
	lea (12,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3390				
	jbra _?L3414				
_?L3400:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3412:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3370				
	jbra _?L3422				
_?L3360:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L3398				
_?L3421:					
						
	move.l 64(sp),-(sp)			
	move.l d3,-(sp)				
	pea 202(a6)				
	jbsr _miniflac_padding_read_length	
	lea (12,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3423				
_?L3405:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L3357				
						
	.align	2				
	.globl	_miniflac_padding_data		
						
_miniflac_padding_data:				
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 48(sp),a6			
						
	move.l 4(a6),d0				
	jbeq _?L3476				
						
	subq.l #1,d0				
	jbeq _?L3477				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
_?L3465:					
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	move.l 60(sp),-(sp)			
	move.l a6,-(sp)				
	move.l d5,a0				
	jbsr (a0)				
	lea (16,sp),sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3435				
	move.l 36(sp),28(a6)			
	move.l 40(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
						
	lea (122,a6),a3				
						
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbeq _?L3478				
_?L3454:					
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcs _?L3470				
	add.l d0,d0				
	move.w _?L3439(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L3439:					
	.dc.w _?L3443-_?L3439			
	.dc.w _?L3442-_?L3439			
	.dc.w _?L3441-_?L3439			
	.dc.w _?L3440-_?L3439			
	.dc.w _?L3470-_?L3439			
	.dc.w _?L3452-_?L3439			
_?L3442:					
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill		
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3447				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.b #102,d1				
	jbeq _?L3479				
						
	cmp.b #-1,d1				
	jbne _?L3446				
_?L3448:					
						
	moveq #5,d0				
	move.l d0,(a6)				
_?L3452:					
						
	tst.l 210(a6)				
	jbeq _?L3480				
						
	clr.l -(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3452				
_?L3437:					
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbeq _?L3481				
_?L3457:					
						
	tst.l d0				
	jbne _?L3435				
	cmp.l 56(sp),a1				
	jbcs _?L3465				
_?L3435:					
	move.l 52(a6),a1			
	move.l 60(sp),a0			
	move.l a1,(a0)				
_?L3424:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3443:					
						
	move.l d3,-(sp)				
	pea 92(a6)				
	jbsr _miniflac_oggheader_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3437				
						
	move.b #1,468(a6)			
						
	move.l 78(a6),464(a6)			
						
	moveq #2,d0				
	move.l d0,(a6)				
_?L3441:					
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3437				
_?L3489:					
						
	moveq #3,d0				
	move.l d0,(a6)				
_?L3440:					
	lea _miniflac_bitreader_fill,a5		
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L3447				
_?L3482:					
						
	pea 14.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_peek		
	addq.l #8,sp				
						
	cmp.w #16382,d1				
	jbeq _?L3448				
						
	moveq #4,d1				
	move.l d1,(a6)				
						
	lea (100,a6),a1				
						
	tst.l 100(a6)				
	jbeq _?L3449				
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_decode		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3437				
						
	moveq #3,d0				
	move.l d0,(a6)				
						
	pea 16.w				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L3482				
_?L3447:					
						
	clr.l d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3457				
	jbra _?L3481				
_?L3470:					
						
	moveq #-1,d0				
						
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3457				
	jbra _?L3481				
_?L3480:					
						
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr _miniflac_frame_sync		
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3437				
_?L3484:					
	move.l (a6),d0				
	moveq #4,d1				
	cmp.l d0,d1				
	jbne _?L3454				
_?L3478:					
	lea _miniflac_sync_internal,a3		
_?L3455:					
	moveq #1,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3483				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3437				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3455				
_?L3446:					
	move.l 20(a6),d0			
						
	move.l d0,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d0				
	move.w d0,90(a6)			
						
	cmp.w 88(a6),d0				
	jbne _?L3472				
						
	clr.l 36(a6)				
						
	moveq #-1,d0				
						
	btst #2,69(a6)				
	jbeq _?L3435				
						
	cmp.b #1,468(a6)			
	jbne _?L3435				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L3457				
_?L3486:					
						
	clr.b 468(a6)				
						
	clr.l 464(a6)				
	jbra _?L3457				
_?L3449:					
						
	move.l d3,-(sp)				
	move.l a1,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L3484				
	jbra _?L3437				
_?L3476:					
						
	tst.l 56(sp)				
	jbeq _?L3467				
	move.l 52(sp),a0			
	move.b (a0),d0				
						
	cmp.b #79,d0				
	jbeq _?L3427				
	cmp.b #102,d0				
	jbeq _?L3485				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3481:					
						
	clr.l 36(a6)				
						
	btst #2,69(a6)				
	jbeq _?L3457				
						
	cmp.b #1,468(a6)			
	jbne _?L3457				
						
	move.l 464(a6),a0			
	cmp.l 78(a6),a0				
	jbne _?L3457				
	jbra _?L3486				
_?L3485:					
						
	moveq #1,d0				
	move.l d0,4(a6)				
						
	moveq #2,d1				
	move.l d1,(a6)				
	moveq #2,d0				
						
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
_?L3430:					
	subq.l #4,d0				
	jbeq _?L3487				
_?L3432:					
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3431				
	move.l (a6),d0				
	subq.l #4,d0				
	jbne _?L3432				
_?L3487:					
	lea _miniflac_sync_internal,a3		
_?L3433:					
	moveq #1,d1				
	cmp.l 114(a6),d1			
	jbeq _?L3488				
	move.l d3,-(sp)				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3431				
	moveq #4,d0				
	cmp.l (a6),d0				
	jbeq _?L3433				
	moveq #-1,d0				
_?L3431:					
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
_?L3490:					
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3477:					
	move.l (a6),d0				
	move.l 52(sp),28(a6)			
	move.l 56(sp),24(a6)			
	clr.l 20(a6)				
	move.l a6,d3				
	addq.l #8,d3				
	lea _miniflac_sync_internal,a3		
	jbra _?L3430				
_?L3483:					
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 202(a6)				
	jbsr _miniflac_padding_read_data	
	lea (20,sp),sp				
	move.l 20(a6),d1			
						
	move.l d1,a1				
	add.l 52(a6),a1				
	move.l a1,52(a6)			
						
	add.w 90(a6),d1				
	move.w d1,90(a6)			
						
	cmp.w 88(a6),d1				
	jbne _?L3457				
	jbra _?L3481				
_?L3467:					
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L3479:					
						
	moveq #2,d1				
	move.l d1,(a6)				
						
	move.l d3,-(sp)				
	pea 96(a6)				
	jbsr _miniflac_streammarker_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3437				
	jbra _?L3489				
_?L3427:					
						
	moveq #2,d0				
	move.l d0,4(a6)				
						
	clr.l (a6)				
						
	clr.l 36(sp)				
	clr.l 40(sp)				
	move.l 52(sp),60(a6)			
	move.l 56(sp),56(a6)			
	clr.l 52(a6)				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l sp,d6				
	move.l #_miniflac_oggfunction_start,d5	
						
	move.l a6,d4				
	add.l #210,d4				
						
	lea _miniflac_frame_decode,a4		
	jbra _?L3465				
_?L3488:					
						
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l 72(sp),-(sp)			
	move.l d3,-(sp)				
	pea 202(a6)				
	jbsr _miniflac_padding_read_data	
	lea (20,sp),sp				
	move.l 60(sp),a0			
	move.l 20(a6),(a0)			
	jbra _?L3490				
_?L3472:					
						
	moveq #-1,d0				
						
	move.l 60(sp),a0			
	move.l a1,(a0)				
	jbra _?L3424				
						
						
