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

-- Firefox debugging
dap.adapters['firefox'] = {
  type = 'executable',
  command = vim.fn.exepath 'firefox-debug-adapter',
}

-- node and chrome
-- code modified from lazyvim
for _, adapterType in ipairs { 'node', 'chrome' } do
  local pwaType = 'pwa-' .. adapterType
  dap.adapters[pwaType] = {
    type = 'server',
    host = 'localhost',
    port = '${port}',
    executable = {
      command = 'js-debug-adapter',
      args = { '${port}' },
    },
  }

  -- Define adapters without the "pwa-" prefix for VSCode compatibility
  dap.adapters[adapterType] = function(cb, config)
    local nativeAdapter = dap.adapters[pwaType]

    config.type = pwaType

    if type(nativeAdapter) == 'function' then
      nativeAdapter(cb, config)
    else
      cb(nativeAdapter)
    end
  end
end

local js_filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }
local vscode = require 'dap.ext.vscode'
vscode.json_decode = require('json5').parse
vscode.type_to_filetypes['node'] = js_filetypes
vscode.type_to_filetypes['pwa-node'] = js_filetypes

-- dap.configurations.javascript = {
--   type = 'pwa-node',
--   request = 'launch',
--   name = 'Launch file',
--   program = '${file}',
--   cwd = '${workspaceFolder}',
--   sourceMaps = true,
--   skipFiles = {
--     '<node_internals>/**',
--     'node_modules/**',
--   },
--   resolveSourceMapLocations = {
--     '${workspaceFolder}/**',
--     '!**/node_modules/**',
--   },
-- }
-- dap.configurations.typescript = {
--   type = 'pwa-node',
--   request = 'launch',
--   name = 'Launch file',
--   program = '${file}',
--   cwd = '${workspaceFolder}',
--   sourceMaps = true,
--   runtimeExecutable = vim.fn.executable 'tsx' == 1 and 'tsx' or 'ts-node',
--   skipFiles = {
--     '<node_internals>/**',
--     'node_modules/**',
--   },
--   resolveSourceMapLocations = {
--     '${workspaceFolder}/**',
--     '!**/node_modules/**',
--   },
-- }
