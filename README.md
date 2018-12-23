# docker-isc-projects-kea

## Build image
```
docker build ./ -t kea-dhcp4-server
```

## kea-dhcp4-server start
```
docker run -d --name kea-dhcp4-server -v $(pwd)/etc/kea:/etc/kea -p 67:67 kea-dhcp4-server
```
