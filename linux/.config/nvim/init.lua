local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'numToStr/Comment.nvim'
Plug('fatih/vim-go', {['do'] = 'GoUpdateBinaries' })
Plug('darrikonn/vim-gofmt', {['do'] = 'GoUpdateBinaries' })
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.5' })
Plug 'L3MON4D3/LuaSnip'
Plug('VonHeikemen/lsp-zero.nvim', {['branch'] = 'v3.x'})
Plug "olimorris/onedarkpro.nvim"
Plug 'windwp/nvim-autopairs'
vim.call('plug#end')

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
	  'rust_analyzer',
	  'lua_ls',
	  'gopls',
	  'bashls',
	  'pyright',
	  'asm_lsp',
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
	  "c",
	  "lua",
	  "vim",
	  "rust",
	  "python",
	  "bash",
	  "go",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-h>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
	['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})

require("nvim-autopairs").setup {}

require('Comment').setup()

vim.o.backup = false
vim.o.writebackup = false
vim.o.signcolumn = "yes"
vim.o.updatetime = 50
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
vim.o.cursorline = true
vim.o.showtabline = 0
vim.o.cursorlineopt = "number"
vim.o.guicursor = "i:block"
vim.cmd.syntax = "enable"
vim.cmd.colorscheme("onedark")
vim.cmd[[filetype plugin indent on]]
