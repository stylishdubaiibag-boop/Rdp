FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# XFCE desktop, VNC aur Firefox ki zaroori dependencies install karna
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
    libgtk-3-0 \
    libdbus-glib-1-2 \
    libxt6 \
    libglib2.0-0 \
    libasound2 \
    libx11-xcb1 \
    && rm -rf /var/lib/apt/lists/*

# Official Firefox ko direct download aur link karna
RUN wget -O /tmp/firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US" && \
    tar -xjf /tmp/firefox.tar.bz2 -C /opt/ && \
    ln -s /opt/firefox/firefox /usr/bin/firefox && \
    ln -s /opt/firefox/firefox /usr/bin/x-www-browser && \
    rm /tmp/firefox.tar.bz2

EXPOSE 8080

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
