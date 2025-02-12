
---

# Everything, Everywhere, All at Once

*A unified, reproducible setup for managing your development environment across machines with minimal effort and maximum flexibility.*

## Table of Contents
- [Introduction](#introduction)
    - [Everything](#everything)
    - [Everywhere](#everywhere)
    - [All at Once](#all-at-once)
- [Installation prerequisites](#installation-prerequisites)
- [Configuration](#Configuration)

## Introduction

Keeping a consistent development environment across multiple systems can be daunting. This setup combines **Nix**, **Git**, **Stow**, and **dotfiles** into a **portable, reproducible, and flexible ecosystem**. With this, you can set up your environment on any system in minutes, keeping all your tools and configurations consistent wherever you go.
nix and dot configuration files are kept separate in case you want to just grab the configurations of a specific tool and integrate it into your dev env

## Everything

### Nix: Bigget PKGS repository for a Declarative Approach
Ensures environments are identical every time, across systems.

### The Operating System as Your IDE
This setup centers on the idea that the entire **operating system becomes your IDE**. You tailor an environment that empowers you as a developer, moving beyond the constraints of traditional IDEs. Manual configuration builds familiarity and insight into how each tool works. Access every tool in the command line, creating an environment as cohesive as any IDE.

## Everywhere

### Git and Stow: Synchronizing Dotfiles and Configurations
Keep your dotfiles (shell configuration, Neovim settings, Tmux setup, etc.) in a Git repository. Push changes from one machine, pull them on another, and enjoy consistent, up-to-date configurations everywhere.
  

### Nix: A Declarative Cross-Platform Foundation
Nix packages are available on Linux, macOS, and even Windows (via Windows Subsystem for Linux, or WSL). This allows you to build and deploy your environment **uniformly across all platforms**.
Together, these tools allow for a seamless "Everywhere" experience, letting you bring your setup to life on any machine, in any environment.

## All at Once
The hallmark of this configuration is the **ease and speed** with which you can bring your entire setup to life on any machine. With only **two or three commands**, you’ll have a fully personalized, functional development environment up and running, complete with tools, editors, shell settings, and workflows.

# Installation prerequisites

### WSL

installing a WSL instance ubuntu ```https://learn.microsoft.com/en-us/windows/wsl/install```
install a Linux distru (Ubuntu by default) with
```bash
wsl --install
```

### Recommended
* Install windows terminal (recommended if you use Windows ) for a nice, zen and beautiful terminal experience by using windows terminal in full screen mode<br>

* Install nerd font, choose your favorite type (the configuration was tested with Mononoki nerd font mono) ```https://www.nerdfonts.com/```

* The colorscheme used in the configurations is "tokyo night" so I recommend going to load the same colorscheme also on windows terminal. since it is not default I leave the one I generated below.
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

## Configuration of a non NIXOS distro

Since this configuration is designed to run on multiple systems I thought of using home manager (installed as flake) to manage the system [Home Manager](https://github.com/nix-community/home-manager) and the [Nix package manager](https://nixos.org/nix/).<br> 

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

install home manager from official distribution
```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

select a pkg from the nix repo or search directly from the command line
```bash
https://search.nixos.org/packages
nix search nixpkgs <package-name>
```

clone the repository to get the configuration in your home folder (git have to be already installed)
```bash
cd $HOME
git clone https://github.com/BetterCallB4RB4/.dotfiles.git
```

> **Warning**: if you are running NIXOS copy harware configuration in to the correct directory inside the repository

move to the directory ${HOME}/.dotfiles and build nix configuration 
```bash
cd ${HOME}/.dotfiles/nix
sudo nixos-rebuild switch --flake .#nixos
```

Environment setup for pkgs - REBOOT
```bash
nix-shell -p home-manager --run "home-manager switch --flake ~/.dotfiles/nix#zen-nix --extra-experimental-features 'nix-command flakes' --impure"
```

after home-manager is configured build the system
```bash
home-manager switch --flake ~/.dotfiles/nix#zen-nix --extra-experimental-features "nix-command flakes" --impure
```

setup zsh as default - REBOOT
```
command -v zsh | sudo tee -a /etc/shells
chsh -s $(which zsh)
```

run stow insisde the dotfiles repository
```bash
cd ~/.dotfiles
stow .
```

> **Warning**: if application cannot detect change.... RRREEEEBOOOOOOTTTT 






