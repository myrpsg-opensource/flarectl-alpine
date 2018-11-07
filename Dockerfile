FROM golang:1.11.2-alpine3.8

ARG CLOUDFLARE_VERSION=0.7.3

RUN apk add --no-cache --virtual .build-dependencies git make bash gcc linux-headers python musl-dev  \
  && go get -d github.com/cloudflare/cloudflare-go \
  && cd /go/src/github.com/cloudflare/cloudflare-go \
  && git checkout v$CLOUDFLARE_VERSION \
  && cd cmd/flarectl \
  && go build -v flarectl.go  \
  && mv flarectl /usr/local/bin/ \
  && apk del .build-dependencies  \
  && rm -rf /root/go/src/github.com/cloudflare/cloudflare-go
