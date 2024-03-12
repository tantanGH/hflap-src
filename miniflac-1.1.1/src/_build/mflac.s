* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"mflac.c"			
						
						
						
						
						
	.text					
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
						
	move.l 12(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_init			
	addq.l #8,sp				
						
	move.l 16(sp),470(a3)			
						
	move.l 20(sp),474(a3)			
						
	clr.l 478(a3)				
						
	clr.l 482(a3)				
						
	move.l (sp)+,a3				
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
	jbne _?L16				
_?L8:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d3,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L5				
						
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
	jbeq _?L8				
_?L16:						
						
	tst.l d0				
	jble _?L5				
						
	move.l 12(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L5:						
						
	movem.l (sp)+,d3/a3/a4			
	addq.l #4,sp				
	rts					
						
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
	jbne _?L28				
_?L20:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L17				
						
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
	jbeq _?L20				
_?L28:						
						
	tst.l d0				
	jble _?L17				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L17:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L40				
_?L32:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L29				
						
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
	jbeq _?L32				
_?L40:						
						
	tst.l d0				
	jble _?L29				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L29:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L52				
_?L44:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L41				
						
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
	jbeq _?L44				
_?L52:						
						
	tst.l d0				
	jble _?L41				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L41:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L64				
_?L56:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L53				
						
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
	jbeq _?L56				
_?L64:						
						
	tst.l d0				
	jble _?L53				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L53:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L76				
_?L68:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L65				
						
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
	jbeq _?L68				
_?L76:						
						
	tst.l d0				
	jble _?L65				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L65:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L88				
_?L80:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L77				
						
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
	jbeq _?L80				
_?L88:						
						
	tst.l d0				
	jble _?L77				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L77:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L100				
_?L92:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L89				
						
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
	jbeq _?L92				
_?L100:						
						
	tst.l d0				
	jble _?L89				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L89:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L112				
_?L104:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L101				
						
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
	jbeq _?L104				
_?L112:						
						
	tst.l d0				
	jble _?L101				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L101:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L124				
_?L116:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L113				
						
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
	jbeq _?L116				
_?L124:						
						
	tst.l d0				
	jble _?L113				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L113:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L136				
_?L128:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L125				
						
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
	jbeq _?L128				
_?L136:						
						
	tst.l d0				
	jble _?L125				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L125:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L148				
_?L140:						
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L137				
						
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
	jbeq _?L140				
_?L148:						
						
	tst.l d0				
	jble _?L137				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L137:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
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
	jbne _?L160				
_?L152:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L149				
						
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
	jbeq _?L152				
_?L160:						
						
	tst.l d0				
	jble _?L149				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L149:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L172				
_?L164:						
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L161				
						
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
	jbeq _?L164				
_?L172:						
						
	tst.l d0				
	jble _?L161				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L161:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
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
	jbne _?L184				
_?L176:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L173				
						
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
	jbeq _?L176				
_?L184:						
						
	tst.l d0				
	jble _?L173				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L173:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L196				
_?L188:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L185				
						
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
	jbeq _?L188				
_?L196:						
						
	tst.l d0				
	jble _?L185				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L185:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L208				
_?L200:						
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L197				
						
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
	jbeq _?L200				
_?L208:						
						
	tst.l d0				
	jble _?L197				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L197:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
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
	jbne _?L220				
_?L212:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L209				
						
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
	jbeq _?L212				
_?L220:						
						
	tst.l d0				
	jble _?L209				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L209:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L232				
_?L224:						
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L221				
						
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
	jbeq _?L224				
_?L232:						
						
	tst.l d0				
	jble _?L221				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L221:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
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
	jbne _?L244				
_?L236:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L233				
						
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
	jbeq _?L236				
_?L244:						
						
	tst.l d0				
	jble _?L233				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L233:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L256				
_?L248:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L245				
						
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
	jbeq _?L248				
_?L256:						
						
	tst.l d0				
	jble _?L245				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L245:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L268				
_?L260:						
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L257				
						
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
	jbeq _?L260				
_?L268:						
						
	tst.l d0				
	jble _?L257				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L257:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
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
	jbne _?L280				
_?L272:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L269				
						
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
	jbeq _?L272				
_?L280:						
						
	tst.l d0				
	jble _?L269				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L269:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L292				
_?L284:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L281				
						
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
	jbeq _?L284				
_?L292:						
						
	tst.l d0				
	jble _?L281				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L281:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L304				
_?L296:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L293				
						
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
	jbeq _?L296				
_?L304:						
						
	tst.l d0				
	jble _?L293				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L293:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L316				
_?L308:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L305				
						
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
	jbeq _?L308				
_?L316:						
						
	tst.l d0				
	jble _?L305				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L305:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L328				
_?L320:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L317				
						
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
	jbeq _?L320				
_?L328:						
						
	tst.l d0				
	jble _?L317				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L317:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L340				
_?L332:						
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L329				
						
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
	jbeq _?L332				
_?L340:						
						
	tst.l d0				
	jble _?L329				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L329:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
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
	jbne _?L352				
_?L344:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L341				
						
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
	jbeq _?L344				
_?L352:						
						
	tst.l d0				
	jble _?L341				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L341:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L364				
_?L356:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L353				
						
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
	jbeq _?L356				
_?L364:						
						
	tst.l d0				
	jble _?L353				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L353:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L376				
_?L368:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L365				
						
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
	jbeq _?L368				
_?L376:						
						
	tst.l d0				
	jble _?L365				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L365:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L388				
_?L380:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L377				
						
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
	jbeq _?L380				
_?L388:						
						
	tst.l d0				
	jble _?L377				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L377:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L400				
_?L392:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L389				
						
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
	jbeq _?L392				
_?L400:						
						
	tst.l d0				
	jble _?L389				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L389:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L412				
_?L404:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L401				
						
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
	jbeq _?L404				
_?L412:						
						
	tst.l d0				
	jble _?L401				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L401:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L424				
_?L416:						
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L413				
						
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
	jbeq _?L416				
_?L424:						
						
	tst.l d0				
	jble _?L413				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L413:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
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
	jbne _?L436				
_?L428:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L425				
						
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
	jbeq _?L428				
_?L436:						
						
	tst.l d0				
	jble _?L425				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L425:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L448				
_?L440:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L437				
						
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
	jbeq _?L440				
_?L448:						
						
	tst.l d0				
	jble _?L437				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L437:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L460				
_?L452:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L449				
						
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
	jbeq _?L452				
_?L460:						
						
	tst.l d0				
	jble _?L449				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L449:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L472				
_?L464:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L461				
						
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
	jbeq _?L464				
_?L472:						
						
	tst.l d0				
	jble _?L461				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L461:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L484				
_?L476:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L473				
						
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
	jbeq _?L476				
_?L484:						
						
	tst.l d0				
	jble _?L473				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L473:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L496				
_?L488:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L485				
						
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
	jbeq _?L488				
_?L496:						
						
	tst.l d0				
	jble _?L485				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L485:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L508				
_?L500:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L497				
						
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
	jbeq _?L500				
_?L508:						
						
	tst.l d0				
	jble _?L497				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L497:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L520				
_?L512:						
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L509				
						
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
	jbeq _?L512				
_?L520:						
						
	tst.l d0				
	jble _?L509				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L509:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
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
	jbne _?L532				
_?L524:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L521				
						
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
	jbeq _?L524				
_?L532:						
						
	tst.l d0				
	jble _?L521				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L521:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L544				
_?L536:						
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L533				
						
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
	jbeq _?L536				
_?L544:						
						
	tst.l d0				
	jble _?L533				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L533:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
	rts					
						
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
	jbne _?L556				
_?L548:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L545				
						
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
	jbeq _?L548				
_?L556:						
						
	tst.l d0				
	jble _?L545				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L545:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L568				
_?L560:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L557				
						
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
	jbeq _?L560				
_?L568:						
						
	tst.l d0				
	jble _?L557				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L557:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L580				
_?L572:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L569				
						
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
	jbeq _?L572				
_?L580:						
						
	tst.l d0				
	jble _?L569				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L569:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L592				
_?L584:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L581				
						
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
	jbeq _?L584				
_?L592:						
						
	tst.l d0				
	jble _?L581				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L581:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L604				
_?L596:						
						
	move.l 474(a3),-(sp)			
	pea 16384.w				
	move.l d5,-(sp)				
	move.l 470(a3),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L593				
						
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
	jbeq _?L596				
_?L604:						
						
	tst.l d0				
	jble _?L593				
						
	move.l 20(sp),d1			
	add.l d1,478(a3)			
	sub.l d1,482(a3)			
_?L593:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4		
	addq.l #4,sp				
	rts					
						
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
	jbne _?L616				
_?L608:						
						
	move.l 474(a4),-(sp)			
	pea 16384.w				
	move.l d7,-(sp)				
	move.l 470(a4),a0			
	jbsr (a0)				
	lea (12,sp),sp				
	tst.l d0				
	jbeq _?L605				
						
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
	jbeq _?L608				
_?L616:						
						
	tst.l d0				
	jble _?L605				
						
	move.l 28(sp),d1			
	add.l d1,478(a4)			
	sub.l d1,482(a4)			
_?L605:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4	
	addq.l #4,sp				
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
						
						
	jbra _miniflac_version_major		
						
	.align	2				
	.globl	_mflac_version_minor		
						
_mflac_version_minor:				
						
						
	jbra _miniflac_version_minor		
						
	.align	2				
	.globl	_mflac_version_patch		
						
_mflac_version_patch:				
						
						
	jbra _miniflac_version_patch		
						
	.align	2				
	.globl	_mflac_version_string		
						
_mflac_version_string:				
						
						
	jbra _miniflac_version_string		
						
						
