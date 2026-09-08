FROM dorowu/ubuntu-desktop-lxde-vnc:jammy

ENV DEBIAN_FRONTEND=noninteractive

# Ubuntu repositories ke source list ko fix karke dependencies install karein
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
    libglib2.0-0 \
    libnss3 \
    libnspr4 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libnspr4 \
    libpango-1.0-0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm-dev \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

# WhatsApp AppImage download karein
RUN wget -O /usr/local/bin/whatsapp "https://github.com/rafostar/whatsapp-for-linux/releases/download/v1.6.0/whatsapp-for-linux-1.6.0-x86_64.AppImage" \
    && chmod +x /usr/local/bin/whatsapp

EXPOSE 80

CMD ["/startup.sh"]
