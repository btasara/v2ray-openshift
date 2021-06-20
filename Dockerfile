FROM alpine:3.6
ENV CONFIG_JSON=none
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && cd /root && mkdir /v2ray \
 && curl -L -H "Cache-Control: no-cache" -o /v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
 && unzip /v2ray.zip -d /v2ray \
 && cd /v2ray \ && chmod a+x v2ray v2ctl \
 && rm -rf /root/v2ray.zip
ADD configure.sh /root/configure.sh
RUN chmod a+x /root/configure.sh
ENTRYPOINT ["sh", "/root/configure.sh"]
EXPOSE 443


