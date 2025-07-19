#!/bin/bash
set -e

# Download the latest Neovim release
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

# Remove any existing Neovim installation in /opt
rm -rf /opt/nvim-linux-x86_64

# Extract the tar.gz to /opt
tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Add Neovim to PATH in ~/.bashrc if not already present
if ! grep -q '/opt/nvim-linux-x86_64/bin' "$HOME/.bashrc"; then
	echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> "$HOME/.bashrc"
	echo 'Neovim path added to ~/.bashrc'
fi

# Source the updated ~/.bashrc
. "$HOME/.bashrc"

# Optional: clean up the tar.gz
rm nvim-linux-x86_64.tar.gz
