#!/bin/sh
get_repos() {
  git clone https://github.com/Nova-archx86/Dwm-build
  git clone https://github.com/Nova-archx86/slock-build 
  git clone https://aur.archlinux.org/paru.git
}

build_paru() {
  cd paru
  makepkg -si 
  cd ..
}

install_packages() {
	cd Dwm-build && make && sudo make install
  cd ../slock-build && make && sudo make install
  cd ..
	paru -S $(awk '{print $1}'  packages.txt)
	paru -S $(awk '{print $1}' aur_pkgs.txt)
}

build_paru() {
  cd paru
  makepkg -si 
  cd ..
}

get_dotfiles() {
  cp -r .config $HOME 
  cp -r wallpapers $HOME
  cp -r bin $HOME
  cp .bash_profile $HOME
  cp .bashrc $HOME
  cp .xinitrc $HOME 
  cp .vimrc $HOME
}

get_repos
build_paru
install_packages
get_dotfiles
