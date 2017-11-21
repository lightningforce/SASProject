if NAME="DemMedIncome" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_DemMedIncome" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
