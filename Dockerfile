FROM dorowu/ubuntu-desktop-lxde-vnc:focal

# Environment variables setup
ENV DEBIAN_FRONTEND=noninteractive

# System dependencies aur browser/AppImage ke liye required libraries install karein
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
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

# Google Chrome official repo add karke install karein
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
    && apt-get update && apt-get install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# WhatsApp for Linux AppImage download karke system path me set karein
RUN wget -O /usr/local/bin/whatsapp "https://github.com/rafostar/whatsapp-for-linux/releases/download/v1.6.0/whatsapp-for-linux-1.6.0-x86_64.AppImage" \
    && chmod +x /usr/local/bin/whatsapp

# Expose VNC and web ports
EXPOSE 80

# Default command to run desktop environment
CMD ["/startup.sh"]
