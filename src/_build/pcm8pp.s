* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"pcm8pp.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_pcm8pp_play			
						
_pcm8pp_play:					
	move.l d3,-(sp)				
						
	move.w 10(sp),d0			
	ext.l d0				
						
	move.l 12(sp),d1			
						
	move.l 16(sp),d2			
						
	move.l 20(sp),d3			
						
	move.l 24(sp),a1			
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	move.l (sp)+,d3				
	rts					
						
	.align	2				
	.globl	_pcm8pp_play_array_chain	
						
_pcm8pp_play_array_chain:			
	move.l d3,-(sp)				
						
	move.w 10(sp),a0			
	moveq #16,d0				
	add.l a0,d0				
						
	move.l 12(sp),d1			
						
	move.l 16(sp),d2			
						
	move.l 20(sp),d3			
						
	move.l 24(sp),a1			
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	move.l (sp)+,d3				
	rts					
						
	.align	2				
	.globl	_pcm8pp_play_linked_array_chain	
						
_pcm8pp_play_linked_array_chain:		
	move.l d3,-(sp)				
						
	move.w 10(sp),a0			
	moveq #32,d0				
	add.l a0,d0				
						
	move.l 12(sp),d1			
						
	move.l 16(sp),d2			
						
	move.l 20(sp),d3			
						
	move.l 24(sp),a1			
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	move.l (sp)+,d3				
	rts					
						
	.align	2				
	.globl	_pcm8pp_play_ex_linked_array_chain
						
_pcm8pp_play_ex_linked_array_chain:		
	move.l d3,-(sp)				
						
	move.w 10(sp),a0			
	moveq #48,d0				
	add.l a0,d0				
						
	move.l 12(sp),d1			
						
	move.l 16(sp),d2			
						
	move.l 20(sp),d3			
						
	move.l 24(sp),a1			
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	move.l (sp)+,d3				
	rts					
						
	.align	2				
	.globl	_pcm8pp_set_channel_mode	
						
_pcm8pp_set_channel_mode:			
	move.l d3,-(sp)				
						
	move.w 10(sp),a0			
	moveq #112,d0				
	add.l a0,d0				
						
	move.l 12(sp),d1			
						
	move.l 16(sp),d3			
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	move.l (sp)+,d3				
	rts					
						
	.align	2				
	.globl	_pcm8pp_get_data_length		
						
_pcm8pp_get_data_length:			
						
	move.w 6(sp),d0				
	ext.l d0				
	add.l #128,d0				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8pp_get_channel_mode	
						
_pcm8pp_get_channel_mode:			
						
	move.w 6(sp),d0				
	ext.l d0				
	add.l #144,d0				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8pp_get_block_counter	
						
_pcm8pp_get_block_counter:			
						
	move.w 6(sp),d0				
	ext.l d0				
	add.l #160,d0				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8pp_stop			
						
_pcm8pp_stop:					
						
	move.l #256,d0				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8pp_pause			
						
_pcm8pp_pause:					
						
	move.l #257,d0				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8pp_resume			
						
_pcm8pp_resume:					
						
	move.l #258,d0				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8pp_set_max_channels	
						
_pcm8pp_set_max_channels:			
						
	move.l #506,d0				
						
	move.w 6(sp),d1				
	ext.l d1				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8pp_set_polyphonic_mode	
						
_pcm8pp_set_polyphonic_mode:			
						
	move.l #508,d0				
						
	move.w 6(sp),d1				
	ext.l d1				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8pp_get_frequency_mode	
						
_pcm8pp_get_frequency_mode:			
						
	move.l #509,d0				
						
	moveq #-1,d1				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8pp_set_frequency_mode	
						
_pcm8pp_set_frequency_mode:			
						
	move.l #509,d0				
						
	move.w 6(sp),d1				
	ext.l d1				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.data					
_?LC0:						
	.dc.b $50,$43,$4d,$38,$2b,$2b,$20
	.dc.b $00				
	.text					
	.align	2				
	.globl	_pcm8pp_isavailable		
						
_pcm8pp_isavailable:				
	subq.l #8,sp				
	movem.l d3/d4/a3/a4/a5/a6,-(sp)		
						
	pea 34.w				
	jbsr _INTVCG				
	addq.l #4,sp				
	move.l d0,d3				
	moveq #25,d4				
	add.l sp,d4				
	lea (32,sp),a6				
	move.l d4,a3				
	moveq #-16,d0				
	sub.l d4,d0				
	lea _B_BPEEK,a4				
						
	move.l d0,a5				
	add.l d3,a5				
_?L32:						
						
	pea (a5,a3.l)				
	jbsr (a4)				
	addq.l #4,sp				
						
	move.b d0,(a3)+				
						
	cmp.l a3,a6				
	jbne _?L32				
						
	move.l d3,a0				
	pea -9(a0)				
	jbsr (a4)				
	move.l d0,d3				
						
	moveq #7,d0				
	move.l d0,(sp)				
	pea _?LC0				
	move.l d4,-(sp)				
	jbsr _memcmp				
	lea (12,sp),sp				
						
	tst.l d0				
	jbne _?L34				
						
	cmp.b #111,d3				
	shi d0					
	extb.l d0				
	neg.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	addq.l #8,sp				
	rts					
_?L34:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	addq.l #8,sp				
	rts					
						
	.align	2				
	.globl	_pcm8pp_get_mercury_version	
						
_pcm8pp_get_mercury_version:			
	move.l a4,-(sp)				
	move.l a3,-(sp)				
						
	pea 2.w					
	move.l #15515776,-(sp)			
	move.l #15515776,-(sp)			
	lea _BUS_ERR,a3				
	jbsr (a3)				
	lea (12,sp),sp				
						
	tst.l d0				
	jbeq _?L45				
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L45:						
						
	move.l #15515809,-(sp)			
	lea _B_BPEEK,a4				
	jbsr (a4)				
						
	moveq #127,d1				
	and.l d0,d1				
	move.l d1,(sp)				
	move.l #15515793,-(sp)			
	jbsr _B_BPOKE				
						
	addq.l #4,sp				
	move.l #15515809,(sp)			
	jbsr (a4)				
	addq.l #4,sp				
						
	tst.b d0				
	jblt _?L41				
						
	pea 2.w					
	move.l #15515648,-(sp)			
	move.l #15515648,-(sp)			
	jbsr (a3)				
	lea (12,sp),sp				
						
	tst.l d0				
	jbne _?L42				
						
	moveq #53,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L41:						
						
	moveq #48,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L42:						
						
	moveq #64,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
						
						
