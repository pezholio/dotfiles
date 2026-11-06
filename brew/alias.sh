#!/bin/bash

function brew() {
  local action="${1-}"
  local dotfiles_dir="$HOME/.dotfiles"

  command brew "$@" || return $?

  case "$action" in
    install|uninstall)
      (
        set -e
        cd "$dotfiles_dir"
        command brew bundle dump --force

        if [[ -n "${BREW_SKIP_GIT+x}" ]]; then
          printf 'BREW_SKIP_GIT is set; skipping git and pull request actions.\n'
          exit 0
        fi

        dotfiles_create_pr_for_file \
          "Brewfile" \
          "brew-update" \
          "Update Brewfile after brew $action" \
          "Update Brewfile after $action $*" \
          "Updates Brewfile after running \`brew $*\`."
      )
      ;;
  esac
}
