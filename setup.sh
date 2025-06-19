#!/bin/bash

ALACRITTY_PATH="$HOME/.config/alacritty/"
TMUX_PATH="$HOME/.config/tmux"
NVIM_PATH="$HOME/.config/nvim"
BASH_PATH="$HOME/.bashrc"
TOOLS=("git" "alacritty" "tmux" "nvim")

check_tools(){
    echo "==========="
    for tool in "${TOOLS[@]}"; do
         TOOL_UPPER=${tool^^}
        if command -v "$tool" >/dev/null 2>&1; then
            echo "[$TOOL_UPPER] -> OK"
        else
            echo "[$TOOL_UPPER] -> Not installed"
            echo "Aborting..."
            exit 1
        fi
    done
    echo "==========="
}

check_or_create_dir(){
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
    fi
}

check_error(){
    local status_code=$1
    local msg=$2
    if [ $status_code -ne 0 ]; then
        echo "ERROR: $msg"
        exit 1
    fi
}

copy_configs(){
    echo "==========="
    echo "[ALACRITTY] copying..."
    check_or_create_dir "$ALACRITTY_PATH"
    cp -r alacritty/. "$ALACRITTY_PATH"
    check_error $? "copying Alacritty files"

    echo "[NEOVIM] copying..."
    check_or_create_dir "$NVIM_PATH"
    cp -r nvim/. "$NVIM_PATH"
    check_error $? "copying Neovim files"

    echo "[TMUX] copying..."
    check_or_create_dir "$TMUX_PATH"
    cp tmux/tmux.conf "$TMUX_PATH/tmux.conf"
    check_error $? "copying Tmux files"
    if [ ! -d "$TMUX_PATH/plugins/tpm/" ]; then
        git clone https://github.com/tmux-plugins/tpm "$TMUX_PATH/plugins/tpm/"
        check_error $? "cloning tmux plugin manager (tpm)"
    fi

    echo "[BASH] copying..."
    cp "$BASH_PATH" "$BASH_PATH.bak"
    cp bashrc "$BASH_PATH"
    check_error $? "copying .bashrc"
    echo "==========="
}

check_tools
copy_configs
