{ config, pkgs, ... }:

{
  users.users.nixos = {
    isNormalUser = true;
    description = "nixos";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager.users.nixos = import ./home.nix;
}

