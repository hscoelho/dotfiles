if vim.g.vscode then
  return
end

local statusline = require 'mini.statusline'
statusline.setup {
  content = {
    -- Content for active window
    active = nil,
    -- Content for inactive window(s)
    inactive = nil,
  },
  use_icons = true,
}

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_git = function()
  return ''
end

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
  return '%2l:%-2v'
end
