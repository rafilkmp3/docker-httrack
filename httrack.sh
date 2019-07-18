#!/bin/sh

# Most of sites have ssl and httrack dont follow the location so whe have this workarround. 
FINAL_URL=$(curl --head --silent --write-out "%{redirect_url}\n" --output /dev/null $MIRROR_SITE)
# Here the magic happens 
httrack --update $FINAL_URL -O /tmp/httrack -r1 -%e0 -N100 --preserve -%F ''
mv /tmp/httrack/index-2.html /tmp/site/index.html
tail -f /tmp/site/index.html
