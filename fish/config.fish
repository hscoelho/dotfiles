if status is-interactive
    # Commands to run in interactive sessions can go here
    # set ZELLIJ_AUTO_ATTACH true
    # set ZELLIJ_AUTO_EXIT true
    # eval (zellij setup --generate-auto-start fish | string collect)
end
fish_add_path ~/.pixi/bin
fish_add_path /home/linuxbrew/.linuxbrew/bin

starship init fish | source
zoxide init fish | source
