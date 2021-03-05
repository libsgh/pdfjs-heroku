FROM nginx:1.19.3-alpine
ENV TZ=Asia/Shanghai
RUN apk add --no-cache --virtual .build-deps ca-certificates bash curl unzip php7
COPY nginx/default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/pdfjs-2.6.347-dist /usr/share/nginx/html/pdfjs-2.6.347-dist
COPY configure.sh /configure.sh
RUN chmod +x /configure.sh

ENTRYPOINT ["sh", "/configure.sh"]