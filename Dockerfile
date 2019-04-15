FROM alpine:3.7

LABEL maintainer="Raju Dawadi <rajudawadinp@gmail.com>"

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/dwdraju/helm-docker" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

ENV KUBE_VERSION="v1.14.1"
ENV HELM_VERSION="v2.13.1"
# Helm releases: https://github.com/kubernetes/helm/releases

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && wget -q http://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
 && chmod +x /usr/local/bin/helm \
 && apk del --purge deps \
 && rm /var/cache/apk/* \
 && mkdir /root/.kube

WORKDIR /root
