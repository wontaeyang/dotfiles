# git commamands simplified

# map Neovim to Vim
alias vim='nvim'
export EDITOR="nvim"
export VISUAL="nvim"

# folder aliases
alias dotfiles='cd ~/development/dotfiles'
alias kessel='cd ~/development/parsec/kessel'
alias infra='cd ~/development/parsec/infra'
alias hpr='cd ~/development/parsec/go-hpr-service'
alias mpi='ssh wontaeyang@montypi'

# application alias
alias z='zellij'
alias l='lazygit'
alias v='nvim'

# git alias
alias gp='git pull --rebase'
alias gP='git push'
alias gco='git checkout'
alias gm='git merge'

alias ls='ls -Gal'

# up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# grep with color
alias grep='grep --color=auto'

# refresh shell
alias reload='source ~/.zshrc'

# Custom prompt
setopt prompt_subst
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:*' eable git
zstyle ':vcs_info:git:*' formats '%F{green}(%b)%f'
PROMPT='%F{red}%2~%f$vcs_info_msg_0_ '

# ENV Variables
export GOPATH=$HOME/development/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH=$PATH:/opt/homebrew/bin/zig

# Parsec
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export CGO_CPPFLAGS="-Wno-error -Wno-nullability-completeness -Wno-expansion-to-defined -Wno-builtin-requires-header"

# Bind CTRL-Z to foreground command
fg_command() {
  fg
}
zle -N fg_command
bindkey '^Z' fg_command

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
