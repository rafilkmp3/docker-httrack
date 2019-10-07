##### Run httrack once standalone

```
docker run -it --rm -e MIRROR_SITE="https://example.com" -v ./sitecloned:/tmp/site rafilkmp3/docker-httrack:latest 
```
##### Run httrack and serve webpage using nginx

Using `docker-compose.yaml`
```
version: '3'

services:
  nginx:
    image: jtreminio/php-apache:7.2
    ports:
      - 8080:80
    volumes:
      - static-content:/var/www/
    environment:
      VHOST : "wordpress"
  httrack:
    image: rafilkmp3/docker-httrack:latest
    environment:
      MIRROR_SITE : https://example.com
    volumes:
      - static-content:/tmp/site/

volumes:
  static-content:
```