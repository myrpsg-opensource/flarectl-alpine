FROM golang:1.13-alpine3.11 as builder

ARG CLOUDFLARE_VERSION=0.11.7

RUN apk add --no-cache --virtual .build-dependencies git make bash gcc linux-headers python musl-dev  \
  && go get -d github.com/cloudflare/cloudflare-go && cd /go/src/github.com/cloudflare/cloudflare-go \
  && git checkout v$CLOUDFLARE_VERSION \
  && cd cmd/flarectl \
  && go build  \
  && mv flarectl /usr/local/bin/

FROM alpine:3.11

COPY --from=builder /usr/local/bin/flarectl /usr/local/bin

ENTRYPOINT ["flarectl"]