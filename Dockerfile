FROM node:22-bookworm

# ===== Necessary Libraries for Electron Execution =====
RUN apt-get update && apt-get install -y \
    # SSL / HTTPS
    ca-certificates \
    curl \
    wget \
    \
    # Electron / Chromium runtime deps
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxshmfence1 \
    libgbm1 \
    libasound2 \
    libgtk-3-0 \
    \
    # Electron Forge
    dpkg \
    fakeroot \
    rpm \
    \
    # Font (Avoiding garbled text)
    fonts-liberation \
    fonts-noto-cjk \
    fonts-noto-color-emoji \
    \
    # For debugging
    xdg-utils \
    \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# ===== Stability of Electron Download=====
ENV ELECTRON_MIRROR=https://npmmirror.com/mirrors/electron/

# ===== Development =====
# WORKDIR /workspaces/app

# node user (devcontainer standard)
USER node
