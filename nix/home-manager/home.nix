{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  # run home-manager with --impure to allow home manager to read USER and HOME
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  # search your pkgs here 
  # https://search.nixos.org/packages
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    
    #tool
    pkgs.neofetch
    pkgs.starship
    pkgs.stow
    pkgs.neovim
    pkgs.zsh
    pkgs.tmux
    pkgs.git
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.awscli2
    pkgs.fzf
    pkgs.k9s
    pkgs.tmux
    pkgs.unzip
    pkgs.ripgrep
    pkgs.lazygit
    pkgs.terraform
    pkgs.tree
    pkgs.dig
    pkgs.arduino-cli
    pkgs.usbutils
    pkgs.lazydocker
    pkgs.jq
    pkgs.sqlite
    pkgs.nmap
    pkgs.htop
    pkgs.unar
    pkgs.qemu
    pkgs.terragrunt
    pkgs.bzip2
    pkgs.gnupg
    pkgs.gnumake

    #go
    pkgs.go
    pkgs.gotools

    #rust
    pkgs.rustc
    pkgs.cargo

    #zig
    pkgs.zig

    #node
    pkgs.nodejs_22

    #C
    pkgs.clang-tools
    pkgs.cmake
    pkgs.cppcheck
    pkgs.codespell
    pkgs.conan
    pkgs.doxygen
    pkgs.gtest
    pkgs.lcov
    pkgs.libgcc
    #pkgs.vcpkg
    pkgs.vcpkg-tool
    pkgs.gcc

    #JAVA
    pkgs.jdk17
    pkgs.groovy
  ];

  # home.sessionVariables = {
  #   
  # };

  # home.file = {
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
