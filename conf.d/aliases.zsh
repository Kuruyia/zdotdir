#
# aliases - Zsh and bash aliases
#

# Single character aliases - be sparing!
alias l='eza -lag --git'
alias v='nvim'

# Mask built-ins with better defaults
alias vi='nvim'
alias cat='bat -P'
alias curl='curlie'

# Linux-specific aliases
if [[ "$OSTYPE" == linux* ]]; then
  alias open="xdg-open"
  alias ip='ip -c'
fi

# vim: ft=zsh sw=2 ts=2 et
