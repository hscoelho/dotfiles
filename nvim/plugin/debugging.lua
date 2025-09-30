if vim.g.vscode then
  return
end

require('overseer').setup()

local debugmaster = require 'debugmaster'
debugmaster.plugins.ui_auto_toggle.enabled = false
debugmaster.plugins.osv_integration.enabled = true -- needed if you want to debug neovim lua code

local dap = require 'dap'
dap.adapters['chrome'] = {
  type = 'executable',
  command = vim.fn.exepath 'chrome-debug-adapter',
}

dap.adapters['firefox'] = {
  type = 'executable',
  command = vim.fn.exepath 'firefox-debug-adapter',
}
dap.configurations['firefox'] = {
  name = 'Firefox: Debug',
  type = 'firefox',
  request = 'launch',
  reAttach = true,
  url = 'http://localhost:4200',
  webRoot = '${workspaceFolder}',
  firefoxExecutable = '/usr/bin/flatpak run org.mozilla.firefox',
}

-- TODO: I could open a PR in the debugmaster to add this option
-- Open and close debugmaster panel on when it's entered and exitted
vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('DebugMasterUI', { clear = true }),
  pattern = 'DebugModeChanged',
  callback = function(ev)
    if ev and ev.data and ev.data.enabled then
      require('debugmaster.state').sidepanel:open()
    else
      require('debugmaster.state').sidepanel:close()
    end
  end,
})

-- breakpoints icons
vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
local breakpoint_icons = { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
for type, icon in pairs(breakpoint_icons) do
  local tp = 'Dap' .. type
  local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
  vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
end
