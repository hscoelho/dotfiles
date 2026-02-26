# config.nu
#
# Installed by:
# version = "0.110.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R


$env.config.show_banner = false
$env.config.buffer_editor = 'nvim'
$env.SHELL = 'nu'
$env.EDITOR = 'nvim'
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
source ~/.zoxide.nu

source ./nu_scripts/custom-completions/bat/bat-completions.nu
source ./nu_scripts/custom-completions/jj/jj-completions.nu
source ./nu_scripts/custom-completions/just/just-completions.nu
source ./nu_scripts/custom-completions/zoxide/zoxide-completions.nu
source ./nu_scripts/custom-completions/zellij/zellij-completions.nu

# I'm trying to set only the nushell theme but for some reason, this is making no difference in 
# wezterm in windows. need to check if this has any effect in ghostty or wezterm in linux
# either way, it's not completely necessary because using a terminal theme already accomplishes most of what I want
# use ./nu_scripts/themes/nu-themes/gruvbox-light-medium.nu
# gruvbox-light-medium set color_config
