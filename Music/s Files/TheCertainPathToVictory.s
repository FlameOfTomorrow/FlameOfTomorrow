	.include "MPlayDef.s"

	.equ	TheCertainPathToVictory_grp, voicegroup000
	.equ	TheCertainPathToVictory_pri, 0
	.equ	TheCertainPathToVictory_rev, 0
	.equ	TheCertainPathToVictory_mvl, 45
	.equ	TheCertainPathToVictory_key, 0
	.equ	TheCertainPathToVictory_tbs, 1
	.equ	TheCertainPathToVictory_exg, 0
	.equ	TheCertainPathToVictory_cmp, 1

	.section .rodata
	.global	TheCertainPathToVictory
	.align	2

@**************** Track 1 (Midi-Chn.1) ****************@

TheCertainPathToVictory_1:
	.byte	KEYSH , TheCertainPathToVictory_key+0
TheCertainPathToVictory_1_B1:
@ 000   ----------------------------------------
	.byte	TEMPO , 165*TheCertainPathToVictory_tbs/2
	.byte		VOICE , 10
	.byte		VOL   , 109*TheCertainPathToVictory_mvl/mxv
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		PAN   , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
TheCertainPathToVictory_1_008:
	.byte		N12   , As4 , v127
	.byte	W12
	.byte		        Ds4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		N06   , Ds4 
	.byte	W24
	.byte		N24   , Cs5 
	.byte	W12
	.byte	PEND
@ 009   ----------------------------------------
TheCertainPathToVictory_1_009:
	.byte	W12
	.byte		N24   , Bn4 , v127
	.byte	W24
	.byte		N12   , As4 
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		N12   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte	PEND
@ 010   ----------------------------------------
	.byte		N24   , As4 
	.byte	W24
	.byte		N12   , Ds4 
	.byte	W12
	.byte		N48   , Fn4 
	.byte	W60
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_1_008
@ 013   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_1_009
@ 014   ----------------------------------------
	.byte		N12   , As4 , v127
	.byte	W12
	.byte		N12   
	.byte	W24
	.byte		N84   , Fn5 
	.byte	W60
@ 015   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	TheCertainPathToVictory_1_B1
TheCertainPathToVictory_1_B2:
@ 016   ----------------------------------------
	.byte	W72
	.byte	FINE

@**************** Track 2 (Midi-Chn.2) ****************@

TheCertainPathToVictory_2:
	.byte	KEYSH , TheCertainPathToVictory_key+0
TheCertainPathToVictory_2_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 33
	.byte		VOL   , 82*TheCertainPathToVictory_mvl/mxv
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		PAN   , c_v+0
	.byte		N24   , Ds1 , v127
	.byte	W72
	.byte		N12   , Cs1 
	.byte	W12
	.byte		N24   , Bn0 
	.byte	W12
@ 001   ----------------------------------------
	.byte	W60
	.byte		N12   
	.byte	W24
	.byte		N24   , Cs1 
	.byte	W12
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte		        Ds1 
	.byte	W72
	.byte		N12   , Cs1 
	.byte	W12
	.byte		N24   , Bn0 
	.byte	W12
@ 005   ----------------------------------------
	.byte	W60
	.byte		N12   , Gs0 
	.byte	W24
	.byte		N24   , Cs1 
	.byte	W12
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte		N10   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N10   , Dn1 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N06   
	.byte	W12
@ 008   ----------------------------------------
TheCertainPathToVictory_2_008:
	.byte		N10   , Bn0 , v127
	.byte	W12
	.byte		N04   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte	PEND
@ 009   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_2_008
@ 010   ----------------------------------------
TheCertainPathToVictory_2_010:
	.byte		N10   , As0 , v127
	.byte	W12
	.byte		N04   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte	PEND
@ 011   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_2_010
@ 012   ----------------------------------------
	.byte		N10   , Bn0 , v127
	.byte	W12
	.byte		N04   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N04   
	.byte	W12
	.byte		N10   
	.byte	W12
@ 013   ----------------------------------------
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N04   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N04   
	.byte	W12
	.byte		N10   
	.byte	W12
@ 014   ----------------------------------------
	.byte		        As0 
	.byte	W12
	.byte		N04   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N04   
	.byte	W12
	.byte		N10   
	.byte	W12
