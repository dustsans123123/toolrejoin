#!/data/data/com.termux/files/usr/bin/bash

clear
echo "======================================"
echo "        MICHAEL REJOIN INSTALLER        "
echo "======================================"
sleep 1

# ==============================
# UPDATE TERMUX
# ==============================
echo "[1/7] Updating packages..."
yes | pkg update -y
yes | pkg upgrade -y

# ==============================
# STORAGE PERMISSION
# ==============================
echo "[2/7] Setting up storage..."
echo "y" | termux-setup-storage

# ==============================
# ENABLE WAKELOCK
# ==============================
echo "[3/7] Enabling wakelock..."
if command -v termux-wake-lock >/dev/null 2>&1; then
    termux-wake-lock
    echo "Wakelock enabled."
else
    echo "termux-wake-lock not available."
fi

# ==============================
# INSTALL SYSTEM PACKAGES
# ==============================
echo "[4/7] Installing system dependencies..."

yes | pkg install -y \
python \
python-pip \
python-psutil \
clang \
make \
libffi \
openssl \
libjpeg-turbo \
libpng \
zlib \
freetype \
git \
cmake \
build-essential \
tsu \
libexpat \
rust

# ==============================
# FIX PIP
# ==============================
echo "[5/7] Upgrading pip..."

pip install --upgrade pip setuptools wheel

# ==============================
# INSTALL PYTHON LIBRARIES
# ==============================
echo "[6/7] Installing Python libraries..."

pip install --prefer-binary \
requests \
pytz \
pyjwt \
pycryptodome \
rich \
colorama \
flask \
pillow \
discord.py \
python-socketio \
prettytable

# ==============================
# DOWNLOAD TOOL
# ==============================
echo "[7/7] Downloading Michael Rejoin Tool..."

cd /sdcard/Download || exit

curl -L -o obf-toolrejoin.py \
curl -Ls "https://raw.githubusercontent.com/dustsans123123/toolrejoin/refs/heads/main/obf-toolrejoin.py" -o /sdcard/Download/obf-toolrejoin.py

echo ""
echo "======================================"
echo "      INSTALLATION COMPLETED          "
echo "======================================"
