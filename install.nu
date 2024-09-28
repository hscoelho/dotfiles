#!/usr/bin/env nu

# myscript.nu
def "main windows" [] {
  print "installing dotfiles for windows"
  print "configuring neovim"
  nvim_windows
}

def "main ubuntu" [] {
  print "not yet implemented!"
  #print "installing dotfiles for windows"
}

# important for the command to be exposed to the outside
def main [] {
  print "the script should be executed like: nu install.nu <os>"
  print "<os> can be windows or ubuntu"
}

def nvim_windows [] {
  # print "installing neovim"
  # winget install Neovim.neovim

  print "cleaning old nvim config"
  rm -rf ~\AppData\Local\nvim
  rm -rf ~\AppData\Local\nvim-data

  print "symlinking config"
  let curr_dir = pwd
  mklink /d ~\AppData\Local\nvim $"($curr_dir)\\neovim"
}

