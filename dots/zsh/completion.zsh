# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

[ -r "$HOME/.asdf/completions/asdf.bash" ] && source $HOME/.asdf/completions/asdf.bash

[ -r /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh ] && source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

# Openshift-CLI completions
if which oc > /dev/null; then
  source <(oc completion zsh)
fi

autoload -U +X bashcompinit && bashcompinit
