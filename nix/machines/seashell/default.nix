{ config, pkgs, ... }:

{
  imports = [
    ../../modules/services/ssh.nix
  ];


  nixpkgs.config.allowUnfree = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # Replace with your boot disk, e.g., "/dev/vda" for VMs

  networking.hostName = "my-laptop";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Rome";

  # services.xserver.enable = true;
  # services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;

  programs.zsh.enable    = true;
  users.defaultUserShell = pkgs.zsh;

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

   # Font configuration
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


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
