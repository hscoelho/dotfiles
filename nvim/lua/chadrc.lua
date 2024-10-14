-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

--- this is done to remove the base46 themes colors from the terminal
local base46_term_integration_file = io.open(vim.g.base46_cache .. "term", "wb")
if base46_term_integration_file then
  base46_term_integration_file:write ""
  base46_term_integration_file:close()
end

---@type ChadrcConfig
local M = {
  base46 = {
    theme = "melange",
    integrations = {},
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
  term = {
    winopts = {
      number = false,
    },
    float = {
      relative = "editor",
      row = 0.01,
      col = 0.05,
      width = 0.9,
      height = 0.8,
      border = "single",
    },
  },
}

return M
