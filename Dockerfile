FROM devopscorner/aws-cli:alpine-3.17

ENV BASE_URL="https://get.helm.sh"

ENV HELM_3_FILE="helm-v3.8.1-linux-amd64.tar.gz"

ENV DOCTL_URL = "https://github.com/digitalocean/doctl/releases/download/v1.92.0/doctl-1.92.0-linux-amd64.tar.gz"

RUN apk update && \
    apk add --no-cache ca-certificates jq curl bash nodejs && \
    # Install helm version 3:
    curl -L ${BASE_URL}/${HELM_3_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm3 && \
    chmod +x /usr/bin/helm3 && \
    rm -rf linux-amd64 && \
    curl -L ${DOCTL_URL} |tar xvz && \
    mv doctl /usr/bin/doctl && \
    chmod +x /usr/bin/doctl


COPY . /usr/src/
ENTRYPOINT ["node", "/usr/src/index.js"]
