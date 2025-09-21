return {
  'ibhagwan/fzf-lua',
  config = function()
    local FzfLua = require 'fzf-lua'
    FzfLua.setup {
      winopts = {
        preview = {
          layout = 'vertical',
        },
      },
      oldfiles = {
        include_current_session = true,
      },
    }

    local cmd = function(cmd)
      return '<cmd>' .. cmd .. '<cr>'
    end
    local map = vim.keymap.set

    map('n', '<leader>ff', cmd 'FzfLua files', { desc = 'Fzf Files' })
    map('n', '<C-n>', cmd 'FzfLua oldfiles', { desc = 'Fzf Oldfiles' })
    map('n', '<leader>fo', cmd 'FzfLua oldfiles', { desc = 'Fzf Oldfiles' })
    map('n', '<leader>ft', cmd 'FzfLua colorschemes', { desc = 'Fzf Theme' })
    map('n', '<leader>fg', cmd 'FzfLua live_grep', { desc = 'Fzf Live Grep' })
    map('n', '<leader>fh', cmd 'FzfLua helptags', { desc = 'Fzf Help' })
    map('n', '<leader>fk', cmd 'FzfLua keymaps', { desc = 'Fzf Keymaps' })
    map('n', '<leader>fd', cmd 'FzfLua diagnostic', { desc = 'Fzf Diagnostics' })
    map('n', '<leader>fr', cmd 'FzfLua resume', { desc = 'Fzf Resume' })
    map('n', '<leader>fb', cmd 'FzfLua buffers', { desc = 'Fzf Buffers' })
    map('n', '<leader>fn', cmd 'FzfLua notifications', { desc = 'Fzf Notifications' })

    -- lsp
    map('n', 'grr', cmd 'FzfLua lsp_references', { desc = '[G]oto [R]eferences' })
    map('n', 'gi', cmd 'FzfLua lsp_implementations', { desc = '[G]oto [I]mplementation' })
    map('n', 'gd', cmd 'FzfLua lsp_definitions', { desc = '[G]oto [D]efinition' })
    -- map('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
    map('n', 'gD', cmd 'FzfLua lsp_declarations', { desc = '[G]oto [D]eclaration' })
    -- map('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
    map('n', 'gO', cmd 'FzfLua lsp_document_symbols', { desc = 'Open Document Symbols' })
    map('n', 'gW', cmd 'FzfLua lsp_workpsace_symbols', { desc = 'Open Workspace Symbols' })
    map('n', 'gt', cmd 'FzfLua lsp_type_definitions', { desc = '[G]oto [T]ype Definition' })
  end,
}
