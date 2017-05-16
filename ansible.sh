#!/bin/bash
#set -xv

#
# Bridge to run ansible commands inside of docker.
#
IMAGE=jtilander/ansible:latest

DEBUG=${DEBUG:-0}
WORKDIR=${WORKDIR:-$PWD}

if [ "$DEBUG" == "1" ]; then
	echo "# CWD: $WORKDIR"
	echo "# ansible $@"
fi

docker run --rm -it \
	-v $WORKDIR:/wd \
	-e DEBUG=$DEBUG \
	$IMAGE \
	ansible \
	"$@"
