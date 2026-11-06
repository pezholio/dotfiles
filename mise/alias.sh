#!/bin/bash

function mise() {
  local is_settings_add=false
  if [[ "${1-}" == "settings" && "${2-}" == "add" ]]; then
    is_settings_add=true
  fi

  command mise "$@" || return $?

  if [[ "$is_settings_add" == true ]]; then
    dotfiles_create_pr_for_file \
      "mise/config.toml" \
      "mise-settings" \
      "Update mise settings" \
      "Update mise settings after running: mise $*" \
      "Updates mise settings after running \`mise $*\`."
  fi
}
