#!bin/bash

source color.conf
a="$column1_background"
b="$column1_font_color"
c="$column2_background"
d="$column2_font_color"

ok='^[1-6]$'

if ! [[ $a ]];then
	a=5;
	da=1;
fi

if ! [[ $b ]];then
	b=6;
	db=1;
fi

if ! [[ $c ]];then
	c=6;
	dc=1;
fi
	
if ! [[ $d ]];then
	d=5;
	dd=1;
fi		

if [[ $a == $b ]] || [[ $c == $d ]]
then
	echo "Error: The font and background colors should not match. Try again"
	exit 0
elif ! [[ $a =~ $ok ]] || ! [[ $b =~ $ok ]] || ! [[ $c =~ $ok ]] || ! [[ $d =~ $ok ]]
then
	echo "Error: All parametrs must be from 1 to 6. Try again"
	exit 1
fi

bash info.sh $a $b $c $d

echo ""

if [[ $da ]];then
	echo "Column 1 background = default $(bash name_of_color.sh $a)"
else
	echo "Column 1 background = $a $(bash name_of_color.sh $a)"
fi

if [[ $db ]];then
	echo "Column 1 background = default $(bash name_of_color.sh $b)"
else
	echo "Column 1 font color = $b $(bash name_of_color.sh $b)"
fi

if [[ $dc ]];then
	echo "Column 1 background = default $(bash name_of_color.sh $c)"
else
	echo "Column 2 background = $c $(bash name_of_color.sh $c)"
fi

if [[ $dd ]];then
	echo "Column 1 background = default $(bash name_of_color.sh $d)"
else
	echo "Column 2 font color = $d $(bash name_of_color.sh $d)"
fi
