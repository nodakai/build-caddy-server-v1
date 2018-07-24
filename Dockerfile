FROM golang:1-alpine

LABEL maintainer "NODA, Kai <nodakai@gmail.com>"

RUN apk add --no-cache git sed
RUN go get github.com/FiloSottile/gvt

COPY add-plugins.sh /tmp/
COPY recommended-plugins.txt /tmp/plugins.txt

# the `cp` command below assumes /output is bound to the host directory
# with e.g. `docker run -v $(pwd):/ouput`
CMD go get -v github.com/mholt/caddy/caddy && \
    go get -v github.com/caddyserver/builds && \
    cd src/github.com/mholt/caddy && \
    /tmp/add-plugins.sh && \
    cd caddy && \
    echo "go run build.go" && \
    go run build.go && \
    ls -l caddy && \
    cp -a caddy /output
