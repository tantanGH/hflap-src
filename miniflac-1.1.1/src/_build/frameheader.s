* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"frameheader.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_frame_header_init	
						
_miniflac_frame_header_init:			
	move.l 4(sp),a0				
						
	clr.w (a0)				
						
	clr.w 2(a0)				
						
	clr.w 4(a0)				
						
	clr.l 6(a0)				
						
	clr.l 10(a0)				
						
	clr.w 14(a0)				
						
	clr.l 16(a0)				
	clr.l 20(a0)				
						
	clr.b 24(a0)				
						
	clr.l 26(a0)				
						
	rts					
						
	.align	2				
	.globl	_miniflac_frame_header_decode	
						
_miniflac_frame_header_decode:			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5,-(sp)	
	move.l 36(sp),a3			
	move.l 40(sp),a4			
						
	moveq #17,d0				
	cmp.l 26(a3),d0				
	jbcs _?L4				
	move.l 26(a3),d0			
	add.l d0,d0				
	move.w _?L6(pc,d0.l),d0			
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L6:						
	.dc.w _?L23-_?L6			
	.dc.w _?L91-_?L6			
	.dc.w _?L92-_?L6			
	.dc.w _?L93-_?L6			
	.dc.w _?L94-_?L6			
	.dc.w _?L95-_?L6			
	.dc.w _?L96-_?L6			
	.dc.w _?L97-_?L6			
	.dc.w _?L98-_?L6			
	.dc.w _?L99-_?L6			
	.dc.w _?L100-_?L6			
	.dc.w _?L101-_?L6			
	.dc.w _?L102-_?L6			
	.dc.w _?L103-_?L6			
	.dc.w _?L104-_?L6			
	.dc.w _?L105-_?L6			
	.dc.w _?L106-_?L6			
	.dc.w _?L90-_?L6			
_?L106:						
	lea _miniflac_bitreader_fill,a5		
_?L7:						
						
	move.b 1(a3),d0				
	cmp.b #13,d0				
	jbeq _?L77				
	cmp.b #14,d0				
	jbeq _?L78				
	cmp.b #12,d0				
	jbeq _?L110				
						
	move.b 9(a4),24(a3)			
						
	moveq #17,d7				
	move.l d7,26(a3)			
_?L5:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	clr.l d5				
	move.b 24(a3),d5			
	clr.l d4				
						
	move.l d4,d2				
	move.l d5,d3				
	sub.l d1,d3				
	subx.l d0,d2				
	jbne _?L89				
_?L4:						
						
	clr.l 26(a3)				
						
	moveq #1,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L90:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L5				
_?L91:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L111				
_?L26:						
						
	clr.l d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L92:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
