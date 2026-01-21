set -x SHELL /usr/bin/fish
fish_add_path ~/.pixi/bin
fish_add_path ~/.local/bin

starship init fish | source
zoxide init fish | source
mise activate fish | source

alias cat="bat"
alias rdp-local='xfreerdp /network:lan /gfx:avc444 /dynamic-resolution +clipboard'
alias rdp-net='xfreerdp /network:auto /gfx:avc420 +compression /dynamic-resolution +clipboard'
alias zellij="zellij -l welcome"

alias rdp-vm='rdp-local /v:127.0.0.1:3389 /u:hcoelho /d:'
alias rdp-elipse='rdp-net /v:henrique /u:henrique /d:'

