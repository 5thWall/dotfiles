export LC_CTYPE=en_US.UTF-8

# Aliases and functions
alias love="/Applications/love.app/Contents/MacOS/love"
alias ls='ls++'
alias sl='/bin/ls -G'
alias iwant='sudo brew install'

function mkcd() {
  mkdir -p "$1" && cd "$1"
}

function hl() {
  source-highlight -f esc -n -i "$1" -o STDOUT | less -R
}

# FASD
eval "$(fasd --init auto)"

# Star Trek. 'Cause I'm a nerd.
alias engage='play -n -c1 synth whitenoise lowpass -1 120 lowpass -1 120 lowpass -1 120 gain +14'

# GIT
## github
alias git=hub
. ~/.ghub

## Bash-completion
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
. /usr/local/etc/bash_completion.d/git-completion.bash
fi

## Branch Coloring
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

git_branch_color()
{
  if git diff --quiet 2>/dev/null >&2; then
    echo -ne ${c_green};
  else
    echo -ne ${c_red};
  fi
}

PS1="\h:\W\$(git_branch_color)\$(__git_ps1)\${c_sgr0} \u\$ "

## GIT-FLOW Bash completiong
if [ -f /usr/local/etc/bash_completion.d/git-flow-completion.bash ]; then
. /usr/local/etc/bash_completion.d/git-flow-completion.bash
fi

# Pathing stuffs
## Make brew override system defaults
export PATH=/usr/local/bin:$PATH

## RVM
[[ -s "/Users/Andy/.rvm/scripts/rvm" ]] && source "/Users/Andy/.rvm/scripts/rvm"  # This loads RVM into a shell session.
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
