# Homebrew prefix をキャッシュ（brew --prefix は遅いため直接パス判定）
if [[ -z "$HOMEBREW_PREFIX" ]]; then
  if [[ -x /opt/homebrew/bin/brew ]]; then
    export HOMEBREW_PREFIX="/opt/homebrew"
  elif [[ -x /usr/local/bin/brew ]]; then
    export HOMEBREW_PREFIX="/usr/local"
  fi
fi

[[ -n "$JAVA_HOME" ]] && export JDK_HOME="$JAVA_HOME"

# PATH設定（重複防止付き）
typeset -U path
path=(
  "$HOME/.local/bin"
  "${KREW_ROOT:-$HOME/.krew}/bin"
  "$HOMEBREW_PREFIX/opt/mysql-client/bin"
  "$HOME/.tiup/bin"
  $path
)

# fzf デフォルト設定
export FZF_DEFAULT_OPTS='
  --height=60%
  --layout=reverse
  --border
  --info=inline
'
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:300 {} 2>/dev/null || cat {}'"
export FZF_CTRL_R_OPTS='--sort --exact'
export FZF_ALT_C_OPTS="--preview 'eza -T --level=2 --icons {} 2>/dev/null || ls {}'"

# シークレット
[[ -f "$HOME/.zshsecret" ]] && source "$HOME/.zshsecret"
