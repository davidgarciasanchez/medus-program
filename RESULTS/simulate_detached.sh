#!/bin/bash
# ESP-r bash-type file who simply do an analysis in ESP-r for bld TYPL2
# version 25/09/2011 16h11
# use ./SIMULATE.WC ESP-r_cfg_file.cfg results_file


# Note 10 days start-up previous simulation

RESULTS=$1

printf "Analyzing the building type TYPL2 \n"
printf "Yearly data, default maison type building 2 .cfg file... \n "

/opt/esp-r/bin/bps -file /home/dgarci08/Bureau/MEDUSPROGRAM/TYPL2/cfg/TYPL2.cfg -mode text <<XXX

c
/home/dgarci08/Bureau/MEDUSPROGRAM/RESULTS/$RESULTS.res
1 1
31 12
10
1
s
y
TEST: $RESULTS
y
y
-
-
XXX

#### HERE SHOULD BE PLACED THE PROCEDURE TO GET THE CONSOMMATION OF THE HOUSE, WHICH HOUSE?
# 	a DWL1
#	b DWL2
# 	c DWL3
#	d ROOF2
#	e ROOF3
#	f ROOF1

# IMPORTANT here he assume a probability of 1/10 - 8/10 - 1/10 to left-center-right position of dwelling

NUMBER=$[ ( $RANDOM % 100 )  + 1 ]

	if [ "${NUMBER}" -le "20" ]
	then
		printf "Estas en la esquina izquierda con el numero $NUMBER \n"
		dwl=a;
		roof=f;
	elif [ "${NUMBER}" -ge "21" -a "${NUMBER}" -le "79" ]
	then
		printf "Estas en medio de la jugada con el numero $NUMBER \n"
		dwl=b;
		roof=d;

	elif [ "${NUMBER}" -ge "80" ]
	then
		printf "Estas en la esquina derecha con el numero $NUMBER \n"
		dwl=c;
		roof=e;
		
	fi



#-------------------------------------------------------------------------------------------------

printf "sustracting heatings needs..."
/opt/esp-r/bin/res -file /home/dgarci08/Bureau/MEDUSPROGRAM/RESULTS/$RESULTS.res -mode text <<YYY

c # enquire about
^
e
>
b
/home/dgarci08/Bureau/MEDUSPROGRAM/RESULTS/data.grt
$RESULTS simulation
4 #selectzones
$dwl 
$roof 
-
g
h
a
!
-
-
-
YYY

/opt/esp-r/bin/res -file /home/dgarci08/Bureau/MEDUSPROGRAM/RESULTS/$RESULTS.res -mode text <<ZZZ

4 #selectzones
$dwl
$roof
- #exitselectzones
d # enquire about
>
b
/home/dgarci08/Bureau/MEDUSPROGRAM/RESULTS/$RESULTS.annuel.txt
$RESULTS annual loads
f #Energy delivered
-
-
ZZZ

#cd /home/dgarci08/Bureau/results/
