local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('fatih/vim-go', {['do'] = 'GoUpdateBinaries' })
Plug('darrikonn/vim-gofmt', {['do'] = 'GoUpdateBinaries' })
Plug 'https://github.com/tmsvg/pear-tree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/rust-lang/rust.vim'
Plug('neoclide/coc.nvim', {['branch'] = 'release'})
Plug 'tribela/vim-transparent'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
vim.call('plug#end')
vim.cmd[[
set nobackup
set nowritebackup
set signcolumn=yes
set updatetime=300
set number
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent	
set guifont=*
set softtabstop=4
set encoding=utf8
set relativenumber
set background=dark
set termguicolors
colorscheme one
set cursorlineopt=number
hi LineNr ctermfg=NONE guibg=NONE guifg=#D3D3D3
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
]]
