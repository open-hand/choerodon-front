#!/bin/bash
set -e

if [ "$PRO_CUSTOM_THEME_COLOR" == "" ] 
then 
    PRO_CUSTOM_THEME_COLOR="undefined"
fi

find /usr/share/nginx/html -name '*.js' | xargs sed -i "s localhost:http $PRO_HTTP g"
find /usr/share/nginx/html -name '*.js' | xargs sed -i "s localhost:8080 $PRO_API_HOST g"
find /usr/share/nginx/html -name '*.js' | xargs sed -i "s localhost:clientId $PRO_CLIENT_ID g"
find /usr/share/nginx/html -name '*.js' | xargs sed -i "s localhost:local $PRO_LOCAL g"
find /usr/share/nginx/html -name '*.js' | xargs sed -i "s localhost:headertitlename $PRO_HEADER_TITLE_NAME g"
find /usr/share/nginx/html -name '*.js' | xargs sed -i "s localhost:cookieServer $PRO_COOKIE_SERVER g"
find /usr/share/nginx/html -name '*.html' | xargs sed -i "s localhost:titlename $PRO_TITLE_NAME g"
find /usr/share/nginx/html -name '*.js' | xargs sed -i "s POD_WEBSOCKET_URL $PRO_DEVOPS_HOST g"
find /usr/share/nginx/html -name '*.js' | xargs sed -i "s SERVICES_URL_EXAMPLE $PRO_AGILE_HOST g"
find /usr/share/nginx/html -name '*.js' | xargs sed -i "s localhost:fileserver $PRO_FILE_SERVER g"
find /usr/share/nginx/html -name '*.js' | xargs sed -i "s localhost:wsserver $PRO_WEBSOCKET_SERVER g"
find /usr/share/nginx/html -name '*.js' | xargs sed -i "s localhost:customthemecolor $PRO_CUSTOM_THEME_COLOR g"

exec "$@"
