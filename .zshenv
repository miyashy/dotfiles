export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export JDK_HOME="$JAVA_HOME"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PLANTUML_LIMIT_SIZE=8192
export GOROOT=$HOME/.anyenv/envs/goenv/versions/$GO_VERSION
export GOPATH=$HOME/dev
export PATH=$HOME/.anyenv/envs/goenv/shims/bin:$PATH
export PATH=$GOROOT/bin:$PATH
export PATH=$GOPATH/bin:$PATH
