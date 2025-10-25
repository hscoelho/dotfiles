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
}

local FzfObsidianCommands = function()
  local cmds = {
    'ObsidianOpen',
    'ObsidianNew',
    'ObsidianQuickSwitch',
    'ObsidianFollowLink',
    'ObsidianBacklink',
    'ObsidianTags',
    'ObsidianToday',
    'ObsidianYesterday',
    'ObsidianTommorow',
    'ObsidianDailies',
    'ObsidianTemplate',
    'ObsidianSearch',
    'ObsidianLink',
    'ObsidianLinkNew',
    'ObsidianLinks',
    'ObsidianExtractNote',
    'ObsidianWorkspace',
    'ObsidianPasteImg',
    'ObsidianRename',
    'ObsidianToggleCheckbox',
    'ObsidianCheck',
    'ObsidianNewFromTemplate',
    'ObsidianTOC',
  }
  require('fzf-lua').fzf_exec(cmds, {
    actions = {
      ['default'] = function(selected, _)
        vim.cmd(selected[1])
      end,
    },
  })
end
vim.api.nvim_create_user_command('FzfObsidianCommands', FzfObsidianCommands, {
  desc = 'Obsidian commands',
})
