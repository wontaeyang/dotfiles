source ~/.config/nvim/plugins.vim

" General
let mapleader = " " "remap leader as space

set encoding=utf-8
set nocompatible            " do not support vi mode
set hidden                  " persist undo between buffer switches
set nowrap                  " Do not wrap overflowing lines
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
set ignorecase              " ignores case sensitive search
set smartcase               " ignores case insensitive search if uppercase letter is present
set nopaste                 " disable paste aide
set spell                   " enable spell check

" vim ruby setup
syntax enable
filetype plugin indent on
let g:ruby_indent_assignment_style = 'variable'

" Theme setup
set termguicolors
colorscheme OceanicNext

" Gutter numbers
set number                  " Display current line number
set foldcolumn=1

" Tab / indentation settings
set tabstop=2               " Tab is two spaces
set shiftwidth=2
set shiftround
set expandtab
set autoindent              " Enable auto indentation
set copyindent              " Copy previous indentation on autocomplete

" Cursor settings
set cul
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " neovim specific cursor change setting

" Remove all trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e

" Run mix format on save
" let g:mix_format_on_save = 1

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

autocmd TermOpen * set bufhidden=hide "prevent closing of terminal on buffer switch

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
nnoremap <C-t> :FZF<CR>
" nnoremap <C-f> :Ag<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Tests
let test#strategy = "neovim"
" nmap <silent> <leader>t :TestNearest<CR>
" nmap <silent> <leader>a :TestFile<CR>
" " nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

" CD into project folder before running tests
fun! SafeCD(dir)
  execute 'cd' fnameescape(a:dir)
endfun

fun! RunFromDir(dir, function)
  let current_dir = getcwd()
  if !(a:dir ==? '')
    call SafeCD(a:dir)
    execute a:function
    call SafeCD(current_dir)
  else
    execute a:function
  endif
endfun

fun! RunFromGemfileDir(function)
  let gemfile_dir = fnamemodify(findfile("Gemfile"), ':p:h')
  call RunFromDir(gemfile_dir, a:function)
endfun

nmap <silent> <leader>t :call RunFromGemfileDir('TestNearest')<CR>
nmap <silent> <leader>a :call RunFromGemfileDir('TestFile')<CR>
nmap <silent> <leader>l :call RunFromGemfileDir('TestLast')<CR>
nmap <silent> <leader>g :call RunFromGemfileDir('TestVisit')<CR>

"edit command with current folders populated
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"Split Join
map <leader>s gS<CR>
map <leader>j gJ<CR>
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

" Switch setting
let g:switch_mapping = '-'

" Adjust paste to not yank
xnoremap p "_dP

" load bash_profile for termnal
let &shell='/bin/bash --rcfile ~/.bash_profile'

" Neomake settings
autocmd! BufWritePost * Neomake
