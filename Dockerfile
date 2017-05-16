FROM alpine:3.5
MAINTAINER Jim Tilander

RUN apk add --no-cache \
		bash \
#		curl \
#		git \
#		make \
		ansible

RUN mkdir -p /wd && rmdir /root && ln -s /wd /root

WORKDIR /wd

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["ansible"]
