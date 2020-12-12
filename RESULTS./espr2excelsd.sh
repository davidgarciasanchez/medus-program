#!/bin/bash
FILE=$1
./simulate_detached.sh $FILE
#WARNING: This procedure should be adapted then to really use it for dynamic simulation, it only takes two zones (unknowns).
./grt2excel.sh $FILE

#delete temporary
rm *.grt
rm *.grt.par
rm *.res
rm *.*.par
