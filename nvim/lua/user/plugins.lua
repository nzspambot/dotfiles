local fn = vim.fn
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install your plugins here
local plugins = {
  "nvim-lua/plenary.nvim",
  "windwp/nvim-autopairs",
  "numtostr/comment.nvim",
  "joosepalviste/nvim-ts-context-commentstring",
  "kyazdani42/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",
  "akinsho/bufferline.nvim",
	"moll/vim-bbye",
  "akinsho/toggleterm.nvim",
  "ahmedkhalf/project.nvim",
  "lewis6991/impatient.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "goolord/alpha-nvim",
	"folke/which-key.nvim",
  "folke/trouble.nvim",
  "kdheepak/lazygit.nvim",
  "hashivim/vim-terraform",
  "theprimeagen/harpoon",
  "justinmk/vim-sneak",
  "mbbill/undotree",
  "folke/todo-comments.nvim", dependencies = {"nvim-lua/plenary.nvim"},
  "yamatsum/nvim-nonicons",
  "nvim-lualine/lualine.nvim",dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  "norcalli/nvim-colorizer.lua",
  "justinmk/vim-sneak",
  "gaborvecsei/memento.nvim",
  "MunifTanjim/nui.nvim",
  "rcarriga/nvim-notify",
  "folke/noice.nvim", dependencies = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"},
  "phaazon/hop.nvim",
  -- Colorschemes
  "folke/tokyonight.nvim",
  "lunarvim/darkplus.nvim",
  "rebelot/kanagawa.nvim",
  "EdenEast/nightfox.nvim",
  "navarasu/onedark.nvim",

  -- Cmp 
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",

	-- Snippets
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

	-- LSP
	"neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
  "RRethy/vim-illuminate",
  "github/copilot.vim",
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      {'neovim/nvim-lspconfig'},
      {
        'williamboman/mason.nvim',
        build = function()
         pcall(vim.cmd, 'MasonUpdate')
      end,
      },
      {'williamboman/mason-lspconfig.nvim'},
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  },
    "udalov/kotlin-vim",


  -- Telescope
	"nvim-telescope/telescope.nvim",

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",

	-- Git
	"lewis6991/gitsigns.nvim",
  "ldelossa/litee.nvim",
  "ldelossa/gh.nvim", dependencies = {"ldelossa/litee.nvim"},
}

local opts = {
    readme = {
    enabled = true,
    root = vim.fn.stdpath("state") .. "/lazy/readme",
    files = { "README.md", "lua/**/README.md" },
    -- only generate markdown helptags for plugins that dont have docs
    skip_if_doc_exists = true,
  },
}

require("lazy").setup(plugins, opts)

