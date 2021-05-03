FROM golang:alpine

# Build arguments
ARG BUILD_VERSION

WORKDIR /build

COPY . .

RUN go mod init github.com/amatashkin/fl \
    && go get \
    && go build .

FROM alpine:latest  
WORKDIR /app
COPY --from=0 /build/fl .
EXPOSE 8080

HEALTHCHECK CMD wget --no-verbose --tries=1 --spider http://localhost:8080 || exit 1

ENTRYPOINT ["/app/fl"]

# Labels
LABEL \
    Maintainer="Alexey Matashkin <amatashkin@gmail.com>" \
    Description="fl"
    # Version=${BUILD_VERSION}