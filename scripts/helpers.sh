#!/usr/bin/env bash
command_exists() {
	local command="$1"
	type "$command" >/dev/null 2>&1
}

get_tmux_option() {
	local option="$1"
	local default_value="$2"
	local option_value="$(tmux show-option -gqv "$option")"
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

is_linux() {
	[ $(uname) == "Linux" ]
}

is_osx() {
	[ $(uname) == "Darwin" ]
}

is_wsl() {
	version=$(</proc/version)
	if [[ "$version" == *"Microsoft"* || "$version" == *"microsoft"* ]]; then
		return 0
	else
		return 1
	fi
}
