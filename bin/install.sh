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

install_display_server() {
	echo -e "What display server should be installed?\n1.\tX11(Legacy)\n2.\tWayland\n3.\tNone\n"
	read CHOICE;

	case $CHOICE in
		"1")
			paru -S xorg xorg-xinit
			;;

		"2")
			paru -S wayland hyprland
			;;

		"3")
			echo -e "Skipping display server install...\n"
			;;

		*)
			echo -e "Error not a valid option!\n"
			;;

		esac

}

build_suckless() {
	read CHOICE -p "Would you like to use suckless utils (Requires X11)"

	case $CHOICE in 
		"y")
			if [[ -d /usr/include/X11 ]] # chek for X11 libs
			then
				cd Dwm-build
				make && sudo make install
				cd ../slock-build
				make && sudo make install
				cd ..
			else
				echo -e "Error X11 libs are not installed!\n"
			fi
			;;

	"n")
		echo -e "Skipping suckless builds...\n"
		;;

	*)
		echo -e "Error not an a valid option!\n"
		;;

	esac
}

install_packages() {
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
install_display_server
build_suckless
install_packages
get_dotfiles
