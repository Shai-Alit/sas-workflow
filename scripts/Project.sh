#!/bin/bash
dtstamp=$(date +%Y.%m.%d_%H.%M.%S)
pgmname='../code/Project.sas'
logname='../logs/Project_$dtstamp.log'
some/dir/sas $pgmname -log $logname
