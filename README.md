# docker-s3-backup

Syncs a local directory to S3

## Usage

```
$ sudo docker run -e S3_PATH='s3://path-to-s3-bucket/directory' \
-e LOCAL_DIR='/path/to/local/dir' \
-e SLEEP_BETWEEN_SYNCS=60 docker-s3-backup
```
