return {
  "mrcjkb/rustaceanvim",
  opts = {
    server = {
      default_settings = {
        ["rust-analyzer"] = {
          inlayHints = {
            chainingHints = {
              enable = false,
            },
            parameterHints = {
              enable = false,
            },
            typeHints = {
              enable = false,
            },
          },
        },
      },
    },
  },
}
