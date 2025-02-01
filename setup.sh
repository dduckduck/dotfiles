#!/bin/bash

PKG_MANAGER=""
APPS=("neovim" "tmux" "alacritty")
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip"
FONT_DIR="$HOME/.local/share/fonts/JetBrainsMonoNerdFont"


detect_package_manager() {
    if command -v apt &> /dev/null; then
        PKG_MANAGER="apt"
    elif command -v dnf &> /dev/null; then
        PKG_MANAGER="dnf"
    elif command -v pacman &> /dev/null; then
        PKG_MANAGER="pacman"
    else
        echo "Error: No supported package manager found (apt, dnf, pacman)."
        exit 1
    fi
}

install_apps() {
    detect_package_manager
    echo "Detected package manager: $PKG_MANAGER"

    case $PKG_MANAGER in
        apt)
            sudo apt update && sudo apt install -y "${APPS[@]}"
            ;;
        dnf)
            sudo dnf install -y "${APPS[@]}"
            ;;
        pacman)
            sudo pacman -S --noconfirm "${APPS[@]}"
            ;;
    esac

    echo "Instalation finished"
}

copy_cfg(){
    echo "->[NEOVIM] Creating configuration directory and copying files..."
    mkdir -p ~/.config/nvim
    cp -r nvim/. ~/.config/nvim
    echo "->[NEOVIM] Files copied."

    echo "->[ALACRITTY] Creating configuration directory and copying files..."
    mkdir -p ~/.config/alacritty/
    cp -r alacritty/. ~/.config/alacritty
    echo "->[ALACRITTY] Files copied."

    echo "->[TMUX] Copying tmux configuration file..."
    mkdir -p ~/.config/tmux
    cp tmux/tmux.conf ~/.config/tmux/tmux.conf
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    echo "->[TMUX] tmux configuration file copied."
}

install_font() {
    echo "Downloading JetBrains Mono Nerd Font..."
    mkdir -p "$FONT_DIR"

    wget -q "$FONT_URL" -O "$FONT_DIR/JetBrainsMono.zip"
    unzip -o "$FONT_DIR/JetBrainsMono.zip" -d "$FONT_DIR"
    rm "$FONT_DIR/JetBrainsMono.zip"

    fc-cache -fv

    echo "Font downloaded and installed successfully."
}

install_apps
install_font
copy_cfg

