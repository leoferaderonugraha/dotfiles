FROM debian:bullseye

WORKDIR /root

RUN apt update
RUN apt install git wget curl python3 python3-pip silversearcher-ag ripgrep nodejs -yy

# install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# install nvim
RUN wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -O ~/nvim-linux64.tar.gz
RUN tar -xvf nvim-linux64.tar.gz
RUN cp -r nvim-linux64/* /usr/

WORKDIR /test

ENTRYPOINT ["/bin/bash"]
