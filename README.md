# Ansible-devcontainer

## Installation

 - Download and install Docker
 - Download and install Visual Studio Code
 - Open Visual Studio Code and download the extension "Dev Containers "

When the installation is compled Visual Studio Code willl restart once restarted  enter the following keys CTRL + SHIFT + P and search for "Dev Containers: Rebuild Container".

One you have run this , the automated build of the depencies and plugins will we installed on your system.
 One the dev container is ready with the build process you can open a new terminal in Visual Studio Code and run the command `ansible --version` when this results returns you the version of ansible you have completed the installation.

  The last thing you need to verify if the extensions are installed , check if the extensions have the status "Local Installed" if so the plugins are present on your dev box.

If you have one of those extensions on your local system you can test it by remove them and rebuilding the container so you are sure you have a repeatable development box.


### WSL

If you are using WSL on windows you need to execute some additional steps these steps are simply running some simple commands to get you starter after that you can enter CTRL + SHIFT + P and seacht for "Dev Containers: Rebuild Container" and start developing in Ansible.

sudo addgroup --system docker
sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker
sudo chown root:docker /var/run/docker.sock
sudo chmod g+w /var/run/docker.sock`

## GIT
For the usage with git you need to add you ssh credentials on the machine you are running the container from, once you have this done then you can simply clone your code repository and start developing it as simple as that.

