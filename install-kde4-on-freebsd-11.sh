#!/bin/sh

if [ `id -u` -ne 0 ]
  then echo "Please run as root"
  exit
fi

pkg install -y xorg kde

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

if grep "kdm4_enable" /etc/rc.conf > /dev/null
then
  echo "Skipping enabling KDM4"
else
  echo 'kdm4_enable="YES"' >> /etc/rc.conf
fi
