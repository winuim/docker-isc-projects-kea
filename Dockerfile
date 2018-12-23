FROM alpine:latest
LABEL Name=docker-isc-projects-kea Version=0.0.1

EXPOSE 67
EXPOSE 67/udp

WORKDIR /tmp

# Update & Install Requirments Packages.
RUN apk update && apk add \
    alpine-sdk \
    autoconf \
    automake \
    boost-dev \
    git \
    libtool \
    openssl \
    openssl-dev \
    pkgconfig \
    procps \
    && git clone -b 1.2.x https://github.com/log4cplus/log4cplus.git \
    && cd log4cplus \
    && git submodule update --init --recursive \
    && autoreconf \
    && ./configure \
    && make \
    && make install \
    && cd /tmp \
    && git clone https://github.com/isc-projects/kea.git \
    && cd kea \
    && autoreconf --install \
    && ./configure \
    && make \
    && make install \
    && rm -rf /tmp/* \
    && apk del alpine-sdk git autoconf automake pkgconfig \
    && rm -rf /var/cache/apk/*

# Run
CMD ["kea-dhcp4", "-c", "/usr/local/etc/kea/kea-dhcp4.conf"]
