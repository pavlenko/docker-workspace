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