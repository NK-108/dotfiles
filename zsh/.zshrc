# (cat ~/.cache/wal/sequences &)
# export LS_COLORS="$(vivid generate gruvbox-dark)"

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 0
zstyle ':completion:*' menu select=1
zstyle ':completion:*' prompt 'Corrections (%e Errors)'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/moss/.zshrc'

export ZSH='$HOME/.oh-my-zsh'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

if [ -f ~/.aliases ] ; then
    source ~/.aliases
fi

PS1='[%n@%m %~]$ '

eval $(ssh-agent -s) > /dev/null 2>&1
ssh-add ~/.ssh/github > /dev/null 2>&1

export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"

export LD_LIBRARY_PATH=/home/moss/dev/lib
export LIB=/home/moss/dev/lib
export INCLUDE=/home/moss/dev/include

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

floatrun() {
    hyprctl dispatch -- exec "[float; center]" "$@"
}

