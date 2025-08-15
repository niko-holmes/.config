#!/usr/bin/env bash

# DESC: Delete any local branches with remotes that no longer exist. Intended use-case is to run after
#       `git remote prune` to remote the local versions of any pruned remote branches.
# ARGS: None
# OUTS: None
# RETS: None
function git_clean_local_branches() {
    local branches_to_delete
    branches_to_delete="$(git branch --verbose --verbose | grep ': gone]' | awk '{print $1}')"

    if [ -z "$branches_to_delete" ]; then
        printf 'Found no local branches with pruned remotes\n'
    else
        git branch --delete --force "$branches_to_delete"
    fi
}
