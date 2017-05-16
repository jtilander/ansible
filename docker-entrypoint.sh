#!/bin/bash
set -e

case "$1" in 
	ansible)
		shift

		if [ "$DEBUG" == "1" ]; then
			for i in "$@"
			do
			    echo "ARG: $i"
			done

			echo "exec /usr/bin/ansible $@"
		fi

		exec /usr/bin/ansible "$@"
		;;
esac

exec "$@"