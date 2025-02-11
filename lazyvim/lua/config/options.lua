-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use the right clipboard when on WSL
local function is_wsl()
  local wsl_check = os.getenv("WSL_DISTRO_NAME") ~= nil
  return wsl_check
end

-- Install win32yank with cargo and then run:
-- sudo ln -s /mnt/c/Users/jared/.cargo/bin/win32yank.exe /usr/local/bin/win32yank
if is_wsl() then
  vim.g.clipboard = {

    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },

    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 1,
  }
end
