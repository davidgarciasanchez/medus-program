#!/bin/bash
FILE=$1
./simulate_maison.sh $FILE
./grt2excel.sh $FILE

#delete temporary
rm *.grt
rm *.grt.par
rm *.res
rm *.*.par
