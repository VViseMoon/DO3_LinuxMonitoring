#!bin/bash
echo "HOSTNAME =" $HOSTNAME
echo "TIMEZONE = $(cat /etc/timezone) $(date +"%Z %z")"
echo "USER =" $USER
source /etc/os-release
echo "OS = $NAME $VERSION"
echo "DATE = $(date +"%d %B %Y %T")"
echo "UPTIME = $(uptime -p)"
echo "UPTIME_SEC = $(awk '{print $1}' /proc/uptime)"
echo "IP = $(hostname -I)"
echo "MASK = $(ipcalc $(hostname -I)| grep "Netmask:" | awk '{printf $2}')"
echo "GATEWAY = $(ip route | grep default | awk '{print $3}')"
echo "RAM_TOTAL = $(free | grep "Mem:" | awk '{printf "%.3f GB", $2/1000000}')"
echo "RAM_USED = $(free | grep "Mem:" | awk '{printf "%.3f GB", $3/1000000}')"
echo "RAM_FREE = $(free | grep "Mem:" | awk '{printf "%.3f GB", $4/1000000}')"
echo "SPACE_ROOT = $(df | grep "/$" | awk '{printf "%.2f MB\n", $2/1000}')"
echo "SPACE_ROOT_USED = $(df | grep "/$" | awk '{printf "%.2f MB\n", $3/1000}')"
echo "SPACE_ROOT_FREE = $(df | grep "/$" | awk '{printf "%.2f MB\n", $4/1000}')"
