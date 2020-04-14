#!/bin/sh
if [ ! -f /conf/.env ]; then
	cp /pirately/.env /conf/.env
fi

if [ -f /freenom/.env ]; then
        rm -rf /freenom/.env
fi

ln -s /conf/.env /freenom/.env
cd /freenom/
php run
crond
php -a
