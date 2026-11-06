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
# Sdkman initialization stuff (Java, Groovy, Scala, Kotlin, etc)
. "$HOME/.dotfiles/sdkman/sdkman.sh"
# Add brew function to update Brewfile and create PR
. "$HOME/.dotfiles/brew/alias.sh"

function sync_dotfiles_master() {
  (
    cd "$HOME/.dotfiles" || exit 1

    local changes
    changes=$(git status --porcelain) || exit 1
    if [[ -n "$changes" ]]; then
      printf 'Skipping dotfiles update: the worktree has uncommitted changes.\n' >&2
      exit 0
    fi

    git fetch --quiet origin master || exit 1
    if git show-ref --verify --quiet refs/heads/master; then
      git switch master || exit 1
    else
      git switch --track -c master origin/master || exit 1
    fi
    git pull --ff-only --quiet origin master
  ) || printf 'Could not switch to or update dotfiles master.\n' >&2
}

sync_dotfiles_master
