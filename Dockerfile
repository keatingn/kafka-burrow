FROM golang:alpine

MAINTAINER Noel Keating

RUN apk --update add bash git

RUN wget https://raw.githubusercontent.com/pote/gpm/v1.4.0/bin/gpm && \
  chmod +x gpm && \
  mv gpm /usr/local/bin

RUN go get github.com/linkedin/burrow && \
  cd $GOPATH/src/github.com/linkedin/burrow && \
  gpm install && \
  go install

ENTRYPOINT [ "bin/burrow" ]
