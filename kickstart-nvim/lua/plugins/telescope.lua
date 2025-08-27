return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-tree/nvim-web-devicons' },
      { 'nvim-telescope/telescope-frecency.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      {
        -- If encountering errors, see telescope-fzf-native README for installation instructions
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
    },
    opts = {
      --  All the info you're looking for is in `:help telescope.setup()`
      defaults = {
        layout_config = {
          prompt_position = 'top',
        },
        sorting_strategy = 'ascending',
      },
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
        -- ['ui-select'] = {
        --   require('telescope.themes').get_dropdown(),
        -- },
        frecency = {
          previewer = false,
        },
      },
      -- mappings = {
      -- },
    },
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    keys = {
      { '<leader>fh', require('telescope.builtin').help_tags, desc = '[F]ind [H]elp' },
      { '<leader>fk', require('telescope.builtin').keymaps, desc = '[F]ind [K]eymaps' },
      { '<leader>ff', require('telescope.builtin').find_files, desc = '[F]ind [F]iles' },
      { '<leader>fF', '<cmd>Telescope frecency workspace=CWD<CR>', desc = '[F]ind [F]iles frecency' },
      { '<leader>fs', require('telescope.builtin').builtin, desc = '[F]ind [S]elect Telescope' },
      { '<leader>fw', require('telescope.builtin').grep_string, desc = '[F]ind current [W]ord' },
      { '<leader>fg', require('telescope.builtin').live_grep, desc = '[F]ind by [G]rep' },
      { '<leader>fd', require('telescope.builtin').diagnostics, desc = '[F]ind [D]iagnostics' },
      { '<leader>fr', require('telescope.builtin').resume, desc = '[F]ind [R]esume' },
      { '<leader>fb', require('telescope.builtin').buffers, desc = '[F]ind [b]uffers' },
      { '<leader>f.', require('telescope.builtin').oldfiles, desc = '[F]ind Recent Files ("." for repeat)' },
      { '<leader>fo', require('telescope.builtin').oldfiles, desc = '[F]ind Recent Files ("." for repeat)' },
      { '<C-n>', require('telescope.builtin').buffers, desc = '[F]ind [b]uffers' },
      {
        '<leader>/',
        function()
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end,
        desc = '[/] Fuzzily search in current buffer',
      },
      {
        '<leader>f/',
        function()
          require('telescope.builtin').live_grep {
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files',
          }
        end,
        desc = '[F]ind [/] in Open Files',
      },
      {
        '<leader>fn',
        function()
          require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
        end,
        desc = '[F]ind [N]eovim files',
      },
    },
    config = function()
      pcall(require('telescope').load_extension, 'frecency')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'fzf')
      require('telescope').setup(opts)
    end
  },
}
-- vim: ts=2 sts=2 sw=2 et
