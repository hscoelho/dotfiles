default:
	just --list

link: neovim wezterm fish starship
clean: neovim_clean wezterm_clean fish_clean starship_clean

neovim_folder := "~/.config/nvim"
neovim_dot := justfile_directory() + "/lazyvim/"
neovim: (_link neovim_dot neovim_folder)
neovim_clean: (_clean_bkup neovim_folder)

wezterm_folder := "~/.config/wezterm"
wezterm_dot := justfile_directory() + "/wezterm/"
wezterm: (_link wezterm_dot wezterm_folder)
wezterm_clean: (_clean_bkup wezterm_folder)

fish_folder := "~/.config/fish"
fish_dot := justfile_directory() + "/fish/"
fish: (_link fish_dot fish_folder)
fish_clean: (_clean_bkup fish_folder)

starship_file := "~/.config/starship.toml"
starship_dot := justfile_directory() + "/starship/starship.toml"
starship: (_link starship_dot starship_file)
starship_clean: (_clean_bkup starship_file)

_link dot link_location:
	@echo "Creating a link at '{{link_location}}' to dotfile: '{{dot}}'"
	-mv {{link_location}} {{link_location}}_bkup
	ln -s {{dot}} {{link_location}}

_clean_bkup path:
	-rm -rf {{path}}_bkup

