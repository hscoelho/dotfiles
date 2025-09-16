-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)
return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = util.list_insert_unique(opts.ensure_installed, { 'firefox-debug-adapter', 'chrome-debug-adapter' })
    end,
  },
  {
    'miroshQa/debugmaster.nvim',
    -- osv is needed if you want to debug neovim lua code. Also can be used
    -- as a way to quickly test-drive the plugin without configuring debug adapters
    dependencies = { 'mfussenegger/nvim-dap', 'jbyuki/one-small-step-for-vimkind' },
    config = function()
      local dm = require 'debugmaster'
      dm.plugins.ui_auto_toggle.enabled = false
      dm.plugins.osv_integration.enabled = true -- needed if you want to debug neovim lua code

      -- Alternative keybindings to "<leader>d" could be: "<leader>m", "<leader>;"
      vim.keymap.set({ 'n', 'v' }, '<leader>dd', dm.mode.toggle, { desc = 'Debugmaster: Toggle debug mode', nowait = true })
      -- If you want to disable debug mode in addition to leader+d using the Escape key:
      -- vim.keymap.set("n", "<Esc>", dm.mode.disable)
      -- This might be unwanted if you already use Esc for ":noh"
      -- vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

      local cmd = function(cmd)
        return '<cmd>' .. cmd .. '<CR>'
      end

      vim.keymap.set('n', '<F5>', cmd 'DapContinue', { desc = 'Debug: Start/Continue' })
      vim.keymap.set('n', '<Leader>dc', cmd 'DapContinue', { desc = 'Debug: Start/Continue' })
      vim.keymap.set('n', '<F1>', cmd 'DapStepInto', { desc = 'Debug: Step Into' })
      vim.keymap.set('n', '<F2>', cmd 'DapStepOver', { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<F3>', cmd 'DapStepOut', { desc = 'Debug: Step Out' })
      vim.keymap.set('n', '<leader>db', cmd 'DapToggleBreakpoint', { desc = 'Debug: Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>dB', function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = 'Debug: Set Breakpoint' })

      -- breakpoints icons
      vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
      vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
      local breakpoint_icons = { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
      for type, icon in pairs(breakpoint_icons) do
        local tp = 'Dap' .. type
        local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
        vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
      end

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

      -- TODO: Create a PR in the repo
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
    end,
  },
}
