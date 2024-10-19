# My Nix Configuration

Welcome to my Nix configuration repository! This repository contains my personal Nix configurations, managed using [Home Manager](https://github.com/nix-community/home-manager) and the [Nix package manager](https://nixos.org/nix/).

## Table of Contents

- [Overview](#overview)
- [Customization](#customization)
- [Installation of nix](#installation)
- [Usage](#usage)

## Overview

This repository serves as a comprehensive setup for managing my development environment and personal configurations using Nix. The configurations are declarative and can be easily reproduced across different systems.
for the moment this flow has only been tested on a single WSL instance

## Customization

installing nix ( https://nixos.org/download/ )
```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

clone the repository to get the configuration in your home folder (git have to be already installed)
```bash
git clone https://github.com/BetterCallB4RB4/.dotfiles.git
```

Environment setup for pkgs - REBOOT
```bash
nix-shell -p home-manager --run "home-manager switch --flake ~/.dotfiles/nix#zen-nix --extra-experimental-features 'nix-command flakes' --impure"
```

setup zsh as default - REBOOT
```
command -v zsh | sudo tee -a /etc/shells
chsh -s $(which zsh)
```

run stow insisde the dotfiles repository
```bash
stow .
```

open the program tracked in the dotfile and let them load the configuration<br>
if the tmux doesn't load automatically force the configuration reload
```bash
ctr-space + I
```

## Installation of nix

To install Nix and set up this configuration, follow these steps:

installing nix ( https://nixos.org/download/ )
```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

check nix installation
```bash
nix-shell -p neofetch --run neofetch
```

enabling nix-command and flakes 
```bash
echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf
sudo systemctl restart nix-daemon.service
cat /etc/nix/nix.conf
```

you can enable nix-command and flakes on a per command bases with 
```bash
--extra-experimental-features "nix-command flakes"
```

install home manager from official distribution
```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

## Usage

select a pkg from the nix repo or search directly from the command line
```bash
https://search.nixos.org/packages
nix search nixpkgs <package-name>
```

update the home.nix for user space pkgs from the nix repository or add flake to the flake.nix to add a complete module<br>
run this command to let home-manager rebuild the configuration
```bash
home-manager switch --flake ~/.dotfiles/nix#zen-nix --extra-experimental-features "nix-command flakes" --impure
```

for practical use you can alias this command in out shellrc
```bash
alias nix-build="home-manager switch --flake ~/.dotfiles/nix#zen-nix --extra-experimental-features 'nix-command flakes' --impure"
```
