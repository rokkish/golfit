function golfit () {
	X_BALL=$(( $RANDOM % 4)) 
	X_HOLE=$(( $X_BALL + 3)) 
	X_LENGTH_STAGE=$(( $X_HOLE + 1 )) 
	logo_print () {
		echo "
░█▀▀░█▀█░█░░░█▀▀░▀█▀░▀█▀░░░█▀█░█▀█░░░█▀▀░█░█░█▀▀░█░░░█░░░░░█▀▀░█▀▀░█▀▄░▀█▀░█▀█░▀█▀
░█░█░█░█░█░░░█▀▀░░█░░░█░░░░█░█░█░█░░░▀▀█░█▀█░█▀▀░█░░░█░░░░░▀▀█░█░░░█▀▄░░█░░█▀▀░░█░
░▀▀▀░▀▀▀░▀▀▀░▀░░░▀▀▀░░▀░░░░▀▀▀░▀░▀░░░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░░░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀░░░░▀░"
	}
	initial_guid () {
		logo_print
		echo "
██ ███    ██ ██████  ██    ██ ████████     ███████      █████  ███    ██ ██████      ███████ ████████  █████  ██████  ████████     ████████ ██   ██ ███████     ██████   ██████  ██    ██ ██      ███████ ████████ ████████ ███████ 
██ ████   ██ ██   ██ ██    ██    ██        ██          ██   ██ ████   ██ ██   ██     ██         ██    ██   ██ ██   ██    ██           ██    ██   ██ ██          ██   ██ ██    ██ ██    ██ ██      ██         ██       ██    ██      
██ ██ ██  ██ ██████  ██    ██    ██        ███████     ███████ ██ ██  ██ ██   ██     ███████    ██    ███████ ██████     ██           ██    ███████ █████       ██████  ██    ██ ██    ██ ██      █████      ██       ██    █████   
██ ██  ██ ██ ██      ██    ██    ██             ██     ██   ██ ██  ██ ██ ██   ██          ██    ██    ██   ██ ██   ██    ██           ██    ██   ██ ██          ██   ██ ██    ██ ██    ██ ██      ██         ██       ██    ██      
██ ██   ████ ██       ██████     ██        ███████     ██   ██ ██   ████ ██████      ███████    ██    ██   ██ ██   ██    ██           ██    ██   ██ ███████     ██   ██  ██████   ██████  ███████ ███████    ██       ██    ███████ 
                                                                                                                                                                                                                                    "
	}
	roulette_guid () {
		logo_print
		echo "
██████  ██████  ███████ ███████ ███████      ██████ ████████ ██████  ██       ██████      █████  ███    ██ ██████      ███████ ████████  ██████  ██████      ████████ ██   ██ ███████     ██████   ██████  ██    ██ ██      ███████ ████████ ████████ ███████  
██   ██ ██   ██ ██      ██      ██          ██         ██    ██   ██ ██      ██          ██   ██ ████   ██ ██   ██     ██         ██    ██    ██ ██   ██        ██    ██   ██ ██          ██   ██ ██    ██ ██    ██ ██      ██         ██       ██    ██      
██████  ██████  █████   ███████ ███████     ██         ██    ██████  ██      ██          ███████ ██ ██  ██ ██   ██     ███████    ██    ██    ██ ██████         ██    ███████ █████       ██████  ██    ██ ██    ██ ██      █████      ██       ██    █████   
██      ██   ██ ██           ██      ██     ██         ██    ██   ██ ██      ██          ██   ██ ██  ██ ██ ██   ██          ██    ██    ██    ██ ██             ██    ██   ██ ██          ██   ██ ██    ██ ██    ██ ██      ██         ██       ██    ██      
██      ██   ██ ███████ ███████ ███████      ██████    ██    ██   ██ ███████  ██████     ██   ██ ██   ████ ██████      ███████    ██     ██████  ██             ██    ██   ██ ███████     ██   ██  ██████   ██████  ███████ ███████    ██       ██    ███████ 
                                                                                                                                                                                                            						      "
	}
	calc_ground_len_after_ball () {
		AFTER_BALL=$(( $2 - $1 )) 
		echo $AFTER_BALL
	}
	calc_ground_len_after_hole () {
		AFTER_HOLE=$(( $3 - $2 )) 
		echo $AFTER_HOLE
	}
	show_status () {
		echo test_show_status $1 $2 $3
		echo "*****************************"
		repeat $(( $1 + $2 + $3 + 2 ))
		do
			tput setab 14 && echo -n "~"
		done
		tput setab 0 && echo ""
		repeat $1
		do
			echo -n "_"
		done
		echo -n "o"
		repeat $2
		do
			echo -n "_"
		done
		if [ $2 = 0 ]
		then
			echo -n ""
		else
			echo -n " "
		fi
		repeat $3
		do
			echo -n "_"
		done
		echo ""
		repeat $(( $1 + $2 ))
		do
			tput setab 1 && echo -n " "
		done
		if [ $2 = 0 ]
		then
			echo -n ""
		else
			tput setab 1 && echo -n " "
		fi
		tput setab 0 && echo -n "U"
		tput setab 1 && repeat $3
		do
			echo -n " "
		done
		tput setab 0 && echo "\n*****************************"
	}
	fin_status () {
		if [ $1 = $2 ]
		then
			echo "
	██ ██ ██ ██ ██ ██ ██ ██ ██     ██   ██  ██████  ██      ███████     ██ ███    ██      ██████  ███    ██ ███████     ██ ██ ██ ██ ██ ██ ██ ██ ██
	██ ██ ██ ██ ██ ██ ██ ██ ██     ██   ██ ██    ██ ██      ██          ██ ████   ██     ██    ██ ████   ██ ██          ██ ██ ██ ██ ██ ██ ██ ██ ██
	██ ██ ██ ██ ██ ██ ██ ██ ██     ███████ ██    ██ ██      █████       ██ ██ ██  ██     ██    ██ ██ ██  ██ █████       ██ ██ ██ ██ ██ ██ ██ ██ ██
	                               ██   ██ ██    ██ ██      ██          ██ ██  ██ ██     ██    ██ ██  ██ ██ ██                                    
	██ ██ ██ ██ ██ ██ ██ ██ ██     ██   ██  ██████  ███████ ███████     ██ ██   ████      ██████  ██   ████ ███████     ██ ██ ██ ██ ██ ██ ██ ██ ██ "                                                                                                                       
		elif [ $1 ] < $2
		then
			echo "
	███    ██  ██████  ████████     ██████  ███████  █████   ██████ ██   ██ ███████ ██████  
	████   ██ ██    ██    ██        ██   ██ ██      ██   ██ ██      ██   ██ ██      ██   ██ 
	██ ██  ██ ██    ██    ██        ██████  █████   ███████ ██      ███████ █████   ██   ██ 
	██  ██ ██ ██    ██    ██        ██   ██ ██      ██   ██ ██      ██   ██ ██      ██   ██ 
	██   ████  ██████     ██        ██   ██ ███████ ██   ██  ██████ ██   ██ ███████ ██████  "
		elif [ $1 ] > $2
		then
			echo "
	 ██████  ██    ██ ███████ ██████       ██████   ██████   █████  ██                            
	██    ██ ██    ██ ██      ██   ██     ██       ██    ██ ██   ██ ██                      
	██    ██ ██    ██ █████   ██████      ██   ███ ██    ██ ███████ ██                      
	██    ██  ██  ██  ██      ██   ██     ██    ██ ██    ██ ██   ██ ██                      
	 ██████    ████   ███████ ██   ██      ██████   ██████  ██   ██ ███████     ██ ██ ██ ██ "
		fi
	}
	rtn=`calc_ground_len_after_ball $X_BALL $X_HOLE $X_LENGTH_STAGE` 
	rtn2=`calc_ground_len_after_hole $X_BALL $X_HOLE $X_LENGTH_STAGE` 
	BEFORE_BALL=$X_BALL 
	AFTER_BALL=${rtn} 
	AFTER_HOLE=${rtn2} 
	echo "calc_test_before_ball $BEFORE_BALL"
	echo "calc_test_after_ball $AFTER_BALL"
	echo "calc_test_after_hole $AFTER_HOLE"
	input="" 
	array=(0 1 2 3 4) 
	array_len=5 
	tput clear
	initial_guid
	read input
	roulette_guid
	echo "press Ctrl+C and stop the roulette"
	tput clear
	logo_print
	show_status $BEFORE_BALL $AFTER_BALL $AFTER_HOLE
	while true
	do
		for item in $array
		do
			echo -n "$item "
		done
		echo " "
		cursor_point=0 
		while [ $input = "s" ]
		do
			counter=0 
			sleep 0.3
			for item in $array
			do
				if [ $counter = $cursor_point ]
				then
					echo -n "= "
				else
					echo -n "- "
				fi
				counter=$(( $counter + 1 )) 
			done
			printf '\r'
			cursor_point=$(( $cursor_point + 1 )) 
			cursor_point=$(( $cursor_point % $array_len )) 
			trap "echo \n; break" 2
		done
		sleep 1
		push_x=$(( ($cursor_point + 4) % $array_len )) 
		X_PUSHED_BALL=$(( $X_BALL + $push_x )) 
		rtn=`calc_ground_len_after_ball $X_PUSHED_BALL $X_HOLE $X_LENGTH_STAGE` 
		rtn2=`calc_ground_len_after_hole $X_PUSHED_BALL $X_HOLE $X_LENGTH_STAGE` 
		BEFORE_BALL=$X_PUSHED_BALL 
		AFTER_BALL=${rtn} 
		AFTER_HOLE=${rtn2} 
		sleep 1
		tput clear
		logo_print
		show_status $BEFORE_BALL $AFTER_BALL $AFTER_HOLE
		sleep 1
		break
	done
	sleep 1
	fin_status $X_PUSHED_BALL $X_HOLE
	echo fin
}
