#FROM node:current-alpine
FROM node:14-slim

ARG TZ='UTC'

# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
#RUN echo "${TZ}" && apk --update add tzdata && \
#    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
#    echo $TZ > /etc/timezone && \
#    apk del tzdata

RUN apt-get update && apt-get install -y --no-install-recommends bash \
    htop \
    acl \
    curl \
    wget \
    python3 \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g pm2@latest && pm2 update && pm2 kill

WORKDIR /var/www

EXPOSE 3900-3999

CMD pm2 start /home/node/pm2.config.js --no-daemon