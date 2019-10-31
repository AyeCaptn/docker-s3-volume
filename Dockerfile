FROM python:alpine

RUN pip install awscli

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /mnt/s3

VOLUME ["/mnt/s3"]

ENTRYPOINT ["/entrypoint.sh"]