# Lilith's Dotfiles

**Obligatory \*nix user dotfiles repository.**

![i3 Preview Image](preview_i3.png)
*Very old screenshot, needs updating*


## Installation
Meant for my own personal use. Feel free to take whatever from here, but don't expect much.

### Simple Clone & Unstow
```sh
git clone https://github.com/lilithium-hydride/dotfiles ~/.dotfiles
cd stow
mkdir ~/.secret; touch ~/.secret/.secretsrc; stow -vSt ~ zsh
stow -vSt ~ git
stow -vSt ~ xorg
stow -vSt ~/.config .config
```

### Scary Installer Script
*Don't do this. It doesn't work and is just here for reference at this point.*
```sh
git clone https://github.com/lilithium-hydride/dotfiles ~/.dotfiles
chmod +x ~/.dotfiles/install.sh
~/.dotfiles/install.sh
```
