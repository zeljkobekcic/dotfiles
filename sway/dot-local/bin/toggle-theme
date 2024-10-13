#!/bin/bash

XDG_CONFIG_DIR="$HOME/.config/"

function gtk_dark() {
	gsettings set org.gnome.desktop.interface color-scheme prefer-dark
	gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
}

function gtk_light() {
	gsettings set org.gnome.desktop.interface color-scheme prefer-light
	gsettings set org.gnome.desktop.interface gtk-theme Adwaita
}

function kitty_apply() {
	ss -l -x | grep 'kitty' | awk '{ print($5) }' | xargs -I % kitten @ load-config --to unix:%
}

function kitty_dark() {
	ln --symbolic --force "$XDG_CONFIG_DIR/kitty/colors-catpuccin-mocha.conf" "$XDG_CONFIG_DIR/kitty/colors.conf"
}

function kitty_light() {
	ln --symbolic --force "$XDG_CONFIG_DIR/kitty/colors-catpuccin-latte.conf" "$XDG_CONFIG_DIR/kitty/colors.conf"
}

function mako_apply() {
	makoctl reload
}

function mako_dark() { 
	cat "$XDG_CONFIG_DIR/mako/config-base" "$XDG_CONFIG_DIR/mako/config-catpuccin-mocha" > "$XDG_CONFIG_DIR/mako/config"
}

function mako_light() {
	cat "$XDG_CONFIG_DIR/mako/config-base" "$XDG_CONFIG_DIR/mako/config-catpuccin-latte" > "$XDG_CONFIG_DIR/mako/config"
}

function sway_apply() {
	swaymsg reload
}

function sway_dark() {
	ln --symbolic --force "$XDG_CONFIG_DIR/sway/colors-catpuccin-mocha" "$XDG_CONFIG_DIR/sway/colors"
}

function sway_light() {
	ln --symbolic --force "$XDG_CONFIG_DIR/sway/colors-catpuccin-latte" "$XDG_CONFIG_DIR/sway/colors"
}

function wofi_dark() {
	ln --symbolic --force "$XDG_CONFIG_DIR/wofi/config-catpuccin-mocha" "$XDG_CONFIG_DIR/wofi/style.css"
}

function wofi_light() {
	ln --symbolic --force "$XDG_CONFIG_DIR/wofi/config-catpuccin-latte" "$XDG_CONFIG_DIR/wofi/style.css"
}

STATE_FILE="$HOME/.local/state/theme-toggle/state.json"

function setup() {
	if [ -f "$STATE_FILE" ]
	then
		return
	fi

	mkdir -p "$(dirname $STATE_FILE)"
	echo '{"theme": "dark"}' > "$STATE_FILE"
}

function set_theme() {
	state="$(cat $STATE_FILE)"
	echo "$state" | jq --arg t "$theme" '.theme = $t' > "$STATE_FILE"
}


function get_theme() {
	current="$(jq -r '.theme' "$STATE_FILE")"
	echo "$current"
}

theme=""
function process_args() {
	if [ -z "$1" ]
	then
		echo "Please provide the argument 'dark', 'light' or 'switch'"
		exit 1
	fi

	if [ "$1" == "light" ] || [ "$1" == "dark" ]
	then
		theme="$1"
	elif [ "$1" == "switch" ]; then
		current="$(get_theme)"
		theme="dark"
		if [ "$current" == "dark" ]
		then
			theme="light"
		fi
		echo "$theme"
	else
		echo "Unkown argument, please provide the argument 'dark', 'light' or 'switch'"
		exit 1
	fi
}

function main() {
	for f in $(declare -F | grep "$theme" | awk '{ print($3) }')
	do 
		echo "$f"
		"$f"
	done

	for f in $(declare -F | grep 'apply' | awk '{ print($3) }')
	do 
		echo "$f"
		"$f"
	done
}

setup
process_args "$@"
main
set_theme