_?L124:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,3(a3)				
						
	moveq #3,d0				
	move.l d0,26(a3)			
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
_?L112:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,(a3)				
						
	clr.w 4(a3)				
	cmp.b #15,d1				
	jbhi _?L27				
	and.l #255,d1				
	add.l d1,d1				
	move.w _?L29(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L29:						
	.dc.w _?L82-_?L29			
	.dc.w _?L41-_?L29			
	.dc.w _?L40-_?L29			
	.dc.w _?L39-_?L29			
	.dc.w _?L38-_?L29			
	.dc.w _?L37-_?L29			
	.dc.w _?L27-_?L29			
	.dc.w _?L27-_?L29			
	.dc.w _?L36-_?L29			
	.dc.w _?L35-_?L29			
	.dc.w _?L34-_?L29			
	.dc.w _?L33-_?L29			
	.dc.w _?L32-_?L29			
	.dc.w _?L31-_?L29			
	.dc.w _?L30-_?L29			
	.dc.w _?L28-_?L29			
_?L93:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
	jbra _?L112				
_?L94:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
_?L128:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.b d1,1(a3)				
	cmp.b #15,d1				
	jbhi _?L42				
	and.l #255,d1				
	add.l d1,d1				
	move.w _?L43(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L43:						
	.dc.w _?L44-_?L43			
	.dc.w _?L55-_?L43			
	.dc.w _?L54-_?L43			
	.dc.w _?L53-_?L43			
	.dc.w _?L52-_?L43			
	.dc.w _?L51-_?L43			
	.dc.w _?L50-_?L43			
	.dc.w _?L49-_?L43			
	.dc.w _?L48-_?L43			
	.dc.w _?L47-_?L43			
	.dc.w _?L46-_?L43			
	.dc.w _?L45-_?L43			
	.dc.w _?L44-_?L43			
	.dc.w _?L44-_?L43			
	.dc.w _?L44-_?L43			
	.dc.w _?L83-_?L43			
_?L95:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
_?L125:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d0,d2				
	move.l d1,d3				
						
	clr.l d6				
	moveq #10,d7				
	sub.l d3,d7				
	subx.l d2,d6				
	jbcs _?L84				
						
	clr.l d0				
	moveq #7,d1				
	sub.l d3,d1				
	subx.l d2,d0				
	jbcs _?L57				
						
	move.b d3,d1				
	addq.b #1,d1				
	move.b d1,14(a3)			
						
	clr.l 10(a3)				
						
	move.b d3,2(a3)				
						
	moveq #6,d1				
	move.l d1,26(a3)			
_?L17:						
						
	pea 3.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
_?L113:						
						
	pea 3.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d0,d2				
	move.l d1,d3				
	clr.l d6				
	moveq #7,d7				
	sub.l d3,d7				
	subx.l d2,d6				
	jbcs _?L60				
	move.l d1,d0				
	add.l d0,d0				
	move.w _?L61(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L61:						
	.dc.w _?L67-_?L61			
	.dc.w _?L66-_?L61			
	.dc.w _?L65-_?L61			
	.dc.w _?L87-_?L61			
	.dc.w _?L64-_?L61			
	.dc.w _?L63-_?L61			
	.dc.w _?L62-_?L61			
	.dc.w _?L87-_?L61			
_?L96:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 3.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
	jbra _?L113				
_?L97:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
_?L126:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d0,d2				
	or.l d1,d2				
	jbne _?L88				
						
	moveq #8,d3				
	move.l d3,26(a3)			
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
_?L120:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	clr.l d2				
	clr.l d3				
	moveq #127,d3				
	not.b d3				
	and.l d1,d3				
						
	move.l d2,d6				
	or.l d3,d6				
	jbeq _?L114				
						
	clr.l d2				
	clr.l d3				
	moveq #31,d3				
	not.b d3				
	and.l d1,d3				
						
	clr.l d6				
	moveq #63,d7				
	not.b d7				
	sub.l d3,d7				
	subx.l d2,d6				
	jbeq _?L115				
						
	clr.l d2				
	clr.l d3				
	moveq #15,d3				
	not.b d3				
	and.l d1,d3				
						
	clr.l d6				
	moveq #31,d7				
	not.b d7				
	sub.l d3,d7				
	subx.l d2,d6				
	jbeq _?L116				
						
	clr.l d2				
	clr.l d3				
	moveq #7,d3				
	not.b d3				
	and.l d1,d3				
						
	clr.l d6				
	moveq #15,d7				
	not.b d7				
	sub.l d3,d7				
	subx.l d2,d6				
	jbeq _?L117				
						
	clr.l d2				
	clr.l d3				
	moveq #3,d3				
	not.b d3				
	and.l d1,d3				
						
	clr.l d6				
	moveq #7,d7				
	not.b d7				
	sub.l d3,d7				
	subx.l d2,d6				
	jbeq _?L118				
						
	clr.l d2				
	clr.l d3				
	moveq #1,d3				
	not.b d3				
	and.l d1,d3				
						
	clr.l d6				
	moveq #3,d7				
	not.b d7				
	sub.l d3,d7				
	subx.l d2,d6				
	jbeq _?L119				
						
	clr.l d2				
	clr.l d3				
	moveq #0,d3				
	not.b d3				
	and.l d1,d3				
						
	clr.l d6				
	moveq #1,d7				
	not.b d7				
	sub.l d3,d7				
	subx.l d2,d6				
	jbne _?L14				
						
	clr.l 16(a3)				
	clr.l 20(a3)				
						
	moveq #9,d7				
	move.l d7,26(a3)			
_?L14:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
_?L121:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	bfextu d1{#26:#4},d2			
	move.l d1,d3				
	moveq #30,d0				
	lsl.l d0,d3				
						
	add.l d3,20(a3)				
	move.l 16(a3),d1			
	addx.l d2,d1				
	move.l d1,16(a3)			
						
	moveq #10,d2				
	move.l d2,26(a3)			
_?L13:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
_?L122:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #24,d3				
	lsl.l d3,d1				
	clr.l d2				
	clr.l d3				
	move.l d1,d3				
	and.l #1056964608,d3			
						
	add.l d3,20(a3)				
	move.l 16(a3),d6			
	addx.l d2,d6				
	move.l d6,16(a3)			
						
	moveq #11,d7				
	move.l d7,26(a3)			
_?L12:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
_?L123:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #18,d0				
	lsl.l d0,d1				
	clr.l d2				
	clr.l d3				
	move.l d1,d3				
	and.l #16515072,d3			
						
	add.l d3,20(a3)				
	move.l 16(a3),d1			
	addx.l d2,d1				
	move.l d1,16(a3)			
						
	moveq #12,d2				
	move.l d2,26(a3)			
_?L11:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	moveq #12,d3				
	lsl.l d3,d1				
	clr.l d2				
	clr.l d3				
	move.l d1,d3				
	and.l #258048,d3			
						
	add.l d3,20(a3)				
	move.l 16(a3),d6			
	addx.l d2,d6				
	move.l d6,16(a3)			
						
	moveq #13,d7				
	move.l d7,26(a3)			
_?L10:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	lsl.l #6,d1				
	clr.l d2				
	clr.l d3				
	move.l d1,d3				
	and.l #4032,d3				
						
	add.l d3,20(a3)				
	move.l 16(a3),d0			
	addx.l d2,d0				
	move.l d0,16(a3)			
						
	moveq #14,d1				
	move.l d1,26(a3)			
_?L9:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
	move.l d1,d2				
						
	clr.l d0				
	clr.l d1				
	moveq #63,d1				
	and.l d2,d1				
						
	add.l d1,20(a3)				
	move.l 16(a3),d2			
	addx.l d0,d2				
	move.l d2,16(a3)			
						
	moveq #15,d3				
	move.l d3,26(a3)			
_?L8:						
						
	move.b (a3),d0				
	cmp.b #6,d0				
	jbeq _?L74				
	cmp.b #7,d0				
	jbne _?L76				
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.w #1,d1				
	move.w d1,4(a3)				
_?L76:						
						
	moveq #16,d6				
	move.l d6,26(a3)			
	jbra _?L7				
_?L98:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
	jbra _?L120				
_?L99:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
	jbra _?L121				
_?L100:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
	jbra _?L122				
_?L101:						
	lea _miniflac_bitreader_fill,a5		
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
	jbra _?L123				
_?L102:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L11				
_?L103:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L10				
_?L104:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L9				
_?L105:						
	lea _miniflac_bitreader_fill,a5		
	jbra _?L8				
_?L23:						
						
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_reset_crc	
						
	moveq #14,d0				
	move.l d0,(sp)				
	move.l a4,-(sp)				
	lea _miniflac_bitreader_fill,a5		
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
						
	pea 14.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	clr.l d2				
	move.l #16382,d3			
	sub.l d1,d3				
	subx.l d0,d2				
	jbne _?L80				
						
	clr.w (a3)				
						
	clr.w 2(a3)				
						
	clr.w 4(a3)				
						
	clr.l 6(a3)				
						
	clr.l 10(a3)				
						
	clr.w 14(a3)				
						
	clr.l 16(a3)				
	clr.l 20(a3)				
						
	clr.b 24(a3)				
						
	moveq #1,d3				
	move.l d3,26(a3)			
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
	jbra _?L111				
_?L110:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,d0				
	lsl.l #5,d0				
	sub.l d1,d0				
	lsl.l #2,d0				
	add.l d1,d0				
	lsl.l #3,d0				
	move.l d0,6(a3)				
						
	move.b 9(a4),24(a3)			
						
	moveq #17,d7				
	move.l d7,26(a3)			
	jbra _?L5				
_?L111:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d0,d6				
	or.l d1,d6				
	jbne _?L81				
						
	moveq #2,d7				
	move.l d7,26(a3)			
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
	jbra _?L124				
_?L87:						
	moveq #-11,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L44:						
						
	clr.l 6(a3)				
_?L42:						
						
	moveq #5,d2				
	move.l d2,26(a3)			
_?L129:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
	jbra _?L125				
_?L63:						
						
	move.b #20,15(a3)			
_?L60:						
						
	moveq #7,d7				
	move.l d7,26(a3)			
_?L127:						
						
	pea 1.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
	jbra _?L126				
_?L64:						
						
	move.b #16,15(a3)			
						
	moveq #7,d7				
	move.l d7,26(a3)			
	jbra _?L127				
_?L66:						
						
	move.b #8,15(a3)			
						
	moveq #7,d7				
	move.l d7,26(a3)			
	jbra _?L127				
_?L62:						
						
	move.b #24,15(a3)			
						
	moveq #7,d7				
	move.l d7,26(a3)			
	jbra _?L127				
_?L67:						
						
	clr.b 15(a3)				
						
	moveq #7,d7				
	move.l d7,26(a3)			
	jbra _?L127				
_?L65:						
						
	move.b #12,15(a3)			
						
	moveq #7,d7				
	move.l d7,26(a3)			
	jbra _?L127				
_?L41:						
						
	move.w #192,4(a3)			
_?L27:						
						
	moveq #4,d1				
	move.l d1,26(a3)			
_?L130:						
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
	jbra _?L128				
_?L82:						
	moveq #-7,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L55:						
						
	move.l #88200,6(a3)			
						
	moveq #5,d2				
	move.l d2,26(a3)			
	jbra _?L129				
_?L40:						
						
	move.w #576,4(a3)			
						
	moveq #4,d1				
	move.l d1,26(a3)			
	jbra _?L130				
_?L36:						
						
	move.w #256,4(a3)			
						
	moveq #4,d1				
	move.l d1,26(a3)			
	jbra _?L130				
_?L37:						
						
	move.w #4608,4(a3)			
						
	moveq #4,d1				
	move.l d1,26(a3)			
	jbra _?L130				
_?L38:						
						
	move.w #2304,4(a3)			
						
	moveq #4,d1				
	move.l d1,26(a3)			
	jbra _?L130				
_?L39:						
						
	move.w #1152,4(a3)			
						
	moveq #4,d1				
	move.l d1,26(a3)			
	jbra _?L130				
_?L28:						
						
	move.w #-32768,4(a3)			
						
	moveq #4,d1				
	move.l d1,26(a3)			
	jbra _?L130				
_?L30:						
						
	move.w #16384,4(a3)			
						
	moveq #4,d1				
	move.l d1,26(a3)			
	jbra _?L130				
_?L31:						
						
	move.w #8192,4(a3)			
						
	moveq #4,d1				
	move.l d1,26(a3)			
	jbra _?L130				
_?L32:						
						
	move.w #4096,4(a3)			
						
	moveq #4,d1				
	move.l d1,26(a3)			
	jbra _?L130				
_?L33:						
						
	move.w #2048,4(a3)			
						
	moveq #4,d1				
	move.l d1,26(a3)			
	jbra _?L130				
_?L34:						
						
	move.w #1024,4(a3)			
						
	moveq #4,d1				
	move.l d1,26(a3)			
	jbra _?L130				
_?L35:						
						
	move.w #512,4(a3)			
						
	moveq #4,d1				
	move.l d1,26(a3)			
	jbra _?L130				
_?L51:						
						
	move.l #16000,6(a3)			
						
	moveq #5,d2				
	move.l d2,26(a3)			
	jbra _?L129				
_?L52:						
						
	move.l #8000,6(a3)			
						
	moveq #5,d2				
	move.l d2,26(a3)			
	jbra _?L129				
_?L53:						
						
	move.l #192000,6(a3)			
						
	moveq #5,d2				
	move.l d2,26(a3)			
	jbra _?L129				
_?L54:						
						
	move.l #176400,6(a3)			
						
	moveq #5,d2				
	move.l d2,26(a3)			
	jbra _?L129				
_?L45:						
						
	move.l #96000,6(a3)			
						
	moveq #5,d2				
	move.l d2,26(a3)			
	jbra _?L129				
_?L46:						
						
	move.l #48000,6(a3)			
						
	moveq #5,d2				
	move.l d2,26(a3)			
	jbra _?L129				
_?L47:						
						
	move.l #44100,6(a3)			
						
	moveq #5,d2				
	move.l d2,26(a3)			
	jbra _?L129				
_?L48:						
						
	move.l #32000,6(a3)			
						
	moveq #5,d2				
	move.l d2,26(a3)			
	jbra _?L129				
_?L49:						
						
	move.l #24000,6(a3)			
						
	moveq #5,d2				
	move.l d2,26(a3)			
	jbra _?L129				
_?L50:						
						
	move.l #22050,6(a3)			
						
	moveq #5,d2				
	move.l d2,26(a3)			
	jbra _?L129				
_?L83:						
	moveq #-8,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L89:						
						
	moveq #-2,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L74:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
						
	pea 8.w					
						
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	addq.w #1,d1				
	move.w d1,4(a3)				
	jbra _?L76				
_?L78:						
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,d0				
	lsl.l #2,d0				
	add.l d1,d0				
	add.l d0,d0				
	move.l d0,6(a3)				
						
	move.b 9(a4),24(a3)			
						
	moveq #17,d7				
	move.l d7,26(a3)			
	jbra _?L5				
_?L77:						
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
						
	pea 16.w				
	move.l a4,-(sp)				
	jbsr _miniflac_bitreader_read		
	addq.l #8,sp				
						
	move.l d1,6(a3)				
						
	move.b 9(a4),24(a3)			
						
	moveq #17,d7				
	move.l d7,26(a3)			
	jbra _?L5				
_?L57:						
	clr.l d6				
	moveq #9,d7				
	sub.l d3,d7				
	subx.l d2,d6				
	jbeq _?L85				
	clr.l d0				
	moveq #10,d1				
	sub.l d3,d1				
	subx.l d2,d0				
	jbeq _?L86				
	moveq #1,d0				
						
	move.l d0,10(a3)			
						
	move.b #2,14(a3)			
_?L131:						
						
	move.b d3,2(a3)				
						
	moveq #6,d1				
	move.l d1,26(a3)			
	jbra _?L17				
_?L114:						
						
	move.l d0,16(a3)			
	move.l d1,20(a3)			
						
	moveq #15,d7				
	move.l d7,26(a3)			
						
	jbra _?L8				
_?L86:						
	moveq #3,d0				
						
	move.l d0,10(a3)			
						
	move.b #2,14(a3)			
	jbra _?L131				
_?L85:						
	moveq #2,d0				
						
	move.l d0,10(a3)			
						
	move.b #2,14(a3)			
	jbra _?L131				
_?L115:						
						
	lsl.l #6,d1				
	clr.l 16(a3)				
	and.l #1984,d1				
	move.l d1,20(a3)			
						
	moveq #14,d7				
	move.l d7,26(a3)			
						
	jbra _?L9				
_?L116:						
						
	moveq #12,d7				
	lsl.l d7,d1				
	clr.l 16(a3)				
	and.l #65535,d1				
	move.l d1,20(a3)			
						
	moveq #13,d0				
	move.l d0,26(a3)			
						
	jbra _?L10				
_?L117:						
						
	moveq #18,d7				
	lsl.l d7,d1				
	clr.l 16(a3)				
	and.l #1835008,d1			
	move.l d1,20(a3)			
						
	moveq #12,d0				
	move.l d0,26(a3)			
						
	jbra _?L11				
_?L118:						
						
	moveq #24,d7				
	lsl.l d7,d1				
	clr.l 16(a3)				
	and.l #50331648,d1			
	move.l d1,20(a3)			
						
	moveq #11,d0				
	move.l d0,26(a3)			
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
	jbra _?L123				
_?L119:						
						
	moveq #30,d7				
	lsl.l d7,d1				
	clr.l 16(a3)				
	and.l #1073741824,d1			
	move.l d1,20(a3)			
						
	moveq #10,d0				
	move.l d0,26(a3)			
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L26				
	jbra _?L122				
_?L88:						
						
	moveq #-6,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L84:						
						
	moveq #-10,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L80:						
						
	moveq #-4,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
_?L81:						
						
	moveq #-5,d0				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5	
	rts					
						
						
