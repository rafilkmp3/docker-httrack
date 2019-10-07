FROM ubuntu
ENV MIRROR_DEPTH 1
ENV EXTERNAL_LINKS_DEPTH 0 
ENV FULL_CLONE false
ADD .htaccess /tmp/.htaccess
RUN apt-get update \
    && apt-get install -y vim httrack curl \
    && rm -rf /var/lib/apt/lists/* 

VOLUME [ "/tmp/site" ]
COPY httrack.sh /httrack.sh
RUN chmod 777 /httrack.sh
ENTRYPOINT [ "bash", "-c" ]
CMD [ "/httrack.sh" ]
