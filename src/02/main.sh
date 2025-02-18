#!bin/bash
info=$(bash info.sh)
echo "$info"

echo "Do you want to write infotmation to a file? (Y/N?)"
read answer
if [[ $answer =~ [Yy] ]]
then
	filename="$(date +"%d_%m_%y_%H_%M_%S").status"
	touch $filename
	echo "$info" > $filename
fi
