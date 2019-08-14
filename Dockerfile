FROM postgres:9.6.12-alpine

MAINTAINER Hardy Wu "hardy0wu@gmail.com"
RUN apk add --no-cache --virtual .build-deps wget build-base \
    && wget https://github.com/jaiminpan/pg_scws/archive/master.zip \
    && unzip master.zip -d /tmp \
    && rm master.zip \
    && cd /tmp/pg_scws-master \
    && USE_PGXS=1 make \
    && USE_PGXS=1 make install \
    && apk del .build-deps \
    && rm -rf /tmp/pg_scws-master
