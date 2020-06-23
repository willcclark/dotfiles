# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
autoload -Uz compinit promptinit
compinit
promptinit
PROMPT='%F{blue}%1~%f %# '
zstyle ':completion:*' menu select
EDITOR=vim
setopt autocd autopushd pushdignoredups
export PATH=$PATH:/home/willclark/.gem/ruby/2.7.0/bin
export PATH=$PATH:/home/willclark/bin
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
source .zsh/aliasrc
source .zsh/zkbdrc
ufetch-arch
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
