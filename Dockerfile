FROM alpine:3.11.6
RUN apk update \
 && apk add nginx wget openssl curl bash nano
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/
COPY index.html /www 
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 443
CMD [ "nginx" ]
