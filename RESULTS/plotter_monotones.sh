#!/bin/bash
#http://www.ukonline.be/programmation/gnuplot/tutoriel/chapitre1/page2.php

#NOTE TO BETTER SEE THE MONOTONES WE ASSUME THE DATA  We asume heating is off 3288 hours per year (summer) means that still 5473 hourly data

#This script is Folder Independant in /results and in /Minerva
#It should only be carefull about titles to not mistake jpg outputs.

STR2=`echo | ls *.mon | sort -n | awk '{printf  $0" "}'`;
paste -d";" $STR2 > total_daily_monotones.csv

awk -F";" '{print NR ";" $0}' total_daily_monotones.csv > total_daily_monotones_X1.csv

#count the number of files with extension *.cs2 we have in the directory
NRowi=`echo | ls *.cs2 -1  | wc -l`;
#an option.
#NRowi=$1
NRow=$(( $NRowi + 1 ));


awk 'NR<'$NRow' {printf ", \"\" u 1:"$1"  notitle w l"}' numbers.sh > plot.txt
#here you can add some gnuplot commands by adding the proper ;
awk 'NR==1 {printf "set title \047 Monotones pour le bâtiment Minerva - '$NRowi' Simulations \047;  set xlabel \" heures \"; set ylabel \" Puissance kW \"; set datafile separator \";\"; set timestamp; set xrange [1:5473]; plot \"total_daily_monotones_X1.csv\" u 1:2  notitle w l" $0}' plot.txt > plot2.txt
#here you can send different output by gnuplot commands
awk 'NR==1 {print $0";  set out \047monotones.ps\047 ;  set term postscript enhanced color; set xlabel \" heures \"; set ylabel \" Puissance kW \"; set title \047 Monotones pour le batiment Minerva - '$NRowi' Simulations \047; replot;"}' plot2.txt > plot3.txt

echo | awk '{print $0}' plot3.txt | gnuplot -persist

rm plot.txt
rm plot2.txt
rm plot3.txt
rm total_daily_monotones_X1.csv