@ 015   ----------------------------------------
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N04   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte		N04   
	.byte	W12
	.byte		N10   
	.byte	W12
	.byte	GOTO
	 .word	TheCertainPathToVictory_2_B1
TheCertainPathToVictory_2_B2:
@ 016   ----------------------------------------
	.byte		N24   , Ds1 , v127
	.byte	W72
	.byte	FINE

@**************** Track 3 (Midi-Chn.3) ****************@

TheCertainPathToVictory_3:
	.byte	KEYSH , TheCertainPathToVictory_key+0
TheCertainPathToVictory_3_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 48
	.byte		VOL   , 38*TheCertainPathToVictory_mvl/mxv
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		PAN   , c_v+0
	.byte		N11   , As4 , v127
	.byte		N11   , Ds5 
	.byte	W24
	.byte		        As4 
	.byte		N11   , Ds5 
	.byte	W24
	.byte		        As4 
	.byte		N11   , Ds5 
	.byte	W24
	.byte		        As4 
	.byte		N11   , Ds5 
	.byte	W24
@ 001   ----------------------------------------
TheCertainPathToVictory_3_001:
	.byte		N11   , As4 , v127
	.byte		N11   , Ds5 
	.byte	W24
	.byte		        As4 
	.byte		N11   , Ds5 
	.byte	W24
	.byte		        As4 
	.byte		N11   , Ds5 
	.byte	W24
	.byte		        As4 
	.byte		N11   , Ds5 
	.byte	W24
	.byte	PEND
@ 002   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_3_001
@ 003   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_3_001
@ 004   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_3_001
@ 005   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_3_001
@ 006   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_3_001
@ 007   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_3_001
@ 008   ----------------------------------------
	.byte		N96   , Bn3 , v127
	.byte		N96   , Fn4 
	.byte	W96
@ 009   ----------------------------------------
	.byte		        Bn3 
	.byte		N96   , Ds4 
	.byte	W96
@ 010   ----------------------------------------
	.byte		        As3 
	.byte		N96   , Ds4 
	.byte	W96
@ 011   ----------------------------------------
	.byte		        As3 
	.byte		N96   , Dn4 
	.byte	W96
@ 012   ----------------------------------------
	.byte		        Bn3 
	.byte		N96   , Fn4 
	.byte	W96
@ 013   ----------------------------------------
	.byte		        Bn3 
	.byte		N96   , Ds4 
	.byte	W96
@ 014   ----------------------------------------
	.byte		        Dn4 
	.byte		N96   , Fs4 
	.byte	W96
@ 015   ----------------------------------------
	.byte		        Dn4 
	.byte		N96   , Fn4 
	.byte	W96
	.byte	GOTO
	 .word	TheCertainPathToVictory_3_B1
TheCertainPathToVictory_3_B2:
@ 016   ----------------------------------------
	.byte		N11   , As4 , v127
	.byte		N11   , Ds5 
	.byte	W24
	.byte		        As4 
	.byte		N11   , Ds5 
	.byte	W24
	.byte		        As4 
	.byte		N11   , Ds5 
	.byte	W24
	.byte	FINE

@**************** Track 4 (Midi-Chn.4) ****************@

TheCertainPathToVictory_4:
	.byte	KEYSH , TheCertainPathToVictory_key+0
TheCertainPathToVictory_4_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 60
	.byte		VOL   , 73*TheCertainPathToVictory_mvl/mxv
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		PAN   , c_v+0
	.byte		N24   , As2 , v127
	.byte		N24   , Ds3 
	.byte	W72
	.byte		N06   , Cs3 
	.byte		N06   , Fn3 
	.byte	W12
	.byte		N24   , Ds3 
	.byte		N24   , Fs3 
	.byte	W12
@ 001   ----------------------------------------
	.byte	W60
	.byte		N12   , Fn3 
	.byte		N12   , Gs3 
	.byte	W24
	.byte		N24   , Cs3 
	.byte		N24   , Fn3 
	.byte	W12
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte		        As2 
	.byte		N24   , Ds3 
	.byte	W72
	.byte		N06   , Cs3 
	.byte		N06   , Fn3 
	.byte	W12
	.byte		N24   , Ds3 
	.byte		N24   , Fs3 
	.byte	W12
