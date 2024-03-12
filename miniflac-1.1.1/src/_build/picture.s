* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"picture.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_picture_init		
						
_miniflac_picture_init:				
	move.l 4(sp),a0				
						
	clr.l (a0)				
						
	clr.l 4(a0)				
						
	clr.l 8(a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_picture_read_type	
						
_miniflac_picture_read_type:			
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	tst.l (a3)				
	jbeq _?L13				
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L13:						
						
	pea 32.w				
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L14				
						
	clr.l d0				
						
	move.l (sp)+,a3				
	rts					
_?L14:						
						
	pea 32.w				
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 16(sp)				
	jbeq _?L5				
						
	move.l 16(sp),a0			
	move.l d1,(a0)				
_?L5:						
						
	moveq #1,d0				
	move.l d0,(a3)				
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_miniflac_picture_read_mime_length
						
_miniflac_picture_read_mime_length:		
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	jbeq _?L16				
	subq.l #1,d0				
	jbne _?L27				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	pea 32.w				
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
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,4(a3)				
						
	clr.l 8(a3)				
						
	tst.l 20(sp)				
	jbeq _?L21				
						
	move.l 20(sp),a0			
	move.l d1,(a0)				
_?L21:						
						
	moveq #2,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L16:						
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L20				
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #1,d0				
	move.l d0,(a3)				
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L20				
	jbra _?L30				
						
	.align	2				
	.globl	_miniflac_picture_read_mime_string
						
_miniflac_picture_read_mime_string:		
	movem.l d3/d4/a3/a4/a5/a6,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d3			
	move.l 36(sp),a4			
	move.l 40(sp),d4			
						
	move.l (a3),d0				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcc _?L32				
	subq.l #2,d0				
	jbne _?L45				
_?L44:						
						
	move.l 4(a3),d1				
						
	cmp.l 8(a3),d1				
	jbls _?L34				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_read,a6		
	tst.l a4				
	jbeq _?L58				
_?L35:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L36				
_?L39:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
						
	cmp.l d4,d0				
	jbcc _?L40				
						
	move.b d1,(a4,d0.l)			
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d1,d0				
	jbcs _?L35				
_?L34:						
						
	tst.l 44(sp)				
	jbeq _?L42				
_?L59:						
						
	cmp.l d1,d4				
	jbcc _?L43				
	move.l d4,d1				
_?L43:						
						
	move.l 44(sp),a0			
	move.l d1,(a0)				
_?L42:						
						
	moveq #3,d0				
	move.l d0,(a3)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L45:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L40:						
						
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbls _?L34				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L39				
_?L36:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L32:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_picture_read_mime_length	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L44				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L58:						
						
	move.l a6,a4				
_?L37:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L36				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbhi _?L37				
						
	tst.l 44(sp)				
	jbne _?L59				
	jbra _?L42				
						
	.align	2				
	.globl	_miniflac_picture_read_description_length
						
_miniflac_picture_read_description_length:	
	movem.l d3/a3/a4/a5,-(sp)		
	move.l 20(sp),a3			
	move.l 24(sp),d3			
						
	move.l (a3),d0				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbcc _?L61				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #3,d0				
	jbne _?L83				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L84				
_?L69:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L83:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L84:						
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,4(a3)				
						
	clr.l 8(a3)				
						
	tst.l 28(sp)				
	jbeq _?L70				
						
	move.l 28(sp),a0			
	move.l d1,(a0)				
_?L70:						
						
	moveq #4,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L61:						
						
	subq.l #2,d0				
	jbne _?L64				
_?L68:						
						
	move.l 4(a3),a0				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
						
	cmp.l 8(a3),a0				
	jbls _?L65				
_?L67:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L69				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	cmp.l 4(a3),d0				
	jbcs _?L67				
_?L65:						
						
	moveq #3,d0				
	move.l d0,(a3)				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L69				
	jbra _?L84				
_?L64:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_picture_read_mime_length	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L68				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
						
	.align	2				
	.globl	_miniflac_picture_read_description_string
						
_miniflac_picture_read_description_string:	
	movem.l d3/d4/a3/a4/a5/a6,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d3			
	move.l 36(sp),a4			
	move.l 40(sp),d4			
						
	move.l (a3),d0				
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbcc _?L86				
	subq.l #4,d0				
	jbne _?L99				
_?L98:						
						
	move.l 4(a3),d1				
						
	cmp.l 8(a3),d1				
	jbls _?L88				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_read,a6		
	tst.l a4				
	jbeq _?L112				
_?L89:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L90				
_?L93:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
						
	cmp.l d4,d0				
	jbcc _?L94				
						
	move.b d1,(a4,d0.l)			
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d1,d0				
	jbcs _?L89				
_?L88:						
						
	tst.l 44(sp)				
	jbeq _?L96				
_?L113:						
						
	cmp.l d1,d4				
	jbcc _?L97				
	move.l d4,d1				
_?L97:						
						
	move.l 44(sp),a0			
	move.l d1,(a0)				
_?L96:						
						
	moveq #5,d0				
	move.l d0,(a3)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L99:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L94:						
						
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbls _?L88				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L93				
_?L90:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L86:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_picture_read_description_length
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L98				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L112:						
						
	move.l a6,a4				
_?L91:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L90				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbhi _?L91				
						
	tst.l 44(sp)				
	jbne _?L113				
	jbra _?L96				
						
	.align	2				
	.globl	_miniflac_picture_read_width	
						
_miniflac_picture_read_width:			
	movem.l d3/a3/a4/a5,-(sp)		
	move.l 20(sp),a3			
	move.l 24(sp),d3			
						
	move.l (a3),d0				
						
	moveq #4,d1				
	cmp.l d0,d1				
	jbcc _?L115				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #5,d0				
	jbne _?L137				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L138				
_?L123:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L137:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L138:						
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 28(sp)				
	jbeq _?L124				
						
	move.l 28(sp),a0			
	move.l d1,(a0)				
_?L124:						
						
	moveq #6,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L115:						
						
	subq.l #4,d0				
	jbne _?L118				
_?L122:						
						
	move.l 4(a3),a0				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
						
	cmp.l 8(a3),a0				
	jbls _?L119				
_?L121:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L123				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	cmp.l 4(a3),d0				
	jbcs _?L121				
_?L119:						
						
	moveq #5,d0				
	move.l d0,(a3)				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L123				
	jbra _?L138				
_?L118:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_picture_read_description_length
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L122				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
						
	.align	2				
	.globl	_miniflac_picture_read_height	
						
_miniflac_picture_read_height:			
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	move.l (a3),d0				
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcc _?L140				
	subq.l #6,d0				
	jbne _?L154				
_?L141:						
						
	pea 32.w				
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L155				
						
	clr.l d0				
						
	move.l (sp)+,a3				
	rts					
_?L154:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L155:						
						
	pea 32.w				
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 16(sp)				
	jbeq _?L143				
						
	move.l 16(sp),a0			
	move.l d1,(a0)				
_?L143:						
						
	moveq #7,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L140:						
						
	clr.l -(sp)				
	move.l 16(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L141				
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_miniflac_picture_read_colordepth
						
_miniflac_picture_read_colordepth:		
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcc _?L157				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #7,d0				
	jbne _?L175				
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L176				
_?L161:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L175:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L176:						
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 20(sp)				
	jbeq _?L164				
						
	move.l 20(sp),a0			
	move.l d1,(a0)				
_?L164:						
						
	moveq #8,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L157:						
						
	subq.l #6,d0				
	jbne _?L160				
_?L163:						
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L161				
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #7,d0				
	move.l d0,(a3)				
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L161				
	jbra _?L176				
_?L160:						
						
	clr.l -(sp)				
	move.l 20(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L163				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
						
	.align	2				
	.globl	_miniflac_picture_read_totalcolors
						
_miniflac_picture_read_totalcolors:		
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcc _?L178				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #8,d0				
	jbne _?L200				
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L201				
_?L183:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L200:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L201:						
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 20(sp)				
	jbeq _?L186				
						
	move.l 20(sp),a0			
	move.l d1,(a0)				
_?L186:						
						
	moveq #9,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L178:						
						
	moveq #7,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbne _?L202				
_?L181:						
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L183				
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #8,d1				
	move.l d1,(a3)				
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L183				
	jbra _?L201				
_?L202:						
						
	subq.l #6,d0				
	jbne _?L182				
_?L185:						
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L183				
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #7,d0				
	move.l d0,(a3)				
	jbra _?L181				
_?L182:						
						
	clr.l -(sp)				
	move.l 20(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L185				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
						
	.align	2				
	.globl	_miniflac_picture_read_length	
						
_miniflac_picture_read_length:			
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	moveq #8,d1				
	cmp.l d0,d1				
	jbcc _?L204				
	lea _miniflac_bitreader_fill_nocrc,a4	
	moveq #9,d1				
	cmp.l d0,d1				
	jbne _?L229				
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L230				
_?L210:						
						
	clr.l d0				
_?L203:						
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L229:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L230:						
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,4(a3)				
						
	clr.l 8(a3)				
						
	tst.l 20(sp)				
	jbeq _?L213				
						
	move.l 20(sp),a0			
	move.l d1,(a0)				
_?L213:						
						
	moveq #10,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L204:						
						
	moveq #8,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbne _?L231				
_?L207:						
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L210				
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #9,d0				
	move.l d0,(a3)				
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L210				
	jbra _?L230				
_?L231:						
						
	moveq #7,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbeq _?L208				
						
	subq.l #6,d0				
	jbeq _?L212				
						
	clr.l -(sp)				
	move.l 20(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_picture_read_width	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L203				
_?L212:						
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L210				
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #7,d0				
	move.l d0,(a3)				
_?L208:						
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L210				
						
	pea 32.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #8,d1				
	move.l d1,(a3)				
	jbra _?L207				
						
	.align	2				
	.globl	_miniflac_picture_read_data	
						
_miniflac_picture_read_data:			
	movem.l d3/d4/a3/a4/a5/a6,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d3			
	move.l 36(sp),a4			
	move.l 40(sp),d4			
						
	move.l (a3),d0				
						
	moveq #9,d1				
	cmp.l d0,d1				
	jbcc _?L233				
	moveq #10,d1				
	cmp.l d0,d1				
	jbne _?L253				
						
	move.l 8(a3),d0				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbeq _?L235				
						
	jbls _?L242				
	lea _miniflac_bitreader_fill_nocrc,a5	
_?L241:						
						
	lea _miniflac_bitreader_read,a6		
	tst.l a4				
	jbeq _?L265				
_?L243:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L238				
_?L266:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
						
	cmp.l d0,d4				
	jbls _?L248				
						
	move.b d1,(a4,d0.l)			
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbhi _?L243				
_?L242:						
						
	tst.l 44(sp)				
	jbeq _?L252				
_?L250:						
						
	cmp.l d4,d1				
	jbcc _?L251				
	move.l d1,d4				
_?L251:						
						
	move.l 44(sp),a0			
	move.l d4,(a0)				
_?L252:						
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L248:						
						
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbls _?L242				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L266				
_?L238:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L253:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L233:						
						
	moveq #9,d1				
	cmp.l d0,d1				
	jbne _?L237				
_?L240:						
						
	pea 32.w				
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a5	
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L238				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,4(a3)				
						
	clr.l 8(a3)				
						
	moveq #10,d0				
	move.l d0,(a3)				
						
	tst.l d1				
	jbne _?L241				
_?L235:						
						
	moveq #2,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L265:						
						
	move.l a6,a4				
_?L245:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L238				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbhi _?L245				
						
	tst.l 44(sp)				
	jbne _?L250				
	jbra _?L252				
_?L237:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_picture_read_totalcolors	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L240				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
						
						
