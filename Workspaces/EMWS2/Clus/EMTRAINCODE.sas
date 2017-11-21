*------------------------------------------------------------*;
* Clus: Training;
*------------------------------------------------------------*;
*------------------------------------------------------------* ;
* Clus: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;

%mend DMDBClass;
*------------------------------------------------------------* ;
* Clus: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    MeanHHSz MedHHInc RegDens
%mend DMDBVar;
*------------------------------------------------------------*;
* Clus: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS2.Filter_TRAIN
dmdbcat=WORK.Clus_DMDB
maxlevel = 513
out=WORK.Clus_DMDB
;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* Clus: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQINTERVAL;
    MeanHHSz MedHHInc RegDens
%mend DMVQINTERVAL;
*------------------------------------------------------------*;
* Clus: Run DMVQ procedure;
*------------------------------------------------------------*;
title;
options nodate;
proc dmvq data=WORK.Clus_DMDB dmdbcat=WORK.Clus_DMDB std=STD nominal=GLM ordinal=RANK
;
input %DMVQINTERVAL / level=interval;
VQ maxc = 10 clusname=_SEGMENT_ CLUSLABEL="Segment Id" DISTLABEL="Distance";
MAKE outvar=EMWS2.Clus_OUTVAR;
INITIAL radius=0
;
TRAIN tech=FORGY
;
SAVE outstat=EMWS2.Clus_OUTSTAT outmean=EMWS2.Clus_OUTMEAN;
code file="D:\5982361226\SAS\SASProject\Workspaces\EMWS2\Clus\DMVQSCORECODE.sas"
group=Clus
;
run;
quit;
*------------------------------------------------------------* ;
* Clus: DMVQ Variables;
*------------------------------------------------------------* ;
%macro dmvqvars;
    MeanHHSz MedHHInc RegDens
%mend ;
