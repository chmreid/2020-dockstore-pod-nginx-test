# pod-nginx-test

A docker pod for testing nginx configuration options. Configuration attempts to replicate the Dockstore web app setup.

## Quick Start

To start:

```
# interactive, show pod output
docker-compose up

# detach after pod is started
docker-compose up -d
```

## Details

The `docker-compose.yml` file sets up a Docker pod that has an nginx container
that uses Dockstore's nginx configuration, and serves up simple static pages
(rather than running the entire Dockstore webapp). This allows testing the
nginx headers and external content to ensure the nginx headers are working as
expected.

