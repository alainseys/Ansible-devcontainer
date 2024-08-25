#!/bin/bash
initialize_repo(){
    cd /workspaces/awx
    git add . 
    git commit -m "Add submodule by devbox script"
    ansible-update && ansible-submodules
}

read -p "Enter the submodule git url" git_url

if [ -z "$git_url" ]; then
    echo "You have not entered a url"
    exit 1
fi
# Ask for an optional directory path for the submodule
read -p "Enter the directory where the submodule should be added (leave blank for default):" submodule_path

if [ -z "$submodule_path" ]; then
    git submodule add "$git_url"
    initialize_repo
else
    git submodule add "$git_url" "$submodule_path"
    initialize_repo

fi
# Initialize the submodule
git submodule update --init --recursive
