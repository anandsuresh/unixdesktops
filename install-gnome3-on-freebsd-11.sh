#!/bin/sh

if [ `id -u` -ne 0 ]
  then echo "Please run as root"
  exit
fi

pkg install -y xorg gnome3

if grep "dbus_enable" /etc/rc.conf > /dev/null
then
  echo "Skipping enabling DBUS"
else
  echo 'dbus_enable="YES"' >> /etc/rc.conf
fi

if grep "hald_enable" /etc/rc.conf > /dev/null
then
  echo "Skipping enabling HALD"
else
  echo 'hald_enable="YES"' >> /etc/rc.conf
fi

if grep "gdm_enable" /etc/rc.conf > /dev/null
then
  echo "Skipping enabling GDM"
else
  echo 'gdm_enable="YES"' >> /etc/rc.conf
fi
