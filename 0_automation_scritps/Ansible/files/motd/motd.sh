#!/bin/bash
clear
CPU=`lscpu | grep 'Model name' | cut -f 2 -d ":" | awk '{$1=$1}1'`
upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
secs=$((${upSeconds}%60))
mins=$((${upSeconds}/60%60))
hours=$((${upSeconds}/3600%24))
days=$((${upSeconds}/86400))
UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`

# get the load averages
read one five fifteen rest < /proc/loadavg

echo "+--------------------------------------------------------+";
echo "|                                                        |";
echo "|  ██████   ██████  █████████  ███████████   █████       |";
echo "| ░░██████ ██████  ███░░░░░███░░███░░░░░███ ░░███        |";
echo "|  ░███░█████░███ ░███    ░░░  ░███    ░███  ░███        |";
echo "|  ░███░░███ ░███ ░░█████████  ░██████████   ░███        |";
echo "|  ░███ ░░░  ░███  ░░░░░░░░███ ░███░░░░░███  ░███        |";
echo "|  ░███      ░███  ███    ░███ ░███    ░███  ░███      █ |";
echo "|  █████     █████░░█████████  █████   █████ ███████████ |";
echo "| ░░░░░     ░░░░░  ░░░░░░░░░  ░░░░░   ░░░░░ ░░░░░░░░░░░  |";
echo "|                                                        |";
echo "+--------------------------------------------------------+";

echo "
  `uname -srmo`
  `date -u`

  Last login.........: `lastlog -u debian | awk 'NR==2 {$1=$2=$3=""; print $0}' | awk '$1=$1'` from `lastlog -u debian | awk 'NR==2 {print $3}'`
  Uptime.............: ${UPTIME}
  CPU................: $CPU
  Memory.............: `free -h | awk 'NR==2 {print $4}'` (Free) / `free -h | awk 'NR==2 {print $2}'` (Total)
  Load Averages......: ${one} (1 minute) ${five} (5 minutes) ${fifteen} (15 minutes)
  Root Drive.........: `df -h -x tmpfs -x vfat -x devtmpfs | awk 'NR==2 {print $5 " (" $3 "/" $2 ") used on " $1 }'`
  IP Addresses.......: `ip a s eth0 | grep inet | awk '{ print $2 }' | head -1`

  * YOU ARE NOW ACCESSING MISTY SNOW REALMS VIRTUAL MACHINE!
  * ONLY AUTHORIZED PERSONAL HAVE ACCESS TO THIS ENVIRONMENT!
  * SYSTEM ADMINISTRATOR : SNOWYHARUKI

"