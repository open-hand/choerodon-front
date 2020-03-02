FROM registry.cn-shanghai.aliyuncs.com/c7n/frontbase:0.8.0
COPY ./lib/dist /usr/local/openresty/nginx/html
RUN chmod +x /usr/local/openresty/nginx/html/env.sh \
    && chown -R www-data:www-data /usr/local/openresty
ENTRYPOINT ["/usr/local/openresty/nginx/html/env.sh"]
CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]