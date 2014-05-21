#!/bin/bash

exec docker run -ti --name development \
    -v $HOME/docker:/root/docker \
    -v /var/run/docker.sock:/var/run/docker.sock \
    crosbymichael/dotfiles
