FROM php:8.1-fpm-alpine

ARG TZ='UTC'

# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN echo "${TZ}" && apk --update add tzdata && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apk del tzdata

RUN apk add --no-cache bash \
        mysql-client \
        msmtp \
        perl \
        wget \
        procps \
        shadow \
        libzip \
        libpng \
        libjpeg-turbo \
        libwebp \
        freetype \
        icu \
        libintl \
        patch \
        acl \
        git \
        gettext-dev \
        libcurl \
        libxml2-dev \
        openssh-client \
        pcre-dev \
        su-exec \
        build-base \
        oniguruma-dev \
        gmp-dev \
        postgresql-dev \
        gettext \
        gettext-dev

RUN apk add --update --no-cache --virtual build-essentials \
        icu-dev \
        icu-libs \
        zlib-dev \
        g++ \
        make \
        automake \
        autoconf \
        libzip-dev \
        htop \
        supervisor \
        libpng-dev \
        libwebp-dev \
        libjpeg-turbo-dev \
        freetype-dev && \
    docker-php-ext-configure bcmath --enable-bcmath && \
    docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-configure gettext && \
    docker-php-ext-configure opcache --enable-opcache && \
    docker-php-ext-configure pcntl --enable-pcntl && \
    docker-php-ext-configure soap && \
    docker-php-ext-configure intl && \
    docker-php-ext-install bcmath \
                           intl \
                           gettext \
                           pcntl \
                           gd \
                           opcache \
                           soap \
                           xml \
                           gmp \
                           pdo_pgsql \
                           mysqli \
                           pdo_mysql \
                           opcache \
                           exif \
                           zip && \
    pecl install -o -f redis mongodb && \
    rm -rf /tmp/pear && \
    docker-php-ext-enable redis && \
    docker-php-ext-enable mongodb && \
    apk del build-essentials && \
    rm -rf /usr/src/php*

RUN apk add --update --no-cache ffmpeg

# Clean
RUN rm -rf /var/cache/apk/* && docker-php-source delete

USER root

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

USER www-data:www-data

WORKDIR /var/www/