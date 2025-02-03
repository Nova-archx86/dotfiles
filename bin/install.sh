#!/bin/sh

PRIV_CMD=sudo

build_deps() {
    echo "[*] Building yay..."
    git clone https://aur.archlinux.org/yay.git
    cd yay
    mkpkg -si
    cd ..
}

install_packages() {
    echo "[+] Installing packages from pacman and yay..."
    $PRIV_CMD pacman --quiet --noconfirm -S "$(awk '{print $1}'  packages.txt)"
    yay --quiet --noconfirm -Sa "$(awk '{print $1}' aur_pkgs.txt)"
}

copy_files() {
    cp -r .config/* $HOME/.config
    cp .zshrc .vimrc .gitconfig $HOME
}

build_deps
install_packages
copy_files
