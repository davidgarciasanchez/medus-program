#!/bin/bash
#use ./hour2day.sh file_Hourly.cs2 


FILE=$1

left=1
right=24
Dnumber=365
Step=24

awk ' NR>=1 && NR<= 24{sum +=$1; if(NR == 24){exit}} END {print sum/24}' $FILE'_Hourly.cs2' > 1.tmp

for  ((LINE=2 ;  LINE<=$Dnumber ;  LINE++))
do

left=$(($left + $Step ))
right=$(($right + $Step ))
printf "$left and $right \n"

awk ' NR>='$left' && NR<='$right' {sum +=$1; if(NR == '$right'){exit}} END {print sum/24}' $FILE'_Hourly.cs2' > $LINE.tmp

done
STR=`echo | ls *.tmp | sort -n | awk '{printf  $0" "}'`;
cat $STR > daily.tmp

awk '{gsub(/\./,","); print}' daily.tmp > $FILE'_daily_excel.csv'

#delete temporary
rm *.tmp
