#!/bin/bash
set -e

# This script generates a self-signed certificate in etc/ssl/
mkdir -p etc/ssl/private
mkdir -p etc/ssl/certs
export NAME="pod-nginx-test"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout etc/ssl/private/${NAME}.key -out etc/ssl/certs/${NAME}.crt
