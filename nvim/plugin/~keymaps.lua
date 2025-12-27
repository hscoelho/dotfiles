local map = vim.keymap.set
local cmd = function(cmd)
  return '<cmd>' .. cmd .. '<CR>'
end

map('i', 'jj', '<Esc>', { desc = 'Exit insert mode' })
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Finder (fzf-lua)
-- Pickers
map('n', '<leader>ff', cmd 'FzfLua files', { desc = '[F]ind Files' })
map('n', '<leader>fp', cmd 'FzfLua global', { desc = '[F]ind Global(vscode-like)' })
map('n', '<C-n>', cmd 'FzfLua oldfiles', { desc = 'Find Oldfiles' })
map('n', '<leader>fo', cmd 'FzfLua oldfiles', { desc = '[F]ind Oldfiles' })
map('n', '<leader>fc', cmd 'FzfLua colorschemes', { desc = '[F]ind colorschemes' })
map('n', '<leader>fg', cmd 'FzfLua live_grep', { desc = '[F]ind Live Grep' })
map('n', '<leader>fh', cmd 'FzfLua helptags', { desc = '[F]ind Help' })
map('n', '<leader>fk', cmd 'FzfLua keymaps', { desc = '[F]ind Keymaps' })
map('n', '<leader>fd', cmd 'FzfLua git_diff', { desc = '[F]ind Git [d]iff files' })
map('n', '<leader>fe', cmd 'FzfLua diagnostic', { desc = '[F]ind [E]rror Diagnostics' })
map('n', '<leader>fr', cmd 'FzfLua resume', { desc = '[F]ind Resume' })
map('n', '<leader>fb', cmd 'FzfLua buffers', { desc = '[F]ind Buffers' })
map('n', '<leader>fn', cmd 'FzfSnacksNotifications', { desc = '[F]ind notifications' })
map('n', '<leader>ft', cmd 'TermSelect', { desc = '[F]ind Terminal' })
-- LSP Pickers
map('n', 'grr', cmd 'FzfLua lsp_references', { desc = '[G]oto [R]eferences' })
map('n', 'gi', cmd 'FzfLua lsp_implementations', { desc = '[G]oto [I]mplementation' })
map('n', 'gd', cmd 'FzfLua lsp_definitions', { desc = '[G]oto [D]efinition' })
map('n', 'gD', cmd 'FzfLua lsp_declarations', { desc = '[G]oto [D]eclaration' })
map('n', 'gO', cmd 'FzfLua lsp_document_symbols', { desc = 'Open Document Symbols' })
map('n', 'gW', cmd 'FzfLua lsp_workpsace_symbols', { desc = 'Open Workspace Symbols' })
map('n', 'gt', cmd 'FzfLua lsp_type_definitions', { desc = '[G]oto [T]ype Definition' })

-- Navigation
map('n', ']c', cmd 'Gitsigns nav_hunk next', { desc = 'Next diff change (hunk)' })
map('n', '[c', cmd 'Gitsigns nav_hunk prev', { desc = 'Previous diff change (hunk)' })

-- Notifications
map('n', '<leader>n', require('snacks').notifier.show_history, { desc = '[H]istory: [N]otifications' })

-- LSP Actions
map('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'LSP: Code rename' })
map({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP: Code action' })
map('n', '<leader>ch', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = '[T]oggle Inlay [H]ints' })

-- Obsidian
map('n', '<leader>oc', cmd 'FzfObsidianCommands', { desc = 'Obsidian: [C]ommands picker' })
map('n', '<leader>off', cmd 'Obsidian quick_switch', { desc = 'Obsidian: [F]ind notes' })
map('n', '<leader>on', cmd 'Obsidian new', { desc = 'Obsidian: [N]ew notes' })
map('n', '<leader>oft', cmd 'Obsidian tags', { desc = 'Obsidian: [T]ags' })
map('n', '<leader>ot', cmd 'Obsidian today', { desc = "Obsidian: [O]pen today's daily note" })
map('n', '<leader>oy', cmd 'Obsidian today', { desc = "Obsidian: [O]pen today's daily note" })
map('n', '<leader>ofd', cmd 'Obsidian dailies', { desc = 'Obsidian: [D]aily notes picker' })
map('n', '<leader>oo', cmd 'Obsidian open', { desc = 'Obsidian: Open Obsidian [A]pp' })

map('n', '<leader>io', function()
  require('snacks').image.hover()
end, { desc = '[I]mage [O]pen' })

-- Terminal
map('n', '<leader>tt', cmd 'ToggleTerm', { desc = '[T]erm: Toggle' })
map({ 'n', 't' }, '<C-t>', cmd 'ToggleTerm', { desc = '[T]erm: Toggle' })
map('n', '<leader>tn', cmd 'TermNew', { desc = '[T]erm: [N]ew' })
map('n', '<leader>td', cmd 'ToggleTermSetName', { desc = '[T]erm: [D]escribe' })

-- Task runner (Overseer)
map('n', '<Leader>rt', cmd 'OverseerRun', {
  desc = 'Task [R]unner(overseer): Run',
})
map('n', '<Leader>rr', cmd 'OverseerToggle', {
  desc = 'Task [R]unner(overseer): Toggle',
})

-- Neotest
map('n', '<Leader>xt', function()
  require('neotest').run.run()
end, {
  desc = '[E]xecute [t]est',
})

-- File explorer
map('n', '<Leader>e', function()
  if not require('mini.files').close() then
    require('mini.files').open()
  end
end, { desc = 'File explorer' })

-- Split navigation
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
map('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
map('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
map('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
map('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

-- Movements
map('n', '<A-Left>', '<C-O>', { desc = 'Go back' })
map('n', '<A-Right>', '<C-I>', { desc = 'Go forward' })

-- Folding
map('n', '<Leader><Leader>', 'za', { desc = 'Toggle fold' })

-- Formatting (conform)
map('n', '<leader>cf', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, {
  desc = '[C]ode [f]ormat buffer',
})

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc><Esc>', '<cmd>nohlsearch<CR>')

-- Debugging
-- debugmaster
map({ 'n', 'v' }, '<leader>dd', require('debugmaster').mode.toggle, { desc = 'Debugmaster: Toggle debug mode', nowait = true })
map('n', '<Esc>', require('debugmaster').mode.disable)
-- nvim-dap
map('n', '<F5>', cmd 'DapContinue', { desc = 'Debug: Start/Continue' })
map('n', '<Leader>dc', cmd 'DapContinue', { desc = 'Debug: Start/Continue' })
map('n', '<F1>', cmd 'DapStepInto', { desc = 'Debug: Step Into' })
map('n', '<F2>', cmd 'DapStepOver', { desc = 'Debug: Step Over' })
map('n', '<F3>', cmd 'DapStepOut', { desc = 'Debug: Step Out' })
map('n', '<leader>db', cmd 'DapToggleBreakpoint', { desc = 'Debug: Toggle Breakpoint' })
map('n', '<leader>dB', function()
  require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Dropbar
map('n', '<Leader>;', require('dropbar.api').pick, { desc = 'Pick symbols in winbar' })
map('n', '[;', require('dropbar.api').goto_context_start, { desc = 'Go to start of current context' })
map('n', '];', require('dropbar.api').select_next_context, { desc = 'Select next context' })
