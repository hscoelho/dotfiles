# See https://www.nushell.sh/book/configuration.html
# You can open this file in your default editor using:
#     config nu
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

## Aliases
#  misc
alias cat = bat
alias zellij = zellij -l welcome
alias jl = just --justfile justfile.local

# RDP (microsoft remote machine)
alias rdp-local = xfreerdp /network:lan /gfx:avc444 /dynamic-resolution +clipboard
alias rdp-net = xfreerdp /network:auto /gfx:avc420 +compression /dynamic-resolution +clipboard
alias rdp-vm = rdp-local /v:127.0.0.1:3389 /u:hcoelho /d:
alias rdp-elipse = rdp-net /v:henrique /u:henrique /d:


## Env 
$env.SHELL = 'nu'
$env.EDITOR = 'nvim'

## Nushell config
$env.config.show_banner = false
$env.config.buffer_editor = 'nvim'


## Tools config
# starship config
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
# zoxide config
source ~/.zoxide.nu
# mise
use ($nu.default-config-dir | path join mise.nu)
# TODO: zellij (zri for example)

## Completions
source ./nu_scripts/custom-completions/bat/bat-completions.nu
source ./nu_scripts/custom-completions/just/just-completions.nu
source ./nu_scripts/custom-completions/zoxide/zoxide-completions.nu
source ./nu_scripts/custom-completions/zellij/zellij-completions.nu

## Jujutsu completions
# jj util completion nushell | save -f "completions-jj.nu"
use "completions-jj.nu" *  # Or `source "completions-jj.nu"`

## Theming
# I think not setting the theme and letting it use default term colors is better for now
# use ./nu_scripts/themes/nu-themes/gruvbox-light-medium.nu 
# gruvbox-light-medium set color_config
# However, it could be a good idea to set LS_COLORS (since in windows it's not good)

## Custom commands
use ./code_review.nu *

$env.path ++= ["~/.opencode/bin"]
