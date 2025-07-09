dtstamp=$(date +%Y.%m.%d_%H.%M.%S)
pgmname='../code/temp2.sas'
logname='../logs/temp2_$dtstamp.log'
some/dir/sas $pgmname -log $logname
