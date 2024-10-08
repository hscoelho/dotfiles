-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {
  base46 = {
    theme = "melange",

    hl_override = {
      Comment = {
        fg = "red",
      },
      ["@comment"] = {
        fg = "red",
      },
    },
  },

  mason = {
    pkgs = {
      "lua-language-server",
      "stylua",
      "html-lsp",
      "css-lsp",
      "prettier",
      "codelldb",
      "rust-analyzer",
      "clangd",
      "pyright",
    },
  },
}

return M
