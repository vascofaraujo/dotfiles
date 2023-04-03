vim.g.mapleader = ','
vim.keymap.set("n", "<leader>w", ":w!<cr>")
vim.keymap.set("n", "<leader>q", ":q!<cr>")

vim.wo.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.termguicolors = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.swapfile = false

vim.keymap.set('n', '<C-n>', ':bnext<cr>')
vim.keymap.set('n', '<C-p>', ':bprevious<cr>')
vim.keymap.set('n', '<leader>n', ":SFMToggle<cr>")
vim.keymap.set('n', '<Tab>', '>>')
vim.keymap.set('n', '<S-Tab>', '<<')
vim.keymap.set('v', '<Tab>', '>gv')
vim.keymap.set('v', '<S-Tab>', '<gv')
vim.keymap.set("n", '<C-j>', ":m .+1<CR>")
vim.keymap.set("n", '<C-k>', ":m .-2<CR>")
vim.keymap.set("v", '<C-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set("v", '<C-k>', ":m '<-2<CR>gv=gv")
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    use 'sainnhe/gruvbox-material'
    vim.g.gruvbox_material_foreground = "mix"   
    vim.cmd.colorscheme('gruvbox-material')

    use 'numToStr/Comment.nvim'
    require('Comment').setup()

    use 'tpope/vim-surround'

    use "lukas-reineke/indent-blankline.nvim"

    use "tenxsoydev/karen-yank.nvim"
    require("karen-yank").setup()

    use {
      'dinhhuy258/sfm.nvim',
      config = function()
        require("sfm").setup()
      end
    }

    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }

    use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    require'lualine'.setup {
          options = {
            icons_enabled = false,
            theme = 'gruvbox-material',
            -- component_separators = '|',
            -- section_separators = '',

          },
          tabline = {
              lualine_a = {'branch'},
              lualine_b = {'buffers'},
              lualine_c = {},
              lualine_x = {},
              lualine_y = {},
              lualine_z = {}
            }
        }
    require('lualine').setup()
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
    require'nvim-treesitter.configs'.setup {
          -- A list of parser names, or "all" (the five listed parsers should always be installed)
          ensure_installed = { "c", "lua", "vim", "help", "query" },

          -- Install parsers synchronously (only applied to `ensure_installed`)
          sync_install = false,

          -- Automatically install missing parsers when entering buffer
          -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
          auto_install = true,

          highlight = {
            enable = true,
        }
    }
    -- use {
    --   'VonHeikemen/lsp-zero.nvim',
    --   branch = 'v2.x',
    --   requires = {
    --     -- LSP Support
    --     {'neovim/nvim-lspconfig'},             -- Required
    --     {                                      -- Optional
    --       'williamboman/mason.nvim',
    --       run = function()
    --         pcall(vim.cmd, 'MasonUpdate')
    --       end,
    --     },
    --     {'williamboman/mason-lspconfig.nvim'}, -- Optional
    --
    --     -- Autocompletion
    --     {'hrsh7th/nvim-cmp'},     -- Required
    --     {'hrsh7th/cmp-nvim-lsp'}, -- Required
    --     {'L3MON4D3/LuaSnip'},     -- Required
    --   }
    -- }
    --
    -- local lsp = require('lsp-zero').preset({
    --     float_border = 'none',
    --     configure_diagnostics = false,
    -- })
    -- lsp.setup()
    -- vim.diagnostic.disable()
end)
