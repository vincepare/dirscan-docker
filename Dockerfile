FROM php:5.6-cli-alpine

RUN apk add --no-cache tini && \
    wget -O /usr/local/bin/dirscan https://github.com/vincepare/DirScan/releases/download/1.3.0/dirscan.phar && chmod +x /usr/local/bin/dirscan

COPY ./run.sh /run.sh

ENTRYPOINT ["/sbin/tini", "--", "/run.sh"]
