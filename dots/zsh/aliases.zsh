# Reload the bash script
alias reload='source ~/.zshrc'

# nvim is vim
alias e=$EDITOR

# Alias elm-format so it's usefull
alias elm-format='elm-format-0.18'

# Show last few files
alias lf='ls -lrt | tail -6'

# Get stuff from brew
alias iwant='brew install'

# Run a webserver in current dir on port 5000
alias serveme='ruby -run -e httpd . -p 5000'

# Open all git merge-conflicts in editor
alias fix='$EDITOR `git diff --name-only | uniq`'

# Star Trek
alias engage='say engage; play -n -c1 synth whitenoise lowpass -1 120 lowpass -1 120 lowpass -1 120 gain +14'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Apps
alias byword='open -a Byword'
alias marked='open -a Marked'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done

# http://xkcd.com/530/
alias shutup="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"

#################
# Suffix Aliases
#################

alias -s rb=e
