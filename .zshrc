# zinit zstatus command to run the first time configuration

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e

bindkey -r '^f'
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest
bindkey "^h" backward-char
bindkey "^l" forward-char
bindkey "^b" backward-word
bindkey "^w" forward-word
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias ll='ls -alh --color'
alias vim='nvim'
alias c='clear'
alias k='kubectl'
alias vi='nvim'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias daddy='sudo'
alias python='python3'

# custom alias
alias getSunny='unset AWS_PROFILE && unset KUBECONFIG'
alias winShare='/home/jd4augbarbad/scripts/windowsShare.sh'
if [ -f "$HOME/.aws_alias" ]; then
    source "$HOME/.aws_alias"
fi


#AWS WORK
alias aws-login='export AWS_PROFILE=shared-agile-int && echo "DEFAULT LOGIN IN AGILE SHARED ACCOUNT" && aws sso login'
alias updateAWSconfig="${HOME}/scripts/updateAWSconfig.sh" 
alias genKube="source ${HOME}/scripts/generateKubeconfig.sh ${AWS_PROFILE}"


# custom variable
export HTTP_PROXY="http://ipv4.212.7.64.11.hybrid-web.global.blackspider.com:8006"
export HTTPS_PROXY="http://ipv4.212.7.64.11.hybrid-web.global.blackspider.com:8006"
export NO_PROXY="127.0.0.1, localhost, .crifnet.com"

#remove windows path from the bin path variable
export PATH="/home/jd4augbarbad/.asdf/shims:/home/jd4augbarbad/.asdf/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib"


# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
   zdharma-continuum/zinit-annex-as-monitor \
   zdharma-continuum/zinit-annex-bin-gem-node \
   zdharma-continuum/zinit-annex-patch-dl \
   zdharma-continuum/zinit-annex-rust

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

#load starship prompt
eval "$(starship init zsh)"

# must be last configuration
. "$HOME/.asdf/asdf.sh"
