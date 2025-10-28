if vim.g.vscode then
  return
end

require('render-markdown').setup()
require('obsidian').setup {
  workspaces = {
    {
      name = 'Obsidian',
      path = '~/Obsidian',
    },
  },
  ui = {
    enable = false,
  },
  daily_notes = {
    folder = 'Daily Notes',
    workdays_only = false,
  },
  legacy_commands = false,
}

local FzfObsidianCommands = function()
  local cmds = {
    'open',
    'new',
    'new_from_template',
    'quick_switch',
    'backlink',
    'tags',
    'today',
    'yesterday',
    'tomorrow',
    'dailies',
    'template',
    'search',
    'workspace',
    'check',
  }
  require('fzf-lua').fzf_exec(cmds, {
    actions = {
      ['default'] = function(selected, _)
        vim.cmd('Obsidian ' .. selected[1])
      end,
    },
  })
end
vim.api.nvim_create_user_command('FzfObsidianCommands', FzfObsidianCommands, {
  desc = 'Obsidian commands',
})
