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

WORKDIR /ansible
