#!/usr/bin/env bash

if [ -z "$S3_BUCKET" ]; then
    echo "Error: S3_BUCKET environment variable must be set" >&2
    exit 1
fi

envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"
