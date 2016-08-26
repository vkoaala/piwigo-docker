FROM hg8496/apache

MAINTAINER hg8496@cstolz.de

RUN apt-get update && \
    apt-get install -y php7.0-mysql php7.0-gd imagemagick wget unzip mediainfo ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    wget -q -O piwigo.zip http://piwigo.org/download/dlcounter.php?code=latest && \
    unzip piwigo.zip && \
    mv piwigo/* /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    rm -r piwigo* && \
    rm /var/www/html/index.html

VOLUME ["/var/www/html/galleries", "/var/www/html/themes", "/var/www/html/plugins", "/var/www/html/local"]

