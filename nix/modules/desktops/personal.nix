{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    git 
    wget
    sway
    swaylock
    swayidle
    waybar
    alacritty
    grim
    slurp
    wl-clipboard
  ];

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  environment.variables = {
    XDG_CURRENT_DESKTOP = "sway";
    XDG_SESSION_TYPE = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}

