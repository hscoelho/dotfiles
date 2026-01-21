if vim.g.vscode then
  return
end

require('obsidian').setup {
  workspaces = {
    {
      name = 'Obsidian',
      path = '~/Obsidian',
    },
  },
  footer = {
    enabled = false,
  },
  daily_notes = {
    folder = 'Daily Notes',
    workdays_only = false,
  },
  legacy_commands = false,
  checkbox = {
    enabled = true,
    create_new = true,
    order = { ' ', '/', 'x' },
  },
}
