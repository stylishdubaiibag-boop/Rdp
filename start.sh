#!/bin/bash
mkdir -p ~/.vnc
echo "password" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd
vncserver :1 -geometry 1280x800 -depth 24
websockify --web /usr/share/novnc/ 8080 localhost:5901
