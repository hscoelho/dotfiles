#!/usr/bin/env nu

let dotfiles_dir = $env.FILE_PWD
let home_dir = get_home_dir

def main [] {
  print "the script should be executed like: nu install.nu <cmd>"
}

def "main link" [] {
  print "configuring dotfiles"
  link_nvim
  link_wezterm
  # link_nushell
}

def link_nvim [] {
  print "removing old nvim config and linking new"

  if (is_windows) {
    rm -rf ~\AppData\Local\nvim
    rm -rf ~\AppData\Local\nvim-data

    link_folder $"($home_dir)\\AppData\\Local\\nvim" $"($dotfiles_dir)\\nvim"
  } else if (is_linux) {
    rm -rf ~\.config\nvim

    link_folder $"($home_dir)/.config/nvim" $"($dotfiles_dir)/nvim"
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

def is_windows [] {
  return ($nu.os-info.name == "windows")
}

def is_linux [] {
  return ($nu.os-info.name == "linux")
}

def link_folder [
  existing_folder: string 
  link_destination: string
] {
  print $"linking ($link_destination) to ($existing_folder)"
  if (is_windows) {
    mklink /d $existing_folder $link_destination
  } else if (is_linux) {
    ln -s $link_destination $existing_folder 
  }
}

def get_home_dir [] {
  if (is_windows) {
    $env.HOMEPATH
  } else if (is_linux) {
    $env.HOME
  } else {
    ""
  }
}
