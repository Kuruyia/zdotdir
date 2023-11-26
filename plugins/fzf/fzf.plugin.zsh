#
# fzf - Sources the fzf init script
#

FZF_KEY_BINDINGS_SCRIPT_PATH="/usr/share/fzf/key-bindings.zsh"
FZF_COMPLETION_SCRIPT_PATH="/usr/share/fzf/completion.zsh"

[[ -s "$FZF_KEY_BINDINGS_SCRIPT_PATH" ]] && source "$FZF_KEY_BINDINGS_SCRIPT_PATH"
[[ -s "$FZF_COMPLETION_SCRIPT_PATH" ]] && source "$FZF_COMPLETION_SCRIPT_PATH"

# vim: ft=zsh sw=2 ts=2 et
