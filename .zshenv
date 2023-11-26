# Default editor is neovim
export EDITOR="nvim"

# On macOS, add the binaries from Homebrew to the PATH
if [[ "$OSTYPE" = darwin* ]]; then
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi
