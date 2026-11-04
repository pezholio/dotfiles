#!/bin/bash

alias a="atom ."
alias t="gittower ."
alias c="code ."

function brew() {
  local action="${1-}"
  local dotfiles_dir="$HOME/.dotfiles"

  command brew "$@" || return $?

  case "$action" in
    install|uninstall)
      (
        cd "$dotfiles_dir" &&
          command brew bundle dump --force &&
          git add Brewfile &&
          git commit -m "Update Brewfile after brew $action $*" &&
          git push
      )
      ;;
  esac
}
