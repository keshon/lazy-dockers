FROM golang:1.16-alpine AS mybuildstage

RUN apk add build-base

ADD project-src /usr/project

WORKDIR /usr/project

RUN go build -o app

FROM alpine:3.12.2

COPY --from=mybuildstage /usr/project /usr/project

RUN apk add mc

RUN /bin/sh -c "apk add --no-cache bash"