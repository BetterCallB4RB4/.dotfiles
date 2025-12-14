{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # If you want a desktop profile inside WSL (rare), you could add:
    # ../../modules/desktops/personal.nix
  ];

  # Basic system setup
  networking.hostName = "wsl-nixos";
  networking.networkmanager.enable = true;


  # WSL doesn’t use systemd-boot or GRUB
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = false;
  nixpkgs.config.allowUnfree = true;

  # Timezone and locale
  time.timeZone = "UTC";
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Rome";

  programs.zsh.enable    = true;
  users.defaultUserShell = pkgs.zsh;

  # Minimal packages
  environment.systemPackages = with pkgs; [
    # general utils
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

  # Enable SSH for remote management
  services.openssh.enable = true;

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.mononoki
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Mononoki Nerd Font" ];
        sansSerif = [ "Mononoki Nerd Font" ];
        serif = [ "Mononoki Nerd Font" ];
      };
    };
  };
}

