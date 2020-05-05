VERSION=200505.1

build:
	docker build -t myrpsg/flarectl-alpine:$(VERSION) .

build_latest:
	docker build -t myrpsg/flarectl-alpine:latest .

push:
	docker push myrpsg/flarectl-alpine:latest