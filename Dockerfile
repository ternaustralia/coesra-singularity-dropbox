FROM ubuntu:16.04

RUN apt update -y && \
    apt install -y curl

RUN curl -Lo dropbox_2019.02.14_amd64.deb https://linux.dropbox.com/packages/ubuntu/dropbox_2019.02.14_amd64.deb
RUN apt install -y ./dropbox_2019.02.14_amd64.deb

ENTRYPOINT exec /usr/bin/dropbox