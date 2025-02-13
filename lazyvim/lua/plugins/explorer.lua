return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          -- this layout is just the default layout without the input
          layout = {
            preview = "main", -- not sure about this one...
            layout = {
              box = "horizontal",
              width = 0.8,
              min_width = 120,
              height = 0.8,
              {
                box = "vertical",
                border = "rounded",
                title = "{title} {live} {flags}",
                { win = "list", border = "none" },
              },
              { win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
            },
          },
        },
      },
    },
  },
}
