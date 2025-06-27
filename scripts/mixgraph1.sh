ROCKSDB_PATH=/home/minsky/EZC/rocksdb
LOG_PATH=/home/minsky/EZC/log_
RAW_ZNS=nvme1n2
RAW_ZNS_PATH=/sys/block/${RAW_ZNS}/queue/scheduler
RESULT_DIR_PATH=/home/minsky/EZC/data
ZNS_SCHEDULER=/sys/block/${RAW_ZNS}/queue/scheduler

## zc_scheme
GREEDY=0
INVAL=5
LIZA=2
CBZC=3

## Dataset
MED=125829120
#MED=94371840
#MED=136314880
#MED=10485760
#MED=62914560 #60
#MED=167772160 #164
#MED=12582912 # 12
#MED=138412032 # 132
#MED=73400320 #70GB
#MED=9437184 #9GB
#MED=67108864 #64GB
#MED=10485760
##Tuning Point
T=80
T_COMPACTION=4
T_FLUSH=1
T_SUBCOMPACTION=8
ZC_KICKS=25
UNTIL=25

# sudo rm -rf ${RESULT_DIR_PATH}
# mkdir ${RESULT_DIR_PATH}

#for SCHEME in $CBZC
for SCHEME in  $INVAL $GREEDY $CBZC
do
    for alpha in 0.5
    do
    for N in 8
    do
    for run in fill_mixput80_theta512; do

	if [ $SCHEME -eq $GREEDY ]; then
                RESULT_PATH="${RESULT_DIR_PATH}/dbbench_GREEDY_${run}"
		zc_scheme=0
		predict_cnt=0

            elif [ $SCHEME -eq $INVAL ]; then
                RESULT_PATH="${RESULT_DIR_PATH}/dbbench_CBSC_${run}"
		zc_scheme=5
		predict_cnt=${N}
            elif [ $SCHEME -eq $LIZA ]; then
                RESULT_PATH="${RESULT_DIR_PATH}/dbbench_LIZA_${run}"
		zc_scheme=2
		predict_cnt=${N}
            elif [ $SCHEME -eq $CBZC ]; then
                RESULT_PATH=${RESULT_DIR_PATH}/fill_CBZC_${N}STEP_a${alpha}_${run}
		zc_scheme=3
		predict_cnt=${N}

            else
                echo "error"
            fi

	      if [ -f ${RESULT_PATH} ]; then
                    echo "already $RESULT_PATH exists"
                    # sleep 30
                    sleep 5
                    continue
                     break
                fi


        echo "mq-deadline" | sudo tee ${ZNS_SCHEDULER}
        sudo rm -rf ${LOG_PATH}
        mkdir ${LOG_PATH}
        sudo nvme zns reset-zone /dev/${RAW_ZNS} -a
        sudo ${ROCKSDB_PATH}/plugin/zenfs/util/zenfs mkfs --force --enable_gc --zbd=${RAW_ZNS} --aux_path=${LOG_PATH} > asdf
        sleep 3

        echo $RESULT_PATH
# updaterandom
	#   --benchmarks="fillrandom,overwrite,updaterandom,deleterandom,readrandomwriterandom,mixgraph,stats" \
	#   --benchmarks="updaterandom,stats" \
#--benchmarks="fillrandom,updaterandom,mixgraph,deleterandom,readrandomwriterandom,overwrite,stats" \

# deleterandom
        sudo ${ROCKSDB_PATH}/db_bench  \
  	--fs_uri=zenfs://dev:${RAW_ZNS} \
	--benchmarks="fillrandom,mixgraph" \
  	-statistics \
  	-file_opening_threads=4 \
  	-max_background_compactions=${T_COMPACTION} \
  	-max_background_flushes=${T_FLUSH} \
  	-subcompactions=${T_SUBCOMPACTION} \
	-seed=1739254486043241 \
  	-histogram \
  	-tuning_point=$T \
  	-reset_scheme=1 \
  	-partial_reset_scheme=1 \
  	-zc=${ZC_KICKS} \
  	-until=${UNTIL} \
  	-allocation_scheme=2 \
  	-zc_scheme=${zc_scheme} \
  	-compaction_scheme=0 \
  	-input_aware_scheme=0 \
  	-max_compaction_kick=0 \
  	-finish_scheme=1 \
  	-predict_cnt=${predict_cnt} \
  	-alpha_value=${alpha} \
  	-is_db_bench=true \
  	-cache_size=268435456 \
  	-keyrange_dist_a=14.18 \
  	-keyrange_dist_b=-2.917 \
  	-keyrange_dist_c=0.0164 \
  	-keyrange_dist_d=-0.08082 \
  	-keyrange_num=30 \
  	-value_k=0.2615 \
  	-value_sigma=25.45 \
  	-iter_k=2.517 \
  	-iter_sigma=14.236 \
	-value_theta=512 \
  	-mix_get_ratio=0.17 \
  	-mix_put_ratio=0.80 \
  	-mix_seek_ratio=0.03 \
  	-sine_mix_rate_interval_milliseconds=5000 \
  	-sine_a=1000 \
  	-sine_b=0.000073 \
  	-sine_d=4500 \
  	--perf_level=2 \
  	-reads=${MED} \
  	-num=${MED} \
	-value_size=1024\
  	-key_size=48\
	-use_existing_db=0 > "${RESULT_DIR_PATH}/tmp"


	if [ -f "${RESULT_DIR_PATH}/tmp" ]; then
                cat "${RESULT_DIR_PATH}/tmp" > "${RESULT_PATH}"
                rm -rf "${RESULT_DIR_PATH}/tmp"
            fi


        echo "Result saved to ${RESULT_PATH}"
    done
    sleep 5
done
done
done
