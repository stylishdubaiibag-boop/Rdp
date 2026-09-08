FROM dorowu/ubuntu-desktop-lxde-vnc:focal

ENV DEBIAN_FRONTEND=noninteractive

# Step 1: Base tools, python, sqlite aur dependencies install karein
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
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

# Step 2: Node.js LTS install karein
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Step 3: Google Chrome ko modern secure method se install karein
RUN mkdir -p /etc/apt/keyrings \
    && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /etc/apt/keyrings/google-chrome.gpg \
    && echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update && apt-get install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# Step 4: WhatsApp AppImage download karein
RUN wget -O /usr/local/bin/whatsapp "https://github.com/rafostar/whatsapp-for-linux/releases/download/v1.6.0/whatsapp-for-linux-1.6.0-x86_64.AppImage" \
    && chmod +x /usr/local/bin/whatsapp

EXPOSE 80

CMD ["/startup.sh"]
