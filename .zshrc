# git commamands simplified
alias gco='git checkout'

# map Neovim to Vim
alias vim='nvim'

# folder aliases
alias dotfiles='cd ~/development/dotfiles'

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
PROMPT='%F{red}%~%f%B$vcs_info_msg_0_%b '
zstyle ':vcs_info:git:*' formats '%F{green}(%b)%f'
zstyle ':vcs_info:*' eable git

# ENV Variables
export GOPATH=$HOME/development/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
