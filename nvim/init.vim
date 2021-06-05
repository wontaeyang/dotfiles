source ~/.config/nvim/plugins.vim

" Space for leader
let mapleader = " " "remap leader as space

" General
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
set autowriteall            " Automatically :write before running commands
set nojoinspaces            " Use one space, not two, after punctuation.
set splitbelow              " Open new split panes to right and bottom, which feels more natural
set splitright
set diffopt+=vertical       " Always use vertical diffs
set list listchars=tab:»·,trail:·,nbsp:· " Display trailing white spaces
set clipboard+=unnamedplus  " Always use clipboard on yank and paste
set ignorecase              " ignores case sensitive search
set smartcase               " ignores case insensitive search if uppercase letter is present
set nopaste                 " disable paste aid
set cursorline              " highlilght current row
set number                  " Display current line number

" Tab / indentation settings
set tabstop=2               " Tab is two spaces
set shiftwidth=2
set shiftround
set expandtab
set autoindent              " Enable auto indentation
set copyindent              " Copy previous indentation on autocomplete

set spell
set spelllang=en,cjk

" Theme setup
syntax enable
set termguicolors
colorscheme OceanicNext

" Setup LSP for Golang
lua << EOF
require'lspconfig'.gopls.setup{}
EOF

" Completion settings
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:false
let g:compe.source.spell = v:true
let g:compe.source.tags = v:false
let g:compe.source.emoji = v:true

" BarBar tabline configs
nnoremap <silent> <leader>1 :BufferGoto 1<CR>
nnoremap <silent> <leader>2 :BufferGoto 2<CR>
nnoremap <silent> <leader>3 :BufferGoto 3<CR>
nnoremap <silent> <leader>4 :BufferGoto 4<CR>
nnoremap <silent> <leader>5 :BufferGoto 5<CR>
nnoremap <silent> <leader>6 :BufferGoto 6<CR>
nnoremap <silent> <leader>7 :BufferGoto 7<CR>
nnoremap <silent> <leader>8 :BufferGoto 8<CR>
nnoremap <silent> <leader>9 :BufferLast<CR>
nnoremap <silent> <leader>d :BufferClose<CR>
nnoremap <silent> <leader>q :BufferCloseAllButCurrent<CR>

let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:false " Disable animation
let bufferline.auto_hide = v:false " Auto-hide single buffer
let bufferline.tabpages = v:true   " Enable tab pages count
let bufferline.closable = v:false  " Enable/disable close button
let bufferline.icons = 'numbers'   " Display tab numbers
let bufferline.maximum_padding = 1 " Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_length = 30 " Sets the maximum buffer name length.
let bufferline.no_name_title = "New Buffer"
let bufferline.icon_separator_active = ''
let bufferline.icon_separator_inactive = ''

" Vim ruby setup
filetype plugin indent on
let g:ruby_indent_assignment_style = 'variable'

" Golang setup
au FileType go set nolist
au FileType go set noexpandtab

let g:go_fmt_autosave = 1
let g:go_fmt_command = "gopls"
let g:go_def_mapping_enabled = 1
let g:go_auto_type_info = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_term_enabled = 'split'

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_doc_keywordprg_enabled = 0

" Remap some vim-go key bindings to prevent colliding with FZF
let g:go_def_mapping_enabled = 0
au FileType go nmap gd :GoDef<CR>
au FileType go nmap gt :GoDefPop<CR>
au FileType go nmap <silent> <leader>t :call KesselTestFunc()<CR>

" Parsec Kessel test runner for testify suite
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
  execute ":split | terminal env $(cat test/test.env | xargs) go test -bench=. -v " . KesselTestModuleName() . " -testify.m " . KesselTestFuncName()
endfunction

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

" Adjust paste to not yank
xnoremap p "_dP

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

" Remove all trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e
