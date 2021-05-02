FROM golang:alpine

WORKDIR /build

COPY . .

RUN go mod init github.com/amatashkin/fl \
    && go get \
    && go build .

FROM alpine:latest  
WORKDIR /app
COPY --from=0 /build/fl .
EXPOSE 8080

ENTRYPOINT ["/app/fl"]

# Build arguments
ARG BUILD_VERSION

# Labels
LABEL \
    Maintainer="Alexey Matashkin <amatashkin@gmail.com>" \
    Description="fl"
    # Version=${BUILD_VERSION}