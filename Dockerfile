ARG BUILDPLATFORM
FROM ${BUILDPLATFORM}alpine:3

ARG KUBE_VERSION
ARG TARGETOS
ARG TARGETARCH

RUN apk -U upgrade \
    && apk add --no-cache ca-certificates bash git openssh curl gettext jq sqlite socat \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VERSION}/bin/${TARGETOS}/${TARGETARCH}/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && mkdir /config \
    && chmod g+rwx /config /root \
    && kubectl version --client

WORKDIR /config

CMD bash