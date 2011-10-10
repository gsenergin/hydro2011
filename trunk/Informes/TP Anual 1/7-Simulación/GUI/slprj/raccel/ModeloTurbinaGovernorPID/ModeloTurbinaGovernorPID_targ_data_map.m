  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 2;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtP)
    ;%
      section.nData     = 149;
      section.data(149)  = dumData; %prealloc
      
	  ;% rtP.Gain_Gain
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtP.LadLmd_Gain
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtP.phimdsat_Y0
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% rtP.Vs_Value
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% rtP.LaqLmq_Gain
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% rtP.LadLmd_Gain_k
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% rtP.phimqsat_Y0
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% rtP.phimdsat_Y0_m
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
	  ;% rtP.Vs_Value_f
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 8;
	
	  ;% rtP.Out1_Y0
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 9;
	
	  ;% rtP.int_IC
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 10;
	
	  ;% rtP.SwitchCurrents_Value
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 11;
	
	  ;% rtP.Rotorangledtheta_IC
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 14;
	
	  ;% rtP.web2_Gain
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 15;
	
	  ;% rtP.int_IC_g
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 16;
	
	  ;% rtP.Lad_Ll_Gain
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 17;
	
	  ;% rtP.int_IC_c
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 18;
	
	  ;% rtP.Lad_Llfd_Gain
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 19;
	
	  ;% rtP.int_IC_m
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 20;
	
	  ;% rtP.Lad_Llkd_Gain
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 21;
	
	  ;% rtP.int1_IC
	  section.data(21).logicalSrcIdx = 20;
	  section.data(21).dtTransOffset = 22;
	
	  ;% rtP.Laq_Ll_Gain
	  section.data(22).logicalSrcIdx = 21;
	  section.data(22).dtTransOffset = 23;
	
	  ;% rtP.int_IC_p
	  section.data(23).logicalSrcIdx = 22;
	  section.data(23).dtTransOffset = 24;
	
	  ;% rtP.Laq_Llkq1_Gain
	  section.data(24).logicalSrcIdx = 23;
	  section.data(24).dtTransOffset = 25;
	
	  ;% rtP.Laq_Llkq2_Gain
	  section.data(25).logicalSrcIdx = 24;
	  section.data(25).dtTransOffset = 26;
	
	  ;% rtP.Switch_Threshold
	  section.data(26).logicalSrcIdx = 25;
	  section.data(26).dtTransOffset = 27;
	
	  ;% rtP.u_Ll_Gain
	  section.data(27).logicalSrcIdx = 26;
	  section.data(27).dtTransOffset = 28;
	
	  ;% rtP.Gain_Gain_a
	  section.data(28).logicalSrcIdx = 27;
	  section.data(28).dtTransOffset = 29;
	
	  ;% rtP.Gain1_Gain
	  section.data(29).logicalSrcIdx = 28;
	  section.data(29).dtTransOffset = 30;
	
	  ;% rtP.u_Ll_Gain_m
	  section.data(30).logicalSrcIdx = 29;
	  section.data(30).dtTransOffset = 31;
	
	  ;% rtP.ib_Gain
	  section.data(31).logicalSrcIdx = 30;
	  section.data(31).dtTransOffset = 32;
	
	  ;% rtP.SineWaveA_Amp
	  section.data(32).logicalSrcIdx = 31;
	  section.data(32).dtTransOffset = 33;
	
	  ;% rtP.SineWaveA_Bias
	  section.data(33).logicalSrcIdx = 32;
	  section.data(33).dtTransOffset = 34;
	
	  ;% rtP.SineWaveA_Freq
	  section.data(34).logicalSrcIdx = 33;
	  section.data(34).dtTransOffset = 35;
	
	  ;% rtP.SineWaveA_Phase
	  section.data(35).logicalSrcIdx = 34;
	  section.data(35).dtTransOffset = 36;
	
	  ;% rtP.SineWaveB_Amp
	  section.data(36).logicalSrcIdx = 35;
	  section.data(36).dtTransOffset = 37;
	
	  ;% rtP.SineWaveB_Bias
	  section.data(37).logicalSrcIdx = 36;
	  section.data(37).dtTransOffset = 38;
	
	  ;% rtP.SineWaveB_Freq
	  section.data(38).logicalSrcIdx = 37;
	  section.data(38).dtTransOffset = 39;
	
	  ;% rtP.SineWaveB_Phase
	  section.data(39).logicalSrcIdx = 38;
	  section.data(39).dtTransOffset = 40;
	
	  ;% rtP.SineWaveC_Amp
	  section.data(40).logicalSrcIdx = 39;
	  section.data(40).dtTransOffset = 41;
	
	  ;% rtP.SineWaveC_Bias
	  section.data(41).logicalSrcIdx = 40;
	  section.data(41).dtTransOffset = 42;
	
	  ;% rtP.SineWaveC_Freq
	  section.data(42).logicalSrcIdx = 41;
	  section.data(42).dtTransOffset = 43;
	
	  ;% rtP.SineWaveC_Phase
	  section.data(43).logicalSrcIdx = 42;
	  section.data(43).dtTransOffset = 44;
	
	  ;% rtP.Rotorspeeddeviationdw_IC
	  section.data(44).logicalSrcIdx = 43;
	  section.data(44).dtTransOffset = 45;
	
	  ;% rtP.beta_Gain
	  section.data(45).logicalSrcIdx = 44;
	  section.data(45).dtTransOffset = 46;
	
	  ;% rtP.position_IC
	  section.data(46).logicalSrcIdx = 45;
	  section.data(46).dtTransOffset = 47;
	
	  ;% rtP.position_UpperSat
	  section.data(47).logicalSrcIdx = 46;
	  section.data(47).dtTransOffset = 48;
	
	  ;% rtP.position_LowerSat
	  section.data(48).logicalSrcIdx = 47;
	  section.data(48).dtTransOffset = 49;
	
	  ;% rtP.turbinegain_Gain
	  section.data(49).logicalSrcIdx = 48;
	  section.data(49).dtTransOffset = 50;
	
	  ;% rtP.Integrator_IC
	  section.data(50).logicalSrcIdx = 49;
	  section.data(50).dtTransOffset = 51;
	
	  ;% rtP.nomspeed_Value
	  section.data(51).logicalSrcIdx = 50;
	  section.data(51).dtTransOffset = 52;
	
	  ;% rtP.units_Gain
	  section.data(52).logicalSrcIdx = 51;
	  section.data(52).dtTransOffset = 53;
	
	  ;% rtP.StateSpace_A
	  section.data(53).logicalSrcIdx = 52;
	  section.data(53).dtTransOffset = 54;
	
	  ;% rtP.StateSpace_C
	  section.data(54).logicalSrcIdx = 53;
	  section.data(54).dtTransOffset = 55;
	
	  ;% rtP.StateSpace_X0
	  section.data(55).logicalSrcIdx = 55;
	  section.data(55).dtTransOffset = 56;
	
	  ;% rtP.Constant1_Value
	  section.data(56).logicalSrcIdx = 56;
	  section.data(56).dtTransOffset = 57;
	
	  ;% rtP.StateSpace_A_d
	  section.data(57).logicalSrcIdx = 57;
	  section.data(57).dtTransOffset = 58;
	
	  ;% rtP.StateSpace_C_o
	  section.data(58).logicalSrcIdx = 58;
	  section.data(58).dtTransOffset = 59;
	
	  ;% rtP.StateSpace_X0_f
	  section.data(59).logicalSrcIdx = 60;
	  section.data(59).dtTransOffset = 60;
	
	  ;% rtP.Vfdmax1_Gain
	  section.data(60).logicalSrcIdx = 61;
	  section.data(60).dtTransOffset = 61;
	
	  ;% rtP.Constant_Value
	  section.data(61).logicalSrcIdx = 62;
	  section.data(61).dtTransOffset = 62;
	
	  ;% rtP.Constant3_Value
	  section.data(62).logicalSrcIdx = 63;
	  section.data(62).dtTransOffset = 63;
	
	  ;% rtP.Vfdmax_Gain
	  section.data(63).logicalSrcIdx = 64;
	  section.data(63).dtTransOffset = 64;
	
	  ;% rtP.StateSpace_D_k
	  section.data(64).logicalSrcIdx = 68;
	  section.data(64).dtTransOffset = 65;
	
	  ;% rtP.outputformatting_Gain
	  section.data(65).logicalSrcIdx = 70;
	  section.data(65).dtTransOffset = 66;
	
	  ;% rtP.outputformatting1_Gain
	  section.data(66).logicalSrcIdx = 71;
	  section.data(66).dtTransOffset = 67;
	
	  ;% rtP.outputformatting2_Gain
	  section.data(67).logicalSrcIdx = 72;
	  section.data(67).dtTransOffset = 68;
	
	  ;% rtP.StateSpace_A_o
	  section.data(68).logicalSrcIdx = 73;
	  section.data(68).dtTransOffset = 69;
	
	  ;% rtP.StateSpace_C_o2
	  section.data(69).logicalSrcIdx = 74;
	  section.data(69).dtTransOffset = 70;
	
	  ;% rtP.StateSpace_D_n
	  section.data(70).logicalSrcIdx = 75;
	  section.data(70).dtTransOffset = 71;
	
	  ;% rtP.StateSpace_X0_l
	  section.data(71).logicalSrcIdx = 76;
	  section.data(71).dtTransOffset = 72;
	
	  ;% rtP.Vderef_Value
	  section.data(72).logicalSrcIdx = 77;
	  section.data(72).dtTransOffset = 73;
	
	  ;% rtP.Vf0ka_Value
	  section.data(73).logicalSrcIdx = 78;
	  section.data(73).dtTransOffset = 74;
	
	  ;% rtP.StateSpace_D_e
	  section.data(74).logicalSrcIdx = 82;
	  section.data(74).dtTransOffset = 75;
	
	  ;% rtP._Vb_Gain
	  section.data(75).logicalSrcIdx = 84;
	  section.data(75).dtTransOffset = 76;
	
	  ;% rtP.outputformatting9_Gain
	  section.data(76).logicalSrcIdx = 85;
	  section.data(76).dtTransOffset = 77;
	
	  ;% rtP.outputformatting8_Gain
	  section.data(77).logicalSrcIdx = 86;
	  section.data(77).dtTransOffset = 78;
	
	  ;% rtP.Constant1_Value_o
	  section.data(78).logicalSrcIdx = 87;
	  section.data(78).dtTransOffset = 79;
	
	  ;% rtP.Derivative_A
	  section.data(79).logicalSrcIdx = 88;
	  section.data(79).dtTransOffset = 80;
	
	  ;% rtP.Derivative_C
	  section.data(80).logicalSrcIdx = 89;
	  section.data(80).dtTransOffset = 81;
	
	  ;% rtP.velocidadRef_Value
	  section.data(81).logicalSrcIdx = 92;
	  section.data(81).dtTransOffset = 82;
	
	  ;% rtP.potenciaMecRef_Value
	  section.data(82).logicalSrcIdx = 93;
	  section.data(82).dtTransOffset = 83;
	
	  ;% rtP.Switch_Threshold_h
	  section.data(83).logicalSrcIdx = 94;
	  section.data(83).dtTransOffset = 84;
	
	  ;% rtP.permanentdroop_Gain
	  section.data(84).logicalSrcIdx = 95;
	  section.data(84).dtTransOffset = 85;
	
	  ;% rtP.Integral_Gain
	  section.data(85).logicalSrcIdx = 96;
	  section.data(85).dtTransOffset = 86;
	
	  ;% rtP.Integrator1_IC
	  section.data(86).logicalSrcIdx = 97;
	  section.data(86).dtTransOffset = 87;
	
	  ;% rtP.Proportional_Gain
	  section.data(87).logicalSrcIdx = 98;
	  section.data(87).dtTransOffset = 88;
	
	  ;% rtP.servomotor_A
	  section.data(88).logicalSrcIdx = 99;
	  section.data(88).dtTransOffset = 89;
	
	  ;% rtP.servomotor_C
	  section.data(89).logicalSrcIdx = 100;
	  section.data(89).dtTransOffset = 90;
	
	  ;% rtP.speedlimit_UpperSat
	  section.data(90).logicalSrcIdx = 103;
	  section.data(90).dtTransOffset = 91;
	
	  ;% rtP.speedlimit_LowerSat
	  section.data(91).logicalSrcIdx = 104;
	  section.data(91).dtTransOffset = 92;
	
	  ;% rtP.Constant_Value_g
	  section.data(92).logicalSrcIdx = 105;
	  section.data(92).dtTransOffset = 93;
	
	  ;% rtP.Gain2_Gain
	  section.data(93).logicalSrcIdx = 106;
	  section.data(93).dtTransOffset = 94;
	
	  ;% rtP.Constant_Value_d
	  section.data(94).logicalSrcIdx = 107;
	  section.data(94).dtTransOffset = 95;
	
	  ;% rtP.Switch_Threshold_d
	  section.data(95).logicalSrcIdx = 108;
	  section.data(95).dtTransOffset = 96;
	
	  ;% rtP.Switch1_Threshold
	  section.data(96).logicalSrcIdx = 109;
	  section.data(96).dtTransOffset = 97;
	
	  ;% rtP.Rs_Ll_Gain
	  section.data(97).logicalSrcIdx = 110;
	  section.data(97).dtTransOffset = 98;
	
	  ;% rtP.web_psb_Gain
	  section.data(98).logicalSrcIdx = 111;
	  section.data(98).dtTransOffset = 99;
	
	  ;% rtP.N_Gain
	  section.data(99).logicalSrcIdx = 112;
	  section.data(99).dtTransOffset = 100;
	
	  ;% rtP.Rf_Llfd_Gain
	  section.data(100).logicalSrcIdx = 113;
	  section.data(100).dtTransOffset = 101;
	
	  ;% rtP.web_psb_Gain_h
	  section.data(101).logicalSrcIdx = 114;
	  section.data(101).dtTransOffset = 102;
	
	  ;% rtP.Rkd_Llkd_Gain
	  section.data(102).logicalSrcIdx = 115;
	  section.data(102).dtTransOffset = 103;
	
	  ;% rtP.web_psb_Gain_m
	  section.data(103).logicalSrcIdx = 116;
	  section.data(103).dtTransOffset = 104;
	
	  ;% rtP.Rkq1_Llkq1_Gain
	  section.data(104).logicalSrcIdx = 117;
	  section.data(104).dtTransOffset = 105;
	
	  ;% rtP.web_psb_Gain_l
	  section.data(105).logicalSrcIdx = 118;
	  section.data(105).dtTransOffset = 106;
	
	  ;% rtP.Rkq2_Llkq2_Gain
	  section.data(106).logicalSrcIdx = 119;
	  section.data(106).dtTransOffset = 107;
	
	  ;% rtP.web_psb_Gain_p
	  section.data(107).logicalSrcIdx = 120;
	  section.data(107).dtTransOffset = 108;
	
	  ;% rtP.Rs_Ll_Gain_k
	  section.data(108).logicalSrcIdx = 121;
	  section.data(108).dtTransOffset = 109;
	
	  ;% rtP.web_psb_Gain_a
	  section.data(109).logicalSrcIdx = 122;
	  section.data(109).dtTransOffset = 110;
	
	  ;% rtP._Pb_Gain
	  section.data(110).logicalSrcIdx = 123;
	  section.data(110).dtTransOffset = 111;
	
	  ;% rtP.F1_Gain
	  section.data(111).logicalSrcIdx = 124;
	  section.data(111).dtTransOffset = 112;
	
	  ;% rtP._2H_Gain
	  section.data(112).logicalSrcIdx = 125;
	  section.data(112).dtTransOffset = 113;
	
	  ;% rtP.theta_IC
	  section.data(113).logicalSrcIdx = 126;
	  section.data(113).dtTransOffset = 114;
	
	  ;% rtP.web1_Gain
	  section.data(114).logicalSrcIdx = 127;
	  section.data(114).dtTransOffset = 115;
	
	  ;% rtP.web3_Gain
	  section.data(115).logicalSrcIdx = 128;
	  section.data(115).dtTransOffset = 116;
	
	  ;% rtP.donotdeletethisgain_Gain
	  section.data(116).logicalSrcIdx = 129;
	  section.data(116).dtTransOffset = 117;
	
	  ;% rtP.Gain_Gain_l
	  section.data(117).logicalSrcIdx = 130;
	  section.data(117).dtTransOffset = 118;
	
	  ;% rtP.donotdeletethisgain_Gain_i
	  section.data(118).logicalSrcIdx = 131;
	  section.data(118).dtTransOffset = 119;
	
	  ;% rtP.Gain2_Gain_l
	  section.data(119).logicalSrcIdx = 132;
	  section.data(119).dtTransOffset = 120;
	
	  ;% rtP.C4_Value
	  section.data(120).logicalSrcIdx = 133;
	  section.data(120).dtTransOffset = 121;
	
	  ;% rtP.com_Value
	  section.data(121).logicalSrcIdx = 134;
	  section.data(121).dtTransOffset = 122;
	
	  ;% rtP.C4_Value_j
	  section.data(122).logicalSrcIdx = 135;
	  section.data(122).dtTransOffset = 123;
	
	  ;% rtP.LookUpTable_XData
	  section.data(123).logicalSrcIdx = 136;
	  section.data(123).dtTransOffset = 124;
	
	  ;% rtP.LookUpTable_YData
	  section.data(124).logicalSrcIdx = 137;
	  section.data(124).dtTransOffset = 131;
	
	  ;% rtP.Switch3_Threshold
	  section.data(125).logicalSrcIdx = 138;
	  section.data(125).dtTransOffset = 138;
	
	  ;% rtP.Constant1_Value_e
	  section.data(126).logicalSrcIdx = 139;
	  section.data(126).dtTransOffset = 139;
	
	  ;% rtP.LookUpTable_XData_a
	  section.data(127).logicalSrcIdx = 140;
	  section.data(127).dtTransOffset = 140;
	
	  ;% rtP.LookUpTable_YData_a
	  section.data(128).logicalSrcIdx = 141;
	  section.data(128).dtTransOffset = 147;
	
	  ;% rtP.Switch3_Threshold_k
	  section.data(129).logicalSrcIdx = 142;
	  section.data(129).dtTransOffset = 154;
	
	  ;% rtP.Sfunction_P1_Size
	  section.data(130).logicalSrcIdx = 143;
	  section.data(130).dtTransOffset = 155;
	
	  ;% rtP.Sfunction_P1
	  section.data(131).logicalSrcIdx = 144;
	  section.data(131).dtTransOffset = 157;
	
	  ;% rtP.HitCrossing_Offset
	  section.data(132).logicalSrcIdx = 145;
	  section.data(132).dtTransOffset = 158;
	
	  ;% rtP.C4_Value_h
	  section.data(133).logicalSrcIdx = 146;
	  section.data(133).dtTransOffset = 159;
	
	  ;% rtP.Constant2_Value
	  section.data(134).logicalSrcIdx = 147;
	  section.data(134).dtTransOffset = 160;
	
	  ;% rtP.LookUpTable_XData_h
	  section.data(135).logicalSrcIdx = 148;
	  section.data(135).dtTransOffset = 161;
	
	  ;% rtP.LookUpTable_YData_l
	  section.data(136).logicalSrcIdx = 149;
	  section.data(136).dtTransOffset = 168;
	
	  ;% rtP.Switch3_Threshold_d
	  section.data(137).logicalSrcIdx = 150;
	  section.data(137).dtTransOffset = 175;
	
	  ;% rtP.Sfunction_P1_Size_f
	  section.data(138).logicalSrcIdx = 151;
	  section.data(138).dtTransOffset = 176;
	
	  ;% rtP.Sfunction_P1_k
	  section.data(139).logicalSrcIdx = 152;
	  section.data(139).dtTransOffset = 178;
	
	  ;% rtP.HitCrossing_Offset_h
	  section.data(140).logicalSrcIdx = 153;
	  section.data(140).dtTransOffset = 179;
	
	  ;% rtP.C4_Value_b
	  section.data(141).logicalSrcIdx = 154;
	  section.data(141).dtTransOffset = 180;
	
	  ;% rtP.Constant3_Value_d
	  section.data(142).logicalSrcIdx = 155;
	  section.data(142).dtTransOffset = 181;
	
	  ;% rtP.LookUpTable_XData_j
	  section.data(143).logicalSrcIdx = 156;
	  section.data(143).dtTransOffset = 182;
	
	  ;% rtP.LookUpTable_YData_m
	  section.data(144).logicalSrcIdx = 157;
	  section.data(144).dtTransOffset = 189;
	
	  ;% rtP.Switch3_Threshold_f
	  section.data(145).logicalSrcIdx = 158;
	  section.data(145).dtTransOffset = 196;
	
	  ;% rtP.Sfunction_P1_Size_n
	  section.data(146).logicalSrcIdx = 159;
	  section.data(146).dtTransOffset = 197;
	
	  ;% rtP.Sfunction_P1_h
	  section.data(147).logicalSrcIdx = 160;
	  section.data(147).dtTransOffset = 199;
	
	  ;% rtP.HitCrossing_Offset_e
	  section.data(148).logicalSrcIdx = 161;
	  section.data(148).dtTransOffset = 200;
	
	  ;% rtP.HitCrossing_Offset_l
	  section.data(149).logicalSrcIdx = 162;
	  section.data(149).dtTransOffset = 201;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% rtP.wref_Value
	  section.data(1).logicalSrcIdx = 163;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtP.Vs4_Value
	  section.data(2).logicalSrcIdx = 164;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtP.Vs5_Value
	  section.data(3).logicalSrcIdx = 165;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 2;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtB)
    ;%
      section.nData     = 62;
      section.data(62)  = dumData; %prealloc
      
	  ;% rtB.phimd
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtB.DataTypeConversion
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtB.DataTypeConversion1
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% rtB.Sum
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% rtB.ib
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% rtB.SineWaveA
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 7;
	
	  ;% rtB.SineWaveB
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 8;
	
	  ;% rtB.SineWaveC
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 9;
	
	  ;% rtB.StateSpace_o1
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 10;
	
	  ;% rtB.StateSpace_o2
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 17;
	
	  ;% rtB.Product
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 20;
	
	  ;% rtB.n
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 21;
	
	  ;% rtB.StateSpace
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 22;
	
	  ;% rtB.Vfdmax
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 23;
	
	  ;% rtB.Sum_d
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 24;
	
	  ;% rtB.DataTypeConversion_j
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 25;
	
	  ;% rtB.Product1
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 26;
	
	  ;% rtB.DataTypeConversion2
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 27;
	
	  ;% rtB.Sum1
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 28;
	
	  ;% rtB.StateSpace_i
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 29;
	
	  ;% rtB.is_a
	  section.data(21).logicalSrcIdx = 20;
	  section.data(21).dtTransOffset = 30;
	
	  ;% rtB.is_b
	  section.data(22).logicalSrcIdx = 21;
	  section.data(22).dtTransOffset = 31;
	
	  ;% rtB.is_c
	  section.data(23).logicalSrcIdx = 22;
	  section.data(23).dtTransOffset = 32;
	
	  ;% rtB.Sum_f
	  section.data(24).logicalSrcIdx = 23;
	  section.data(24).dtTransOffset = 33;
	
	  ;% rtB.StateSpace_d
	  section.data(25).logicalSrcIdx = 24;
	  section.data(25).dtTransOffset = 34;
	
	  ;% rtB.PositiveSequenceVoltage
	  section.data(26).logicalSrcIdx = 25;
	  section.data(26).dtTransOffset = 35;
	
	  ;% rtB.Sum1_e
	  section.data(27).logicalSrcIdx = 26;
	  section.data(27).dtTransOffset = 36;
	
	  ;% rtB.Integral
	  section.data(28).logicalSrcIdx = 27;
	  section.data(28).dtTransOffset = 37;
	
	  ;% rtB.Sum4
	  section.data(29).logicalSrcIdx = 28;
	  section.data(29).dtTransOffset = 38;
	
	  ;% rtB.servomotor
	  section.data(30).logicalSrcIdx = 29;
	  section.data(30).dtTransOffset = 39;
	
	  ;% rtB.speedlimit
	  section.data(31).logicalSrcIdx = 30;
	  section.data(31).dtTransOffset = 40;
	
	  ;% rtB.Gain2
	  section.data(32).logicalSrcIdx = 31;
	  section.data(32).dtTransOffset = 41;
	
	  ;% rtB.web_psb
	  section.data(33).logicalSrcIdx = 32;
	  section.data(33).dtTransOffset = 42;
	
	  ;% rtB.web_psb_l
	  section.data(34).logicalSrcIdx = 33;
	  section.data(34).dtTransOffset = 43;
	
	  ;% rtB.web_psb_e
	  section.data(35).logicalSrcIdx = 34;
	  section.data(35).dtTransOffset = 44;
	
	  ;% rtB.web_psb_lb
	  section.data(36).logicalSrcIdx = 35;
	  section.data(36).dtTransOffset = 45;
	
	  ;% rtB.web_psb_d
	  section.data(37).logicalSrcIdx = 36;
	  section.data(37).dtTransOffset = 46;
	
	  ;% rtB.web_psb_h
	  section.data(38).logicalSrcIdx = 37;
	  section.data(38).dtTransOffset = 47;
	
	  ;% rtB._2H
	  section.data(39).logicalSrcIdx = 38;
	  section.data(39).dtTransOffset = 48;
	
	  ;% rtB.web1
	  section.data(40).logicalSrcIdx = 39;
	  section.data(40).dtTransOffset = 49;
	
	  ;% rtB.web3
	  section.data(41).logicalSrcIdx = 40;
	  section.data(41).dtTransOffset = 50;
	
	  ;% rtB.Gain
	  section.data(42).logicalSrcIdx = 41;
	  section.data(42).dtTransOffset = 51;
	
	  ;% rtB.Gain2_i
	  section.data(43).logicalSrcIdx = 42;
	  section.data(43).dtTransOffset = 52;
	
	  ;% rtB.LookUpTable
	  section.data(44).logicalSrcIdx = 43;
	  section.data(44).dtTransOffset = 53;
	
	  ;% rtB.LookUpTable_i
	  section.data(45).logicalSrcIdx = 44;
	  section.data(45).dtTransOffset = 54;
	
	  ;% rtB.Switch3
	  section.data(46).logicalSrcIdx = 45;
	  section.data(46).dtTransOffset = 55;
	
	  ;% rtB.Sfunction
	  section.data(47).logicalSrcIdx = 46;
	  section.data(47).dtTransOffset = 56;
	
	  ;% rtB.Derivative
	  section.data(48).logicalSrcIdx = 47;
	  section.data(48).dtTransOffset = 57;
	
	  ;% rtB.LookUpTable_d
	  section.data(49).logicalSrcIdx = 48;
	  section.data(49).dtTransOffset = 58;
	
	  ;% rtB.Switch3_m
	  section.data(50).logicalSrcIdx = 49;
	  section.data(50).dtTransOffset = 59;
	
	  ;% rtB.Sfunction_k
	  section.data(51).logicalSrcIdx = 50;
	  section.data(51).dtTransOffset = 60;
	
	  ;% rtB.Derivative_n
	  section.data(52).logicalSrcIdx = 51;
	  section.data(52).dtTransOffset = 61;
	
	  ;% rtB.LookUpTable_h
	  section.data(53).logicalSrcIdx = 52;
	  section.data(53).dtTransOffset = 62;
	
	  ;% rtB.Switch3_h
	  section.data(54).logicalSrcIdx = 53;
	  section.data(54).dtTransOffset = 63;
	
	  ;% rtB.Sfunction_j
	  section.data(55).logicalSrcIdx = 54;
	  section.data(55).dtTransOffset = 64;
	
	  ;% rtB.Derivative_h
	  section.data(56).logicalSrcIdx = 55;
	  section.data(56).dtTransOffset = 65;
	
	  ;% rtB.Derivative_o
	  section.data(57).logicalSrcIdx = 56;
	  section.data(57).dtTransOffset = 66;
	
	  ;% rtB.int_f
	  section.data(58).logicalSrcIdx = 57;
	  section.data(58).dtTransOffset = 67;
	
	  ;% rtB.Sum_a
	  section.data(59).logicalSrcIdx = 58;
	  section.data(59).dtTransOffset = 68;
	
	  ;% rtB.Switch
	  section.data(60).logicalSrcIdx = 59;
	  section.data(60).dtTransOffset = 69;
	
	  ;% rtB.Switch1
	  section.data(61).logicalSrcIdx = 60;
	  section.data(61).dtTransOffset = 70;
	
	  ;% rtB.Switch_c
	  section.data(62).logicalSrcIdx = 61;
	  section.data(62).dtTransOffset = 71;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 5;
      section.data(5)  = dumData; %prealloc
      
	  ;% rtB.DataTypeConversion3
	  section.data(1).logicalSrcIdx = 62;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtB.DataTypeConversion2_g
	  section.data(2).logicalSrcIdx = 63;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtB.DataTypeConversion1_k
	  section.data(3).logicalSrcIdx = 64;
	  section.data(3).dtTransOffset = 2;
	
	  ;% rtB.RelationalOperator
	  section.data(4).logicalSrcIdx = 65;
	  section.data(4).dtTransOffset = 3;
	
	  ;% rtB.RelationalOperator_a
	  section.data(5).logicalSrcIdx = 66;
	  section.data(5).dtTransOffset = 4;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 5;
    sectIdxOffset = 2;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtDWork)
    ;%
      section.nData     = 7;
      section.data(7)  = dumData; %prealloc
      
	  ;% rtDWork.Sfunction_DSTATE
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDWork.Sfunction_DSTATE_b
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 2;
	
	  ;% rtDWork.Sfunction_DSTATE_k
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 4;
	
	  ;% rtDWork.Derivative_RWORK.TimeStampA
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 6;
	
	  ;% rtDWork.Derivative_RWORK_h.TimeStampA
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 7;
	
	  ;% rtDWork.Derivative_RWORK_b.TimeStampA
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 8;
	
	  ;% rtDWork.Derivative_RWORK_o.TimeStampA
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 9;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 12;
      section.data(12)  = dumData; %prealloc
      
	  ;% rtDWork.StateSpace_PWORK.AS
	  section.data(1).logicalSrcIdx = 7;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDWork.labcpu_PWORK.LoggedData
	  section.data(2).logicalSrcIdx = 8;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtDWork.PotMec_PWORK.LoggedData
	  section.data(3).logicalSrcIdx = 9;
	  section.data(3).dtTransOffset = 2;
	
	  ;% rtDWork.Velocidadpu_PWORK.LoggedData
	  section.data(4).logicalSrcIdx = 10;
	  section.data(4).dtTransOffset = 3;
	
	  ;% rtDWork.Vfpu_PWORK.LoggedData
	  section.data(5).logicalSrcIdx = 11;
	  section.data(5).dtTransOffset = 4;
	
	  ;% rtDWork.corrienteEstator_PWORK.LoggedData
	  section.data(6).logicalSrcIdx = 12;
	  section.data(6).dtTransOffset = 5;
	
	  ;% rtDWork.potMec_PWORK.LoggedData
	  section.data(7).logicalSrcIdx = 13;
	  section.data(7).dtTransOffset = 6;
	
	  ;% rtDWork.velocidadRotor_PWORK.LoggedData
	  section.data(8).logicalSrcIdx = 14;
	  section.data(8).dtTransOffset = 7;
	
	  ;% rtDWork.Vapu_PWORK.LoggedData
	  section.data(9).logicalSrcIdx = 15;
	  section.data(9).dtTransOffset = 8;
	
	  ;% rtDWork.vain_PWORK.LoggedData
	  section.data(10).logicalSrcIdx = 16;
	  section.data(10).dtTransOffset = 9;
	
	  ;% rtDWork.Vapu1_PWORK.LoggedData
	  section.data(11).logicalSrcIdx = 17;
	  section.data(11).dtTransOffset = 10;
	
	  ;% rtDWork.vaout_PWORK.LoggedData
	  section.data(12).logicalSrcIdx = 18;
	  section.data(12).dtTransOffset = 11;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% rtDWork.StateSpace_IWORK
	  section.data(1).logicalSrcIdx = 19;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDWork.StateSpace_MODE
	  section.data(2).logicalSrcIdx = 20;
	  section.data(2).dtTransOffset = 4;
	
	  ;% rtDWork.position_MODE
	  section.data(3).logicalSrcIdx = 21;
	  section.data(3).dtTransOffset = 7;
	
	  ;% rtDWork.speedlimit_MODE
	  section.data(4).logicalSrcIdx = 22;
	  section.data(4).dtTransOffset = 8;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% rtDWork.Enabledintegrator_SubsysRanBC
	  section.data(1).logicalSrcIdx = 23;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDWork.dqaxissaturation_SubsysRanBC
	  section.data(2).logicalSrcIdx = 24;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtDWork.daxissaturation_SubsysRanBC
	  section.data(3).logicalSrcIdx = 25;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(4) = section;
      clear section
      
      section.nData     = 7;
      section.data(7)  = dumData; %prealloc
      
	  ;% rtDWork.RelationalOperator2_Mode
	  section.data(1).logicalSrcIdx = 26;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDWork.RelationalOperator1_Mode
	  section.data(2).logicalSrcIdx = 27;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtDWork.RelationalOperator_Mode
	  section.data(3).logicalSrcIdx = 28;
	  section.data(3).dtTransOffset = 2;
	
	  ;% rtDWork.RelationalOperator_Mode_e
	  section.data(4).logicalSrcIdx = 29;
	  section.data(4).dtTransOffset = 3;
	
	  ;% rtDWork.Enabledintegrator_MODE
	  section.data(5).logicalSrcIdx = 30;
	  section.data(5).dtTransOffset = 4;
	
	  ;% rtDWork.dqaxissaturation_MODE
	  section.data(6).logicalSrcIdx = 31;
	  section.data(6).dtTransOffset = 5;
	
	  ;% rtDWork.daxissaturation_MODE
	  section.data(7).logicalSrcIdx = 32;
	  section.data(7).dtTransOffset = 6;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(5) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 579359455;
  targMap.checksum1 = 1625338619;
  targMap.checksum2 = 1664664728;
  targMap.checksum3 = 2463199491;

