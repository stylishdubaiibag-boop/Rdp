#!/bin/bash
rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1
mkdir -p ~/.vnc
echo "password" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# XFCE desktop environment ke liye xstartup file banayein
cat <<EOF > ~/.vnc/xstartup
#!/bin/bash
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
startxfce4 &
EOF
chmod +x ~/.vnc/xstartup

# VNC Server start karein
vncserver :1 -geometry 1280x800 -depth 24

# NoVNC websocket bridge start karein
websockify --web /usr/share/novnc/ 8080 localhost:5901
