# load overrides
if [ -f ~/.bash_overrides ]; then
. ~/.bash_overrides
fi

# load exports
if [ -f ~/.bash_exports ]; then
. ~/.bash_exports
fi

# load aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# bash completion for git etc.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Rbenv initialisation
eval "$(rbenv init - --no-rehash)"
if [ -f ~/.rbenv/completions/rbenv.bash ]; then
. ~/.rbenv/completions/rbenv.bash
fi
