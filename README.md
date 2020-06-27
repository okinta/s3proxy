# S3 Proxy

A simple container that implements a proxy for S3.

It automatically decompresses gzipped S3 content for clients that do not
support gzip.

(Currently only supports buckets that are public.)

## Development

### Build

    docker build -t okinta/s3proxy .

### Run

    docker run \
        -e S3_BUCKET=[BUCKET_URL] \
        -e AWS_ACCESS_KEY=[AWS_ACCESS_KEY] \
        -e AWS_SECRET_KEY=[AWS_SECRET_KEY] \
        -e AUTH_KEY=[AUTH_KEY] \
        -p 8080:8080 okinta/s3proxy

Replace `[BUCKET_URL]` with the public address of your S3 bucket. Optionally,
replace `[AUTH_KEY]` with a key that clients must send in order to authorize
the request.
