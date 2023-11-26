# Keep 20000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=20000
SAVEHIST=20000
HISTFILE=$ZDOTDIR/.zsh_history

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Set the word chars manually as we don't want some characters to be considered as part of a word
WORDCHARS='*?_-~&;!#$%^:'

# Don't highlight when pasting
zle_highlight=('paste:none')

# Key bindings
typeset -g -A key
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Home]}"          ]] && bindkey -- "${key[Home]}"          beginning-of-line
[[ -n "${key[End]}"           ]] && bindkey -- "${key[End]}"           end-of-line
[[ -n "${key[Insert]}"        ]] && bindkey -- "${key[Insert]}"        overwrite-mode
[[ -n "${key[Backspace]}"     ]] && bindkey -- "${key[Backspace]}"     backward-delete-char
[[ -n "${key[Delete]}"        ]] && bindkey -- "${key[Delete]}"        delete-char
[[ -n "${key[Up]}"            ]] && bindkey -- "${key[Up]}"            up-line-or-beginning-search
[[ -n "${key[Down]}"          ]] && bindkey -- "${key[Down]}"          down-line-or-beginning-search
[[ -n "${key[Left]}"          ]] && bindkey -- "${key[Left]}"          backward-char
[[ -n "${key[Right]}"         ]] && bindkey -- "${key[Right]}"         forward-char
[[ -n "${key[PageUp]}"        ]] && bindkey -- "${key[PageUp]}"        beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"      ]] && bindkey -- "${key[PageDown]}"      end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"     ]] && bindkey -- "${key[Shift-Tab]}"     reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Zstyle
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' rehash true

# Source nvm scripts if installed
NVM_SCRIPT_PATH="/usr/share/nvm/init-nvm.sh"
[[ -s "$NVM_SCRIPT_PATH" ]] && source "$NVM_SCRIPT_PATH"

NVM_DIR="$([[ -z "${XDG_CONFIG_HOME-}" ]] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

if [[ -d $NVM_DIR ]]; then
    export NVM_DIR="$NVM_DIR"

    # Load nvm and its shell completions
    [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
    [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
fi

# Source fzf scripts if installed
FZF_KEY_BINDINGS_SCRIPT_PATH="/usr/share/fzf/key-bindings.zsh"
FZF_COMPLETION_SCRIPT_PATH="/usr/share/fzf/completion.zsh"

[[ -s "$FZF_KEY_BINDINGS_SCRIPT_PATH" ]] && source "$FZF_KEY_BINDINGS_SCRIPT_PATH"
[[ -s "$FZF_COMPLETION_SCRIPT_PATH" ]] && source "$FZF_COMPLETION_SCRIPT_PATH"

# Source cargo script if installed
CARGO_ENV_SCRIPT="$HOME/.cargo/env"
[[ -s "$CARGO_ENV_SCRIPT" ]] && source "$CARGO_ENV_SCRIPT"

# Source orbstack script if installed
ORBSTACK_INIT_SCRIPT="$HOME/.orbstack/shell/init.zsh"
[[ -s "$ORBSTACK_INIT_SCRIPT" ]] && source "$ORBSTACK_INIT_SCRIPT"

### Added by Zinit's installer
if [[ ! -s "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# Zinit plugins
zinit light-mode for \
    as"command" from"gh-r" atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" atpull"%atclone" src"init.zsh" \
    starship/starship \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit wait lucid light-mode for \
    atinit"zicompinit; zicdreplay" zdharma-continuum/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' zsh-users/zsh-completions \
    from"gh-r" as"null" sbin"**/bat -> bat" atload="alias l='exa -lag --git'" @sharkdp/bat \
    from"gh-r" as"null" sbin"**/exa -> exa" atload="alias cat='bat -P'" ogham/exa \
    from="gh-r" as"null" sbin"**/curlie -> curlie" atload="alias curl='curlie'" rs/curlie hlissner/zsh-autopair

zinit ice as"completion"
zinit snippet "https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker"

# Aliases
alias vim="nvim"
alias v="nvim"

if [[ "$OSTYPE" = linux* ]]; then
    alias open="xdg-open"
    alias ip='ip -c'
fi
