DDB_HEADER EQU 48535 
START_PALETTE EQU 48593 
VECT_EXTERN EQU 48609 
VECT_SFX EQU 48611 
VECT_INT EQU 48613 
VECT_0 EQU 48615 
VECT_1 EQU 48617 
VECT_2 EQU 48619 
VECT_3 EQU 48621 
VECT_4 EQU 48623 
VECT_5 EQU 48625 
VECT_6 EQU 48627 
VECT_7 EQU 48629 
VECT_8 EQU 48631 
VECT_9 EQU 48633 
START_DDB EQU 48635 
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
_LABEL___LABEL664 EQU $6A95
__winX EQU $6A98
__winX___DATA_____PTR__ EQU $6A9A
__winX___DATA__ EQU $6A9C
_LABEL___LABEL665 EQU $6AA4
__winY EQU $6AA7
__winY___DATA_____PTR__ EQU $6AA9
__winY___DATA__ EQU $6AAB
_LABEL___LABEL666 EQU $6AB3
__winW EQU $6AB6
__winW___DATA_____PTR__ EQU $6AB8
__winW___DATA__ EQU $6ABA
_LABEL___LABEL667 EQU $6AC2
__winH EQU $6AC5
__winH___DATA_____PTR__ EQU $6AC7
__winH___DATA__ EQU $6AC9
_LABEL___LABEL668 EQU $6AD1
__cursorX EQU $6AD4
__cursorX___DATA_____PTR__ EQU $6AD6
__cursorX___DATA__ EQU $6AD8
_LABEL___LABEL669 EQU $6AE0
__cursorY EQU $6AE3
__cursorY___DATA_____PTR__ EQU $6AE5
__cursorY___DATA__ EQU $6AE7
_LABEL___LABEL670 EQU $6AEF
__winMode EQU $6AF2
__winMode___DATA_____PTR__ EQU $6AF4
__winMode___DATA__ EQU $6AF6
_LABEL___LABEL671 EQU $6AFE
__winAttr EQU $6B01
__winAttr___DATA_____PTR__ EQU $6B03
__winAttr___DATA__ EQU $6B05
_LABEL___LABEL672 EQU $6B0D
__lsBuffer0 EQU $6B10
__lsBuffer0___DATA_____PTR__ EQU $6B12
__lsBuffer0___DATA__ EQU $6B14
_LABEL___LABEL673 EQU $6B47
__lsBuffer1 EQU $6B4A
__lsBuffer1___DATA_____PTR__ EQU $6B4C
__lsBuffer1___DATA__ EQU $6B4E
_LABEL___LABEL674 EQU $6B68
__numProc EQU $6B6B
__numProc___DATA_____PTR__ EQU $6B6D
__numProc___DATA__ EQU $6B6F
_LABEL___LABEL675 EQU $6B79
__entryIniProc EQU $6B7C
__entryIniProc___DATA_____PTR__ EQU $6B7E
__entryIniProc___DATA__ EQU $6B80
_LABEL___LABEL676 EQU $6B94
__entryProc EQU $6B97
__entryProc___DATA_____PTR__ EQU $6B99
__entryProc___DATA__ EQU $6B9B
_LABEL___LABEL677 EQU $6BAF
__condactIniProc EQU $6BB2
__condactIniProc___DATA_____PTR__ EQU $6BB4
__condactIniProc___DATA__ EQU $6BB6
_LABEL___LABEL678 EQU $6BCA
__condactProc EQU $6BCD
__condactProc___DATA_____PTR__ EQU $6BCF
__condactProc___DATA__ EQU $6BD1
_LABEL___LABEL679 EQU $6BE5
__entryDOALLProc EQU $6BE8
__entryDOALLProc___DATA_____PTR__ EQU $6BEA
__entryDOALLProc___DATA__ EQU $6BEC
_LABEL___LABEL680 EQU $6C00
__condactDOALLProc EQU $6C03
__condactDOALLProc___DATA_____PTR__ EQU $6C05
__condactDOALLProc___DATA__ EQU $6C07
_LABEL___LABEL681 EQU $6C1B
__nobjDOALLProc EQU $6C1E
__nobjDOALLProc___DATA_____PTR__ EQU $6C20
__nobjDOALLProc___DATA__ EQU $6C22
_LABEL___LABEL682 EQU $6C2C
__continueEntryProc EQU $6C2F
__continueEntryProc___DATA_____PTR__ EQU $6C31
__continueEntryProc___DATA__ EQU $6C33
_LABEL___LABEL683 EQU $6C3D
__condactFlagList EQU $6C40
__condactFlagList___DATA_____PTR__ EQU $6C42
__condactFlagList___DATA__ EQU $6C44
_LABEL___LABEL684 EQU $6CC4
_core_ZXBASIC_USER_DATA_END EQU $6CC7
_core___MAIN_PROGRAM__ EQU $6CC7
_LABEL___LABEL1 EQU $6D15
_LABEL___LABEL2 EQU $6E11
_LABEL___LABEL4 EQU $6E17
_LABEL__NextCondact EQU $6E2D
_LABEL___LABEL6 EQU $6E47
_LABEL___LABEL607 EQU $6E61
_LABEL___LABEL8 EQU $6E65
_LABEL___LABEL11 EQU $6EB6
_LABEL___LABEL608 EQU $6F1B
_LABEL___LABEL9 EQU $6F1F
_LABEL__condactAT EQU $6F31
_LABEL__condactNOTAT EQU $6F4E
_LABEL__condactATGT EQU $6F68
_LABEL__condactATLT EQU $6F85
_LABEL__condactPRESENT EQU $6FA3
_LABEL__condactABSENT EQU $6FD0
_LABEL__condactWORN EQU $7000
_LABEL__condactNOTWORN EQU $701E
_LABEL__condactCARRIED EQU $7039
_LABEL__condactNOTCARR EQU $7057
_LABEL__condactCHANCE EQU $7072
_LABEL__condactZERO EQU $70A2
_LABEL__condactNOTZERO EQU $70C9
_LABEL__condactEQ EQU $70ED
_LABEL__condactGT EQU $711B
_LABEL__condactLT EQU $7146
_LABEL__condactADJECT1 EQU $7172
_LABEL__condactADVERB EQU $7195
_LABEL__condactSFX EQU $71B8
_LABEL___LABEL13 EQU $7216
_LABEL___LABEL14 EQU $721D
_LABEL__condactDESC EQU $7234
_LABEL__condactQUIT EQU $723E
_LABEL__condactEND EQU $7277
_LABEL__condactDONE EQU $727D
_LABEL__condactOK EQU $7283
_LABEL__condactANYKEY EQU $728F
_LABEL__condactSAVE EQU $72A6
_LABEL__condactLOAD EQU $72B0
_LABEL__condactDPRINT EQU $72BA
_LABEL___LABEL609 EQU $72D1
_LABEL__condactDISPLAY EQU $72F2
_LABEL___LABEL15 EQU $730B
_LABEL___LABEL16 EQU $731C
_LABEL__condactCLS EQU $731F
_LABEL__condactDROPALL EQU $7325
_LABEL___LABEL19 EQU $732A
_LABEL___LABEL21 EQU $735E
_LABEL__condactAUTOG EQU $736F
_LABEL___LABEL25 EQU $73B9
_LABEL___LABEL28 EQU $73CB
_LABEL___LABEL29 EQU $73DA
_LABEL__condactAUTOD EQU $73DD
_LABEL___LABEL30 EQU $73F2
_LABEL___LABEL31 EQU $7401
_LABEL__condactAUTOW EQU $7404
_LABEL___LABEL32 EQU $7419
_LABEL___LABEL33 EQU $7428
_LABEL__condactAUTOR EQU $742B
_LABEL___LABEL35 EQU $7475
_LABEL___LABEL38 EQU $7487
_LABEL___LABEL39 EQU $7496
_LABEL__condactPAUSE EQU $7499
_LABEL___LABEL41 EQU $74B2
_LABEL___LABEL42 EQU $74BB
_LABEL___LABEL44 EQU $74BC
_LABEL__condactSYNONYM EQU $74CC
_LABEL___LABEL46 EQU $74DD
_LABEL___LABEL48 EQU $74EE
_LABEL__condactGOTO EQU $74F1
_LABEL__condactMESSAGE EQU $74FD
_LABEL__condactREMOVE EQU $7510
_LABEL__condactGET EQU $751D
_LABEL__condactDROP EQU $752A
_LABEL__condactWEAR EQU $7537
_LABEL__condactDESTROY EQU $7544
_LABEL___LABEL611 EQU $7572
_LABEL___LABEL50 EQU $757D
_LABEL__condactCREATE EQU $758E
_LABEL___LABEL612 EQU $75BC
_LABEL___LABEL52 EQU $75C7
_LABEL__condactSWAP EQU $75D9
_LABEL__condactPLACE EQU $7627
_LABEL___LABEL613 EQU $765B
_LABEL___LABEL54 EQU $7663
_LABEL___LABEL614 EQU $768E
_LABEL___LABEL56 EQU $7696
_LABEL__condactSET EQU $769F
_LABEL__condactCLEAR EQU $76B4
_LABEL__condactPLUS EQU $76C9
_LABEL___LABEL58 EQU $7702
_LABEL__condactMINUS EQU $7718
_LABEL___LABEL59 EQU $7743
_LABEL___LABEL60 EQU $7747
_LABEL__condactLET EQU $775B
_LABEL__condactNEWLINE EQU $777B
_LABEL__condactPRINT EQU $7784
_LABEL__condactSYSMESS EQU $779C
_LABEL__condactISAT EQU $77A6
_LABEL___LABEL615 EQU $77E0
_LABEL__condactSETCO EQU $77F5
_LABEL__condactSPACE EQU $77FF
_LABEL__condactHASAT EQU $7808
_LABEL__condactHASNAT EQU $7814
_LABEL__condactLISTOBJ EQU $7821
_LABEL___LABEL62 EQU $7844
_LABEL__condactEXTERN EQU $7847
_LABEL___LABEL65 EQU $7880
_LABEL___LABEL70 EQU $7898
_LABEL___LABEL67 EQU $789B
_LABEL___LABEL71 EQU $78AC
_LABEL___LABEL73 EQU $78BE
_LABEL___LABEL75 EQU $78CD
_LABEL___LABEL77 EQU $78E8
_LABEL___LABEL80 EQU $7948
_LABEL___LABEL66 EQU $794B
_LABEL___LABEL81 EQU $795D
_LABEL___LABEL82 EQU $7965
_LABEL___LABEL84 EQU $7973
_LABEL__condactRAMSAVE EQU $797C
_LABEL__condactRAMLOAD EQU $7994
_LABEL__condactBEEP EQU $79B7
_LABEL__condactPAPER EQU $79BD
_LABEL__condactINK EQU $79C6
_LABEL__condactBORDER EQU $79CF
_LABEL__condactPREP EQU $79DD
_LABEL__condactNOUN2 EQU $7A00
_LABEL__condactADJECT2 EQU $7A23
_LABEL__condactADD EQU $7A46
_LABEL___LABEL86 EQU $7A8C
_LABEL__condactSUB EQU $7AA2
_LABEL___LABEL87 EQU $7AD8
_LABEL___LABEL88 EQU $7ADC
_LABEL__condactPARSE EQU $7AF0
_LABEL___LABEL89 EQU $7B10
_LABEL___LABEL90 EQU $7B26
_LABEL__condactLISTAT EQU $7B2D
_LABEL___LABEL94 EQU $7B53
_LABEL___LABEL91 EQU $7B56
_LABEL___LABEL92 EQU $7B5C
_LABEL__condactPROCESS EQU $7B5F
_LABEL__condactSAME EQU $7B69
_LABEL__condactMES EQU $7BA9
_LABEL__condactWINDOW EQU $7BB3
_LABEL__condactNOTEQ EQU $7BD9
_LABEL__condactNOTSAME EQU $7C0A
_LABEL__condactMODE EQU $7C47
_LABEL__condactWINAT EQU $7C55
_LABEL__condactTIME EQU $7C7A
_LABEL__condactPICTURE EQU $7C97
_LABEL__condactDOALL EQU $7CB4
_LABEL___LABEL98 EQU $7CD0
_LABEL__condactMOUSE EQU $7D4A
_LABEL__condactGFX EQU $7D4D
_LABEL__condactISNOTAT EQU $7D50
_LABEL___LABEL616 EQU $7D8D
_LABEL__condactWEIGH EQU $7DA5
_LABEL__condactPUTIN EQU $7DCF
_LABEL__condactTAKEOUT EQU $7DE6
_LABEL__condactNEWTEXT EQU $7DFD
_LABEL__condactABILITY EQU $7E03
_LABEL__condactWEIGHT EQU $7E12
_LABEL__condactRANDOM EQU $7E31
_LABEL__condactINPUT EQU $7E55
_LABEL__condactSAVEAT EQU $7E8A
_LABEL__condactBACKAT EQU $7E99
_LABEL__condactPRINTAT EQU $7EA8
_LABEL___LABEL102 EQU $7ECF
_LABEL__condactWHATO EQU $7ED2
_LABEL___LABEL104 EQU $7EEE
_LABEL__condactCALL EQU $7EF8
_LABEL___LABEL617 EQU $7F06
_LABEL__condactPUTO EQU $7F4D
_LABEL___LABEL619 EQU $7F74
_LABEL___LABEL106 EQU $7F7C
_LABEL___LABEL108 EQU $7F9E
_LABEL__condactNOTDONE EQU $7FA7
_LABEL___LABEL109 EQU $7FC3
_LABEL___LABEL110 EQU $7FCA
_LABEL__condactAUTOP EQU $7FCD
_LABEL___LABEL111 EQU $7FE6
_LABEL___LABEL112 EQU $7FF5
_LABEL__condactAUTOT EQU $7FF8
_LABEL___LABEL114 EQU $805F
_LABEL___LABEL119 EQU $8075
_LABEL___LABEL121 EQU $80AD
_LABEL___LABEL122 EQU $80B3
_LABEL___LABEL120 EQU $80B9
_LABEL__condactMOVE EQU $80BC
_LABEL___LABEL125 EQU $80E7
_LABEL___LABEL129 EQU $8109
_LABEL___LABEL127 EQU $8115
_LABEL___LABEL124 EQU $811D
_LABEL__condactWINSIZE EQU $812F
_LABEL__condactREDO EQU $8154
_LABEL__condactCENTRE EQU $81B3
_LABEL__condactEXIT EQU $81F3
_LABEL___LABEL131 EQU $81FD
_LABEL__condactINKEY EQU $8209
_LABEL___LABEL133 EQU $821D
_LABEL__condactBIGGER EQU $8233
_LABEL__condactSMALLER EQU $8272
_LABEL__condactISDONE EQU $82B0
_LABEL__condactISNDONE EQU $82C4
_LABEL__condactSKIP EQU $82DD
_LABEL__condactRESTART EQU $82E7
_LABEL__condactTAB EQU $82ED
_LABEL___LABEL135 EQU $82FF
_LABEL__condactCOPYOF EQU $8302
_LABEL__condactCOPYOO EQU $8325
_LABEL__condactCOPYFO EQU $8352
_LABEL___LABEL137 EQU $8383
_LABEL__condactCOPYFF EQU $8386
_LABEL__condactCOPYBF EQU $83B3
_LABEL__condactRESET EQU $83DD
_LABEL__condactNOT_USED EQU $83E3
_FlagsPtr EQU $83E9
_IntVectorPtr EQU $83EB
_ISR EQU $83ED
_EndISR EQU $8424
_IMvect EQU $8500
_core___END_PROGRAM EQU $8605
__WinScrollUp EQU $8613
__WinScrollUp__leave EQU $86A3
__allocate EQU $86A4
__allocate__leave EQU $86A9
__callocate EQU $86AA
__callocate__leave EQU $86AF
__deallocate EQU $86B0
__deallocate__leave EQU $86B3
__MemMove EQU $86B4
__MemMove__leave EQU $86BF
__MemCopy EQU $86C0
__MemCopy__leave EQU $86CA
__MemSet EQU $86CB
__MemSet__leave EQU $86D9
__Rand EQU $86DA
__Rand__leave EQU $86F3
__SetRAMBank EQU $86F4
__SetRAMBank__leave EQU $8709
__resetSys EQU $870A
__resetSys__leave EQU $8719
__memAlloc EQU $871A
_LABEL___LABEL139 EQU $8741
__memAlloc__leave EQU $8747
__ToUpper EQU $8750
__ToUpper__leave EQU $8758
__ToLower EQU $8759
__ToLower__leave EQU $8761
__strnicmp EQU $8762
_LABEL___LABEL141 EQU $8782
_LABEL___LABEL143 EQU $87A2
_LABEL___LABEL146 EQU $87C5
_LABEL___LABEL150 EQU $87ED
_LABEL___LABEL147 EQU $8826
__strnicmp__leave EQU $8827
__strcmp EQU $8832
_LABEL___LABEL153 EQU $8841
_LABEL___LABEL157 EQU $8860
_LABEL___LABEL159 EQU $886E
_LABEL___LABEL155 EQU $888B
__strcmp__leave EQU $8895
__DecompressPicture EQU $88A0
_dzx0_standard_dcp EQU $8958
_dzx0s_dcp_literals EQU $8963
_dzx0s_dcp_copy EQU $896F
_dzx0s_dcp_new_offset EQU $897A
_dzx0s_dcp_elias EQU $8993
_dzx0s_dcp_elias_loop EQU $8994
_dzx0s_dcp_elias_skip EQU $899A
_dzx0s_dcp_elias_backtrack EQU $899B
_dzx0s_ldir_line EQU $89A2
_dzx0s_next_iteration EQU $89A3
_dzx0s_ldir_line_back EQU $89B6
_dzx0s_next_iteration_back EQU $89B7
_ConvHLDEToScreenAddress EQU $89CC
_ConvDEToScreenAddress EQU $89E4
_dzx0_standard EQU $89FD
_dzx0s_literals EQU $8A04
_dzx0s_copy EQU $8A0F
_dzx0s_new_offset EQU $8A19
_dzx0s_elias EQU $8A32
_dzx0s_elias_loop EQU $8A33
_dzx0s_elias_skip EQU $8A39
_dzx0s_elias_backtrack EQU $8A3A
__DecompressPicture__leave EQU $8A41
__preparePicture EQU $8A42
_LABEL___LABEL161 EQU $8A80
_LABEL___LABEL162 EQU $8A8E
_LABEL___LABEL166 EQU $8ABF
_LABEL___LABEL164 EQU $8ACC
_LABEL__EndPreparePicture EQU $8AD5
__preparePicture__leave EQU $8ADE
__showBufferedPicture EQU $8AE7
_LABEL___LABEL168 EQU $8B07
__showBufferedPicture__leave EQU $8B1E
__WaitForKey EQU $8B23
_LABEL___LABEL171 EQU $8B27
__WaitForKey__leave EQU $8B2E
__clearBox EQU $8B2F
_BLPaintHeightExitLoop EQU $8B8A
__clearBox__leave EQU $8BC5
__putGlyph42 EQU $8BD1
__putGlyph42__leave EQU $8C3B
__setFrames EQU $8C3C
__setFrames__leave EQU $8C41
__waitForTimeout EQU $8C42
_LABEL___LABEL174 EQU $8C8C
_LABEL___LABEL176 EQU $8CAC
_LABEL___LABEL172 EQU $8CB6
_LABEL___LABEL173 EQU $8CB9
__waitForTimeout__leave EQU $8CBA
__popCurrentWindow EQU $8CC3
__popCurrentWindow__leave EQU $8D53
__pushCurrentWindow EQU $8D5C
__pushCurrentWindow__leave EQU $8DEC
__GetCharAddress EQU $8DF5
_LABEL___LABEL180 EQU $8E2F
__GetCharAddress__leave EQU $8E35
__PRIVATEconvertCoords42 EQU $8E3E
_LABEL___LABEL182 EQU $8E9A
__PRIVATEconvertCoords42__leave EQU $8EB1
__clearCurrentLine EQU $8EBB
_LABEL___LABEL183 EQU $8EF4
_LABEL___LABEL185 EQU $8F0B
__clearCurrentLine__leave EQU $8F1C
__scrollUp EQU $8F21
_LABEL___LABEL186 EQU $8F92
_LABEL___LABEL188 EQU $8FA9
__scrollUp__leave EQU $8FBA
__checkPrintedLines EQU $8FBF
_LABEL___LABEL198 EQU $900B
_LABEL___LABEL196 EQU $905D
__checkPrintedLines__leave EQU $9061
__printChar EQU $9066
_LABEL___LABEL199 EQU $9081
_LABEL___LABEL201 EQU $9093
_LABEL___LABEL203 EQU $90A3
_LABEL___LABEL205 EQU $90B2
_LABEL___LABEL207 EQU $90CB
_LABEL___LABEL208 EQU $9110
__printChar__leave EQU $9122
__printOutMsg EQU $912B
_LABEL___LABEL215 EQU $9164
_LABEL___LABEL220 EQU $918D
_LABEL___LABEL221 EQU $91C0
_LABEL___LABEL232 EQU $9202
_LABEL___LABEL219 EQU $9208
_LABEL___LABEL620 EQU $9235
_LABEL___LABEL235 EQU $9244
_LABEL___LABEL217 EQU $9255
__printOutMsg__leave EQU $925C
__errorCode EQU $9265
_LABEL___LABEL236 EQU $9283
_LABEL__ErrorCodeText EQU $9286
__errorCode__leave EQU $9293
__getToken EQU $929C
__getToken__leave EQU $92BB
__printMsg EQU $92BC
_LABEL___LABEL238 EQU $92D5
_LABEL___LABEL243 EQU $930D
_LABEL___LABEL247 EQU $9356
_LABEL___LABEL245 EQU $9367
_LABEL___LABEL241 EQU $9371
_LABEL___LABEL251 EQU $93A4
_LABEL___LABEL257 EQU $93D8
_LABEL___LABEL240 EQU $93F7
__printMsg__leave EQU $93FF
__getSizeMessage EQU $9409
__getSizeMessage__leave EQU $9416
__getMessage EQU $9417
__getMessage__leave EQU $949A
__getSystemMsg EQU $94A6
__getSystemMsg__leave EQU $94C8
__printSystemMsg EQU $94D1
__printSystemMsg__leave EQU $94F4
__printUserMsg EQU $94FD
_LABEL___LABEL265 EQU $9514
__printUserMsg__leave EQU $9526
__printLocationMsg EQU $952F
_LABEL___LABEL267 EQU $9546
__printLocationMsg__leave EQU $9558
__printMaluvaExtraMsg EQU $9561
_LABEL___LABEL621 EQU $957D
_LABEL___LABEL622 EQU $9596
_LABEL___LABEL268 EQU $95C5
_LABEL___LABEL270 EQU $95DF
_LABEL___LABEL272 EQU $95F8
_LABEL___LABEL269 EQU $9607
_LABEL___LABEL275 EQU $961B
__printMaluvaExtraMsg__leave EQU $968A
__cutMsgUntilDot EQU $9695
__cutMsgUntilDot__leave EQU $96A9
__skipSpaces EQU $96AA
__skipSpaces__leave EQU $96B2
__printObjectMsgModif EQU $96B3
_LABEL___LABEL280 EQU $970E
_LABEL___LABEL281 EQU $9712
_LABEL___LABEL278 EQU $9723
_LABEL___LABEL284 EQU $9748
_LABEL___LABEL285 EQU $974C
_LABEL___LABEL279 EQU $975D
_LABEL__MsgModifStrings EQU $9773
_LABEL__ENDMsgModifStrings EQU $977B
__printObjectMsgModif__leave EQU $977B
__printObjectMsg EQU $9785
_LABEL___LABEL287 EQU $979F
_LABEL___LABEL288 EQU $97D6
_LABEL___LABEL289 EQU $97DF
__printObjectMsg__leave EQU $97E9
__printBase10 EQU $97F3
_LABEL___LABEL291 EQU $9817
__printBase10__leave EQU $9837
__getObjectId EQU $9840
_LABEL___LABEL293 EQU $9858
_LABEL___LABEL297 EQU $9865
_LABEL___LABEL624 EQU $9883
_LABEL___LABEL625 EQU $98A7
_LABEL___LABEL302 EQU $98B9
_LABEL___LABEL298 EQU $98D1
_LABEL___LABEL294 EQU $98D4
__getObjectId__leave EQU $98E1
__getObjectWeight EQU $98EC
_LABEL___LABEL306 EQU $9905
_LABEL___LABEL310 EQU $990C
_LABEL___LABEL626 EQU $9967
_LABEL___LABEL627 EQU $997D
_LABEL___LABEL321 EQU $9988
_LABEL___LABEL322 EQU $99B4
_LABEL___LABEL318 EQU $99B7
_LABEL___LABEL317 EQU $99C2
_LABEL___LABEL311 EQU $99DA
_LABEL___LABEL307 EQU $99DD
_LABEL___LABEL326 EQU $99FD
__getObjectWeight__leave EQU $9A04
__referencedObject EQU $9A0D
_LABEL___LABEL327 EQU $9A89
__referencedObject__leave EQU $9A9C
__initObjects EQU $9AA5
_LABEL___LABEL329 EQU $9B2E
_LABEL___LABEL333 EQU $9B3D
_LABEL___LABEL331 EQU $9C15
__initObjects__leave EQU $9C30
__PutInputEcho EQU $9C35
_LABEL___LABEL334 EQU $9C77
__PutInputEcho__leave EQU $9C7E
__prompt EQU $9C88
_LABEL___LABEL337 EQU $9CAC
_LABEL___LABEL342 EQU $9CC6
_LABEL___LABEL341 EQU $9CD8
_LABEL___LABEL339 EQU $9CE5
_LABEL___LABEL345 EQU $9D06
_LABEL___LABEL349 EQU $9D26
_LABEL___LABEL352 EQU $9D29
_LABEL___LABEL354 EQU $9D2A
_LABEL___LABEL628 EQU $9D73
_LABEL___LABEL356 EQU $9D7E
_LABEL___LABEL361 EQU $9DBD
_LABEL___LABEL362 EQU $9DC8
_LABEL___LABEL357 EQU $9DD5
_LABEL___LABEL368 EQU $9E11
_LABEL___LABEL370 EQU $9E2C
_LABEL___LABEL347 EQU $9E48
_LABEL__retContinue EQU $9E59
_LABEL___LABEL372 EQU $9E67
_LABEL___LABEL374 EQU $9EA1
_LABEL___LABEL376 EQU $9EBA
__prompt__leave EQU $9EC5
__clearLogicalSentences EQU $9ECE
__clearLogicalSentences__leave EQU $9EEB
__populateLogicalSentence EQU $9EEC
_LABEL___LABEL379 EQU $9F2D
_LABEL___LABEL629 EQU $9F75
_LABEL___LABEL630 EQU $9F82
_LABEL___LABEL388 EQU $9F93
_LABEL___LABEL631 EQU $9FA8
_LABEL___LABEL390 EQU $9FB5
_LABEL___LABEL632 EQU $9FCC
_LABEL___LABEL633 EQU $9FD9
_LABEL___LABEL392 EQU $9FE4
_LABEL___LABEL634 EQU $9FFB
_LABEL___LABEL635 EQU $A008
_LABEL___LABEL394 EQU $A015
_LABEL___LABEL636 EQU $A02C
_LABEL___LABEL396 EQU $A03D
_LABEL___LABEL637 EQU $A053
_LABEL___LABEL398 EQU $A060
_LABEL___LABEL638 EQU $A077
_LABEL___LABEL400 EQU $A084
_LABEL___LABEL639 EQU $A09B
_LABEL___LABEL640 EQU $A0AA
_LABEL___LABEL402 EQU $A0B7
_LABEL___LABEL641 EQU $A0CE
_LABEL___LABEL642 EQU $A0DD
_LABEL___LABEL389 EQU $A0E7
_LABEL___LABEL381 EQU $A0EF
_LABEL___LABEL380 EQU $A0F7
_LABEL___LABEL643 EQU $A11E
_LABEL___LABEL644 EQU $A12B
_LABEL___LABEL407 EQU $A138
_LABEL___LABEL645 EQU $A14C
_LABEL___LABEL646 EQU $A158
_LABEL___LABEL411 EQU $A165
_LABEL___LABEL647 EQU $A178
_LABEL___LABEL413 EQU $A188
_LABEL___LABEL648 EQU $A197
_LABEL___LABEL415 EQU $A1A7
_LABEL___LABEL418 EQU $A20A
_LABEL___LABEL417 EQU $A21C
_LABEL__nextLogicalSentence EQU $A22A
_LABEL___LABEL649 EQU $A237
_LABEL___LABEL650 EQU $A250
_LABEL___LABEL423 EQU $A25C
_LABEL___LABEL425 EQU $A284
__populateLogicalSentence__leave EQU $A2AF
__checkWordVoc EQU $A2B8
_LABEL___LABEL427 EQU $A2E7
_LABEL___LABEL431 EQU $A325
_LABEL___LABEL428 EQU $A350
_LABEL___LABEL433 EQU $A368
_LABEL___LABEL437 EQU $A3AF
_LABEL___LABEL435 EQU $A3C3
__checkWordVoc__leave EQU $A3CB
__isSeparator EQU $A3E4
__isSeparator__leave EQU $A3F9
__parser EQU $A3FA
_LABEL___LABEL438 EQU $A43B
_LABEL___LABEL443 EQU $A46B
_LABEL___LABEL444 EQU $A47F
_LABEL___LABEL441 EQU $A482
_LABEL___LABEL445 EQU $A4A4
_LABEL___LABEL449 EQU $A4BF
_LABEL___LABEL451 EQU $A4EA
_LABEL___LABEL450 EQU $A4F1
_LABEL___LABEL462 EQU $A557
_LABEL___LABEL464 EQU $A57D
_LABEL___LABEL466 EQU $A5A4
_LABEL___LABEL463 EQU $A5C8
_LABEL___LABEL652 EQU $A60A
_LABEL___LABEL461 EQU $A612
_LABEL___LABEL459 EQU $A628
_LABEL___LABEL442 EQU $A63D
_LABEL___LABEL440 EQU $A64E
_LABEL__pronominalsString EQU $A658
__parser__leave EQU $A666
__getLogicalSentence EQU $A66B
_LABEL___LABEL477 EQU $A67B
__getLogicalSentence__leave EQU $A680
__useLiteralSentence EQU $A681
__useLiteralSentence__leave EQU $A69A
__doCLS EQU $A69B
__doCLS__leave EQU $A6CA
__pushPROC EQU $A6CB
_LABEL___LABEL479 EQU $A6EA
_LABEL___LABEL481 EQU $A6F9
__pushPROC__leave EQU $A77B
__popPROC EQU $A784
_LABEL___LABEL483 EQU $A825
__popPROC__leave EQU $A82E
__stepPROCEntryCondacts EQU $A82F
__stepPROCEntryCondacts__leave EQU $A876
__getCondOrValueAndInc EQU $A87F
__getCondOrValueAndInc__leave EQU $A8BA
__getValueOrIndirection EQU $A8BF
_LABEL___LABEL485 EQU $A8EA
__getValueOrIndirection__leave EQU $A8ED
__PRIVATETapeOp EQU $A8F2
_core___ERROR EQU $A911
_core___ERROR_CODE EQU $A915
_core___STOP EQU $A917
_core___MEM_INIT EQU $A91B
_core___MEM_INIT2 EQU $A921
_core_MEM_FREE EQU $A93F
_core___MEM_FREE EQU $A93F
_LOAD_CODE EQU $A991
_core___LOAD_CODE EQU $A997
_core_LD_TYPE EQU $AA15
_core_LOAD_ERROR EQU $AA60
_SAVE_CODE EQU $AA7E
_core___SAVE_CODE EQU $AA85
__PRIVATETapeOp__leave EQU $AB36
__PRIVATESaveOption EQU $AB37
_LABEL___LABEL487 EQU $AB4A
__PRIVATESaveOption__leave EQU $AB4D
__PRIVATEGetFilename EQU $AB56
__PRIVATEGetFilename__leave EQU $ABA1
__PRIVATEDoSAVE EQU $ABA6
_LABEL___LABEL490 EQU $AC3C
_LABEL___LABEL491 EQU $AC40
_LABEL___LABEL493 EQU $AC59
__PRIVATEDoSAVE__leave EQU $AC6F
__PRIVATEDoLOAD EQU $AC78
_LABEL___LABEL499 EQU $AD0D
_LABEL___LABEL496 EQU $AD10
_LABEL___LABEL497 EQU $AD14
_LABEL___LABEL500 EQU $AD2B
_LABEL___LABEL501 EQU $AD3F
__PRIVATEDoLOAD__leave EQU $AD48
__PRIVATEDoRESET EQU $AD51
__PRIVATEDoRESET__leave EQU $AD54
_LABEL___LABEL504 EQU $AD55
__PRIVATEDoRESTART EQU $AD55
__PRIVATEDoRESTART__leave EQU $AD70
__PRIVATEDoEND EQU $AD71
_LABEL___LABEL506 EQU $ADA6
__PRIVATEDoEND__leave EQU $ADAF
__PRIVATEGetObjectLocParam EQU $ADB4
__PRIVATEGetObjectLocParam__leave EQU $ADD2
__PRIVATECheckLocHERE EQU $ADD7
_LABEL___LABEL507 EQU $ADED
__PRIVATECheckLocHERE__leave EQU $ADF0
__PRIVATEDoALL EQU $ADF9
_LABEL___LABEL510 EQU $AE4E
_LABEL___LABEL511 EQU $AE51
_LABEL___LABEL517 EQU $AE89
_LABEL___LABEL513 EQU $AE8F
_LABEL___LABEL653 EQU $AECC
__PRIVATEDoALL__leave EQU $AF5A
__PRIVATEDoDONE EQU $AF5F
_LABEL___LABEL518 EQU $AF7B
__PRIVATEDoDONE__leave EQU $AF83
__PRIVATEDoLISTAT EQU $AF84
_LABEL___LABEL523 EQU $AFBD
_LABEL___LABEL655 EQU $B001
_LABEL___LABEL530 EQU $B018
_LABEL___LABEL656 EQU $B024
_LABEL___LABEL535 EQU $B046
_LABEL___LABEL534 EQU $B04C
_LABEL___LABEL538 EQU $B064
_LABEL___LABEL528 EQU $B06C
_LABEL___LABEL524 EQU $B073
_LABEL___LABEL520 EQU $B080
__PRIVATEDoLISTAT__leave EQU $B09A
__PRIVATEDoHASAT EQU $B0A4
_LABEL___LABEL657 EQU $B0BC
_LABEL___LABEL658 EQU $B0BF
_LABEL___LABEL540 EQU $B0F0
__PRIVATEDoHASAT__leave EQU $B103
__PRIVATEDoWEAR EQU $B10D
_LABEL___LABEL541 EQU $B157
_LABEL___LABEL543 EQU $B168
_LABEL___LABEL545 EQU $B179
_LABEL___LABEL547 EQU $B18A
_LABEL___LABEL550 EQU $B1AC
_LABEL___LABEL542 EQU $B1AF
__PRIVATEDoWEAR__leave EQU $B1B5
__PRIVATEDoREMOVE EQU $B1BE
_LABEL___LABEL551 EQU $B221
_LABEL___LABEL659 EQU $B233
_LABEL___LABEL553 EQU $B240
_LABEL___LABEL555 EQU $B251
_LABEL___LABEL557 EQU $B264
_LABEL___LABEL552 EQU $B282
__PRIVATEDoREMOVE__leave EQU $B288
__PRIVATEDoGET EQU $B291
_LABEL___LABEL559 EQU $B2D5
_LABEL___LABEL561 EQU $B2E8
_LABEL___LABEL563 EQU $B30A
_LABEL___LABEL565 EQU $B330
_LABEL___LABEL560 EQU $B34E
__PRIVATEDoGET__leave EQU $B354
__PRIVATEDoDROP EQU $B35D
_LABEL___LABEL570 EQU $B3B6
_LABEL___LABEL567 EQU $B3B9
_LABEL___LABEL571 EQU $B3CA
_LABEL___LABEL573 EQU $B3DC
_LABEL___LABEL568 EQU $B3E2
__PRIVATEDoDROP__leave EQU $B3E8
__PRIVATEDoPUTIN EQU $B3F1
_LABEL___LABEL575 EQU $B430
_LABEL___LABEL577 EQU $B442
_LABEL___LABEL660 EQU $B454
_LABEL___LABEL579 EQU $B461
_LABEL___LABEL582 EQU $B484
_LABEL___LABEL576 EQU $B4A3
__PRIVATEDoPUTIN__leave EQU $B4A9
__PRIVATEDoTAKEOUT EQU $B4B3
_LABEL___LABEL583 EQU $B50B
_LABEL___LABEL585 EQU $B532
_LABEL___LABEL661 EQU $B545
_LABEL___LABEL587 EQU $B567
_LABEL___LABEL662 EQU $B578
_LABEL___LABEL663 EQU $B596
_LABEL___LABEL589 EQU $B5A3
_LABEL___LABEL591 EQU $B5C9
_LABEL___LABEL584 EQU $B5E7
__PRIVATEDoTAKEOUT__leave EQU $B5ED
__PRIVATEAutoEND EQU $B5F7
_LABEL___LABEL593 EQU $B62E
__PRIVATEAutoEND__leave EQU $B635
__PRIVATEcheckLocCARRWORNHERE EQU $B63F
_LABEL___LABEL596 EQU $B697
__PRIVATEcheckLocCARRWORNHERE__leave EQU $B69A
__PRIVATEwindowCheck EQU $B69F
_LABEL___LABEL600 EQU $B6D5
__PRIVATEwindowCheck__leave EQU $B6EA
__PRIVATEDoBEEP EQU $B6EB
__PRIVATEDoBEEP__leave EQU $B752
__PRIVATEGetColor EQU $B757
_LABEL___LABEL604 EQU $B787
_LABEL___LABEL606 EQU $B793
__PRIVATEGetColor__leave EQU $B7A4
__initFlags EQU $B7A9
__initFlags__leave EQU $B82F
__doCALL EQU $B830
__doCALL__leave EQU $B84A
__jumpToBank EQU $B84B
__jumpToBank__leave EQU $B861
__setupIM EQU $B862
__setupIM__leave EQU $B889
__GetCurrentContact EQU $B88A
__GetCurrentContact__leave EQU $B8C8
_LABEL___LABEL7 EQU $B8CD
_core_SP_PixelDown EQU $B9CE
_core_SCREEN_ADDR EQU $B9F6
_core_SCREEN_ATTR_ADDR EQU $B9F8
_core_SP_PixelUp EQU $B9FA
_core_MEM_ALLOC EQU $BA1D
_core___MEM_ALLOC EQU $BA1D
_core___MUL16 EQU $BA6C
_core___ARRAY_PTR EQU $BA81
_core___ARRAY EQU $BA85
_core___MEM_CALLOC EQU $BADA
_core___ALLOC_LOCAL_ARRAY EQU $BAF0
_core___ALLOC_INITIALIZED_LOCAL_ARRAY EQU $BB04
_core___BAND16 EQU $BB13
_core___FPSTACK_PUSH2 EQU $BB1A
_core___FPSTACK_I16 EQU $BB2B
_core_BEEP EQU $BB36
_core___BOR16 EQU $BB49
_core_BRIGHT EQU $BB50
_core___SET_BRIGHT EQU $BB53
_core_BRIGHT_TMP EQU $BB6A
_core_CLS EQU $BB6F
_core___ABS16 EQU $BB9E
_core___NEGHL EQU $BBA1
_core___DIVU16 EQU $BBA9
_core___DIVU16_FAST EQU $BBA9
_core___DIV16LOOP EQU $BBB0
_core___DIV16NOADD EQU $BBBB
_core___MODU16 EQU $BBC1
_core___DIVI16 EQU $BBC6
_core___DIVI16_FAST EQU $BBC6
_core___DIVI16A EQU $BBD4
_core___DIVI16B EQU $BBD9
_core___MODI16 EQU $BBE2
_core___EQ16 EQU $BBE7
_core_FLASH EQU $BBED
_core___SET_FLASH EQU $BBF0
_core_FLASH_TMP EQU $BC07
_core_INK EQU $BC0C
_core_INK_TMP EQU $BC27
_core___SUB32 EQU $BC2D
_core___LEI32 EQU $BC41
_core___MEMCPY EQU $BC5E
_core___MULF EQU $BC77
_core___ON_GOSUB EQU $BC80
_core___ON_GOTO EQU $BC86
_core___ON_GOTO_START EQU $BC88
_core_PAPER EQU $BC98
_core_PAPER_TMP EQU $BCB6
_core___ILOADF EQU $BCBC
_core___LOADF EQU $BCC0
_core___PLOADF EQU $BCCA
_core___PISTOREF EQU $BCD1
_core___ISTOREF EQU $BCD8
_core___STOREF EQU $BCDE
_core___PSTOREF EQU $BCE8
_core___REALLOC EQU $BCF2
_core___SHRL32 EQU $BD26
_core___ABS32 EQU $BD2F
_core___NEG32 EQU $BD32
_core___I8TOFREG EQU $BD44
_core___I32TOFREG EQU $BD4A
_core___U8TOFREG EQU $BD58
_core___U32TOFREG EQU $BD5D
_core___U32TOFREG_LOOP EQU $BD71
_LABEL___LABEL651 EQU $BD93
_LABEL___LABEL654 EQU $BD96
