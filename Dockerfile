FROM alpine:3.5
MAINTAINER Jim Tilander

RUN apk add --no-cache \
		bash \
#		curl \
#		git \
#		make \
		gcc \
		python \
		python-dev \
		musl-dev \
		libffi-dev \
		openssl-dev \
		py-pip

RUN pip --disable-pip-version-check --no-cache-dir install pywinrm[credssp] ansible

RUN mkdir -p /wd && rmdir /root && ln -s /wd /root

WORKDIR /wd
ENV DEBUG=0

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["ansible"]
