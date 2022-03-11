FROM alpine:3.15
LABEL maintainer="Alexey Rogov <@agrogov>" \
      description="Alpine based docker image with SQLite3 and kubectl"

RUN apk -U upgrade \
&& apk add --no-cache ca-certificates bash git openssh curl gettext jq sqlite socat \
&& ln -s /usr/lib/libcrypto.so.42 /usr/lib/libcrypto.so.1.0.0 \
&& curl -ksS --location -o /usr/local/bin/kubectl https://dl.k8s.io/release/v1.19.3/bin/linux/amd64/kubectl \
&&  chmod +x /usr/local/bin/kubectl \
&& mkdir /config \
&& chmod g+rwx /config /root \
&& kubectl version --client

WORKDIR /config

CMD bash
