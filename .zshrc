# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Plugins ---
eval "$(sheldon source)"

# --- Completion ---
autoload -Uz compinit
# 1日1回だけcompinit再構築（起動高速化）
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}No matches%f'

setopt auto_list
setopt auto_menu
setopt list_types
setopt complete_in_word
setopt always_to_end

# --- Keybindings ---
bindkey "^[[Z" reverse-menu-complete

# fzf キーバインド統合（Ctrl+R: 履歴検索, Ctrl+T: ファイル検索, Alt+C: ディレクトリ移動）
if [[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh" ]]; then
  source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
fi
if [[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh" ]]; then
  source "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh"
fi

# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt share_history
setopt inc_append_history

# --- Aliases ---
alias gs='cd $(ghq root)/$(ghq list | fzf --preview "ls -la $(ghq root)/{}")'
alias ll='ls -l'
alias la='ls -la'

# --- Tools ---
# mise（バージョンマネージャー）
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
fi

# git-wt
if command -v git-wt &>/dev/null; then
  eval "$(git wt --init zsh)"
fi

# --- Theme ---
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
