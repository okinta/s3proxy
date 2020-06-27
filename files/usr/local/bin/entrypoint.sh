#!/usr/bin/env bash

if [ -z "$S3_BUCKET" ]; then
    echo "Error: S3_BUCKET environment variable must be set" >&2
    exit 1
fi

if [ -z "$S3_BUCKET_URL" ]; then
    echo "Error: S3_BUCKET_URL environment variable must be set" >&2
    exit 1
fi

if [ -z "$AWS_ACCESS_KEY" ]; then
    echo "Error: AWS_ACCESS_KEY environment variable must be set" >&2
    exit 1
fi

if [ -z "$AWS_SECRET_KEY" ]; then
    echo "Error: AWS_SECRET_KEY environment variable must be set" >&2
    exit 1
fi

# Configure authentication if set
export AUTH_BASIC=off
if [ -n "$AUTH_KEY" ]; then
    htpasswd -cb /etc/nginx/conf.d/.htpasswd nuget "$AUTH_KEY" &> /dev/null
    AUTH_BASIC=nuget
fi

envsubst '$S3_BUCKET $S3_BUCKET_URL $AWS_ACCESS_KEY $AWS_SECRET_KEY $AUTH_BASIC' \
    < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"
