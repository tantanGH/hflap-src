* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"ogg.c"				
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_ogg_init		
						
_miniflac_ogg_init:				
	move.l 4(sp),a0				
						
	clr.l (a0)				
						
	clr.w 32(a0)				
						
	clr.l 34(a0)				
	clr.l 38(a0)				
						
	clr.l 42(a0)				
						
	clr.l 46(a0)				
						
	clr.w 50(a0)				
						
	clr.w 52(a0)				
						
	clr.w 54(a0)				
						
	addq.l #4,a0				
	move.l a0,4(sp)				
						
						
	jbra _miniflac_bitreader_init		
						
	.align	2				
	.globl	_miniflac_ogg_sync		
						
_miniflac_ogg_sync:				
	link.w a6,#-8				
	movem.l d3/a3/a4/a5,-(sp)		
	move.l 8(a6),a3				
	move.l 12(a6),d3			
						
	moveq #13,d0				
	cmp.l (a3),d0				
	jbcs _?L4				
	move.l (a3),d0				
	add.l d0,d0				
	move.w _?L6(pc,d0.l),d0			
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L6:						
	.dc.w _?L29-_?L6			
	.dc.w _?L30-_?L6			
	.dc.w _?L31-_?L6			
	.dc.w _?L32-_?L6			
	.dc.w _?L33-_?L6			
	.dc.w _?L34-_?L6			
	.dc.w _?L35-_?L6			
	.dc.w _?L36-_?L6			
	.dc.w _?L37-_?L6			
	.dc.w _?L38-_?L6			
	.dc.w _?L39-_?L6			
	.dc.w _?L7-_?L6				
	.dc.w _?L5-_?L6				
	.dc.w _?L5-_?L6				
_?L5:						
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_discard,a5	
						
	move.w 54(a3),d0			
	cmp.w 52(a3),d0				
	jbcc _?L23				
_?L20:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.w 54(a3),d0			
	addq.w #1,d0				
	move.w d0,54(a3)			
						
	cmp.w 52(a3),d0				
	jbcs _?L20				
_?L23:						
						
	clr.l (a3)				
_?L18:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #79,d1				
	jbeq _?L48				
_?L4:						
						
	moveq #-1,d0				
						
	movem.l -24(a6),d3/a3/a4/a5		
	unlk a6					
	rts					
_?L29:						
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbra _?L18				
_?L31:						
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L49				
_?L24:						
						
	clr.l d0				
						
	movem.l -24(a6),d3/a3/a4/a5		
	unlk a6					
	rts					
_?L32:						
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
_?L52:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #83,d1				
	jbne _?L4				
						
	moveq #4,d0				
	move.l d0,(a3)				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
_?L50:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,32(a3)			
						
	jbne _?L4				
						
	moveq #5,d0				
	move.l d0,(a3)				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
_?L51:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,33(a3)			
						
	moveq #6,d0				
	move.l d0,(a3)				
_?L12:						
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
						
	pea 8.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_read,a5		
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-8(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-7(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-6(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-5(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-4(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-3(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-2(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-1(a6)			
						
	pea -8(a6)				
	jbsr _miniflac_unpack_int64le		
	addq.l #4,sp				
						
	move.l d0,34(a3)			
	move.l d1,38(a3)			
						
	moveq #7,d0				
	move.l d0,(a3)				
_?L11:						
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
						
	pea 8.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_read,a5		
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-8(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-7(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-6(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-5(a6)			
						
	pea -8(a6)				
	jbsr _miniflac_unpack_int32le		
	addq.l #4,sp				
						
	move.l d0,42(a3)			
						
	moveq #8,d0				
	move.l d0,(a3)				
_?L10:						
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
						
	pea 8.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_read,a5		
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-8(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-7(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-6(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.b d1,-5(a6)			
						
	pea -8(a6)				
	jbsr _miniflac_unpack_uint32le		
	addq.l #4,sp				
						
	move.l d0,46(a3)			
						
	moveq #9,d0				
	move.l d0,(a3)				
_?L9:						
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_discard	
	addq.l #8,sp				
						
	moveq #10,d0				
	move.l d0,(a3)				
_?L8:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,d2				
						
	move.b d1,50(a3)			
						
	clr.b 51(a3)				
						
	clr.w 52(a3)				
						
	moveq #11,d0				
	move.l d0,(a3)				
	clr.b d0				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
						
	cmp.b d2,d0				
	jbcc _?L28				
_?L27:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	add.w d1,52(a3)				
						
	move.b 51(a3),d0			
	addq.b #1,d0				
	move.b d0,51(a3)			
						
	cmp.b 50(a3),d0				
	jbcs _?L27				
_?L28:						
						
	clr.w 54(a3)				
						
	moveq #12,d0				
	move.l d0,(a3)				
						
	moveq #1,d0				
						
	movem.l -24(a6),d3/a3/a4/a5		
	unlk a6					
	rts					
_?L30:						
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
_?L53:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #103,d1				
	jbne _?L4				
						
	moveq #2,d0				
	move.l d0,(a3)				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
	jbra _?L49				
_?L33:						
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
	jbra _?L50				
_?L34:						
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
	jbra _?L51				
_?L35:						
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbra _?L12				
_?L36:						
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbra _?L11				
_?L37:						
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbra _?L10				
_?L39:						
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbra _?L8				
_?L38:						
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbra _?L9				
_?L7:						
						
	move.b 50(a3),d2			
						
	move.b 51(a3),d0			
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
						
	cmp.b d2,d0				
	jbcs _?L27				
	jbra _?L28				
_?L49:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	cmp.b #103,d1				
	jbne _?L4				
						
	moveq #3,d0				
	move.l d0,(a3)				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
	jbra _?L52				
_?L48:						
						
	moveq #1,d0				
	move.l d0,(a3)				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L24				
	jbra _?L53				
						
						
