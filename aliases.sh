#!/bin/bash

alias a="atom ."
alias t="gittower ."
alias c="code ."

function bi() {
  echo "==> Installing $1"
  brew install "$@"
  echo "==> Adding $1 to the Brewfile"
  brew bundle dump --force
  echo "==> Committing and pushing changes"
  git add Brewfile
  git commit -a -m "Adding $1 to the Brewfile"
  git push
}

function bu() {
  echo "==> Uninstalling $1"
  brew install "$@"
  echo "==> Removing $1 from the Brewfile"
  brew bundle dump --force
  echo "==> Committing and pushing changes"
  git add Brewfile
  git commit -a -m "Removing $1 from the Brewfile"
  git push
}
