#{ config, pkgs, lib, ... }:
#
#{
#  imports = [
#    ./hardware-configuration.nix
#
#    # If you want a desktop profile inside WSL (rare), you could add:
#    # ../../modules/desktops/personal.nix
#  ];
#
#  # Basic system setup
#  networking.hostName = "wsl-nixos";
#  networking.networkmanager.enable = true;
#
#
#  # WSL doesn’t use systemd-boot or GRUB
#  boot.loader.systemd-boot.enable = false;
#  boot.loader.grub.enable = false;
#  nixpkgs.config.allowUnfree = true;
#
#  # Timezone and locale
#  time.timeZone = "UTC";
#  i18n.defaultLocale = "en_US.UTF-8";
#  
#  programs.zsh.enable    = true;
#  users.defaultUserShell = pkgs.zsh;
#
#  # Minimal packages
#  environment.systemPackages = with pkgs; [
#    # general utils
#    alacritty
#    git
#    xclip
#    jq
#    unzip
#    fzf
#    zsh
#    tmux
#    ripgrep
#    htop
#    bzip2
#    gnupg
#    gnumake
#
#    # go
#    go
#    gotools
#
#    # rust
#    rustc
#    cargo
#
#    # zig
#    zig
#
#    # node
#    nodejs_22
#
#    # C
#    clang-tools
#    cmake
#    cppcheck
#    codespell
#    conan
#    doxygen
#    gtest
#    lcov
#    libgcc
#    vcpkg
#    vcpkg-tool
#    gcc
#
#    # JAVA
#    jdk17
#    groovy
#  ];
#
#  # Enable SSH for remote management
#  services.openssh.enable = true;
#
#  fonts = {
#    enableDefaultPackages = true;
#    packages = with pkgs; [
#      nerd-fonts.mononoki
#    ];
#    fontconfig = {
#      enable = true;
#      defaultFonts = {
#        monospace = [ "Mononoki Nerd Font" ];
#        sansSerif = [ "Mononoki Nerd Font" ];
#        serif = [ "Mononoki Nerd Font" ];
#      };
#    };
#  };
#}

#{ config, lib, pkgs, ... }:
#
#{
#  
#imports = [
#    # include NixOS-WSL modules
#    <nixos-wsl/modules>
#  ];
#
#  wsl = {
#    enable = true;
#
#    # Enable native Docker integration (if you don't use Docker Desktop on Windows)
#    docker-native.enable = true;
#
#    # Path integration
#    # wslConf.interop.appendWindowsPath = true; # Append Windows PATH to NixOS PATH
#    wslConf.automount.root = "/mnt"; # Mount Windows drives to /mnt/c, /mnt/d, etc.
#  };
#
#  # --- Standard NixOS Settings ---
#  networking.hostName = "nixos";
#  
#  # Enable experimental features (necessary for Flakes)
#  nix.settings.experimental-features = [ "nix-command" "flakes" ];
#
#  # Binary Compatibility (Vital for VS Code Remote & other unpatched binaries)
#  # programs.nix-ld.enable = true;
#  
#  programs.zsh.enable    = true;
#  users.defaultUserShell = pkgs.zsh;
#
#  # System Packages
#  environment.systemPackages = with pkgs; [
#    general utils
#    alacritty
#    git
#    xclip
#    jq
#    unzip
#    fzf
#    zsh
#    tmux
#    ripgrep
#    htop
#    bzip2
#    gnupg
#    gnumake
#
#    # go
#    go
#    gotools
#
#    # rust
#    rustc
#    cargo
#
#    # zig
#    zig
#
#    # node
#    nodejs_22
#
#    # C
#    clang-tools
#    cmake
#    cppcheck
#    codespell
#    conan
#    doxygen
#    gtest
#    lcov
#    libgcc
#    vcpkg
#    vcpkg-tool
#    gcc
#
#    # JAVA
#    jdk17
#    groovy
#  ];
#
#
#  # Allow unfree packages (e.g. VS Code, Chrome, Slack)
#  nixpkgs.config.allowUnfree = true;
#
#  # Do not change this value unless you know what you are doing
#}


# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  
  # include NixOS-WSL modules this will require --impure in the nixosrebuild switch command
  imports = [
    <nixos-wsl/modules>
  ];

  wsl = {
    enable = true;

    # Path integration
    # wslConf.interop.appendWindowsPath = true; # Append Windows PATH to NixOS PATH
    wslConf.automount.root = "/mnt"; # Mount Windows drives to /mnt/c, /mnt/d, etc.
  };

  # --- Standard NixOS Settings ---
  networking.hostName = "nixos-wsl";
  
  # Enable experimental features (necessary for Flakes)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  programs.zsh.enable    = true;
  users.defaultUserShell = pkgs.zsh;

  # System Packages
  environment.systemPackages = with pkgs; [
    #general utils
    alacritty
    git
    xclip
    jq
    unzip
    fzf
    zsh
    tmux
    ripgrep
    htop
    bzip2
    gnupg
    gnumake

    # go
    go
    gotools

    # rust
    rustc
    cargo

    # zig
    zig

    # node
    nodejs_22

    # C
    clang-tools
    cmake
    cppcheck
    codespell
    conan
    doxygen
    gtest
    lcov
    libgcc
    vcpkg
    vcpkg-tool
    gcc

    # JAVA
    jdk17
    groovy
  ];

  # Allow unfree packages (e.g. VS Code, Chrome, Slack)
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05"; # Did you read the comment?
}