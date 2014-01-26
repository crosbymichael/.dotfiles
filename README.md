## $HOME

This is my complete development environment for [Go](http://golang.org) and [Docker](http://docker.io) 
development.  It is completly contained in a docker container so that it is consistent and repeatable
running on any docker host.


If your interested in the software installed or how it is built just look in the Dockerfile.  If you
notice some applications missing that is because these can be ran as separate containers with docker.


### Building
To build the container just run:
`docker build -t home github.com/crosbymichael/home`


### Running
To run the container just:
`docker run -t -i crosbymichael/home`

Running for docker development:
`docker run -t -i -v /usr/local/bin/docker:/usr/local/bin/docker -v /var/run/:/tmp/run crosbymichael/home`
