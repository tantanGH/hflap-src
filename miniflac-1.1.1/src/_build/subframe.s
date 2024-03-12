* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"subframe.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_subframe_init		
						
_miniflac_subframe_init:			
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	clr.b 4(a3)				
						
	clr.l (a3)				
						
	pea 6(a3)				
	jbsr _miniflac_subframe_header_init	
	addq.l #4,sp				
						
	pea 18(a3)				
	jbsr _miniflac_subframe_constant_init	
	addq.l #4,sp				
						
	pea 22(a3)				
	jbsr _miniflac_subframe_verbatim_init	
	addq.l #4,sp				
						
	pea 30(a3)				
	jbsr _miniflac_subframe_fixed_init	
	addq.l #4,sp				
						
	pea 38(a3)				
	jbsr _miniflac_subframe_lpc_init	
	addq.l #4,sp				
						
	lea (178,a3),a3				
	move.l a3,8(sp)				
						
	move.l (sp)+,a3				
						
	jbra _miniflac_residual_init		
						
	.align	2				
	.globl	_miniflac_subframe_decode	
						
_miniflac_subframe_decode:			
	movem.l d3/d4/d5/a3/a4/a5/a6,-(sp)	
	move.l 32(sp),a3			
	move.l 40(sp),d3			
	move.l 48(sp),d4			
						
	moveq #4,d0				
	cmp.l (a3),d0				
	jbcs _?L4				
	move.l (a3),d0				
	add.l d0,d0				
	move.w _?L6(pc,d0.l),d0			
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L6:						
	.dc.w _?L10-_?L6			
	.dc.w _?L9-_?L6				
	.dc.w _?L8-_?L6				
	.dc.w _?L7-_?L6				
	.dc.w _?L5-_?L6				
_?L7:						
						
	lea (30,a3),a6				
						
	move.l a3,d4				
	add.l #178,d4				
