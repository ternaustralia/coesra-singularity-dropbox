FROM ubuntu:16.04

RUN apt update -y && \
    apt install -y curl wget

RUN curl -Lo dropbox_2019.02.14_amd64.deb https://linux.dropbox.com/packages/ubuntu/dropbox_2019.02.14_amd64.deb
RUN apt install -y ./dropbox_2019.02.14_amd64.deb

# Need python-gpgme to verify the dropbox daemon download signature, caja-dropbox for GUI(?)
RUN apt install -y python-gpgme python-gpgme libxcb-glx0 libxxf86vm1 caja-dropbox
RUN apt install -y libsm6 libice6

# Download dropbox deamon
RUN cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - 

ENV QT_DEBUG_PLUGINS=1

ENTRYPOINT exec /usr/bin/dropbox start -i
