FROM openresty/openresty:1.15.8.3-centos

RUN set -x \
    \
    # Install dependencies
    && yum install -y gcc zlib zlib-devel \
    && luarocks install basexx \
    && luarocks install lua-zlib \
    && luarocks install sha1 \
    && yum autoremove -y gcc zlib-devel \
    \
    # Install htpasswd for HTTP basic authentication
    && yum install -y httpd-tools \
    \
    # Allow AWS settings to be used as environment variables
    && sed -i '1s/^/env AWS_SECRET_KEY;/' \
        /usr/local/openresty/nginx/conf/nginx.conf \
    && sed -i '1s/^/env S3_BUCKET;/' \
        /usr/local/openresty/nginx/conf/nginx.conf

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/usr/bin/openresty", "-g", "daemon off;"]
COPY files /
