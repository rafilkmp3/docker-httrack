FROM ubuntu
RUN apt-get update \
    && apt-get install -y vim httrack\
    && rm -rf /var/lib/apt/lists/* 

VOLUME [ "/tmp/site" ]
COPY httrack.sh /httrack.sh
RUN chmod 777 /httrack.sh
ENTRYPOINT [ "bash", "-c" ]
CMD [ "/httrack.sh" ]
