# dotfiles

install git 
install stow 
clone this repo in your home directory
run command "stow ."


https://nixos.org/download/
https://github.com/DeterminateSystems/nix-installer
https://nix-community.github.io/home-manager/index.xhtml#ch-introduction
https://search.nixos.org/packages?channel=24.05&show=tmux&from=0&size=50&sort=relevance&type=packages&query=tmux
https://nixos.wiki/wiki/Flakes
https://www.youtube.com/watch?v=hLxyENmWZSQ&t=16s

sh <(curl -L https://nixos.org/nix/install) --no-daemon
export NIXPKGS_ALLOW_UNFREE=1
nix shell nixpkgs#home-manager --extra-experimental-features "nix-command flakes" --impure
home-manager switch --flake .#dimi --extra-experimental-features "nix-command flakes" --impure

installing nix ( https://nixos.org/download/ )
```bash
  sh <(curl -L https://nixos.org/nix/install) --daemon
```

check nix installation
```bash
  nix-shell -p neofetch --run neofetch
```

enabling nix-command and flakes 
```bash
  echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
  sudo systemctl restart nix-daemon.service
```

you can enable nix-command and flakes on a per command bases with 
```bash
  --extra-experimental-features "nix-command flakes"
```

load home manager configuration
```bash
  home-manager switch --flake ~/dotfiles2/nix#zen-nix
```
