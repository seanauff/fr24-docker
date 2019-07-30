FROM debian:stretch-slim

RUN apt-get update &&\
    apt-get install -y --no-install-recommends\
    wget

ENV FLIGHTRADAR_VERSION 1.0.23-8
RUN \
 wget https://repo-feed.flightradar24.com/rpi_binaries/fr24feed_1.0.23-8_armhf.deb &&\
 dpkg -i fr24feed_${FLIGHTRADAR_VERSION}_armhf.deb

ADD fr24feed.ini /etc/fr24feed.ini
WORKDIR fr24feed_arm

ENV FR24_KEY=none
ENTRYPOINT ["./fr24feed", "--fr24key=${FR24_KEY}"]
