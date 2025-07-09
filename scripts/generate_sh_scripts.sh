#!/bin/bash
#usage >./generate_sh_files.sh /path/to/sas/files
#      second parameter is optional to output files to specific directory

dtstamp=$(date +%Y.%m.%d_%H.%M.%S)
#sas /sas/code/proj1/job1.sas -log /sas/code/proj1/job1.log

# Set the target directory (ie, where the sas code lives)
TARGET_DIR="../code"

#set the destination directory where you want the scripts to be saved to
DEST_DIR="./"

#set where you want the logs saved to
LOG_DIR="../logs"

#the location of your SAS installation
#SAS_DIR="/sas/SASHome/SASFoundation/9.4"
SAS_DIR="some/dir"
SAS_DIR_WIN="C:\Program Files\SASHome\SASFoundation\9.4"

# Loop through all .sas files in the target directory
find "$TARGET_DIR" -maxdepth 1 -type f -name "*.sas" | while read -r sas_file; do
    # Get the base filename without extension
    base_name=$(basename "$sas_file" .sas)
    # Create the .sh file with the same base name
    sh_file="$DEST_DIR/$base_name.sh"

    echo 'dtstamp=$(date +%Y.%m.%d_%H.%M.%S)' > "$sh_file"
    echo "pgmname='$sas_file'" >> "$sh_file"
    echo "logname='$LOG_DIR/$base_name"'_$dtstamp.log'"'" >> "$sh_file"
    echo "$SAS_DIR"'/sas $pgmname -log $logname' >> "$sh_file"
    chmod +x "$sh_file"
    echo "Created: $sh_file"

    bat_file="$DEST_DIR/$base_name.bat"

    echo "SET \"pgmname=$sas_file\"" > "$bat_file"
    echo "SET \"logname=$LOG_DIR/$base_name.log\"" >> "$bat_file"
    echo "\"$SAS_DIR_WIN\sas.exe\""' %%pgmname%% -log %%logname%%' >> "$bat_file"
    #chmod +x "$bat_file"
    echo "Created: $bat_file"
    
done

