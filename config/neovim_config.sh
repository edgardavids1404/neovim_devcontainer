#!/bin/bash

set -e

# Update package list and install git
apt-get install -y git
apt-get install -y build-essential
apt-get install -y ripgrep
apt-get install -y xclip

# Target directory
TARGET_DIR="$HOME/.config/nvim"

# Remove existing directory if it exists
rm -rf "$TARGET_DIR"

# Create the target directory
mkdir -p "$TARGET_DIR"

# Clone the repository into a temporary location
TEMP_DIR=$(mktemp -d)
git clone https://github.com/myrepo/kickstart.nvim "$TEMP_DIR"

# Move contents of the repo into the target directory
mv "$TEMP_DIR"/* "$TARGET_DIR"
mv "$TEMP_DIR"/.??* "$TARGET_DIR" 2>/dev/null || true  # Move hidden files (if any)

# Clean up
rm -rf "$TEMP_DIR"

echo "kickstart.nvim has been installed into $TARGET_DIR"


