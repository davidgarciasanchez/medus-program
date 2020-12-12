#!/bin/bash
# Collects all files named. 
# RECENT FILE BUGS QUANTITY OF FILES SOLVED.

#http://www.commentcamarche.net/forum/affich-12208596-ubuntu-too-many-open-files

#count the number of files with extension *.csv we have in the directory
Dnumber=`echo | ls *.csv -1  | wc -l`;
nFiles=$(( $Dnumber * 2 ))

printf " $nFiles \n"

ulimit -n $nFiles

STR=`echo | ls *.csv | sort -n | awk '{printf  $0" "}'`;
paste -d";" $STR > total_daily.csv

STR2=`echo | ls *.cs2 | sort -n | awk '{printf  $0" "}'`;
paste -d";" $STR2 > total_hourly.csv

