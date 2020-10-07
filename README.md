# pod-nginx-test

A docker pod for testing nginx configuration options. Configuration attempts to replicate the Dockstore web app setup.

## Quick Start

Before you start, you will need to generate a self-signed certificate using the script in the repo:

```
./generate_certificate.sh
```

Now start the pod:

```
# interactive, show pod output
docker-compose up

# detach after pod is started
docker-compose up -d
```

To view the page that the web server serves up:

`https://localhost:8443`

This will generate a warning that the certificate is self-signed.
Accept the warning and continue to the site.

To stop all docker containers:

```
docker ps -qa | xargs docker stop
```

or just use `docker ps` and stop the one container.

## Details

The `docker-compose.yml` file sets up a Docker pod that has an nginx container
that uses Dockstore's nginx configuration, and serves up simple static pages
(rather than running the entire Dockstore webapp). This allows testing the
nginx headers and external content to ensure the nginx headers are working as
expected.

## HTTPS Setup

The page is served up on port 8443 and accepts SSL connections only.

You will need to generate a self-signed 

You must prefix the address `localhost:8443` with `https://`.

The nginx configuration listens for SSL connections on port 8443 (see the
`conf/` directory).

## HTML Pages

The `pages/` directory contains static HTML pages. There are separate pages
for different kinds of content (usually one content type for page for simplicity).

For example, there is an images page at `pages/images.html` that has images from 
both local sources and remote sources.

