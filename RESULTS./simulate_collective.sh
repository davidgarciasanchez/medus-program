#!/bin/bash
# ESP-r bash-type file who simply do an analysis in ESP-r for bld TYPL3
# version 11/10/2011 16h11
# use 
# ./simulate_collective.sh results_file

# Note 10 days start-up previous simulation

RESULTS=$1

printf "Analyzing the building type TYPL3 \n"
printf "Yearly data, default maison type building 3 .cfg file... \n "

/opt/esp-r/bin/bps -file /home/dgarci08/Bureau/MEDUSPROGRAM/TYPL3/cfg/TYPL3.cfg -mode text <<XXX

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


