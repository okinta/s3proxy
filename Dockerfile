FROM openresty/openresty:1.21.4.1-centos-rpm

RUN set -x \
    \
    # Install zlib so we can decompress files
    && yum install -y gcc zlib zlib-devel git \
    && luarocks install lua-zlib \
    && yum autoremove -y gcc zlib-devel \
    \
    # Install htpasswd for HTTP basic authentication
    && yum install -y httpd-tools

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/usr/bin/openresty", "-g", "daemon off;"]
COPY files /
