FROM hg8496/apache

MAINTAINER hg8496@cstolz.de

RUN apt-get update && \
    apt-get install -y php5-mysql imagemagick wget unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN wget -q -O piwigo.zip http://piwigo.org/download/dlcounter.php?code=latest && \
    unzip piwigo.zip && \
    mv piwigo/* /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    rm -r piwigo* && \
    rm /var/www/html/index.html

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

VOLUME ["/var/www/html/galleries", "/var/www/html/themes", "/var/www/html/plugins", "/var/www/html/local"]

