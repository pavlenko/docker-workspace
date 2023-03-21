FROM node:current-alpine

ARG TZ='UTC'

# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN echo "${TZ}" && apk --update add tzdata && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apk del tzdata

RUN apk add --update --no-cache bash \
    htop \
    acl \
    curl \
    wget

WORKDIR /var/www

EXPOSE 3900-3999

#TODO install npm, npx, pm2
#TODO command
CMD node