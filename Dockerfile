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

WORKDIR fr24feed_armhf

ADD start.sh .
RUN chmod +x start.sh

# Env variables for each config file parameter
# defaults as below
ENV PARAM_FR24KEY=none \
    PARAM_RECEIVER=beast-tcp \
    PARAM_HOST=127.0.0.1:30005 \
    PARAM_RAW=no \
    PARAM_BS=no \
    PARAM_MPX=no \
    PARAM_PROCARGS=none \
    PARAM_LOGPATH=/var/log \
    PARAM_LOGMODE=0 \
    PARAM_BIND_INTERFACE=0.0.0.0 \
    PARAM_GT=600

ENTRYPOINT ["./start.sh"]
