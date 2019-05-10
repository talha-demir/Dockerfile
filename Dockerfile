FROM ubuntu:latest
MAINTAINER Talha Demir 
COPY . /usr/share/nginx/html
USER root
RUN yum update
RUN yum install -y nginx nodejs

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
