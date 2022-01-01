FROM centos:latest
ARG HTTPD_LOG_DIR
COPY errors /errors
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
mod_fcgid

ENV HTTPD_LOG_DIR "$HTTPD_LOG_DIR"
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version
RUN mkdir -p /etc/httpd/sites-available /etc/httpd/sites-enabled
COPY conf/httpd.conf        /etc/httpd/conf/httpd.conf
COPY conf/error.conf       /etc/httpd/conf.d/error.conf
COPY conf/security.conf     /etc/httpd/conf.d/security.conf
COPY conf/php.conf          /etc/httpd/conf.d/php.conf
COPY conf/app-vhost.conf        /etc/httpd/sites-available/app-vhost.conf
RUN ln -s /etc/httpd/sites-available/app-vhost.conf     /etc/httpd/sites-enabled/app-vhost.conf
RUN chmod 777 -R /var/www/html && chown apache:apache -R /var/www/html 
RUN chmod 777 -R /errors && chown apache:apache -R /errors
VOLUME [ "/var/www/html" ]
EXPOSE 80
CMD ["httpd","-DFOREGROUND"]