#!/bin/bash
#http://www.ukonline.be/programmation/gnuplot/tutoriel/chapitre1/page2.php

#This script is Folder Independant in /results and in /Minerva
#It should only be carefull about titles to not mistake jpg outputs.

awk -F";" '{print NR ";" $0}' total_daily.csv > total_daily_X1.csv


#count the number of files with extension *.cs2 we have in the directory
NRowi=`echo | ls *.cs2 -1  | wc -l`;
#an option.
#NRowi=$1
NRow=$(( $NRowi + 1 ));


awk 'NR<'$NRow' {printf ", \"\" u 1:"$1"  notitle w l"}' numbers.sh > plot.txt
#here you can add some gnuplot commands by adding the proper ;
awk 'NR==1 {printf "set title \047 profile journaliere pour les 698 logements - '$NRowi' Simulations \047; set datafile separator \";\"; set xrange [1:365]; plot \"total_daily_X1.csv\" u 1:2  notitle w l" $0}' plot.txt > plot2.txt
#here you can send different output by gnuplot commands
awk 'NR==1 {print $0";  set out \047consol.ps\047 ; set terminal postscript enhanced color; set title \047 Consommation Journaliere pour les 698 logements - '$NRowi' Simulations \047; replot;"}' plot2.txt > plot3.txt

echo | awk '{print $0}' plot3.txt | gnuplot -persist

rm plot.txt
rm plot2.txt
rm plot3.txt
rm total_daily_X1.csv
