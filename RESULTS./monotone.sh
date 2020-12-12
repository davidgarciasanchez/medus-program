#!/bin/bash
# Programa hecho por tu papi.
# We asume heating is off 3288 hours per year (summer) means that still 5473 hourly data
# FINAL VERSION. DGS NOV 2011
# THIS PROGRAM IS FILE INDEPENDANT

#x-axis numeb
Number=$1

# ***** INPUTS *****
# ---------------------- Power dans le courbe à un temps (heure) specifique --------
Hora=2736; #for output P_hour/P_moyenne
Hora2=2736; #for output P_hour

#count the number of files with extension *.cs2 we have in the directory
Dnumber=`echo | ls *.cs2 -1  | wc -l`;
nFiles=$(( $Dnumber + 1000 ))

printf "creating monotone curves and average power ..."


printf "for --> $Dnumber files \n"

for  ((LINE=1 ;  LINE<=$Dnumber ;  LINE++))
do

printf "."
#inverse(r) numerical(n) sort
sort -nr $LINE'_result_Hourly.cs2' > $LINE'.tmp'

#print and save only data when heating is ON (not summer period)
awk 'NR==1,NR==5473' $LINE'.tmp' > $LINE'.mon'

#--------

#print the row when the value is egal to zero (it could be another value)
#awk '{for (i=1; i<=NF; i++) if ($i == 0){exit}} END{print NR}' test.txt

#average of each column (puissance moyenne)
#awk '{for(i=1; i<=NF; i++){sum[i]+=$i}} END {for(i=1; i<=NF; i++){printf sum[i]/NR}}' test.txt

Pmoyenne=`echo | awk '{for(i=1; i<=NF; i++){sum[i]+=$i}} END {for(i=1; i<=NF; i++){printf sum[i]/NR}}' $LINE'.mon'`; # puissance moyenne

#Puissance at an specific hour
#awk 'NR==1' $LINE'.tmp' > hola.txt


#--------------------------- OUTPUTS --------------------------------

#Puissance at an specific hour divided by puissance moyenne *********
awk 'NR=='$Hora' {print $1/'$Pmoyenne'}' $LINE'.mon' > $LINE'.ppp'

#Puissance moyenne collecte en fichiers *.df ************************
awk '{for(i=1; i<=NF; i++){sum[i]+=$i}} END {for(i=1; i<=NF; i++){printf sum[i]/NR}}' $LINE'.mon' > $LINE'.df'

#Puissance at an specific hour **************************************
awk 'NR=='$Hora2' {print $1}' $LINE'.mon' > $LINE'.slp'



done

ulimit -n $nFiles

#collect the *.ppp files P_heure/P_moyenne
STR=`echo | ls *.ppp | sort -n | awk '{printf  $0" "}'`;
paste -d"\n" $STR > Total_pheure_pmoy.txt

#collect the *.ppp files P_moyenne
STR=`echo | ls *.df | sort -n | awk '{printf  $0" "}'`;
paste -d"\n" $STR > Total_pmoyenne.txt

#collect the *.ppp files P_heure
STR=`echo | ls *.slp | sort -n | awk '{printf  $0" "}'`;
paste -d"\n" $STR > Total_pheure.txt

#Delete temporal files
rm *.tmp
#rm *.ppp

printf "done \n"


