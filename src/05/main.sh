#!bin/bash
str=$1

if [[ $#  -ne 1 ]]
then
	echo "Error: Incorrect number of parameters (must be 1). Try again"
	exit 0
elif [ "${str: -1}" != "/" ]
then
	echo "Error: Incorrect directory name (dont forget "/"). Try again"
	exit 0
elif ! [[ -d "$1" ]] 
then
	echo "Error: Directorr does not exist or has not been provided. Try again"
	exit 1
fi

start=$(date +%s.%N)
bash count.sh $1
stop=$(date +%s.%N)

run=$( echo "$stop - $start" | bc)
echo "Script execution time (in nanoseconds) = $run" 
