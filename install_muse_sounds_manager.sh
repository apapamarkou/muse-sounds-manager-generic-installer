#!/bin/bash

#  __  __                ____                        _
# |  \/  |_   _ ___  ___/ ___|  ___  _   _ _ __   __| |___
# | |\/| | | | / __|/ _ \___ \ / _ \| | | | '_ \ / _` / __|
# | |  | | |_| \__ |  __/___) | (_) | |_| | | | | (_| \__ \
# |_|  |_|\__,_|___/\___|____/ \___/ \__,_|_| |_|\__,_|___/
#  __  __
# |  \/  | __ _ _ __   __ _  __ _  ___ _ __
# | |\/| |/ _` | '_ \ / _` |/ _` |/ _ | '__|
# | |  | | (_| | | | | (_| | (_| |  __| |
# |_|  |_|\__,_|_| |_|\__,_|\__, |\___|_|
#                           |___/
#  ___           _        _ _
# |_ _|_ __  ___| |_ __ _| | | ___ _ __
#  | || '_ \/ __| __/ _` | | |/ _ | '__|
#  | || | | \__ | || (_| | | |  __| |
# |___|_| |_|___/\__\__,_|_|_|\___|_|
# 
# Author: Andrianos Papamarkou
#

# Define variables
DEB_URL="https://muse-cdn.com/Muse_Sounds_Manager_Beta.deb"
DOWNLOAD_DIR="$HOME/Downloads/muse-sounds-manager"
DEB_FILE="$DOWNLOAD_DIR/Muse_Sounds_Manager_Beta.deb"

# Create download directory if it doesn't exist
mkdir -p "$DOWNLOAD_DIR"

# Download the .deb package
echo "Downloading .deb package from $DEB_URL..."
wget -O "$DEB_FILE" "$DEB_URL"

# Check if download was successful
if [ ! -f "$DEB_FILE" ]; then
    echo "Download failed. Exiting..."
    exit 1
fi

# Extract the .deb package
echo "Extracting .deb package..."
cd "$DOWNLOAD_DIR"
ar x "$DEB_FILE"

# Extract the data.tar.xz (or data.tar.gz)
if [ -f "data.tar.xz" ]; then
    tar -xvf data.tar.xz
elif [ -f "data.tar.gz" ]; then
    tar -xvf data.tar.gz
else
    echo "data.tar.xz or data.tar.gz not found. Exiting..."
    exit 1
fi

# Copy the content folders (opt and usr) to the system
echo "Copying content to the system..."
sudo cp -r opt/* /opt/
sudo cp -r usr/* /usr/

# Cleanup
echo "Cleaning up..."
rm -rf "$DOWNLOAD_DIR"

echo "Installation complete."
