FROM ubuntu
RUN apt-get update iputils-ping
CMD ["ping", "8.8.8.8"]
