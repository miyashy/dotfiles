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

# シークレット
[[ -f "$HOME/.zshsecret" ]] && source "$HOME/.zshsecret"
