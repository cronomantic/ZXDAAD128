DDB_HEADER EQU 47705 
START_PALETTE EQU 47763 
VECT_EXTERN EQU 47779 
VECT_SFX EQU 47781 
VECT_INT EQU 47783 
VECT_0 EQU 47785 
VECT_1 EQU 47787 
VECT_2 EQU 47789 
VECT_3 EQU 47791 
VECT_4 EQU 47793 
VECT_5 EQU 47795 
VECT_6 EQU 47797 
VECT_7 EQU 47799 
VECT_8 EQU 47801 
VECT_9 EQU 47803 
START_DDB EQU 47805 
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
_LABEL___LABEL627 EQU $6A95
__winX EQU $6A98
__winX___DATA_____PTR__ EQU $6A9A
__winX___DATA__ EQU $6A9C
_LABEL___LABEL628 EQU $6AA4
__winY EQU $6AA7
__winY___DATA_____PTR__ EQU $6AA9
__winY___DATA__ EQU $6AAB
_LABEL___LABEL629 EQU $6AB3
__winW EQU $6AB6
__winW___DATA_____PTR__ EQU $6AB8
__winW___DATA__ EQU $6ABA
_LABEL___LABEL630 EQU $6AC2
__winH EQU $6AC5
__winH___DATA_____PTR__ EQU $6AC7
__winH___DATA__ EQU $6AC9
_LABEL___LABEL631 EQU $6AD1
__cursorX EQU $6AD4
__cursorX___DATA_____PTR__ EQU $6AD6
__cursorX___DATA__ EQU $6AD8
_LABEL___LABEL632 EQU $6AE0
__cursorY EQU $6AE3
__cursorY___DATA_____PTR__ EQU $6AE5
__cursorY___DATA__ EQU $6AE7
_LABEL___LABEL633 EQU $6AEF
__winMode EQU $6AF2
__winMode___DATA_____PTR__ EQU $6AF4
__winMode___DATA__ EQU $6AF6
_LABEL___LABEL634 EQU $6AFE
__winAttr EQU $6B01
__winAttr___DATA_____PTR__ EQU $6B03
__winAttr___DATA__ EQU $6B05
_LABEL___LABEL635 EQU $6B0D
__lsBuffer0 EQU $6B10
__lsBuffer0___DATA_____PTR__ EQU $6B12
__lsBuffer0___DATA__ EQU $6B14
_LABEL___LABEL636 EQU $6B47
__lsBuffer1 EQU $6B4A
__lsBuffer1___DATA_____PTR__ EQU $6B4C
__lsBuffer1___DATA__ EQU $6B4E
_LABEL___LABEL637 EQU $6B68
__numProc EQU $6B6B
__numProc___DATA_____PTR__ EQU $6B6D
__numProc___DATA__ EQU $6B6F
_LABEL___LABEL638 EQU $6B79
__entryIniProc EQU $6B7C
__entryIniProc___DATA_____PTR__ EQU $6B7E
__entryIniProc___DATA__ EQU $6B80
_LABEL___LABEL639 EQU $6B94
__entryProc EQU $6B97
__entryProc___DATA_____PTR__ EQU $6B99
__entryProc___DATA__ EQU $6B9B
_LABEL___LABEL640 EQU $6BAF
__condactIniProc EQU $6BB2
__condactIniProc___DATA_____PTR__ EQU $6BB4
__condactIniProc___DATA__ EQU $6BB6
_LABEL___LABEL641 EQU $6BCA
__condactProc EQU $6BCD
__condactProc___DATA_____PTR__ EQU $6BCF
__condactProc___DATA__ EQU $6BD1
_LABEL___LABEL642 EQU $6BE5
__entryDOALLProc EQU $6BE8
__entryDOALLProc___DATA_____PTR__ EQU $6BEA
__entryDOALLProc___DATA__ EQU $6BEC
_LABEL___LABEL643 EQU $6C00
__condactDOALLProc EQU $6C03
__condactDOALLProc___DATA_____PTR__ EQU $6C05
__condactDOALLProc___DATA__ EQU $6C07
_LABEL___LABEL644 EQU $6C1B
__continueEntryProc EQU $6C1E
__continueEntryProc___DATA_____PTR__ EQU $6C20
__continueEntryProc___DATA__ EQU $6C22
_LABEL___LABEL645 EQU $6C2C
__condactFlagList EQU $6C2F
__condactFlagList___DATA_____PTR__ EQU $6C31
__condactFlagList___DATA__ EQU $6C33
_LABEL___LABEL646 EQU $6CB3
_core_ZXBASIC_USER_DATA_END EQU $6CB6
_core___MAIN_PROGRAM__ EQU $6CB6
_LABEL___LABEL1 EQU $6D04
_LABEL___LABEL2 EQU $6DF4
_LABEL___LABEL4 EQU $6DFA
_LABEL__NextCondact EQU $6E10
_LABEL___LABEL6 EQU $6E2A
_LABEL___LABEL570 EQU $6E44
_LABEL___LABEL8 EQU $6E48
_LABEL___LABEL11 EQU $6E99
_LABEL___LABEL571 EQU $6EFE
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
_LABEL___LABEL572 EQU $72B4
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
_LABEL___LABEL574 EQU $7555
_LABEL___LABEL50 EQU $7560
_LABEL__condactCREATE EQU $7571
_LABEL___LABEL575 EQU $759F
_LABEL___LABEL52 EQU $75AA
_LABEL__condactSWAP EQU $75BC
_LABEL__condactPLACE EQU $760A
_LABEL___LABEL576 EQU $7638
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
_LABEL___LABEL577 EQU $77AB
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
_LABEL___LABEL578 EQU $7D45
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
_LABEL___LABEL579 EQU $7EBE
_LABEL__condactPUTO EQU $7F01
_LABEL___LABEL581 EQU $7F28
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
_LABEL___LABEL582 EQU $866D
_LABEL___LABEL141 EQU $867B
__ToUpper__leave EQU $867E
__ToLower EQU $8687
_LABEL___LABEL583 EQU $86A4
_LABEL___LABEL143 EQU $86B2
__ToLower__leave EQU $86B5
__strcmp EQU $86BE
_LABEL___LABEL144 EQU $86CD
_LABEL___LABEL148 EQU $86EC
_LABEL___LABEL150 EQU $86FA
_LABEL___LABEL146 EQU $8717
__strcmp__leave EQU $8721
__DecompressPicture EQU $872C
_dzx0_standard_dcp EQU $87E4
_dzx0s_dcp_literals EQU $87EF
_dzx0s_dcp_copy EQU $87FB
_dzx0s_dcp_new_offset EQU $8806
_dzx0s_dcp_elias EQU $881F
_dzx0s_dcp_elias_loop EQU $8820
_dzx0s_dcp_elias_skip EQU $8826
_dzx0s_dcp_elias_backtrack EQU $8827
_dzx0s_ldir_line EQU $882E
_dzx0s_next_iteration EQU $882F
_dzx0s_ldir_line_back EQU $8842
_dzx0s_next_iteration_back EQU $8843
_ConvHLDEToScreenAddress EQU $8858
_ConvDEToScreenAddress EQU $8870
_dzx0_standard EQU $8889
_dzx0s_literals EQU $8890
_dzx0s_copy EQU $889B
_dzx0s_new_offset EQU $88A5
_dzx0s_elias EQU $88BE
_dzx0s_elias_loop EQU $88BF
_dzx0s_elias_skip EQU $88C5
_dzx0s_elias_backtrack EQU $88C6
__DecompressPicture__leave EQU $88CD
__preparePicture EQU $88CE
_LABEL___LABEL152 EQU $890C
_LABEL___LABEL153 EQU $891A
_LABEL___LABEL157 EQU $894B
_LABEL___LABEL155 EQU $8958
_LABEL__EndPreparePicture EQU $8961
__preparePicture__leave EQU $896A
__showBufferedPicture EQU $8973
_LABEL___LABEL159 EQU $8993
__showBufferedPicture__leave EQU $89AA
__WaitForKey EQU $89AF
_LABEL___LABEL162 EQU $89B3
__WaitForKey__leave EQU $89BA
__clearBox EQU $89BB
_BLPaintHeightExitLoop EQU $8A16
__clearBox__leave EQU $8A51
__putGlyph42 EQU $8A5D
__putGlyph42__leave EQU $8AC7
__setFrames EQU $8AC8
__setFrames__leave EQU $8ACD
__waitForTimeout EQU $8ACE
_LABEL___LABEL165 EQU $8B18
_LABEL___LABEL167 EQU $8B38
_LABEL___LABEL163 EQU $8B42
_LABEL___LABEL164 EQU $8B45
__waitForTimeout__leave EQU $8B46
__popCurrentWindow EQU $8B4F
__popCurrentWindow__leave EQU $8BDF
__pushCurrentWindow EQU $8BE8
__pushCurrentWindow__leave EQU $8C78
__GetCharAddress EQU $8C81
_LABEL___LABEL171 EQU $8CBB
__GetCharAddress__leave EQU $8CC1
__PRIVATEconvertCoords42 EQU $8CCA
_LABEL___LABEL173 EQU $8D26
__PRIVATEconvertCoords42__leave EQU $8D3D
__clearCurrentLine EQU $8D47
_LABEL___LABEL174 EQU $8D80
_LABEL___LABEL176 EQU $8D97
__clearCurrentLine__leave EQU $8DA8
__scrollUp EQU $8DAD
_LABEL___LABEL177 EQU $8E1E
_LABEL___LABEL179 EQU $8E35
__scrollUp__leave EQU $8E46
__checkPrintedLines EQU $8E4B
_LABEL___LABEL189 EQU $8E97
_LABEL___LABEL187 EQU $8EE9
__checkPrintedLines__leave EQU $8EED
__printChar EQU $8EF2
_LABEL___LABEL190 EQU $8F0D
_LABEL___LABEL192 EQU $8F1F
_LABEL___LABEL194 EQU $8F2F
_LABEL___LABEL196 EQU $8F3E
_LABEL___LABEL198 EQU $8F57
_LABEL___LABEL199 EQU $8F9C
__printChar__leave EQU $8FAE
__printOutMsg EQU $8FB7
_LABEL___LABEL206 EQU $8FF0
_LABEL___LABEL211 EQU $9019
_LABEL___LABEL212 EQU $904C
_LABEL___LABEL223 EQU $908E
_LABEL___LABEL210 EQU $9094
_LABEL___LABEL584 EQU $90C1
_LABEL___LABEL226 EQU $90D0
_LABEL___LABEL208 EQU $90E1
__printOutMsg__leave EQU $90E8
__errorCode EQU $90F1
_LABEL___LABEL227 EQU $910F
_LABEL__ErrorCodeText EQU $9112
__errorCode__leave EQU $911F
__getToken EQU $9128
__getToken__leave EQU $9147
__printMsg EQU $9148
_LABEL___LABEL229 EQU $9161
_LABEL___LABEL234 EQU $9199
_LABEL___LABEL238 EQU $91E2
_LABEL___LABEL236 EQU $91F3
_LABEL___LABEL232 EQU $91FD
_LABEL___LABEL242 EQU $9223
_LABEL___LABEL248 EQU $9257
_LABEL___LABEL231 EQU $9276
__printMsg__leave EQU $927E
__getSizeMessage EQU $9288
__getSizeMessage__leave EQU $9295
__getMessage EQU $9296
__getMessage__leave EQU $9319
__getSystemMsg EQU $9325
__getSystemMsg__leave EQU $9347
__printSystemMsg EQU $9350
__printSystemMsg__leave EQU $9373
__printUserMsg EQU $937C
_LABEL___LABEL256 EQU $9393
__printUserMsg__leave EQU $93A5
__printLocationMsg EQU $93AE
_LABEL___LABEL258 EQU $93C5
__printLocationMsg__leave EQU $93D7
__printMaluvaExtraMsg EQU $93E0
_LABEL___LABEL585 EQU $93FC
_LABEL___LABEL586 EQU $9415
_LABEL___LABEL259 EQU $9444
_LABEL___LABEL261 EQU $945E
_LABEL___LABEL263 EQU $9477
_LABEL___LABEL260 EQU $9486
_LABEL___LABEL266 EQU $949A
__printMaluvaExtraMsg__leave EQU $9509
__cutMsgUntilDot EQU $9514
__cutMsgUntilDot__leave EQU $9528
__skipSpaces EQU $9529
__skipSpaces__leave EQU $9531
__findEndOfWord EQU $9532
__findEndOfWord__leave EQU $9542
__printObjectMsgModif EQU $9543
__printObjectMsgModif__leave EQU $9596
__printObjectMsg EQU $95A0
_LABEL___LABEL270 EQU $95BA
_LABEL___LABEL271 EQU $95F2
_LABEL___LABEL272 EQU $95FB
__printObjectMsg__leave EQU $9605
__printBase10 EQU $960F
_LABEL___LABEL274 EQU $9633
__printBase10__leave EQU $9653
__getObjectId EQU $965C
_LABEL___LABEL276 EQU $9674
_LABEL___LABEL280 EQU $9681
_LABEL___LABEL588 EQU $969F
_LABEL___LABEL589 EQU $96C3
_LABEL___LABEL285 EQU $96D5
_LABEL___LABEL281 EQU $96ED
_LABEL___LABEL277 EQU $96F0
__getObjectId__leave EQU $96FD
__getObjectWeight EQU $9708
_LABEL___LABEL289 EQU $9721
_LABEL___LABEL293 EQU $9728
_LABEL___LABEL590 EQU $9783
_LABEL___LABEL591 EQU $9799
_LABEL___LABEL304 EQU $97A4
_LABEL___LABEL305 EQU $97D0
_LABEL___LABEL301 EQU $97D3
_LABEL___LABEL300 EQU $97DE
_LABEL___LABEL294 EQU $97F6
_LABEL___LABEL290 EQU $97F9
_LABEL___LABEL309 EQU $9819
__getObjectWeight__leave EQU $9820
__referencedObject EQU $9829
_LABEL___LABEL310 EQU $98A5
__referencedObject__leave EQU $98B8
__initObjects EQU $98C1
_LABEL___LABEL312 EQU $994A
_LABEL___LABEL316 EQU $9959
_LABEL___LABEL314 EQU $9A31
__initObjects__leave EQU $9A4C
__PutInputEcho EQU $9A51
_LABEL___LABEL317 EQU $9A93
__PutInputEcho__leave EQU $9A9A
__prompt EQU $9AA4
_LABEL___LABEL320 EQU $9AC8
_LABEL___LABEL325 EQU $9AE2
_LABEL___LABEL324 EQU $9AF4
_LABEL___LABEL322 EQU $9B01
_LABEL___LABEL328 EQU $9B22
_LABEL___LABEL332 EQU $9B42
_LABEL___LABEL335 EQU $9B45
_LABEL___LABEL337 EQU $9B46
_LABEL___LABEL592 EQU $9B8F
_LABEL___LABEL339 EQU $9B9A
_LABEL___LABEL344 EQU $9BD9
_LABEL___LABEL345 EQU $9BE4
_LABEL___LABEL340 EQU $9BF1
_LABEL___LABEL351 EQU $9C2D
_LABEL___LABEL353 EQU $9C48
_LABEL___LABEL330 EQU $9C65
_LABEL__retContinue EQU $9C76
_LABEL___LABEL355 EQU $9C84
_LABEL___LABEL357 EQU $9CBE
_LABEL___LABEL359 EQU $9CD7
__prompt__leave EQU $9CDB
__clearLogicalSentences EQU $9CE4
__clearLogicalSentences__leave EQU $9D01
__populateLogicalSentence EQU $9D02
_LABEL___LABEL360 EQU $9D43
_LABEL___LABEL593 EQU $9D8B
_LABEL___LABEL594 EQU $9D98
_LABEL___LABEL369 EQU $9DA9
_LABEL___LABEL595 EQU $9DBE
_LABEL___LABEL371 EQU $9DCB
_LABEL___LABEL596 EQU $9DE2
_LABEL___LABEL597 EQU $9DEF
_LABEL___LABEL373 EQU $9DFA
_LABEL___LABEL598 EQU $9E11
_LABEL___LABEL599 EQU $9E1E
_LABEL___LABEL375 EQU $9E2B
_LABEL___LABEL600 EQU $9E42
_LABEL___LABEL377 EQU $9E53
_LABEL___LABEL601 EQU $9E69
_LABEL___LABEL379 EQU $9E76
_LABEL___LABEL602 EQU $9E8D
_LABEL___LABEL381 EQU $9E9A
_LABEL___LABEL603 EQU $9EB1
_LABEL___LABEL604 EQU $9EC0
_LABEL___LABEL383 EQU $9ECD
_LABEL___LABEL605 EQU $9EE4
_LABEL___LABEL606 EQU $9EF3
_LABEL___LABEL370 EQU $9EFD
_LABEL___LABEL362 EQU $9F05
_LABEL___LABEL361 EQU $9F0D
_LABEL___LABEL607 EQU $9F34
_LABEL___LABEL608 EQU $9F41
_LABEL___LABEL388 EQU $9F4E
_LABEL___LABEL609 EQU $9F62
_LABEL___LABEL610 EQU $9F6E
_LABEL___LABEL392 EQU $9F7B
_LABEL___LABEL611 EQU $9F8E
_LABEL___LABEL394 EQU $9F9E
_LABEL___LABEL612 EQU $9FAD
_LABEL___LABEL396 EQU $9FBD
_LABEL___LABEL399 EQU $A020
_LABEL___LABEL398 EQU $A032
_LABEL__nextLogicalSentence EQU $A040
_LABEL___LABEL613 EQU $A04D
_LABEL___LABEL614 EQU $A066
_LABEL___LABEL404 EQU $A072
_LABEL___LABEL406 EQU $A09A
__populateLogicalSentence__leave EQU $A0C5
__checkWordVoc EQU $A0CE
_LABEL___LABEL408 EQU $A0FD
_LABEL___LABEL412 EQU $A13B
_LABEL___LABEL409 EQU $A166
_LABEL___LABEL414 EQU $A17E
_LABEL___LABEL418 EQU $A1C5
_LABEL___LABEL416 EQU $A1D9
__checkWordVoc__leave EQU $A1E1
__isSeparator EQU $A1FA
__isSeparator__leave EQU $A20F
__parser EQU $A210
_LABEL___LABEL419 EQU $A251
_LABEL___LABEL424 EQU $A281
_LABEL___LABEL425 EQU $A295
_LABEL___LABEL422 EQU $A298
_LABEL___LABEL426 EQU $A2BA
_LABEL___LABEL430 EQU $A2D5
_LABEL___LABEL432 EQU $A300
_LABEL___LABEL431 EQU $A307
_LABEL___LABEL440 EQU $A352
_LABEL___LABEL423 EQU $A367
_LABEL___LABEL421 EQU $A378
_LABEL__pronominalsString EQU $A382
__parser__leave EQU $A390
__getLogicalSentence EQU $A395
_LABEL___LABEL442 EQU $A3A5
__getLogicalSentence__leave EQU $A3AA
__useLiteralSentence EQU $A3AB
__useLiteralSentence__leave EQU $A3C4
__doCLS EQU $A3C5
__doCLS__leave EQU $A3F4
__pushPROC EQU $A3F5
_LABEL___LABEL444 EQU $A414
_LABEL___LABEL446 EQU $A423
__pushPROC__leave EQU $A4A5
__popPROC EQU $A4AE
_LABEL___LABEL448 EQU $A540
__popPROC__leave EQU $A549
__stepPROCEntryCondacts EQU $A54A
__stepPROCEntryCondacts__leave EQU $A591
__getCondOrValueAndInc EQU $A59A
__getCondOrValueAndInc__leave EQU $A5D5
__getValueOrIndirection EQU $A5DA
_LABEL___LABEL450 EQU $A605
__getValueOrIndirection__leave EQU $A608
__PRIVATETapeOp EQU $A60D
_core___ERROR EQU $A62C
_core___ERROR_CODE EQU $A630
_core___STOP EQU $A632
_core___MEM_INIT EQU $A636
_core___MEM_INIT2 EQU $A63C
_core_MEM_FREE EQU $A65A
_core___MEM_FREE EQU $A65A
_LOAD_CODE EQU $A6AC
_core___LOAD_CODE EQU $A6B2
_core_LD_TYPE EQU $A730
_core_LOAD_ERROR EQU $A780
_SAVE_CODE EQU $A79E
_core___SAVE_CODE EQU $A7A5
__PRIVATETapeOp__leave EQU $A856
__PRIVATESaveOption EQU $A857
_LABEL___LABEL452 EQU $A86A
__PRIVATESaveOption__leave EQU $A86D
__PRIVATEGetFilename EQU $A876
__PRIVATEGetFilename__leave EQU $A8C1
__PRIVATEDoSAVE EQU $A8C6
_LABEL___LABEL455 EQU $A95C
_LABEL___LABEL456 EQU $A960
_LABEL___LABEL458 EQU $A979
__PRIVATEDoSAVE__leave EQU $A98F
__PRIVATEDoLOAD EQU $A998
_LABEL___LABEL464 EQU $AA2D
_LABEL___LABEL461 EQU $AA30
_LABEL___LABEL462 EQU $AA34
_LABEL___LABEL465 EQU $AA4B
_LABEL___LABEL466 EQU $AA5F
__PRIVATEDoLOAD__leave EQU $AA68
__PRIVATEDoRESET EQU $AA71
__PRIVATEDoRESET__leave EQU $AA74
_LABEL___LABEL469 EQU $AA75
__PRIVATEDoRESTART EQU $AA75
__PRIVATEDoRESTART__leave EQU $AA90
__PRIVATEDoEND EQU $AA91
_LABEL___LABEL471 EQU $AAC6
__PRIVATEDoEND__leave EQU $AACF
__PRIVATEGetObjectLocParam EQU $AAD4
__PRIVATEGetObjectLocParam__leave EQU $AAF2
__PRIVATEDoALL EQU $AAF7
_LABEL___LABEL473 EQU $AB48
_LABEL___LABEL475 EQU $AB56
_LABEL___LABEL476 EQU $AB59
_LABEL___LABEL478 EQU $AB7F
_LABEL___LABEL616 EQU $ABBC
__PRIVATEDoALL__leave EQU $AC2E
__PRIVATEDoDONE EQU $AC33
_LABEL___LABEL481 EQU $AC4F
__PRIVATEDoDONE__leave EQU $AC57
__PRIVATEDoLISTAT EQU $AC58
_LABEL___LABEL486 EQU $AC91
_LABEL___LABEL618 EQU $ACD5
_LABEL___LABEL493 EQU $ACEC
_LABEL___LABEL619 EQU $ACF8
_LABEL___LABEL498 EQU $AD1A
_LABEL___LABEL497 EQU $AD20
_LABEL___LABEL501 EQU $AD38
_LABEL___LABEL491 EQU $AD40
_LABEL___LABEL487 EQU $AD47
_LABEL___LABEL483 EQU $AD54
__PRIVATEDoLISTAT__leave EQU $AD6E
__PRIVATEDoHASAT EQU $AD78
_LABEL___LABEL620 EQU $AD90
_LABEL___LABEL621 EQU $AD93
_LABEL___LABEL503 EQU $ADC4
__PRIVATEDoHASAT__leave EQU $ADD7
__PRIVATEDoWEAR EQU $ADE1
_LABEL___LABEL504 EQU $AE2B
_LABEL___LABEL506 EQU $AE3C
_LABEL___LABEL508 EQU $AE4D
_LABEL___LABEL510 EQU $AE5E
_LABEL___LABEL513 EQU $AE80
_LABEL___LABEL505 EQU $AE83
__PRIVATEDoWEAR__leave EQU $AE89
__PRIVATEDoREMOVE EQU $AE92
_LABEL___LABEL514 EQU $AEF5
_LABEL___LABEL622 EQU $AF07
_LABEL___LABEL516 EQU $AF14
_LABEL___LABEL518 EQU $AF25
_LABEL___LABEL520 EQU $AF38
_LABEL___LABEL515 EQU $AF56
__PRIVATEDoREMOVE__leave EQU $AF5C
__PRIVATEDoGET EQU $AF65
_LABEL___LABEL522 EQU $AFA9
_LABEL___LABEL524 EQU $AFBC
_LABEL___LABEL526 EQU $AFDE
_LABEL___LABEL528 EQU $B004
_LABEL___LABEL523 EQU $B022
__PRIVATEDoGET__leave EQU $B028
__PRIVATEDoDROP EQU $B031
_LABEL___LABEL533 EQU $B08A
_LABEL___LABEL530 EQU $B08D
_LABEL___LABEL534 EQU $B09E
_LABEL___LABEL536 EQU $B0B0
_LABEL___LABEL531 EQU $B0B6
__PRIVATEDoDROP__leave EQU $B0BC
__PRIVATEDoPUTIN EQU $B0C5
_LABEL___LABEL538 EQU $B104
_LABEL___LABEL540 EQU $B116
_LABEL___LABEL623 EQU $B128
_LABEL___LABEL542 EQU $B135
_LABEL___LABEL545 EQU $B152
_LABEL___LABEL539 EQU $B171
__PRIVATEDoPUTIN__leave EQU $B177
__PRIVATEDoTAKEOUT EQU $B181
_LABEL___LABEL546 EQU $B1CD
_LABEL___LABEL548 EQU $B1F4
_LABEL___LABEL624 EQU $B207
_LABEL___LABEL550 EQU $B229
_LABEL___LABEL625 EQU $B23A
_LABEL___LABEL626 EQU $B258
_LABEL___LABEL552 EQU $B265
_LABEL___LABEL554 EQU $B28B
_LABEL___LABEL547 EQU $B2A9
__PRIVATEDoTAKEOUT__leave EQU $B2AF
__PRIVATEAutoEND EQU $B2B9
_LABEL___LABEL556 EQU $B2F0
__PRIVATEAutoEND__leave EQU $B2F7
__PRIVATEcheckLocCARRWORNHERE EQU $B301
_LABEL___LABEL559 EQU $B359
__PRIVATEcheckLocCARRWORNHERE__leave EQU $B35C
__PRIVATEwindowCheck EQU $B361
_LABEL___LABEL563 EQU $B397
__PRIVATEwindowCheck__leave EQU $B3AC
__PRIVATEDoBEEP EQU $B3AD
__PRIVATEDoBEEP__leave EQU $B414
__PRIVATEGetColor EQU $B419
_LABEL___LABEL567 EQU $B449
_LABEL___LABEL569 EQU $B455
__PRIVATEGetColor__leave EQU $B466
__initFlags EQU $B46B
__initFlags__leave EQU $B4F1
__doCALL EQU $B4F2
__doCALL__leave EQU $B50C
__jumpToBank EQU $B50D
__jumpToBank__leave EQU $B523
__setupIM EQU $B524
__setupIM__leave EQU $B54B
__GetCurrentContact EQU $B54C
__GetCurrentContact__leave EQU $B58A
_LABEL___LABEL7 EQU $B58F
_core_SP_PixelDown EQU $B690
_core_SCREEN_ADDR EQU $B6B8
_core_SCREEN_ATTR_ADDR EQU $B6BA
_core_SP_PixelUp EQU $B6BC
_core_MEM_ALLOC EQU $B6DF
_core___MEM_ALLOC EQU $B6DF
_core___MUL16 EQU $B72E
_core___ARRAY_PTR EQU $B743
_core___ARRAY EQU $B747
_core___MEM_CALLOC EQU $B79C
_core___ALLOC_LOCAL_ARRAY EQU $B7B2
_core___ALLOC_INITIALIZED_LOCAL_ARRAY EQU $B7C6
_core___BAND16 EQU $B7D5
_core___FPSTACK_PUSH2 EQU $B7DC
_core___FPSTACK_I16 EQU $B7ED
_core_BEEP EQU $B7F8
_core___BOR16 EQU $B80B
_core_BRIGHT EQU $B812
_core___SET_BRIGHT EQU $B815
_core_BRIGHT_TMP EQU $B82C
_core_CLS EQU $B831
_core___ABS16 EQU $B860
_core___NEGHL EQU $B863
_core___DIVU16 EQU $B86B
_core___DIVU16_FAST EQU $B86B
_core___DIV16LOOP EQU $B872
_core___DIV16NOADD EQU $B87D
_core___MODU16 EQU $B883
_core___DIVI16 EQU $B888
_core___DIVI16_FAST EQU $B888
_core___DIVI16A EQU $B896
_core___DIVI16B EQU $B89B
_core___MODI16 EQU $B8A4
_core___EQ16 EQU $B8A9
_core_FLASH EQU $B8AF
_core___SET_FLASH EQU $B8B2
_core_FLASH_TMP EQU $B8C9
_core_INK EQU $B8CE
_core_INK_TMP EQU $B8E9
_core___SUB32 EQU $B8EF
_core___LEI32 EQU $B903
_core___MEMCPY EQU $B920
_core___MULF EQU $B939
_core___ON_GOSUB EQU $B942
_core___ON_GOTO EQU $B948
_core___ON_GOTO_START EQU $B94A
_core_PAPER EQU $B95A
_core_PAPER_TMP EQU $B978
_core___ILOADF EQU $B97E
_core___LOADF EQU $B982
_core___PLOADF EQU $B98C
_core___PISTOREF EQU $B993
_core___ISTOREF EQU $B99A
_core___STOREF EQU $B9A0
_core___PSTOREF EQU $B9AA
_core___REALLOC EQU $B9B4
_core___SHRL32 EQU $B9E8
_core___ABS32 EQU $B9F1
_core___NEG32 EQU $B9F4
_core___I8TOFREG EQU $BA06
_core___I32TOFREG EQU $BA0C
_core___U8TOFREG EQU $BA1A
_core___U32TOFREG EQU $BA1F
_core___U32TOFREG_LOOP EQU $BA33
_LABEL___LABEL615 EQU $BA55
_LABEL___LABEL617 EQU $BA58
