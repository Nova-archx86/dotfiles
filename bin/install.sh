#!/bin/sh

get_repos() {
	git clone https://github.com/Nova-archx86/dmenu-nova
 	git clone https://github.com/Nova-archx86/dwm-nova
	git clone https://github.com/Nova-archx86/dwl-nova
  git clone https://github.com/Nova-archx86/slock-nova
	git clone https://github.com/Nova-archx86/st-nova
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
			paru -S xorg xorg-xinit nitrogen
			;;

		"2")
			paru -S wayland
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
	echo -e "Would you like to use suckless utils (Requires X11 except for dwl) y/n? \n"
	read CHOICE;

	case $CHOICE in 
		"y")
			if [[ -d /usr/include/X11 || -d /usr/local/include/X11 ]] # check for X11 libs
			then
				cd dwm-nova
				make && sudo make install
				cd ../slock-nova
				make && sudo make install
				cd ..
				cd dmenu-nova
				make && sudo make install
				cd ..
				cd st-nova
				make && sudo make install
				cd ..
				cd dwl-nova
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

copy_dotfiles() {
  cp -r $HOME/dotfiles/.config $HOME 
  cp -r $HOME/dotfiles/wallpapers $HOME
  cp -r $HOME/dotfiles/bin $HOME
  cp $HOME/dotfiles/.bash_profile $HOME
  cp $HOME/dotfiles/.bashrc $HOME
  cp $HOME/dotfiles/.xinitrc $HOME 
  cp $HOME/dotfiles/.vimrc $HOME
}

get_repos
build_paru
install_display_server
build_suckless
install_packages
copy_dotfiles
