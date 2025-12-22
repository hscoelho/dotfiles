default:
	just --list

link: neovim wezterm fish starship XCompose gitignore jujutsu
clean: neovim_clean wezterm_clean fish_clean starship_clean XCompose_clean gitignore_clean jujutsu_clean

neovim_folder := "~/.config/nvim"
neovim_dot := justfile_directory() + "/nvim/"
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

jj_folder := "~/.config/jj"
jj_dot := justfile_directory() + "/jj/"
jujutsu: (_link jj_dot jj_folder)
jujutsu_clean: (_clean_bkup jj_folder)

mise_folder := "~/.config/mise"
mise_dot := justfile_directory() + "/mise/"
mise: (_link mise_dot mise_folder)
mise_clean: (_clean_bkup mise_folder)

starship_file := "~/.config/starship.toml"
starship_dot := justfile_directory() + "/starship/starship.toml"
starship: (_link starship_dot starship_file)
starship_clean: (_clean_bkup starship_file)

XCompose_file := "~/.XCompose"
XCompose_dot := justfile_directory() + "/XCompose"
XCompose: (_link XCompose_dot XCompose_file)
XCompose_clean: (_clean_bkup XCompose_file)

gitignore_file := "~/.config/git/ignore"
gitignore_dot := justfile_directory() + "/global-gitignore"
gitignore: (_link gitignore_dot gitignore_file)
gitignore_clean: (_clean_bkup gitignore_file)

_link dot link_location:
	@echo "Creating a link at '{{link_location}}' to dotfile: '{{dot}}'"
	-mv {{link_location}} {{link_location}}_bkup
	ln -s {{dot}} {{link_location}}

_clean_bkup path:
	-rm -rf {{path}}_bkup


power:
	#!/usr/bin/env bash
	set -euo pipefail


	echo "→ Installing power profile policy files"
	sudo install -m 755 {{justfile_directory()}}/power/power-profile-policy.sh /usr/local/bin/
	sudo install -m 644 {{justfile_directory()}}/power/power-profile-boot.service /etc/systemd/system/
	sudo install -m 644 {{justfile_directory()}}/power/99-power-profile.rules /etc/udev/rules.d/

	echo "→ Reloading systemd and udev"
	sudo systemctl daemon-reload
	sudo systemctl enable power-profile-boot.service
	sudo udevadm control --reload

power_clean:
	#!/usr/bin/env bash
	set -euo pipefail

	sudo systemctl disable --now power-profile-boot.service || true

	sudo rm -f \
	/usr/local/bin/power-profile-policy.sh \
	/etc/systemd/system/power-profile-boot.service \
	/etc/udev/rules.d/99-power-profile.rules

	sudo systemctl daemon-reload
	sudo udevadm control --reload

