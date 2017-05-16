#!/bin/bash
set -e

case "$1" in 
	ansible)
		shift
		exec /usr/bin/ansible $*
		;;
esac

exec "$@"