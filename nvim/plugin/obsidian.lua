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
  sync = {
    enabled = true,
  },
  footer = {
    enabled = false,
  },
  daily_notes = {
    folder = '4Daily Notes',
    workdays_only = false,
  },
  legacy_commands = false,
  checkbox = {
    enabled = true,
    create_new = true,
    order = { ' ', '/', 'x' },
  },
}
