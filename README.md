# zdotdir

My `$ZDOTDIR` dotfiles directory, which contains my zsh configuration.

The plugin manager used is [Antidote](https://github.com/mattmc3/antidote/).

This is based off of [mattmc3's zdotdir](https://github.com/mattmc3/zdotdir) and [Antidote's zdotdir](https://github.com/getantidote/zdotdir) repos.

# Install

Clone this repo:

```sh
git clone git@github.com:Kuruyia/zdotdir.git ~/.config/zsh
```

Change the `ZDOTDIR` in the `~/.zshenv` file:

> [!WARNING]  
> This will overwrite your current `~/.zshenv` file. If needed, backup it somewhere else first.

```sh
cat << 'EOF' >| ~/.zshenv
export ZDOTDIR="$HOME/.config/zsh"
[[ -s "$ZDOTDIR/.zshenv" ]] && source "$ZDOTDIR/.zshenv"
EOF
```

Some tools need to be installed for this configuration to work properly.

On macOS:

```sh
brew install starship curlie bat eza
```

On Arch Linux:

```sh
pacman -S starship curlie bat eza
```

# Update

To update Antidote and its plugins, run:

```sh
antidote update
```

# Plugins
- [Zephyr - Small Zsh framework](https://github.com/mattmc3/zephyr)
    - **clipboard** - System clipboard integration
    - **color** - Make terminal things more colorful
    - **completion** - Load and initialize the built-in zsh completion system
    - **confd** - Source conf.d like Fish
    - **directory** - Set options and aliases related to the dirstack and filesystem
    - **editor** - Override and fill in the gaps of the default keybinds
    - **history** - Load and initilize the built-in zsh history system
    - **homebrew** - Functionality for users of Homebrew
    - **prompt** - Load and initialize the build-in zsh prompt system
    - **terminal** - Set terminal window and tab titles
    - **utility** - Common shell utilities, aimed at making cross platform work less painful
    - **zfunctions** - Lazy load functions dir like Fish
- [zsh-completions - Additional completion definitions for Zsh](https://github.com/zsh-users/zsh-completions)
- [fast-syntax-highlighting - Feature-rich syntax highlighting for ZSH](https://github.com/zdharma-continuum/fast-syntax-highlighting)
- [zsh-autosuggestions - Fish-like autosuggestions for zsh](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-autopair - Auto-close and delete matching delimiters in zsh](https://github.com/hlissner/zsh-autopair)
