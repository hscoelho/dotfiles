-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- This will load plugins from the lua/plugins folder
require('lazy').setup {
  { import = 'plugins' },
  { import = 'lang' },
}

-- vim: ts=2 sts=2 sw=2 et
