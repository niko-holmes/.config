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
        echo "$branches_to_delete" | xargs git branch --delete --force
    fi
}


# DESC: Update NVIDIA drivers. Purge existing drivers and auto install new drivers. Based off
#       https://askubuntu.com/questions/206283/how-can-i-uninstall-a-nvidia-driver-completely/206289#206289 and
#       https://askubuntu.com/questions/1391245/getting-the-latest-nvidia-graphics-driver-through-software-updates
# ARGS: $1 (optional): Driver version to install (defaults to auto installing latest driver)
# OUTS: None
# RETS: None
function update_nvidia_drivers() {
    driver_to_install=$1

    if [ -z "$driver_to_install" ]; then
        if [[ "$driver_to_install" =~ [^0-9] ]]; then
            printf 'Driver to install must be an integer'
            exit 1
        fi
    fi

    printf '\n**************************************************\n'
    printf 'Purging existing nvidia packages\n'
    printf '**************************************************\n'

    sudo apt remove --purge '^nvidia-.*'
    sudo apt install ubuntu-desktop

    printf '\n**************************************************\n'
    printf 'Installing new drivers\n'
    printf '**************************************************\n'

    sudo apt update && sudo apt upgrade -y
    sudo add-apt-repository ppa:graphics-drivers/ppa -y
    sudo apt update

    if [ -z "$driver_to_install" ]; then
        sudo ubuntu-drivers autoinstall
    else
        sudo apt install nvidia-driver-"$driver_to_install" -y
    fi

    printf '\n**************************************************\n'
    printf 'Installation complete. Reboot computer for changes to take effect\n'
    printf '**************************************************\n'
}
