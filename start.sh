#!/bin/bash

exec docker run -ti --name development \
    -v /home/core/docker:/root/docker \
    -v /var/run/docker.sock:/var/run/docker.sock \
    crosbymichael/dotfiles
