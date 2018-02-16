# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
if ! which complete > /dev/null; then
  autoload -U bashcompinit
  bashcompinit
fi
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

[ -r "$HOME/.asdf/completions/asdf.bash" ] && source $HOME/.asdf/completions/asdf.bash

# Openshift-CLI completions
if which oc > /dev/null; then
  source <(oc completion zsh)
fi
