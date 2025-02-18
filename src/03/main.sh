#!bin/bash

ok='^[1-6]$'

if [[ "$#" -lt 4 ]]
then
	echo "Error: Not enought parametrs (you need to enter 4 parametrs). Try again"
	exit 1
elif [[ $1 == $2 ]] || [[ $3 == $4 ]]
then
	echo "Error: The font and background colors should not match. Try again"
	exit 0
elif ! [[ $1 =~ $ok ]] || ! [[ $2 =~ $ok ]] || ! [[ $3 =~ $ok ]] || ! [[ $4 =~ $ok ]]
then
	echo "Error: All parametrs must be from 1 to 6. Try again"
	exit 1
fi

bash info.sh $1 $2 $3 $4 
