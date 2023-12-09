local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'numToStr/Comment.nvim'
Plug('fatih/vim-go', {['do'] = 'GoUpdateBinaries' })
Plug('darrikonn/vim-gofmt', {['do'] = 'GoUpdateBinaries' })
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})
Plug('neoclide/coc.nvim', {['branch'] = 'release'})
Plug "olimorris/onedarkpro.nvim"
Plug 'windwp/nvim-autopairs'
vim.call('plug#end')
require("nvim-tree").setup({
	view = {
		side = "right"
	}
})
require("nvim-autopairs").setup {}
require('Comment').setup()
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', 'filetype'},
    lualine_x = {'fileformat'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
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
vim.o.compatible = false
vim.o.showmode = false
vim.o.cursorline = true
vim.o.showtabline = 0
vim.o.cursorlineopt = "number"
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "rust", "python", "bash" },
  sync_install = false,
  highlight = {
    enable = true,
  },
}
vim.o.guicursor = "i:block"
vim.cmd.syntax = "enable"
-- vim.cmd.highlight({"CocFloating", "guibg=#44475A"})
-- vim.cmd.highlight({"CocMenuSel", "guibg=#282A36"})
vim.cmd.colorscheme("onedark")
vim.cmd[[
filetype plugin indent on
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
nnoremap <leader>n :NvimTreeFocus<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
]]

