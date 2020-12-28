# nginx-rp
A dynamic reverse proxy for swarm env. it based nginx.
# usage
## Build docker image, like
```sh
docker build . -t nginx-rp:1.0.0
```
## Build web docker image, just add to html folder.
1. Dockerfile
```sh
FROM nginx-rp:1.0.0

RUN rm -rf /usr/share/nginx/html
COPY ./dist /usr/share/nginx/html
```
2. Build
```sh
docker build . -t testweb:1.0.0
```
## Run web docker container (for example: testweb)with env variables.
```sh
docker run --rm --name testweb -p 80:80 -e NP_SVC_ADDRS:192.168.0.10:2375 -e NP_SVC_KWD:svc.* testweb:1.0.0
```