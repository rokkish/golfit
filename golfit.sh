function golfit () {
	echo "test"
	X_BALL=2 
	X_HOLE=8 
	X_LENGTH_STAGE=16 
	echo $X_BALL $X_HOLE $X_LENGTH_STAGE
	calc_ground_len_after_ball () {
		AFTER_BALL=$(( $2 - $1 )) 
		echo $AFTER_BALL
	}
	calc_ground_len_after_hole () {
		AFTER_HOLE=$(( $3 - $2 )) 
		echo $AFTER_HOLE
	}
	show_status () {
		echo $1 $2 $3
		echo "*****************************"
		repeat $1
		do
			echo -n "_"
		done
		echo -n "o"
		repeat $2
		do
			echo -n "_"
		done
		echo -n " "
		repeat $3
		do
			echo -n "_"
		done
		echo ""
		repeat $(( $1 + $2 + 1 ))
		do
			echo -n " "
		done
		echo -n "U"
		repeat $3
		do
			echo -n " "
		done
		echo "\n*****************************"
	}
	num_push_ball () {
		echo $(($1 - 1))
	}
	fin_status () {
		echo not reached.....
	}
	rtn=`calc_ground_len_after_ball $X_BALL $X_HOLE $X_LENGTH_STAGE` 
	rtn2=`calc_ground_len_after_hole $X_BALL $X_HOLE $X_LENGTH_STAGE` 
	BEFOREBALL=$X_BALL 
	echo "AFTER_BALL=${rtn}"
	echo "AFTER_HOLE=${rtn2}"
	echo "calc_test $BEFORE_BALL $AFTER_BALL $AFTER_HOLE$X_BALL"
	show_status $BEFORE_BALL $AFTER_BALL $AFTER_HOLE
	input="" 
	array=(0 1 2 3 4) 
	array_len=5 
	echo -n "input s and start the roulette >>> "
	read input
	echo "press Ctrl+C and stop the roulette"
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
			cursor_point=$(( $cursor_point % $array_len )) 
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
			trap "echo \n; echo Push $cursor_point !!! ; break" 2
			printf '\r'
			cursor_point=$(( $cursor_point + 1 )) 
		done
		sleep 1
		num_push='num_push_ball $cursor_point' 
		sleep 1
		echo "*****************"
		echo "**** results ****"
		echo "*****************"
		sleep 1
		show_status $BEFORE_BALL $AFTER_BALL $AFTER_HOLE
		sleep 1
		fin_status
		break
	done
	sleep 1
	echo fin
}
