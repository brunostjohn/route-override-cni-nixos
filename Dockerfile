# This Dockerfile is used to build the image available on DockerHub
FROM golang:1.19 AS build

WORKDIR /usr/src/cni-route-override
ADD . .
RUN ./build_linux.sh

FROM alpine
LABEL org.opencontainers.image.source https://github.com/redhat-nfvpe/cni-route-override
COPY --from=build /usr/src/cni-route-override/bin/route-override /
WORKDIR /
