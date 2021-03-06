# Export variables
export EDITOR=/usr/bin/vim

# Bash colors
export CLICOLOR=1
export TERM=xterm-256color
export LSCOLORS=ExFxBxDxCxegedabagacad

# Erlang/Elixir Env Vars
export ERL_AFLAGS="-kernel shell_history enabled"

# Magic Space
bind Space:magic-space

# Alias commands
alias g='git'
alias md5sum='md5'
alias sha1='openssl sha1'
alias grep='grep --color=auto'
alias ps?='ps aux | grep'
alias uuidfull='uuid=$(uuidgen | tr [:upper:] [:lower:]) && echo $uuid && printf $uuid | pbcopy'
alias uuid='uuid=$(uuidgen | tr [:upper:] [:lower:] | sed s/-//g) && echo $uuid && printf $uuid | pbcopy'
alias ls='ls -FG'
alias ll='ls -l'
alias la='ls -a'
alias lal='ls -al'
alias vi='mvim -v'
alias vim='mvim -v'
alias diff='git diff --no-index'

# Functions
mcd() { mkdir -p "$1"; cd "$1"; }
cls() { cd "$1"; ls; }
backup() { cp "$1"{,.bak}; }
md5check() { md5 "$1" | grep "$2"; }
extract() {
  DIR=$2
  [[ -z $DIR ]] && [[ -d $DIR ]] || mkdir $DIR
  if [ -z $DIR ] ; then
    DIR="."
  fi
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1 -C $DIR    ;;
      *.tar.gz)    tar xzf $1 -C $DIR    ;;
      *.bz2)       bunzip2 $1     ;;
      # *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1 -C $DIR     ;;
      *.tbz2)      tar xjf $1 -C $DIR    ;;
      *.tgz)       tar xzf $1 -C $DIR    ;;
      *.jar)       unzip $1 -d $DIR      ;;
      *.war)       unzip $1 -d $DIR      ;;
      *.ear)       unzip $1 -d $DIR      ;;
      *.zip)       unzip $1 -d $DIR      ;;
      *.Z)         uncompress $1  ;;
      # *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via extract()"
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}
trash () { command mv "$@" ~/.Trash ; }

# Git Bash completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Load in the git branch prompt script.
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

# asdf command completion
. $(brew --prefix asdf)/asdf.sh
. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash

#Fancy Bash Prompt
LINE==========================
export PS1="\[\e[0;90m\]\n\t\e[1;38;5;202m\] $LINE\[\e[0;90m\]\n[\u@\h]\[\e[0m\] \W\n\[\e[38;5;202m\]$(__git_ps1) $\[\e[0m\] "
