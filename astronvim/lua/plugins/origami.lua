---@type LazySpec
return {
  "chrisgrieser/nvim-origami",
  event = "BufReadPost",
  opts = {
    useLspFoldsWithTreesitterFallback = false,
    pauseFoldsOnSearch = true,
    foldtext = {
      enabled = true,
      padding = 3,
      lineCount = {
        template = "%d lines", -- `%d` is replaced with the number of folded lines
        hlgroup = "Comment",
      },
      diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
      gitsignsCount = true, -- requires `gitsigns.nvim`
    },
    autoFold = {
      enabled = true,
      kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
    },
    foldKeymaps = {
      setup = true, -- modifies `h`, `l`, and `$`
      hOnlyOpensOnFirstColumn = false,
    },
  },
}
