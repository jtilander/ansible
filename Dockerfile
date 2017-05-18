FROM alpine:3.5
MAINTAINER Jim Tilander

RUN apk add --no-cache \
		bash \
		gcc \
		python \
		python-dev \
		musl \
		libffi \
		openssl \
		musl-dev \
		libffi-dev \
		openssl-dev \
		py-pip && \
	\
	pip --disable-pip-version-check --no-cache-dir install pywinrm[credssp] ansible ansible-lint && \
	\
	apk del --no-cache \
		gcc \
		python-dev \
		musl-dev \
		libffi-dev \
		openssl-dev

RUN mkdir -p /wd && rmdir /root && ln -s /wd /root

WORKDIR /wd
ENV DEBUG=0

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["ansible"]
