-- todo: add oil.nvim
return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require "configs.dap"
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "rust",
        "cpp",
        "python",
        "typescript",
        "javascript",
      },
    },
    dependencies = {
      { "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
    },
    lazy = false,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async", "jghauser/fold-cycle.nvim" },
    lazy = false,
    config = function()
      require "configs.folding"
    end,
  },
  {
    -- todo: start with this plugin enabled
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    lazy = false,
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "stevearc/overseer.nvim",
    opts = {},
    lazy = false,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require "notify"
      require("notify").setup {
        render = "wrapped-compact",
      }
    end,
    lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        oldfiles = {
          mappings = {
            i = {
              ["<S-Tab>"] = "move_selection_next",
              ["<Tab>"] = "move_selection_previous",
            },
          },
        },
      },
    },
  },
}
