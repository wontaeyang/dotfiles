# eval "$(rbenv init -)"

##################
### MY ALIASES ###
##################

# git commamands simplified
alias gst='git status'
alias gco='git checkout'
alias gci='git commit'
alias grb='git rebase'
alias gbr='git branch'
alias gad='git add -A'
alias gpl='git pull'
alias gpu='git push'
alias gpr='git pull --rebase'

# map Neovim to Vim
alias vim='nvim'

# rails alias
alias rc='rails console'
alias rc_prod='heroku run rails console -a vhx-crystal'

# VHX alias
alias crystal='cd ~/development/vhx/crystal'

# Veritas alias
alias veritas='cd ~/development/entitled/veritas'
alias veritas_console='veritas && docker-compose run --rm elixir iex -S mix'
alias veritas_test='veritas && docker-compose run --rm -e "MIX_ENV=test" elixir mix test'
alias veritas_migrate_test='veritas && docker-compose run --rm -e "MIX_ENV=test" elixir mix ecto.migrate'
alias veritas_migrate_dev='veritas && docker-compose run --rm elixir mix ecto.migrate'
alias veritas_psql='veritas && docker exec -it veritas_postgres_1 psql veritas_dev -U postgres'

# Betterment alias
alias retail='cd ~/src/retail/retail'
alias core='cd ~/src/retail/retail_core'



alias ls='ls -aln'

# lock computer
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# hibernation and sleep settings
alias hibernate='sudo pmset -a hibernatemode 25'
alias sleep='sudo pmset -a hibernatemode 0'
alias safesleep='sudo pmset -a hibernatemode 3'
alias smartsleep='sudo pmset -a hibernatemode 2'

# up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# simple ip
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\ -f2'
# more details
alias ip1="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
# external ip
alias ip2="curl -s http://www.showmyip.com/simple/ | awk '{print $1}'"

# grep with color
alias grep='grep --color=auto'

# processes
alias ps='ps -ax'

# refresh shell
alias reload='source ~/.bash_profile'

###############################
### ENVIRONMENTAL VARIABLES ###
###############################

# Add homebrew sbin to PATH variable
export PATH=$PATH:/usr/local/sbin


# Custom bash prompt

red="\[\e[0;31m\]"
green="\[\e[32;1m\]"
reset_color="\[\e[39m\]"
normal="\[\e[0m\]"

function git_dirty_status {
  [[ $(git status 2> /dev/null | tail -n1) == "nothing to commit, working tree clean" ]] && echo "✓"
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "✗"
}

function git_branch_name {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"
}

function print_branch_name_and_status {
  if [[ $(git_branch_name) ]]; then
    echo "[$(git_branch_name) $(git_dirty_status)]"
  else
    echo ""
  fi
}

export PS1="$red\w\[\e[0;31m\]\[\e[39m\]$reset_color $green\[\$(print_branch_name_and_status)\]$reset_color$normal "

# add postgres version variable
# export PATH="/Applications/Postgres.app/Contents/Versions/9.6/bin:$PATH"

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

#FZF
export FZF_DEFAULT_COMMAND='ag -g ""'

function setup {
  cd ~/src/retail/retail
  bundle exec rake db:migrate
  psql -c 'select pg_terminate_backend(pg_stat_activity.pid) from pg_stat_activity where pg_stat_activity.datname = '\''retail_development'\'' and pid <> pg_backend_pid()'
  bundle exec rake db:reset
  bundle exec rake db:test:prepare
  cd ~/src/retail/retail_core
  bundle exec rake db:test:prepare
  cd -
}

function cmd {
  cd "$1"
  eval "$2"
  cd -
}

# NPM setup
export NPM_TOKEN="98abfad3-2af0-461f-9e16-390561c71663"

[ -f ~/.bashrc ] && source ~/.bashrc
