set -x SHELL /usr/bin/fish
fish_add_path ~/.pixi/bin
fish_add_path ~/.local/bin

starship init fish | source
zoxide init fish | source
mise activate fish | source

alias cat="bat"
alias rdp-win='xfreerdp /network:lan /gfx:avc444 /dynamic-resolution +clipboard'
alias rdp-vpn='xfreerdp /network:auto /gfx:avc420 +compression +bitmap-cache +clipboard'

alias rdp-docker='rdp-win /v:127.0.0.1:3389 /u:hcoelho /d:'

