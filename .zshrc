# Created by newuser for 5.8
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
# Ruby rbenv
eval "$(rbenv init -)"

# ALIASES
#alias ls='ls --color=auto'
#alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
#alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias cat=bat
alias ls="exa --icons"
alias ll="exa -ahl --icons"
alias lg=lazygit
alias tp=telepresence
alias k=kubectl
setxkbmap -option caps:swapescape
# java home
export JAVA_HOME=/usr/lib/jvm/default
export GOPATH=/home/vmkevv/go
export PATH=$PATH:/home/vmkevv/go/bin
export PATH=$PATH:/home/vmkevv/.cargo/bin
export PATH=$PATH:/home/vmkevv/.local/share/gem/ruby/3.0.0/bin
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

if [ -f ${HOME}/.zplug/init.zsh ]; then
    source ${HOME}/.zplug/init.zsh
fi

# PLUGINS
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# spaceship config
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_GCLOUD_SHOW=false


# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vmkevv/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
. "$HOME/.cargo/env"
