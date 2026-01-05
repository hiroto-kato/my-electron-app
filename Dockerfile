FROM node:22-bookworm

# ===== Electron 実行に必要なライブラリ =====
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
    # フォント（文字化け防止）
    fonts-liberation \
    fonts-noto-cjk \
    fonts-noto-color-emoji \
    \
    # デバッグ用（任意）
    xdg-utils \
    \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# ===== Stability of Electron Download=====
ENV ELECTRON_MIRROR=https://npmmirror.com/mirrors/electron/

# ===== 開発用 =====
# WORKDIR /workspaces/app

# node ユーザーで実行（devcontainer標準）
USER node
