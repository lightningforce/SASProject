****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_TARGET_B  $   12;
LENGTH I_TARGET_B  $   12;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_TARGET_B0 = 'Predicted: TARGET_B=0' ;
label P_TARGET_B1 = 'Predicted: TARGET_B=1' ;
label Q_TARGET_B0 = 'Unadjusted P: TARGET_B=0' ;
label Q_TARGET_B1 = 'Unadjusted P: TARGET_B=1' ;
label V_TARGET_B0 = 'Validated: TARGET_B=0' ;
label V_TARGET_B1 = 'Validated: TARGET_B=1' ;
label R_TARGET_B0 = 'Residual: TARGET_B=0' ;
label R_TARGET_B1 = 'Residual: TARGET_B=1' ;
label F_TARGET_B = 'From: TARGET_B' ;
label I_TARGET_B = 'Into: TARGET_B' ;
label U_TARGET_B = 'Unnormalized Into: TARGET_B' ;
label _WARN_ = 'Warnings' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
 
 
_ARBFMT_12 = PUT( TARGET_B , BEST12.);
 %DMNORMCP( _ARBFMT_12, F_TARGET_B );
 
******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(GiftCnt36 ) AND
  GiftCnt36  <                  2.5 THEN DO;
  IF  NOT MISSING(DemMedHomeValue ) AND
    DemMedHomeValue  <                67350 THEN DO;
    _NODE_  =                    4;
    _LEAF_  =                    1;
    P_TARGET_B0  =     0.63356973995271;
    P_TARGET_B1  =     0.36643026004728;
    Q_TARGET_B0  =     0.63356973995271;
    Q_TARGET_B1  =     0.36643026004728;
    V_TARGET_B0  =     0.60089186176142;
    V_TARGET_B1  =     0.39910813823857;
    I_TARGET_B  = '0' ;
    U_TARGET_B  =                    0;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    2;
    P_TARGET_B0  =      0.5330549756437;
    P_TARGET_B1  =     0.46694502435629;
    Q_TARGET_B0  =      0.5330549756437;
    Q_TARGET_B1  =     0.46694502435629;
    V_TARGET_B0  =     0.54809160305343;
    V_TARGET_B1  =     0.45190839694656;
    I_TARGET_B  = '0' ;
    U_TARGET_B  =                    0;
    END;
  END;
ELSE DO;
  IF  NOT MISSING(GiftAvgLast ) AND
    GiftAvgLast  <                  7.5 THEN DO;
    _NODE_  =                    6;
    _LEAF_  =                    3;
    P_TARGET_B0  =     0.35616438356164;
    P_TARGET_B1  =     0.64383561643835;
    Q_TARGET_B0  =     0.35616438356164;
    Q_TARGET_B1  =     0.64383561643835;
    V_TARGET_B0  =     0.33984962406015;
    V_TARGET_B1  =     0.66015037593984;
    I_TARGET_B  = '1' ;
    U_TARGET_B  =                    1;
    END;
  ELSE DO;
    IF  NOT MISSING(GiftTimeLast ) AND
      GiftTimeLast  <                 17.5 THEN DO;
      _NODE_  =                   14;
      _LEAF_  =                    4;
      P_TARGET_B0  =     0.41143497757847;
      P_TARGET_B1  =     0.58856502242152;
      Q_TARGET_B0  =     0.41143497757847;
      Q_TARGET_B1  =     0.58856502242152;
      V_TARGET_B0  =     0.42778993435448;
      V_TARGET_B1  =     0.57221006564551;
      I_TARGET_B  = '1' ;
      U_TARGET_B  =                    1;
      END;
    ELSE DO;
      _NODE_  =                   15;
      _LEAF_  =                    5;
      P_TARGET_B0  =       0.513353115727;
      P_TARGET_B1  =     0.48664688427299;
      Q_TARGET_B0  =       0.513353115727;
      Q_TARGET_B1  =     0.48664688427299;
      V_TARGET_B0  =     0.51750236518448;
      V_TARGET_B1  =     0.48249763481551;
      I_TARGET_B  = '0' ;
      U_TARGET_B  =                    0;
      END;
    END;
  END;
 
*****  RESIDUALS R_ *************;
IF  F_TARGET_B  NE '0'
AND F_TARGET_B  NE '1'  THEN DO;
        R_TARGET_B0  = .;
        R_TARGET_B1  = .;
 END;
 ELSE DO;
       R_TARGET_B0  =  -P_TARGET_B0 ;
       R_TARGET_B1  =  -P_TARGET_B1 ;
       SELECT( F_TARGET_B  );
          WHEN( '0'  ) R_TARGET_B0  = R_TARGET_B0  +1;
          WHEN( '1'  ) R_TARGET_B1  = R_TARGET_B1  +1;
       END;
 END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