@ 005   ----------------------------------------
	.byte	W60
	.byte		N12   , Fn3 
	.byte		N12   , Gs3 
	.byte	W24
	.byte		N24   , Fn3 
	.byte		N24   , As3 
	.byte	W12
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	TheCertainPathToVictory_4_B1
TheCertainPathToVictory_4_B2:
@ 016   ----------------------------------------
	.byte		N24   , As2 , v127
	.byte		N24   , Ds3 
	.byte	W72
	.byte	FINE

@**************** Track 5 (Midi-Chn.5) ****************@

TheCertainPathToVictory_5:
	.byte	KEYSH , TheCertainPathToVictory_key+0
TheCertainPathToVictory_5_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 48
	.byte		VOL   , 79*TheCertainPathToVictory_mvl/mxv
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		PAN   , c_v+0
	.byte		N24   , As3 , v127
	.byte		N24   , Ds4 
	.byte	W72
	.byte		N06   , Cs4 
	.byte		N06   , Fn4 
	.byte	W12
	.byte		N24   , Ds4 
	.byte		N24   , Fs4 
	.byte	W12
@ 001   ----------------------------------------
	.byte	W60
	.byte		N12   , Fn4 
	.byte		N12   , Gs4 
	.byte	W24
	.byte		N24   , Cs4 
	.byte		N24   , Fn4 
	.byte	W12
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte		        As3 
	.byte		N24   , Ds4 
	.byte	W72
	.byte		N06   , Cs4 
	.byte		N06   , Fn4 
	.byte	W12
	.byte		N24   , Ds4 
	.byte		N24   , Fs4 
	.byte	W12
@ 005   ----------------------------------------
	.byte	W60
	.byte		N12   , Fn4 
	.byte		N12   , Gs4 
	.byte	W24
	.byte		N24   , Fn4 
	.byte		N24   , As4 
	.byte	W12
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte		N96   , Bn2 
	.byte		N96   , Fn3 
	.byte	W96
@ 009   ----------------------------------------
	.byte		        Bn2 
	.byte		N96   , Ds3 
	.byte	W96
@ 010   ----------------------------------------
	.byte		        As2 
	.byte		N96   , Ds3 
	.byte	W96
@ 011   ----------------------------------------
	.byte		        As2 
	.byte		N96   , Dn3 
	.byte	W96
@ 012   ----------------------------------------
	.byte		        Bn2 
	.byte		N96   , Fn3 
	.byte	W96
@ 013   ----------------------------------------
	.byte		        Bn2 
	.byte		N96   , Ds3 
	.byte	W96
@ 014   ----------------------------------------
	.byte		        Dn3 
	.byte		N96   , Fs3 
	.byte	W96
@ 015   ----------------------------------------
	.byte		        Dn3 
	.byte		N96   , Fn3 
	.byte	W96
	.byte	GOTO
	 .word	TheCertainPathToVictory_5_B1
TheCertainPathToVictory_5_B2:
@ 016   ----------------------------------------
	.byte		N24   , As3 , v127
	.byte		N24   , Ds4 
	.byte	W72
	.byte	FINE

@**************** Track 6 (Midi-Chn.6) ****************@

TheCertainPathToVictory_6:
	.byte	KEYSH , TheCertainPathToVictory_key+0
TheCertainPathToVictory_6_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 30
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		VOL   , 127*TheCertainPathToVictory_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W12
	.byte		N12   , Gs1 , v127
	.byte	W01
	.byte		BEND  , c_v-54
	.byte	W01
	.byte		        c_v-41
	.byte	W01
	.byte		        c_v-28
	.byte	W02
	.byte		        c_v-14
	.byte	W01
	.byte		        c_v-7
	.byte	W02
	.byte		        c_v+0
	.byte	W04
	.byte		N12   , An1 
	.byte	W12
	.byte		BEND  , c_v-41
	.byte		N12   , As1 
	.byte	W01
	.byte		BEND  , c_v-28
	.byte	W02
	.byte		        c_v-14
	.byte	W01
	.byte		        c_v-7
	.byte	W02
	.byte		        c_v+0
	.byte	W06
	.byte		N12   , Gs1 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		N24   , Ds1 
	.byte	W18
	.byte		BEND  , c_v-11
	.byte	W01
	.byte		        c_v-20
	.byte	W01
	.byte		        c_v-29
	.byte	W01
	.byte		        c_v-38
	.byte	W01
	.byte		        c_v-48
	.byte	W01
	.byte		        c_v-53
	.byte	W01
