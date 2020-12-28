FROM nginx:1.19.6-alpine

RUN apk add curl jq bash --repository https://mirrors.aliyun.com/alpine/v3.12/main

COPY ./nginx.conf /etc/nginx/nginx.conf

ADD run /bin/run
ADD rpu /bin/rpu
RUN touch /etc/nginx/proxy.conf
RUN chmod +x /bin/run
RUN chmod +x /bin/rpu

CMD ["/bin/run", "/etc/nginx/"]
