* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"pcm8a.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_pcm8a_play			
						
_pcm8a_play:					
						
	move.w 6(sp),d0				
	ext.l d0				
	add.l #4096,d0				
						
	move.l 8(sp),d1				
						
	move.l 12(sp),d2			
						
	move.l 16(sp),a1			
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8a_play_array_chain		
						
_pcm8a_play_array_chain:			
						
	move.w 6(sp),d0				
	ext.l d0				
	add.l #4352,d0				
						
	move.l 8(sp),d1				
						
	move.w 14(sp),d2			
	ext.l d2				
						
	move.l 16(sp),a1			
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8a_play_linked_array_chain	
						
_pcm8a_play_linked_array_chain:			
						
	move.w 6(sp),d0				
	ext.l d0				
	add.l #4608,d0				
						
	move.l 8(sp),d1				
						
	move.l 12(sp),a1			
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8a_set_channel_mode		
						
_pcm8a_set_channel_mode:			
						
	move.w 6(sp),d0				
	ext.l d0				
	add.l #5888,d0				
						
	move.l 8(sp),d1				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8a_get_data_length		
						
_pcm8a_get_data_length:				
						
	move.w 6(sp),d0				
	ext.l d0				
	add.l #6144,d0				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8a_get_channel_mode		
						
_pcm8a_get_channel_mode:			
						
	move.w 6(sp),d0				
	ext.l d0				
	add.l #6400,d0				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8a_get_access_address	
						
_pcm8a_get_access_address:			
						
	move.w 6(sp),d0				
	ext.l d0				
	add.l #6656,d0				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8a_stop			
						
_pcm8a_stop:					
						
	move.l #256,d0				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8a_pause			
						
_pcm8a_pause:					
						
	move.l #257,d0				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8a_resume			
						
_pcm8a_resume:					
						
	move.l #258,d0				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8a_set_system_information	
						
_pcm8a_set_system_information:			
						
	move.l #508,d0				
						
	move.l 4(sp),d1				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.align	2				
	.globl	_pcm8a_set_polyphonic_mode	
						
_pcm8a_set_polyphonic_mode:			
						
	move.l #508,d0				
						
	move.w 6(sp),d1				
	ext.l d1				
						
* APP ON (APP) asm_mode=has			
						
	trap #2					
						
						
						
* APP OFF (NO_APP) asm_mode=gas			
	rts					
						
	.data					
_?LC0:						
	.dc.b $50,$43,$4d,$38,$41
	.dc.b $00				
_?LC1:						
	.dc.b $50,$43,$4d,$38,$2f,$30,$34,$38
	.dc.b $00				
	.text					
	.align	2				
	.globl	_pcm8a_isavailable		
						
_pcm8a_isavailable:				
	lea (-20,sp),sp				
	movem.l d3/d4/d5/a3/a4/a5/a6,-(sp)	
	lea (31,sp),a3				
						
	moveq #119,d3				
	not.b d3				
	lea _B_BPEEK,a4				
_?L26:						
						
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #4,sp				
						
	move.b d0,(a3)+				
						
	addq.l #1,d3				
	cmp.l #140,d3				
	jbne _?L26				
						
	clr.l d1				
	move.b 31(sp),d1			
	moveq #24,d0				
	lsl.l d0,d1				
	clr.l d0				
	move.b 32(sp),d0			
	swap d0					
	clr.w d0				
	or.l d1,d0				
	clr.l d3				
	move.b 33(sp),d3			
	lsl.l #8,d3				
	or.l d0,d3				
	or.b 34(sp),d3				
	move.l d3,a3				
						
	lea (-16,a3),a6				
	moveq #35,d5				
	add.l sp,d5				
	move.l d5,a5				
	moveq #40,d4				
	add.l sp,d4				
_?L27:						
						
	move.l a6,-(sp)				
	jbsr (a4)				
	addq.l #4,sp				
						
	move.b d0,(a5)+				
						
	addq.l #1,a6				
	cmp.l d4,a5				
	jbne _?L27				
						
	pea -11(a3)				
	jbsr (a4)				
	addq.l #4,sp				
						
	move.b d0,28(sp)			
						
	pea -10(a3)				
	jbsr (a4)				
	addq.l #4,sp				
						
	move.b d0,29(sp)			
						
	pea -9(a3)				
	jbsr (a4)				
	addq.l #4,sp				
						
	move.b d0,30(sp)			
	move.l a3,d3				
	subq.l #8,d3				
	move.l d4,a3				
	lea (48,sp),a6				
_?L28:						
						
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #4,sp				
						
	move.b d0,(a3)+				
						
	addq.l #1,d3				
	cmp.l a6,a3				
	jbne _?L28				
						
	pea 5.w					
	pea _?LC0				
	move.l d5,-(sp)				
	lea _memcmp,a3				
	jbsr (a3)				
	lea (12,sp),sp				
						
	tst.l d0				
	jbne _?L31				
						
	clr.l d1				
	move.b 28(sp),d1			
	move.w #-49,a0				
	add.l d1,a0				
	moveq #49,d2				
	cmp.l d1,d2				
	jbeq _?L37				
_?L30:						
						
	tst.l a0				
	jblt _?L25				
_?L38:						
						
	pea 8.w					
	pea _?LC1				
	move.l d4,-(sp)				
	jbsr (a3)				
	lea (12,sp),sp				
						
	tst.l d0				
	seq d0					
	extb.l d0				
	neg.l d0				
_?L25:						
						
	movem.l (sp)+,d3/d4/d5/a3/a4/a5/a6	
	lea (20,sp),sp				
	rts					
_?L31:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/a3/a4/a5/a6	
	lea (20,sp),sp				
	rts					
_?L37:						
						
	clr.l d1				
	move.b 29(sp),d1			
	move.w #-48,a0				
	add.l d1,a0				
	moveq #48,d2				
	cmp.l d1,d2				
	jbne _?L30				
	clr.l d1				
	move.b 30(sp),d1			
	move.l d1,a0				
	lea (-48,a0),a0				
						
	tst.l a0				
	jbge _?L38				
	jbra _?L25				
						
						