@ 004   ----------------------------------------
	.byte		        c_v+0
	.byte	W96
@ 005   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte		MOD   , 0
	.byte	W01
@ 006   ----------------------------------------
	.byte		BEND  , c_v-64
	.byte		N06   , As1 
	.byte	W01
	.byte		BEND  , c_v-64
	.byte	W02
	.byte		        c_v-64
	.byte	W02
	.byte		        c_v-62
	.byte	W01
	.byte		        c_v-58
	.byte		N06   , Cn2 
	.byte	W01
	.byte		BEND  , c_v-54
	.byte	W03
	.byte		        c_v-51
	.byte	W02
	.byte		        c_v-48
	.byte		N06   , Dn2 
	.byte	W05
	.byte		BEND  , c_v-44
	.byte	W01
	.byte		N06   , En2 
	.byte	W03
	.byte		BEND  , c_v-41
	.byte	W03
	.byte		N06   , Fn2 
	.byte	W01
	.byte		BEND  , c_v-38
	.byte	W05
	.byte		        c_v-32
	.byte		N06   , Gn2 
	.byte	W04
	.byte		BEND  , c_v-31
	.byte	W02
	.byte		N06   , An2 
	.byte	W03
	.byte		BEND  , c_v-23
	.byte	W03
	.byte		N06   , Bn2 
	.byte	W01
	.byte		BEND  , c_v-19
	.byte	W05
	.byte		N06   , Cn3 
	.byte	W01
	.byte		BEND  , c_v-12
	.byte	W04
	.byte		        c_v-7
	.byte	W01
	.byte		N06   , Dn3 
	.byte	W04
	.byte		BEND  , c_v-2
	.byte	W02
	.byte		N06   , En3 
	.byte	W03
	.byte		BEND  , c_v+2
	.byte	W03
	.byte		N06   , Fn3 
	.byte	W02
	.byte		BEND  , c_v+6
	.byte	W04
	.byte		        c_v+11
	.byte		N06   , Gn3 
	.byte	W04
	.byte		BEND  , c_v+15
	.byte	W02
	.byte		N06   , An3 
	.byte	W03
	.byte		BEND  , c_v+19
	.byte	W03
	.byte		N06   , Bn3 
	.byte	W03
	.byte		BEND  , c_v+27
	.byte	W03
	.byte		N06   , Cn4 
	.byte	W03
	.byte		BEND  , c_v+33
	.byte	W02
	.byte		MOD   , 1
	.byte	W01
@ 007   ----------------------------------------
	.byte		N96   , Gs4 
	.byte	W05
	.byte		BEND  , c_v+37
	.byte	W05
	.byte		        c_v+45
	.byte	W07
	.byte		        c_v+54
	.byte	W01
	.byte		MOD   , 2
	.byte	W03
	.byte		BEND  , c_v+61
	.byte	W03
	.byte		        c_v+63
	.byte	W03
	.byte		MOD   , 2
	.byte	W01
	.byte		BEND  , c_v+63
	.byte	W10
	.byte		MOD   , 2
	.byte	W10
	.byte		        2
	.byte	W44
	.byte	W01
	.byte		BEND  , c_v+0
	.byte	W03
@ 008   ----------------------------------------
	.byte		MOD   , 0
	.byte		N02   , Bn0 
	.byte	W01
	.byte		BEND  , c_v+0
	.byte	W11
	.byte		N02   
	.byte	W12
	.byte		N09   , Bn1 
	.byte	W12
	.byte		N02   , Bn0 
	.byte	W12
	.byte		N02   
	.byte	W12
	.byte		N22   , Bn1 
	.byte	W36
@ 009   ----------------------------------------
TheCertainPathToVictory_6_009:
	.byte		N02   , Bn0 , v127
	.byte	W12
	.byte		N02   
	.byte	W12
	.byte		N09   , Bn1 
	.byte	W12
	.byte		N02   , Bn0 
	.byte	W12
	.byte		N02   
	.byte	W12
	.byte		N22   , Bn1 
	.byte	W36
	.byte	PEND
