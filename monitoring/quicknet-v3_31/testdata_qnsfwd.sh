#!/bin/sh

# $Header: /u/drspeech/repos/quicknet2/testdata_qnsfwd.sh.in,v 1.25 2006/02/02 23:55:30 davidj Exp $
#
# testdata_qnsfwd.sh.  Generated from testdata_qnsfwd.sh.in by configure.
#
# This script runs the `qnsfwd' program, but sets up a useful set of 
# default parameters that use the data files in the `testdata' subdirectory.
# The specificied parameters can be over ridden by using
# "param=value" on the command line.

# *** NOTE ***
# This is only an example used for testing - typically ftr1_file and
# ftr2_file will refer to different feature files.  If you only use
# one feature file, set ftr2_file to be null.

# This bit takes command line arguments of the form "var=val", and sets
# sh varible `var' to `val'.
# This version even allows `val' to contain equals signs, always nice.

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
: ${weightfile:=${testdata_dir}/ntimit-rasta-phones-200.weights}


# Range alternatives
if [ -n "$fwd_sent_range" ]; then
   FWD_RANGE_SPEC="fwd_sent_range=${fwd_sent_range:=}"
else
   FWD_RANGE_SPEC="fwd_sent_start=${fwd_sent_start:=0} \
                     fwd_sent_count=${fwd_sent_count:=1720}"
fi

${qnsfwd:=./qnsfwd} \
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
	ftr1_window_offset=${ftr1_window_offset:=0} \
	ftr1_window_len=${ftr1_window_len:=9} \
	ftr2_window_offset=${ftr2_window_offset:=0} \
	ftr2_window_len=${ftr2_window_len:=9} \
	ftr1_norm_mode=${ftr1_norm_mode:=file} \
	ftr1_norm_alpha_m=${ftr1_norm_alpha_m:=0.005} \
	ftr1_norm_alpha_v=${ftr1_norm_alpha_v:=0.005} \
	ftr2_norm_mode=${ftr2_norm_mode:="file"} \
	ftr2_norm_alpha_m=${ftr2_norm_alpha_m:=0.005} \
	ftr2_norm_alpha_v=${ftr2_norm_alpha_v:=0.005} \
	ftr1_delta_order=${ftr1_delta_order:=0} \
	ftr1_delta_win=${ftr1_delta_win:=9} \
	ftr2_delta_order=${ftr2_delta_order:=0} \
	ftr2_delta_win=${ftr2_delta_win:=9} \
	unary_window_offset=${unary_window_offset:=3} \
	hardtarget_file=${hardtarget_file:=$pfile} \
	hardtarget_format=${hardtarget_format:=} \
	hardtarget_window_offset=${hardtarget_window_offset:=4} \
	hardtarget_lastlab_reject=${hardtarget_lastlab_reject:=0} \
	window_extent=${window_extent:=9} \
	$FWD_RANGE_SPEC \
	init_weight_file=${init_weight_file:=$weightfile} \
	unary_size=${unary_size:=0} \
	unary_enumerate=${unary_enumerate:=false} \
	mlp3_input_size=${mlp3_input_size:=153} \
	mlp3_hidden_size=${mlp3_hidden_size:=200} \
	mlp3_output_size=${mlp3_output_size:=56} \
	mlp3_output_type=${mlp3_output_type:=softmax} \
	mlp3_pp=${mlp3_pp:=true} \
	mlp3_blas=${mlp3_blas:=false} \
        mlp3_bunch_size=${mlp3_bunch_size:=16} \
        mlp3_threads=${mlp3_threads:=1} \
	realtime=${realtime:=false} \
	realtime_latency=${realtime_latency:=64} \
	activation_file=${activation_file:=qnstestdata.binact} \
	activation_format=${activation_format:=rapbin} \
	log_file=${log_file:=-} \
	verbose=${verbose:=false} \
	debug=${debug:=0} \
	${other_args:=}

