#!/bin/bash
#Use grt2excel.sh FILE
#Returns the hourly .txt file FILE.txt.

FILE=$1

# subtitude data.grt files to make a graph.

printf "Arranging ESP-r data.grt file... \n"

#DEBUG
#awk '{sub(/)/,"),"); print}' data.grt > 1.tcc
#awk '{gsub(/Time/,"Time,"); print}' 1.tcc > 2.tcc

#awk '{sub(/)/,"),"); print}' data.grt > 1.tcc
awk '{gsub(/Time/,"Time,"); print}' data.grt > 2.tcc

#####################

awk '{gsub(/,/,";"); print}' 2.tcc > 3.tcc
#awk '{gsub(/"."/,","); print}' record2.txt > record3.txt

awk 'NR>4' 3.tcc > 4.tcc

printf "Selecting only heated zones in ESP-r data.grt file... \n"
awk -F";" '{print $2";",$3}' 4.tcc > 5.tcc

printf "Creating the sum of heating zones... \n"
awk -F";" '{sum=0; for(i=1; i<=NF; i++){sum+=$i}; print sum}' 5.tcc > $FILE'_Hourly.cs2'

printf "Delete temporaty tcc files... \n"
#delete temporary
rm *.tcc

printf "Invoke hour2day... \n"
./hour2day.sh $FILE

printf "Done... \n"
