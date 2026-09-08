```dockerfile
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:10

# Update + desktop + RDP + browser
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xrdp \
    dbus-x11 \
    sudo \
    chromium-browser \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# RDP user
RUN useradd -m -s /bin/bash rdpuser && \
    echo 'rdpuser:password123' | chpasswd && \
    usermod -aG sudo rdpuser

# XFCE session
RUN echo "startxfce4" > /home/rdpuser/.xsession && \
    chown rdpuser:rdpuser /home/rdpuser/.xsession

# Configure xrdp
RUN sed -i 's/^port=3389/port=3389/' /etc/xrdp/xrdp.ini

# Create startup script
RUN printf '#!/bin/bash\n\
service dbus start\n\
service xrdp start\n\
tail -f /dev/null\n' > /start.sh && \
    chmod +x /start.sh

EXPOSE 3389

CMD ["/start.sh"]
```
