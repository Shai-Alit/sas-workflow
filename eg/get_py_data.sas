filename pdat "&localProjectPath\..\..\data\process_data.csv";

proc import datafile=pdat
out=process_data dbms=csv replace;
getnames=yes;
run;

proc contents data=process_data;
run;