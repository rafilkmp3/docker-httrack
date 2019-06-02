docker run -it --rm -e MIRROR_SITE='https://example.com  docker-httracker:latest  bash


version: '3'

services:
  nginx:
    image: nginx:alpine
    ports:
      - 80:80
    volumes:
      - static-content:/usr/share/nginx/html
  httrack:
    image: rafilkmp3/docker-httrack:latest
    environment:
      MIRROR_SITE : https://www.b9.com.br/
    volumes:
      - static-content:/tmp/site/

volumes:
  static-content: