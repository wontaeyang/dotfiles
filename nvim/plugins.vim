call plug#begin('~/.config/nvim/plugged')
" Colorschemes
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim'

" Search
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more

" Test
Plug 'janko-m/vim-test'

" Helpers
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
" Plug 'ludovicchabant/vim-gutentags' " ctag manager

" Language specific
Plug 'tpope/vim-rails'
Plug 'elixir-lang/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Files
Plug 'tpope/vim-eunuch' " convenient deleting moving and renameing files
Plug 'pbrisbin/vim-mkdir'  " automatically create directories when editing a new file
Plug 'qpkorr/vim-bufkill' "prevent closing window when deleting buffer

" Editing
Plug 'tpope/vim-surround' " change surrounding quotes or tags
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-endwise' " automatically add end in ruby
Plug 'ConradIrwin/vim-bracketed-paste' "better pasting
Plug 'AndrewRadev/splitjoin.vim' " auto break block of code (hash & etc..)
Plug 'AndrewRadev/switch.vim' " auto toggle switch booleans and syntax

" Utilities
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'kassio/neoterm' " better terminal in Neovim
Plug 'junegunn/vim-slash' " slash search enhancement
Plug 'tpope/vim-dotenv' " read env files

call plug#end()
