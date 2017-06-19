FROM ubuntu:trusty

# setup user, sudo, directories
ADD sudoers.txt /etc/sudoers
RUN set -x \
      && adduser --disabled-password --gecos "" dev \
      && gpasswd -a dev sudo
USER dev

RUN set -x \
      && chown -R dev: /home/dev \
      && mkdir -p /home/dev/go /home/dev/bin /home/dev/lib /home/dev/include

ENV PATH /home/dev/bin:$PATH
ENV PKG_CONFIG_PATH /home/dev/lib/pkgconfig
ENV LD_LIBRARY_PATH /home/dev/lib

# install development tools
RUN set -x \
      && sudo DEBIAN_FRONTEND=noninteractive apt-get update -y \
      && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
        build-essential \
        cmake \
        curl \
        diffstat \
        git \
        man \
        pkg-config \
        python \
        strace \
        tcpdump \
        tmux \
        vim

# install nvm
RUN set -x \
      && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

ENV HOME /home/dev
WORKDIR /home/dev

# shared volume
RUN set -x && sudo mkdir /var/shared/
RUN set -x && sudo chown -R dev:dev /var/shared
VOLUME /var/shared

# dotfiles
ADD vimrc /home/dev/.vimrc
ADD tmux.conf /home/dev/.tmux.conf
ADD vim /home/dev/.vim
ADD bash_profile /home/dev/.bash_profile
ADD gitconfig /home/dev/.gitconfig
RUN set -x && sudo chown -R dev: /home/dev

ADD entrypoint.sh /home/dev/entrypoint.sh
RUN set -x && sudo chmod +x /home/dev/entrypoint.sh
ENTRYPOINT ["/home/dev/entrypoint.sh"]
