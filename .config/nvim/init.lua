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
Plug 'nvim-lualine/lualine.nvim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
vim.call('plug#end')
vim.o.backup = false
vim.o.writebackup = false
vim.o.signcolumn = "yes"
vim.o.updatetime = 300
vim.o.number = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.autoindent = true	
vim.o.softtabstop = 4
vim.o.termguicolors = true
vim.o.encoding = 'utf8'
vim.o.relativenumber= true
vim.o.background = 'dark'
vim.cmd[[
lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
	theme = 'onedark',
	},
}
END
syntax enable
colorscheme one
filetype plugin indent on
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set noshowmode
set nocompatible
set guifont=*
set guicursor=i:block
set cursorlineopt=number
hi LineNr ctermfg=NONE guibg=NONE guifg=#D3D3D3
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
]]
vim.o.showtabline = 0
vim.g.pear_tree_smart_openers = 1
vim.g.pear_tree_smart_closers = 1
vim.g.pear_tree_smart_backspace = 1
