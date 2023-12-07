local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('fatih/vim-go', {['do'] = 'GoUpdateBinaries' })
Plug('darrikonn/vim-gofmt', {['do'] = 'GoUpdateBinaries' })
Plug 'https://github.com/tmsvg/pear-tree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/rust-lang/rust.vim'
Plug('neoclide/coc.nvim', {['branch'] = 'release'})
Plug 'sheerun/vim-polyglot'
Plug 'tribela/vim-transparent'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
vim.call('plug#end')
vim.o.backup = false
vim.o.writebackup = false
vim.o.signcolumn = "yes"
vim.o.updatetime = 300
vim.o.number = true
vim.o.relativenumber = true
vim.o.laststatus = 0
vim.o.cmdheight = 1
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.background = "dark"
vim.o.termguicolors = true
vim.o.encoding = "utf-8"
vim.o.guifont = "*"
vim.o.compatible = false
vim.o.showtabline = 0
vim.cmd[[
set guicursor=i:block
syntax enable
filetype plugin indent on
colorscheme onehalfdark 
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
]]
