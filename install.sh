#!/bin/sh

if [ `id -u` -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "===================================================="
echo "|Step 1: Choose an operating system(enter a number)|"
echo "===================================================="
echo "|"
echo "|1: FreeBSD 11"
echo "|"
printf "|Your choice >"
read os_choice
echo "|"

if [ $os_choice -eq "1" ]
then
  os="FreeBSD-11"
fi

echo "================================================"
echo "|Choose a CPU architecture type(enter a number)|"
echo "================================================"
echo "|"
echo "|1: amd64"
echo "|"
printf "|Your choice >"
read arch_choice
echo "|"

if [ $arch_choice -eq "1" ]
then
  arch="amd64"
fi

echo "=============================================="
echo "|Choose a desktop environment(enter a number)|"
echo "=============================================="
echo "|"
echo "|1: GNOME3"
echo "|2: KDE4"
echo "|3: XFCE4"
echo "|"
printf "|Your choice >"
read de_choice

if [ $de_choice -eq "1" ]
then
  de="GNOME-3"
elif [ $de_choice -eq "2" ]
then
  de="KDE-4"
elif [ $de_choice -eq "3" ]
then
  de="XFCE-4"
fi

if [ -e scripts/install-$de-on-$os-$arch.sh ]
then
  sh scripts/install-$de-on-$os-$arch.sh
else
  echo "Sorry, the script to install that hasn't been written yet."
fi

echo "============================================"
echo "|Would you like to reboot? (enter a number)|"
echo "============================================"
echo "|"
echo "|1: Yes"
echo "|2: No"
echo "|"
printf "|Your choice >"
read reboot_choice
if [ $reboot_choice -eq "1" ]
then
    reboot
fi
