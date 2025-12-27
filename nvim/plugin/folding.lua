if vim.g.vscode then
  return
end

require('origami').setup {
  useLspFoldsWithTreesitterFallback = {
    enabled = true,
    foldmethodIfNeitherIsAvailable = 'indent', ---@type string|fun(bufnr: number): string
  },
  autoFold = {
    enabled = false,
  },
  foldKeymaps = {
    setup = true, -- modifies `h`, `l`, `^`, and `$`
    closeOnlyOnFirstColumn = true, -- `h` and `^` only close in the 1st column
  },
}
