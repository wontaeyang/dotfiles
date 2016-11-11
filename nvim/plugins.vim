call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'dracula/vim'
Plug 'freeo/vim-kalisi'
Plug 'mhartington/oceanic-next'

" Status bar
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline

" Search
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' " NERDtree for file nav
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'ggreer/the_silver_searcher' " silver searcher, faster than :ack
Plug 'mbbill/undotree' " undo navigation

" Test
Plug 'janko-m/vim-test'

" Visual
Plug 'airblade/vim-gitgutter'

" Utilities
Plug 'terryma/vim-multiple-cursors' " multiple cursors like sublime
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-endwise' " automatically add end in ruby
Plug 'jiangmiao/auto-pairs' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
Plug 'MarcWeber/vim-addon-mw-utils' " interpret a file by function and cache file automatically
Plug 'tomtom/tlib_vim' " utility functions for vim
Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
" Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
" Plug 'tpope/vim-vinegar'
" Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
" Plug 'vim-scripts/matchit.zip' " extended % matching
" Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
" Plug 'sickill/vim-pasta' " context-aware pasting

call plug#end()
