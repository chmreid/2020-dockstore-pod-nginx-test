# pod-nginx-test

A docker pod for testing nginx configuration options. Configuration attempts to replicate the Dockstore web app setup.

## Quick Start

### Set Up SSL Certificates

**Generate Certificate:**

Before you start, you will need to generate a self-signed certificate using the script in the repo:

```
./generate_certificate.sh
```

**Add Certificate to System Keychain (Mac OS X):**

To make this SSL certificate work with the browser (and not issue warnings about
a self-signed certificate), add the cert file that was generated
(`etc/ssl/cert/pod-nginx-test.crt`) to the System Keychain:

```
# Mac
sudo security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" etc/ssl/certs/pod-nginx-test.crt
```

or follow [these instructions](https://deliciousbrains.com/ssl-certificate-authority-for-local-https-development/)
to add the certificate using the Mac UI.

**Enable Imported Certificates in Browser (Firefox):**

By default Firefox will not trust certificates that have been imported into Keychain.
To enable Firefox to trust them:

* Open Firefox
* Type `about:config` in the address bar
* Type `security.enterprise_roots.enabled`
* Change that setting from `false` to `true`

### Start Docker Pod

Now start the pod:

```
# interactive, show pod output
docker-compose up

# detach after pod is started
docker-compose up -d
```

To view the page that the web server serves up:

```
https://localhost:8443
```

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

You will need to generate a self-signed certificate.

You must prefix the address `localhost:8443` with `https://`.

The nginx configuration listens for SSL connections on port 8443 (see the
`conf/` directory).

## HTML Pages

The `pages/` directory contains static HTML pages. There are separate pages
for different kinds of content (usually one content type for page for simplicity).

For example, there is an images page at `pages/images.html` that has images from 
both local sources and remote sources.

