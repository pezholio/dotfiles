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

        local diff_status
        if git diff --quiet HEAD -- Brewfile; then
          printf 'Brewfile is unchanged; no pull request needed.\n'
          exit 0
        else
          diff_status=$?
          if [[ "$diff_status" -ne 1 ]]; then
            exit "$diff_status"
          fi
        fi

        local branch title pr_url answer
        title="Update Brewfile after brew $action"
        branch="brew-update-$(date +%Y%m%d-%H%M%S)"

        git switch -c "$branch"
        git add -- Brewfile
        git commit -m "Update Brewfile after $action $*" -- Brewfile
        git push --set-upstream origin "$branch"
        pr_url=$(gh pr create --title "$title" --body "Updates Brewfile after running brew $*.")

        printf 'Created pull request: %s\n' "$pr_url"
        if [[ -t 0 ]]; then
          read -r -p "Open the PR now to review it? [y/N] " answer || answer=""
          case "$answer" in
            [Yy]*) gh pr view "$pr_url" --web ;;
          esac
        else
          printf 'Please review the PR: %s\n' "$pr_url"
        fi
      )
      ;;
  esac
}
