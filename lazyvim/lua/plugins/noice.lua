return {
  "folke/noice.nvim",
  opts = {
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "lines yanked",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "lines <ed",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "lines >ed",
        },
        opts = { skip = true },
      },
    },
  },
}
