FROM python:3.10-buster

RUN python3 -m pip install ansible  
RUN python3 -m pip install ansible-lint
RUN python3 -m pip install ansible-dev-tools
RUN python3 -m pip install pywinrm
RUN python3 -m pip install ansible-creator
# Add dependencies to allow molecule testing
RUN python3 -m pip install pyVmomi
RUN python3 -m pip install molecule
RUN python3 -m pip install netmiko
RUN python3 -m pip install molecule
RUN python3 -m pip install molecule-docker
RUN python3 -m pip install docker
RUN python3 -m pip install flake8
RUN python3 -m pip install flake8-bugbear
RUN python3 -m pip install flake8-docstrings
RUN python3 -m pip install flake8-import-order
RUN python3 -m pip install flake8-pylint
RUN python3 -m pip install pytest 
RUN python3 -m pip install netmiko
RUN python3 -m pip install yamllint
RUN python3 -m pip install ansible-builder

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sshpass

RUN echo 'SSHD: ALL' >> /etc/hosts.allow

# Git customization (replace this with folder)
RUN git config --global --add safe.directory /workspaces/awx

RUN echo "alias ansible-update='git push origin HEAD:main'" >> /etc/bash.bashrc
RUN echo "alias ansible-submodules='/workspaces/awx/scripts/ansible-submodules.sh'" >> /etc/bash.bashrc
RUN echo "alias ansible-create-submodule='/workspaces/awx/scripts/ansible-add-submodule.sh'" >> /etc/bash.bashrc
RUN echo "alias ansible-module='/workspaces/awx/scripts/ansible-role.sh'" >> /etc/bash.bashrc


# Run docker specs to use with molecule
RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /ansible
