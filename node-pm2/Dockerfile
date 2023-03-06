FROM keymetrics/pm2:latest-alpine

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

# TODO do not copy apps, place pm2 config in some dir instead of root
# TODO add volumes
COPY app.js .
COPY pm2.js .

RUN npm create -y
RUN npm i express --save

# Show current folder structure in logs
RUN ls -al -R

CMD ["pm2-runtime", "start", "pm2.js"]