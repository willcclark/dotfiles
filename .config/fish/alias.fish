# # apps... but better
alias vim=nvim
alias ls=exa

# git
abbr -a gs  git status -sb
abbr -a ga  git add
abbr -a gc  git commit
abbr -a gcm git commit -m
abbr -a gca git commit --amend
abbr -a gcl git clone
abbr -a gco git checkout
abbr -a gp  git push
abbr -a gpl git pull
abbr -a gl  git l
abbr -a gd  git diff
abbr -a gds git diff --staged
abbr -a gr  git rebase -i HEAD~15
abbr -a gf  git fetch
abbr -a gfc git findcommit
abbr -a gfm git findmessage
abbr -a gco git checkout

# ls
alias l='ls -l'
alias ll='ls -la'
alias lt='ls --tree'

# misc
alias reload='exec fish'
alias open='xdg-open'
alias oo='xdg-open .'
alias o="xdg-open"

### ALIASES ###
# Use neovim for vim if present.
alias vim="nvim"

# Verbosity and settings that you pretty much just always are going to want.
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vi"
alias mkd="mkdir -pv"

# Colorize commands when possible.
alias grep="grep --color=auto"
alias diff="diff --color=auto"

# These common commands are just too long! Abbreviate them.
alias ka="killall"
alias g="git"
alias pf="poweroff ; or sudo poweroff"
alias rb="reboot ; or sudo reboot"
alias e="$EDITOR"
alias v="$EDITOR"
alias d="sudo dnf"

# navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
