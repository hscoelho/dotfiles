#!/usr/bin/env nu

def main [
  app?: string@"nu-complete dotfiles"
  --dry-run
] {
  if ($app | is-empty) {
    help main
  } else {
    link_cfg $app $dry_run
  }
}

# To add a new config to link, simply add a row in this table
def dotfiles_config [] {
    [
        [name, dot_folder, app_folder];
        [neovim,   "nvim",                   "~/.config/nvim"]
        [nushell,  "nushell",                "~/.config/nushell"]
        [wezterm,  "wezterm",                "~/.config/wezterm"]
        [ghostty,  "ghostty",                "~/.config/ghostty"]
        [fish,     "fish",                   "~/.config/fish"]
        [jujutsu,  "jj",                     "~/.config/jj"]
        [mise,     "mise",                   "~/.config/mise"]
        [zellij,   "zellij",                 "~/.config/zellij"]
        [starship, "starship/starship.toml", "~/.config/starship.toml"]
        [XCompose, "XCompose",               "~/.XCompose"]
        [gitignore,"global-gitignore",       "~/.config/git/ignore"]
    ]
}

def link_cfg [app: string, dry_run: bool] {
  print $"Linking ($app)"
  let configs = if $app == "all" {
    dotfiles_config
  } else {
    dotfiles_config | where name == $app
  }

  for cfg in $configs {
    print $"------------"
    print $"($cfg.name)"
    print $"($cfg.dot_folder) ($cfg.app_folder)"
    create_link $cfg.dot_folder $cfg.app_folder $dry_run
  }
}

# This will only work if it's sourced in the nushell config I think
def "nu-complete dotfiles" [] {
    dotfiles_config | get name | append "all"
}

def create_link [dot_rel_path: string, app_path: string, dry_run: bool] {
  let target = $env.FILE_PWD | path join $dot_rel_path
  let link = $app_path | path expand -n
  let backup_path = ($link)_bkup
  print $"Backup: ($backup_path)"
  print $"Link:   ($link) -> ($target)"
  if $dry_run == false {
    rm -rf ($backup_path)
    mv $link $backup_path
    link $target $link
  } 
}

def link [target: string, link: string] {
  #  TODO: Make this cross-platform (use mklink in windows)
  ln -s $target $link
}
