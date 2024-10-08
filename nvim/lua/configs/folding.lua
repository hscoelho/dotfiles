-- executed when nvim-ufo starts

vim.o.foldcolumn = "0"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- mappings
local map = vim.keymap.set
map("n", "zR", require("ufo").openAllFolds)
map("n", "zM", require("ufo").closeAllFolds)
map("n", "<Space><Space>", require("fold-cycle").toggle_all)

require("fold-cycle").setup()

require("ufo").setup {
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
}

-- TODO: Mudar essa função para fechar apenas functions!
-- local function applyFoldsAndThenCloseAllFolds(bufnr, providerName)
--   require "async"(function()
--     bufnr = bufnr or vim.api.nvim_get_current_buf()
--     -- make sure buffer is attached
--     require("ufo").attach(bufnr)
--     -- getFolds return Promise if providerName == 'lsp'
--     local ranges = await(require("ufo").getFolds(bufnr, providerName))
--     local ok = require("ufo").applyFolds(bufnr, ranges)
--     if ok then
--       require("ufo").closeAllFolds()
--     end
--   end)
-- end
-- vim.api.nvim_create_autocmd("BufRead", {
--   pattern = "*",
--   callback = function(e)
--     applyFoldsAndThenCloseAllFolds(e.buf, "treesitter")
--   end,
-- })
