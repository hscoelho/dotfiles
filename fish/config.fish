set -x SHELL /usr/bin/fish
fish_add_path ~/.pixi/bin
fish_add_path ~/.local/bin

starship init fish | source
zoxide init fish | source
mise activate fish | source

alias lazyjj="~/code/lazyjj/target/release/lazyjj"
alias cat="echo 'Use > bat'"

