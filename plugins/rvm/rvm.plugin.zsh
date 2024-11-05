#
# rvm - Sources the RVM init script
#

RVM_SCRIPT_PATH="$HOME/.rvm/scripts/rvm"
[[ -s "$RVM_SCRIPT_PATH" ]] && source "$RVM_SCRIPT_PATH"

export PATH="$PATH:$HOME/.rvm/bin"

# vim: ft=zsh sw=2 ts=2 et
