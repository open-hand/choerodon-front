FROM registry.choerodon.com.cn/tools/frontbase:0.5.0

ENV PRO_API_HOST gateway.choerodon.com.cn
ENV PRO_CLIENT_ID choerodonparent
ENV PRO_LOCAL true
ENV PRO_TITLE_NAME Choerodon
ENV PRO_HEADER_TITLE_NAME Choerodon
ENV PRO_COOKIE_SERVER choerodon.com.cn
ENV PRO_HTTP http

RUN echo "Asia/shanghai" > /etc/timezone;
ADD dist /usr/share/nginx/html
COPY ./choerodon-front-iam/boot/structure/enterpoint.sh /usr/share/nginx/html
COPY config.yml /usr/share/nginx/html
COPY ./choerodon-front-iam/boot/structure/sql.py /usr/share/nginx/html
RUN chmod 777 /usr/share/nginx/html/enterpoint.sh
ENTRYPOINT ["/usr/share/nginx/html/enterpoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
