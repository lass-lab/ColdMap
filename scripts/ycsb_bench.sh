GREEDY=0
INVAL=5
LIZA=2
CBZC=3
fegc=6

RESULT_DIR_PATH="/home/minsky/EZC/data"
#   target_file_size_base=67108864
ZNS=nvme1n2
# zipfian and uniform are also included in here, but you need to modify DoInsert() function in core/core_workload.cc in YCSB-cpp 
for WORKLOAD_TYPE in a b c d e f _nutanix _zipfian _uniform
do
    for alpha in 0.5
    do
    for SCHEME in  $GREEDY
    #for SCHEME in $fegc
    do
	for N in 2
	do
        for run in 1
        do
            # SCHEME 값에 따라 설정
            if [ $SCHEME -eq $GREEDY ]; then
                #RESULT_PATH="${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_GREEDY_${run}"
                RESULT_PATH="${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_GREEDY_${run}"
                OPTIONS="/home/minsky/YCSB-cpp/rocksdb/zlsm_motivation.ini"
                sed -i "s/^  zc_scheme=.*/  zc_scheme=0/" "$OPTIONS"
                sed -i "s/^  predict_cnt=.*/  predict_cnt=${N}/" $OPTIONS

            elif [ $SCHEME -eq $INVAL ]; then
                RESULT_PATH="${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_INVAL_${run}"
                OPTIONS="/home/minsky/YCSB-cpp/rocksdb/zlsm_motivation.ini"
                sed -i "s/^  zc_scheme=.*/  zc_scheme=5/" "$OPTIONS"
                sed -i "s/^  predict_cnt=.*/  predict_cnt=${N}/" $OPTIONS


            elif [ $SCHEME -eq $LIZA ]; then
                RESULT_PATH="${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_LIZA_${run}"
                OPTIONS="/home/minsky/YCSB-cpp/rocksdb/zlsm_motivation.ini"
                sed -i "s/^  zc_scheme=.*/  zc_scheme=2/" "$OPTIONS"
                sed -i "s/^  predict_cnt=.*/  predict_cnt=${N}/" $OPTIONS

            elif [ $SCHEME -eq $CBZC ]; then
                RESULT_PATH="${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_${N}_CBZC_a_${alpha}_${run}"
                OPTIONS="/home/minsky/YCSB-cpp/rocksdb/zlsm_motivation.ini"
                sed -i "s/^  zc_scheme=.*/  zc_scheme=3/" "$OPTIONS"
                sed -i "s/^  predict_cnt=.*/  predict_cnt=${N}/" "$OPTIONS"
                sed -i "s/^  alpha_value=.*/  alpha_value=${alpha}/" "$OPTIONS"
            elif [ $SCHEME -eq $fegc ]; then
                RESULT_PATH="${RESULT_DIR_PATH}/${WORKLOAD_TYPE}_FEGC_${run}"
                OPTIONS="/home/minsky/YCSB-cpp/rocksdb/zlsm_motivation.ini"
                sed -i "s/^  zc_scheme=.*/  zc_scheme=6/" "$OPTIONS"
                #sed -i "s/^  predict_cnt=.*/  predict_cnt=${N}/" "$OPTIONS"
                #sed -i "s/^  alpha_value=.*/  alpha_value=${alpha}/" "$OPTIONS"
            else
                echo "error"
            fi

#	    echo $RESULT_PATH

              if [ -f ${RESULT_PATH} ]; then
                     echo "already $RESULT_PATH exists"
                     # sleep 30
                     sleep 5
                     continue
                      break
                 fi

            # sudo /home/minsky/zone_reset_all 0 100 >asdf
            sudo rm -rf /home/minsky/EZC/log_
            sudo mkdir -p /home/minsky/EZC/log_

            echo "mq-deadline" | sudo tee /sys/block/${ZNS}/queue/scheduler >asdf


            sudo nvme zns reset-zone /dev/${ZNS} -a


            sudo /home/minsky/EZC/rocksdb/plugin/zenfs/util/zenfs mkfs --force --enable_gc \
                --zbd=/${ZNS} --aux_path=/home/minsky/EZC/log_  > asdf

            sudo cp /home/minsky/YCSB-cpp/rocksdb/zlsm_motivation.ini /home/minsky/EZC/log_/zenfsoptions.ini
            echo ${RESULT_PATH}
            sudo /home/minsky/YCSB-cpp/ycsb -load -run -db rocksdb \
                 -P "workloads/workload${WORKLOAD_TYPE}" \
                 -P "rocksdb/rocksdb.properties" -s > "${RESULT_DIR_PATH}/tmp"
            

            # sudo /home/minsky/YCSB-cpp/ycsb -load  -db rocksdb \
            #      -P "workloads/workload_${WORKLOAD_TYPE}" \
            #      -P "rocksdb/rocksdb.properties" -s 
            echo "Saving results to: ${RESULT_PATH}"
            sleep 5

            if [ -f "${RESULT_DIR_PATH}/tmp" ]; then
                cat "${RESULT_DIR_PATH}/tmp" > "${RESULT_PATH}"
                rm -rf "${RESULT_DIR_PATH}/tmp"
            fi
        


        done
    done
	done
done
done
