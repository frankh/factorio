FROM ubuntu:latest

MAINTAINER Hugh Cannon <hugh@hughcannon.com>

RUN apt-get update &&\
  apt-get install -y wget && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /factorio
RUN wget -qO- --no-check-certificate https://www.factorio.com/get-download/0.12.33/headless/linux64 | tar --strip-components=1 -xzf -

VOLUME ["/factorio/saves"]
VOLUME ["/factorio/mods"]

EXPOSE 34197/udp

COPY start start

ENTRYPOINT ["./start"]
