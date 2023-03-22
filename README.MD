### FAQ

#### NodeJS PM2 per app config file
For each app you may create config file with ```.config.js``` suffix and place it into node/conf.d dir, example file:
```javascript
module.exports = {
    script: 'pm2.example2.js', //<-- app script or command
    cwd: '/var/www/', //<-- root dir of app
    env: {
        PORT: 3901 //<-- port must be unique in range 3900-3999
    }
};
```

#### Execute Docker container shell
```shell
docker exec -it <container> bash
```
for login as root add option ```-u 0```

#### Run compose as current host user
```shell
UID=$(id -u) GID=$(id -g) docker-compose <command> <args>
```

#### Get host IP from docker (need for extra_hosts)
```shell
docker run -it alpine /sbin/ip route|awk '/default/ { print $3 }'
```

### Create self-signed ssl certificates for development

#### Generate certificate and key (replace ```*.local.dev``` with your domain):
```shell
openssl req \
 -subj "/C=US/ST=California/L=Mountain View/O=Local Development/CN=*.local.dev" \
 -x509 -nodes -days 3650 -newkey rsa:2048 \
 -keyout ./nginx/ssl/ssl-*.local.dev.key \
 -out ./nginx/ssl/ssl-*.local.dev.crt
```

#### Generate PKCS12 for Google Chrome
```shell
openssl pkcs12 \
 -export \
 -inkey ./nginx/ssl/ssl-*.local.dev.key \
 -in ./nginx/ssl/ssl-*.local.dev.crt \
 -out ./nginx/ssl/ssl-*.local.dev.p12
```

#### Generate a Diffie-Hellman group
```shell
openssl dhparam -out ./nginx/ssl/dhparam.pem 4096
```

#### Change nginx host config listen to 443 and add:
```text
listen 443 ssl;
ssl_certificate /etc/nginx/ssl/ssl-*.local.dev.crt;
ssl_certificate_key /etc/nginx/ssl/ssl-*.local.dev.key;
```

#### Google Chrome
If show certificate invalid just click anywhere on page and type:
```text
thisisunsafe
```