# build-caddy-server

Turnkey solution for building [Caddy](https://caddyserver.com/) yourself on `golang:1-alpine`,

This should help you get started with using Caddy without relying on the pre-built binaries.

## USAGE:

    $ docker pull nodakai/build-caddy-server
    $ docker run -v $(pwd):/output nodakai/build-caddy-server
    ...
    $ ls caddy
    caddy*

## Links

* https://github.com/nodakai/build-caddy-server
* https://hub.docker.com/r/nodakai/build-caddy-server/
