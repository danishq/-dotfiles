# ───────────── History ─────────────
HISTFILE=~/.zsh_history
HISTSIZE=200000
SAVEHIST=200000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS

# ───────────── PATH ────────────────
export PATH="$HOME/.local/bin:$PATH"
#export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$JAVA_HOME/bin:$PATH

export JAVA_HOME=/usr/lib/jvm/jdk-17.0.12-oracle-x64
export PATH=$JAVA_HOME/bin:$PATH

# ───────────── Completion ──────────
autoload -Uz compinit
compinit -d ~/.zcompdump-$HOST
#
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select
## plugins
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ───────────── Prompt ──────────────
eval "$(oh-my-posh init zsh --config ~/Documents/-dotfiles/oh-my-posh/oh-my-posh-theme/night-owl.omp.json)"

# ───────────── Navigation ──────────
eval "$(zoxide init zsh)"

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# ───────────── Vim Mode ────────────
bindkey -v

# show mode indicator (INSERT / NORMAL)
#function zle-keymap-select {
#  if [[ $KEYMAP == vicmd ]]; then
#    RPS1="-N-"
#  else
#    RPS1="-I-"
#  fi
#  zle reset-prompt
#}
#zle -N zle-keymap-select
#
#function zle-line-init {
#  zle-keymap-select
#}
#zle -N zle-line-init

# faster escape
#bindkey -M viins 'jk' vi-cmd-mode

# ───────────── History search ──────
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ───────────── Aliases ─────────────
alias cl='clear'
alias ll='ls -l'
alias reload='source ~/.zshrc'
alias zshconfig='nvim ~/.zshrc'
alias gitlog='git log --oneline'
alias gits='git status'
alias servenow='python3 -m http.server 8000'
alias cal='ncal -b'

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/dqure/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/dqure/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/dqure/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/dqure/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<


# opencode
export PATH=/home/danish/.opencode/bin:$PATH
