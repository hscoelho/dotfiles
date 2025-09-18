return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      local map = vim.keymap.set
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
      map({ 'n', 'x' }, 's', '<Nop>')

      require('mini.pairs').setup {
        mappings = {
          ['('] = { action = 'open', pair = '()', neigh_pattern = '.%s' },
          ['['] = { action = 'open', pair = '[]', neigh_pattern = '.%s' },
          ['{'] = { action = 'open', pair = '{}', neigh_pattern = '.%s' },

          [')'] = { action = 'close', pair = '()', neigh_pattern = '.%s' },
          [']'] = { action = 'close', pair = '[]', neigh_pattern = '.%s' },
          ['}'] = { action = 'close', pair = '{}', neigh_pattern = '.%s' },

          ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '.%s', register = { cr = false } },
          ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '.%s', register = { cr = false } },
          ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '.%s', register = { cr = false } },
        },
      }

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
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

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      require('mini.files').setup {
        mappings = {
          go_in = 'L',
          go_in_plus = 'l',
        },
      }
      require('mini.pick').setup()
      require('mini.icons').setup()
      require('mini.extra').setup()

      local cmd = function(cmd)
        return '<cmd>' .. cmd .. '<cr>'
      end

      map('n', '<Leader>e', function()
        if not require('mini.files').close() then
          require('mini.files').open()
        end
      end, { desc = 'File explorer' })
      map('n', '<leader>ff', cmd 'Pick files', { desc = 'Mini Pick Files' })
      map('n', '<C-n>', cmd 'Pick oldfiles', { desc = 'Mini Pick Oldfiles' })
      map('n', '<leader>fo', cmd 'Pick oldfiles', { desc = 'Mini Pick Oldfiles' })
      map('n', '<leader>ft', cmd 'Pick colorschemes', { desc = 'Mini Pick Theme' })
      map('n', '<leader>fg', cmd 'Pick grep_live', { desc = 'Mini Pick Grep live' })
      map('n', '<leader>fh', cmd 'Pick help', { desc = 'Mini Pick Help' })
      map('n', '<leader>fk', cmd 'Pick keymaps', { desc = 'Mini Pick Keymaps' })
      map('n', '<leader>fd', cmd 'Pick diagnostic', { desc = 'Mini Pick Diagnostics' })
      map('n', '<leader>fr', cmd 'Pick resume', { desc = 'Mini Pick Resume' })
      map('n', '<leader>fb', cmd 'Pick buffers', { desc = 'Mini Pick Buffers' })

      -- lsp
      map('n', 'grr', cmd "Pick lsp scope='references'", { desc = '[G]oto [R]eferences' })
      map('n', 'gi', cmd "Pick lsp scope='implementation'", { desc = '[G]oto [I]mplementation' })
      map('n', 'gd', cmd "Pick lsp scope='definition'", { desc = '[G]oto [D]efinition' })
      map('n', 'gD', cmd "Pick lsp scope='declaration'", { desc = '[G]oto [D]eclaration' })
      map('n', 'gO', cmd "Pick lsp scope='document_symbol'", { desc = 'Open Document Symbols' })
      map('n', 'gW', cmd "Pick lsp scope='workpsace_symbol'", { desc = 'Open Workspace Symbols' })
      map('n', 'gt', cmd "Pick lsp scope='type_definition'", { desc = '[G]oto [T]ype Definition' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
