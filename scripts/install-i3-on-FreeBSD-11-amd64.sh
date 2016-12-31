#!/bin/sh

if [ `id -u` -ne 0 ]
  then echo "Please run as root"
  exit
fi

pkg install -y xorg xdm i3 i3status

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

sed -i '' 's/ttyv8[[:space:]]\"\/usr\/local\/bin\/xdm[[:space:]]-nodaemon\"[[:space:]]xterm[[:space:]]off[[:space:]]secure/ttyv8\ \"\/usr\/local\/bin\/xdm\ -nodaemon\"\ xterm\ on\ secure/' /etc/ttys

echo "#!/bin/sh" > ~/.xsession
echo "exec /usr/local/bin/i3" >> ~/.xsession
chmod +x ~/.xsession

find /usr/home -type d -maxdepth 1 | grep "/usr/home/.*" |grep -v -e '^$' | xargs cp /root/.xsession
find /usr/home -maxdepth 1 -type d | cut -d '/' -f 4 | grep -v -e '^$' | grep -v 'lost+found' | xargs -I {} chown {}:{} /usr/home/{}/.xsession
