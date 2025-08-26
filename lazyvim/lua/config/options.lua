-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "pt_br" }
vim.opt.termguicolors = true
vim.opt.spelloptions = "camel"
vim.opt.scrolloff = 999
vim.g.lazyvim_prettier_needs_config = true
vim.lsp.enable("angularls")
