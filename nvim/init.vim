source ~/.config/nvim/plugins.vim

" General
let mapleader = " " "remap leader as space

set hidden                  " persist undo between buffer switches
set nocompatible            " do not support vi
set encoding=utf-8
set nowrap                  " Do not wrap overflowing lines
set lazyredraw              " Faster redraw
set wildmenu                " Enhanced command line completion
set wildmode=list:longest,list:full  " Tab completion preview settings
set backspace=2             " Backspace deletes like most programs in insert mode
set nobackup                " Avoid writing backup
set nowritebackup           " Write to original file instead of backup
set noswapfile              " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=100             " Set undo history depth
set showcmd                 " Display incomplete commands
set incsearch               " Do incremental searching
set laststatus=2            " Always display the status line
set autowrite               " Automatically :write before running commands
set nojoinspaces            " Use one space, not two, after punctuation.
set splitbelow              " Open new split panes to right and bottom, which feels more natural
set splitright
set diffopt+=vertical       " Always use vertical diffs
set list listchars=tab:»·,trail:·,nbsp:· " Display trailing white spaces
set clipboard+=unnamedplus  " Always use clipboard on yank and paste

" vim ruby setup
syntax enable
filetype plugin indent on

" Theme setup
set termguicolors
colorscheme OceanicNext

" Gutter numbers
set number                  " Display current line number
set foldcolumn=1
set relativenumber          " Show relative line number

" Tab / indentation settings
set tabstop=2               " Tab is two spaces
set shiftwidth=2
set shiftround
set expandtab
set autoindent              " Enable auto indentation
set copyindent              " Copy previous indentation on autocomplete


" Cursor settings
set cul
" autocmd InsertEnter,InsertLeave * set cul!
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " neovim specific cursor change setting

" Remove all trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Terminal mode movement
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Buffer movement
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"FZF
nnoremap <C-t> :Files<CR>
" nnoremap <C-f> :Ag<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
autocmd VimEnter * command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)


" Terminal
autocmd TermOpen * set bufhidden=hide "prevent closing of terminal on buffer switch

" Comment
noremap <C-_> :Commentary<cr>

" Tests
let test#strategy = "neovim"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>a :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

"edit command with current folders populated
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"Split Join
map <leader>s gS<CR>
map <leader>j gJ<CR>

" Neomake settings
autocmd! BufWritePost * Neomake

" Current line number highlight ( need to be at the end )
hi CursorLineNR cterm=bold guifg=#ec5f67
