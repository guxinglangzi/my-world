#!/bin/bash

# Auto suspend and wake-up script

# Puts the computer on standby and automatically wakes it up after specified period.

LOG="auto_s3_$(date +'%F-%T').log"

# Do more cycles, modify the COUNT.
COUNT=30
TIME=20

for (( i=1; $i <= $COUNT; i=$i+1)); do
	# Let user know what we're going to do.
	echo "$i/$COUNT times of S3."
	echo "$i/$COUNT times of S3." >>$LOG
	date >>$LOG
	echo >>$LOG
	echo "To cancel, press Ctrl+c within the next 5 seconds."

	sleep 5

	killall rtcwake

	# Set wake up time after 10 second.
	rtcwake -u -s $TIME -m on &

	# Give rtcwake some time to make its stuff
	sleep 5

	# Then suspend
	pm-suspend

	#if [ "$?" -eq "0" ]; then
	#	echo "Successful!" >> $LOG
	#else
	#	echo "Failed!" >> $LOG
	#fi

done
