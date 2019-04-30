#!/bin/bash

declare -a arr=("1" "10" "25")

METRO_PATH="/home/matus/Documents/VGE/vcglib/apps/build/metro/metro"
DATA_PATH="/home/matus/Documents/VGE/"
LIBIGL_PATH="/home/matus/Documents/VGE/libigl/build/tutorial"

> output_log_smoothed.log

for NUM in "${arr[@]}"
do
	echo $NUM 
	echo "-------- $NUM ---------" >> output_log_smoothed.log
	for f in ~/Documents/VGE/data/*/*proc.obj; do
		echo $f

		# OBJECT
		paths=$(echo $f | tr "/" "\n")
		object=$(echo $paths | awk '{print $6}')
		echo "#$object" >> output_log_smoothed.log

		# OPENMESH
		OUTFILE_OM=$DATA_PATH/openmesh_smoothed_objects/$object.smoothed$NUM.obj
		OUTPUT_OM="$(time (./Smoothing $NUM $f $OUTFILE_OM) 2>&1)"
		
		TIME_OM=$(echo $OUTPUT_OM | grep -o "real [0-9]*m[0-9]*\.[0-9]*s" | grep -o "[0-9]*m[0-9]*\.[0-9]*s")
		HAUSDORFF_OM=$($METRO_PATH $f $OUTFILE_OM | grep mean -m 1 | grep -o "[0-9]*\.[0-9]*")
		echo "$TIME_OM	$HAUSDORFF_OM" >> output_log_smoothed.log

		# LIBIGL
		# OUTFILE_LB=$DATA_PATH/libigl_smoothed_objects/$object.smoothed$NUM.obj
		# OUTPUT_LB="$(time (/home/matus/Documents/VGE/libigl/build/tutorial/Mine_smooth_bin $f $OUTFILE_LB $NUM) 2>&1)"
		
		# TIME_LB=$(echo $OUTPUT_LB | grep -o "real [0-9]*m[0-9]*\.[0-9]*s" | grep -o "[0-9]*m[0-9]*\.[0-9]*s")
		# HAUSDORFF_LB=$(timeout 1m $METRO_PATH $f $OUTFILE_LB | grep mean -m 1 | grep -o "[0-9]*\.[0-9]*")
		# echo "LIBIGLLL	$TIME_LB	$HAUSDORFF_LB" >> output_log_smoothed.log


	done

done
