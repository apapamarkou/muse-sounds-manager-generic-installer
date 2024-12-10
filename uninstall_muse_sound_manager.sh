#!/bin/bash

# Muse Sounds Manager Uninstall Script
# Author: Andrianos Papamarkou

# Variables
INSTALL_DIR="/usr/local"
BIN_DIR="$INSTALL_DIR/bin"
ICON_DIR="/usr/share/icons/hicolor"
DESKTOP_DIR="/usr/share/applications"

# List of binary files to remove
BIN_FILES=(
  "muse-sounds-manager"
  "libSkiaSharp.so"
  "libServiceCore.so"
  "libHarfBuzzSharp.so"
)

# Check for root permissions
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Remove binaries
echo "Removing binaries..."
for file in "${BIN_FILES[@]}"; do
  if [[ -f "$BIN_DIR/$file" ]]; then
    rm -v "$BIN_DIR/$file"
  else
    echo "File $file not found in $BIN_DIR, skipping."
  fi
done

# Remove icons
echo "Removing icons..."
find "$ICON_DIR" -type f -name "muse-sounds-manager.png" | while read -r icon; do
  rm -v "$icon"
done

# Update the icon cache
echo "Updating icon cache..."
gtk-update-icon-cache -q -t /usr/share/icons/hicolor

# Remove .desktop file
echo "Removing .desktop file..."
if [[ -f "$DESKTOP_DIR/muse-sounds-manager.desktop" ]]; then
  rm -v "$DESKTOP_DIR/muse-sounds-manager.desktop"
else
  echo ".desktop file not found in $DESKTOP_DIR, skipping."
fi

# Final message
echo "Uninstallation completed successfully!"
