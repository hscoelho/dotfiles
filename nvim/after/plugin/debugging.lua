if vim.g.vscode then
  return
end

require('overseer').setup()

local debugmaster = require 'debugmaster'
debugmaster.plugins.ui_auto_toggle.enabled = false
debugmaster.plugins.osv_integration.enabled = true -- needed if you want to debug neovim lua code

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

-- js debugging
local dap = require 'dap'

-- Chrome debugging
dap.adapters['chrome'] = {
  type = 'executable',
  command = vim.fn.exepath 'chrome-debug-adapter',
}

-- Firefox debugging
dap.adapters['firefox'] = {
  type = 'executable',
  command = vim.fn.exepath 'firefox-debug-adapter',
}

-- Node debugging
-- I don't actually use the 'pwa-node' type, but for some reason the debugging doesn't work
-- if I use the 'pwa-node' table in the 'node' adapter directly, so I using the same method lazy.vim is using
local js_debug_adapter_path = vim.fn.expand '$MASON/packages/js-debug-adapter/js-debug/src/dapDebugServer.js'
dap.adapters['pwa-node'] = {
  type = 'server',
  host = 'localhost',
  port = '${port}',
  executable = {
    command = 'node',
    args = { js_debug_adapter_path, '${port}' },
  },
}
dap.adapters['node'] = function(cb, config)
  config.type = 'pwa-node'
  local adapter = dap.adapters['pwa-node']
  if type(adapter) == 'function' then
    adapter(cb, config)
  else
    cb(adapter)
  end
end

local node_config = {
  {
    type = 'pwa-node',
    request = 'launch',
    name = 'Launch file',
    program = '${file}',
    cwd = '${workspaceFolder}',
  },
}
dap.configurations.javascript = node_config
dap.configurations.typescript = node_config
