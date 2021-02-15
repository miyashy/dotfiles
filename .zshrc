# Load zpulg
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# plugins
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "mafredri/zsh-async", from:github
zplug "zsh-users/zsh-syntax-highlighting", defer:2 #compinit以降に読み込み

#Themes : This one works
zplug "scotchg/agnoster-dark", use:agnoster.zsh-theme, as:theme
#zplug "yous/lime"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
# zplug load --verbose

# set completion setting
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt auto_list 
setopt auto_menu
setopt list_types

bindkey "^[[Z" reverse-menu-complete

# set history setting
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# 直前のコマンドの重複を削除
setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# 同時に起動したzshの間でヒストリを共有
setopt share_history


# set alias
alias gs='cd $(ghq root)/$(ghq list | peco)'
alias ll='ls -l'
alias la='ls -la'
# setup anyenv
eval "$(anyenv init -)"
