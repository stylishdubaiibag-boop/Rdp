FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Basic packages aur XFCE desktop install karna
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
    && rm -rf /var/lib/apt/lists/*

# Firefox ko direct Mozilla se download aur install karna (Snap Error se bachne ke liye)
RUN wget -O /tmp/firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US" && \
    tar -xjf /tmp/firefox.tar.bz2 -C /opt/ && \
    ln -s /opt/firefox/firefox /usr/bin/firefox && \
    ln -s /opt/firefox/firefox /usr/bin/x-www-browser && \
    rm /tmp/firefox.tar.bz2

EXPOSE 8080

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
