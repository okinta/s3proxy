FROM openresty/openresty:1.15.8.3-centos

RUN set -x \
    \
    # Install zlib so we can decompress files
    && yum install -y gcc zlib zlib-devel \
    && luarocks install lua-zlib \
    && yum autoremove -y gcc zlib-devel \
    \
    # Install htpasswd for HTTP basic authentication
    && yum install -y httpd-tools

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/usr/bin/openresty", "-g", "daemon off;"]
COPY files /
