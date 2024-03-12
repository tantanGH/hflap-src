* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"vorbiscomment.c"		
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_vorbis_comment_init	
						
_miniflac_vorbis_comment_init:			
	move.l 4(sp),a0				
						
	clr.l (a0)				
						
	clr.l 4(a0)				
						
	clr.l 8(a0)				
						
	clr.l 12(a0)				
						
	clr.l 16(a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_vorbis_comment_read_vendor_length
						
_miniflac_vorbis_comment_read_vendor_length:	
	link.w a6,#-4				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 8(a6),a3				
						
	tst.l (a3)				
	jbeq _?L13				
						
	moveq #-1,d0				
						
	move.l -12(a6),a3			
	move.l -8(a6),a4			
	unlk a6					
	rts					
_?L13:						
						
	pea 32.w				
	move.l 12(a6),-(sp)			
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L14				
						
	clr.l d0				
						
	move.l -12(a6),a3			
	move.l -8(a6),a4			
	unlk a6					
	rts					
_?L14:						
						
	pea 8.w					
	move.l 12(a6),-(sp)			
	lea _miniflac_bitreader_read,a4		
	jbsr (a4)				
	addq.l #8,sp				
						
	move.b d1,-4(a6)			
						
	pea 8.w					
	move.l 12(a6),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.b d1,-3(a6)			
						
	pea 8.w					
	move.l 12(a6),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.b d1,-2(a6)			
						
	pea 8.w					
	move.l 12(a6),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.b d1,-1(a6)			
						
	pea -4(a6)				
	jbsr _miniflac_unpack_uint32le		
	addq.l #4,sp				
						
	move.l d0,4(a3)				
						
	tst.l 16(a6)				
	jbeq _?L5				
						
	move.l 16(a6),a0			
	move.l d0,(a0)				
_?L5:						
						
	moveq #1,d0				
	move.l d0,(a3)				
						
	move.l -12(a6),a3			
	move.l -8(a6),a4			
	unlk a6					
	rts					
						
	.align	2				
	.globl	_miniflac_vorbis_comment_read_vendor_string
						
_miniflac_vorbis_comment_read_vendor_string:	
	movem.l d3/d4/a3/a4/a5/a6,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d3			
	move.l 36(sp),a4			
	move.l 40(sp),d4			
						
	move.l (a3),d0				
						
	jbeq _?L16				
	subq.l #1,d0				
	jbeq _?L28				
	moveq #-1,d0				
_?L15:						
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L16:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_vorbis_comment_read_vendor_length
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L15				
_?L28:						
						
	move.l 4(a3),d1				
						
	cmp.l 8(a3),d1				
	jbls _?L18				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_read,a6		
	tst.l a4				
	jbeq _?L42				
_?L19:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L20				
_?L23:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
						
	cmp.l d4,d0				
	jbcc _?L24				
						
	move.b d1,(a4,d0.l)			
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d1,d0				
	jbcs _?L19				
_?L18:						
						
	tst.l 44(sp)				
	jbeq _?L26				
_?L43:						
						
	cmp.l d1,d4				
	jbcc _?L27				
	move.l d4,d1				
_?L27:						
						
	move.l 44(sp),a0			
	move.l d1,(a0)				
_?L26:						
						
	moveq #2,d0				
	move.l d0,(a3)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L24:						
						
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbls _?L18				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L23				
_?L20:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L42:						
						
	move.l a6,a4				
_?L21:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L20				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbhi _?L21				
						
	tst.l 44(sp)				
	jbne _?L43				
	jbra _?L26				
						
	.align	2				
	.globl	_miniflac_vorbis_comment_read_total
						
_miniflac_vorbis_comment_read_total:		
	link.w a6,#-4				
	movem.l d3/a3/a4/a5,-(sp)		
	move.l 8(a6),a3				
	move.l 12(a6),d3			
						
	move.l (a3),d0				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcc _?L45				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #2,d0				
	jbne _?L67				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L68				
_?L53:						
						
	clr.l d0				
						
	movem.l -20(a6),d3/a3/a4/a5		
	unlk a6					
	rts					
_?L67:						
						
	moveq #-1,d0				
						
	movem.l -20(a6),d3/a3/a4/a5		
	unlk a6					
	rts					
_?L68:						
						
	pea 8.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_read,a4		
	jbsr (a4)				
	addq.l #8,sp				
						
	move.b d1,-4(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.b d1,-3(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.b d1,-2(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.b d1,-1(a6)			
						
	pea -4(a6)				
	jbsr _miniflac_unpack_uint32le		
	addq.l #4,sp				
						
	move.l d0,12(a3)			
						
	tst.l 16(a6)				
	jbeq _?L54				
						
	move.l 16(a6),a0			
	move.l d0,(a0)				
_?L54:						
						
	moveq #3,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	movem.l -20(a6),d3/a3/a4/a5		
	unlk a6					
	rts					
_?L45:						
						
	subq.l #1,d0				
	jbne _?L48				
_?L52:						
						
	move.l 4(a3),a0				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
						
	cmp.l 8(a3),a0				
	jbls _?L49				
_?L51:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L53				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	cmp.l 4(a3),d0				
	jbcs _?L51				
_?L49:						
						
	moveq #2,d0				
	move.l d0,(a3)				
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L53				
	jbra _?L68				
_?L48:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_vorbis_comment_read_vendor_length
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L52				
						
	movem.l -20(a6),d3/a3/a4/a5		
	unlk a6					
	rts					
						
	.align	2				
	.globl	_miniflac_vorbis_comment_read_length
						
_miniflac_vorbis_comment_read_length:		
	link.w a6,#-4				
	movem.l d3/a3/a4/a5,-(sp)		
	move.l 8(a6),a3				
	move.l 12(a6),d3			
						
	move.l (a3),d0				
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbeq _?L88				
	jbcc _?L71				
	subq.l #4,d0				
	jbne _?L91				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
						
	move.l 4(a3),a0				
	cmp.l 8(a3),a0				
	jbls _?L78				
_?L75:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L81				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	cmp.l 4(a3),d0				
	jbcs _?L75				
_?L78:						
						
	move.l 16(a3),d0			
	addq.l #1,d0				
	move.l d0,16(a3)			
						
	moveq #3,d1				
	move.l d1,(a3)				
_?L74:						
						
	cmp.l 12(a3),d0				
	jbeq _?L79				
_?L93:						
						
	pea 32.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L92				
_?L81:						
	clr.l d0				
_?L69:						
						
	movem.l -20(a6),d3/a3/a4/a5		
	unlk a6					
	rts					
_?L71:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_vorbis_comment_read_total
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L69				
_?L88:						
						
	move.l 16(a3),d0			
						
	cmp.l 12(a3),d0				
	jbne _?L93				
_?L79:						
						
	moveq #2,d0				
						
	movem.l -20(a6),d3/a3/a4/a5		
	unlk a6					
	rts					
_?L91:						
						
	moveq #-1,d0				
						
	movem.l -20(a6),d3/a3/a4/a5		
	unlk a6					
	rts					
_?L92:						
						
	pea 8.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_read,a4		
	jbsr (a4)				
	addq.l #8,sp				
						
	move.b d1,-4(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.b d1,-3(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.b d1,-2(a6)			
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.b d1,-1(a6)			
						
	pea -4(a6)				
	jbsr _miniflac_unpack_uint32le		
	addq.l #4,sp				
						
	move.l d0,4(a3)				
						
	clr.l 8(a3)				
						
	tst.l 16(a6)				
	jbeq _?L77				
						
	move.l 16(a6),a0			
	move.l d0,(a0)				
_?L77:						
						
	moveq #4,d0				
	move.l d0,(a3)				
						
	moveq #1,d0				
						
	movem.l -20(a6),d3/a3/a4/a5		
	unlk a6					
	rts					
						
	.align	2				
	.globl	_miniflac_vorbis_comment_read_string
						
_miniflac_vorbis_comment_read_string:		
	movem.l d3/d4/a3/a4/a5/a6,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d3			
	move.l 36(sp),a4			
	move.l 40(sp),d4			
						
	move.l (a3),d0				
						
	moveq #3,d1				
	cmp.l d0,d1				
	jbcc _?L95				
	subq.l #4,d0				
	jbne _?L108				
_?L107:						
						
	move.l 4(a3),d1				
						
	cmp.l 8(a3),d1				
	jbls _?L97				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_read,a6		
	tst.l a4				
	jbeq _?L121				
_?L98:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L99				
_?L102:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
						
	cmp.l d4,d0				
	jbcc _?L103				
						
	move.b d1,(a4,d0.l)			
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d1,d0				
	jbcs _?L98				
_?L97:						
						
	tst.l 44(sp)				
	jbeq _?L105				
_?L122:						
						
	cmp.l d1,d4				
	jbcc _?L106				
	move.l d4,d1				
_?L106:						
						
	move.l 44(sp),a0			
	move.l d1,(a0)				
_?L105:						
						
	addq.l #1,16(a3)			
						
	moveq #3,d0				
	move.l d0,(a3)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L108:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L103:						
						
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbls _?L97				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L102				
_?L99:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L95:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_vorbis_comment_read_length
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L107				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L121:						
						
	move.l a6,a4				
_?L100:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L99				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	move.l d0,8(a3)				
						
	move.l 4(a3),d1				
						
	cmp.l d0,d1				
	jbhi _?L100				
						
	tst.l 44(sp)				
	jbne _?L122				
	jbra _?L105				
						
						
