FROM buildpack-deps:stretch
LABEL maintainer="Ryan Schlesinger <ryan@outstand.com>"

ENV WATCHMAN_VERSION v4.9.0

RUN mkdir -p /tmp/build && \
    cd /tmp/build && \
    git clone https://github.com/facebook/watchman.git \
      && cd watchman \
      && git checkout ${WATCHMAN_VERSION} \
      && ./autogen.sh \
      && ./configure --without-python \
      && make \
      && make install && \
    cd /tmp && \
    rm -rf /tmp/build
