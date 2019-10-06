FROM golang:1-alpine

LABEL maintainer "NODA, Kai <nodakai@gmail.com>"

RUN apk add --no-cache git sed

WORKDIR /root
ENV GO111MODULE=on
COPY main.go .
RUN go mod init caddy

COPY build.sh .

CMD /root/build.sh
