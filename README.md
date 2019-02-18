# docker-isc-projects-kea

## Build image
```
docker build ./ -t kea-dhcp4-server
```

## kea-dhcp4-server start
```
docker run --rm -d --net=host --name=kea-dhcp4-server -v $(pwd)/etc/kea:/etc/kea kea-dhcp4-server
```
