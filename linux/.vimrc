call plug#begin()
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries' }
Plug 'darrikonn/vim-gofmt', {'do': ':GoUpdateBinaries' }
Plug 'https://github.com/tmsvg/pear-tree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'tribela/vim-transparent'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
call plug#end()
set nobackup
set nowritebackup
set signcolumn=yes
set updatetime=300
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
set softtabstop=4
set encoding=utf8
set termguicolors
set background=dark
syntax enable
colorscheme one
filetype plugin indent on
set nocompatible
set guifont=*
set showtabline=0
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
hi LineNr ctermfg=NONE guibg=NONE guifg=#D3D3D3
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
