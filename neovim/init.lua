if vim.g.vscode then
  -- vscode neovim config
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.clipboard = "unnamedplus"
  local vscode = require "vscode-neovim"

  -- added to fix the opening of folds when the cursor is moved
  local function mapMove(key, direction)
    vim.keymap.set("n", key, function()
      local count = vim.v.count
      local v = 1
      local style = "wrappedLine"
      if count > 0 then
        v = count
        style = "line"
      end
      vscode.action("cursorMove", {
        args = {
          to = direction,
          by = style,
          value = v,
        },
      })
    end)
  end

  mapMove("k", "up")
  mapMove("j", "down")
else
  vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
  vim.g.mapleader = " "

  -- bootstrap lazy and all plugins
  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

  if not vim.loop.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
  end

  vim.opt.rtp:prepend(lazypath)

  local lazy_config = require "configs.lazy"

  -- load plugins
  require("lazy").setup({
    {
      "NvChad/NvChad",
      lazy = false,
      branch = "v2.5",
      import = "nvchad.plugins",
      config = function()
        require "options"
      end,
    },

    { import = "plugins" },
  }, lazy_config)

  -- load theme
  dofile(vim.g.base46_cache .. "defaults")
  dofile(vim.g.base46_cache .. "statusline")

  require "nvchad.autocmds"

  vim.schedule(function()
    require "mappings"
  end)
end
