#!/usr/bin/env nu

def "main link_config" [] {
  print "configuring dotfiles"
  link_nvim
  link_wezterm
  link_nushell
}

def "main install_pkgs" [] {
  print "not yet implemented!"
}

let dotfiles_dir = get_dotfiles_dir
let home_dir = get_home_dir
def get_home_dir [] {
  if (is_windows) {
    $env.HOMEPATH
  } else {
    "~"
  }
}

def get_dotfiles_dir [] {
  pwd
}

def main [] {
  print "the script should be executed like: nu install.nu <os>"
  print "<os> can be windows or ubuntu"
}

def is_windows [] {
  $nu.os-info.name == "windows"
}

def is_linux [] {
  $nu.os-info.name == "linux"
}

def link_folder [
  existing_folder: string 
  link_destination: string
] {
  # todo: add linux cmd
  if is_windows {
    mklink /d $existing_folder $link_destination
  } else {

  }
}

def install_pkgs [] {
  # nushell nao precisa instalar pq precisa dele para rodar esse script

  # starship
  # zoxide
  # fzf
  if (is_windows) {
    let winget_pkgs = "Neovim.neovim wez.wezterm"
    winget install $winget_pkgs
  } else if (is_linux) {

  }
}


def link_nvim [] {
  print "removing old nvim config and linking new"

  if (is_windows) {
    rm -rf ~\AppData\Local\nvim
    rm -rf ~\AppData\Local\nvim-data

    link_folder ~\AppData\Local\nvim $"($dotfiles_dir)\\neovim"
  } else if (is_linux) {
    rm -rf ~\.config\nvim

    link_folder ~\.config\nvim $"($dotfiles_dir)\\neovim"
  }
}

def link_wezterm [] {
  if (is_windows) {
    print "removing old wezterm config and linking new"
    rm -rf ~\.config\wezterm

    print "symlinking config"
    link_folder $"($home_dir)\\.config\\wezterm" $"($dotfiles_dir)\\wezterm"
  }
  # linux nao precisa por enquanto pq uso o wsl
}

def link_nushell [] {
  # link_folder $nu.config-path $"($dotfiles_dir)\\nushell"
}
