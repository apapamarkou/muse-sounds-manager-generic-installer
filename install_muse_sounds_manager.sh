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

# Variables
PACKAGE_URL="https://muse-cdn.com/Muse_Sounds_Manager_x64.tar.gz"
PACKAGE_NAME="Muse_Sounds_Manager_x64"
INSTALL_DIR="/usr/local"
BIN_DIR="$INSTALL_DIR/bin"
ICON_DIR="/usr/share/icons/hicolor"
DESKTOP_DIR="/usr/share/applications"
TEMP_DIR="/tmp/$PACKAGE_NAME"

# Check for root permissions
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Download the package
echo "Downloading $PACKAGE_NAME..."
wget -O "$TEMP_DIR.tar.gz" "$PACKAGE_URL"

# Extract the package
echo "Extracting package..."
mkdir -p "$TEMP_DIR"
tar -xf "$TEMP_DIR.tar.gz" -C "$TEMP_DIR"

# Find the exact version directory dynamically
VERSION_DIR=$(find "$TEMP_DIR" -maxdepth 1 -type d -name "muse_sounds_manager_x64_*" | head -n 1)
echo "Version directory: $VERSION_DIR"
if [[ -z "$VERSION_DIR" ]]; then
  echo "Version directory not found!"
  exit 1
fi

VERSION=$(basename "$VERSION_DIR" | grep -oP "(?<=muse_sounds_manager_x64_)[\d.]+")
echo "Detected version: $VERSION"

# Copy binaries
echo "Installing binaries..."
mkdir -p "$BIN_DIR"
cp -v "$VERSION_DIR/bin/"* "$BIN_DIR/"

# Copy icons
echo "Installing icons..."
find "$VERSION_DIR/res/icons/hicolor" -type d | while read -r dir; do
  DEST_DIR="$ICON_DIR/${dir#*/hicolor/}"
  mkdir -p "$DEST_DIR"
  cp -v "$dir"/* "$DEST_DIR/"
done

# Update the icon cache
echo "Updating icon cache..."
gtk-update-icon-cache -q -t /usr/share/icons/hicolor

# Install and update the .desktop file
echo "Installing .desktop file..."
DESKTOP_FILE="$VERSION_DIR/res/muse-sounds-manager.desktop"
sed -i "s|Exec=muse-sounds-manager|Exec=$BIN_DIR/muse-sounds-manager|g" "$DESKTOP_FILE"
cp -v "$DESKTOP_FILE" "$DESKTOP_DIR/"

# Set executable permissions for the binaries
chmod +x "$BIN_DIR/muse-sounds-manager"

# Cleanup
trap 'rm -rf "/tmp/$PACKAGE_NAME.tar.gz" "$TEMP_DIR" "$VERSION_DIR"' EXIT


echo "Installation completed successfully!"
