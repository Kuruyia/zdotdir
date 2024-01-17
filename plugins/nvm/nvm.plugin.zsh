#
# nvm - Sources the NVM init script
#

NVM_SCRIPT_PATH="/usr/share/nvm/init-nvm.sh"
[[ -s "$NVM_SCRIPT_PATH" ]] && source "$NVM_SCRIPT_PATH"

NVM_DIR="$HOME/.nvm"

if [[ -d "$NVM_DIR" ]]; then
  export NVM_DIR="$NVM_DIR"

  # Load nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
fi

# vim: ft=zsh sw=2 ts=2 et
