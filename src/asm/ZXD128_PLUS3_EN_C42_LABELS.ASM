DDB_HEADER EQU 48585 
START_PALETTE EQU 48643 
VECT_EXTERN EQU 48659 
VECT_SFX EQU 48661 
VECT_INT EQU 48663 
VECT_0 EQU 48665 
VECT_1 EQU 48667 
VECT_2 EQU 48669 
VECT_3 EQU 48671 
VECT_4 EQU 48673 
VECT_5 EQU 48675 
VECT_6 EQU 48677 
VECT_7 EQU 48679 
VECT_8 EQU 48681 
VECT_9 EQU 48683 
START_DDB EQU 48685 
_core___START_PROGRAM EQU $6002
_core___CALL_BACK__ EQU $6018
_core_ZXBASIC_MEM_HEAP EQU $601A
_core_ZXBASIC_USER_DATA EQU $601A
__DdbVersion EQU $681A
__DdbCtl EQU $681B
__DdbNumObjDsc EQU $681C
__DdbNumLocDsc EQU $681D
__DdbNumUsrMsg EQU $681E
__DdbNumSysMsg EQU $681F
__DdbNumPrc EQU $6820
__DdbTokensPos EQU $6821
__DdbPrcLstPos EQU $6823
__DdbObjLstPos EQU $6825
__DdbLocLstPos EQU $6827
__DdbUsrMsgPos EQU $6829
__DdbSysMsgPos EQU $682B
__DdbConLstPos EQU $682D
__DdbVocPos EQU $682F
__DdbObjLocLst EQU $6831
__DdbObjNamePos EQU $6833
__DdbObjAttrPos EQU $6835
__DdbObjExtrPos EQU $6837
__DdbXmes0Pos EQU $6839
__DdbXmes1Pos EQU $683B
__DdbXmes2Pos EQU $683D
__DdbXmes3Pos EQU $683F
__DdbXmes0Bnk EQU $6841
__DdbXmes1Bnk EQU $6842
__DdbXmes2Bnk EQU $6843
__DdbXmes3Bnk EQU $6844
__DdbFntPos EQU $6845
__DdbImgIdxPos EQU $6847
__DdbObjBuffer EQU $6849
__DdbNumImgs EQU $684B
__DdbBnkObjDsc EQU $684C
__DdbBnkLocDsc EQU $684D
__DdbBnkUsrMsg EQU $684E
__DdbBnkSysMsg EQU $684F
__DdbBnkFnt EQU $6850
__DdbBnkImgIdx EQU $6851
__DdbCursor EQU $6852
__tmpTok EQU $6853
__cwinX EQU $6855
__cwinY EQU $6856
__cwinW EQU $6857
__cwinH EQU $6858
__ccursorX EQU $6859
__ccursorY EQU $685A
__cwinMode EQU $685B
__lastPicId EQU $685C
__lastPicLocation EQU $685E
__lastPicBank EQU $6860
__lastPicShow EQU $6861
__savedPosX EQU $6862
__savedPosY EQU $6863
__offsetText EQU $6864
__printedLines EQU $6865
__checkPrintedLinesinUse EQU $6866
__doingPrompt EQU $6867
__lastPrompt EQU $6868
__borderScr EQU $6869
__previousVerb EQU $686A
__tmpMsg EQU $686B
__ramSave EQU $686D
__objLocation EQU $686F
__objAttr EQU $6871
__objExtAttr2 EQU $6873
__objExtAttr1 EQU $6875
__objNounId EQU $6877
__objAdjetiveId EQU $6879
__currProc EQU $687B
__indirection EQU $687C
__isDone EQU $687D
__currCondact EQU $687E
__ePROC EQU $687F
__pPROC EQU $6881
__total EQU $6883
__addr EQU $6885
__ccVerb EQU $6887
__ccNoun EQU $6888
__ccAdjc EQU $6889
__objno EQU $688A
__locno EQU $688B
__flagno EQU $688C
__flagno2 EQU $688D
__cVerb EQU $688E
__cNoun EQU $688F
__c EQU $6890
__flags EQU $6891
__flags___DATA_____PTR__ EQU $6893
__flags___DATA__ EQU $6895
_LABEL___LABEL643 EQU $6A95
__winX EQU $6A98
__winX___DATA_____PTR__ EQU $6A9A
__winX___DATA__ EQU $6A9C
_LABEL___LABEL644 EQU $6AA4
__winY EQU $6AA7
__winY___DATA_____PTR__ EQU $6AA9
__winY___DATA__ EQU $6AAB
_LABEL___LABEL645 EQU $6AB3
__winW EQU $6AB6
__winW___DATA_____PTR__ EQU $6AB8
__winW___DATA__ EQU $6ABA
_LABEL___LABEL646 EQU $6AC2
__winH EQU $6AC5
__winH___DATA_____PTR__ EQU $6AC7
__winH___DATA__ EQU $6AC9
_LABEL___LABEL647 EQU $6AD1
__cursorX EQU $6AD4
__cursorX___DATA_____PTR__ EQU $6AD6
__cursorX___DATA__ EQU $6AD8
_LABEL___LABEL648 EQU $6AE0
__cursorY EQU $6AE3
__cursorY___DATA_____PTR__ EQU $6AE5
__cursorY___DATA__ EQU $6AE7
_LABEL___LABEL649 EQU $6AEF
__winMode EQU $6AF2
__winMode___DATA_____PTR__ EQU $6AF4
__winMode___DATA__ EQU $6AF6
_LABEL___LABEL650 EQU $6AFE
__winAttr EQU $6B01
__winAttr___DATA_____PTR__ EQU $6B03
__winAttr___DATA__ EQU $6B05
_LABEL___LABEL651 EQU $6B0D
__lsBuffer0 EQU $6B10
__lsBuffer0___DATA_____PTR__ EQU $6B12
__lsBuffer0___DATA__ EQU $6B14
_LABEL___LABEL652 EQU $6B47
__lsBuffer1 EQU $6B4A
__lsBuffer1___DATA_____PTR__ EQU $6B4C
__lsBuffer1___DATA__ EQU $6B4E
_LABEL___LABEL653 EQU $6B68
__numProc EQU $6B6B
__numProc___DATA_____PTR__ EQU $6B6D
__numProc___DATA__ EQU $6B6F
_LABEL___LABEL654 EQU $6B79
__entryIniProc EQU $6B7C
__entryIniProc___DATA_____PTR__ EQU $6B7E
__entryIniProc___DATA__ EQU $6B80
_LABEL___LABEL655 EQU $6B94
__entryProc EQU $6B97
__entryProc___DATA_____PTR__ EQU $6B99
__entryProc___DATA__ EQU $6B9B
_LABEL___LABEL656 EQU $6BAF
__condactIniProc EQU $6BB2
__condactIniProc___DATA_____PTR__ EQU $6BB4
__condactIniProc___DATA__ EQU $6BB6
_LABEL___LABEL657 EQU $6BCA
__condactProc EQU $6BCD
__condactProc___DATA_____PTR__ EQU $6BCF
__condactProc___DATA__ EQU $6BD1
_LABEL___LABEL658 EQU $6BE5
__entryDOALLProc EQU $6BE8
__entryDOALLProc___DATA_____PTR__ EQU $6BEA
__entryDOALLProc___DATA__ EQU $6BEC
_LABEL___LABEL659 EQU $6C00
__condactDOALLProc EQU $6C03
__condactDOALLProc___DATA_____PTR__ EQU $6C05
__condactDOALLProc___DATA__ EQU $6C07
_LABEL___LABEL660 EQU $6C1B
__continueEntryProc EQU $6C1E
__continueEntryProc___DATA_____PTR__ EQU $6C20
__continueEntryProc___DATA__ EQU $6C22
_LABEL___LABEL661 EQU $6C2C
__condactFlagList EQU $6C2F
__condactFlagList___DATA_____PTR__ EQU $6C31
__condactFlagList___DATA__ EQU $6C33
_LABEL___LABEL662 EQU $6CB3
_core_ZXBASIC_USER_DATA_END EQU $6CB6
_core___MAIN_PROGRAM__ EQU $6CB6
_LABEL___LABEL1 EQU $6CF2
_LABEL___LABEL2 EQU $6DE2
_LABEL___LABEL4 EQU $6DE8
_LABEL__NextCondact EQU $6DFE
_LABEL___LABEL6 EQU $6E18
_LABEL___LABEL586 EQU $6E32
_LABEL___LABEL8 EQU $6E36
_LABEL___LABEL11 EQU $6E87
_LABEL___LABEL587 EQU $6EEC
_LABEL___LABEL9 EQU $6EF0
_LABEL__condactAT EQU $6F02
_LABEL__condactNOTAT EQU $6F1F
_LABEL__condactATGT EQU $6F39
_LABEL__condactATLT EQU $6F56
_LABEL__condactPRESENT EQU $6F74
_LABEL__condactABSENT EQU $6FA1
_LABEL__condactWORN EQU $6FD1
_LABEL__condactNOTWORN EQU $6FEF
_LABEL__condactCARRIED EQU $700A
_LABEL__condactNOTCARR EQU $7028
_LABEL__condactCHANCE EQU $7043
_LABEL__condactZERO EQU $7073
_LABEL__condactNOTZERO EQU $709A
_LABEL__condactEQ EQU $70BE
_LABEL__condactGT EQU $70EC
_LABEL__condactLT EQU $7117
_LABEL__condactADJECT1 EQU $7143
_LABEL__condactADVERB EQU $7166
_LABEL__condactSFX EQU $7189
_LABEL___LABEL13 EQU $71E7
_LABEL___LABEL14 EQU $71EE
_LABEL__condactDESC EQU $7205
_LABEL__condactQUIT EQU $720F
_LABEL__condactEND EQU $7248
_LABEL__condactDONE EQU $724E
_LABEL__condactOK EQU $7254
_LABEL__condactANYKEY EQU $7260
_LABEL__condactSAVE EQU $7277
_LABEL__condactLOAD EQU $7281
_LABEL__condactDPRINT EQU $728B
_LABEL___LABEL588 EQU $72A2
_LABEL__condactDISPLAY EQU $72C3
_LABEL___LABEL15 EQU $72DC
_LABEL___LABEL16 EQU $72ED
_LABEL__condactCLS EQU $72F0
_LABEL__condactDROPALL EQU $72F6
_LABEL___LABEL19 EQU $72FB
_LABEL___LABEL21 EQU $732F
_LABEL__condactAUTOG EQU $7340
_LABEL___LABEL25 EQU $738A
_LABEL___LABEL28 EQU $739C
_LABEL___LABEL29 EQU $73AB
_LABEL__condactAUTOD EQU $73AE
_LABEL___LABEL30 EQU $73C3
_LABEL___LABEL31 EQU $73D2
_LABEL__condactAUTOW EQU $73D5
_LABEL___LABEL32 EQU $73EA
_LABEL___LABEL33 EQU $73F9
_LABEL__condactAUTOR EQU $73FC
_LABEL___LABEL35 EQU $7446
_LABEL___LABEL38 EQU $7458
_LABEL___LABEL39 EQU $7467
_LABEL__condactPAUSE EQU $746A
_LABEL___LABEL41 EQU $7483
_LABEL___LABEL42 EQU $748C
_LABEL___LABEL44 EQU $748D
_LABEL__condactSYNONYM EQU $749D
_LABEL___LABEL46 EQU $74AE
_LABEL___LABEL48 EQU $74BF
_LABEL__condactGOTO EQU $74C2
_LABEL__condactMESSAGE EQU $74CE
_LABEL__condactREMOVE EQU $74E1
_LABEL__condactGET EQU $74EE
_LABEL__condactDROP EQU $74FB
_LABEL__condactWEAR EQU $7508
_LABEL__condactDESTROY EQU $7515
_LABEL___LABEL590 EQU $7543
_LABEL___LABEL50 EQU $754E
_LABEL__condactCREATE EQU $755F
_LABEL___LABEL591 EQU $758D
_LABEL___LABEL52 EQU $7598
_LABEL__condactSWAP EQU $75AA
_LABEL__condactPLACE EQU $75F8
_LABEL___LABEL592 EQU $7626
_LABEL___LABEL54 EQU $762E
_LABEL___LABEL56 EQU $764F
_LABEL__condactSET EQU $7658
_LABEL__condactCLEAR EQU $766D
_LABEL__condactPLUS EQU $7682
_LABEL___LABEL58 EQU $76BB
_LABEL__condactMINUS EQU $76D1
_LABEL___LABEL59 EQU $76FC
_LABEL___LABEL60 EQU $7700
_LABEL__condactLET EQU $7714
_LABEL__condactNEWLINE EQU $7734
_LABEL__condactPRINT EQU $773D
_LABEL__condactSYSMESS EQU $7755
_LABEL__condactISAT EQU $775F
_LABEL___LABEL593 EQU $7799
_LABEL__condactSETCO EQU $77AE
_LABEL__condactSPACE EQU $77B8
_LABEL__condactHASAT EQU $77C1
_LABEL__condactHASNAT EQU $77CD
_LABEL__condactLISTOBJ EQU $77DA
_LABEL___LABEL62 EQU $77FD
_LABEL__condactEXTERN EQU $7800
_LABEL___LABEL65 EQU $7839
_LABEL___LABEL70 EQU $7851
_LABEL___LABEL67 EQU $7854
_LABEL___LABEL71 EQU $7865
_LABEL___LABEL73 EQU $7877
_LABEL___LABEL75 EQU $7886
_LABEL___LABEL77 EQU $78A1
_LABEL___LABEL80 EQU $7901
_LABEL___LABEL66 EQU $7904
_LABEL___LABEL81 EQU $7916
_LABEL___LABEL82 EQU $791E
_LABEL___LABEL84 EQU $792C
_LABEL__condactRAMSAVE EQU $7935
_LABEL__condactRAMLOAD EQU $794D
_LABEL__condactBEEP EQU $7970
_LABEL__condactPAPER EQU $7976
_LABEL__condactINK EQU $797F
_LABEL__condactBORDER EQU $7988
_LABEL__condactPREP EQU $7996
_LABEL__condactNOUN2 EQU $79B9
_LABEL__condactADJECT2 EQU $79DC
_LABEL__condactADD EQU $79FF
_LABEL___LABEL86 EQU $7A45
_LABEL__condactSUB EQU $7A5B
_LABEL___LABEL87 EQU $7A91
_LABEL___LABEL88 EQU $7A95
_LABEL__condactPARSE EQU $7AA9
_LABEL___LABEL89 EQU $7AC9
_LABEL___LABEL90 EQU $7ADF
_LABEL__condactLISTAT EQU $7AE6
_LABEL___LABEL94 EQU $7B08
_LABEL___LABEL91 EQU $7B0B
_LABEL___LABEL92 EQU $7B11
_LABEL__condactPROCESS EQU $7B14
_LABEL__condactSAME EQU $7B1E
_LABEL__condactMES EQU $7B5E
_LABEL__condactWINDOW EQU $7B68
_LABEL__condactNOTEQ EQU $7B8E
_LABEL__condactNOTSAME EQU $7BBF
_LABEL__condactMODE EQU $7BFC
_LABEL__condactWINAT EQU $7C0A
_LABEL__condactTIME EQU $7C2F
_LABEL__condactPICTURE EQU $7C4C
_LABEL__condactDOALL EQU $7C69
_LABEL___LABEL98 EQU $7C85
_LABEL__condactMOUSE EQU $7CF0
_LABEL__condactGFX EQU $7CF3
_LABEL__condactISNOTAT EQU $7CF6
_LABEL___LABEL594 EQU $7D33
_LABEL__condactWEIGH EQU $7D4B
_LABEL__condactPUTIN EQU $7D75
_LABEL__condactTAKEOUT EQU $7D8C
_LABEL__condactNEWTEXT EQU $7DA3
_LABEL__condactABILITY EQU $7DA9
_LABEL__condactWEIGHT EQU $7DB8
_LABEL__condactRANDOM EQU $7DD7
_LABEL__condactINPUT EQU $7DFB
_LABEL__condactSAVEAT EQU $7E30
_LABEL__condactBACKAT EQU $7E3F
_LABEL__condactPRINTAT EQU $7E4E
_LABEL___LABEL102 EQU $7E75
_LABEL__condactWHATO EQU $7E78
_LABEL___LABEL104 EQU $7E94
_LABEL__condactCALL EQU $7E9E
_LABEL___LABEL595 EQU $7EAC
_LABEL__condactPUTO EQU $7EEF
_LABEL___LABEL597 EQU $7F16
_LABEL___LABEL106 EQU $7F1E
_LABEL___LABEL108 EQU $7F3C
_LABEL__condactNOTDONE EQU $7F45
_LABEL___LABEL109 EQU $7F61
_LABEL___LABEL110 EQU $7F68
_LABEL__condactAUTOP EQU $7F6B
_LABEL___LABEL111 EQU $7F84
_LABEL___LABEL112 EQU $7F93
_LABEL__condactAUTOT EQU $7F96
_LABEL___LABEL114 EQU $7FFD
_LABEL___LABEL119 EQU $8013
_LABEL___LABEL121 EQU $804B
_LABEL___LABEL122 EQU $8051
_LABEL___LABEL120 EQU $8057
_LABEL__condactMOVE EQU $805A
_LABEL___LABEL125 EQU $8085
_LABEL___LABEL129 EQU $80A7
_LABEL___LABEL127 EQU $80B3
_LABEL___LABEL124 EQU $80BB
_LABEL__condactWINSIZE EQU $80CD
_LABEL__condactREDO EQU $80F2
_LABEL__condactCENTRE EQU $8151
_LABEL__condactEXIT EQU $8191
_LABEL___LABEL131 EQU $819B
_LABEL__condactINKEY EQU $81A7
_LABEL___LABEL133 EQU $81BB
_LABEL__condactBIGGER EQU $81D1
_LABEL__condactSMALLER EQU $8210
_LABEL__condactISDONE EQU $824E
_LABEL__condactISNDONE EQU $8262
_LABEL__condactSKIP EQU $827B
_LABEL__condactRESTART EQU $8285
_LABEL__condactTAB EQU $828B
_LABEL___LABEL135 EQU $829D
_LABEL__condactCOPYOF EQU $82A0
_LABEL__condactCOPYOO EQU $82C3
_LABEL__condactCOPYFO EQU $82F0
_LABEL___LABEL137 EQU $8321
_LABEL__condactCOPYFF EQU $8324
_LABEL__condactCOPYBF EQU $8351
_LABEL__condactRESET EQU $837B
_LABEL__condactNOT_USED EQU $8381
_FlagsPtr EQU $8387
_IntVectorPtr EQU $8389
_ISR EQU $838B
_EndISR EQU $83B7
_IMvect EQU $8400
_core___END_PROGRAM EQU $8505
__WinScrollUp EQU $8513
__WinScrollUp__leave EQU $85A3
__allocate EQU $85A4
__allocate__leave EQU $85A9
__callocate EQU $85AA
__callocate__leave EQU $85AF
__deallocate EQU $85B0
__deallocate__leave EQU $85B3
__MemMove EQU $85B4
__MemMove__leave EQU $85BF
__MemCopy EQU $85C0
__MemCopy__leave EQU $85CA
__MemSet EQU $85CB
__MemSet__leave EQU $85D9
__InitPlus3Disc EQU $85DA
__InitPlus3Disc__leave EQU $8602
__Plus3DOSOpen EQU $8603
__Plus3DOSOpen__leave EQU $8643
__Plus3DOSClose EQU $8650
__Plus3DOSClose__leave EQU $868B
__Plus3DOSRead EQU $8694
__Plus3DOSRead__leave EQU $86DF
__Plus3DOSWrite EQU $86EB
__Plus3DOSWrite__leave EQU $8736
__Rand EQU $8742
__Rand__leave EQU $875B
__SetRAMBank EQU $875C
__SetRAMBank__leave EQU $8771
__resetSys EQU $8772
__resetSys__leave EQU $8781
__memAlloc EQU $8782
_LABEL___LABEL139 EQU $87A9
__memAlloc__leave EQU $87AF
__ToUpper EQU $87B8
_LABEL___LABEL598 EQU $87D5
_LABEL___LABEL141 EQU $87E3
__ToUpper__leave EQU $87E6
__ToLower EQU $87EF
_LABEL___LABEL599 EQU $880C
_LABEL___LABEL143 EQU $881A
__ToLower__leave EQU $881D
__strcmp EQU $8826
_LABEL___LABEL144 EQU $8835
_LABEL___LABEL148 EQU $8854
_LABEL___LABEL150 EQU $8862
_LABEL___LABEL146 EQU $887F
__strcmp__leave EQU $8889
__DecompressPicture EQU $8894
_dzx0_standard_dcp EQU $894C
_dzx0s_dcp_literals EQU $8957
_dzx0s_dcp_copy EQU $8963
_dzx0s_dcp_new_offset EQU $896E
_dzx0s_dcp_elias EQU $8987
_dzx0s_dcp_elias_loop EQU $8988
_dzx0s_dcp_elias_skip EQU $898E
_dzx0s_dcp_elias_backtrack EQU $898F
_dzx0s_ldir_line EQU $8996
_dzx0s_next_iteration EQU $8997
_dzx0s_ldir_line_back EQU $89AA
_dzx0s_next_iteration_back EQU $89AB
_ConvHLDEToScreenAddress EQU $89C0
_ConvDEToScreenAddress EQU $89D8
_dzx0_standard EQU $89F1
_dzx0s_literals EQU $89F8
_dzx0s_copy EQU $8A03
_dzx0s_new_offset EQU $8A0D
_dzx0s_elias EQU $8A26
_dzx0s_elias_loop EQU $8A27
_dzx0s_elias_skip EQU $8A2D
_dzx0s_elias_backtrack EQU $8A2E
__DecompressPicture__leave EQU $8A35
__loadXPicture EQU $8A36
_LABEL___LABEL152 EQU $8A59
_LABEL___LABEL156 EQU $8A66
_LABEL___LABEL153 EQU $8A8F
_LABEL__XpicturePlus3 EQU $8AA3
_LABEL__ErrorloadXpicture EQU $8B3B
_LABEL__ErrorloadXpicture2 EQU $8B42
_LABEL__XpictureFilename EQU $8B52
__loadXPicture__leave EQU $8B5A
__showBufferedPicture EQU $8B63
_LABEL___LABEL165 EQU $8B83
__showBufferedPicture__leave EQU $8B9A
__WaitForKey EQU $8B9F
_LABEL___LABEL168 EQU $8BA3
__WaitForKey__leave EQU $8BAA
__clearBox EQU $8BAB
_BLPaintHeightExitLoop EQU $8C06
__clearBox__leave EQU $8C41
__putGlyph42 EQU $8C4D
__putGlyph42__leave EQU $8CB7
__setFrames EQU $8CB8
__setFrames__leave EQU $8CBD
__waitForTimeout EQU $8CBE
_LABEL___LABEL171 EQU $8D08
_LABEL___LABEL173 EQU $8D28
_LABEL___LABEL169 EQU $8D32
_LABEL___LABEL170 EQU $8D35
__waitForTimeout__leave EQU $8D36
__popCurrentWindow EQU $8D3F
__popCurrentWindow__leave EQU $8DCF
__pushCurrentWindow EQU $8DD8
__pushCurrentWindow__leave EQU $8E68
__GetCharAddress EQU $8E71
_LABEL___LABEL177 EQU $8EAB
__GetCharAddress__leave EQU $8EB1
__PRIVATEconvertCoords42 EQU $8EBA
_LABEL___LABEL179 EQU $8F16
__PRIVATEconvertCoords42__leave EQU $8F2D
__clearCurrentLine EQU $8F37
_LABEL___LABEL180 EQU $8F70
_LABEL___LABEL182 EQU $8F87
__clearCurrentLine__leave EQU $8F98
__scrollUp EQU $8F9D
_LABEL___LABEL183 EQU $900E
_LABEL___LABEL185 EQU $9025
__scrollUp__leave EQU $9036
__checkPrintedLines EQU $903B
_LABEL___LABEL195 EQU $9087
_LABEL___LABEL193 EQU $90D9
__checkPrintedLines__leave EQU $90DD
__printChar EQU $90E2
_LABEL___LABEL196 EQU $90FD
_LABEL___LABEL198 EQU $910F
_LABEL___LABEL200 EQU $911F
_LABEL___LABEL202 EQU $912E
_LABEL___LABEL204 EQU $9147
_LABEL___LABEL205 EQU $918C
__printChar__leave EQU $919E
__printOutMsg EQU $91A7
_LABEL___LABEL212 EQU $91E0
_LABEL___LABEL217 EQU $9209
_LABEL___LABEL218 EQU $923C
_LABEL___LABEL229 EQU $927E
_LABEL___LABEL216 EQU $9284
_LABEL___LABEL600 EQU $92B1
_LABEL___LABEL232 EQU $92C0
_LABEL___LABEL214 EQU $92D1
__printOutMsg__leave EQU $92D8
__errorCode EQU $92E1
_LABEL___LABEL233 EQU $92FF
_LABEL__ErrorCodeText EQU $9302
__errorCode__leave EQU $930F
__getToken EQU $9318
__getToken__leave EQU $9337
__printMsg EQU $9338
_LABEL___LABEL235 EQU $9351
_LABEL___LABEL240 EQU $9389
_LABEL___LABEL244 EQU $93D2
_LABEL___LABEL242 EQU $93E3
_LABEL___LABEL238 EQU $93ED
_LABEL___LABEL248 EQU $9413
_LABEL___LABEL254 EQU $9447
_LABEL___LABEL237 EQU $9466
__printMsg__leave EQU $946E
__getSizeMessage EQU $9478
__getSizeMessage__leave EQU $9485
__getMessage EQU $9486
__getMessage__leave EQU $9509
__getSystemMsg EQU $9515
__getSystemMsg__leave EQU $9537
__printSystemMsg EQU $9540
__printSystemMsg__leave EQU $9563
__printUserMsg EQU $956C
_LABEL___LABEL262 EQU $9583
__printUserMsg__leave EQU $9595
__printLocationMsg EQU $959E
_LABEL___LABEL264 EQU $95B5
__printLocationMsg__leave EQU $95C7
__printMaluvaExtraMsg EQU $95D0
_LABEL___LABEL601 EQU $95EC
_LABEL___LABEL602 EQU $9605
_LABEL___LABEL265 EQU $9634
_LABEL___LABEL267 EQU $964E
_LABEL___LABEL269 EQU $9667
_LABEL___LABEL266 EQU $9676
_LABEL___LABEL272 EQU $968A
__printMaluvaExtraMsg__leave EQU $96F9
__cutMsgUntilDot EQU $9704
__cutMsgUntilDot__leave EQU $9718
__skipSpaces EQU $9719
__skipSpaces__leave EQU $9721
__findEndOfWord EQU $9722
__findEndOfWord__leave EQU $9732
__printObjectMsgModif EQU $9733
__printObjectMsgModif__leave EQU $9786
__printObjectMsg EQU $9790
_LABEL___LABEL276 EQU $97AA
_LABEL___LABEL277 EQU $97E2
_LABEL___LABEL278 EQU $97EB
__printObjectMsg__leave EQU $97F5
__printBase10 EQU $97FF
_LABEL___LABEL280 EQU $9823
__printBase10__leave EQU $9843
__getObjectId EQU $984C
_LABEL___LABEL282 EQU $9864
_LABEL___LABEL286 EQU $9871
_LABEL___LABEL604 EQU $988F
_LABEL___LABEL605 EQU $98B3
_LABEL___LABEL291 EQU $98C5
_LABEL___LABEL287 EQU $98DD
_LABEL___LABEL283 EQU $98E0
__getObjectId__leave EQU $98ED
__getObjectWeight EQU $98F8
_LABEL___LABEL295 EQU $9911
_LABEL___LABEL299 EQU $9918
_LABEL___LABEL606 EQU $9973
_LABEL___LABEL607 EQU $9989
_LABEL___LABEL310 EQU $9994
_LABEL___LABEL311 EQU $99C0
_LABEL___LABEL307 EQU $99C3
_LABEL___LABEL306 EQU $99CE
_LABEL___LABEL300 EQU $99E6
_LABEL___LABEL296 EQU $99E9
_LABEL___LABEL315 EQU $9A09
__getObjectWeight__leave EQU $9A10
__referencedObject EQU $9A19
_LABEL___LABEL316 EQU $9A95
__referencedObject__leave EQU $9AA8
__initObjects EQU $9AB1
_LABEL___LABEL318 EQU $9B3A
_LABEL___LABEL322 EQU $9B49
_LABEL___LABEL320 EQU $9C21
__initObjects__leave EQU $9C3C
__PutInputEcho EQU $9C41
_LABEL___LABEL323 EQU $9C83
__PutInputEcho__leave EQU $9C8A
__prompt EQU $9C94
_LABEL___LABEL326 EQU $9CB8
_LABEL___LABEL331 EQU $9CD2
_LABEL___LABEL330 EQU $9CE4
_LABEL___LABEL328 EQU $9CF1
_LABEL___LABEL334 EQU $9D12
_LABEL___LABEL338 EQU $9D32
_LABEL___LABEL341 EQU $9D35
_LABEL___LABEL343 EQU $9D36
_LABEL___LABEL608 EQU $9D7F
_LABEL___LABEL345 EQU $9D8A
_LABEL___LABEL350 EQU $9DC9
_LABEL___LABEL351 EQU $9DD4
_LABEL___LABEL346 EQU $9DE1
_LABEL___LABEL357 EQU $9E1D
_LABEL___LABEL359 EQU $9E38
_LABEL___LABEL336 EQU $9E55
_LABEL__retContinue EQU $9E66
_LABEL___LABEL361 EQU $9E74
_LABEL___LABEL363 EQU $9EAE
_LABEL___LABEL365 EQU $9EC7
__prompt__leave EQU $9ECB
__clearLogicalSentences EQU $9ED4
__clearLogicalSentences__leave EQU $9EF1
__populateLogicalSentence EQU $9EF2
_LABEL___LABEL366 EQU $9F33
_LABEL___LABEL609 EQU $9F7B
_LABEL___LABEL610 EQU $9F88
_LABEL___LABEL375 EQU $9F99
_LABEL___LABEL611 EQU $9FAE
_LABEL___LABEL377 EQU $9FBB
_LABEL___LABEL612 EQU $9FD2
_LABEL___LABEL613 EQU $9FDF
_LABEL___LABEL379 EQU $9FEA
_LABEL___LABEL614 EQU $A001
_LABEL___LABEL615 EQU $A00E
_LABEL___LABEL381 EQU $A01B
_LABEL___LABEL616 EQU $A032
_LABEL___LABEL383 EQU $A043
_LABEL___LABEL617 EQU $A059
_LABEL___LABEL385 EQU $A066
_LABEL___LABEL618 EQU $A07D
_LABEL___LABEL387 EQU $A08A
_LABEL___LABEL619 EQU $A0A1
_LABEL___LABEL620 EQU $A0B0
_LABEL___LABEL389 EQU $A0BD
_LABEL___LABEL621 EQU $A0D4
_LABEL___LABEL622 EQU $A0E3
_LABEL___LABEL376 EQU $A0ED
_LABEL___LABEL368 EQU $A0F5
_LABEL___LABEL367 EQU $A0FD
_LABEL___LABEL623 EQU $A124
_LABEL___LABEL624 EQU $A131
_LABEL___LABEL394 EQU $A13E
_LABEL___LABEL625 EQU $A152
_LABEL___LABEL626 EQU $A15E
_LABEL___LABEL398 EQU $A16B
_LABEL___LABEL627 EQU $A17E
_LABEL___LABEL400 EQU $A18E
_LABEL___LABEL628 EQU $A19D
_LABEL___LABEL402 EQU $A1AD
_LABEL___LABEL405 EQU $A210
_LABEL___LABEL404 EQU $A222
_LABEL__nextLogicalSentence EQU $A230
_LABEL___LABEL629 EQU $A23D
_LABEL___LABEL630 EQU $A256
_LABEL___LABEL410 EQU $A262
_LABEL___LABEL412 EQU $A28A
__populateLogicalSentence__leave EQU $A2B5
__checkWordVoc EQU $A2BE
_LABEL___LABEL414 EQU $A2ED
_LABEL___LABEL418 EQU $A32B
_LABEL___LABEL415 EQU $A356
_LABEL___LABEL420 EQU $A36E
_LABEL___LABEL424 EQU $A3B5
_LABEL___LABEL422 EQU $A3C9
__checkWordVoc__leave EQU $A3D1
__isSeparator EQU $A3EA
__isSeparator__leave EQU $A3FF
__parser EQU $A400
_LABEL___LABEL425 EQU $A441
_LABEL___LABEL430 EQU $A471
_LABEL___LABEL431 EQU $A485
_LABEL___LABEL428 EQU $A488
_LABEL___LABEL432 EQU $A4AA
_LABEL___LABEL436 EQU $A4C5
_LABEL___LABEL438 EQU $A4F0
_LABEL___LABEL437 EQU $A4F7
_LABEL___LABEL446 EQU $A542
_LABEL___LABEL429 EQU $A557
_LABEL___LABEL427 EQU $A568
_LABEL__pronominalsString EQU $A572
__parser__leave EQU $A580
__getLogicalSentence EQU $A585
_LABEL___LABEL448 EQU $A595
__getLogicalSentence__leave EQU $A59A
__useLiteralSentence EQU $A59B
__useLiteralSentence__leave EQU $A5B4
__doCLS EQU $A5B5
__doCLS__leave EQU $A5E4
__pushPROC EQU $A5E5
_LABEL___LABEL450 EQU $A604
_LABEL___LABEL452 EQU $A613
__pushPROC__leave EQU $A695
__popPROC EQU $A69E
_LABEL___LABEL454 EQU $A730
__popPROC__leave EQU $A739
__stepPROCEntryCondacts EQU $A73A
__stepPROCEntryCondacts__leave EQU $A781
__getCondOrValueAndInc EQU $A78A
__getCondOrValueAndInc__leave EQU $A7C5
__getValueOrIndirection EQU $A7CA
_LABEL___LABEL456 EQU $A7F5
__getValueOrIndirection__leave EQU $A7F8
__PRIVATETapeOp EQU $A7FD
_core___ERROR EQU $A81C
_core___ERROR_CODE EQU $A820
_core___STOP EQU $A822
_core___MEM_INIT EQU $A826
_core___MEM_INIT2 EQU $A82C
_core_MEM_FREE EQU $A84A
_core___MEM_FREE EQU $A84A
_LOAD_CODE EQU $A89C
_core___LOAD_CODE EQU $A8A2
_core_LD_TYPE EQU $A920
_core_LOAD_ERROR EQU $A970
_SAVE_CODE EQU $A98E
_core___SAVE_CODE EQU $A995
__PRIVATETapeOp__leave EQU $AA46
__PRIVATESaveOption EQU $AA47
_LABEL___LABEL457 EQU $AA5C
_LABEL___LABEL458 EQU $AA68
_LABEL___LABEL462 EQU $AA98
_LABEL___LABEL464 EQU $AAAD
__PRIVATESaveOption__leave EQU $AAAE
__PRIVATEGetFilename EQU $AAB7
__PRIVATEGetFilename__leave EQU $AB02
__PRIVATEPrepareDiscFilename EQU $AB07
__PRIVATEPrepareDiscFilename__leave EQU $AB24
__PRIVATEDoSAVE EQU $AB25
_LABEL___LABEL467 EQU $ABBB
_LABEL___LABEL469 EQU $ABE1
_LABEL___LABEL470 EQU $AC17
_LABEL___LABEL468 EQU $AC20
_LABEL___LABEL472 EQU $AC39
__PRIVATEDoSAVE__leave EQU $AC4F
__PRIVATEDoLOAD EQU $AC58
_LABEL___LABEL478 EQU $ACED
_LABEL___LABEL475 EQU $ACF0
_LABEL___LABEL479 EQU $AD15
_LABEL___LABEL480 EQU $AD4B
_LABEL___LABEL476 EQU $AD54
_LABEL___LABEL481 EQU $AD6B
_LABEL___LABEL482 EQU $AD7F
__PRIVATEDoLOAD__leave EQU $AD88
__PRIVATEDoRESET EQU $AD91
__PRIVATEDoRESET__leave EQU $AD94
_LABEL___LABEL485 EQU $AD95
__PRIVATEDoRESTART EQU $AD95
__PRIVATEDoRESTART__leave EQU $ADB0
__PRIVATEDoEND EQU $ADB1
_LABEL___LABEL487 EQU $ADE6
__PRIVATEDoEND__leave EQU $ADEF
__PRIVATEGetObjectLocParam EQU $ADF4
__PRIVATEGetObjectLocParam__leave EQU $AE12
__PRIVATEDoALL EQU $AE17
_LABEL___LABEL489 EQU $AE68
_LABEL___LABEL491 EQU $AE76
_LABEL___LABEL492 EQU $AE79
_LABEL___LABEL494 EQU $AE9F
_LABEL___LABEL632 EQU $AEDC
__PRIVATEDoALL__leave EQU $AF4E
__PRIVATEDoDONE EQU $AF53
_LABEL___LABEL497 EQU $AF6F
__PRIVATEDoDONE__leave EQU $AF77
__PRIVATEDoLISTAT EQU $AF78
_LABEL___LABEL502 EQU $AFB1
_LABEL___LABEL634 EQU $AFF5
_LABEL___LABEL509 EQU $B00C
_LABEL___LABEL635 EQU $B018
_LABEL___LABEL514 EQU $B03A
_LABEL___LABEL513 EQU $B040
_LABEL___LABEL517 EQU $B058
_LABEL___LABEL507 EQU $B060
_LABEL___LABEL503 EQU $B067
_LABEL___LABEL499 EQU $B074
__PRIVATEDoLISTAT__leave EQU $B08E
__PRIVATEDoHASAT EQU $B098
_LABEL___LABEL636 EQU $B0B0
_LABEL___LABEL637 EQU $B0B3
_LABEL___LABEL519 EQU $B0E4
__PRIVATEDoHASAT__leave EQU $B0F7
__PRIVATEDoWEAR EQU $B101
_LABEL___LABEL520 EQU $B14B
_LABEL___LABEL522 EQU $B15C
_LABEL___LABEL524 EQU $B16D
_LABEL___LABEL526 EQU $B17E
_LABEL___LABEL529 EQU $B1A0
_LABEL___LABEL521 EQU $B1A3
__PRIVATEDoWEAR__leave EQU $B1A9
__PRIVATEDoREMOVE EQU $B1B2
_LABEL___LABEL530 EQU $B215
_LABEL___LABEL638 EQU $B227
_LABEL___LABEL532 EQU $B234
_LABEL___LABEL534 EQU $B245
_LABEL___LABEL536 EQU $B258
_LABEL___LABEL531 EQU $B276
__PRIVATEDoREMOVE__leave EQU $B27C
__PRIVATEDoGET EQU $B285
_LABEL___LABEL538 EQU $B2C9
_LABEL___LABEL540 EQU $B2DC
_LABEL___LABEL542 EQU $B2FE
_LABEL___LABEL544 EQU $B324
_LABEL___LABEL539 EQU $B342
__PRIVATEDoGET__leave EQU $B348
__PRIVATEDoDROP EQU $B351
_LABEL___LABEL549 EQU $B3AA
_LABEL___LABEL546 EQU $B3AD
_LABEL___LABEL550 EQU $B3BE
_LABEL___LABEL552 EQU $B3D0
_LABEL___LABEL547 EQU $B3D6
__PRIVATEDoDROP__leave EQU $B3DC
__PRIVATEDoPUTIN EQU $B3E5
_LABEL___LABEL554 EQU $B424
_LABEL___LABEL556 EQU $B436
_LABEL___LABEL639 EQU $B448
_LABEL___LABEL558 EQU $B455
_LABEL___LABEL561 EQU $B472
_LABEL___LABEL555 EQU $B491
__PRIVATEDoPUTIN__leave EQU $B497
__PRIVATEDoTAKEOUT EQU $B4A1
_LABEL___LABEL562 EQU $B4ED
_LABEL___LABEL564 EQU $B514
_LABEL___LABEL640 EQU $B527
_LABEL___LABEL566 EQU $B549
_LABEL___LABEL641 EQU $B55A
_LABEL___LABEL642 EQU $B578
_LABEL___LABEL568 EQU $B585
_LABEL___LABEL570 EQU $B5AB
_LABEL___LABEL563 EQU $B5C9
__PRIVATEDoTAKEOUT__leave EQU $B5CF
__PRIVATEAutoEND EQU $B5D9
_LABEL___LABEL572 EQU $B610
__PRIVATEAutoEND__leave EQU $B617
__PRIVATEcheckLocCARRWORNHERE EQU $B621
_LABEL___LABEL575 EQU $B679
__PRIVATEcheckLocCARRWORNHERE__leave EQU $B67C
__PRIVATEwindowCheck EQU $B681
_LABEL___LABEL579 EQU $B6B7
__PRIVATEwindowCheck__leave EQU $B6CC
__PRIVATEDoBEEP EQU $B6CD
__PRIVATEDoBEEP__leave EQU $B734
__PRIVATEGetColor EQU $B739
_LABEL___LABEL583 EQU $B769
_LABEL___LABEL585 EQU $B775
__PRIVATEGetColor__leave EQU $B786
__initFlags EQU $B78B
__initFlags__leave EQU $B811
__doCALL EQU $B812
__doCALL__leave EQU $B82C
__jumpToBank EQU $B82D
__jumpToBank__leave EQU $B843
__setupIM EQU $B844
__setupIM__leave EQU $B86B
__GetCurrentContact EQU $B86C
__GetCurrentContact__leave EQU $B8AA
_LABEL___LABEL7 EQU $B8AF
_core_SP_PixelDown EQU $B9B0
_core_SCREEN_ADDR EQU $B9D8
_core_SCREEN_ATTR_ADDR EQU $B9DA
_core_SP_PixelUp EQU $B9DC
_core_MEM_ALLOC EQU $B9FF
_core___MEM_ALLOC EQU $B9FF
_core___MUL16 EQU $BA4E
_core___ARRAY_PTR EQU $BA63
_core___ARRAY EQU $BA67
_core___MEM_CALLOC EQU $BABC
_core___ALLOC_LOCAL_ARRAY EQU $BAD2
_core___ALLOC_INITIALIZED_LOCAL_ARRAY EQU $BAE6
_core___BAND16 EQU $BAF5
_core___FPSTACK_PUSH2 EQU $BAFC
_core___FPSTACK_I16 EQU $BB0D
_core_BEEP EQU $BB18
_core___BOR16 EQU $BB2B
_core_BRIGHT EQU $BB32
_core___SET_BRIGHT EQU $BB35
_core_BRIGHT_TMP EQU $BB4C
_core_CLS EQU $BB51
_core___ABS16 EQU $BB80
_core___NEGHL EQU $BB83
_core___DIVU16 EQU $BB8B
_core___DIVU16_FAST EQU $BB8B
_core___DIV16LOOP EQU $BB92
_core___DIV16NOADD EQU $BB9D
_core___MODU16 EQU $BBA3
_core___DIVI16 EQU $BBA8
_core___DIVI16_FAST EQU $BBA8
_core___DIVI16A EQU $BBB6
_core___DIVI16B EQU $BBBB
_core___MODI16 EQU $BBC4
_core___DIVU8 EQU $BBC9
_core___DIVU8_FAST EQU $BBCB
_core___DIV8LOOP EQU $BBD0
_core___DIV8NOSUB EQU $BBD8
_core___DIVI8 EQU $BBDD
_core___DIVI8_FAST EQU $BBDF
_core___DIV8A EQU $BBE7
_core___DIV8B EQU $BBF0
_core___MODU8 EQU $BBFB
_core___MODU8_FAST EQU $BBFD
_core___MODI8 EQU $BC02
_core___MODI8_FAST EQU $BC04
_core___EQ16 EQU $BC09
_core_FLASH EQU $BC0F
_core___SET_FLASH EQU $BC12
_core_FLASH_TMP EQU $BC29
_core_INK EQU $BC2E
_core_INK_TMP EQU $BC49
_core___SUB32 EQU $BC4F
_core___LEI32 EQU $BC63
_core___LEI8 EQU $BC80
_core___LTI EQU $BC86
_core___MEMCPY EQU $BC90
_core___MULF EQU $BCA9
_core___ON_GOSUB EQU $BCB2
_core___ON_GOTO EQU $BCB8
_core___ON_GOTO_START EQU $BCBA
_core_PAPER EQU $BCCA
_core_PAPER_TMP EQU $BCE8
_core___ILOADF EQU $BCEE
_core___LOADF EQU $BCF2
_core___PLOADF EQU $BCFC
_core___PISTOREF EQU $BD03
_core___ISTOREF EQU $BD0A
_core___STOREF EQU $BD10
_core___PSTOREF EQU $BD1A
_core___REALLOC EQU $BD24
_core___SHRL32 EQU $BD58
_core___ABS32 EQU $BD61
_core___NEG32 EQU $BD64
_core___I8TOFREG EQU $BD76
_core___I32TOFREG EQU $BD7C
_core___U8TOFREG EQU $BD8A
_core___U32TOFREG EQU $BD8F
_core___U32TOFREG_LOOP EQU $BDA3
_LABEL___LABEL631 EQU $BDC5
_LABEL___LABEL633 EQU $BDC8
