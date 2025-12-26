{
  description = "A modular NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      mkSystem = { system, machine, username, desktop }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs username desktop; };
          modules = [
            machine
            (import "${toString machine}/hardware-configuration.nix")
            home-manager.nixosModules.home-manager
            (import (./users + "/${username}"))
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }
            (
              if desktop != null
              then ./modules/desktops + "/${desktop}.nix"
              else {}
            )
          ];
        };

      mkHome = { username, desktop }:
       home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs username desktop; };
          modules = [
            (import (./users + "/${username}" + "/home.nix"))
            (
              if desktop != null
              then ./modules/desktops + "/${desktop}.nix"
              else {}
            )
          ];
        };
    in
    {
      nixosConfigurations = {
        "seashell" = mkSystem {
          system = "x86_64-linux";
          machine = ./machines/seashell;
          username = "augusto";
          desktop = "personal";
        };
        "hp-laptop" = mkSystem {
          system = "x86_64-linux";
          machine = ./machines/hp-laptop;
          username = "dimi";
          desktop = "hp-laptop";
        };
      };

      homeConfigurations = {
        "augusto" = mkHome {
          username = "augusto";
          desktop = "personal"; # Or "personal"
        };
      };
    };
}
