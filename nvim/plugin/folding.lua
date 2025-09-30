if vim.g.vscode then
  return
end

require('origami').setup {
  useLspFoldsWithTreesitterFallback = true,
  autoFold = {
    enabled = false,
  },
}
