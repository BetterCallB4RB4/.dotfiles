{ config, pkgs, ... }:

{
  imports = [
    ../../modules/services/ssh.nix
  ];

  nixpkgs.config.allowUnfree = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # Sostituisci con il tuo disco di boot, es. "/dev/vda" per VM

  networking.hostName = "my-laptop";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Rome";

  # --- CONFIGURAZIONE DESKTOP MINIMALE (X11 + i3) ---
  services.xserver = {
    enable = true;
    
    # Imposta il layout di tastiera italiano (consigliato visto il fuso orario)
    xkb.layout = "it";
    
    # Display Manager leggero (molto meglio di GDM per vecchi PC)
    displayManager.lightdm.enable = true;

    # Window Manager i3
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu      # Il launcher minimale per avviare le app (Win+D di default)
        i3status   # La barra di stato di default per le informazioni di sistema
        i3lock     # Per bloccare lo schermo
        i3blocks   # Un'alternativa più personalizzabile a i3status
      ];
    };
  };

  programs.zsh.enable    = true;
  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    # utils generali
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

    # --- UTILITY AGGIUNTIVE PER I3 E PORTATILI ---
    networkmanagerapplet # Applet di rete (nm-applet) per la tray icon nella barra
    pavucontrol          # Gestione grafica dell'audio (indispensabile)
    brightnessctl        # Controllo della luminosità dello schermo (fondamentale sui laptop)
    feh                  # Visualizzatore d'immagini leggerissimo e gestore sfondi desktop
    dunst                # Demone leggero per gestire le notifiche a comparsa
    scrot                # Tool da riga di comando per fare screenshot
    # ---------------------------------------------

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

  # Configurazione Font
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

  system.stateVersion = "23.11"; 
}
