* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"unpack.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_unpack_uint32le	
						
_miniflac_unpack_uint32le:			
	move.l 4(sp),a0				
	clr.l d0				
	move.b (a0),d0				
	moveq #24,d1				
	lsl.l d1,d0				
	clr.l d1				
	move.b 1(a0),d1				
	swap d1					
	clr.w d1				
	or.l d0,d1				
	clr.l d0				
	move.b 2(a0),d0				
	lsl.l #8,d0				
	or.l d1,d0				
	or.b 3(a0),d0				
	ror.w #8,d0				
	swap d0					
	ror.w #8,d0				
						
	rts					
						
	.align	2				
	.globl	_miniflac_unpack_int32le	
						
_miniflac_unpack_int32le:			
	move.l 4(sp),a0				
	clr.l d0				
	move.b (a0),d0				
	moveq #24,d1				
	lsl.l d1,d0				
	clr.l d1				
	move.b 1(a0),d1				
	swap d1					
	clr.w d1				
	or.l d0,d1				
	clr.l d0				
	move.b 2(a0),d0				
	lsl.l #8,d0				
	or.l d1,d0				
	or.b 3(a0),d0				
	ror.w #8,d0				
	swap d0					
	ror.w #8,d0				
						
	rts					
						
	.align	2				
	.globl	_miniflac_unpack_uint64le	
						
_miniflac_unpack_uint64le:			
	move.l 4(sp),a0				
	clr.l d0				
	move.b 4(a0),d0				
	moveq #24,d1				
	lsl.l d1,d0				
	clr.l d1				
	move.b 5(a0),d1				
	swap d1					
	clr.w d1				
	or.l d0,d1				
	clr.l d0				
	move.b 6(a0),d0				
	lsl.l #8,d0				
	or.l d1,d0				
	clr.l d1				
	move.b (a0),d1				
	moveq #24,d2				
	lsl.l d2,d1				
	clr.l d2				
	move.b 1(a0),d2				
	swap d2					
	clr.w d2				
	or.l d1,d2				
	clr.l d1				
	move.b 2(a0),d1				
	lsl.l #8,d1				
	or.l d2,d1				
	or.b 3(a0),d1				
	ror.w #8,d1				
	swap d1					
	ror.w #8,d1				
	or.b 7(a0),d0				
	ror.w #8,d0				
	swap d0					
	ror.w #8,d0				
						
	rts					
						
	.align	2				
	.globl	_miniflac_unpack_int64le	
						
_miniflac_unpack_int64le:			
	move.l 4(sp),a0				
	clr.l d0				
	move.b 4(a0),d0				
	moveq #24,d1				
	lsl.l d1,d0				
	clr.l d1				
	move.b 5(a0),d1				
	swap d1					
	clr.w d1				
	or.l d0,d1				
	clr.l d0				
	move.b 6(a0),d0				
	lsl.l #8,d0				
	or.l d1,d0				
	clr.l d1				
	move.b (a0),d1				
	moveq #24,d2				
	lsl.l d2,d1				
	clr.l d2				
	move.b 1(a0),d2				
	swap d2					
	clr.w d2				
	or.l d1,d2				
	clr.l d1				
	move.b 2(a0),d1				
	lsl.l #8,d1				
	or.l d2,d1				
	or.b 3(a0),d1				
	ror.w #8,d1				
	swap d1					
	ror.w #8,d1				
	or.b 7(a0),d0				
	ror.w #8,d0				
	swap d0					
	ror.w #8,d0				
						
	rts					
						
						
