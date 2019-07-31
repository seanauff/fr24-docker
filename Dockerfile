FROM debian:stretch-slim

RUN apt-get update &&\
    apt-get install -y --no-install-recommends\
    apt-utils\
    wget\
    ca-certificates

ENV FLIGHTRADAR_VERSION 1.0.23-8
RUN \
 wget https://repo-feed.flightradar24.com/rpi_binaries/fr24feed_${FLIGHTRADAR_VERSION}_armhf.tgz &&\
 tar zxf fr24feed_${FLIGHTRADAR_VERSION}_armhf.tgz

ADD fr24feed.ini /etc/fr24feed.ini
WORKDIR fr24feed_armhf

ADD start.sh .

# Env variables for each config file parameter
# defaults as below
ENV PARAM_FR24KEY=none
ENV PARAM_RECEIVER=beast-tcp
ENV PARAM_HOST=127.0.0.1:30005
ENV PARAM_RAW=no
ENV PARAM_BS=no
ENV PARAM_MPX=no
ENV PARAM_PROCARGS=none
ENV PARAM_LOGPATH=/var/log
ENV PARAM_LOGMODE=0
ENV PARAM_BIND_INTERFACE=0.0.0.0
ENV PARAM_GT=600

ENTRYPOINT ["./start.sh"]
