Dockerized fl. Requires standalone Tor or I2P host.
==

fl is a reverse proxy to the Flibusta e-library via Tor or I2P.

## Docker build

    docker build . -t fl

## Docker run

    docker run -d -p 8080:8080 fl [paramaters]
    
Example:

    docker run -d -p 8080:8080 fl -tor torhost.local:9050

## Use

When invoked without parameters, `fl` chooses which network to use. First it tries to connect to Tor on port 9050 on the local machine and, failing that, switches to I2P on port 4444 on the local machine. After that it starts listening for requests on port 8080 and proxies them through the selected anonymity network to Flibusta.

For the options run

    docker run --rm fl -help


    
Credits: @opennota for the original fl https://github.com/opennota/fl
