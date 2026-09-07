#!/bin/bash

# Purane locks saaf karein
export USER=root
rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1

# VNC password set karein
mkdir -p ~/.vnc
echo "password" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# XFCE desktop session config banayein
cat <<EOF > ~/.vnc/xstartup
#!/bin/bash
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
exec startxfce4
EOF
chmod +x ~/.vnc/xstartup

# VNC server start karein (Display :1, Port 5901)
vncserver :1 -geometry 1280x800 -depth 24

# Websockify ke zariye browser port 8080 ko VNC port 5901 se connect karein
websockify --web /usr/share/novnc/ 8080 localhost:5901
