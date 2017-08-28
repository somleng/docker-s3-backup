#!/bin/sh

set -e

if [ "$1" = 'sync' ]; then
  : ${LOCAL_DIR:=/data}
  exec aws s3 sync $LOCAL_DIR $S3_PATH --sse
else
  exec "$@"
fi
