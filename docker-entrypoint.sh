#!/bin/sh

set -e

if [ "$1" = 'sync' ]; then
  : ${SLEEP_BETWEEN_SYNCS:=1}
  : ${LOCAL_DIR:=/data}

  cleanup ()
  {
    kill -s SIGTERM $!
    exit 0
  }

  trap cleanup SIGINT SIGTERM

  while [ 1 ]
  do
    aws s3 sync $LOCAL_DIR $S3_PATH --sse
    sleep $SLEEP_BETWEEN_SYNCS &
    wait $!
  done
fi

exec "$@"
