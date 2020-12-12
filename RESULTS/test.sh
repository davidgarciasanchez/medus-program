#!/bin/bash
#-------------------------------- START the simulation of the isolated house ------------------
			cd /home/dgarci08/Bureau/MEDUSPROGRAM/RESULTS/


printf "Analyze heatings needs of the type of building \n"

heating=`echo | awk '/All/ {print $2 "\n"}' /home/dgarci08/Bureau/MEDUSPROGRAM/RESULTS/$LINE'_result_ISO_HOUSE.annuel.txt'`;
printf "The heating for the choice is $heating kWhrs \n"

awk '/All/ {printf "%5.2f\n",$2}' /home/dgarci08/Bureau/MEDUSPROGRAM/RESULTS/$LINE'_result_ISO_HOUSE.annuel.txt' > $LINE.rat
# ----------------------------------- END Simulation of isolated house -----------------------------------

#----------------- START - collect annual heating loads for isolated houses procedure -------------------

cd /home/dgarci08/Bureau/MEDUSPROGRAM/RESULTS/
STR=`echo | ls *.rat | sort -n | awk '{printf  $0" "}'`;
cat $STR > Total_ISOHOUSES.txt

#now we move Total.txt to central file
#mv Total.txt /home/dgarci08/Bureau/MEDUSPROGRAM/Total.txt

# IMPORTANT YOU NEED TO CAME AGAIN INTO MAIN FOLDER!!!
#cd /home/dgarci08/Bureau/MEDUSPROGRAM/
#---------------------- END - collect annual heating loads for isolated houses procedure ----------------
