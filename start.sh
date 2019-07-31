#!/bin/sh
# startup script that
#1. adds lines to the config ini
#2. launches fr24feed

# detect if feeder key is unset
if [ "${PARAM_FR24KEY}" = "none"]
then
  cat >&2 <<EOF
A feeder key must be specified.
Run this container with the start flag "--signup" to obtain a feeder key and specify your feeder key as an environmental variable.
EOF
  exit 1
fi
# delete any exisitng config file in working dir
rm fr24feed.ini
# create the config file from env vars
echo "fr24key=${PARAM_FR24KEY}" >> fr24feed.ini
echo "receiver=\"${PARAM_RECEIVER}\"" >> fr24feed.ini
echo "host=\"${PARAM_HOST}\"" >> fr24feed.ini
echo "raw=${PARAM_RAW}" >> fr24feed.ini
echo "bs=${PARAM_BS}" >> fr24feed.ini
echo "mpx=${PARAM_MPX}" >> fr24feed.ini
if [ "${PARAM_PROCARGS}" != "none" ]
then
  echo "procargs=\"${PARAM_PROCARGS}\"" >> fr24feed.ini
fi
echo "logpath=\"${PARAM_LOGPATH}\"" >> fr24feed.ini
echo "logmode=\"${PARAM_LOGMDOE}\"" >> fr24feed.ini
echo "bind-interface=\"${PARAM_BIND_INTERFACE}\"" >> fr24feed.ini
echo "gt=${PARAM_GT}" >> fr24feed.ini

# move the config file to correct dir
mv fr24feed.ini /etc/

# start the feeder
./fr24feed