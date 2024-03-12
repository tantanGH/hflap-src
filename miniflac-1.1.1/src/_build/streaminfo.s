* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"streaminfo.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_streaminfo_init	
						
_miniflac_streaminfo_init:			
	move.l 4(sp),a0				
						
	clr.l (a0)				
						
	clr.b 4(a0)				
						
	clr.l 6(a0)				
						
	clr.b 10(a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_read_min_block_size
						
_miniflac_streaminfo_read_min_block_size:	
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	tst.l (a3)				
	jbeq _?L13				
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L13:						
						
	pea 16.w				
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L14				
						
	clr.l d0				
						
	move.l (sp)+,a3				
	rts					
_?L14:						
						
	pea 16.w				
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 16(sp)				
	jbeq _?L5				
						
	move.l 16(sp),a0			
	move.w d1,(a0)				
_?L5:						
						
	moveq #1,d0				
	move.l d0,(a3)				
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_read_max_block_size
						
_miniflac_streaminfo_read_max_block_size:	
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	jbeq _?L16				
	subq.l #1,d0				
	jbne _?L27				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L30				
_?L20:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L27:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L30:						
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 20(sp)				
	jbeq _?L21				
						
	move.l 20(sp),a0			
	move.w d1,(a0)				
_?L21:						
						
	moveq #2,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L16:						
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L20				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,(a3)				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L20				
	jbra _?L30				
						
	.align	2				
	.globl	_miniflac_streaminfo_read_min_frame_size
						
_miniflac_streaminfo_read_min_frame_size:	
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcc _?L32				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #2,d0				
	jbne _?L50				
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L51				
_?L37:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L50:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L51:						
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 20(sp)				
	jbeq _?L38				
						
	move.l 20(sp),a0			
	move.l d1,(a0)				
_?L38:						
						
	moveq #3,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L32:						
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbeq _?L35				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L37				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,(a3)				
_?L35:						
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L37				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,(a3)				
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L37				
	jbra _?L51				
						
	.align	2				
	.globl	_miniflac_streaminfo_read_max_frame_size
						
_miniflac_streaminfo_read_max_frame_size:	
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbcc _?L53				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #3,d0				
	jbne _?L75				
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L76				
_?L59:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L75:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L76:						
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 20(sp)				
	jbeq _?L60				
						
	move.l 20(sp),a0			
	move.l d1,(a0)				
_?L60:						
						
	moveq #4,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L53:						
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbne _?L77				
_?L56:						
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L59				
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #3,d0				
	move.l d0,(a3)				
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L59				
	jbra _?L76				
_?L77:						
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbeq _?L57				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L59				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,(a3)				
_?L57:						
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L59				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,(a3)				
	jbra _?L56				
						
	.align	2				
	.globl	_miniflac_streaminfo_read_sample_rate
						
_miniflac_streaminfo_read_sample_rate:		
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbcc _?L79				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #4,d0				
	jbne _?L105				
						
	pea 20.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L106				
_?L86:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L105:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L106:						
						
	pea 20.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,6(a3)				
						
	tst.l 20(sp)				
	jbeq _?L87				
						
	move.l 20(sp),a0			
	move.l d1,(a0)				
_?L87:						
						
	moveq #5,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L79:						
						
	moveq #3,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbne _?L107				
_?L82:						
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L86				
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #4,d1				
	move.l d1,(a3)				
						
	pea 20.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L86				
	jbra _?L106				
_?L107:						
						
	moveq #2,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbeq _?L83				
						
	subq.l #1,d0				
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbeq _?L84				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L86				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,(a3)				
_?L84:						
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L86				
						
	pea 16.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #2,d1				
	move.l d1,(a3)				
_?L83:						
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L86				
						
	pea 24.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #3,d0				
	move.l d0,(a3)				
	jbra _?L82				
						
	.align	2				
	.globl	_miniflac_streaminfo_read_channels
						
_miniflac_streaminfo_read_channels:		
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbcc _?L109				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #5,d0				
	jbne _?L127				
						
	pea 3.w					
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L128				
_?L113:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L127:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L128:						
						
	pea 3.w					
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 20(sp)				
	jbeq _?L116				
						
	addq.b #1,d1				
	move.l 20(sp),a0			
	move.b d1,(a0)				
_?L116:						
						
	moveq #6,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L109:						
						
	subq.l #4,d0				
	jbne _?L112				
_?L115:						
						
	pea 20.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L113				
						
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
	jbne _?L113				
	jbra _?L128				
_?L112:						
						
	clr.l -(sp)				
	move.l 20(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L115				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_read_bps	
						
_miniflac_streaminfo_read_bps:			
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcc _?L130				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #6,d0				
	jbne _?L152				
						
	pea 5.w					
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L153				
_?L135:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L152:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L153:						
						
	pea 5.w					
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
						
	move.b d1,10(a3)			
						
	tst.l 20(sp)				
	jbeq _?L138				
						
	move.l 20(sp),a0			
	move.b d1,(a0)				
_?L138:						
						
	moveq #7,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L130:						
						
	moveq #5,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbne _?L154				
_?L133:						
						
	pea 3.w					
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L135				
						
	pea 3.w					
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d1				
	move.l d1,(a3)				
						
	pea 5.w					
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L135				
	jbra _?L153				
_?L154:						
						
	subq.l #4,d0				
	jbne _?L134				
_?L137:						
						
	pea 20.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L135				
						
	pea 20.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,6(a3)				
						
	moveq #5,d0				
	move.l d0,(a3)				
	jbra _?L133				
_?L134:						
						
	clr.l -(sp)				
	move.l 20(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_streaminfo_read_max_frame_size
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L137				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_read_total_samples
						
_miniflac_streaminfo_read_total_samples:	
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcc _?L156				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #7,d0				
	jbne _?L174				
						
	pea 36.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L175				
_?L160:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L174:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L175:						
						
	pea 36.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 20(sp)				
	jbeq _?L163				
						
	move.l 20(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L163:						
						
	moveq #8,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L156:						
						
	subq.l #6,d0				
	jbne _?L159				
_?L162:						
						
	pea 5.w					
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L160				
						
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
	jbne _?L160				
	jbra _?L175				
_?L159:						
						
	clr.l -(sp)				
	move.l 20(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_streaminfo_read_channels	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L162				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
						
	.align	2				
	.globl	_miniflac_streaminfo_read_md5_length
						
_miniflac_streaminfo_read_md5_length:		
	movem.l a3/a4/a5,-(sp)			
	move.l 16(sp),a4			
	move.l 24(sp),a3			
						
	move.l (a4),d0				
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcc _?L193				
_?L177:						
						
	tst.l a3				
	jbeq _?L185				
						
	moveq #16,d0				
	move.l d0,(a3)				
_?L185:						
						
	moveq #1,d0				
						
	movem.l (sp)+,a3/a4/a5			
	rts					
_?L193:						
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	cmp.l d0,d1				
	jbne _?L194				
_?L178:						
						
	pea 36.w				
	move.l 24(sp),-(sp)			
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L180				
						
	pea 36.w				
	move.l 24(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #8,d1				
	move.l d1,(a4)				
	jbra _?L177				
_?L194:						
						
	subq.l #6,d0				
	jbne _?L179				
_?L183:						
						
	pea 5.w					
	move.l 24(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L195				
_?L180:						
						
	clr.l d0				
						
	movem.l (sp)+,a3/a4/a5			
	rts					
_?L179:						
						
	clr.l -(sp)				
	move.l 24(sp),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_streaminfo_read_channels	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L183				
						
	movem.l (sp)+,a3/a4/a5			
	rts					
_?L195:						
						
	pea 5.w					
	move.l 24(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.b #1,d1				
	move.b d1,10(a4)			
						
	moveq #7,d0				
	move.l d0,(a4)				
	jbra _?L178				
						
	.align	2				
	.globl	_miniflac_streaminfo_read_md5_data
						
_miniflac_streaminfo_read_md5_data:		
	movem.l d3/d4/a3/a4/a5/a6,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d3			
	move.l 36(sp),a4			
	move.l 40(sp),d4			
						
	move.l (a3),d0				
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcc _?L197				
	subq.l #8,d0				
	jbne _?L223				
_?L198:						
						
	move.b 4(a3),d0				
						
	cmp.b #16,d0				
	jbeq _?L212				
						
	cmp.b #15,d0				
	jbhi _?L209				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_read,a6		
	tst.l a4				
	jbeq _?L224				
_?L202:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L203				
_?L206:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.b 4(a3),d0				
	clr.l d2				
	move.b d0,d2				
						
	cmp.l d2,d4				
	jbls _?L207				
						
	move.b d1,(a4,d2.l)			
						
	move.b 4(a3),d0				
	addq.b #1,d0				
	move.b d0,4(a3)				
						
	cmp.b #15,d0				
	jbls _?L202				
_?L209:						
						
	tst.l 44(sp)				
	jbeq _?L211				
_?L201:						
						
	moveq #16,d0				
	cmp.l d4,d0				
	jbcc _?L210				
	moveq #16,d4				
_?L210:						
						
	move.l 44(sp),a0			
	move.l d4,(a0)				
_?L211:						
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L223:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L207:						
						
	addq.b #1,d0				
	move.b d0,4(a3)				
						
	cmp.b #15,d0				
	jbhi _?L209				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L206				
_?L203:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L197:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_streaminfo_read_total_samples
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L198				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L224:						
						
	move.l a6,a4				
_?L204:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L203				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.b 4(a3),d0				
	addq.b #1,d0				
	move.b d0,4(a3)				
						
	cmp.b #15,d0				
	jbls _?L204				
						
	tst.l 44(sp)				
	jbne _?L201				
	jbra _?L211				
_?L212:						
						
	moveq #2,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
						
						
