FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xrdp \
    dbus-x11 \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash rdpuser && \
    echo 'rdpuser:password123' | chpasswd && \
    adduser rdpuser sudo

RUN echo "startxfce4" > /home/rdpuser/.xsession && \
    chown rdpuser:rdpuser /home/rdpuser/.xsession

EXPOSE 3389

CMD service xrdp start && tail -f /dev/null
