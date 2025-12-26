{ config, pkgs, ... }:

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  home.packages = with pkgs; [
    neofetch
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

  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Augusto Barbadoro";
        email = "augusto.barbadoro244@gmail.com";
      };
    };
  };

  home.stateVersion = "23.11";
}