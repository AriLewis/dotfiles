#
# ~/.bashrc
#
eval "$(starship init bash)"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colors
source ~/.cache/hellwal/variables.sh
sh ~/.cache/hellwal/terminal.sh



function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
