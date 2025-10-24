if vim.g.vscode then
  return
end
-- TODO: when neovim is updated to 0.12: replace lazy with first party pack

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup {
  -- themes
  { 'ellisonleao/gruvbox.nvim', lazy = false },
  { 'rebelot/kanagawa.nvim', lazy = false },
  { 'daschw/leaf.nvim', lazy = false },
  { 'catppuccin/nvim', name = 'catppuccin', lazy = false },
  { 'neanias/everforest-nvim', lazy = false },
  { 'loctvl842/monokai-pro.nvim', lazy = false },
  -- LSP
  { 'neovim/nvim-lspconfig', lazy = false },
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false,
  },
  { 'folke/lazydev.nvim', lazy = false },
  { 'mfussenegger/nvim-lint', lazy = false },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    branch = 'master',
    lazy = false,
  },
  {
    'b0o/schemastore.nvim',
    lazy = false,
  },
  -- Completion
  {
    'saghen/blink.cmp',
    lazy = false,
    version = '1.*',
  },
  { 'rafamadriz/friendly-snippets', lazy = false },
  {
    'L3MON4D3/LuaSnip',
    lazy = false,
    version = '2.*',
    build = (function()
      -- Build Step is needed for regex support in snippets.
      -- This step is not supported in many windows environments.
      -- Remove the below condition to re-enable on windows.
      if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
        return
      end
      return 'make install_jsregexp'
    end)(),
  },
  -- Formatting
  { 'stevearc/conform.nvim', lazy = false },
  -- Debugging
  { 'mfussenegger/nvim-dap', lazy = false },
  { 'miroshQa/debugmaster.nvim', lazy = false },
  { 'jbyuki/one-small-step-for-vimkind', lazy = false },
  { 'stevearc/overseer.nvim', lazy = false },
  -- Testing
  { 'nvim-neotest/neotest', lazy = false },
  { 'antoinemadec/FixCursorHold.nvim', lazy = false },
  { 'nvim-neotest/nvim-nio', lazy = false },
  -- package manager
  { 'mason-org/mason.nvim', lazy = false },
  { 'WhoIsSethDaniel/mason-tool-installer.nvim', lazy = false },
  -- Finder
  { 'ibhagwan/fzf-lua', lazy = false },
  --
  { 'Bekaboo/dropbar.nvim', lazy = false },
  -- Notifications
  { 'folke/noice.nvim', lazy = false },
  { 'MunifTanjim/nui.nvim', lazy = false },
  -- Folding
  { 'chrisgrieser/nvim-origami', lazy = false },
  -- Misc
  { 'echasnovski/mini.nvim', lazy = false },
  { 'nvim-lua/plenary.nvim', lazy = false },
  { 'lewis6991/gitsigns.nvim', lazy = false },
  { 'nmac427/guess-indent.nvim', lazy = false },
  { 'wakatime/vim-wakatime', lazy = false },
  { 'folke/which-key.nvim', lazy = false },
  { 'folke/todo-comments.nvim', lazy = false },
  { 'windwp/nvim-autopairs', lazy = false },
  { 'windwp/nvim-ts-autotag', lazy = false },
  { 'akinsho/toggleterm.nvim', lazy = false },
  -- indent
  { 'nmac427/guess-indent.nvim', lazy = false },
  { 'lukas-reineke/indent-blankline.nvim', lazy = false },
  -- markdown/obsidian
  { 'MeanderingProgrammer/render-markdown.nvim', lazy = false },
  { 'epwalsh/obsidian.nvim', lazy = false },
  { 'julienvincent/hunk.nvim', lazy = false },
}
