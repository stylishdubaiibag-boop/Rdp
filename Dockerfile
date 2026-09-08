FROM dorowu/ubuntu-desktop-lxde-vnc:focal

ENV DEBIAN_FRONTEND=noninteractive

# System tools, Python, SQLite aur WhatsApp dependencies install karein
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    sqlite3 \
    postgresql-client \
    python3 \
    python3-pip \
    python3-dev \
    libfuse2 \
    libgtk-3-0 \
    libnotify4 \
    libnss3 \
    libxss1 \
    libxtst6 \
    xdg-utils \
    libsecret-1-0 \
    libglib2.0-0 \
    libnspr4 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

# WhatsApp AppImage download karein
RUN wget -O /usr/local/bin/whatsapp "https://github.com/rafostar/whatsapp-for-linux/releases/download/v1.6.0/whatsapp-for-linux-1.6.0-x86_64.AppImage" \
    && chmod +x /usr/local/bin/whatsapp

EXPOSE 80

CMD ["/startup.sh"]
