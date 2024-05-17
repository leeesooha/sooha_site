#!/bin/bash

ln -s /etc/nginx/sites-available/myconf.conf /etc/nginx/sites-enabled/myconf.conf
rm -rf /etc/nginx/sites-enabled/default

exec "$@"