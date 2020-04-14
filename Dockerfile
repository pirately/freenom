FROM php:7.3.1-alpine3.8
MAINTAINER pirately <dragonrobe@gmail.com>

RUN apk add git tzdata && \
	git clone https://github.com/luolongfei/freenom.git && \
	cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	apk del tzdata git && \
	mkdir -p pirately && \
	cp /freenom/.env.example /pirately/.env && \
	rm -rf /freenom/.env.example && \
	echo '00 08 * * * cd /freenom/ && php run >/dev/null 2>&1'>>/var/spool/cron/crontabs/root

COPY start.sh /freenom/
RUN chmod +x /freenom/start.sh

VOLUME ["/conf"]
CMD ["/freenom/start.sh"]
