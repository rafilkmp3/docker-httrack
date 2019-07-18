httrack --update $MIRROR_SITE -O /tmp/httrack -r1 -%e0 -N100 --preserve -%F ''
mv /tmp/httrack/index-2.html /tmp/site/index.html
tail -f /tmp/site/index.html
