#!/bin/sh


mkdir -p /etc/nginx/sites-available
mkdir -p /etc/nginx/sites-enabled

ln -s /etc/nginx/sites-available/myconf.conf /etc/nginx/sites-enabled/myconf.conf
rm -rf /etc/nginx/http.d/default.conf
#!/bin/sh

# Nginx 설정 파일 경로
NGINX_CONF="/etc/nginx/nginx.conf"

# 추가할 라인
INCLUDE_LINE="include /etc/nginx/sites-enabled/*;"

# 이미 추가된 줄이 있는지 확인
if grep -Fxq "$INCLUDE_LINE" "$NGINX_CONF"
then
    echo "라인이 이미 존재합니다: $INCLUDE_LINE"
else
    # 'include /etc/nginx/http.d/*.conf;' 라인 바로 아래에 새 라인 추가
    sed -i "/include \/etc\/nginx\/http.d\/\*.conf;/a \    \t$INCLUDE_LINE" "$NGINX_CONF"
    echo "라인이 성공적으로 추가되었습니다: $INCLUDE_LINE"
fi


exec "$@"