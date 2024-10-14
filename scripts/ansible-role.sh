#!/bin/bash

# Prompt for the role name
read -p "Enter the role name: " injected_name

ansible-galaxy role init "$injected_name"

echo "Role '$injected_name' has been created 