if upcase(NAME) = "DEMAGE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "DEMCLUSTER" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "DEMGENDER" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "DEMHOMEOWNER" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "DEMPCTVETERANS" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "GIFTAVG36" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "GIFTAVGALL" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "GIFTAVGCARD36" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "GIFTCNTALL" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "GIFTCNTCARD36" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "GIFTCNTCARDALL" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "GIFTTIMEFIRST" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PROMCNT12" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PROMCNT36" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PROMCNTALL" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PROMCNTCARD12" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PROMCNTCARD36" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PROMCNTCARDALL" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "Q_TARGET_B0" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_TARGET_B1" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "REP_DEMMEDINCOME" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "STATUSCAT96NK" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "STATUSCATSTARALL" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
