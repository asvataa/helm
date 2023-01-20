#!/bin/bash

INPUT_TOKEN=foo \
INPUT_HELM=/tmp/helm-fake \
INPUT_SECRETS='{"VAL_secret": "asdasd"}' \
INPUT_VALPREFIX='VAL' \
INPUT_VARS='{"VAL_asd": "value", "VAL_qwe": "value2", "test": "value2"}' \
INPUT_CHART=app \
INPUT_NAMESPACE=default \
INPUT_RELEASE=app \
INPUT_VERSION=1234 \
INPUT_TRACK=stable \
INPUT_VALUEFILES='./values-prod.yaml' \
INPUT_VALUES='{"replicaCount": 1, "image": {"repository": "nginx", "tag": "latest"}}' \
node ../index.js
