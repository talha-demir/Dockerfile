FROM joycoding/centos-nginx-nodejs
MAINTAINER Talha Demir
COPY . /usr/share/nginx/html
USER root
RUN yum -y update

#varsayılan nginx.conf'u kaldır
RUN rm -v /etc/nginx/nginx.conf

#nginx.conf dosyasını etc/nginx'e ekle
ADD nginx.conf /etc/nginx

#static dosyaların olduğu dosya
ADD web /var/www/html

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80

CMD service nginx start
