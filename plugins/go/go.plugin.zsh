#
# go - Exports golang directories
#

GOPATH="$HOME/go"

if [[ -d "$GOPATH" ]]; then
  export GOPATH="$GOPATH"
  export GOBIN="$GOPATH/bin"
  export PATH="$PATH:$GOBIN"
fi

# vim: ft=zsh sw=2 ts=2 et
