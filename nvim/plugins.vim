call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim'
Plug 'arcticicestudio/nord-vim'
Plug 'EdenEast/nightfox.nvim'

" Tabline
Plug 'romgrk/barbar.nvim'

" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Test
Plug 'janko-m/vim-test'

" Helpers
Plug 'airblade/vim-gitgutter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'L3MON4D3/LuaSnip'

" LSP
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

" Language specific
Plug 'fatih/vim-go'
" Plug 'ray-x/go.nvim'
Plug 'ziglang/zig.vim'
Plug 'rhysd/vim-clang-format'

" Files
Plug 'tpope/vim-eunuch' " convenient deleting moving and renameing files
Plug 'pbrisbin/vim-mkdir'  " automatically create directories when editing a new file

" Editing
Plug 'tpope/vim-surround' " change surrounding quotes or tags
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'ConradIrwin/vim-bracketed-paste' "better pasting
Plug 'AndrewRadev/splitjoin.vim' " auto break block of code (hash & etc..)

" Utilities
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-dotenv' " read env files

call plug#end()
