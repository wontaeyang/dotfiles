source ~/.config/nvim/plugins.vim

" General
let mapleader = " " "remap leader as space

set hidden                  " persist undo between buffer switches
set nocompatible            " do not support vi
set encoding=utf-8
set nowrap
set ttyfast                 " Faster redraw
set wildmenu                " Enhanced command line completion
set backspace=2             " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile              " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler                   " Show the cursor position all the time
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

" Theme setup
colorscheme OceanicNext
set termguicolors

" vim ruby setup
syntax on
filetype on
filetype indent on
filetype plugin on

" Gutter numbers
set foldcolumn=1
set relativenumber

" Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set autoindent              " Indentation

" Cursor settings
set cul
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " neovim specific cursor change setting

" Remove all trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

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

" NerdTree
" let NERDTreeShowHidden = 1
" let NERDTreeDirArrows = 0
" map \           :NERDTreeToggle<CR> " File tree browser
" map \|          :NERDTreeFind<CR> " File tree browser showing current file - pipe (shift-backslash)
" autocmd FileType nerdtree noremap <buffer> <Tab> <nop> " prevent buffer change within nerdtree
" autocmd FileType nerdtree noremap <buffer> <S-Tab> <nop> " prevent buffer change within nerdtree

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

" Undo tree
nnoremap <c-u> :UndotreeToggle<cr>

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

" ctrl-j/k to move lines up and down (vim-unimpaired)
nmap <leader>k [e
nmap <leader>j ]e
" vmap <C-k> [egv
" vmap <C-j> ]egv

"edit command with current folders populated
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Neomake settings
autocmd! BufWritePost * Neomake

" Current line number highlight ( need to be at the end )
hi CursorLineNR cterm=bold guifg=#ec5f67
