FROM registry.cn-hangzhou.aliyuncs.com/choerodon-tools/frontbase:0.7.0

ENV PRO_API_HOST gateway.choerodon.example.com
ENV PRO_CLIENT_ID choerodonparent
ENV PRO_LOCAL true
ENV PRO_TITLE_NAME Choerodon
ENV PRO_HEADER_TITLE_NAME Choerodon
ENV PRO_COOKIE_SERVER choerodon.example.com
ENV PRO_HTTP http
ENV PRO_AGILE_HOST devops.choerodon.example.com
ENV PRO_WEBSOCKET_SERVER ws://ws.example.com
ENV PRO_DEVOPS_HOST devops.choerodon.example.com
ENV PRO_AGILE_HOST devops.choerodon.example.com

RUN echo "Asia/shanghai" > /etc/timezone;
ADD dist /usr/share/nginx/html
COPY parent-structure/parent-enterpoint.sh /usr/share/nginx/html
COPY parent-structure/dirMenu.yml /usr/share/nginx/html
COPY menu.yml /usr/share/nginx/html/menu.yml
COPY dashboard.yml /usr/share/nginx/html/dashboard.yml
COPY structure/menu /usr/share/nginx/html/menu
COPY structure/dashboard /usr/share/nginx/html/dashboard

RUN chmod 777 /usr/share/nginx/html/parent-enterpoint.sh
ENTRYPOINT ["/usr/share/nginx/html/parent-enterpoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
