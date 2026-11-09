# Everything, Everywhere, All at Once

*A portable, reproducible development environment built with **Git + GNU Stow + mise** — no Nix required.*

---

## Table of Contents

- [Introduction](#introduction)
- [What's in the box](#whats-in-the-box)
- [Prerequisites](#prerequisites)
    - [Windows (WSL)](#windows-wsl)
    - [Debian-based distro](#debian-based-distro)
    - [Nerd Font](#nerd-font)
    - [Terminal colours](#terminal-colours)
- [First-time setup](#first-time-setup)
    - [1. Configure Git](#1-configure-git)
    - [2. Create an SSH key for GitHub](#2-create-an-ssh-key-for-github)
    - [3. Clone the repository](#3-clone-the-repository)
    - [4. Install system packages](#4-install-system-packages)
    - [5. Install mise](#5-install-mise)
    - [6. Stow the dotfiles](#6-stow-the-dotfiles)
    - [7. Install the tools](#7-install-the-tools)
    - [8. Make zsh your default shell](#8-make-zsh-your-default-shell)
- [Post-install steps](#post-install-steps)
    - [Neovim](#neovim)
    - [tmux](#tmux)
    - [herdr](#herdr)
    - [Clipboard on WSL](#clipboard-on-wsl)
- [Repository layout](#repository-layout)
- [Daily usage](#daily-usage)
- [Troubleshooting](#troubleshooting)
- [Appendix: Rose Pine palette](#appendix-rose-pine-palette)
- [License](#license)

---

## Introduction

Keeping a consistent development environment across machines is tedious. This
repository keeps **every configuration file in Git** and uses two small tools to
put it all back together:

- **GNU Stow** symlinks the dotfiles from this repository into your `$HOME`.
- **mise** installs and pins every CLI tool, language runtime and editor listed in
  [`.config/mise/config.toml`](.config/mise/config.toml).

There is no declarative operating system and no package-manager daemon. The
system packages are installed with the distro package manager, everything in
user space is installed and versioned by mise, and the configurations are
symlinked by Stow. That makes the setup easy to inspect, easy to change, and
easy to reproduce on any Debian-based machine.

The configuration only covers **user space**. Anything at system level (kernel,
drivers, display manager, …) must be configured by hand.

---

## What's in the box

| Layer | Tool | Purpose |
| --- | --- | --- |
| Package manager | **mise** | Installs and pins runtimes and CLI tools from `.config/mise/config.toml` |
| Dotfile manager | **GNU Stow** | Symlinks `~/.zshrc` and `~/.config/*` from this repo |
| Shell | **zsh** + [zinit](https://github.com/zdharma-continuum/zinit) | Plugins, completions, history, keybindings |
| Prompt | **starship** | Git, AWS, Azure and Kubernetes indicators |
| Navigation | **fzf** + **zoxide** | Fuzzy finding and smart `cd` |
| Editor | **Neovim** + [lazy.nvim](https://github.com/folke/lazy.nvim) | LSP, Treesitter, Telescope, DAP, Git, Copilot |
| LSP tooling | **Mason** | `lua_ls`, `gopls`, `terraformls`, `groovyls` |
| Multiplexer | **tmux** + [TPM](https://github.com/tmux-plugins/tpm) | Sessions, panes, plugin management |
| Terminal workspace | **herdr** | Tabs, panes and agent navigation with `herdr-nvim-nav` |
| Containers | **podman** | Rootless container runtime (`docker` is aliased to it) |
| Terminals | **Alacritty**, **Ghostty** | Pre-configured fonts, padding and colours |

The tools installed by mise include:

- **Languages / runtimes** — Python, Node 22, Go, Java (temurin-17), Rust, Zig, Groovy, uv
- **Infrastructure** — Terraform, OpenTofu, Terragrunt, AWS CLI, Azure CLI, Checkov
- **Kubernetes / containers** — kubectl, Helm, k9s, kubelogin, podman
- **Editor / terminal** — Neovim, tmux, starship, zoxide, fzf, ripgrep, jq, yazi, gh
- **Build** — cmake, conan, goreleaser, lazygit
- **AI / dev** — opencode, herdr

---

## Prerequisites

### Windows (WSL)

If you are on Windows, run everything below inside a WSL distribution.

```bash
wsl --list --online
wsl --install <DistroName>
```

Once the distro is running, continue with the Debian-based instructions.

### Debian-based distro

You need an Ubuntu/Debian (or derivative) machine with `git` and `curl`
available. The rest is installed in [First-time setup](#first-time-setup).

### Nerd Font

Both terminal configurations expect a Nerd Font:

- **Alacritty** → `mononoki Nerd Font Mono`
- **Ghostty** → `JetBrainsMono Nerd Font Mono`

Download one from <https://www.nerdfonts.com/> and install it on the host OS.
If you use another font, change it in
[`.config/alacritty/alacritty.toml`](.config/alacritty/alacritty.toml) or
[`.config/ghostty/config.ghostty`](.config/ghostty/config.ghostty).

### Terminal colours

The terminal uses the **Rosé Pine** palette. The JSON for Windows Terminal is in
the [appendix](#appendix-rose-pine-palette). Alacritty and Ghostty are already
configured in this repository.

---

## First-time setup

> Run the commands in order. After step 8 you must restart your shell (or log
> out and back in) before everything is active.

### 1. Configure Git

```bash
git config --global user.name "Augusto Barbadoro"
git config --global user.email "augusto.barbadoro244@gmail.com"
```

### 2. Create an SSH key for GitHub

```bash
ssh-keygen -t ed25519 -C "augusto.barbadoro244@gmail.com"
```

Copy the public key and add it to GitHub under
**Settings → SSH and GPG keys → New SSH key**:

```bash
cat ~/.ssh/id_ed25519.pub
```

Verify it works:

```bash
ssh -T git@github.com
```

### 3. Clone the repository

```bash
git clone git@github.com:BetterCallB4RB4/.dotfiles.git
cd .dotfiles
```

### 4. Install system packages

```bash
sudo apt update
sudo apt install -y stow build-essential podman zsh unzip curl
```

| Package | Why |
| --- | --- |
| `stow` | Symlink the dotfiles |
| `build-essential` | Compilers needed by some mise tools |
| `podman` | Container runtime |
| `zsh` | Default shell |
| `unzip`, `curl` | Helpers for installer scripts |

### 5. Install mise

```bash
curl https://mise.run | sh
```

The installer places the `mise` binary in `~/.local/bin`. Make sure that
directory is on your `PATH` for the current shell:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

### 6. Stow the dotfiles

From the repository root:

```bash
stow .
```

This creates symlinks for `~/.zshrc` and every entry under `~/.config`.
The files listed in [`.stow-local-ignore`](.stow-local-ignore) (README, LICENSE,
this repo's Git data, …) are skipped.

If you want to preview what will happen first:

```bash
stow -n -v .
```

### 7. Install the tools

```bash
mise install
```

mise reads [`.config/mise/config.toml`](.config/mise/config.toml) and installs
every tool at the pinned version. This can take several minutes.

> A new shell is needed for `mise` to activate. Until then, call it by its full
> path (`~/.local/bin/mise install`) if the command is not found.

### 8. Make zsh your default shell

```bash
command -v zsh | sudo tee -a /etc/shells
chsh -s "$(which zsh)"
```

Log out and back in (or reboot) so the new shell and the mise activation are
loaded. On success, `echo $SHELL` prints `/usr/bin/zsh`.

---

## Post-install steps

### Neovim

On the first launch, `lazy.nvim` bootstraps itself and installs all plugins
automatically:

```bash
nvim
```

Wait for the plugin installation to finish, then quit with `:qa`. Mason installs
the default language servers the first time a matching file is opened, or
manually with:

```vim
:Mason
```

### tmux

Start tmux and install the plugins managed by TPM. The prefix is
<kbd>Ctrl</kbd>+<kbd>Space</kbd> (not `Ctrl-b`):

```bash
tmux
```

Inside tmux press <kbd>Ctrl</kbd>+<kbd>Space</kbd> then <kbd>I</kbd> to fetch
the plugins.

### herdr

Install the Neovim navigation plugin so <kbd>Ctrl</kbd>+<kbd>h/j/k/l</kbd> move
between herdr panes and Neovim splits:

```bash
herdr plugin install aimdevlee/herdr-nvim-nav
```

### Clipboard on WSL

Neovim and tmux need a bridge to the Windows clipboard. Install `win32yank`:

```bash
curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
```

Verify with `win32yank.exe -o` or by yanking text in Neovim.

---

## Repository layout

```
.dotfiles/
├── .config/
│   ├── alacritty/         # Alacritty terminal
│   ├── ghostty/           # Ghostty terminal
│   ├── herdr/             # herdr keybindings and theme
│   ├── k9s/               # Kubernetes TUI config
│   ├── mise/
│   │   └── config.toml    # ← every tool installed by mise
│   ├── nvim/              # Neovim (lazy.nvim, lua/plugins/*)
│   ├── opencode/          # opencode theme / CLI config
│   ├── sway/              # Sway window manager
│   ├── tmux/              # tmux config + session scripts
│   ├── waybar/            # Waybar
│   ├── wofi/              # Wofi launcher
│   └── starship.toml      # Prompt
├── .zshrc                 # Shell: zinit, aliases, mise activation
├── .stow-local-ignore     # Files Stow must not link
├── initMachine.txt        # Original setup notes
├── LICENSE.md
└── README.md
```

The `tmux/plugins/` directory and Neovim's `lazy-lock.json` are intentionally
ignored — they are generated locally by TPM and lazy.nvim.

---

## Daily usage

### Add or change a configuration

Put the file in the repository in the same path it should have in `$HOME`, then
re-run Stow:

```bash
cd ~/.dotfiles
stow .
```

Stow is idempotent, so running it again is safe. To remove all symlinks:

```bash
stow -D .
```

### Add a tool

```bash
mise use <tool>@<version>   # adds it to .config/mise/config.toml and installs it
mise install                 # install anything missing from the manifest
```

Commit the updated `.config/mise/config.toml` so other machines get the same
tool.

### Update tools

```bash
mise upgrade      # upgrade installed tools within their constraints
mise outdated     # list tools with newer versions
```

### Check the environment

```bash
mise ls           # installed tools
mise doctor       # diagnose mise problems
stow -n -v .      # dry-run the current Stow operation
```

---

## Troubleshooting

### `stow` reports a conflict

Stow refuses to overwrite existing files. Either remove the conflicting file or
adopt it into the repository:

```bash
stow -n -v .          # show the conflict
stow --adopt .        # move the existing file into the repo (review the diff!)
git diff              # make sure the adopted content is what you want
```

### `mise: command not found`

`~/.local/bin` is not on `PATH` yet. Open a new shell, or run:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

### A tool installed by mise is not found

mise only exposes tools in shells where it is activated. A new shell is needed
after `mise install`. Check the shell integration with:

```bash
mise doctor
```

### `chsh` did not change the shell

The change takes effect on the next login. Log out completely or reboot.
Confirm the shell is registered:

```bash
cat /etc/shells
echo "$SHELL"
```

### Clipboard does not work in Neovim (WSL)

Install `win32yank` as described in [Clipboard on WSL](#clipboard-on-wsl), then
restart Neovim.

### Keybindings look wrong in Windows Terminal

The `.zshrc` includes a workaround for the <kbd>Delete</kbd> key under WSL. If
keys still misbehave, make sure Windows Terminal uses the Rosé Pine palette below
and passes through the keys.

---

## Appendix: Rose Pine palette

Paste this into Windows Terminal's `settings.json` under `schemes`:

<details>
<summary>Show the Rosé Pine colour scheme</summary>

```json
{
  "name": "Rosé Pine",
  "background": "#191724",
  "foreground": "#e0def4",
  "selectionBackground": "#403d52",
  "cursorColor": "#524f67",
  "black": "#26233a",
  "red": "#eb6f92",
  "green": "#31748f",
  "yellow": "#f6c177",
  "blue": "#9ccfd8",
  "purple": "#c4a7e7",
  "cyan": "#ebbcba",
  "white": "#e0def4",
  "brightBlack": "#6e6a86",
  "brightRed": "#eb6f92",
  "brightGreen": "#31748f",
  "brightYellow": "#f6c177",
  "brightBlue": "#9ccfd8",
  "brightPurple": "#c4a7e7",
  "brightCyan": "#ebbcba",
  "brightWhite": "#e0def4"
}
```

</details>

---

## License

MIT — see [LICENSE.md](LICENSE.md). © 2024 Augusto Barbadoro
