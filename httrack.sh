#!/bin/sh

# Most of sites have ssl and httrack dont follow the location so whe have this workarround.
HTTPS_URL=$(curl --head --silent --write-out "%{redirect_url}\n" --output /dev/null $MIRROR_SITE)
# if you set a https site url on env the workarround above will return a empty value and will broke our magic
FINAL_URL=${HTTPS_URL:-$MIRROR_SITE}
echo $FINAL_URL

# Here the magic happens
httrack --update $FINAL_URL -O /tmp/httrack -r1 -%e0 -N100 --preserve -%F ''
mv /tmp/httrack/index-2.html /tmp/site/index.html
tail -f /tmp/site/index.html
