source ~/.config/nvim/plugins.vim

" General


let mapleader = " " "remap leader as space

set encoding=utf-8
set nowrap
set ttyfast                 " faster redraw
set wildmode=list:longest   " complete files like a shell
set wildmenu                " enhanced command line completion

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Numbers
set number
set numberwidth=4
set foldcolumn=1

" Tab settings
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

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

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Always use vertical diffs
set diffopt+=vertical

" Theme setup
colorscheme OceanicNext
set termguicolors
" set background=dark
let g:oceanic_next_terminal_italic = 1
let g:oceanic_next_terminal_bold = 1

" NerdTree
let NERDTreeShowHidden = 1
let NERDTreeDirArrows = 0
map \           :NERDTreeToggle<CR> " File tree browser
map \|          :NERDTreeFind<CR> " File tree browser showing current file - pipe (shift-backslash)

" Airline
let g:airline_powerline_fonts = 1
let airline#extensions#tabline#enabled = 1
let airline_theme='oceanicnext'

"FZF
nnoremap <c-t> :FZF<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Undo tree
nnoremap <c-u> :UndotreeToggle<cr>
