#!/bin/bash

# 1. Update and install Git/Stow
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm git stow base-devel

# 2. Install Yay (The AUR Helper)
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# 3. Install Official Packages
echo "Installing Official Packages..."
sudo pacman -S --needed --noconfirm - < pkglist.txt

# 4. Install AUR Packages
echo "Installing AUR Packages..."
yay -S --needed --noconfirm - < aurlist.txt

# 5. Link the Dotfiles
echo "Stowing Configs..."
stow hypr
stow waybar
stow zsh
# Add other folders here as you move them

echo "System Ready!"
