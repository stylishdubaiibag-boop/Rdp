FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# XFCE desktop, VNC aur Chrome ki zaroori dependencies install karna
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xfce4-terminal \
    tightvncserver \
    novnc \
    websockify \
    wget \
    curl \
    bzip2 \
    net-tools \
    libu2f-udev \
    libvulkan1 \
    libgbm1 \
    && rm -rf /var/lib/apt/lists/*

# Google Chrome ka official stable package direct download aur forcefully link karna
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get update && \
    apt-get install -y ./google-chrome-stable_current_amd64.deb && \
    rm google-chrome-stable_current_amd64.deb && \
    ln -sf /usr/bin/google-chrome-stable /usr/bin/x-www-browser

EXPOSE 8080

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
