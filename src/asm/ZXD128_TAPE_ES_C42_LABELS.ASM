DDB_HEADER EQU 48264 
START_PALETTE EQU 48322 
VECT_EXTERN EQU 48338 
VECT_SFX EQU 48340 
VECT_INT EQU 48342 
VECT_0 EQU 48344 
VECT_1 EQU 48346 
VECT_2 EQU 48348 
VECT_3 EQU 48350 
VECT_4 EQU 48352 
VECT_5 EQU 48354 
VECT_6 EQU 48356 
VECT_7 EQU 48358 
VECT_8 EQU 48360 
VECT_9 EQU 48362 
START_DDB EQU 48364 
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
_LABEL___LABEL665 EQU $6A95
__winX EQU $6A98
__winX___DATA_____PTR__ EQU $6A9A
__winX___DATA__ EQU $6A9C
_LABEL___LABEL666 EQU $6AA4
__winY EQU $6AA7
__winY___DATA_____PTR__ EQU $6AA9
__winY___DATA__ EQU $6AAB
_LABEL___LABEL667 EQU $6AB3
__winW EQU $6AB6
__winW___DATA_____PTR__ EQU $6AB8
__winW___DATA__ EQU $6ABA
_LABEL___LABEL668 EQU $6AC2
__winH EQU $6AC5
__winH___DATA_____PTR__ EQU $6AC7
__winH___DATA__ EQU $6AC9
_LABEL___LABEL669 EQU $6AD1
__cursorX EQU $6AD4
__cursorX___DATA_____PTR__ EQU $6AD6
__cursorX___DATA__ EQU $6AD8
_LABEL___LABEL670 EQU $6AE0
__cursorY EQU $6AE3
__cursorY___DATA_____PTR__ EQU $6AE5
__cursorY___DATA__ EQU $6AE7
_LABEL___LABEL671 EQU $6AEF
__winMode EQU $6AF2
__winMode___DATA_____PTR__ EQU $6AF4
__winMode___DATA__ EQU $6AF6
_LABEL___LABEL672 EQU $6AFE
__winAttr EQU $6B01
__winAttr___DATA_____PTR__ EQU $6B03
__winAttr___DATA__ EQU $6B05
_LABEL___LABEL673 EQU $6B0D
__lsBuffer0 EQU $6B10
__lsBuffer0___DATA_____PTR__ EQU $6B12
__lsBuffer0___DATA__ EQU $6B14
_LABEL___LABEL674 EQU $6B47
__lsBuffer1 EQU $6B4A
__lsBuffer1___DATA_____PTR__ EQU $6B4C
__lsBuffer1___DATA__ EQU $6B4E
_LABEL___LABEL675 EQU $6B68
__numProc EQU $6B6B
__numProc___DATA_____PTR__ EQU $6B6D
__numProc___DATA__ EQU $6B6F
_LABEL___LABEL676 EQU $6B79
__entryIniProc EQU $6B7C
__entryIniProc___DATA_____PTR__ EQU $6B7E
__entryIniProc___DATA__ EQU $6B80
_LABEL___LABEL677 EQU $6B94
__entryProc EQU $6B97
__entryProc___DATA_____PTR__ EQU $6B99
__entryProc___DATA__ EQU $6B9B
_LABEL___LABEL678 EQU $6BAF
__condactIniProc EQU $6BB2
__condactIniProc___DATA_____PTR__ EQU $6BB4
__condactIniProc___DATA__ EQU $6BB6
_LABEL___LABEL679 EQU $6BCA
__condactProc EQU $6BCD
__condactProc___DATA_____PTR__ EQU $6BCF
__condactProc___DATA__ EQU $6BD1
_LABEL___LABEL680 EQU $6BE5
__entryDOALLProc EQU $6BE8
__entryDOALLProc___DATA_____PTR__ EQU $6BEA
__entryDOALLProc___DATA__ EQU $6BEC
_LABEL___LABEL681 EQU $6C00
__condactDOALLProc EQU $6C03
__condactDOALLProc___DATA_____PTR__ EQU $6C05
__condactDOALLProc___DATA__ EQU $6C07
_LABEL___LABEL682 EQU $6C1B
__continueEntryProc EQU $6C1E
__continueEntryProc___DATA_____PTR__ EQU $6C20
__continueEntryProc___DATA__ EQU $6C22
_LABEL___LABEL683 EQU $6C2C
__condactFlagList EQU $6C2F
__condactFlagList___DATA_____PTR__ EQU $6C31
__condactFlagList___DATA__ EQU $6C33
_LABEL___LABEL684 EQU $6CB3
_core_ZXBASIC_USER_DATA_END EQU $6CB6
_core___MAIN_PROGRAM__ EQU $6CB6
_LABEL___LABEL1 EQU $6D04
_LABEL___LABEL2 EQU $6DF4
_LABEL___LABEL4 EQU $6DFA
_LABEL__NextCondact EQU $6E10
_LABEL___LABEL6 EQU $6E2A
_LABEL___LABEL607 EQU $6E44
_LABEL___LABEL8 EQU $6E48
_LABEL___LABEL11 EQU $6E99
_LABEL___LABEL608 EQU $6EFE
_LABEL___LABEL9 EQU $6F02
_LABEL__condactAT EQU $6F14
_LABEL__condactNOTAT EQU $6F31
_LABEL__condactATGT EQU $6F4B
_LABEL__condactATLT EQU $6F68
_LABEL__condactPRESENT EQU $6F86
_LABEL__condactABSENT EQU $6FB3
_LABEL__condactWORN EQU $6FE3
_LABEL__condactNOTWORN EQU $7001
_LABEL__condactCARRIED EQU $701C
_LABEL__condactNOTCARR EQU $703A
_LABEL__condactCHANCE EQU $7055
_LABEL__condactZERO EQU $7085
_LABEL__condactNOTZERO EQU $70AC
_LABEL__condactEQ EQU $70D0
_LABEL__condactGT EQU $70FE
_LABEL__condactLT EQU $7129
_LABEL__condactADJECT1 EQU $7155
_LABEL__condactADVERB EQU $7178
_LABEL__condactSFX EQU $719B
_LABEL___LABEL13 EQU $71F9
_LABEL___LABEL14 EQU $7200
_LABEL__condactDESC EQU $7217
_LABEL__condactQUIT EQU $7221
_LABEL__condactEND EQU $725A
_LABEL__condactDONE EQU $7260
_LABEL__condactOK EQU $7266
_LABEL__condactANYKEY EQU $7272
_LABEL__condactSAVE EQU $7289
_LABEL__condactLOAD EQU $7293
_LABEL__condactDPRINT EQU $729D
_LABEL___LABEL609 EQU $72B4
_LABEL__condactDISPLAY EQU $72D5
_LABEL___LABEL15 EQU $72EE
_LABEL___LABEL16 EQU $72FF
_LABEL__condactCLS EQU $7302
_LABEL__condactDROPALL EQU $7308
_LABEL___LABEL19 EQU $730D
_LABEL___LABEL21 EQU $7341
_LABEL__condactAUTOG EQU $7352
_LABEL___LABEL25 EQU $739C
_LABEL___LABEL28 EQU $73AE
_LABEL___LABEL29 EQU $73BD
_LABEL__condactAUTOD EQU $73C0
_LABEL___LABEL30 EQU $73D5
_LABEL___LABEL31 EQU $73E4
_LABEL__condactAUTOW EQU $73E7
_LABEL___LABEL32 EQU $73FC
_LABEL___LABEL33 EQU $740B
_LABEL__condactAUTOR EQU $740E
_LABEL___LABEL35 EQU $7458
_LABEL___LABEL38 EQU $746A
_LABEL___LABEL39 EQU $7479
_LABEL__condactPAUSE EQU $747C
_LABEL___LABEL41 EQU $7495
_LABEL___LABEL42 EQU $749E
_LABEL___LABEL44 EQU $749F
_LABEL__condactSYNONYM EQU $74AF
_LABEL___LABEL46 EQU $74C0
_LABEL___LABEL48 EQU $74D1
_LABEL__condactGOTO EQU $74D4
_LABEL__condactMESSAGE EQU $74E0
_LABEL__condactREMOVE EQU $74F3
_LABEL__condactGET EQU $7500
_LABEL__condactDROP EQU $750D
_LABEL__condactWEAR EQU $751A
_LABEL__condactDESTROY EQU $7527
_LABEL___LABEL611 EQU $7555
_LABEL___LABEL50 EQU $7560
_LABEL__condactCREATE EQU $7571
_LABEL___LABEL612 EQU $759F
_LABEL___LABEL52 EQU $75AA
_LABEL__condactSWAP EQU $75BC
_LABEL__condactPLACE EQU $760A
_LABEL___LABEL613 EQU $7638
_LABEL___LABEL54 EQU $7640
_LABEL___LABEL56 EQU $7661
_LABEL__condactSET EQU $766A
_LABEL__condactCLEAR EQU $767F
_LABEL__condactPLUS EQU $7694
_LABEL___LABEL58 EQU $76CD
_LABEL__condactMINUS EQU $76E3
_LABEL___LABEL59 EQU $770E
_LABEL___LABEL60 EQU $7712
_LABEL__condactLET EQU $7726
_LABEL__condactNEWLINE EQU $7746
_LABEL__condactPRINT EQU $774F
_LABEL__condactSYSMESS EQU $7767
_LABEL__condactISAT EQU $7771
_LABEL___LABEL614 EQU $77AB
_LABEL__condactSETCO EQU $77C0
_LABEL__condactSPACE EQU $77CA
_LABEL__condactHASAT EQU $77D3
_LABEL__condactHASNAT EQU $77DF
_LABEL__condactLISTOBJ EQU $77EC
_LABEL___LABEL62 EQU $780F
_LABEL__condactEXTERN EQU $7812
_LABEL___LABEL65 EQU $784B
_LABEL___LABEL70 EQU $7863
_LABEL___LABEL67 EQU $7866
_LABEL___LABEL71 EQU $7877
_LABEL___LABEL73 EQU $7889
_LABEL___LABEL75 EQU $7898
_LABEL___LABEL77 EQU $78B3
_LABEL___LABEL80 EQU $7913
_LABEL___LABEL66 EQU $7916
_LABEL___LABEL81 EQU $7928
_LABEL___LABEL82 EQU $7930
_LABEL___LABEL84 EQU $793E
_LABEL__condactRAMSAVE EQU $7947
_LABEL__condactRAMLOAD EQU $795F
_LABEL__condactBEEP EQU $7982
_LABEL__condactPAPER EQU $7988
_LABEL__condactINK EQU $7991
_LABEL__condactBORDER EQU $799A
_LABEL__condactPREP EQU $79A8
_LABEL__condactNOUN2 EQU $79CB
_LABEL__condactADJECT2 EQU $79EE
_LABEL__condactADD EQU $7A11
_LABEL___LABEL86 EQU $7A57
_LABEL__condactSUB EQU $7A6D
_LABEL___LABEL87 EQU $7AA3
_LABEL___LABEL88 EQU $7AA7
_LABEL__condactPARSE EQU $7ABB
_LABEL___LABEL89 EQU $7ADB
_LABEL___LABEL90 EQU $7AF1
_LABEL__condactLISTAT EQU $7AF8
_LABEL___LABEL94 EQU $7B1A
_LABEL___LABEL91 EQU $7B1D
_LABEL___LABEL92 EQU $7B23
_LABEL__condactPROCESS EQU $7B26
_LABEL__condactSAME EQU $7B30
_LABEL__condactMES EQU $7B70
_LABEL__condactWINDOW EQU $7B7A
_LABEL__condactNOTEQ EQU $7BA0
_LABEL__condactNOTSAME EQU $7BD1
_LABEL__condactMODE EQU $7C0E
_LABEL__condactWINAT EQU $7C1C
_LABEL__condactTIME EQU $7C41
_LABEL__condactPICTURE EQU $7C5E
_LABEL__condactDOALL EQU $7C7B
_LABEL___LABEL98 EQU $7C97
_LABEL__condactMOUSE EQU $7D02
_LABEL__condactGFX EQU $7D05
_LABEL__condactISNOTAT EQU $7D08
_LABEL___LABEL615 EQU $7D45
_LABEL__condactWEIGH EQU $7D5D
_LABEL__condactPUTIN EQU $7D87
_LABEL__condactTAKEOUT EQU $7D9E
_LABEL__condactNEWTEXT EQU $7DB5
_LABEL__condactABILITY EQU $7DBB
_LABEL__condactWEIGHT EQU $7DCA
_LABEL__condactRANDOM EQU $7DE9
_LABEL__condactINPUT EQU $7E0D
_LABEL__condactSAVEAT EQU $7E42
_LABEL__condactBACKAT EQU $7E51
_LABEL__condactPRINTAT EQU $7E60
_LABEL___LABEL102 EQU $7E87
_LABEL__condactWHATO EQU $7E8A
_LABEL___LABEL104 EQU $7EA6
_LABEL__condactCALL EQU $7EB0
_LABEL___LABEL616 EQU $7EBE
_LABEL__condactPUTO EQU $7F01
_LABEL___LABEL618 EQU $7F28
_LABEL___LABEL106 EQU $7F30
_LABEL___LABEL108 EQU $7F4E
_LABEL__condactNOTDONE EQU $7F57
_LABEL___LABEL109 EQU $7F73
_LABEL___LABEL110 EQU $7F7A
_LABEL__condactAUTOP EQU $7F7D
_LABEL___LABEL111 EQU $7F96
_LABEL___LABEL112 EQU $7FA5
_LABEL__condactAUTOT EQU $7FA8
_LABEL___LABEL114 EQU $800F
_LABEL___LABEL119 EQU $8025
_LABEL___LABEL121 EQU $805D
_LABEL___LABEL122 EQU $8063
_LABEL___LABEL120 EQU $8069
_LABEL__condactMOVE EQU $806C
_LABEL___LABEL125 EQU $8097
_LABEL___LABEL129 EQU $80B9
_LABEL___LABEL127 EQU $80C5
_LABEL___LABEL124 EQU $80CD
_LABEL__condactWINSIZE EQU $80DF
_LABEL__condactREDO EQU $8104
_LABEL__condactCENTRE EQU $8163
_LABEL__condactEXIT EQU $81A3
_LABEL___LABEL131 EQU $81AD
_LABEL__condactINKEY EQU $81B9
_LABEL___LABEL133 EQU $81CD
_LABEL__condactBIGGER EQU $81E3
_LABEL__condactSMALLER EQU $8222
_LABEL__condactISDONE EQU $8260
_LABEL__condactISNDONE EQU $8274
_LABEL__condactSKIP EQU $828D
_LABEL__condactRESTART EQU $8297
_LABEL__condactTAB EQU $829D
_LABEL___LABEL135 EQU $82AF
_LABEL__condactCOPYOF EQU $82B2
_LABEL__condactCOPYOO EQU $82D5
_LABEL__condactCOPYFO EQU $8302
_LABEL___LABEL137 EQU $8333
_LABEL__condactCOPYFF EQU $8336
_LABEL__condactCOPYBF EQU $8363
_LABEL__condactRESET EQU $838D
_LABEL__condactNOT_USED EQU $8393
_FlagsPtr EQU $8399
_IntVectorPtr EQU $839B
_ISR EQU $839D
_EndISR EQU $83C9
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
__Rand EQU $85DA
__Rand__leave EQU $85F3
__SetRAMBank EQU $85F4
__SetRAMBank__leave EQU $8609
__resetSys EQU $860A
__resetSys__leave EQU $8619
__memAlloc EQU $861A
_LABEL___LABEL139 EQU $8641
__memAlloc__leave EQU $8647
__ToUpper EQU $8650
_LABEL___LABEL619 EQU $866D
_LABEL___LABEL141 EQU $867B
__ToUpper__leave EQU $867E
__ToLower EQU $8687
_LABEL___LABEL620 EQU $86A4
_LABEL___LABEL143 EQU $86B2
__ToLower__leave EQU $86B5
__strnicmp EQU $86BE
_LABEL___LABEL145 EQU $86DE
_LABEL___LABEL147 EQU $86FE
_LABEL___LABEL150 EQU $8721
_LABEL___LABEL154 EQU $874B
_LABEL___LABEL151 EQU $8784
__strnicmp__leave EQU $8785
__strcmp EQU $8790
_LABEL___LABEL157 EQU $879F
_LABEL___LABEL161 EQU $87BE
_LABEL___LABEL163 EQU $87CC
_LABEL___LABEL159 EQU $87E9
__strcmp__leave EQU $87F3
__DecompressPicture EQU $87FE
_dzx0_standard_dcp EQU $88B6
_dzx0s_dcp_literals EQU $88C1
_dzx0s_dcp_copy EQU $88CD
_dzx0s_dcp_new_offset EQU $88D8
_dzx0s_dcp_elias EQU $88F1
_dzx0s_dcp_elias_loop EQU $88F2
_dzx0s_dcp_elias_skip EQU $88F8
_dzx0s_dcp_elias_backtrack EQU $88F9
_dzx0s_ldir_line EQU $8900
_dzx0s_next_iteration EQU $8901
_dzx0s_ldir_line_back EQU $8914
_dzx0s_next_iteration_back EQU $8915
_ConvHLDEToScreenAddress EQU $892A
_ConvDEToScreenAddress EQU $8942
_dzx0_standard EQU $895B
_dzx0s_literals EQU $8962
_dzx0s_copy EQU $896D
_dzx0s_new_offset EQU $8977
_dzx0s_elias EQU $8990
_dzx0s_elias_loop EQU $8991
_dzx0s_elias_skip EQU $8997
_dzx0s_elias_backtrack EQU $8998
__DecompressPicture__leave EQU $899F
__preparePicture EQU $89A0
_LABEL___LABEL165 EQU $89DE
_LABEL___LABEL166 EQU $89EC
_LABEL___LABEL170 EQU $8A1D
_LABEL___LABEL168 EQU $8A2A
_LABEL__EndPreparePicture EQU $8A33
__preparePicture__leave EQU $8A3C
__showBufferedPicture EQU $8A45
_LABEL___LABEL172 EQU $8A65
__showBufferedPicture__leave EQU $8A7C
__WaitForKey EQU $8A81
_LABEL___LABEL175 EQU $8A85
__WaitForKey__leave EQU $8A8C
__clearBox EQU $8A8D
_BLPaintHeightExitLoop EQU $8AE8
__clearBox__leave EQU $8B23
__putGlyph42 EQU $8B2F
__putGlyph42__leave EQU $8B99
__setFrames EQU $8B9A
__setFrames__leave EQU $8B9F
__waitForTimeout EQU $8BA0
_LABEL___LABEL178 EQU $8BEA
_LABEL___LABEL180 EQU $8C0A
_LABEL___LABEL176 EQU $8C14
_LABEL___LABEL177 EQU $8C17
__waitForTimeout__leave EQU $8C18
__popCurrentWindow EQU $8C21
__popCurrentWindow__leave EQU $8CB1
__pushCurrentWindow EQU $8CBA
__pushCurrentWindow__leave EQU $8D4A
__GetCharAddress EQU $8D53
_LABEL___LABEL184 EQU $8D8D
__GetCharAddress__leave EQU $8D93
__PRIVATEconvertCoords42 EQU $8D9C
_LABEL___LABEL186 EQU $8DF8
__PRIVATEconvertCoords42__leave EQU $8E0F
__clearCurrentLine EQU $8E19
_LABEL___LABEL187 EQU $8E52
_LABEL___LABEL189 EQU $8E69
__clearCurrentLine__leave EQU $8E7A
__scrollUp EQU $8E7F
_LABEL___LABEL190 EQU $8EF0
_LABEL___LABEL192 EQU $8F07
__scrollUp__leave EQU $8F18
__checkPrintedLines EQU $8F1D
_LABEL___LABEL202 EQU $8F69
_LABEL___LABEL200 EQU $8FBB
__checkPrintedLines__leave EQU $8FBF
__printChar EQU $8FC4
_LABEL___LABEL203 EQU $8FDF
_LABEL___LABEL205 EQU $8FF1
_LABEL___LABEL207 EQU $9001
_LABEL___LABEL209 EQU $9010
_LABEL___LABEL211 EQU $9029
_LABEL___LABEL212 EQU $906E
__printChar__leave EQU $9080
__printOutMsg EQU $9089
_LABEL___LABEL219 EQU $90C2
_LABEL___LABEL224 EQU $90EB
_LABEL___LABEL225 EQU $911E
_LABEL___LABEL236 EQU $9160
_LABEL___LABEL223 EQU $9166
_LABEL___LABEL621 EQU $9193
_LABEL___LABEL239 EQU $91A2
_LABEL___LABEL221 EQU $91B3
__printOutMsg__leave EQU $91BA
__errorCode EQU $91C3
_LABEL___LABEL240 EQU $91E1
_LABEL__ErrorCodeText EQU $91E4
__errorCode__leave EQU $91F1
__getToken EQU $91FA
__getToken__leave EQU $9219
__printMsg EQU $921A
_LABEL___LABEL242 EQU $9233
_LABEL___LABEL247 EQU $926B
_LABEL___LABEL251 EQU $92B4
_LABEL___LABEL249 EQU $92C5
_LABEL___LABEL245 EQU $92CF
_LABEL___LABEL255 EQU $9302
_LABEL___LABEL261 EQU $9336
_LABEL___LABEL244 EQU $9355
__printMsg__leave EQU $935D
__getSizeMessage EQU $9367
__getSizeMessage__leave EQU $9374
__getMessage EQU $9375
__getMessage__leave EQU $93F8
__getSystemMsg EQU $9404
__getSystemMsg__leave EQU $9426
__printSystemMsg EQU $942F
__printSystemMsg__leave EQU $9452
__printUserMsg EQU $945B
_LABEL___LABEL269 EQU $9472
__printUserMsg__leave EQU $9484
__printLocationMsg EQU $948D
_LABEL___LABEL271 EQU $94A4
__printLocationMsg__leave EQU $94B6
__printMaluvaExtraMsg EQU $94BF
_LABEL___LABEL622 EQU $94DB
_LABEL___LABEL623 EQU $94F4
_LABEL___LABEL272 EQU $9523
_LABEL___LABEL274 EQU $953D
_LABEL___LABEL276 EQU $9556
_LABEL___LABEL273 EQU $9565
_LABEL___LABEL279 EQU $9579
__printMaluvaExtraMsg__leave EQU $95E8
__cutMsgUntilDot EQU $95F3
__cutMsgUntilDot__leave EQU $9607
__skipSpaces EQU $9608
__skipSpaces__leave EQU $9610
__printObjectMsgModif EQU $9611
_LABEL___LABEL284 EQU $966C
_LABEL___LABEL285 EQU $9670
_LABEL___LABEL282 EQU $9681
_LABEL___LABEL288 EQU $96A6
_LABEL___LABEL289 EQU $96AA
_LABEL___LABEL283 EQU $96BB
_LABEL__MsgModifStrings EQU $96D1
_LABEL__ENDMsgModifStrings EQU $96D9
__printObjectMsgModif__leave EQU $96D9
__printObjectMsg EQU $96E3
_LABEL___LABEL291 EQU $96FD
_LABEL___LABEL292 EQU $9735
_LABEL___LABEL293 EQU $973E
__printObjectMsg__leave EQU $9748
__printBase10 EQU $9752
_LABEL___LABEL295 EQU $9776
__printBase10__leave EQU $9796
__getObjectId EQU $979F
_LABEL___LABEL297 EQU $97B7
_LABEL___LABEL301 EQU $97C4
_LABEL___LABEL625 EQU $97E2
_LABEL___LABEL626 EQU $9806
_LABEL___LABEL306 EQU $9818
_LABEL___LABEL302 EQU $9830
_LABEL___LABEL298 EQU $9833
__getObjectId__leave EQU $9840
__getObjectWeight EQU $984B
_LABEL___LABEL310 EQU $9864
_LABEL___LABEL314 EQU $986B
_LABEL___LABEL627 EQU $98C6
_LABEL___LABEL628 EQU $98DC
_LABEL___LABEL325 EQU $98E7
_LABEL___LABEL326 EQU $9913
_LABEL___LABEL322 EQU $9916
_LABEL___LABEL321 EQU $9921
_LABEL___LABEL315 EQU $9939
_LABEL___LABEL311 EQU $993C
_LABEL___LABEL330 EQU $995C
__getObjectWeight__leave EQU $9963
__referencedObject EQU $996C
_LABEL___LABEL331 EQU $99E8
__referencedObject__leave EQU $99FB
__initObjects EQU $9A04
_LABEL___LABEL333 EQU $9A8D
_LABEL___LABEL337 EQU $9A9C
_LABEL___LABEL335 EQU $9B74
__initObjects__leave EQU $9B8F
__PutInputEcho EQU $9B94
_LABEL___LABEL338 EQU $9BD6
__PutInputEcho__leave EQU $9BDD
__prompt EQU $9BE7
_LABEL___LABEL341 EQU $9C0B
_LABEL___LABEL346 EQU $9C25
_LABEL___LABEL345 EQU $9C37
_LABEL___LABEL343 EQU $9C44
_LABEL___LABEL349 EQU $9C65
_LABEL___LABEL353 EQU $9C85
_LABEL___LABEL356 EQU $9C88
_LABEL___LABEL358 EQU $9C89
_LABEL___LABEL629 EQU $9CD2
_LABEL___LABEL360 EQU $9CDD
_LABEL___LABEL365 EQU $9D1C
_LABEL___LABEL366 EQU $9D27
_LABEL___LABEL361 EQU $9D34
_LABEL___LABEL372 EQU $9D70
_LABEL___LABEL374 EQU $9D8B
_LABEL___LABEL351 EQU $9DA8
_LABEL__retContinue EQU $9DB9
_LABEL___LABEL376 EQU $9DC7
_LABEL___LABEL378 EQU $9E01
_LABEL___LABEL380 EQU $9E1A
__prompt__leave EQU $9E1E
__clearLogicalSentences EQU $9E27
__clearLogicalSentences__leave EQU $9E44
__populateLogicalSentence EQU $9E45
_LABEL___LABEL381 EQU $9E86
_LABEL___LABEL630 EQU $9ECE
_LABEL___LABEL631 EQU $9EDB
_LABEL___LABEL390 EQU $9EEC
_LABEL___LABEL632 EQU $9F01
_LABEL___LABEL392 EQU $9F0E
_LABEL___LABEL633 EQU $9F25
_LABEL___LABEL634 EQU $9F32
_LABEL___LABEL394 EQU $9F3D
_LABEL___LABEL635 EQU $9F54
_LABEL___LABEL636 EQU $9F61
_LABEL___LABEL396 EQU $9F6E
_LABEL___LABEL637 EQU $9F85
_LABEL___LABEL398 EQU $9F96
_LABEL___LABEL638 EQU $9FAC
_LABEL___LABEL400 EQU $9FB9
_LABEL___LABEL639 EQU $9FD0
_LABEL___LABEL402 EQU $9FDD
_LABEL___LABEL640 EQU $9FF4
_LABEL___LABEL641 EQU $A003
_LABEL___LABEL404 EQU $A010
_LABEL___LABEL642 EQU $A027
_LABEL___LABEL643 EQU $A036
_LABEL___LABEL391 EQU $A040
_LABEL___LABEL383 EQU $A048
_LABEL___LABEL382 EQU $A050
_LABEL___LABEL644 EQU $A077
_LABEL___LABEL645 EQU $A084
_LABEL___LABEL409 EQU $A091
_LABEL___LABEL646 EQU $A0A5
_LABEL___LABEL647 EQU $A0B1
_LABEL___LABEL413 EQU $A0BE
_LABEL___LABEL648 EQU $A0D1
_LABEL___LABEL415 EQU $A0E1
_LABEL___LABEL649 EQU $A0F0
_LABEL___LABEL417 EQU $A100
_LABEL___LABEL420 EQU $A163
_LABEL___LABEL419 EQU $A175
_LABEL__nextLogicalSentence EQU $A183
_LABEL___LABEL650 EQU $A190
_LABEL___LABEL651 EQU $A1A9
_LABEL___LABEL425 EQU $A1B5
_LABEL___LABEL427 EQU $A1DD
__populateLogicalSentence__leave EQU $A208
__checkWordVoc EQU $A211
_LABEL___LABEL429 EQU $A240
_LABEL___LABEL433 EQU $A27E
_LABEL___LABEL430 EQU $A2A9
_LABEL___LABEL435 EQU $A2C1
_LABEL___LABEL439 EQU $A308
_LABEL___LABEL437 EQU $A31C
__checkWordVoc__leave EQU $A324
__isSeparator EQU $A33D
__isSeparator__leave EQU $A352
__parser EQU $A353
_LABEL___LABEL440 EQU $A394
_LABEL___LABEL445 EQU $A3C4
_LABEL___LABEL446 EQU $A3D8
_LABEL___LABEL443 EQU $A3DB
_LABEL___LABEL447 EQU $A3FD
_LABEL___LABEL451 EQU $A418
_LABEL___LABEL453 EQU $A443
_LABEL___LABEL452 EQU $A44A
_LABEL___LABEL464 EQU $A4B0
_LABEL___LABEL466 EQU $A4D6
_LABEL___LABEL468 EQU $A4FD
_LABEL___LABEL465 EQU $A521
_LABEL___LABEL653 EQU $A563
_LABEL___LABEL463 EQU $A56B
_LABEL___LABEL461 EQU $A581
_LABEL___LABEL444 EQU $A596
_LABEL___LABEL442 EQU $A5A7
_LABEL__pronominalsString EQU $A5B1
__parser__leave EQU $A5BF
__getLogicalSentence EQU $A5C4
_LABEL___LABEL479 EQU $A5D4
__getLogicalSentence__leave EQU $A5D9
__useLiteralSentence EQU $A5DA
__useLiteralSentence__leave EQU $A5F3
__doCLS EQU $A5F4
__doCLS__leave EQU $A623
__pushPROC EQU $A624
_LABEL___LABEL481 EQU $A643
_LABEL___LABEL483 EQU $A652
__pushPROC__leave EQU $A6D4
__popPROC EQU $A6DD
_LABEL___LABEL485 EQU $A76F
__popPROC__leave EQU $A778
__stepPROCEntryCondacts EQU $A779
__stepPROCEntryCondacts__leave EQU $A7C0
__getCondOrValueAndInc EQU $A7C9
__getCondOrValueAndInc__leave EQU $A804
__getValueOrIndirection EQU $A809
_LABEL___LABEL487 EQU $A834
__getValueOrIndirection__leave EQU $A837
__PRIVATETapeOp EQU $A83C
_core___ERROR EQU $A85B
_core___ERROR_CODE EQU $A85F
_core___STOP EQU $A861
_core___MEM_INIT EQU $A865
_core___MEM_INIT2 EQU $A86B
_core_MEM_FREE EQU $A889
_core___MEM_FREE EQU $A889
_LOAD_CODE EQU $A8DB
_core___LOAD_CODE EQU $A8E1
_core_LD_TYPE EQU $A95F
_core_LOAD_ERROR EQU $A9AF
_SAVE_CODE EQU $A9CD
_core___SAVE_CODE EQU $A9D4
__PRIVATETapeOp__leave EQU $AA85
__PRIVATESaveOption EQU $AA86
_LABEL___LABEL489 EQU $AA99
__PRIVATESaveOption__leave EQU $AA9C
__PRIVATEGetFilename EQU $AAA5
__PRIVATEGetFilename__leave EQU $AAF0
__PRIVATEDoSAVE EQU $AAF5
_LABEL___LABEL492 EQU $AB8B
_LABEL___LABEL493 EQU $AB8F
_LABEL___LABEL495 EQU $ABA8
__PRIVATEDoSAVE__leave EQU $ABBE
__PRIVATEDoLOAD EQU $ABC7
_LABEL___LABEL501 EQU $AC5C
_LABEL___LABEL498 EQU $AC5F
_LABEL___LABEL499 EQU $AC63
_LABEL___LABEL502 EQU $AC7A
_LABEL___LABEL503 EQU $AC8E
__PRIVATEDoLOAD__leave EQU $AC97
__PRIVATEDoRESET EQU $ACA0
__PRIVATEDoRESET__leave EQU $ACA3
_LABEL___LABEL506 EQU $ACA4
__PRIVATEDoRESTART EQU $ACA4
__PRIVATEDoRESTART__leave EQU $ACBF
__PRIVATEDoEND EQU $ACC0
_LABEL___LABEL508 EQU $ACF5
__PRIVATEDoEND__leave EQU $ACFE
__PRIVATEGetObjectLocParam EQU $AD03
__PRIVATEGetObjectLocParam__leave EQU $AD21
__PRIVATEDoALL EQU $AD26
_LABEL___LABEL510 EQU $AD77
_LABEL___LABEL512 EQU $AD85
_LABEL___LABEL513 EQU $AD88
_LABEL___LABEL515 EQU $ADAE
_LABEL___LABEL654 EQU $ADEB
__PRIVATEDoALL__leave EQU $AE5D
__PRIVATEDoDONE EQU $AE62
_LABEL___LABEL518 EQU $AE7E
__PRIVATEDoDONE__leave EQU $AE86
__PRIVATEDoLISTAT EQU $AE87
_LABEL___LABEL523 EQU $AEC0
_LABEL___LABEL656 EQU $AF04
_LABEL___LABEL530 EQU $AF1B
_LABEL___LABEL657 EQU $AF27
_LABEL___LABEL535 EQU $AF49
_LABEL___LABEL534 EQU $AF4F
_LABEL___LABEL538 EQU $AF67
_LABEL___LABEL528 EQU $AF6F
_LABEL___LABEL524 EQU $AF76
_LABEL___LABEL520 EQU $AF83
__PRIVATEDoLISTAT__leave EQU $AF9D
__PRIVATEDoHASAT EQU $AFA7
_LABEL___LABEL658 EQU $AFBF
_LABEL___LABEL659 EQU $AFC2
_LABEL___LABEL540 EQU $AFF3
__PRIVATEDoHASAT__leave EQU $B006
__PRIVATEDoWEAR EQU $B010
_LABEL___LABEL541 EQU $B05A
_LABEL___LABEL543 EQU $B06B
_LABEL___LABEL545 EQU $B07C
_LABEL___LABEL547 EQU $B08D
_LABEL___LABEL550 EQU $B0AF
_LABEL___LABEL542 EQU $B0B2
__PRIVATEDoWEAR__leave EQU $B0B8
__PRIVATEDoREMOVE EQU $B0C1
_LABEL___LABEL551 EQU $B124
_LABEL___LABEL660 EQU $B136
_LABEL___LABEL553 EQU $B143
_LABEL___LABEL555 EQU $B154
_LABEL___LABEL557 EQU $B167
_LABEL___LABEL552 EQU $B185
__PRIVATEDoREMOVE__leave EQU $B18B
__PRIVATEDoGET EQU $B194
_LABEL___LABEL559 EQU $B1D8
_LABEL___LABEL561 EQU $B1EB
_LABEL___LABEL563 EQU $B20D
_LABEL___LABEL565 EQU $B233
_LABEL___LABEL560 EQU $B251
__PRIVATEDoGET__leave EQU $B257
__PRIVATEDoDROP EQU $B260
_LABEL___LABEL570 EQU $B2B9
_LABEL___LABEL567 EQU $B2BC
_LABEL___LABEL571 EQU $B2CD
_LABEL___LABEL573 EQU $B2DF
_LABEL___LABEL568 EQU $B2E5
__PRIVATEDoDROP__leave EQU $B2EB
__PRIVATEDoPUTIN EQU $B2F4
_LABEL___LABEL575 EQU $B333
_LABEL___LABEL577 EQU $B345
_LABEL___LABEL661 EQU $B357
_LABEL___LABEL579 EQU $B364
_LABEL___LABEL582 EQU $B381
_LABEL___LABEL576 EQU $B3A0
__PRIVATEDoPUTIN__leave EQU $B3A6
__PRIVATEDoTAKEOUT EQU $B3B0
_LABEL___LABEL583 EQU $B3FC
_LABEL___LABEL585 EQU $B423
_LABEL___LABEL662 EQU $B436
_LABEL___LABEL587 EQU $B458
_LABEL___LABEL663 EQU $B469
_LABEL___LABEL664 EQU $B487
_LABEL___LABEL589 EQU $B494
_LABEL___LABEL591 EQU $B4BA
_LABEL___LABEL584 EQU $B4D8
__PRIVATEDoTAKEOUT__leave EQU $B4DE
__PRIVATEAutoEND EQU $B4E8
_LABEL___LABEL593 EQU $B51F
__PRIVATEAutoEND__leave EQU $B526
__PRIVATEcheckLocCARRWORNHERE EQU $B530
_LABEL___LABEL596 EQU $B588
__PRIVATEcheckLocCARRWORNHERE__leave EQU $B58B
__PRIVATEwindowCheck EQU $B590
_LABEL___LABEL600 EQU $B5C6
__PRIVATEwindowCheck__leave EQU $B5DB
__PRIVATEDoBEEP EQU $B5DC
__PRIVATEDoBEEP__leave EQU $B643
__PRIVATEGetColor EQU $B648
_LABEL___LABEL604 EQU $B678
_LABEL___LABEL606 EQU $B684
__PRIVATEGetColor__leave EQU $B695
__initFlags EQU $B69A
__initFlags__leave EQU $B720
__doCALL EQU $B721
__doCALL__leave EQU $B73B
__jumpToBank EQU $B73C
__jumpToBank__leave EQU $B752
__setupIM EQU $B753
__setupIM__leave EQU $B77A
__GetCurrentContact EQU $B77B
__GetCurrentContact__leave EQU $B7B9
_LABEL___LABEL7 EQU $B7BE
_core_SP_PixelDown EQU $B8BF
_core_SCREEN_ADDR EQU $B8E7
_core_SCREEN_ATTR_ADDR EQU $B8E9
_core_SP_PixelUp EQU $B8EB
_core_MEM_ALLOC EQU $B90E
_core___MEM_ALLOC EQU $B90E
_core___MUL16 EQU $B95D
_core___ARRAY_PTR EQU $B972
_core___ARRAY EQU $B976
_core___MEM_CALLOC EQU $B9CB
_core___ALLOC_LOCAL_ARRAY EQU $B9E1
_core___ALLOC_INITIALIZED_LOCAL_ARRAY EQU $B9F5
_core___BAND16 EQU $BA04
_core___FPSTACK_PUSH2 EQU $BA0B
_core___FPSTACK_I16 EQU $BA1C
_core_BEEP EQU $BA27
_core___BOR16 EQU $BA3A
_core_BRIGHT EQU $BA41
_core___SET_BRIGHT EQU $BA44
_core_BRIGHT_TMP EQU $BA5B
_core_CLS EQU $BA60
_core___ABS16 EQU $BA8F
_core___NEGHL EQU $BA92
_core___DIVU16 EQU $BA9A
_core___DIVU16_FAST EQU $BA9A
_core___DIV16LOOP EQU $BAA1
_core___DIV16NOADD EQU $BAAC
_core___MODU16 EQU $BAB2
_core___DIVI16 EQU $BAB7
_core___DIVI16_FAST EQU $BAB7
_core___DIVI16A EQU $BAC5
_core___DIVI16B EQU $BACA
_core___MODI16 EQU $BAD3
_core___EQ16 EQU $BAD8
_core_FLASH EQU $BADE
_core___SET_FLASH EQU $BAE1
_core_FLASH_TMP EQU $BAF8
_core_INK EQU $BAFD
_core_INK_TMP EQU $BB18
_core___SUB32 EQU $BB1E
_core___LEI32 EQU $BB32
_core___MEMCPY EQU $BB4F
_core___MULF EQU $BB68
_core___ON_GOSUB EQU $BB71
_core___ON_GOTO EQU $BB77
_core___ON_GOTO_START EQU $BB79
_core_PAPER EQU $BB89
_core_PAPER_TMP EQU $BBA7
_core___ILOADF EQU $BBAD
_core___LOADF EQU $BBB1
_core___PLOADF EQU $BBBB
_core___PISTOREF EQU $BBC2
_core___ISTOREF EQU $BBC9
_core___STOREF EQU $BBCF
_core___PSTOREF EQU $BBD9
_core___REALLOC EQU $BBE3
_core___SHRL32 EQU $BC17
_core___ABS32 EQU $BC20
_core___NEG32 EQU $BC23
_core___I8TOFREG EQU $BC35
_core___I32TOFREG EQU $BC3B
_core___U8TOFREG EQU $BC49
_core___U32TOFREG EQU $BC4E
_core___U32TOFREG_LOOP EQU $BC62
_LABEL___LABEL652 EQU $BC84
_LABEL___LABEL655 EQU $BC87
