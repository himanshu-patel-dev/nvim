#!/bin/bash

set -e

# Install curl and build-essential
echo "Installing curl and build-essential..."
sudo apt update
sudo apt install -y curl build-essential

# Download Neovim
echo "Downloading Neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

# Remove old Neovim installation
echo "Removing old Neovim installation (if any)..."
sudo rm -rf /opt/nvim-linux-x86_64

# Extract Neovim to /opt
echo "Extracting Neovim to /opt..."
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Add Neovim to PATH in .bashrc if not already added
echo "Updating .bashrc..."
grep -qxF 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' ~/.bashrc || echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.bashrc

# Source .bashrc
echo "Sourcing .bashrc..."
source ~/.bashrc

echo "Installation complete. Please restart your terminal or run 'source ~/.bashrc' to use Neovim."

