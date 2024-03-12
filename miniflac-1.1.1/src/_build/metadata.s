* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68030
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"metadata.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_miniflac_metadata_init		
						
_miniflac_metadata_init:			
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	clr.l (a3)				
						
	clr.l 4(a3)				
						
	pea 8(a3)				
	jbsr _miniflac_metadata_header_init	
	addq.l #4,sp				
						
	pea 22(a3)				
	jbsr _miniflac_streaminfo_init		
	addq.l #4,sp				
						
	pea 34(a3)				
	jbsr _miniflac_vorbis_comment_init	
	addq.l #4,sp				
						
	pea 54(a3)				
	jbsr _miniflac_picture_init		
	addq.l #4,sp				
						
	pea 78(a3)				
	jbsr _miniflac_seektable_init		
	addq.l #4,sp				
						
	pea 90(a3)				
	jbsr _miniflac_application_init		
	addq.l #4,sp				
						
	lea (66,a3),a3				
	move.l a3,8(sp)				
						
	move.l (sp)+,a3				
						
	jbra _miniflac_cuesheet_init		
						
	.data					
_?LC0:						
	.dc.b $6d,$65,$74,$61,$64,$61,$74,$61
	.dc.b $2e,$63
	.dc.b $00				
_?LC1:						
	.dc.b $6d,$65,$74,$61,$64,$61,$74,$61
	.dc.b $2d,$3e,$73,$74,$61,$74,$65,$20
	.dc.b $3d,$3d,$20,$4d,$49,$4e,$49,$46
	.dc.b $4c,$41,$43,$5f,$4d,$45,$54,$41
	.dc.b $44,$41,$54,$41,$5f,$48,$45,$41
	.dc.b $44,$45,$52
	.dc.b $00				
_?LC2:						
	.dc.b $41,$73,$73,$65,$72,$74,$69,$6f
	.dc.b $6e,$20,$66,$61,$69,$6c,$65,$64
	.dc.b $3a,$20,$25,$73,$2c,$20,$66,$69
	.dc.b $6c,$65,$20,$25,$73,$2c,$20,$6c
	.dc.b $69,$6e,$65,$20,$25,$64,$0a
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_metadata_sync		
						
_miniflac_metadata_sync:			
	subq.l #4,sp				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	tst.l (a3)				
	jbne _?L17				
						
	move.l 16(sp),-(sp)			
	pea 8(a3)				
	jbsr _miniflac_metadata_header_decode	
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L3				
						
	moveq #6,d1				
	cmp.l 14(a3),d1				
	jbcs _?L6				
	move.l 14(a3),d1			
	add.l d1,d1				
	move.w _?L8(pc,d1.l),d1			
	jmp 2(pc,d1.w)				
	.align 2,0x284c				
						
_?L8:						
	.dc.w _?L14-_?L8			
	.dc.w _?L13-_?L8			
	.dc.w _?L12-_?L8			
	.dc.w _?L11-_?L8			
	.dc.w _?L10-_?L8			
	.dc.w _?L9-_?L8				
	.dc.w _?L7-_?L8				
_?L13:						
						
	pea 102(a3)				
	move.l d0,8(sp)				
	jbsr _miniflac_padding_init		
	addq.l #4,sp				
						
	move.l 18(a3),102(a3)			
	move.l 4(sp),d0				
_?L6:						
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
_?L3:						
						
	move.l (sp)+,a3				
	addq.l #4,sp				
	rts					
_?L9:						
						
	pea 66(a3)				
	move.l d0,8(sp)				
	jbsr _miniflac_cuesheet_init		
	addq.l #4,sp				
						
	move.l 4(sp),d0				
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
	jbra _?L3				
_?L10:						
						
	pea 34(a3)				
	move.l d0,8(sp)				
	jbsr _miniflac_vorbis_comment_init	
	addq.l #4,sp				
						
	move.l 4(sp),d0				
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
	jbra _?L3				
_?L11:						
						
	pea 78(a3)				
	move.l d0,8(sp)				
	jbsr _miniflac_seektable_init		
	addq.l #4,sp				
						
	move.l 18(a3),d1			
	move.l d1,d2				
	mulu.l #954437177,d1:d2			
	lsr.l #2,d1				
						
	move.l d1,82(a3)			
						
	move.l 4(sp),d0				
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
	jbra _?L3				
_?L12:						
						
	pea 90(a3)				
	move.l d0,8(sp)				
	jbsr _miniflac_application_init		
	addq.l #4,sp				
						
	move.l 18(a3),d1			
	subq.l #4,d1				
	move.l d1,94(a3)			
						
	move.l 4(sp),d0				
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
	jbra _?L3				
_?L14:						
						
	pea 22(a3)				
	move.l d0,8(sp)				
	jbsr _miniflac_streaminfo_init		
	addq.l #4,sp				
						
	move.l 4(sp),d0				
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
	jbra _?L3				
