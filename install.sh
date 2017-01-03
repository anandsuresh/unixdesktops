#!/bin/sh

if [ "$(id -u)" -ne 0 ]
then
  echo "Please run as root"
  exit
fi

echo "===================================================="
echo "|Step 1: Choose an operating system(enter a number)|"
echo "===================================================="
echo "|"
echo "|1: FreeBSD 11"
echo "|"
printf "|Your choice >"
read -r os_choice
echo "|"

if [ "$os_choice" -eq "1" ]
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
read -r arch_choice
echo "|"

if [ "$arch_choice" -eq "1" ]
then
  arch="amd64"
fi

echo "============================================="
echo "|Choose a desktop environment(enter a name)|"
echo "============================================="
find scripts/install-*-on-$os-$arch.sh | cut -d '-' -f 2 | column -x -c 80
printf "|Your choice >"
read -r de

echo "========="
echo "|WARNING|"
echo "========="
echo "|"
echo "|This will attempt to install $de on $os $arch, are you sure you want to continue? (y/n)"
echo "|"
printf "|Your choice >"
read -r warning_choice
if [ "$warning_choice" -ne "y" ]
then
  exit 0
fi

sh scripts/install-"$de"-on-"$os"-"$arch".sh

echo "================================="
echo "|Would you like to reboot? (y/n)|"
echo "================================="
echo "|"
printf "|Your choice >"
read -r reboot_choice
if [ "$reboot_choice" -eq "y" ]
then
    reboot
fi
