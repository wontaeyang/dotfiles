call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'dracula/vim'
Plug 'freeo/vim-kalisi'
Plug 'mhartington/oceanic-next'

" Status bar
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline

" Search
" Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' " NERDtree for file nav
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'ggreer/the_silver_searcher' " silver searcher, faster than :ack
Plug 'mbbill/undotree' " undo navigation

" Test
Plug 'janko-m/vim-test'

" Visual
Plug 'airblade/vim-gitgutter'

" Ruby / Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Editing
Plug 'tpope/vim-surround' " change surrounding quotes or tags
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-endwise' " automatically add end in ruby
" Plug 'jiangmiao/auto-pairs' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'qpkorr/vim-bufkill' "prevent closing window when deleting buffer

" to be reviewed
" Plug 'christoomey/magictags' " to be adjusted before enabled
" Plug 'ConradIrwin/vim-bracketed-paste' "better pasting

" Utilities
Plug 'terryma/vim-multiple-cursors' " multiple cursors like sublime
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
" Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'pbrisbin/vim-mkdir'  " automatically create directories when editing a new file

call plug#end()