_?L7:						
						
	pea 54(a3)				
	move.l d0,8(sp)				
	jbsr _miniflac_picture_init		
	addq.l #4,sp				
						
	move.l 4(sp),d0				
						
	moveq #1,d1				
	move.l d1,(a3)				
						
	clr.l 4(a3)				
	jbra _?L3				
_?L17:						
						
	pea 29.w				
	pea _?LC0				
	pea _?LC1				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
	.data					
_?LC3:						
	.dc.b $62,$72,$2d,$3e,$62,$69,$74,$73
	.dc.b $20,$3d,$3d,$20,$30
	.dc.b $00				
	.text					
	.align	2				
	.globl	_miniflac_metadata_decode	
						
_miniflac_metadata_decode:			
	movem.l a3/a4/a5/a6,-(sp)		
	move.l 20(sp),a3			
	move.l 24(sp),a4			
						
	move.l (a3),d0				
						
	jbeq _?L19				
	subq.l #1,d0				
	jbeq _?L20				
	moveq #-1,d0				
_?L18:						
						
	movem.l (sp)+,a3/a4/a5/a6		
	rts					
_?L19:						
						
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	jbsr _miniflac_metadata_sync		
	addq.l #8,sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L18				
_?L20:						
	moveq #6,d0				
	cmp.l 14(a3),d0				
	jbcs _?L22				
	move.l 14(a3),d0			
	add.l d0,d0				
	move.w _?L24(pc,d0.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L24:						
	.dc.w _?L30-_?L24			
	.dc.w _?L29-_?L24			
	.dc.w _?L28-_?L24			
	.dc.w _?L27-_?L24			
	.dc.w _?L26-_?L24			
	.dc.w _?L25-_?L24			
	.dc.w _?L23-_?L24			
_?L25:						
						
	lea (66,a3),a6				
	lea _miniflac_cuesheet_read_track_indexpoints,a5
_?L37:						
						
	clr.l -(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L37				
_?L36:						
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbne _?L18				
_?L40:						
						
	tst.b 8(a4)				
	jbne _?L66				
						
	clr.b 9(a4)				
						
	clr.w 10(a4)				
						
	clr.l (a3)				
						
	clr.l 4(a3)				
						
	moveq #1,d0				
						
	movem.l (sp)+,a3/a4/a5/a6		
	rts					
_?L23:						
						
	clr.l -(sp)				
	clr.l -(sp)				
	clr.l -(sp)				
	move.l a4,-(sp)				
	pea 54(a3)				
	jbsr _miniflac_picture_read_data	
	lea (20,sp),sp				
_?L34:						
						
	moveq #2,d1				
	cmp.l d0,d1				
	jbeq _?L40				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L40				
						
	movem.l (sp)+,a3/a4/a5/a6		
	rts					
_?L30:						
						
	clr.l -(sp)				
	clr.l -(sp)				
	clr.l -(sp)				
	move.l a4,-(sp)				
	pea 22(a3)				
	jbsr _miniflac_streaminfo_read_md5_data	
	lea (20,sp),sp				
						
	jbra _?L34				
_?L29:						
						
	clr.l -(sp)				
	clr.l -(sp)				
	clr.l -(sp)				
	move.l a4,-(sp)				
	pea 102(a3)				
	jbsr _miniflac_padding_read_data	
	lea (20,sp),sp				
						
	jbra _?L34				
_?L28:						
						
	clr.l -(sp)				
	clr.l -(sp)				
	clr.l -(sp)				
	move.l a4,-(sp)				
	pea 90(a3)				
	jbsr _miniflac_application_read_data	
	lea (20,sp),sp				
						
	jbra _?L34				
_?L27:						
						
	lea (78,a3),a6				
	lea _miniflac_seektable_read_samples,a5	
_?L38:						
						
	clr.l -(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L36				
						
	clr.l -(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L38				
	jbra _?L36				
_?L26:						
						
	lea (34,a3),a6				
	lea _miniflac_vorbis_comment_read_length,a5
_?L35:						
						
	clr.l -(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbne _?L36				
						
	clr.l -(sp)				
	move.l a4,-(sp)				
	move.l a6,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
						
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L35				
	jbra _?L36				
_?L22:						
	lea _miniflac_bitreader_fill_nocrc,a5	
						
	lea _miniflac_bitreader_discard,a6	
						
	move.l 18(a3),d1			
	cmp.l 4(a3),d1				
	jbls _?L40				
_?L31:						
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	tst.l d0				
	jbne _?L42				
						
	pea 8.w					
	move.l a4,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
						
	move.l 4(a3),d0				
	addq.l #1,d0				
	move.l d0,4(a3)				
						
	cmp.l 18(a3),d0				
	jbcs _?L31				
	jbra _?L40				
_?L42:						
						
	clr.l d0				
						
	movem.l (sp)+,a3/a4/a5/a6		
	rts					
_?L66:						
						
	pea 145.w				
	pea _?LC0				
	pea _?LC3				
	pea _?LC2				
	pea __iob+52				
	jbsr _fprintf				
	lea (20,sp),sp				
	jbsr _abort				
						
						
