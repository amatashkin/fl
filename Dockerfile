FROM golang:alpine

EXPOSE 8080

RUN apk add --no-cache git \
    && go get -u github.com/amatashkin/fl \
    && apk del git

CMD ["fl"]
