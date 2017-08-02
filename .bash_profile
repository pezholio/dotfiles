# Ruby and rbenv stuff
. ~/.dotfiles/ruby/aliases.bash
. ~/.dotfiles/ruby/rbenv.bash
# Add QT to path
. ~/.dotfiles/qt/qt.bash
# Bash Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
# @pikesley's fancy gitprompt
. ~/.dotfiles/gitprompt/gitprompt
