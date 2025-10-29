if vim.g.vscode then
  return
end

require('fzf-lua').setup {
  winopts = {
    preview = {
      layout = 'vertical',
    },
  },
  oldfiles = {
    include_current_session = true,
  },
}
require('fzf-lua').register_ui_select()

-- This is not good.
-- I tried using fzf_opts = [--preview] but not even the wiki example works
vim.api.nvim_create_user_command('FzfSnacksNotifications', function()
  local snacks = require 'snacks'
  local notifications_full = snacks.notifier.get_history()

  local notifications = {}
  local notifications_titles = {}
  for i, notification in ipairs(notifications_full) do
    local title = i .. ': ' .. notification.title
    notifications[title] = notification.msg
    table.insert(notifications_titles, title)
  end

  local fzf_lua = require 'fzf-lua'
  local builtin = require 'fzf-lua.previewer.builtin'

  -- Inherit from "base" instead of "buffer_or_file"
  local MyPreviewer = builtin.base:extend()

  function MyPreviewer:new(o, opts, fzf_win)
    MyPreviewer.super.new(self, o, opts, fzf_win)
    setmetatable(self, MyPreviewer)
    return self
  end

  function MyPreviewer:populate_preview_buf(entry_str)
    local tmpbuf = self:get_tmp_buffer()
    vim.api.nvim_buf_set_lines(tmpbuf, 0, -1, false, vim.split(notifications[entry_str] or '', '\n', { plain = true }))
    self:set_preview_buf(tmpbuf)
    self.win:update_preview_scrollbar()
  end

  -- Disable line numbering and word wrap
  function MyPreviewer:gen_winopts()
    local new_winopts = {
      wrap = false,
      number = false,
    }
    return vim.tbl_extend('force', self.winopts, new_winopts)
  end

  fzf_lua.fzf_exec(notifications_titles, {
    previewer = MyPreviewer,
    prompt = 'Notifications>',
  })
end, {})
