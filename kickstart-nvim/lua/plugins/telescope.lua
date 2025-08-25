return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = true },
    },
    config = function(_, opts)
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- Enable Telescope extensions if they are installed
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          layout_config = {
            prompt_position = 'top',
          },
          sorting_strategy = 'ascending',
        },
        -- mappings = {
        --   i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        -- },
        -- },
        pickers = {
          find_files = {
            previewer = false,
          },
          buffers = {
            sort_lastused = true,
            sort_mru = true,
            previewer = false,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local map = vim.keymap.set
      local telescope = require 'telescope.builtin'
      map('n', '<leader>fh', telescope.help_tags, { desc = '[F]ind [H]elp' })
      map('n', '<leader>fk', telescope.keymaps, { desc = '[F]ind [K]eymaps' })
      map('n', '<leader>ff', telescope.find_files, { desc = '[F]ind [F]iles' })
      map('n', '<leader>fs', telescope.builtin, { desc = '[F]ind [S]elect Telescope' })
      map('n', '<leader>fw', telescope.grep_string, { desc = '[F]ind current [W]ord' })
      map('n', '<leader>fg', telescope.live_grep, { desc = '[F]ind by [G]rep' })
      map('n', '<leader>fd', telescope.diagnostics, { desc = '[F]ind [D]iagnostics' })
      map('n', '<leader>fr', telescope.resume, { desc = '[F]ind [R]esume' })
      map('n', '<leader>fb', telescope.buffers, { desc = '[F]ind [b]uffers' })
      map('n', '<leader>f.', telescope.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
      map('n', '<leader>fo', telescope.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
      map('n', '<C-n>', telescope.buffers, { desc = '[F]ind [b]uffers' })

      -- Slightly advanced example of overriding default behavior and theme
      map('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        telescope.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      map('n', '<leader>f/', function()
        telescope.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[F]ind [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      map('n', '<leader>fn', function()
        telescope.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[F]ind [N]eovim files' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
