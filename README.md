
# Everything, Everywhere, All at Once

*A unified, reproducible setup for managing your development environment across machines with minimal effort and maximum flexibility.*

---
### Table of Contents
- [Introduction](#introduction)
    - [Everything](#everything)
    - [Everywhere](#everywhere)
    - [All at Once](#all-at-once)
- [Installation prerequisites](#installation-prerequisites)
- [Configuration](#Configuration)
---

### Introduction
Keeping a consistent development environment across multiple systems can be daunting. This setup combines **Nix**, **Git**, **Stow**, and **dotfiles** into a portable, reproducible, and flexible ecosystem. With this, you can set up your environment on any system in minutes, keeping all your tools and configurations consistent wherever you go.
nix and dot configuration files are kept separate in case you want to just grab the configurations of a specific tool and integrate it into your dev env.
This configuration is meant to define user space only, any system level configuration can only be interpreted by a NixOS system or musto be done by hand.

# Everything
- Nix: PKGS repository for a Declarative Approach, ensures environments are identical every time, across systems.
- The Operating System as Your IDE: This setup centers on the idea that the entire **operating system becomes your IDE**. You tailor an environment that suits you as a developer. Manual configuration builds familiarity and insight into how each tool works.

# Everywhere
- Git and Stow: Synchronizing configurations It's never been so easy, keep your dotfiles (shell configuration, Neovim settings, Tmux setup, etc.) in a Git repository. Push changes from one machine, pull them on another, and enjoy consistent, up-to-date configurations everywhere.  

# All at Once
- "(_Almost_) ONE" command setup: The hallmark of this configuration is the **ease and speed** with which you can bring your entire setup to life on any machine. With only a few command, you’ll have a fully personalized, functional development environment up and running, complete with tools, editors, shell settings, and workflows.

---

# Installation prerequisites
## NON declarative system

### Windows(WSL)
installing a WSL instance ubuntu ```https://learn.microsoft.com/en-us/windows/wsl/install```
install a Linux distro (preferably a debian based distro) with
```bash
wsl --list --online
wsl --install <Distro name>
```
Now that you are running a Debian Base distro, continue reading the installation prerequisites

### Debian Base distro
- Install nerd font, choose your favorite type (I use Mononoki nerd font mono) ```https://www.nerdfonts.com/```
- Install a terminal emulator using this "tokyo night" color scheme. since it is not default I leave the one I generated below.
<details>
    <summary>Show the color scheme</summary>
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
    }
    ```
</details>

### Install Nix pkgs manager
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
now we have a nix package manager configuration installed. continue reading the installation prerequisites for the HOME-MANAGER

## NixOs **TODO**
> **Warning**: if you are running NixOS (An OS build on top of the Nix pkg manager) you have an to put a harware configuration in to the correct directory inside the repository.
Move to the directory ${HOME}/.dotfiles and build a nix configuration 
```bash
cd ${HOME}/.dotfiles/nix
sudo nixos-rebuild switch --flake .#nixos
```
Install home manager from official distribution
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
after home-manager is configured build the user space by calling home-manager directly
```bash
home-manager switch --flake ~/.dotfiles/nix#zen-nix --extra-experimental-features "nix-command flakes" --impure
```
you can call the home manager via nix flake 
```bash
nix-shell -p home-manager --run "home-manager switch --flake ~/.dotfiles/nix#zen-nix --extra-experimental-features 'nix-command flakes' --impure"
```

# Configure the system
Now that we have made sure that all the packages are installed correctly, let's get our configurations and send them to the correct programs.
clone the repository to get the configuration in your home folder (git have to be already installed)
```bash
cd $HOME
git clone ssh://github.com/BetterCallB4RB4/.dotfiles.git
```
setup zsh as default - REBOOT
```
command -v zsh | sudo tee -a /etc/shells
chsh -s $(which zsh)
```
run stow insisde the dotfiles repository and expand the configuration on the system
```bash
cd ~/.dotfiles
stow .
```
> **Warning**: if application cannot detect change.... RRREEEEBOOOOOOTTTT 







