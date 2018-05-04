FROM golang:1-alpine

RUN apk add --no-cache git

# the `cp` command below assumes /output is bound to the host directory
# with e.g. `docker run -v $(pwd):/ouput`
CMD go get -v github.com/mholt/caddy/caddy && \
    go get -v github.com/caddyserver/builds && \
    cd $GOPATH/src/github.com/mholt/caddy/caddy && \
    echo "go run build.go" && \
    go run build.go && \
    ls -l caddy && \
    cp -a caddy /output && \
    rm -rf $GOPATH/src
