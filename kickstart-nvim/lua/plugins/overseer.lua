return {
  'stevearc/overseer.nvim',
  opts = {},
  keys = {
    {
      '<Leader>ot',
      '<cmd>OverseerToggle<CR>',
      mode = 'n',
      desc = '[O]verseer: Toggle task [o]utput',
    },
    {
      '<Leader>or',
      '<cmd>OverseerRun<CR>',
      mode = 'n',
      desc = '[O]verseer: Select and [r]un task',
    },
  },
}
