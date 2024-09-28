require "nvchad.mappings"

local map = vim.keymap.set

-- motions
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>", { desc = "jj exits insert mode" })

map("n", "<A-Left>", "<C-O>", { desc = "Go back" })
map("n", "<A-Right>", "<C-I>", { desc = "Go forward" })

-- telescope
map("n", "<leader>fc", require("telescope.builtin").commands, { desc = "Telescope Find commands" })
map("n", "<leader>fp", require("telescope.builtin").keymaps, { desc = "Telescope Keymaps (cmd palette)" })

-- terminal
map("t", "<C-j><C-j>", "<C-\\><C-n>")
map("n", "<leader>tt", ":terminal nu<CR>", { desc = "Terminal open nushell terminal", silent = true })
