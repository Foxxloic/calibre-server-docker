FROM ubuntu:17.10
MAINTAINER santi@regueiro.es

RUN apt-get update -y \
  && apt-get install -y calibre \
  && apt-get clean \
  && rm -rf /var/cache/apt/* /var/lib/apt/lists/*

EXPOSE 8080

RUN mkdir /opt/calibre && mkdir /opt/calibre/library

VOLUME        ["/opt/calibre/library"]
RUN calibredb --with-library /opt/calibre/library list
ENTRYPOINT           ["/usr/bin/calibre-server", "/opt/calibre/library"]
