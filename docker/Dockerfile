FROM registry.cn-shanghai.aliyuncs.com/c7n/frontbase:0.9.0
RUN chown -R nginx:nginx /usr/share/nginx/html
COPY --chown=nginx:nginx ./lib/dist /usr/share/nginx/html
RUN chmod +x /usr/share/nginx/html/env.sh
USER 101
ENTRYPOINT ["/usr/share/nginx/html/env.sh"]
CMD ["nginx", "-g", "daemon off;"]
