FROM buildpack-deps:buster
LABEL maintainer="Ryan Schlesinger <ryan@outstand.com>"

ENV WATCHMAN_VERSION v2020.09.21.00

RUN mkdir -p /tmp/build && \
    cd /tmp/build && \
      wget https://github.com/facebook/watchman/releases/download/${WATCHMAN_VERSION}/watchman-${WATCHMAN_VERSION}-linux.zip && \
      unzip watchman-${WATCHMAN_VERSION}-linux.zip && \
      cd watchman-${WATCHMAN_VERSION}-linux && \
      mkdir -p /usr/local/{bin,lib} /usr/local/var/run/watchman && \
      cp bin/* /usr/local/bin && \
      cp lib/* /usr/local/lib && \
      chmod 755 /usr/local/bin/watchman && \
      chmod 2777 /usr/local/var/run/watchman && \
    cd /tmp && \
    rm -rf /tmp/build
