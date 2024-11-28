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
  link_nushell
  link_starship
}

def link_nvim [] {
  print "removing old nvim config and linking new"

  if (is_windows) {
    rm -rf ~\AppData\Local\nvim
    rm -rf ~\AppData\Local\nvim-data

    mklink /d $"($home_dir)\\AppData\\Local\\nvim" $"($dotfiles_dir)\\nvim"
  } else if (is_linux) {
    rm -rf ~/.config/nvim

    ln -T -s $"($dotfiles_dir)/nvim" $"($home_dir)/.config/nvim" 
  }
}

def link_wezterm [] {
  if (is_windows) {
    print "removing old wezterm config and linking new"
    rm -rf ~\.config\wezterm

    print "symlinking config"
    mklink /d $"($home_dir)\\.config\\wezterm" $"($dotfiles_dir)\\wezterm"
  }
  # linux nao precisa por enquanto pq uso o wsl
}

def "main link_nushell" [] {
  link_nushell
}

def link_nushell [] {
  rm -rf $nu.default-config-dir
  if (is_windows) {
    mklink /d $nu.default-config-dir $"($dotfiles_dir)\\nushell"
  } else if (is_linux) {
    ln -s -T $"($dotfiles_dir)/nushell" $nu.default-config-dir
  }
}

def "main link_starship" [] {
  link_starship
}

def link_starship [] {
  rm -f ~/.config/starship.toml
  if (is_windows) {
    mklink $"($home_dir)\\.config\\starship.toml" $"($dotfiles_dir)\\starship\\starship.toml"
  } else if (is_linux) {
    ln -s -T $"($dotfiles_dir)/starship/starship.toml" $"($home_dir)/.config/starship.toml"
  }

}

def "main link_komorebi" [] {
  link_komorebi
}

def link_komorebi [] {
  if (is_windows) {
    rm -rf ~\\.config\\komorebi
    mklink /d ~\\.config\\komorebi $"($dotfiles_dir)\\komorebi"
  }
}

def is_windows [] {
  return ($nu.os-info.name == "windows")
}

def is_linux [] {
  return ($nu.os-info.name == "linux")
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
