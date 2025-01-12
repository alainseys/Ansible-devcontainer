FROM python:3.10-buster
LABEL maintainer "Seys Alain"
RUN python3 -m pip install --upgrade pip

# Create devcontainer user if it doess not exist
RUN useradd -m devcontainer && echo "devcontainer:devcontainer" | chpasswd && adduser devcontainer sudo


RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sshpass
RUN echo 'SSHD: ALL' >> /etc/hosts.allow
# Run docker specs to use with molecule
RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    less \
    gnupg \
    locales \
    zsh \
    wget \
    fonts-powerline \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli && \
    apt-get clean && \    
    rm -rf /var/lib/apt/lists/* \
    locale-gen nl_BE.UTF-8

# Add User
ENV USER_NAME developer
ENV USER_PASSWORD developer123%
RUN adduser --quiet --disabled-password --shell /bin/zsh --home /home/$USER_NAME --gecos "User" $USER_NAME

# Update the password
RUN echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd && usermod -aG sudo $USER_NAME
# Set home directory
ENV HOME /home/$USER_NAME

# Generate locale
RUN echo "nl_BE.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
USER $USER_NAME
ENV TERM xterm
ENV SHELL /bin/zsh
# Install zsh and confuration
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
RUN cd $HOME && curl -fsSLO https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower
COPY .devcontainer/.zshrc $HOME/.zshrc
COPY .devcontainer/.p10k.zsh $HOME/.p10k.zsh
# Switch to root user
USER $USER_NAME
# Copy requirements.txt and install in python
COPY requirements.txt /workspace/requirements.txt
RUN pip install -r /workspace/requirements.txt
# Swithc back to non root user
WORKDIR /workspace


# Git customization (replace this with folder)
RUN git config --global --add safe.directory /workspaces/awx

RUN echo "alias ansible-update='git push origin HEAD:main'" >> /etc/bash.bashrc
RUN echo "alias ansible-submodules='/workspaces/awx/scripts/ansible-submodules.sh'" >> /etc/bash.bashrc
RUN echo "alias ansible-create-submodule='/workspaces/awx/scripts/ansible-add-submodule.sh'" >> /etc/bash.bashrc
RUN echo "alias ansible-module='/workspaces/awx/scripts/ansible-role.sh'" >> /etc/bash.bashrc



