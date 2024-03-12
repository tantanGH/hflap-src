* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"cuesheet.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_cuesheet_init		
						
_miniflac_cuesheet_init:			
	move.l 4(sp),a0				
						
	clr.l (a0)				
						
	clr.l 4(a0)				
						
	clr.w 8(a0)				
						
	clr.w 10(a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_read_catalog_length
						
_miniflac_cuesheet_read_catalog_length:		
	move.l 4(sp),a0				
						
	tst.l (a0)				
	jbne _?L7				
						
	tst.l 12(sp)				
	jbeq _?L6				
						
	move.l 12(sp),a0			
	move.l #128,(a0)			
_?L6:						
						
	moveq #1,d0				
						
	rts					
_?L7:						
						
	moveq #-1,d0				
						
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_read_catalog_string
						
_miniflac_cuesheet_read_catalog_string:		
	movem.l d3/d4/a3/a4/a5/a6,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d3			
	move.l 36(sp),a4			
	move.l 40(sp),d4			
						
	tst.l (a3)				
	jbne _?L22				
						
	move.l 4(a3),d0				
						
	cmp.l #128,d0				
	jbcc _?L12				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_read,a6		
	tst.l a4				
	jbeq _?L32				
_?L13:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L14				
_?L17:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
						
	cmp.l d4,d0				
	jbcc _?L18				
						
	move.b d1,(a4,d0.l)			
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	cmp.l #128,d0				
	jbcs _?L13				
_?L12:						
						
	tst.l 44(sp)				
	jbeq _?L20				
_?L33:						
						
	cmp.l d0,d4				
	jbcc _?L21				
	move.l d4,d0				
_?L21:						
						
	move.l 44(sp),a0			
	move.l d0,(a0)				
_?L20:						
						
	clr.l 4(a3)				
						
	moveq #1,d0				
	move.l d0,(a3)				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L22:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L18:						
						
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	cmp.l #128,d0				
	jbcc _?L12				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L17				
_?L14:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L32:						
						
	move.l a6,a4				
_?L15:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L14				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	cmp.l #128,d0				
	jbcs _?L15				
						
	tst.l 44(sp)				
	jbne _?L33				
	jbra _?L20				
						
	.align	2				
	.globl	_miniflac_cuesheet_read_leadin	
						
_miniflac_cuesheet_read_leadin:			
	movem.l d3/a3/a4/a5,-(sp)		
	move.l 20(sp),a3			
	move.l 24(sp),d3			
						
	move.l (a3),d0				
						
	jbeq _?L35				
	subq.l #1,d0				
	jbne _?L50				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L54				
_?L41:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L50:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L54:						
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 28(sp)				
	jbeq _?L42				
						
	move.l 28(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L42:						
						
	moveq #2,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L35:						
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
						
	cmp.l #128,4(a3)			
	jbcc _?L38				
_?L40:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L41				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	cmp.l #128,d0				
	jbcs _?L40				
_?L38:						
						
	clr.l 4(a3)				
						
	moveq #1,d0				
	move.l d0,(a3)				
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L41				
	jbra _?L54				
						
	.align	2				
	.globl	_miniflac_cuesheet_read_cd_flag	
						
_miniflac_cuesheet_read_cd_flag:		
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	move.l (a3),d0				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbcc _?L56				
	subq.l #2,d0				
	jbne _?L70				
_?L57:						
						
	pea 1.w					
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L71				
						
	clr.l d0				
						
	move.l (sp)+,a3				
	rts					
_?L70:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L71:						
						
	pea 1.w					
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 16(sp)				
	jbeq _?L59				
						
	move.l 16(sp),a0			
	move.b d1,(a0)				
_?L59:						
						
	pea 7.w					
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_discard	
	addq.l #8,sp				
						
	moveq #3,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L56:						
						
	clr.l -(sp)				
	move.l 16(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_cuesheet_read_leadin	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L57				
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_read_tracks	
						
_miniflac_cuesheet_read_tracks:			
	movem.l d3/a3/a4/a5,-(sp)		
	move.l 20(sp),a3			
	move.l 24(sp),d3			
						
	move.l (a3),d0				
						
	moveq #3,d1				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l d0,d1				
	jbeq _?L73				
	moveq #3,d1				
	cmp.l d0,d1				
	jbcs _?L98				
						
	subq.l #2,d0				
	jbne _?L77				
_?L80:						
						
	pea 1.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L78				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	pea 7.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_discard	
	addq.l #8,sp				
						
	moveq #3,d0				
	move.l d0,(a3)				
_?L73:						
						
	cmp.l #257,4(a3)			
	jbhi _?L81				
						
	lea _miniflac_bitreader_discard,a5	
_?L82:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L78				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	cmp.l #257,d0				
	jbls _?L82				
_?L81:						
						
	clr.l 4(a3)				
						
	moveq #4,d1				
	move.l d1,(a3)				
_?L75:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L78				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,9(a3)				
						
	tst.l 28(sp)				
	jbeq _?L83				
						
	move.l 28(sp),a0			
	move.b d1,(a0)				
_?L83:						
						
	clr.b 8(a3)				
						
	moveq #5,d0				
	move.l d0,(a3)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L98:						
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	subq.l #4,d0				
	jbeq _?L75				
	moveq #-1,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L78:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L77:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_cuesheet_read_leadin	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L80				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_read_index_point_offset
						
_miniflac_cuesheet_read_index_point_offset:	
	movem.l d3/a3/a4/a5,-(sp)		
	move.l 20(sp),a3			
	move.l 24(sp),d3			
						
	move.l (a3),d0				
						
	moveq #13,d1				
	cmp.l d0,d1				
	jbeq _?L100				
	jbcs _?L101				
	moveq #12,d1				
	cmp.l d0,d1				
	jbeq _?L120				
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_cuesheet_read_track_indexpoints
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L120				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L101:						
						
	moveq #14,d1				
	cmp.l d0,d1				
	jbne _?L113				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	moveq #2,d0				
	cmp.l 4(a3),d0				
	jbcs _?L106				
						
	lea _miniflac_bitreader_discard,a5	
_?L110:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L109				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbcc _?L110				
_?L106:						
						
	move.b 10(a3),d0			
	addq.b #1,d0				
	move.b d0,10(a3)			
						
	moveq #12,d1				
	move.l d1,(a3)				
_?L107:						
						
	cmp.b 11(a3),d0				
	jbeq _?L123				
_?L111:						
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L124				
_?L109:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L120:						
						
	move.b 10(a3),d0			
						
	cmp.b 11(a3),d0				
	jbne _?L111				
_?L123:						
						
	addq.b #1,8(a3)				
						
	moveq #5,d0				
	move.l d0,(a3)				
						
	moveq #2,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L113:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L124:						
						
	pea 64.w				
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 28(sp)				
	jbeq _?L112				
						
	move.l 28(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L112:						
						
	moveq #13,d0				
	move.l d0,(a3)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L100:						
						
	pea 8.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L109				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	clr.l 4(a3)				
						
	moveq #14,d1				
	move.l d1,(a3)				
						
	lea _miniflac_bitreader_discard,a5	
	jbra _?L110				
						
	.align	2				
	.globl	_miniflac_cuesheet_read_track_offset
						
_miniflac_cuesheet_read_track_offset:		
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	move.l (a3),a0				
						
	moveq #5,d0				
	cmp.l a0,d0				
	jbeq _?L126				
	jbcc _?L127				
	lea (-12,a0),a0				
	moveq #2,d1				
	cmp.l a0,d1				
	jbcs _?L147				
						
	clr.l -(sp)				
	move.l 16(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbeq _?L126				
_?L125:						
						
	move.l (sp)+,a3				
	rts					
_?L127:						
						
	clr.l -(sp)				
	move.l 16(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_cuesheet_read_tracks	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L125				
_?L126:						
						
	move.b 8(a3),d0				
	cmp.b 9(a3),d0				
	jbeq _?L133				
						
	pea 64.w				
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L148				
						
	clr.l d0				
						
	move.l (sp)+,a3				
	rts					
_?L147:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L148:						
						
	pea 64.w				
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 16(sp)				
	jbeq _?L130				
						
	move.l 16(sp),a0			
	move.l d0,(a0)				
	move.l d1,4(a0)				
_?L130:						
						
	moveq #6,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L133:						
						
	moveq #2,d0				
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_read_track_isrc_length
						
_miniflac_cuesheet_read_track_isrc_length:	
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	move.l (a3),d0				
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcc _?L150				
	subq.l #7,d0				
	jbne _?L166				
						
	tst.l 16(sp)				
	jbeq _?L157				
_?L156:						
						
	moveq #12,d1				
	move.l 16(sp),a0			
	move.l d1,(a0)				
_?L157:						
						
	moveq #1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L166:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L150:						
						
	subq.l #6,d0				
	jbne _?L153				
_?L155:						
						
	pea 8.w					
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L167				
						
	clr.l d0				
						
	move.l (sp)+,a3				
	rts					
_?L153:						
						
	clr.l -(sp)				
	move.l 16(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_cuesheet_read_track_offset
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L155				
						
	move.l (sp)+,a3				
	rts					
_?L167:						
						
	pea 8.w					
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	clr.l 4(a3)				
						
	moveq #7,d0				
	move.l d0,(a3)				
						
	tst.l 16(sp)				
	jbne _?L156				
	jbra _?L157				
						
	.align	2				
	.globl	_miniflac_cuesheet_read_track_number
						
_miniflac_cuesheet_read_track_number:		
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	move.l (a3),d0				
						
	moveq #5,d1				
	cmp.l d0,d1				
	jbcc _?L169				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #6,d0				
	jbne _?L189				
						
	pea 8.w					
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L190				
_?L176:						
						
	clr.l d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L189:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L190:						
						
	pea 8.w					
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 20(sp)				
	jbeq _?L177				
						
	move.l 20(sp),a0			
	move.b d1,(a0)				
_?L177:						
						
	clr.l 4(a3)				
						
	moveq #7,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L169:						
						
	subq.l #5,d0				
	jbne _?L172				
_?L174:						
						
	move.b 8(a3),d0				
	cmp.b 9(a3),d0				
	jbeq _?L191				
						
	pea 64.w				
	move.l 20(sp),-(sp)			
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L176				
						
	pea 64.w				
	move.l 20(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #6,d0				
	move.l d0,(a3)				
						
	pea 8.w					
	move.l 20(sp),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L176				
	jbra _?L190				
_?L172:						
						
	clr.l -(sp)				
	move.l 20(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_cuesheet_read_tracks	
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L174				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
_?L191:						
						
	moveq #2,d0				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_read_track_isrc_string
						
_miniflac_cuesheet_read_track_isrc_string:	
	movem.l d3/d4/a3/a4/a5/a6,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d3			
	move.l 36(sp),a4			
	move.l 40(sp),d4			
						
	move.l (a3),d0				
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbcc _?L193				
	subq.l #7,d0				
	jbne _?L206				
_?L205:						
						
	move.l 4(a3),d0				
						
	moveq #11,d1				
	cmp.l d0,d1				
	jbcs _?L195				
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_read,a6		
	tst.l a4				
	jbeq _?L219				
_?L196:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L197				
_?L200:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
						
	cmp.l d4,d0				
	jbcc _?L201				
						
	move.b d1,(a4,d0.l)			
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	moveq #11,d1				
	cmp.l d0,d1				
	jbcc _?L196				
_?L195:						
						
	tst.l 44(sp)				
	jbeq _?L203				
_?L220:						
						
	cmp.l d4,d0				
	jbcc _?L204				
	move.l d0,d4				
_?L204:						
						
	move.l 44(sp),a0			
	move.l d4,(a0)				
_?L203:						
						
	clr.l 4(a3)				
						
	moveq #8,d0				
	move.l d0,(a3)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L206:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L201:						
						
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	moveq #11,d1				
	cmp.l d0,d1				
	jbcs _?L195				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L200				
_?L197:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L193:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L205				
						
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	rts					
_?L219:						
						
	move.l a6,a4				
_?L198:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L197				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	moveq #11,d1				
	cmp.l d0,d1				
	jbcc _?L198				
						
	tst.l 44(sp)				
	jbne _?L220				
	jbra _?L203				
						
	.align	2				
	.globl	_miniflac_cuesheet_read_track_audio_flag
						
_miniflac_cuesheet_read_track_audio_flag:	
	movem.l d3/a3/a4/a5,-(sp)		
	move.l 20(sp),a3			
	move.l 24(sp),d3			
						
	move.l (a3),d0				
						
	moveq #7,d1				
	cmp.l d0,d1				
	jbcc _?L222				
	lea _miniflac_bitreader_fill_nocrc,a4	
	subq.l #8,d0				
	jbne _?L244				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L245				
_?L230:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L244:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L245:						
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 28(sp)				
	jbeq _?L231				
						
	move.l 28(sp),a0			
	move.b d1,(a0)				
_?L231:						
						
	moveq #9,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L222:						
						
	subq.l #7,d0				
	jbne _?L225				
_?L229:						
						
	moveq #11,d0				
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	lea _miniflac_bitreader_read,a5		
						
	cmp.l 4(a3),d0				
	jbcs _?L226				
_?L228:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L230				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	moveq #11,d1				
	cmp.l d0,d1				
	jbcc _?L228				
_?L226:						
						
	clr.l 4(a3)				
						
	moveq #8,d0				
	move.l d0,(a3)				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L230				
	jbra _?L245				
_?L225:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_cuesheet_read_track_number
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L229				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_read_track_preemph_flag
						
_miniflac_cuesheet_read_track_preemph_flag:	
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	move.l (a3),d0				
						
	moveq #8,d1				
	cmp.l d0,d1				
	jbcc _?L247				
	moveq #9,d1				
	cmp.l d0,d1				
	jbne _?L261				
_?L248:						
						
	pea 1.w					
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L262				
						
	clr.l d0				
						
	move.l (sp)+,a3				
	rts					
_?L261:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L262:						
						
	pea 1.w					
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 16(sp)				
	jbeq _?L250				
						
	move.l 16(sp),a0			
	move.b d1,(a0)				
_?L250:						
						
	pea 6.w					
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_discard	
	addq.l #8,sp				
						
	clr.l 4(a3)				
						
	moveq #10,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L247:						
						
	clr.l -(sp)				
	move.l 16(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_cuesheet_read_track_audio_flag
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L248				
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_read_track_indexpoints
						
_miniflac_cuesheet_read_track_indexpoints:	
	movem.l d3/a3/a4/a5,-(sp)		
	move.l 20(sp),a3			
	move.l 24(sp),d3			
						
	move.l (a3),a0				
						
	moveq #11,d0				
	lea _miniflac_bitreader_fill_nocrc,a4	
	cmp.l a0,d0				
	jbeq _?L264				
	moveq #11,d1				
	cmp.l a0,d1				
	jbcs _?L265				
	moveq #10,d0				
	cmp.l a0,d0				
	jbeq _?L266				
						
	moveq #9,d1				
	cmp.l a0,d1				
	jbne _?L268				
_?L267:						
						
	pea 1.w					
	move.l d3,-(sp)				
	lea _miniflac_bitreader_fill_nocrc,a4	
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L277				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	pea 6.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_discard	
	addq.l #8,sp				
						
	clr.l 4(a3)				
						
	moveq #10,d0				
	move.l d0,(a3)				
						
	lea _miniflac_bitreader_discard,a5	
_?L278:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L277				
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	moveq #12,d1				
	cmp.l d0,d1				
	jbcc _?L278				
_?L272:						
						
	moveq #11,d1				
	move.l d1,(a3)				
_?L264:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L301				
_?L277:						
						
	clr.l d0				
_?L263:						
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L265:						
						
	lea (-12,a0),a0				
	lea _miniflac_cuesheet_read_index_point_offset,a4
	moveq #2,d0				
	cmp.l a0,d0				
	jbcs _?L275				
_?L269:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L273				
						
	moveq #5,d0				
	cmp.l (a3),d0				
	jbne _?L269				
						
	moveq #1,d0				
_?L302:						
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L273:						
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbne _?L263				
						
	move.l (a3),d0				
						
	moveq #8,d1				
	cmp.l d0,d1				
	jbcc _?L268				
	moveq #9,d1				
	cmp.l d0,d1				
	jbeq _?L267				
_?L275:						
						
	moveq #-1,d0				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
_?L266:						
	lea _miniflac_bitreader_fill_nocrc,a4	
						
	moveq #12,d1				
	cmp.l 4(a3),d1				
	jbcs _?L272				
						
	lea _miniflac_bitreader_discard,a5	
	jbra _?L278				
_?L301:						
						
	pea 8.w					
	move.l d3,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,11(a3)			
						
	tst.l 28(sp)				
	jbeq _?L279				
						
	move.l 28(sp),a0			
	move.b d1,(a0)				
_?L279:						
						
	clr.b 10(a3)				
						
	moveq #12,d0				
	move.l d0,(a3)				
						
	moveq #1,d0				
	jbra _?L302				
_?L268:						
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_cuesheet_read_track_audio_flag
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L267				
						
	movem.l (sp)+,d3/a3/a4/a5		
	rts					
						
	.align	2				
	.globl	_miniflac_cuesheet_read_index_point_number
						
_miniflac_cuesheet_read_index_point_number:	
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	move.l (a3),d0				
						
	moveq #12,d1				
	cmp.l d0,d1				
	jbcc _?L304				
	moveq #13,d1				
	cmp.l d0,d1				
	jbne _?L318				
_?L305:						
						
	pea 8.w					
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_fill_nocrc	
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L319				
						
	clr.l d0				
						
	move.l (sp)+,a3				
	rts					
_?L318:						
						
	moveq #-1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L319:						
						
	pea 8.w					
	move.l 16(sp),-(sp)			
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	tst.l 16(sp)				
	jbeq _?L307				
						
	move.l 16(sp),a0			
	move.b d1,(a0)				
_?L307:						
						
	clr.l 4(a3)				
						
	moveq #14,d0				
	move.l d0,(a3)				
	moveq #1,d0				
						
	move.l (sp)+,a3				
	rts					
_?L304:						
						
	clr.l -(sp)				
	move.l 16(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr _miniflac_cuesheet_read_index_point_offset
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L305				
						
	move.l (sp)+,a3				
	rts					
						
						