@ 010   ----------------------------------------
TheCertainPathToVictory_6_010:
	.byte		N02   , As0 , v127
	.byte	W12
	.byte		N02   
	.byte	W12
	.byte		N09   , As1 
	.byte	W12
	.byte		N02   , As0 
	.byte	W12
	.byte		N02   
	.byte	W12
	.byte		N22   , As1 
	.byte	W36
	.byte	PEND
@ 011   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_6_010
@ 012   ----------------------------------------
	.byte		N02   , Bn0 , v127
	.byte	W01
	.byte		BEND  , c_v+0
	.byte	W11
	.byte		N02   
	.byte	W12
	.byte		N09   , Bn1 
	.byte	W12
	.byte		N02   , Bn0 
	.byte	W12
	.byte		N02   
	.byte	W12
	.byte		N22   , Bn1 
	.byte	W36
@ 013   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_6_009
@ 014   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_6_010
@ 015   ----------------------------------------
	.byte		N02   , As0 , v127
	.byte	W12
	.byte		N02   
	.byte	W12
	.byte		N09   , As1 
	.byte	W12
	.byte		N02   , As0 
	.byte	W24
	.byte		N12   , As1 
	.byte	W12
	.byte		N12   
	.byte	W12
	.byte		N12   
	.byte	W12
	.byte	GOTO
	 .word	TheCertainPathToVictory_6_B1
TheCertainPathToVictory_6_B2:
@ 016   ----------------------------------------
	.byte		BEND  , c_v+0
	.byte	W72
	.byte	FINE

@**************** Track 7 (Midi-Chn.7) ****************@

TheCertainPathToVictory_7:
	.byte	KEYSH , TheCertainPathToVictory_key+0
TheCertainPathToVictory_7_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 11
	.byte		VOL   , 79*TheCertainPathToVictory_mvl/mxv
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		PAN   , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte		N36   , Fs4 , v127
	.byte	W36
	.byte		        Cs5 
	.byte	W36
	.byte		N24   , Fs4 
	.byte	W24
@ 010   ----------------------------------------
	.byte		N72   , Gs4 
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte		N36   , Fs4 
	.byte	W36
	.byte		        Cs5 
	.byte	W36
	.byte		N24   , Gs4 
	.byte	W24
@ 014   ----------------------------------------
	.byte		N96   , As4 
	.byte	W96
@ 015   ----------------------------------------
	.byte		        Gs4 
	.byte	W96
	.byte	GOTO
	 .word	TheCertainPathToVictory_7_B1
TheCertainPathToVictory_7_B2:
@ 016   ----------------------------------------
	.byte	W72
	.byte	FINE

@**************** Track 8 (Midi-Chn.8) ****************@

TheCertainPathToVictory_8:
	.byte	KEYSH , TheCertainPathToVictory_key+0
TheCertainPathToVictory_8_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 127
	.byte		VOL   , 78*TheCertainPathToVictory_mvl/mxv
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		MODT  , 0
	.byte		LFOS  , 44
	.byte		PAN   , c_v+0
	.byte		N12   , Cn1 , v127
	.byte		N12   , En1 
	.byte		N12   , Fs1 
	.byte		N48   , Cs2 
	.byte	W24
	.byte		N12   , Cn1 
	.byte		N12   , Fs1 
	.byte	W24
	.byte		        Cn1 
	.byte		N12   , Fs1 
	.byte	W24
	.byte		        Cn1 
	.byte		N12   , En1 
	.byte		N12   , Fs1 
	.byte		N12   , En2 
	.byte	W12
	.byte		        Cn1 
	.byte		N12   , En1 
	.byte		N54   , Cs2 
	.byte	W12
@ 001   ----------------------------------------
TheCertainPathToVictory_8_001:
	.byte		N12   , Cn1 , v127
	.byte		N12   , Fs1 
	.byte	W24
	.byte		        Cn1 
	.byte		N12   , Fs1 
	.byte	W24
	.byte		        Cn1 
	.byte		N12   , Fs1 
	.byte	W12
	.byte		        En1 
	.byte		N12   , En2 
	.byte	W12
	.byte		        Cn1 
	.byte		N12   , Fs1 
	.byte	W12
	.byte		        En1 
	.byte		N60   , Cs2 
	.byte	W12
	.byte	PEND
