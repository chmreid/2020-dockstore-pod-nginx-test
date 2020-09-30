FROM ubuntu:18.04 as builder

RUN apt update \
    && apt install -yq \
    wget \
    && apt clean

FROM nginx:1.13.1

RUN mkdir /usr/share/nginx/html2
COPY config/robots.txt /usr/share/nginx/html2

