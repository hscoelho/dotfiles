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
