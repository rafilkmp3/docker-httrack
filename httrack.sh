#!/bin/sh

# we need a htaccess tunned to support httrack mirrored site 
cp /tmp/.htaccess /tmp/site/.htaccess

# Most of sites have ssl and httrack dont follow the location so whe have this workarround.
HTTPS_URL=$(curl --head --silent --write-out "%{redirect_url}\n" --output /dev/null $MIRROR_SITE)
# if you set a https site url on env the workarround above will return a empty value and will broke our magic
FINAL_URL=${HTTPS_URL:-$MIRROR_SITE}
echo Mirror site: $FINAL_URL
echo Mirror depth: $MIRROR_DEPTH
echo Mirror external link depth :$EXTERNAL_LINKS_DEPTH

# Here the magic happens
if [[ $FULL_CLONE == true ]]; then
    echo "php artisan schedule:run "
    httrack --update  $FINAL_URL -O /tmp/site -N100 -I0 -N "%p/%n%[month].%t" --max-rate 0 --disable-security-limits --near  -v -c64
else
    httrack --update $FINAL_URL -O /tmp/httrack -r$MIRROR_DEPTH -%e$EXTERNAL_LINKS_DEPTH -N100 --preserve -%F ''
    mv /tmp/httrack/index-2.html /tmp/site/index.html
fi

chmod -R 777 /tmp/site/*
tail -f /tmp/site/index*.html
