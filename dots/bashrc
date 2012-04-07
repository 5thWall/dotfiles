# Vars
export LC_CTYPE=en_US.UTF-8

## Make brew override system defaults
export PATH=/usr/local/bin:$PATH

## Set editor for tmuxinator
export EDITOR='mate -w'

# Aliases and functions
alias love="/Applications/love.app/Contents/MacOS/love"
alias ls='ls++'
alias sl='/bin/ls -G'
alias iwant='sudo brew install'
alias reload='source ~/.bashrc'

## Star Trek
alias engage='play -n -c1 synth whitenoise lowpass -1 120 lowpass -1 120 lowpass -1 120 gain +14'

## Make and change directory
function mkcd() {
  mkdir -p "$1" && cd "$1"
}

## Hilight source
function hl() {
  source-highlight -f esc -n -i "$1" -o STDOUT | less -R
}

# Progs
## FASD
eval "$(fasd --init auto)"

## GIT
### github
alias git=hub
. ~/.ghub

### Bash-completion
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
. /usr/local/etc/bash_completion.d/git-completion.bash
fi

### Branch Coloring
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

### GIT-FLOW Bash completiong
if [ -f /usr/local/etc/bash_completion.d/git-flow-completion.bash ]; then
. /usr/local/etc/bash_completion.d/git-flow-completion.bash
fi

## Tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

## RVM
[[ -s "/Users/Andy/.rvm/scripts/rvm" ]] && source "/Users/Andy/.rvm/scripts/rvm"  # This loads RVM into a shell session.
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting