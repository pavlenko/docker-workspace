FROM keymetrics/pm2:latest-alpine

ARG TZ='UTC'

# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN echo "${TZ}" && apk --update add tzdata && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apk del tzdata

# Install OS deps & clean on complete
RUN apk add --update --no-cache bash \
    htop && \
    rm -rf /var/cache/apk/*

RUN npm install pm2@latest -g && pm2 update

WORKDIR /var/www/

EXPOSE 3800-3999

USER node

CMD pm2-runtime /home/node/conf/pm2-runtime.js