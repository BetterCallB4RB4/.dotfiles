{ config, pkgs, ... }:

{
  users.users.augusto = {
    isNormalUser = true;
    description = "augusto";
    extraGroups = [ "wheel" "networkmanager" ]; 
  };

  home-manager.users.augusto = import ./home.nix;
}

