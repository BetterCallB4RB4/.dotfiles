# A development environment to look like you know IT

- [Introduction](#introduction)
- [Installation prerequisites](#installation-prerequisites)
- [Customization](#customization)
- [Usage](#usage)

# Introduction

this repository contains my Work in progress to be able to make my developer environment declarative so that I can have the same environment on multiple different machines. The idea is to be able to reproduce the same environment between Windows WSL, NixOS and other Linux distributions.<br>

The idea is to manage through Nix as a package manager so that I can have home managers on multiple systems by relying on nix pkg manager.
I want to manage the management of packages and development tools with modules that can be managed by home manager.
I want to track the configuration files separately and manage them through stow.<br>

The idea is that if I were to have a system where I can't install nix I can still bring my configuration files with me and have my configurations available with a little manual work<br>

For the moment this configuration has been created and tested only on WSL so the prerequisites and the guide are written documented the process for installing on a WSL Ubuntu<br>

# Installation prerequisites

### WSL

installing a WSL instance ubuntu ```https://learn.microsoft.com/en-us/windows/wsl/install```
install a Linux distru (Ubuntu by default) with
```bash
wsl --install
```

### Recommended
Install windows terminal (recommended if you use Windows ) for a nice, zen and beautiful terminal experience by using windows terminal in full screen mode<br>

Install nerd font, choose your favorite type (the configuration was tested with Mononoki nerd font mono) ```https://www.nerdfonts.com/```

The colorscheme used in the configurations is "tokyo night" so I recommend going to load the same colorscheme also on windows terminal.
since it is not default I leave the one I generated below.
### Windows Terminal ColorSkin Tokyo Night
```json
{
    "background": "#1A1B26",
    "black": "#15161E",
    "blue": "#7AA2F7",
    "brightBlack": "#414868",
    "brightBlue": "#7AA2F7",
    "brightCyan": "#7DCFFF",
    "brightGreen": "#9ECE6A",
    "brightPurple": "#BB9AF7",
    "brightRed": "#F7768E",
    "brightWhite": "#C0CAF5",
    "brightYellow": "#E0AF68",
    "cursorColor": "#FFFFFF",
    "cyan": "#7DCFFF",
    "foreground": "#C0CAF5",
    "green": "#9ECE6A",
    "name": "Tokyo Night",
    "purple": "#BB9AF7",
    "red": "#F7768E",
    "selectionBackground": "#FFFFFF",
    "white": "#A9B1D6",
    "yellow": "#E0AF68"
},
```

Add the font and coloscheme to the windows terminal configuration by editing the Settings.json file
```%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json```

### Nix pkg manager
Nix is a powerful, purely functional package manager that allows users to build and manage software in a reproducible and declarative way. Unlike traditional package managers, Nix builds packages in isolated environments, ensuring that builds are deterministic and don't interfere with each other. This is achieved through its unique approach of using hash-based paths, making package dependencies explicit and avoiding version conflicts. Nix stores everything in a central store, allowing for atomic upgrades, rollbacks, and parallel installations. It was created by Eelco Dolstra during his PhD research to address the challenges of software deployment and reproducibility. Nix is used across various operating systems, making it highly versatile and portable, and its robust ecosystem includes Nixpkgs, a collection of thousands of packages that can be easily managed. With its declarative model, Nix simplifies the complexity of software management, allowing for reliable, user-friendly, and reproducible environments.<br>

Since this configuration is designed to run on multiple systems I thought of using home manager (installed as flake) to manage the system [Home Manager](https://github.com/nix-community/home-manager) and the [Nix package manager](https://nixos.org/nix/).<br> 

Below I also insert the process of the first configuration of nix for personal memory (I'm still studying nix and how to use it at its best) <br>

Welcome to my Nix configuration repository! This repository contains my personal Nix configurations, 
This repository serves as a comprehensive setup for managing my development environment and personal configurations using Nix. The configurations are declarative and can be easily reproduced across different systems.
for the moment this flow has only been tested on a single WSL instance, for this reason the terminal configuration must be managed separately<br>

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
if the tmux doesn't load automatically force the configuration reload <special> + I inside a tmux session, neovim should load init.lua automatically

## Installation of nix

To install Nix and set up this configuration, follow these steps:


## Nix Usage to install a new programm

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
