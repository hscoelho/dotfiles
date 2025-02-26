-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("i", "jj", "<ESC>", { desc = "jj exits insert mode" })

-- back and forward
map("n", "<A-Left>", "<C-O>", { desc = "Go back" })
map("n", "<A-Right>", "<C-I>", { desc = "Go forward" })

map("n", "<C-n>", LazyVim.pick("oldfiles"), { desc = "Picker recent" })

map("n", "<leader><leader>", "za", { desc = "Toggle folding" })

map({ "n", "t" }, "<A-i>", "<cmd>Floaterm<CR>", { desc = "Floating terminal" })
-- telescope
-- map("n", "<leader>fc", require("telescope.builtin").commands, { desc = "Telescope Find commands" })
-- map("n", "<leader>fp", require("telescope.builtin").keymaps, { desc = "Telescope Keymaps (cmd palette)" })
-- map("n", "<Tab>", require("telescope.builtin").oldfiles, { desc = "Telescope Oldfiles" })
