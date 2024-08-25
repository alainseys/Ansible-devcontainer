FROM python:3.10-buster

RUN python3 -m pip install ansible  
RUN python3 -m pip install ansible-lint
RUN python3 -m pip install ansible-dev-tools
RUN python3 -m pip install pywinrm
RUN python3 -m pip install ansible-creator
RUN python3 -m pip install molecule
RUN python3 -m pip install pyVmomi
RUN python3 -m pip install molecule
RUN python3 -m pip install netmiko
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sshpass

RUN echo 'SSHD: ALL' >> /etc/hosts.allow

# Git customization (replace this with folder)
RUN git config --global --add safe.directory /workspaces/awx

RUN echo "alias ansible-update='git push origin HEAD:main'" >> /etc/bash.bashrc
RUN echo "alias ansible-submodules='/workspaces/awx/scripts/ansible-submodules.sh'" >> /etc/bash.bashrc
RUN echo "alias ansible-create-submodule='/workspaces/awx/scripts/ansible-add-submodule.sh'" >> /etc/bash.bashrc

WORKDIR /ansible
