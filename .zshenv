[[ -n "$JAVA_HOME" ]] && export JDK_HOME="$JAVA_HOME"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.tiup/bin:$PATH"

[[ -f "$HOME/.zshsecret" ]] && source "$HOME/.zshsecret"
