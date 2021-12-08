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
php-json
RUN ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version
COPY conf/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY conf/apache.conf /etc/apache2/conf-available/z-app.conf
RUN a2enconf z-app
#CMD python /app/app.py