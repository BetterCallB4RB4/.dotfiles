
---

# Everything, Everywhere, All at Once

*A unified, reproducible setup for managing your development environment across machines with minimal effort and maximum flexibility.*

## Table of Contents
- [Introduction](#introduction)
    - [Everything](#everything)
    - [Everywhere](#everywhere)
    - [All at Once](#all-at-once)
- [Installation prerequisites](#installation-prerequisites)
- [Everything Everywhere All at Once](#Everything Everywhere All at Once)

## Introduction

Keeping a consistent development environment across multiple systems can be daunting. This setup combines **Nix**, **Git**, **Stow**, and **dotfiles** into a **portable, reproducible, and flexible ecosystem**. With this, you can set up your environment on any system in minutes, keeping all your tools and configurations consistent wherever you go.
nix and dot configuration files are kept separate in case you want to just grab the configurations of a specific tool and integrate it into your dev env

this repository contains my Work in progress to be able to make my developer environment declarative so that I can have the same environment on multiple different machines. The idea is to be able to reproduce the same environment between Windows WSL, NixOS and other Linux distributions.<br>

For the moment this configuration has been created and tested only on WSL so the prerequisites and the guide are written documented the process for installing on a WSL Ubuntu<br>



## Everything

### Nix: A Paradigm Shift in Package Management

**Nix** provides a revolutionary approach to managing software environments and configurations. Developed by Eelco Dolstra in the early 2000s as a research project, Nix was born from a need to achieve true **reproducibility** and **isolated environments**. This approach has since solved some of the most persistent issues in software package management:
- **Reproducible Builds**: Ensures environments are identical every time, across systems.
- **Declarative Configuration**: Define *what* you want, and let Nix handle *how* it’s implemented.
- **Multi-Platform Support**: Works on Linux, macOS, and Windows (via WSL).
- **Rollbacks and Atomic Upgrades**: Allows easy rollbacks and safe, atomic updates.

### The Operating System as Your IDE

This setup centers on the idea that the entire **operating system becomes your IDE**. Instead of relying on heavy, all-in-one IDEs, we build a workflow with **Neovim** and **Linux terminal tools** that offers flexibility, speed, and deep understanding of each tool in the environment.
With the OS as your IDE, you tailor an environment that empowers you as a developer, moving beyond the constraints of traditional IDEs.
- **Complete Control**: Customize every component—editing, version control, debugging—to your needs.
- **Understanding Your Tools**: Manual configuration builds familiarity and insight into how each tool works.
- **Efficiency and Speed**: Neovim and terminal tools are fast, responsive, and keyboard-centric.
- **No Context-Switching**: Access every tool in the command line, creating an environment as cohesive as any IDE.

## Everywhere

*“Your environment, accessible from any machine, any OS.”*

In an ideal world, your carefully configured development environment should be available wherever you work, regardless of operating system or hardware. This setup ensures **seamless portability** and **consistent configurations** across platforms.

### Git and Stow: Synchronizing Dotfiles and Configurations

- **Git for Versioned Dotfiles**: Keep your dotfiles (shell configuration, Neovim settings, Tmux setup, etc.) in a Git repository. Push changes from one machine, pull them on another, and enjoy consistent, up-to-date configurations everywhere.
  
- **Stow for Symlink Management**: Stow organizes dotfiles into modular packages using symlinks. This lets you easily manage configurations for different tools without cluttering your home directory. Stow only the configurations you need, creating a clean and conflict-free environment on any system.


### Nix: A Declarative Cross-Platform Foundation

- **cross-platform compatibility**. Nix packages are available on Linux, macOS, and even Windows (via Windows Subsystem for Linux, or WSL). This allows you to build and deploy your environment **uniformly across all platforms**. Whether on a Linux server, macOS laptop, or Windows machine (WSL), Nix guarantees the exact versions of your tools and dependencies, eliminating environment-specific inconsistencies. inoltre garantisce il piu grande repository software attualmente sul mercato
Defining a system declaratively allows you to track the declarative file through a git repository and enjoy all the benefits that git brings with it.

Together, these tools allow for a seamless "Everywhere" experience, letting you bring your setup to life on any machine, in any environment.

## All at Once

*Rapid setup and seamless updates.*

The hallmark of this configuration is the **ease and speed** with which you can bring your entire setup to life on any machine. With only **two or three commands**, you’ll have a fully personalized, functional development environment up and running, complete with tools, editors, shell settings, and workflows.

### The Benefits of “All at Once” Setup

- **Minimal Effort, Maximum Setup**: Typical setups involve hours of configuring and installing. With this setup, clone the repository, run the script, and in minutes, your familiar environment is ready to use.
- **Consistency on Every Machine**: Nix manages packages and dependencies declaratively, guaranteeing identical tool versions and configurations across devices—no more "works on my machine" issues.
- **Zero Guesswork**: There’s no need to memorize commands or configurations. Just clone, run, and go. This approach simplifies new setups and updates, giving you a predictable result every time.

This “All at Once” setup is as easy as running a few commands, empowering you to focus on coding, creating, and building.

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

## Everything Everywhere All at Once

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
cd ~/.dotfiles
stow .
```

open the program tracked in the dotfile and let them load the configuration<br>
if the tmux doesn't load automatically force the configuration reload <special> + I inside a tmux session, neovim should load init.lua automatically


## Nix pkg manager (Personal note)
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


## Nix Usage to install a new program

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

