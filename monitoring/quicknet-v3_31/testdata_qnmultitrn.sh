#!/bin/sh

# $Header: /u/drspeech/repos/quicknet2/testdata_qnmultitrn.sh.in,v 1.14 2011/05/20 23:29:30 davidj Exp $
#
# testdata_qnmultitrn.sh.  Generated from testdata_qnmultitrn.sh.in by configure.
#
# This script runs the `qnmultitrn' program, but sets up a useful set of 
# default parameters that use the data files in the `testdata' subdirectory.
# The specificied parameters can be over ridden by using
# "param=value" on the command line.

# *** NOTE ***
# This is only an example used for testing - typically ftr1_file and
# ftr2_file will refer to different feature files.  If you only use
# one feature file, set ftr2_file to be null.  Refering to the same feature
# file twice with each reference using a subset of the features will
# result in roughly the same training results as when using just one feature
# file, but the hidden units will be in a different order and hence
# the weight files are not interchangable.

# This bit takes command line arguments of the form "var=val", and sets
# sh varible `var' to `val'.

while [ $# -gt 0 ]; do
        case "$1" in
        *=*)    key=`echo "$1" | sed "s/=.*//"`
                val=`echo "$1" | sed "s/[^=]*=//"`
		if [ "$val" ]; then
	                eval "$key"=\'"$val"\'
		fi
                unset key val
                shift ;;
        *)      break;;
        esac
done

# The lines below will have substitution made in the configure process
: ${testdata_dir:=NONE/share/quicknet_testdata}
: ${pfile:=$testdata_dir/train1-rasta8+d.pfile}
: ${normfile:=$testdata_dir/train1-rasta8+d.norms}

${qnmultitrn:=./qnmultitrn} \
	ftr1_file=${ftr1_file:=$pfile} \
	ftr1_format=${ftr1_format:="pfile"} \
	ftr1_width=${ftr1_width:=0} \
	ftr2_file=${ftr2_file:=$pfile} \
	ftr2_format=${ftr2_format:="pfile"} \
	ftr2_width=${ftr2_width:=0} \
	unary_file=${unary_file:=""} \
	ftr1_norm_file=${ftr1_norm_file:=$normfile} \
	ftr2_norm_file=${ftr2_norm_file:=$normfile} \
	ftr1_ftr_start=${ftr1_ftr_start:=1} \
	ftr1_ftr_count=${ftr1_ftr_count:=9} \
	ftr2_ftr_start=${ftr2_ftr_start:=10} \
	ftr2_ftr_count=${ftr2_ftr_count:=8} \
	ftr1_delta_order=${ftr1_delta_order:=0} \
	ftr1_delta_win=${ftr1_delta_win:=9} \
	ftr1_norm_mode=${ftr1_norm_mode:=file} \
	ftr1_norm_alpha_m=${ftr1_norm_alpha_m:=0.005} \
	ftr1_norm_alpha_v=${ftr1_norm_alpha_v:=0.005} \
	ftr2_delta_order=${ftr2_delta_order:=0} \
	ftr2_delta_win=${ftr2_delta_win:=9} \
	ftr2_norm_mode=${ftr2_norm_mode:="file"} \
	ftr2_norm_alpha_m=${ftr2_norm_alpha_m:=0.005} \
	ftr2_norm_alpha_v=${ftr2_norm_alpha_v:=0.005} \
	ftr1_window_offset=${ftr1_window_offset:=0} \
	ftr1_window_len=${ftr1_window_len:=9} \
	ftr2_window_offset=${ftr2_window_offset:=0} \
	ftr2_window_len=${ftr2_window_len:=9} \
	unary_window_offset=${unary_window_offset:=3} \
	hardtarget_file=${hardtarget_file:=$pfile} \
	hardtarget_format=${hardtarget_format:=""} \
	hardtarget_window_offset=${hardtarget_window_offset:=4} \
	hardtarget_lastlab_reject=${hardtarget_lastlab_reject:=0} \
	softtarget_file=${softtarget_file:=""} \
	softtarget_format=${softtarget_format:=""} \
	softtarget_width=${softtarget_width:=0} \
	softtarget_window_offset=${softtarget_window_offset:=4} \
	window_extent=${window_extent:=9} \
	train_cache_frames=${train_cache_frames:=10000} \
	train_cache_seed=${train_cache_seed:=0} \
        train_sent_range=${train_sent_range:="0:1719"} \
        cv_sent_range=${cv_sent_range:="1720:1949"} \
	init_weight_file=${init_weight_file:=""} \
	init_weight_format=${init_weight_format:="matlab"} \
	out_weight_file=${out_weight_file:=qnmultiout.mat} \
	out_weight_format=${out_weight_format:="matlab"} \
	log_weight_file=${log_weight_file:=qnmultilog.mat} \
	log_weight_format=${log_weight_format:="matlab"} \
	ckpt_weight_file=${ckpt_weight_file:=qnmultckpt.mat} \
	ckpt_weight_format=${ckpt_weight_format:="matlab"} \
	ckpt_hours=${ckpt_hours:=0} \
	init_random_bias_min=${init_random_bias_min:=-0.1,-4.1} \
	init_random_bias_max=${init_random_bias_max:=0.1,-3.9} \
	init_random_weight_min=${init_random_weight_min:=-0.1} \
	init_random_weight_max=${init_random_weight_max:=0.1} \
	init_random_seed=${init_random_seed:=0} \
	learnrate_schedule=${learnrate_schedule:=newbob} \
	learnrate_vals=${learnrate_vals:=0.008} \
	learnrate_epochs=${learnrate_epochs:=9999} \
	learnrate_scale=${learnrate_scale:=0.5} \
	unary_size=${unary_size:=0} \
	mlp_size=${mlp_size:=153,200,56} \
	mlp_output_type=${mlp_output_type:=softmax} \
	mlp_lrmultiplier=${mlp_lrmultiplier:=1.0} \
	use_pp=${use_pp:=true} \
	use_fe=${use_fe:=false} \
	use_blas=${use_blas:=false} \
	use_cuda=${use_cuda:=false} \
	mlp_bunch_size=${mlp_bunch_size:=16} \
        mlp_threads=${mlp_threads:=1} \
	log_file=${log_file:=-} \
	verbose=${verbose:=false} \
        debug=${debug:=0}

