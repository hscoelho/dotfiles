if vim.g.vscode then
  return
end

local lint = require 'lint'
lint.linters_by_ft = {
  -- markdown = { 'vale', 'markdownlint' },
  -- text = { 'vale' },
  typescript = { 'eslint' },
}

-- Create autocommand which carries out the actual linting
-- on the specified events.
local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    -- Only run the linter in buffers that you can modify in order to
    -- avoid superfluous noise, notably within the handy LSP pop-ups that
    -- describe the hovered symbol using Markdown.
    if vim.bo.modifiable then
      lint.try_lint()
    end
  end,
})
