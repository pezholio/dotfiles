#!/bin/bash
# shellcheck source=/dev/null

# Oh my zsh
. "$HOME/.dotfiles/ohmyzsh.sh"
. "$HOME/.dotfiles/utils.sh"
# Ruby and rbenv stuff
. "$HOME/.dotfiles/ruby/aliases.sh"
. "$HOME/.dotfiles/ruby/rbenv.sh"
# Python Stuff
. "$HOME/.dotfiles/python/pyenv.sh"
. "$HOME/.dotfiles/python/poetry.sh"
# Nodenv Stuff
. "$HOME/.dotfiles/node/nodenv.sh"
# Goenv Stuff
. "$HOME/.dotfiles/go/goenv.sh"
# Docker things
. "$HOME/.dotfiles/docker/aliases.sh"
# Add QT to path
. "$HOME/.dotfiles/qt/qt.sh"
# Add secrets
. "$HOME/.dotfiles/secrets.sh"
# Some useful aliases
. "$HOME/.dotfiles/aliases.sh"

# Dalmatian CLI
. "$HOME/.dotfiles/dalmatian.sh"

