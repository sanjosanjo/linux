#!/usr/bin/bash
sudo service cron status

function check_and_mount {
DRIVELETTER=$1
DIR="/mnt/$DRIVELETTER"
if [ -d "$DIR" ]
then
	if [ "$(ls -A $DIR)" ]; then
     		echo "$DIR is mounted"
     	else
		echo "$DIR is Empty.  Mounting..."
		sudo mount -t drvfs $DRIVELETTER: $DIR
		sleep 2
		if [ "$(ls -A $DIR)" ]; then
     		echo "$DIR is now mounted"
		else
			echo "$DIR is still unmounted.  Trying again ..."
			sudo mount -t drvfs $DRIVELETTER: $DIR
			sleep 2
			if [ "$(ls -A $DIR)" ]; then
				echo "$DIR is now mounted"
			else
				echo "Cannot mount $DIR, something is wrong ..."
			fi
		fi
	fi
		else
	echo "Directory $DIR not found."
fi
}
check_and_mount u
check_and_mount p
check_and_mount h
