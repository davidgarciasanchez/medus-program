#!/bin/bash
# ESP-r bash-type file who simply do an analysis in ESP-r for bld TYPL3
# version 12/10/2011 10h11
# use 
# ./recover_collective.sh results_file collective

# Note 10 days start-up previous simulation

RESULTS=$1
COLLECTIVE=$2

printf "Recovering the data of the building type TYPL3 \n"
printf "$COLLECTIVE ************************* \n"
printf "$COLLECTIVE ************************* \n"
printf "$COLLECTIVE ************************* \n"
printf "$COLLECTIVE ************************* \n"
printf "Yearly data, default maison type building 3 .cfg file... \n "

#------------------------------------------------------------------------------------------------------------

#### HERE SHOULD BE PLACED THE PROCEDURE TO GET THE CONSOMMATION OF THE APARTMENT, WHICH APARTMENT?
# 	a A111		|	r A332
#	b A121		|	s A113
#	c A112		|	t A123
# 	d A122		|	u A133
# 	e A211		|	v A213
# 	f A221		|	w A223
#	g A212		|	x A233
#	h A222		|	y A313
#	i A311		|	z A323
# 	j A312		|	a A333
# 	k A321		|
# 	l A322		|
#	m A131		|
#	n A132		|
# 	o A231		|
#	p A232		|
# 	q A331		|
#	r A332		|

# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html

	if [ "${COLLECTIVE}" == "A111" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=a;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A121" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=b;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A112" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=c;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A122" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=d;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A211" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=e;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A221" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=f;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A212" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=g;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A222" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=h;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A311" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=i;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A312" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=j;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A321" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=k;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A322" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=l;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A131" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=m;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A132" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=n;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A231" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=o;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A232" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=p;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A331" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=q;
		dsr=1;

	elif [ "${COLLECTIVE}" == "A332" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=r;
		dsr=1;
#---------------------------- second page in ESP-r -----------------------
	elif [ "${COLLECTIVE}" == "A113" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=s;
		dsr=2;

	elif [ "${COLLECTIVE}" == "A123" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=t;
		dsr=2;

	elif [ "${COLLECTIVE}" == "A133" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=u;
		dsr=2;

	elif [ "${COLLECTIVE}" == "A213" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=v;
		dsr=2;

	elif [ "${COLLECTIVE}" == "A223" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=w;
		dsr=2;

	elif [ "${COLLECTIVE}" == "A233" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=x;
		dsr=2;

	elif [ "${COLLECTIVE}" == "A313" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=y;
		dsr=2;

	elif [ "${COLLECTIVE}" == "A323" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=z;
		dsr=2;

	elif [ "${COLLECTIVE}" == "A333" ]
	then
		printf "Recovering results for dwelling $COLLECTIVE \n"
		dwl=a;
		dsr=2;

	fi
#-------------------------------------------------------------------------------------------------

if [ "${dsr}" -eq "1" ]
then
	printf "Page 1 results file ESP-r"

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

elif [ "${dsr}" -eq "2" ]
then
	printf "Page 2 results file ESP-r"

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
0 #next page 
$dwl 
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
0 #nextpage
$dwl
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

fi

#cd /home/dgarci08/Bureau/results/