@ 002   ----------------------------------------
TheCertainPathToVictory_8_002:
	.byte		N12   , Cn1 , v127
	.byte		N12   , Fs1 
	.byte	W24
	.byte		        Cn1 
	.byte		N12   , Fs1 
	.byte	W24
	.byte		        Cn1 
	.byte		N12   , Fs1 
	.byte	W24
	.byte		        Cn1 
	.byte		N12   , Fs1 
	.byte	W24
	.byte	PEND
@ 003   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_8_002
@ 004   ----------------------------------------
	.byte		N12   , Cn1 , v127
	.byte		N12   , En1 
	.byte		N12   , Fs1 
	.byte		N48   , Cs2 
	.byte	W24
	.byte		N12   , Cn1 
	.byte		N12   , Fs1 
	.byte	W24
	.byte		        Cn1 
	.byte		N12   , Fs1 
	.byte	W24
	.byte		        Cn1 
	.byte		N12   , En1 
	.byte		N12   , Fs1 
	.byte		N12   , En2 
	.byte	W12
	.byte		        Cn1 
	.byte		N12   , En1 
	.byte		N54   , Cs2 
	.byte	W12
@ 005   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_8_001
@ 006   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_8_002
@ 007   ----------------------------------------
	.byte		N12   , Cn1 , v127
	.byte		N12   , Fs1 
	.byte	W24
	.byte		        Cn1 
	.byte		N12   , Fs1 
	.byte	W24
	.byte		        Cn1 
	.byte		N12   , Fs1 
	.byte	W24
	.byte		        Cn1 
	.byte		N10   , En1 
	.byte		N12   , Fs1 
	.byte	W12
	.byte		N10   , En1 
	.byte	W12
@ 008   ----------------------------------------
TheCertainPathToVictory_8_008:
	.byte		N12   , Cn1 , v127
	.byte		N06   , Fs1 
	.byte		N48   , Cs2 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , En1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , En1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte	PEND
@ 009   ----------------------------------------
TheCertainPathToVictory_8_009:
	.byte		N12   , Cn1 , v127
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , En1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , En1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte	PEND
@ 010   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_8_009
@ 011   ----------------------------------------
	.byte		N12   , Cn1 , v127
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , En1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , En1 
	.byte		N06   , Fs1 
	.byte		N12   , En2 
	.byte	W12
	.byte		        Cn1 
	.byte		N06   , En1 
	.byte		N06   , Fs1 
	.byte	W06
	.byte		        En1 
	.byte	W06
@ 012   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_8_008
@ 013   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_8_009
@ 014   ----------------------------------------
	.byte	PATT
	 .word	TheCertainPathToVictory_8_009
@ 015   ----------------------------------------
	.byte		N12   , Cn1 , v127
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , En1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N12   , Cn1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte		N10   , En1 
	.byte		N06   , Fs1 
	.byte		N12   , En2 
	.byte	W12
	.byte		        Cn1 
	.byte		N10   , En1 
	.byte		N06   , Fs1 
	.byte	W12
	.byte	GOTO
	 .word	TheCertainPathToVictory_8_B1
TheCertainPathToVictory_8_B2:
@ 016   ----------------------------------------
	.byte		N12   , Cn1 , v127
	.byte		N12   , En1 
	.byte		N12   , Fs1 
	.byte		N48   , Cs2 
	.byte	W24
	.byte		N12   , Cn1 
	.byte		N12   , Fs1 
	.byte	W24
	.byte		        Cn1 
	.byte		N12   , Fs1 
	.byte	W24
	.byte	FINE

@******************************************************@
	.align	2

TheCertainPathToVictory:
	.byte	8	@ NumTrks
	.byte	0	@ NumBlks
	.byte	TheCertainPathToVictory_pri	@ Priority
	.byte	TheCertainPathToVictory_rev	@ Reverb.

	.word	TheCertainPathToVictory_grp

	.word	TheCertainPathToVictory_1
	.word	TheCertainPathToVictory_2
	.word	TheCertainPathToVictory_3
	.word	TheCertainPathToVictory_4
	.word	TheCertainPathToVictory_5
	.word	TheCertainPathToVictory_6
	.word	TheCertainPathToVictory_7
	.word	TheCertainPathToVictory_8

	.end
