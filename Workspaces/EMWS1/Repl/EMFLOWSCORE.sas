* ;
* Variable: DemMedIncome ;
* ;
Label REP_DemMedIncome='Replacement: Median Income Region';
Length REP_DemMedIncome 8;
REP_DemMedIncome =DemMedIncome ;
if DemMedIncome  eq . then REP_DemMedIncome = . ;
else
if DemMedIncome <1  then REP_DemMedIncome  = . ;
