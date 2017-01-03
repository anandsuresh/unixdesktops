#!/bin/sh
if [ "$(id -u)" -ne 0 ]
then
  echo "Please run as root"
  exit
fi

echo "===================================="
echo "|Step 1: Choose an operating system|"
echo "===================================="
find scripts -maxdepth 1  | cut -d '/' -f 2 | grep '^[0-9]\|[a-z]' | grep -v scripts | sort | column -x -c 80
echo ""
printf "Your choice >"
read -r os

echo "================================"
echo "|Choose a CPU architecture type|"
echo "================================"
find scripts/$os -maxdepth 1 | cut -d '/' -f 3 | grep '^[0-9]\|[a-z]' | sort | column -x -c 80
echo ""
printf "Your choice >"
read -r arch

echo "=============================="
echo "|Choose a desktop environment|"
echo "=============================="
find scripts/$os/$arch -maxdepth 1 | cut -d '/' -f 4  | egrep ^[0-9]\|[a-z] | grep -v base | grep -v xdm| grep -v keylaunch| sort | column -x -c 80
echo ""
printf "Your choice >"
read -r de

echo "========="
echo "|WARNING|"
echo "========="
echo ""
echo "This will attempt to install $de on $os $arch, are you sure you want to continue? (yes/no)"
echo ""
printf "Your choice >"
read -r warning_choice
if [ "$warning_choice" != "yes" ]
then
  exit 0
fi

sh scripts/"$os/$arch/base"
sh scripts/"$os/$arch/$de"

echo "===================================="
echo "|Would you like to reboot? (yes/no)|"
echo "===================================="
echo ""
printf "Your choice >"
read -r reboot_choice
if [ "$reboot_choice" = "yes" ]
then
    reboot
fi
