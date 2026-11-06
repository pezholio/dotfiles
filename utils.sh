#!/bin/bash

update_terminal_cwd() {
    # Identify the directory using a "file:" scheme URL,
    # including the host name to disambiguate local vs.
    # remote connections. Percent-escape spaces.
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
}

dotfiles_create_pr_for_file() {
    local file="$1"
    local branch_prefix="$2"
    local title="$3"
    local commit_message="$4"
    local pr_body="$5"
    local dotfiles_dir="$HOME/.dotfiles"

    (
        set -e
        cd "$dotfiles_dir"

        local diff_status
        if git diff --quiet HEAD -- "$file"; then
            printf '%s is unchanged; no pull request needed.\n' "$file"
            exit 0
        else
            diff_status=$?
            if [[ "$diff_status" -ne 1 ]]; then
                exit "$diff_status"
            fi
        fi

        local branch pr_url answer
        branch="${branch_prefix}-$(date +%Y%m%d-%H%M%S)"

        git switch -c "$branch"
        git add -- "$file"
        git commit -m "$commit_message" -- "$file"
        git push --set-upstream origin "$branch"
        pr_url=$(gh pr create --title "$title" --body "$pr_body")

        printf 'Created pull request: %s\n' "$pr_url"
        if [[ -t 0 ]]; then
            printf 'Open the PR now to review it? [y/N] ' >&2
            IFS= read -r answer || answer=""
            case "$answer" in
                [Yy]*) gh pr view "$pr_url" --web ;;
            esac
        else
            printf 'Please review the PR: %s\n' "$pr_url"
        fi

        git switch main
    )
}
