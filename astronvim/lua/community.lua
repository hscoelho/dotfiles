-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- languages
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.angular" },

  -- themes
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },

  -- ui
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.file-explorer.mini-files" },
  { import = "astrocommunity.fuzzy-finder.telescope-nvim" },
}
