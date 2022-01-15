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
	fin_status () {
		echo not reached.....
	}
	rtn=`calc_ground_len_after_ball $X_BALL $X_HOLE $X_LENGTH_STAGE` 
	rtn2=`calc_ground_len_after_hole $X_BALL $X_HOLE $X_LENGTH_STAGE` 
	BEFORE_BALL=$X_BALL 
	AFTER_BALL=${rtn} 
	AFTER_HOLE=${rtn2} 
	echo "calc_test_before_ball $BEFORE_BALL"
	echo "calc_test_after_ball $AFTER_BALL"
	echo "calc_test_after_hole $AFTER_HOLE"
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
			echo -n " test cursor_point >> $cursor_point"
			printf '\r'
			cursor_point=$(( $cursor_point + 1 )) 
			cursor_point=$(( $cursor_point % $array_len )) 
			trap "echo \n; break" 2
		done
		sleep 1
		echo "test_cursor_point $cursor_point"
		push_x=$(( ($cursor_point + 4) % $array_len )) 
		echo "Push $push_x !!!"
		X_PUSHED_BALL=$(( $X_BALL + $push_x )) 
		rtn=`calc_ground_len_after_ball $X_PUSHED_BALL $X_HOLE $X_LENGTH_STAGE` 
		rtn2=`calc_ground_len_after_hole $X_PUSHED_BALL $X_HOLE $X_LENGTH_STAGE` 
		BEFORE_BALL=$X_PUSHED_BALL 
		AFTER_BALL=${rtn} 
		AFTER_HOLE=${rtn2} 
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
