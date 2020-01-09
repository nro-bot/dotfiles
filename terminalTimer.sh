# script to create timer in terminal
# Jason Atwood
# 2013/6/22
#!/bin/sh

# start up 
#echo "starting timer script ..." 
#sleep 1 # seconds

# get input from user
if [[ $1 ]]; then
    DURATION=$1
else
    read -p "Timer for how many minutes? (Default 25) " -e DURATION 
    #read -p "Timer for how many minutes? " -i 25 -e DURATION 
    if [[ !DURATION ]]; then
        DURATION=25
    fi
fi
DURATION=$(( $DURATION*60 )) # convert minutes to seconds

# get start time
START=$(date +%s)
			
setterm -term linux -back red -fore white # use setterm to change background color
printf '\e[8;4;1t'

# infinite loop
while [ -1 ]; do

	# do math	
	NOW=$(date +%s)				# get time now in seconds
	DIF=$(( $NOW-$START ))			# compute diff in seconds
	ELAPSE=$(( $DURATION-$DIF ))		# compute elapsed time in seconds
	MINS=$(( $ELAPSE/60 ))			# convert to minutes... (dumps remainder from division)
	SECS=$(( $ELAPSE - ($MINS*60) )) 	# ... and seconds

	# conditional
	if [ $MINS == 0 ] && [ $SECS == 0 ]	# if mins = 0 and secs = 0 (i.e. if time expired)
	then 					# blink screen
        clear;
        #zenity --info --text "$(date);$(pwd)"
        notify-send "Time's up! $((DURATION/60)) minutes"
        #spd-say ""
        #spd-say "Your time is up! $((DURATION/60)) minutes"
        echo "Your time is up! $((DURATION/60)) minutes" | festival --tts

        play "./Computer_Magic.wav"
		for i in `seq 1 180`;    		# for i = 1:180 (i.e. 180 seconds)
		do
			clear					# flash on
			setterm -term linux -back green -fore white # use setterm to change background color
			echo "00:00                             		" # extra tabs for visibiltiy

			sleep 0.5

			clear					# flash off
			setterm -term linux -default		# clear setterm changes from above 
			echo "00:00" 				# (i.e. go back to white text on black background)
			sleep 0.5	
		done  					# end for loop 
		break					# end script

	else 					# else, time is not expired
        OUTPUT=$(clear; echo "$MINS:$SECS" | toilet -f future --filter crop ) # display time
        #OUTPUT=$(clear; echo "$MINS:$SECS" | toilet -f mono12 --filter crop ) # display time
        echo "$OUTPUT"
		sleep 1 # sleep 1 second
	fi					# end if
done	# end while loop	
