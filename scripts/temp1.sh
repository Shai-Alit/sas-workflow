dtstamp=$(date +%Y.%m.%d_%H.%M.%S)
pgmname='../code/temp1.sas'
logname='../logs/temp1_$dtstamp.log'
some/dir/sas $pgmname -log $logname
