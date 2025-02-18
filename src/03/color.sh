#!bin/bash

if [[ $1 =~ 1 ]]
then
	case $2 in
		1) background='\033[107m';;
		2) background='\033[101m';;
		3) background='\033[102m';;
		4) background='\033[104m';;
		5) background='\033[105m';;
		6) background='\033[40m';;
	esac
	echo  $background
else
	case $2 in
		1) front='\033[97m';;
		2) front='\033[91m';;
		3) front='\033[92m';;
		4) front='\033[94m';;
		5) front='\033[95m';;
		6) front='\033[30m';;
	esac
	echo $front
fi
