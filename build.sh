#!/bin/sh

set -eu
set -x

telem=${TELEMETRY-false}
plugins=${PLUGINS-xuqingfeng/caddy-rate-limit,pyed/ipfilter,miekg/caddy-prometheus}

echo 'go get' && {
    go get -v github.com/caddyserver/caddy"${VERSION+@}${VERSION-}"
}

echo 'modify main.go' && {
    nl=$(printf '\n')
    ht=$(printf '\t')
    sed -i -re "s/(EnableTelemetry =) .*/\\1 $telem/" main.go
    IFS=,
    if [ -n "$plugins" ]; then
        for p in $plugins; do
            first=${p%%/*}
            case "$first" in
            *.*)
                ;;
            *)
                p=github.com/$p
            esac
            sed -i -e "/plug in plugins here/a\\$nl${ht}_ \"$p\"$nl" main.go
        done
    fi
    unset IFS
    cat main.go
}

echo 'go build (static)' && {
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w'
}

echo 'done' && {
    ls -l caddy
    # the `cp` command below assumes /output is bound to the host directory
    # with e.g. `docker run -v $(pwd):/output`
    cp -a caddy /output
}
