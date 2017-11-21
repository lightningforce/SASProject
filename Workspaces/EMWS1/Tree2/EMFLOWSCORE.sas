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
  _NODE_  =                    2;
  _LEAF_  =                    1;
  P_TARGET_B0  =     0.57030223390275;
  P_TARGET_B1  =     0.42969776609724;
  Q_TARGET_B0  =     0.57030223390275;
  Q_TARGET_B1  =     0.42969776609724;
  V_TARGET_B0  =     0.56955142727684;
  V_TARGET_B1  =     0.43044857272315;
  I_TARGET_B  = '0' ;
  U_TARGET_B  =                    0;
  END;
ELSE DO;
  IF  NOT MISSING(GiftAvgLast ) AND
    GiftAvgLast  <                  7.5 THEN DO;
    _NODE_  =                    6;
    _LEAF_  =                    2;
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
      _LEAF_  =                    3;
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
      IF  NOT MISSING(GiftAvgCard36 ) AND
        GiftAvgCard36  <               14.415 THEN DO;
        _NODE_  =                   22;
        _LEAF_  =                    4;
        P_TARGET_B0  =     0.47113884555382;
        P_TARGET_B1  =     0.52886115444617;
        Q_TARGET_B0  =     0.47113884555382;
        Q_TARGET_B1  =     0.52886115444617;
        V_TARGET_B0  =             0.496875;
        V_TARGET_B1  =             0.503125;
        I_TARGET_B  = '1' ;
        U_TARGET_B  =                    1;
        END;
      ELSE DO;
        _NODE_  =                   23;
        _LEAF_  =                    5;
        P_TARGET_B0  =     0.58648648648648;
        P_TARGET_B1  =     0.41351351351351;
        Q_TARGET_B0  =     0.58648648648648;
        Q_TARGET_B1  =     0.41351351351351;
        V_TARGET_B0  =     0.54916067146282;
        V_TARGET_B1  =     0.45083932853717;
        I_TARGET_B  = '0' ;
        U_TARGET_B  =                    0;
        END;
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
