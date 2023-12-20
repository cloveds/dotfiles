local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)
vim.g.leader = " "
require('lazy').setup({
    {
        'olimorris/onedarkpro.nvim',
        lazy = false,
        priority = 1000,
        config = function() vim.cmd [[colorscheme onedark]] end
    }, {'nvim-tree/nvim-web-devicons'}, {'windwp/nvim-autopairs'},
    {'windwp/nvim-ts-autotag'}, {'brenoprata10/nvim-highlight-colors'},
    {"nvim-treesitter/nvim-treesitter-context"},
    {'darrikonn/vim-gofmt', cmd = 'GoUpdateBinaries'}, {'rust-lang/rust.vim'},
    {'numToStr/Comment.nvim'},
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {{'nvim-lua/plenary.nvim'}}
    }, {
        'nvim-treesitter/nvim-treesitter',
        init = function()
            local ts_update = require('nvim-treesitter.install').update({
                with_sync = true
            })
            ts_update()
        end
    }, {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            {'neovim/nvim-lspconfig'}, {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'}, {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'}, {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'}, {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'}
        }
    }, {'nvim-lualine/lualine.nvim'}

})
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c", "lua", "vim", "rust", "python", "bash", "go", "typescript", "html",
        "css"
    },
    sync_install = false,
    auto_install = true,
    highlight = {enable = true},
    autotag = {enable = true}
}
local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.ensure_installed({
    'lua_ls', 'rust_analyzer', 'bashls', 'pyright', 'gopls', 'html', 'tsserver',
    'cssls'
})
lsp.nvim_workspace()
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({select = true}),
    ["<C-Space>"] = cmp.mapping.complete()
})
vim.g.mapleader = " "
require('telescope').setup {
    defaults = {mappings = {i = {["<C-h>"] = "which_key"}}},
    pickers = {},
    extensions = {}
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil
cmp_mappings['<Left>'] = nil
cmp_mappings['<Up>'] = nil
cmp_mappings['<Down>'] = nil
cmp_mappings['<Right>'] = nil
lsp.setup_nvim_cmp({mapping = cmp_mappings})
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {error = 'E', warn = 'W', hint = 'H', info = 'I'}
})
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws",
                   function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd",
                   function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
                   opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
                   opts)
    vim.keymap
        .set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
                   opts)
end)
lsp.setup()
local colors = {
    blue = '#61AFEF',
    green = '#98C379',
    black = '#282c34',
    white = '#ABB2BF',
    red = '#E06C75',
    violet = '#d183e8',
    grey = '#3E4452'
}

local bubbles_theme = {
    normal = {
        a = {fg = colors.black, bg = colors.green},
        b = {fg = colors.green, bg = colors.grey},
        c = {fg = colors.black, bg = colors.black}
    },

    insert = {
        a = {fg = colors.black, bg = colors.blue},
        b = {fg = colors.blue, bg = colors.grey},
        c = {fg = colors.black, bg = colors.black}

    },
    visual = {
        a = {fg = colors.black, bg = colors.violet},
        b = {fg = colors.violet, bg = colors.grey},
        c = {fg = colors.black, bg = colors.black}
    },
    replace = {
        a = {fg = colors.black, bg = colors.red},
        b = {fg = colors.red, bg = colors.grey},
        c = {fg = colors.black, bg = colors.black}
    },

    inactive = {
        a = {fg = colors.white, bg = colors.black},
        b = {fg = colors.white, bg = colors.black},
        c = {fg = colors.black, bg = colors.black}
    }
}

require('lualine').setup {
    options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = {left = '|', right = '|'}
    },
    sections = {
        lualine_a = {{'mode', separator = {left = '|'}, right_padding = 3}},
        lualine_b = {'filename', 'branch'},
        lualine_c = {'fileformat'},
        lualine_x = {},
        lualine_y = {'filetype', 'progress'},
        lualine_z = {
            {'location', separator = {right = '|'}, left_padding = 2}
        }
    },
    inactive_sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'location'}
    },
    tabline = {},
    extensions = {}
}
require('nvim-highlight-colors').setup {}
vim.diagnostic.config({virtual_text = true})
require("nvim-autopairs").setup {}
require('Comment').setup()
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 0
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.wrap = false
vim.opt.background = "dark"
vim.opt.encoding = "utf-8"
vim.opt.compatible = false
vim.opt.cursorline = true
vim.opt.showtabline = 0
vim.opt.cursorlineopt = "number"
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.guicursor = "i:block"
vim.cmd.syntax = "enable"
vim.cmd [[filetype plugin indent on]]
