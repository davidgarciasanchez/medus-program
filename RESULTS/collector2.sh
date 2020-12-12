#!/bin/bash
# Collects all files named. 

STR=`echo | ls *.rat | sort -n | awk '{printf  $0" "}'`;
paste -d"\n" $STR > conso_quartier.txt

STR2=`echo | ls *.srf | sort -n | awk '{printf  $0" "}'`;
paste -d"\n" $STR2 > surfaces_quartier.txt



