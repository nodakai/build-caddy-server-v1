# build-caddy-server

Turnkey solution for building [Caddy](https://caddyserver.com/) web server as a static Linux binary on `golang:1-alpine` by yourself.

This should help you get started with using Caddy without relying on the pre-built binaries.

**NOT TO BE CONFUSED** with [Docker images containing Caddy binary](https://github.com/mholt/caddy/wiki/Docker-Containers) which you can `docker run` in a production environment.

## Usage

    $ docker pull nodakai/build-caddy-server
    $ docker run -v $(pwd):/output nodakai/build-caddy-server
    ...
    $ ls caddy
    caddy*
    $ file caddy
    caddy: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped

### Volumes

* `/output`: Mount a directory to save the Caddy binary (_e.g._ `$(pwd)`)

### Environment Variables

* `VERSION`: Specify which version of Caddy to checkout and build.  The latest commit from `master` is used by default. _E.g._ you may want to use `docker run -e VERSION=1.0.0 ...` (this translates to `go get .../caddy@1.0.0` under the hood)
* `TELEMETRY`: Specify `true` or `false` depending on whether or not you want to enable the [telemetry](https://caddyserver.com/docs/telemetry) feature
* `PLUGINS`: See below

## Plugins

As an experimental feature, three plugins [`ratelimit`](https://caddyserver.com/docs/http.ratelimit), [`ipfilter`](https://caddyserver.com/docs/http.ipfilter), and [`prometheus`](https://caddyserver.com/docs/http.prometheus) are enabled by default.
If you want to specify which plugins to enable, list their repo paths in the `PLUGINS` env var, delimited by commas (`,`). You can omit `github.com/` if paths begin with it. _E.g._ `docker run -e PLUGINS= ...`)

## Links

* https://github.com/nodakai/build-caddy-server
* https://hub.docker.com/r/nodakai/build-caddy-server/
