#!/bin/bash
main_branch="main"
main_repo_path="/workspaces/ansible-devcontainer/awx"
#current_date=$(date +"%Y-%m-%d %H:%M:%S")
# Function to update all submodules
update_submodules() {
    git submodule update --init --recursive
    git submodule foreach --recursive git pull origin "$main_branch"
}

# Function to add and commit submodule changes to the main repository
commit_submodule_changes() {
    git add .
    git commit -m "Update submodule changes"
    git push origin "$main_branch"
}

# Main function
main() {
    # Move to the main repository directory
    cd "$main_repo_path"

    # Update all submodules
    update_submodules

    # Commit submodule changes
    commit_submodule_changes
}

# Execute the main function
main
