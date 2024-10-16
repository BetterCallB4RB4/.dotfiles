# My Nix Configuration

Welcome to my Nix configuration repository! This repository contains my personal Nix configurations, managed using [Home Manager](https://github.com/nix-community/home-manager) and the [Nix package manager](https://nixos.org/nix/).

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Customization](#customization)
- [Usage](#usage)


## Overview

This repository serves as a comprehensive setup for managing my development environment and personal configurations using Nix. The configurations are declarative and can be easily reproduced across different systems.

## Installation

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

load home manager configuration (impure to let nix access env var)
```bash
home-manager switch --flake ~/dotfiles2/nix#zen-nix --impure
```

## Customization

test 1 command setup
```bash
nix shell nixpkgs#home-manager --command sh -c "home-manager switch --flake ~/dotfiles2/nix#zen-nix --extra-experimental-features 'nix-command flakes' --impure"
```

## Usage

update the home.nix for user space pkgs from the nix repository or add flake to the flake.nix to add a complete module<br>
run this command to let home-manager rebuild the configuration
```bash
home-manager switch --flake ~/dotfiles2/nix#zen-nix --extra-experimental-features "nix-command flakes" --impure
```

for practical use you can alias this command in out shellrc
```bash
alias nix-build="home-manager switch --flake ~/dotfiles2/nix#zen-nix --extra-experimental-features 'nix-command flakes' --impure"
```
