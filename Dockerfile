FROM ubuntu:20.04

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install general tools
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install \
    --no-install-recommends -y \
    apt-utils sudo curl git-core gnupg locales \
    nodejs zsh wget nano npm fonts-powerline tmux vim

# install yocto tools
RUN DEBIAN_FRONTEND="noninteractive" apt-get install \
    --no-install-recommends -y \
    gawk wget git-core diffstat unzip \
    texinfo gcc-multilib build-essential chrpath socat cpio python \
    python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping \
    python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev xterm locales \
    vim bash-completion screen pylint3 iproute2 file iptables

ARG USERNAME=dev
ARG PUID=1000
ARG PGID=1000
ARG PASSWORD=""

RUN groupadd -g ${PGID} ${USERNAME} \
            && useradd -u ${PUID} -g ${USERNAME} -d /home/${USERNAME} ${USERNAME} \
            && echo "${USERNAME}:${PASSWORD}" | chpasswd && adduser ${USERNAME} sudo \
            && mkdir /home/${USERNAME} \
            && chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8

COPY ./bashrc /home/${USERNAME}/.bashrc

USER ${USERNAME}

# run zsh installation script
#RUN sh -c "$(curl -fsSL \
#https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


WORKDIR /home/${USERNAME}

# start zsh
#ENTRYPOINT [ "/bin/zsh" ]
