#!/bin/bash

alias a="atom ."
alias t="gittower ."
alias c="code ."

function brew() {
  local action="${1-}"

  command brew "$@" || return $?

  case "$action" in
    install|uninstall)
      command brew bundle dump --force || return $?
      git add Brewfile &&
        git commit -m "Update Brewfile after brew $action $*" &&
        git push
      ;;
  esac
}
