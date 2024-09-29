#!/usr/bin/env nu

def "main windows" [] {
  print "installing dotfiles for windows"
  print "configuring neovim"
  # configure_nvim_windows
  print "configuring wezterm"
  configure_wezterm_windows
}

def "main ubuntu" [] {
  print "not yet implemented!"
  #print "installing dotfiles for windows"
}

let dotfiles_dir = pwd
let home_dir = get_home_dir
def get_home_dir [] {
  #todo: add linux
  $env.HOMEPATH
}

def main [] {
  print "the script should be executed like: nu install.nu <os>"
  print "<os> can be windows or ubuntu"
}

def link_folder [
  existing_folder: string 
  link_destination: string
] {
  # todo: add linux cmd
  print "linking..."
  print $existing_folder
  print $link_destination
  mklink /d $existing_folder $link_destination
}

def configure_nvim_windows [] {
  # print "installing neovim"
  # winget install Neovim.neovim

  print "cleaning old nvim config"
  rm -rf ~\AppData\Local\nvim
  rm -rf ~\AppData\Local\nvim-data

  print "symlinking config"
  let curr_dir = pwd
  mklink /d ~\AppData\Local\nvim $"($dotfiles_dir)\\neovim"
}

def configure_wezterm_windows [] {
  # print "installing wezterm"
  # winget install ...

  print "cleaning old wezterm config"
  rm -rf ~\.config\wezterm

  print "symlinking config"
  link_folder $"($home_dir)\\.config\\wezterm" $"($dotfiles_dir)\\wezterm"
}

