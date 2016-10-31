source ~/.config/nvim/plugins.vim

" General
set encoding=utf-8
set nowrap

" Theme setup
colorscheme OceanicNext
set termguicolors
" set background=dark
let oceanic_next_terminal_italic = 1
let oceanic_next_terminal_bold = 1

" NerdTree
let NERDTreeShowHidden = 1
let NERDTreeDirArrows = 0
map \           :NERDTreeToggle<CR> " File tree browser
map \|          :NERDTreeFind<CR> " File tree browser showing current file - pipe (shift-backslash)

" Airline
let airline#extensions#tabline#enabled = 1
let airline_theme='oceanicnext'

"FZF
nnoremap <c-t> :FZF<cr>
