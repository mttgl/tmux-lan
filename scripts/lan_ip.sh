#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"


function print_lan_ip() {
	if is_wsl; then
		echo $(ip route get 1 | cut -d' ' -f7 | head -n 1)
		return
	elif is_osx; then
		echo $(ifconfig en0| grep "inet[ ]" | awk '{print $2}')
		return
	elif is_linux; then
		echo $(ip route get 1 | cut -d' ' -f7 | head -n 1)
		return
	fi
}

main() {
	print_lan_ip
}
main
