#
# .zshrc - Run on interactive zsh session.
#

# Zstyles
[[ -r "$ZDOTDIR/.zstyles" ]] && source "$ZDOTDIR/.zstyles"

# Use Antidote for plugin management
export ANTIDOTE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}/antidote"
[[ -d "$ANTIDOTE_HOME/mattmc3/antidote" ]] || git clone --depth 1 --quiet https://github.com/mattmc3/antidote "$ANTIDOTE_HOME/mattmc3/antidote"

source "$ANTIDOTE_HOME/mattmc3/antidote/antidote.zsh"
antidote load

# vim: ft=zsh sw=2 ts=2 et
