FROM ubuntu:latest
MAINTAINER je3f0o

ENV DEBIAN_FRONTEND noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update && apt-get install -y \
    locales apt-utils \
    sudo openssh-server bash-completion

RUN locale-gen "en_US.UTF-8"
RUN update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

RUN sed -i 's/^path-exclude/#path-exclude/g' /etc/dpkg/dpkg.cfg.d/excludes
RUN cat /etc/dpkg/dpkg.cfg.d/excludes

RUN useradd -m -s /bin/bash jeefo
RUN usermod -aG sudo,root,www-data jeefo

RUN echo 'root:toor' | chpasswd
RUN echo 'jeefo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER jeefo
ENV HOME /home/jeefo
WORKDIR $HOME

RUN mkdir -p .ssh & ssh-keygen -q -t rsa -N '' -f $HOME/.ssh/id_rsa
COPY id_rsa.pub /tmp/id_rsa.pub
RUN cat /tmp/id_rsa.pub >> $HOME/.ssh/authorized_keys && rm /tmp.id_rsa.pub

RUN sudo apt-get install curl -y

ARG url=https://raw.githubusercontent.com/je3f0o/dotfiles/master/setup.sh
RUN DOCKER_BUILD=true mkdir -p ~/cloud/dotfiles && \
    cd ~/cloud/dotfiles && \
    bash -c "curl -s ${url} | sudo -u jeefo bash"

WORKDIR $HOME/cloud/dotfiles
RUN vim +PluginInstall +qall
WORKDIR $HOME/cloud/dotfiles/vim/bundle/YouCompleteMe
RUN bash -c 'python3 install.py --clangd-completer && \
             echo 1 > ~/.ycm_installed'

WORKDIR $HOME
RUN sudo sh -c 'content=$(head -n -1 /etc/sudoers) && echo "$content" > /etc/sudoers'

USER root
WORKDIR /
COPY entrypoint.sh /entrypoint.sh
CMD bash /entrypoint.sh