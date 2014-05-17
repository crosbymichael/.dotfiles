#!/bin/bash

exec docker run -ti --rm --name development \
    -v $HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
    -v $HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa \
    -v /home/core/docker:/root/docker \
    -v /var/run/docker.sock:/var/run/docker.sock \
    crosbymichael/dotfiles
