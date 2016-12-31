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
echo "|1: amiwm"
echo "|2: Awesome"
echo "|3: Blackbox"
echo "|4: cwm"
echo "|5: dwm"
echo "|6: evilwm"
echo "|7: Fluxbox"
echo "|8: flwm"
echo "|9: fvwm1"
echo "|10: fvwm2"
echo "|11: GNOME3"
echo "|12: i3"
echo "|13: KDE4"
echo "|14: MATE"
echo "|15: Openbox"
echo "|16: w9wm"
echo "|17: XFCE4"
echo "|"
printf "|Your choice >"
read de_choice


if [ $de_choice -eq "1" ]
then
  de="amiwm"
elif [ $de_choice -eq "2" ]
then
  de="Awesome"
elif [ $de_choice -eq "3" ]
then
  de="Blackbox"
elif [ $de_choice -eq "4" ]
then
  de="cwm"
elif [ $de_choice -eq "5" ]
then
  de="dwm"
elif [ $de_choice -eq "6" ]
then
  de="evilwm"
elif [ $de_choice -eq "7" ]
then
  de="Fluxbox"
elif [ $de_choice -eq "8" ]
then
  de="flwm"
elif [ $de_choice -eq "9" ]
then
  de="fvwm-1"
elif [ $de_choice -eq "10" ]
then
  de="fvwm-2"
elif [ $de_choice -eq "11" ]
then
  de="GNOME-3"
elif [ $de_choice -eq "12" ]
then
  de="i3"
elif [ $de_choice -eq "13" ]
then
  de="KDE-4"
elif [ $de_choice -eq "14" ]
then
  de="MATE"
elif [ $de_choice -eq "15" ]
then
  de="Openbox"
elif [ $de_choice -eq "16" ]
then
  de="w9wm"
elif [ $de_choice -eq "17" ]
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
