return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      angularls = function()
        return true
      end,
    },
  },
}
