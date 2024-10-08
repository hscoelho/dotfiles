local lspconfig = require "lspconfig"
local configs = require "nvchad.configs.lspconfig"

local servers = {
  html = {},
  cssls = {},
  ts_ls = {},
  clangd = {},
  pyright = {},
  nushell = {
    cmd = { "nu", "--lsp" },
    filetypes = { "nu" },
    root_dir = require("lspconfig.util").find_git_ancestor,
    single_file_support = true,
  },
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  lspconfig[name].setup(opts)
end