_?L20:						
						
	clr.l d0				
	move.b 14(a3),d0			
	move.l d0,-(sp)				
	move.l d4,-(sp)				
	move.b 4(a3),d0				
	move.l d0,-(sp)				
	move.l 56(sp),-(sp)			
	move.l d3,-(sp)				
	move.l 56(sp),-(sp)			
	move.l a6,-(sp)				
	jbsr _miniflac_subframe_fixed_decode	
	lea (28,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3				
						
	lea (18,a3),a4				
						
	lea (22,a3),a5				
						
	moveq #38,d5				
	add.l a3,d5				
_?L11:						
						
	tst.l d3				
	jbeq _?L23				
						
	move.b 15(a3),d2			
						
	jbeq _?L23				
						
	tst.l 44(sp)				
	jbeq _?L23				
						
	and.l #255,d2				
	move.l d3,a0				
	move.l 44(sp),d1			
	lsl.l #2,d1				
	add.l d3,d1				
_?L24:						
						
	move.l (a0),d0				
						
	lsl.l d2,d0				
	move.l d0,(a0)+				
						
	cmp.l d1,a0				
	jbne _?L24				
_?L23:						
						
	clr.b 4(a3)				
						
	clr.l (a3)				
						
	pea 6(a3)				
	jbsr _miniflac_subframe_header_init	
						
	move.l a4,(sp)				
	jbsr _miniflac_subframe_constant_init	
						
	move.l a5,(sp)				
	jbsr _miniflac_subframe_verbatim_init	
						
	move.l a6,(sp)				
	jbsr _miniflac_subframe_fixed_init	
						
	move.l d5,(sp)				
	jbsr _miniflac_subframe_lpc_init	
						
	move.l d4,(sp)				
	jbsr _miniflac_residual_init		
	addq.l #4,sp				
						
	moveq #1,d0				
_?L3:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4/a5/a6	
	rts					
_?L5:						
						
	move.l a3,d4				
	add.l #178,d4				
						
	moveq #38,d5				
	add.l a3,d5				
_?L21:						
						
	clr.l d0				
	move.b 14(a3),d0			
	move.l d0,-(sp)				
	move.l d4,-(sp)				
	move.b 4(a3),d0				
	move.l d0,-(sp)				
	move.l 56(sp),-(sp)			
	move.l d3,-(sp)				
	move.l 56(sp),-(sp)			
	move.l d5,-(sp)				
	jbsr _miniflac_subframe_lpc_decode	
	lea (28,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3				
						
	lea (18,a3),a4				
						
	lea (22,a3),a5				
						
	lea (30,a3),a6				
	jbra _?L11				
_?L9:						
						
	lea (18,a3),a4				
_?L18:						
						
	clr.l d0				
	move.b 4(a3),d0				
	move.l d0,-(sp)				
	move.l 48(sp),-(sp)			
	move.l d3,-(sp)				
	move.l 48(sp),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_subframe_constant_decode	
	lea (20,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3				
_?L32:						
						
	lea (22,a3),a5				
_?L33:						
						
	lea (30,a3),a6				
						
	move.l a3,d4				
	add.l #178,d4				
						
	moveq #38,d5				
	add.l a3,d5				
	jbra _?L11				
_?L10:						
						
	move.l 36(sp),-(sp)			
	pea 6(a3)				
	jbsr _miniflac_subframe_header_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3				
						
	sub.b 15(a3),d4				
	move.b d4,4(a3)				
						
	move.l 10(a3),d0			
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbeq _?L13				
	jbcs _?L14				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L15				
	subq.l #2,d0				
	jbne _?L34				
						
	move.l a3,d4				
	add.l #178,d4				
						
	move.l d4,-(sp)				
	jbsr _miniflac_residual_init		
						
	lea (30,a3),a6				
						
	move.l a6,(sp)				
	jbsr _miniflac_subframe_fixed_init	
	addq.l #4,sp				
						
	moveq #3,d0				
	move.l d0,(a3)				
						
	jbra _?L20				
_?L8:						
						
	lea (22,a3),a5				
_?L19:						
						
	clr.l d0				
	move.b 4(a3),d0				
	move.l d0,-(sp)				
	move.l 48(sp),-(sp)			
	move.l d3,-(sp)				
	move.l 48(sp),-(sp)			
	move.l a5,-(sp)				
	jbsr _miniflac_subframe_verbatim_decode	
	lea (20,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3				
						
	lea (18,a3),a4				
						
	lea (30,a3),a6				
						
	move.l a3,d4				
	add.l #178,d4				
						
	moveq #38,d5				
	add.l a3,d5				
	jbra _?L11				
_?L4:						
						
	lea (18,a3),a4				
						
	lea (22,a3),a5				
	jbra _?L33				
_?L14:						
						
	subq.l #4,d0				
	jbne _?L34				
						
	lea (22,a3),a5				
						
	move.l a5,-(sp)				
	jbsr _miniflac_subframe_verbatim_init	
	addq.l #4,sp				
						
	moveq #2,d1				
	move.l d1,(a3)				
						
	jbra _?L19				
_?L34:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/d5/a3/a4/a5/a6	
	rts					
_?L15:						
						
	lea (18,a3),a4				
						
	move.l a4,-(sp)				
	jbsr _miniflac_subframe_constant_init	
	addq.l #4,sp				
						
	moveq #1,d0				
	move.l d0,(a3)				
						
	clr.l d0				
	move.b 4(a3),d0				
	move.l d0,-(sp)				
	move.l 48(sp),-(sp)			
	move.l d3,-(sp)				
	move.l 48(sp),-(sp)			
	move.l a4,-(sp)				
	jbsr _miniflac_subframe_constant_decode	
	lea (20,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3				
	jbra _?L32				
_?L13:						
						
	move.l a3,d4				
	add.l #178,d4				
						
	move.l d4,-(sp)				
	jbsr _miniflac_residual_init		
						
	moveq #38,d5				
	add.l a3,d5				
						
	move.l d5,(sp)				
	jbsr _miniflac_subframe_lpc_init	
	addq.l #4,sp				
						
	moveq #4,d1				
	move.l d1,(a3)				
						
	jbra _?L21				
						
						
