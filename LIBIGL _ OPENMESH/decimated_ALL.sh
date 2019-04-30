#!/bin/bash

declare -a arr=("0.25" "0.5" "0.75")

METRO_PATH="/home/matus/Documents/VGE/vcglib/apps/build/metro/metro"
DATA_PATH="/home/matus/Documents/VGE/"
LIBIGL_PATH="/home/matus/Documents/VGE/libigl/build/tutorial"

> output_log_decimate.log

for NUM in "${arr[@]}"
do
	echo $NUM 
	echo "-------- $NUM ---------" >> output_log_decimate.log
	for f in ~/Documents/VGE/data_decimate/*/*; do
		echo $f
		# OBJECT
		paths=$(echo $f | tr "/" "\n")
		object=$(echo $paths | awk '{print $6}')
		echo "#$object" >> output_log_decimate.log

		# OPENMESH
		OUTFILE_OM=$DATA_PATH/openmesh_decimated_objects/$object.decimated$NUM.obj
		OUTPUT_OM="$(time (./OwnProject -M EL -i $f -o $OUTFILE_OM -n $NUM -v) 2>&1)"
		
		TIME_OM=$(echo $OUTPUT_OM | grep -o "real [0-9]*m[0-9]*\.[0-9]*s" | grep -o "[0-9]*m[0-9]*\.[0-9]*s")
		HAUSDORFF_OM=$($METRO_PATH $f $OUTFILE_OM | grep mean -m 1 | grep -o "[0-9]*\.[0-9]*")
		echo "OPENMESH	$TIME_OM	$HAUSDORFF_OM" >> output_log_decimate.log

		# LIBIGL
		OUTFILE_LB=$DATA_PATH/libigl_decimated_objects/$object.decimated$NUM.obj
		COLLAPSES=$(echo $OUTPUT_OM | grep -o "executed collapses: [0-9]*" | grep -o "[0-9]*")
		echo "COLLAPSES $COLLAPSES"
		OUTPUT_LB="$(time (/home/matus/Documents/VGE/libigl/build/tutorial/Mine_decimation_bin $f $OUTFILE_LB $COLLAPSES) 2>&1)"
		
		TIME_LB=$(echo $OUTPUT_LB | grep -o "real [0-9]*m[0-9]*\.[0-9]*s" | grep -o "[0-9]*m[0-9]*\.[0-9]*s")
		HAUSDORFF_LB=$($METRO_PATH $f $OUTFILE_LB | grep mean -m 1 | grep -o "[0-9]*\.[0-9]*")
		echo "LIBIGLLL	$TIME_LB	$HAUSDORFF_LB" >> output_log_decimate.log


	done

done
