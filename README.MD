### FAQ

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