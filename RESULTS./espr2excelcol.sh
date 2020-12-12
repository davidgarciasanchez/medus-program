#!/bin/bash
FILE=$1
LINE=$2

DEPAR=`echo | awk 'NR=='$LINE' {print $1 ;exit}' DEPAR.txt`; # % DEPA Collective

./simulate_collective.sh $FILE
#WARNING: here maybe the so called randomly distributed procedure should take place, (in fact is here that it must)



./recover_collective.sh $FILE $DEPAR

#WARNING: This procedure should be adapted then to really use it for dynamic simulation, it only takes two zones (unknowns).
./grt2excel.sh $FILE

#delete temporary
rm *.grt
rm *.grt.par
rm *.res
rm *.*.par
