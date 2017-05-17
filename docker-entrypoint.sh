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
	
	playbook)
		COMMAND=$1
		
		shift

		if [ "$DEBUG" == "1" ]; then
			for i in "$@"
			do
			    echo "ARG: $i"
			done

			echo "exec /usr/bin/ansible-$COMMAND $@"
		fi

		exec /usr/bin/ansible-$COMMAND "$@"
		;;

	lint)
		COMMAND=$1
		
		shift

		FIXED_ARGS="--exclude=galaxy" 

		if [ "$DEBUG" == "1" ]; then
			for i in "$@"
			do
			    echo "ARG: $i"
			done

			echo "exec /usr/bin/ansible-$COMMAND $FIXED_ARGS $@"
		fi

		exec /usr/bin/ansible-$COMMAND $FIXED_ARGS "$@"
		;;

	galaxy)
		COMMAND=$1
		
		shift
		
		mkdir -p /wd/galaxy

		FIXED_ARGS="-c -p /wd/galaxy" 
		
		if [ "$DEBUG" == "1" ]; then
			for i in "$@"
			do
			    echo "ARG: $i"
			done

			echo "exec /usr/bin/ansible-galaxy $FIXED_ARGS $@"
		fi

		exec /usr/bin/ansible-galaxy $FIXED_ARGS "$@"
		;;
esac

exec "$@"
