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

RUN npm install -g pm2@latest && pm2 update && pm2 kill

WORKDIR /var/www

EXPOSE 3900-3999

CMD pm2 start /home/node/pm2.config.js --no-daemon