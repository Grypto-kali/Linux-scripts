#!/bin/bash

# Ensure the script is run with sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo privileges (sudo ./install_bettercap.sh)"
  exit 1
fi

echo "Removing the current Bettercap version..."
apt remove -y bettercap

echo "Downloading Bettercap 2.29..."
BETTERCAP_URL="https://github.com/bettercap/bettercap/releases/download/v2.29/bettercap_linux_amd64_v2.29.zip"
wget -q "$BETTERCAP_URL" -O bettercap_2.29.zip

if [ $? -ne 0 ]; then
  echo "Download failed. Check your network connection or the URL."
  exit 1
fi

echo "Extracting the downloaded zip file..."
unzip -o bettercap_2.29.zip

if [ $? -ne 0 ]; then
  echo "Failed to extract the zip file. Make sure 'unzip' is installed."
  exit 1
fi

echo "Moving the Bettercap binary to the system directory..."
mv bettercap /usr/local/bin/

if [ $? -ne 0 ]; then
  echo "Failed to move the binary. Check your permissions."
  exit 1
fi

echo "Setting execute permissions for the Bettercap binary..."
chmod +x /usr/local/bin/bettercap

echo "Cleaning up temporary files..."
rm bettercap_2.29.zip

echo "Checking the installed version..."
bettercap -v

echo "Bettercap 2.29 has been successfully installed!"
