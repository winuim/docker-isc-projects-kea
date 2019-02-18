# docker-isc-projects-kea

## Build image
```
docker build ./ -t kea-dhcp4-server
```

## kea-dhcp4-server start
```
docker run --rm -d --net=host --name=kea-dhcp4-server -v $(pwd)/etc/kea:/etc/kea kea-dhcp4-server
```

# docker-compose: Build image
```
docker-compose build
```

## docker-compose: service start
```
docker-compose up
```

## docker-compose: service stop and remove container
```
docker-compose down
```

## docker-compose: service stop and not remove container
```
docker-compose stop
```
