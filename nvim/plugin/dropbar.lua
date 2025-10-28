if vim.g.vscode then
  return
end

require('dropbar').setup { sources = {
  lsp = {
    max_depth = 12,
  },
  treesitter = {
    max_depth = 12,
  },
} }
