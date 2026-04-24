{ config, pkgs, ... }:

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  home.packages = with pkgs; [
    fastfetch
    starship
    stow
    neovim
    git
    kubectl
    kubernetes-helm
    awscli2
    k9s
    lazygit
    tree
    opencode

  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Augusto Barbadoro";
        email = "augusto.barbadoro244@gmail.com";
      };
    };
    extraConfig = {
      credential.helper = "cache --timeout=28800";
    };
  };

  home.stateVersion = "23.11";
}
