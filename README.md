# zdotdir

My `$ZDOTDIR` dotfiles directory, which contains my zsh configuration.

# Install

Clone this repo:

```sh
git clone git@github.com:Kuruyia/zdotdir.git ~/.config/zsh
```

Change the `ZDOTDIR` in the `~/.zshenv` file:

```sh
cat << 'EOF' >| ~/.zshenv
export ZDOTDIR="$HOME/.config/zsh"
[[ -s "$ZDOTDIR/.zshenv" ]] && source "$ZDOTDIR/.zshenv"
EOF
```
