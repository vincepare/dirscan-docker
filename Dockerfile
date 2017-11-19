FROM php:5.6-cli-alpine

COPY ./dirscan-bootstrap.php /usr/local/lib/php/

RUN wget -O /usr/local/bin/dirscan https://github.com/vincepare/DirScan/releases/download/1.2.1/dirscan.phar && chmod +x /usr/local/bin/dirscan && \
    echo "auto_prepend_file = /usr/local/lib/php/dirscan-bootstrap.php" > /usr/local/etc/php/conf.d/dirscan-bootstrap.ini

ENTRYPOINT ["dirscan"]
