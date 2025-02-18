#!bin/bash

b1=$(bash color.sh 1 $1)
f1=$(bash color.sh 2 $2)
b2=$(bash color.sh 1 $3)
f2=$(bash color.sh 2 $4)
re="\033[0m"

echo -e "$b1$f1 HOSTNAME$re =" $b2$f2$HOSTNAME$re
echo -e "$b1$f1 TIMEZONE$re = $b2$f2$(cat /etc/timezone) $(date +"%Z %z")$re"
echo -e "$b1$f1 USER$re =" $b2$f2$USER$re
source /etc/os-release
echo -e "$b1$f1 OS$re = $b2$f2$NAME $VERSION$re"
echo -e "$b1$f1 DATE$re = $b2$f2$(date +"%d %B %Y %T")$re"
echo -e "$b1$f1 UPTIME$re = $b2$f2$(uptime -p)$re"
echo -e "$b1$f1 UPTIME_SEC$re = $b2$f2$(awk '{print $1}' /proc/uptime)$re"
echo -e "$b1$f1 IP$re = $b2$f2$(hostname -I)$re"
echo -e "$b1$f1 MASK$re = $b2$f2$(ipcalc $(hostname -I)| grep "Netmask:" | awk '{printf $2}')$re"
echo -e "$b1$f1 GATEWAY$re = $b2$f2$(ip route | grep default | awk '{print $3}')$re"
echo -e "$b1$f1 RAM_TOTAL$re = $b2$f2$(free | grep "Mem:" | awk '{printf "%.3f GB", $2/1000000}')$re"
echo -e "$b1$f1 RAM_USED$re = $b2$f2$(free | grep "Mem:" | awk '{printf "%.3f GB", $3/1000000}')$re"
echo -e "$b1$f1 RAM_FREE$re = $b2$f2$(free | grep "Mem:" | awk '{printf "%.3f GB", $4/1000000}')$re"
echo -e "$b1$f1 SPACE_ROOT$re = $b2$f2$(df | grep "/$" | awk '{printf "%.2f MB\n", $2/1000}')$re"
echo -e "$b1$f1 SPACE_ROOT_USED$re = $b2$f2$(df | grep "/$" | awk '{printf "%.2f MB\n", $3/1000}')$re"
echo -e "$b1$f1 SPACE_ROOT_FREE$re = $b2$f2$(df | grep "/$" | awk '{printf "%.2f MB\n", $4/1000}')$re"
