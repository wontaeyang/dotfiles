call plug#begin('~/.config/nvim/plugged')
" Colorschemes
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim'
Plug 'arcticicestudio/nord-vim'

" Tabline
Plug 'romgrk/barbar.nvim'

" Search
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more

" Test
Plug 'janko-m/vim-test'

" Helpers
Plug 'airblade/vim-gitgutter'
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

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

" Utilities
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'junegunn/vim-slash' " slash search enhancement
Plug 'tpope/vim-dotenv' " read env files

call plug#end()
