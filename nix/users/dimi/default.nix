{ config, pkgs, ... }:

{
  users.users.dimi = {
    isNormalUser = true;
    description = "dimi";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager.users.dimi = import ./home.nix;
}

