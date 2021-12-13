FROM centos:latest
#COPY . /app
RUN dnf install -y dnf-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm
RUN dnf module enable php:remi-7.4 -y
RUN dnf install -y php php-opcache \
php-gd \
php-curl \
php-pgsql \
php-pdo \
php-cli \
php-common \
php-bcmath \
php-devel \
php-gd \
php-intl \
php-ldap \
php-mbstring \
php-opcache \
php-process \
php-sodium \
php-soap \
php-json \
# mod_ssl \
# mod_security \
mod_fcgid

ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version
RUN mkdir /etc/httpd/sites-available /etc/httpd/sites-enabled

COPY conf/httpd.conf    /etc/httpd/conf.d
COPY conf/ssl.conf      /etc/httpd/conf.d
COPY conf/php.conf      /etc/httpd/conf.d
COPY conf/fcgid.conf    /etc/httpd/conf.d
COPY conf/security.conf /etc/httpd/conf.d
COPY conf/php.ini /etc/php
COPY conf/vhost.conf /etc/httpd/sites-available
RUN ln -s /etc/httpd/sites-available/vhost.conf /etc/httpd/sites-enabled/vhost.conf

#RUN a2enconf z-app
VOLUME [ "/var/www/html" ]

#CMD python /app/app.py