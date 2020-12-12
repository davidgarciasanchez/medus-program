#!/bin/bash
# ESP-r bash-type file who simply do an analysis in ESP-r for Bld Minerva2.cfg
# version 17/08/2010 16h11
# use ./SIMULATE.WC ESP-r_cfg_file.cfg results_file


# Note 10 days start-up previous simulation

RESULTS=$1

printf "Analyzing the building type TYPL1 \n"
printf "Yearly data, default maison type building 2 .cfg file... \n "

/opt/esp-r/bin/bps -file /home/dgarci08/Bureau/MEDUSPROGRAM/TYPL1/cfg/TYPL1.cfg -mode text <<XXX

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
a #DWL1
b #ROOF
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
a #A01
b #A02
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
