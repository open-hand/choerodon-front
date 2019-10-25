FROM registry.cn-hangzhou.aliyuncs.com/choerodon-tools/frontbase:0.7.0

RUN echo "Asia/shanghai" > /etc/timezone;
ADD ./lib/dist /usr/share/nginx/html

RUN chmod 777 /usr/share/nginx/html/env.sh

ENTRYPOINT ["/usr/share/nginx/html/env.sh"]
CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
