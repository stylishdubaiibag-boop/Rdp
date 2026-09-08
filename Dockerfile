FROM dorowu/ubuntu-desktop-lxde-vnc:latest

ENV DEBIAN_FRONTEND=noninteractive

# Sirf zaroori system packages install karein
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    python3 \
    python3-pip \
    sqlite3 \
    libfuse2 \
    libglib2.0-0 \
    libnss3 \
    libnspr4 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80

CMD ["/startup.sh"]
