# S3 Proxy

A simple container that implements a proxy for S3.

[Options]It automatically decompresses gzipped S3 content for clients that do not
support gzip.

## Development

### Build

    docker build -t taylord0ng/s3proxy .

### Run

    docker run \
        -e S3_BUCKET=[BUCKET_NAME] \
        -e REGION=[REGION] \
        -e AWS_ACCESS_KEY=[AWS_ACCESS_KEY] \
        -e AWS_SECRET_KEY=[AWS_SECRET_KEY] \
        -e AUTH_KEY=[AUTH_KEY] \
        -p 8080:8080 okinta/s3proxy

Replace the following variables;

* `[BUCKET_NAME]` with the name of your S3 bucket.
* `[REGION]` with the region of your S3 bucket.
* `[AWS_ACCESS_KEY]` with the public key to use to access the S3 bucket.
* `[AWS_SECRET_KEY]` with the private key to use to access the S3 bucket.
* `[AUTH_KEY]` with a key that clients must send in order to authorize the
request. This is optional.
