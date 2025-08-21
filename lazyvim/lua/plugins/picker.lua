return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true,
        },
      },
    },
  },
  keys = {
    -- swaps the default fF and ff
    -- { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    -- { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
  },
}
