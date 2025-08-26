return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
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

      require('mini.files').setup()
      vim.keymap.set('n', '<Leader>e', function()
        if not require('mini.files').close() then
          require('mini.files').open()
        end
      end, { desc = 'File explorer' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
