-- Snacks.debug functions
_G.dd = function(...)
  require('snacks').debug.inspect(...)
end
_G.bt = function()
  require('snacks').debug.backtrace()
end

if vim.fn.has 'nvim-0.11' == 1 then
  vim._print = function(_, ...)
    dd(...)
  end
else
  vim.print = dd
end

-- `:help vim.o`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.number = true
vim.o.mouse = 'a'
vim.o.showmode = true
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.preserveindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 250
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cursorline = true
vim.o.scrolloff = 999
vim.o.inccommand = 'split'
vim.o.confirm = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.conceallevel = 0
vim.o.winborder = 'rounded'
vim.o.list = true
vim.o.modeline = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

vim.o.swapfile = false

vim.opt.spell = true
vim.opt.spelllang = { 'en_us', 'pt' }
vim.opt.spelloptions = { 'camel' }

local is_windows = vim.uv.os_uname().sysname:find 'Windows'
if is_windows then
  vim.opt.shell = 'cmd.exe'
else
  -- vim.opt.shell = 'nu'
end

require 'plugins'
