FROM alpine:latest
MAINTAINER Chris Impey "chris@impey.io"

ENV VERSION=4.1.6

RUN apk update \
    && apk add curl g++ make \
    && wget http://download.joedog.org/siege/siege-$VERSION.tar.gz \
    && tar -xf siege-${VERSION}.tar.gz \
    && cd siege-${VERSION} \
    && ./configure \
    && make install

ENTRYPOINT ["siege"]
CMD ["--help"]
