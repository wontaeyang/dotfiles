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

" Theme setup
set termguicolors
colorscheme OceanicNext
" colorscheme Dracula

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

" Deoplete
let g:deoplete#enable_at_startup = 1

" vim ruby setup
syntax enable
filetype plugin indent on
let g:ruby_indent_assignment_style = 'variable'

" Golang setup
au FileType go set nolist
au FileType go set noexpandtab

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 1
let g:go_auto_type_info = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_term_enabled = 'split'

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" Remap some vim-go key bindings to prevent colliding with FZF
let g:go_def_mapping_enabled = 0
au FileType go let $APP_ENV = 'test'
au FileType go nmap gd :GoDef<CR>
au FileType go nmap gt :GoDefPop<CR>
au FileType go nmap <silent> <leader>t :call KesselTestFunc()<CR>
nmap <silent> <leader>a :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>

function! KesselTestFuncName()
  let test = search('func \(Test\|.\+Test\)', "bcnW")

  if test == 0
    echo "No test found immediate to cursor"
    return
  end

  let line = getline(test)
  let match_list = []
  call substitute(line, 'Test\w\+', '\=add(match_list, submatch(0))', 'g')

  if matchstr(line, 'func Test') != ''
    return match_list[0]
  elseif matchstr(line, 'func (') != ''
    return match_list[-1]
  end
endfunction

function! KesselTestModuleName()
  let file_path = expand('%:p:h')
  let start_pos = match(file_path, 'kessel')
  let end_pos = len(file_path)
  return file_path[start_pos:end_pos]
endfunction

function! KesselTestFunc()
  execute ":split | terminal env $(cat test/test.env | xargs) go test -v " . KesselTestModuleName() . " -testify.m " . KesselTestFuncName()
endfunction

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

"FZF
nnoremap <C-t> :FZF<CR>
" nnoremap <C-b> :Buffers<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore --hidden --follow --ignore-case -g "!{.git,node_modules}/*" 2> /dev/null'
let g:fzf_layout = { 'window': '-tabnew' }

" Tests
let test#strategy = "neovim"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>a :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>

"edit command with current folders populated
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"Split Join
map <leader>s gS<CR>
map <leader>j gJ<CR>
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_trailing_comma = 1

" Switch setting
let g:switch_mapping = '-'

" Adjust paste to not yank
xnoremap p "_dP

" load bash_profile for termnal
" let &shell='/bin/bash --rcfile ~/.bash_profile'

" Neomake settings
autocmd! BufWritePost * Neomake
