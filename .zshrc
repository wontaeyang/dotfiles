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

# application alias
alias z='zellij'
alias l='lazygit'
alias v='nvim'

# git alias
alias gp='git pull --rebase'
alias gP='git push'
alias gco='git checkout'

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
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT='%F{red}%2~%f%B$vcs_info_msg_0_%b '
zstyle ':vcs_info:git:*' formats '%F{green}(%b)%f'
zstyle ':vcs_info:*' eable git

# ENV Variables
export GOPATH=$HOME/development/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH=$PATH:/opt/homebrew/bin/zig

# Parsec
alias ssh-parsec='ssh -i ~/.ssh/wontae-ssh wontae@54.89.31.154'
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
