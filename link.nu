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
    let jujutsu_config_path = jj config path --user
    [
        [name, dot_folder, app_folder];
        [neovim,   "nvim",                   "~/.config/nvim"]
        [nushell,  "nushell",                "~/.config/nushell"]
        [wezterm,  "wezterm",                "~/.config/wezterm"]
        [fish,     "fish",                   "~/.config/fish"]
        [jujutsu,  "jj",                     $jujutsu_config_path]
        [mise,     "mise",                   "~/.config/mise"]
        [zellij,   "zellij",                 "~/.config/zellij"]
        [starship, "starship/starship.toml", "~/.config/starship.toml"]
        [XCompose, "misc/XCompose",          "~/.XCompose"]
        [gitignore,"misc/user-gitignore",    "~/.config/git/ignore"]
        [kitty,    "kitty",                "~/.config/kitty"]
        [obsidian-sync, "misc/obsidian-sync.service", "~/.config/systemd/user/obsidian-sync.service"]
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
  let parent = $link | path dirname

  if ($parent | path type) != "dir" {
    mkdir $parent
  }

  let backup_path = ($link)_bkup
  print $"Backup: ($backup_path)"
  print $"Link:   ($link) -> ($target)"
  if $dry_run == false {
    if ($link | path type) != null {
      rm -rf ($backup_path)
      mv $link $backup_path
    }
    link $target $link
  } 
}

def link [target: string, link: string] {
  if $nu.os-info.name == "windows" {
    if ($target | path type) == "dir" {
      cmd /c mklink /D $link $target
    } else {
      cmd /c mklink $link $target
    }
  } else {
    ln -s $target $link
  }
}
