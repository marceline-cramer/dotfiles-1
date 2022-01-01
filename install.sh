#!/bin/sh

echo -e '\e[1mThis script assumes that repos are all enabled and set up correctly (particularly important on Artix). Do NOT run this script if you are not prepared to potentally break already-existing configuration.\nIdeally, no configuration is already present, as GNU Stow will simply skip any conflicts, preserving your dotfiles and nullifying the whole point of this script.\e[0m'

if ! command -v zsh &> /dev/null
then
	echo "zsh not found, it's recommended that you let Pacman install it. (This will also change the login shell)."
	sudo pacman -Sy zsh --noconfirm && chsh -s /bin/zsh
fi

if ! command -v paru &> /dev/null
then
	mkdir ~/git
	cd ~/git
    echo 'Paru not found, allow Pacman to install it.'
	sudo pacman -Sy --needed base-devel git rustup --noconfirm
	echo "Ensuring Rust's stable toolchain is present."
	rustup install stable
	cd ~/git/paru
	makepkg -si
fi


echo 'Installing some basic stuff.'
paru -Sy --needed bat ranger neovim-nightly-bin neovim-symlinks starship htop bpytop-git rofi-lbonn-wayland-git lxappearance qt5ct kvantum-qt5 kvantum-theme-orchis-git papirus-icon-theme bibata-cursor-translucent stow polkit-kde-agent --noconfirm

echo -e "The following programs aren't \e[3msuper\e[0m essential, decline and install individually later if you please."
paru -Sy picom-jonaburg-git kitty foot pcmanfm-qt dunst wired --noconfirm

echo "Installing Nerd Fonts as well as some other basic fonts."
paru -Sy --needed nerd-fonts-git noto-fonts noto-fonts-emoji noto-fonts-extra gnu-free-fonts ttf-liberation --noconfirm

echo -e "You can have a bunch of bitmap fonts installed here, which are used by Foot by default. This is optional, but they're nice and crispy :)\n\e[1mTODO:\e[0m Add the rest of the package names from the computer that actually has them all installed."
paru -Sy --needed cozette-otb siji-git leggie-git uw-ttyp0-font bdf-tewi-git phallus-fonts-git spleen-font --noconfirm

echo 'Installing the Orchis GTK theme and its dependencies.'
paru -Sy --needed sassc --noconfirm
cd ~/git
git clone https://github.com/vinceliuice/Orchis-theme
cd Orchis-theme
./install.sh -c dark -t pink

echo 'Defining some variables'
sudo echo "LIBSEAT_BACKEND=logind" >> /etc/environment
sudo echo "QT_QPA_PLATFORM=qt5ct" >> /etc/environment

echo 'Finally, time to install and unstow the dotfiles.'
git clone https://github.com/lilithium-hydride/dotfiles ~/.dotfiles
cd ~/.dotfiles/stow
mkdir ~/.secret
touch ~/.secret/.secretsrc
stow -vSt ~ zsh
stow -vSt ~ git
stow -vSt ~ xorg
stow -vSt ~/.config .config

echo "Hopefully, that's close to everything. Sway and/or i3(-gaps), as well as their respective display backends, can be installed separately. Graphics drivers (nvidia-dkms, etc) may also need installing."
