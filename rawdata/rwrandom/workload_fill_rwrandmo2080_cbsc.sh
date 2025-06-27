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
#MED=146800640
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
for SCHEME in $CBZC $INVAL $GREEDY
do
    for alpha in 0.5
    do
    for N in 8
    do
    for run in fill_rwrandom2080; do

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
	--benchmarks="fillrandom,readrandomwriterandom" \
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
  	-key_size=16\
  	-value_size=1024\
	-readwritepercent=20 \
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

minsky@minsky-MS-7E13:~/EZC/data$ cat /home/minsky/EZC/data/dbbench_CBSC_fill_rwrandom2080
info.nr_zones 904
Debug: max_nr_active_zones=14, max_nr_open_zones=14
Zone block device nr zones: 904 max active: 14 (12) max open: 14(12) 
zone_rep->ZoneCount() 904
active io zones :  0
io_zones.size() : 100
zone sz 0
device free space : 204800
starting bg_reset_workerRuntimeZoneResetDisabled!!
RuntimeZoneResetDisabled!!
Initializing RocksDB Options from the specified file
Initializing RocksDB Options from command-line flags
reclaim until 25~25
reset_scheme 1 partial_reset_scheme 1 tuning_point 80 allocation_scheme 2 compaction_scheme 0 input_aware_scheme 0 zc_scheme 5 alpha_value 0.500000 sigma_value 0.000000 disable finish 1 predict_cnt 8
ZenFS::SetResetScheme: r = 1, T = 80, allocation_schme = 2, zc_scheme = 5, finish_scheme = 1, predict_cnt = 8
zbd_->SetResetScheme: r = 1, T = 80, allocation_schme = 2, zc_scheme = 5, finish_scheme = 1, predict_cnt = 8
other options 0
other options 0
other options 1048576
0 : 0
1 : 0
2 : 0
3 : 0
4 : 0
5 : 0
6 : 0
7 : 0
8 : 0
9 : 0
10 : 0
11 : 0
12 : 0
13 : 0
14 : 0
15 : 0
16 : 0
17 : 0
18 : 0
19 : 0
20 : 0
21 : 0
22 : 0
23 : 0
24 : 0
25 : 0
26 : 0
27 : 0
28 : 0
29 : 0
30 : 0
31 : 0
32 : 0
33 : 0
34 : 0
35 : 0
36 : 0
37 : 0
38 : 0
39 : 0
40 : 0
41 : 0
42 : 0
43 : 0
44 : 0
45 : 0
46 : 0
47 : 0
48 : 0
49 : 0
50 : 0
51 : 0
52 : 0
53 : 0
54 : 0
55 : 0
56 : 0
57 : 0
58 : 0
59 : 0
60 : 0
61 : 0
62 : 0
63 : 0
64 : 0
65 : 0
66 : 0
67 : 0
68 : 0
69 : 0
70 : 0
71 : 0
72 : 0
73 : 0
74 : 0
75 : 0
76 : 0
77 : 0
78 : 0
79 : 0
80 : 0
81 : 0
82 : 0
83 : 0
84 : 0
85 : 0
86 : 0
87 : 0
88 : 0
89 : 0
90 : 0
91 : 0
92 : 0
93 : 0
94 : 0
95 : 0
96 : 0
97 : 0
98 : 0
99 : 0
100 : 0
Keys:       16 bytes each (+ 0 bytes user-defined timestamp)
Values:     1024 bytes each (512 bytes after compression)
Entries:    125829120
Prefix:    0 bytes
Keys per prefix:    0
RawSize:    124800.0 MB (estimated)
FileSize:   63360.0 MB (estimated)
Write rate: 0 bytes/second
Read rate: 0 ops/second
Compression: Snappy
Compression sampling rate: 0
Memtablerep: SkipListFactory
Perf Level: 2
------------------------------------------------
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Initializing RocksDB Options from the specified file
Initializing RocksDB Options from command-line flags
reclaim until 25~25
reset_scheme 1 partial_reset_scheme 1 tuning_point 80 allocation_scheme 2 compaction_scheme 0 input_aware_scheme 0 zc_scheme 5 alpha_value 0.500000 sigma_value 0.000000 disable finish 1 predict_cnt 8
ZenFS::SetResetScheme: r = 1, T = 80, allocation_schme = 2, zc_scheme = 5, finish_scheme = 1, predict_cnt = 8
zbd_->SetResetScheme: r = 1, T = 80, allocation_schme = 2, zc_scheme = 5, finish_scheme = 1, predict_cnt = 8
other options 0
other options 0
other options 1048576
0 : 0
1 : 0
2 : 0
3 : 0
4 : 0
5 : 0
6 : 0
7 : 0
8 : 0
9 : 0
10 : 0
11 : 0
12 : 0
13 : 0
14 : 0
15 : 0
16 : 0
17 : 0
18 : 0
19 : 0
20 : 0
21 : 0
22 : 0
23 : 0
24 : 0
25 : 0
26 : 0
27 : 0
28 : 0
29 : 0
30 : 0
31 : 0
32 : 0
33 : 0
34 : 0
35 : 0
36 : 0
37 : 0
38 : 0
39 : 0
40 : 0
41 : 0
42 : 0
43 : 0
44 : 0
45 : 0
46 : 0
47 : 0
48 : 0
49 : 0
50 : 0
51 : 0
52 : 0
53 : 0
54 : 0
55 : 0
56 : 0
57 : 0
58 : 0
59 : 0
60 : 0
61 : 0
62 : 0
63 : 0
64 : 0
65 : 0
66 : 0
67 : 0
68 : 0
69 : 0
70 : 0
71 : 0
72 : 0
73 : 0
74 : 0
75 : 0
76 : 0
77 : 0
78 : 0
79 : 0
80 : 0
81 : 0
82 : 0
83 : 0
84 : 0
85 : 0
86 : 0
87 : 0
88 : 0
89 : 0
90 : 0
91 : 0
92 : 0
93 : 0
94 : 0
95 : 0
96 : 0
97 : 0
98 : 0
99 : 0
100 : 0
DB path: [rocksdbtest/dbbench]
0	99	458651	0	0	0	0	0	
50	77	12333524	0	0	0	0	20	
100	63	21625054	0	0	0	0	49	
150	55	29439828	0	0	0	0	83	
200	41	37183472	0	0	0	0	111	
250	33	44572030	0	0	0	0	146	
300	31	51511856	0	0	622	6398	186	
350	31	58387421	0	0	1869	17810	227	
400	32	64488948	0	0	4720	38610	266	
450	30	70093196	0	0	8031	61489	301	
500	30	75100305	0	0	11426	84174	337	
550	29	80099267	0	0	15575	110686	371	
600	31	84048592	0	0	20551	141374	406	
650	31	88169896	0	0	25827	173817	439	
700	31	92429528	0	0	30984	202857	471	
750	30	95591631	0	0	37428	239015	500	
800	27	99829551	0	0	43085	272276	528	
850	28	103584213	0	0	48502	302405	560	
900	30	106230415	0	0	55830	343999	589	
950	30	109027901	0	0	63505	380634	615	
1000	28	112017935	0	0	71053	417991	640	
1050	30	114658551	0	0	78785	457174	668	
1100	28	116456648	0	0	87371	500494	691	
1150	28	118519969	0	0	95935	542092	715	
1200	28	121004693	0	0	104575	582438	738	
1250	28	123626976	0	0	112709	620570	763	
fillrandom   :      10.284 micros/op 97242 ops/sec 1293.974 seconds 125829120 operations;   96.4 MB/s
Microseconds per write:
Count: 125829120 Average: 10.2836  StdDev: 4703.66
Min: 0  Median: 0.7254  Max: 14715278
Percentiles: P50: 0.73 P75: 1.26 P99: 5.45 P99.9: 1953.27 P99.99: 4626.15
------------------------------------------------------
[       0,       1 ] 86726045  68.924%  68.924% ##############
(       1,       2 ] 29658237  23.570%  92.494% #####
(       2,       3 ]  4653757   3.698%  96.192% #
(       3,       4 ]  2388095   1.898%  98.090% 
(       4,       6 ]  1575384   1.252%  99.342% 
(       6,      10 ]   427936   0.340%  99.682% 
(      10,      15 ]    82041   0.065%  99.748% 
(      15,      22 ]    22127   0.018%  99.765% 
(      22,      34 ]    12908   0.010%  99.775% 
(      34,      51 ]     4534   0.004%  99.779% 
(      51,      76 ]     3122   0.002%  99.782% 
(      76,     110 ]     2916   0.002%  99.784% 
(     110,     170 ]     1911   0.002%  99.785% 
(     170,     250 ]      925   0.001%  99.786% 
(     250,     380 ]      629   0.000%  99.787% 
(     380,     580 ]     5877   0.005%  99.791% 
(     580,     870 ]    23358   0.019%  99.810% 
(     870,    1300 ]    94104   0.075%  99.885% 
(    1300,    1900 ]    14712   0.012%  99.896% 
(    1900,    2900 ]    87724   0.070%  99.966% 
(    2900,    4400 ]    28975   0.023%  99.989% 
(    4400,    6600 ]    11869   0.009%  99.998% 
(    6600,    9900 ]     1443   0.001% 100.000% 
(    9900,   14000 ]      182   0.000% 100.000% 
(   14000,   22000 ]       72   0.000% 100.000% 
(   22000,   33000 ]        3   0.000% 100.000% 
(   33000,   50000 ]        1   0.000% 100.000% 
(   50000,   75000 ]        5   0.000% 100.000% 
(   75000,  110000 ]        1   0.000% 100.000% 
(  110000,  170000 ]        5   0.000% 100.000% 
(  170000,  250000 ]        5   0.000% 100.000% 
(  250000,  380000 ]        8   0.000% 100.000% 
(  380000,  570000 ]       19   0.000% 100.000% 
(  570000,  860000 ]       22   0.000% 100.000% 
(  860000, 1200000 ]       13   0.000% 100.000% 
( 1200000, 1900000 ]       37   0.000% 100.000% 
( 1900000, 2900000 ]       33   0.000% 100.000% 
( 2900000, 4300000 ]       39   0.000% 100.000% 
( 4300000, 6500000 ]       35   0.000% 100.000% 
( 6500000, 9800000 ]        7   0.000% 100.000% 
( 9800000, 14000000 ]        3   0.000% 100.000% 
( 14000000, 22000000 ]        1   0.000% 100.000% 

DB path: [rocksdbtest/dbbench]
1300	27	125831360	561	0	121242	661506	786	
1350	28	125886640	14400	0	130178	702478	807	
1400	30	126001680	43148	0	138809	741808	829	
1450	30	126144880	78941	0	147229	780614	850	
1500	31	126505440	169096	0	152527	804666	865	
1550	29	127153040	330999	0	153024	806802	868	
1600	28	127744160	478761	0	154762	814538	874	
1650	29	128307440	619599	0	156989	823411	881	
1700	30	128910640	770398	0	158257	830140	888	
1750	30	129459120	907509	0	160650	839356	896	
1800	28	130038640	1052384	0	161895	845792	900	
1850	29	130485520	1164103	0	166522	865137	910	
1900	30	131045040	1303983	0	168353	873423	917	
1950	29	131602240	1443290	0	170431	882304	923	
2000	28	132222960	1598464	0	170764	884216	928	
2050	28	132789600	1740136	0	172368	891228	934	
2100	28	133345840	1879197	0	174329	899764	941	
2150	27	133749840	1980185	0	178865	916770	949	
2200	27	134321840	2123195	0	180293	924921	956	
2250	30	134772160	2235779	0	184427	941615	966	
2300	28	135292080	2365759	0	186726	950577	972	
2350	28	135836880	2501958	0	189059	961151	979	
2400	28	136271600	2610622	0	193381	979217	987	
2450	28	136757182	2732020	0	196617	993104	995	
2500	29	137273760	2861172	0	200025	1008438	1004	
2550	28	137771680	2985646	0	203288	1022753	1012	
2600	29	138246560	3104372	0	206451	1035631	1020	
2650	29	138738720	3227417	0	209289	1047148	1027	
2700	27	139295418	3366580	0	210429	1051957	1031	
2750	29	139728240	3474797	0	214365	1068446	1042	
2800	29	140307520	3619617	0	216108	1076622	1048	
2850	29	140809600	3745134	0	219332	1090720	1056	
2900	29	141299760	3867667	0	222903	1106291	1064	
2950	28	141757600	3982123	0	226616	1120937	1071	
3000	28	142214320	4096307	0	230016	1135427	1079	
3050	28	142628880	4199955	0	234352	1151358	1086	
3100	29	143016800	4296931	0	239338	1173465	1096	
3150	28	143581760	4438170	0	240443	1178470	1101	
3200	28	144080400	4562840	0	243151	1190121	1108	
3250	28	144533840	4676193	0	246694	1204691	1116	
3300	29	144982320	4788320	0	250442	1220212	1125	
3350	29	145498800	4917435	0	252849	1230414	1131	
3400	27	145995200	5041528	0	255461	1241664	1137	
3450	29	146401200	5143027	0	260380	1261374	1147	
3500	28	146890240	5265289	0	263141	1273900	1154	
3550	29	147335040	5376497	0	266798	1288287	1161	
3600	29	147737915	5477200	0	271402	1307339	1170	
3650	28	148209680	5595151	0	274541	1320291	1177	
3700	27	148697440	5717086	0	277248	1331846	1183	
3750	29	149102640	5818395	0	282092	1351538	1193	
3800	28	149614560	5946362	0	284139	1359911	1198	
3850	27	150045920	6054207	0	288262	1377734	1206	
3900	27	150510320	6170310	0	291431	1390929	1213	
3950	29	150928800	6274924	0	295473	1407605	1223	
4000	27	151447440	6404591	0	297280	1415568	1228	
4050	27	151779280	6487553	0	303366	1439143	1237	
4100	27	152281120	6613019	0	305524	1448452	1242	
4150	26	152638560	6702378	0	311015	1468483	1251	
4200	28	152971120	6785506	0	317498	1496553	1262	
4250	27	153429520	6900115	0	320889	1511479	1269	
4300	32	153840640	7002899	0	325194	1529698	1281	
4350	29	154370480	7135342	0	326930	1536357	1285	
4400	27	154899600	7267628	0	328759	1544621	1291	
4450	27	155375920	7386710	0	331874	1557749	1298	
4500	28	155864160	7508780	0	334903	1571145	1306	
4550	28	156201360	7593065	0	340855	1593816	1316	
4600	28	156663120	7708517	0	344306	1609619	1323	
4650	28	157050160	7805262	0	349460	1630707	1331	
4700	29	157490800	7915436	0	352859	1645254	1339	
4750	29	157992160	8040772	0	355241	1655602	1346	
4800	26	158485600	8164136	0	357793	1665607	1351	
4850	26	158934880	8276459	0	361333	1676581	1359	
4900	28	159340080	8377748	0	366510	1700883	1369	
4950	28	159782320	8488303	0	369648	1714111	1375	
5000	28	160146800	8579421	0	375125	1736663	1385	
5050	29	160587520	8689610	0	379742	1757026	1394	
5100	28	161051561	8805620	0	383004	1770702	1400	
5150	28	161486000	8914232	0	386854	1786245	1408	
5200	28	161930480	9025354	0	390686	1802124	1416	
5250	28	162351200	9130537	0	395276	1821793	1424	
5300	28	162807680	9244641	0	398437	1834710	1431	
5350	28	163108480	9319857	0	404938	1862007	1441	
5400	27	163625760	9449162	0	406728	1869429	1446	
5450	28	164083920	9563707	0	410855	1885767	1455	
5500	28	164463520	9658613	0	416071	1908944	1464	
5550	26	164856647	9756900	0	420456	1925685	1471	
5600	27	165299476	9867600	0	423955	1941575	1478	
5650	29	165610880	9945459	0	430001	1966318	1489	
5700	29	165990531	10040360	0	434529	1985290	1496	
5750	28	166346880	10129458	0	439880	2007100	1504	
5800	27	166664240	10208785	0	445698	2028590	1512	
5850	28	167111120	10320501	0	449370	2046796	1521	
5900	28	167481040	10412988	0	454767	2068846	1529	
5950	28	167807040	10494488	0	461256	2093713	1538	
6000	28	168167120	10584507	0	467102	2118530	1547	
6050	28	168538640	10677394	0	472514	2141861	1555	
6100	27	168949040	10779982	0	477140	2161247	1563	
6150	28	169219120	10847501	0	484995	2193169	1574	
6200	28	169672400	10960830	0	488618	2207926	1581	
6250	28	170048000	11054739	0	493489	2226188	1589	
6300	28	170373120	11136019	0	499056	2250178	1598	
6350	26	170835840	11251682	0	501813	2261598	1603	
6400	28	171104720	11318917	0	509265	2290880	1615	
6450	28	171527600	11424622	0	513426	2306972	1622	
6500	28	171837920	11502203	0	519517	2331020	1631	
6550	28	172168720	11584913	0	525183	2355224	1639	
6600	27	172571040	11685496	0	529192	2371815	1646	
6650	28	172880560	11762877	0	535650	2399107	1656	
6700	28	173245407	11854080	0	541239	2423278	1664	
6750	26	173614578	11946380	0	546384	2443419	1671	
6800	28	173936160	12026772	0	553828	2476324	1682	
6850	27	174267760	12109667	0	560199	2499713	1691	
6900	28	174605760	12194171	0	565999	2521479	1701	
6950	28	175015280	12296547	0	570001	2539998	1707	
7000	26	175348640	12379900	0	575494	2561069	1715	
7050	28	175727040	12474496	0	580321	2583897	1724	
7100	27	176061760	12558170	0	586075	2606190	1732	
readrandomwriterandom :      92.603 micros/op 10798 ops/sec 5826.058 seconds 62914560 operations; ( reads:12582920 writes:50331640 total:125829120 found:8770054)
Microseconds per read:
Count: 12582920 Average: 425.6527  StdDev: 21159.85
Min: 0  Median: 301.7752  Max: 12648842
Percentiles: P50: 301.78 P75: 378.81 P99: 988.70 P99.9: 1562.92 P99.99: 5274.12
------------------------------------------------------
[       0,       1 ]      406   0.003%   0.003% 
(       1,       2 ]      586   0.005%   0.008% 
(       2,       3 ]      529   0.004%   0.012% 
(       3,       4 ]     1317   0.010%   0.023% 
(       4,       6 ]     3594   0.029%   0.051% 
(       6,      10 ]    10117   0.080%   0.132% 
(      10,      15 ]    16188   0.129%   0.260% 
(      15,      22 ]    19197   0.153%   0.413% 
(      22,      34 ]    23564   0.187%   0.600% 
(      34,      51 ]    39853   0.317%   0.917% 
(      51,      76 ]    66618   0.529%   1.446% 
(      76,     110 ]   277484   2.205%   3.651% 
(     110,     170 ]  1165021   9.259%  12.910% ##
(     170,     250 ]  2552625  20.286%  33.197% ####
(     250,     380 ]  5308851  42.191%  75.388% ########
(     380,     580 ]  2407394  19.132%  94.520% ####
(     580,     870 ]   523226   4.158%  98.678% #
(     870,    1300 ]   146794   1.167%  99.845% 
(    1300,    1900 ]    15913   0.126%  99.971% 
(    1900,    2900 ]     1234   0.010%  99.981% 
(    2900,    4400 ]      780   0.006%  99.987% 
(    4400,    6600 ]      933   0.007%  99.994% 
(    6600,    9900 ]      119   0.001%  99.995% 
(    9900,   14000 ]        8   0.000%  99.995% 
(   14000,   22000 ]        3   0.000%  99.996% 
(   22000,   33000 ]        1   0.000%  99.996% 
(   33000,   50000 ]       27   0.000%  99.996% 
(   50000,   75000 ]       91   0.001%  99.996% 
(   75000,  110000 ]       11   0.000%  99.997% 
(  110000,  170000 ]        2   0.000%  99.997% 
(  170000,  250000 ]        4   0.000%  99.997% 
(  250000,  380000 ]       10   0.000%  99.997% 
(  380000,  570000 ]        8   0.000%  99.997% 
(  570000,  860000 ]       25   0.000%  99.997% 
(  860000, 1200000 ]       30   0.000%  99.997% 
( 1200000, 1900000 ]       67   0.001%  99.998% 
( 1900000, 2900000 ]       89   0.001%  99.998% 
( 2900000, 4300000 ]      106   0.001%  99.999% 
( 4300000, 6500000 ]       76   0.001% 100.000% 
( 6500000, 9800000 ]       17   0.000% 100.000% 
( 9800000, 14000000 ]        2   0.000% 100.000% 

Microseconds per write:
Count: 50331640 Average: 9.3401  StdDev: 4200.39
Min: 0  Median: 4.5780  Max: 8983120
Percentiles: P50: 4.58 P75: 5.77 P99: 13.51 P99.9: 414.29 P99.99: 869.73
------------------------------------------------------
[       0,       1 ]  7244347  14.393%  14.393% ###
(       1,       2 ]  7587960  15.076%  29.469% ###
(       2,       3 ]  1879338   3.734%  33.203% #
(       3,       4 ]  2368868   4.707%  37.910% #
(       4,       6 ] 21057076  41.837%  79.746% ########
(       6,      10 ]  8904090  17.691%  97.437% ####
(      10,      15 ]  1120888   2.227%  99.664% 
(      15,      22 ]    86796   0.172%  99.837% 
(      22,      34 ]    24708   0.049%  99.886% 
(      34,      51 ]     4338   0.009%  99.894% 
(      51,      76 ]      524   0.001%  99.895% 
(      76,     110 ]      423   0.001%  99.896% 
(     110,     170 ]      316   0.001%  99.897% 
(     170,     250 ]      611   0.001%  99.898% 
(     250,     380 ]      274   0.001%  99.899% 
(     380,     580 ]     4383   0.009%  99.907% 
(     580,     870 ]    41706   0.083%  99.990% 
(     870,    1300 ]     2955   0.006%  99.996% 
(    1300,    1900 ]     1115   0.002%  99.998% 
(    1900,    2900 ]      366   0.001%  99.999% 
(    2900,    4400 ]      393   0.001% 100.000% 
(    4400,    6600 ]       95   0.000% 100.000% 
(    6600,    9900 ]        6   0.000% 100.000% 
(    9900,   14000 ]        1   0.000% 100.000% 
(   50000,   75000 ]        1   0.000% 100.000% 
(  250000,  380000 ]        3   0.000% 100.000% 
(  380000,  570000 ]        3   0.000% 100.000% 
(  570000,  860000 ]        6   0.000% 100.000% 
(  860000, 1200000 ]        4   0.000% 100.000% 
( 1200000, 1900000 ]       10   0.000% 100.000% 
( 1900000, 2900000 ]        7   0.000% 100.000% 
( 2900000, 4300000 ]       11   0.000% 100.000% 
( 4300000, 6500000 ]       13   0.000% 100.000% 
( 6500000, 9800000 ]        5   0.000% 100.000% 

STATISTICS:
rocksdb.block.cache.miss COUNT : 515955872
rocksdb.block.cache.hit COUNT : 20361203
rocksdb.block.cache.add COUNT : 47787962
rocksdb.block.cache.add.failures COUNT : 0
rocksdb.block.cache.index.miss COUNT : 0
rocksdb.block.cache.index.hit COUNT : 0
rocksdb.block.cache.index.add COUNT : 0
rocksdb.block.cache.index.bytes.insert COUNT : 0
rocksdb.block.cache.index.bytes.evict COUNT : 0
rocksdb.block.cache.filter.miss COUNT : 0
rocksdb.block.cache.filter.hit COUNT : 0
rocksdb.block.cache.filter.add COUNT : 0
rocksdb.block.cache.filter.bytes.insert COUNT : 0
rocksdb.block.cache.filter.bytes.evict COUNT : 0
rocksdb.block.cache.data.miss COUNT : 515955872
rocksdb.block.cache.data.hit COUNT : 20361203
rocksdb.block.cache.data.add COUNT : 47787962
rocksdb.block.cache.data.bytes.insert COUNT : 204151450032
rocksdb.block.cache.bytes.read COUNT : 86983558272
rocksdb.block.cache.bytes.write COUNT : 204151450032
rocksdb.bloom.filter.useful COUNT : 0
rocksdb.bloom.filter.full.positive COUNT : 0
rocksdb.bloom.filter.full.true.positive COUNT : 0
rocksdb.bloom.filter.micros COUNT : 0
rocksdb.persistent.cache.hit COUNT : 0
rocksdb.persistent.cache.miss COUNT : 0
rocksdb.sim.block.cache.hit COUNT : 0
rocksdb.sim.block.cache.miss COUNT : 0
rocksdb.memtable.hit COUNT : 3431
rocksdb.memtable.miss COUNT : 12579489
rocksdb.l0.hit COUNT : 10031
rocksdb.l1.hit COUNT : 42012
rocksdb.l2andup.hit COUNT : 8714580
rocksdb.compaction.key.drop.new COUNT : 59302799
rocksdb.compaction.key.drop.obsolete COUNT : 0
rocksdb.compaction.key.drop.range_del COUNT : 0
rocksdb.compaction.key.drop.user COUNT : 0
rocksdb.compaction.range_del.drop.obsolete COUNT : 0
rocksdb.compaction.optimized.del.drop.obsolete COUNT : 0
rocksdb.compaction.cancelled COUNT : 0
rocksdb.number.keys.written COUNT : 176160760
rocksdb.number.keys.read COUNT : 12582920
rocksdb.number.keys.updated COUNT : 0
rocksdb.bytes.written COUNT : 186025762560
rocksdb.bytes.read COUNT : 8980535296
rocksdb.number.db.seek COUNT : 0
rocksdb.number.db.next COUNT : 0
rocksdb.number.db.prev COUNT : 0
rocksdb.number.db.seek.found COUNT : 0
rocksdb.number.db.next.found COUNT : 0
rocksdb.number.db.prev.found COUNT : 0
rocksdb.db.iter.bytes.read COUNT : 0
rocksdb.no.file.closes COUNT : 0
rocksdb.no.file.opens COUNT : 22313
rocksdb.no.file.errors COUNT : 0
rocksdb.l0.slowdown.micros COUNT : 0
rocksdb.memtable.compaction.micros COUNT : 0
rocksdb.l0.num.files.stall.micros COUNT : 0
rocksdb.stall.micros COUNT : 427346914
rocksdb.db.mutex.wait.micros COUNT : 0
rocksdb.rate.limit.delay.millis COUNT : 0
rocksdb.num.iterators COUNT : 0
rocksdb.number.multiget.get COUNT : 0
rocksdb.number.multiget.keys.read COUNT : 0
rocksdb.number.multiget.bytes.read COUNT : 0
rocksdb.number.deletes.filtered COUNT : 0
rocksdb.number.merge.failures COUNT : 0
rocksdb.bloom.filter.prefix.checked COUNT : 0
rocksdb.bloom.filter.prefix.useful COUNT : 0
rocksdb.number.reseeks.iteration COUNT : 0
rocksdb.getupdatessince.calls COUNT : 0
rocksdb.block.cachecompressed.miss COUNT : 0
rocksdb.block.cachecompressed.hit COUNT : 0
rocksdb.block.cachecompressed.add COUNT : 0
rocksdb.block.cachecompressed.add.failures COUNT : 0
rocksdb.wal.synced COUNT : 0
rocksdb.wal.bytes COUNT : 186025762560
rocksdb.write.self COUNT : 176160760
rocksdb.write.other COUNT : 0
rocksdb.write.timeout COUNT : 0
rocksdb.write.wal COUNT : 176160760
rocksdb.compact.read.bytes COUNT : 1145296006558
rocksdb.compact.write.bytes COUNT : 1127913858918
rocksdb.flush.write.bytes COUNT : 107999862378
rocksdb.compact.read.marked.bytes COUNT : 0
rocksdb.compact.read.periodic.bytes COUNT : 0
rocksdb.compact.read.ttl.bytes COUNT : 0
rocksdb.compact.write.marked.bytes COUNT : 0
rocksdb.compact.write.periodic.bytes COUNT : 0
rocksdb.compact.write.ttl.bytes COUNT : 0
rocksdb.number.direct.load.table.properties COUNT : 0
rocksdb.number.superversion_acquires COUNT : 3711
rocksdb.number.superversion_releases COUNT : 2705
rocksdb.number.superversion_cleanups COUNT : 2690
rocksdb.number.block.compressed COUNT : 505158033
rocksdb.number.block.decompressed COUNT : 515978168
rocksdb.number.block.not_compressed COUNT : 17
rocksdb.merge.operation.time.nanos COUNT : 0
rocksdb.filter.operation.time.nanos COUNT : 0
rocksdb.row.cache.hit COUNT : 0
rocksdb.row.cache.miss COUNT : 0
rocksdb.read.amp.estimate.useful.bytes COUNT : 0
rocksdb.read.amp.total.read.bytes COUNT : 0
rocksdb.number.rate_limiter.drains COUNT : 0
rocksdb.number.iter.skip COUNT : 0
rocksdb.blobdb.num.put COUNT : 0
rocksdb.blobdb.num.write COUNT : 0
rocksdb.blobdb.num.get COUNT : 0
rocksdb.blobdb.num.multiget COUNT : 0
rocksdb.blobdb.num.seek COUNT : 0
rocksdb.blobdb.num.next COUNT : 0
rocksdb.blobdb.num.prev COUNT : 0
rocksdb.blobdb.num.keys.written COUNT : 0
rocksdb.blobdb.num.keys.read COUNT : 0
rocksdb.blobdb.bytes.written COUNT : 0
rocksdb.blobdb.bytes.read COUNT : 0
rocksdb.blobdb.write.inlined COUNT : 0
rocksdb.blobdb.write.inlined.ttl COUNT : 0
rocksdb.blobdb.write.blob COUNT : 0
rocksdb.blobdb.write.blob.ttl COUNT : 0
rocksdb.blobdb.blob.file.bytes.written COUNT : 0
rocksdb.blobdb.blob.file.bytes.read COUNT : 0
rocksdb.blobdb.blob.file.synced COUNT : 0
rocksdb.blobdb.blob.index.expired.count COUNT : 0
rocksdb.blobdb.blob.index.expired.size COUNT : 0
rocksdb.blobdb.blob.index.evicted.count COUNT : 0
rocksdb.blobdb.blob.index.evicted.size COUNT : 0
rocksdb.blobdb.gc.num.files COUNT : 0
rocksdb.blobdb.gc.num.new.files COUNT : 0
rocksdb.blobdb.gc.failures COUNT : 0
rocksdb.blobdb.gc.num.keys.overwritten COUNT : 0
rocksdb.blobdb.gc.num.keys.expired COUNT : 0
rocksdb.blobdb.gc.num.keys.relocated COUNT : 0
rocksdb.blobdb.gc.bytes.overwritten COUNT : 0
rocksdb.blobdb.gc.bytes.expired COUNT : 0
rocksdb.blobdb.gc.bytes.relocated COUNT : 0
rocksdb.blobdb.fifo.num.files.evicted COUNT : 0
rocksdb.blobdb.fifo.num.keys.evicted COUNT : 0
rocksdb.blobdb.fifo.bytes.evicted COUNT : 0
rocksdb.txn.overhead.mutex.prepare COUNT : 0
rocksdb.txn.overhead.mutex.old.commit.map COUNT : 0
rocksdb.txn.overhead.duplicate.key COUNT : 0
rocksdb.txn.overhead.mutex.snapshot COUNT : 0
rocksdb.txn.get.tryagain COUNT : 0
rocksdb.number.multiget.keys.found COUNT : 0
rocksdb.num.iterator.created COUNT : 0
rocksdb.num.iterator.deleted COUNT : 0
rocksdb.block.cache.compression.dict.miss COUNT : 0
rocksdb.block.cache.compression.dict.hit COUNT : 0
rocksdb.block.cache.compression.dict.add COUNT : 0
rocksdb.block.cache.compression.dict.bytes.insert COUNT : 0
rocksdb.block.cache.compression.dict.bytes.evict COUNT : 0
rocksdb.block.cache.add.redundant COUNT : 0
rocksdb.block.cache.index.add.redundant COUNT : 0
rocksdb.block.cache.filter.add.redundant COUNT : 0
rocksdb.block.cache.data.add.redundant COUNT : 0
rocksdb.block.cache.compression.dict.add.redundant COUNT : 0
rocksdb.files.marked.trash COUNT : 0
rocksdb.files.deleted.immediately COUNT : 23978
rocksdb.error.handler.bg.errro.count COUNT : 0
rocksdb.error.handler.bg.io.errro.count COUNT : 0
rocksdb.error.handler.bg.retryable.io.errro.count COUNT : 0
rocksdb.error.handler.autoresume.count COUNT : 0
rocksdb.error.handler.autoresume.retry.total.count COUNT : 0
rocksdb.error.handler.autoresume.success.count COUNT : 0
rocksdb.memtable.payload.bytes.at.flush COUNT : 184583633208
rocksdb.memtable.garbage.bytes.at.flush COUNT : 45678128
rocksdb.secondary.cache.hits COUNT : 0
rocksdb.verify_checksum.read.bytes COUNT : 0
rocksdb.backup.read.bytes COUNT : 0
rocksdb.backup.write.bytes COUNT : 0
rocksdb.remote.compact.read.bytes COUNT : 0
rocksdb.remote.compact.write.bytes COUNT : 0
rocksdb.hot.file.read.bytes COUNT : 0
rocksdb.warm.file.read.bytes COUNT : 0
rocksdb.cold.file.read.bytes COUNT : 0
rocksdb.hot.file.read.count COUNT : 0
rocksdb.warm.file.read.count COUNT : 0
rocksdb.cold.file.read.count COUNT : 0
rocksdb.last.level.read.bytes COUNT : 0
rocksdb.last.level.read.count COUNT : 0
rocksdb.non.last.level.read.bytes COUNT : 1263434127066
rocksdb.non.last.level.read.count COUNT : 516045124
rocksdb.block.checksum.compute.count COUNT : 516000498
rocksdb.multiget.coroutine.count COUNT : 0
rocksdb.db.get.micros P50 : 301.013868 P95 : 612.399802 P99 : 987.732438 P100 : 12648840.000000 COUNT : 12582920 SUM : 5348782131
rocksdb.db.write.micros P50 : 0.821040 P95 : 5.640989 P99 : 9.333678 P100 : 14715276.000000 COUNT : 176160760 SUM : 1706391135
rocksdb.compaction.times.micros P50 : 1479392.117568 P95 : 2809310.850440 P99 : 3413267.000000 P100 : 3413267.000000 COUNT : 3377 SUM : 5096003742
rocksdb.compaction.times.cpu_micros P50 : 721617.449664 P95 : 1583817.567568 P99 : 5554898.000000 P100 : 5554898.000000 COUNT : 3377 SUM : 2893687792
rocksdb.subcompaction.setup.times.micros P50 : 364.166667 P95 : 1095.750000 P99 : 1586.500000 P100 : 754371.000000 COUNT : 309 SUM : 884956
rocksdb.table.sync.micros P50 : 73584.202683 P95 : 182255.319149 P99 : 246436.879433 P100 : 525099.000000 COUNT : 2828 SUM : 248466339
rocksdb.compaction.outfile.sync.micros P50 : 111750.129066 P95 : 480334.615385 P99 : 556276.153846 P100 : 786299.000000 COUNT : 19485 SUM : 3122832369
rocksdb.wal.file.sync.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.manifest.file.sync.micros P50 : 80.689963 P95 : 240.091503 P99 : 799.778571 P100 : 11025.000000 COUNT : 6717 SUM : 789347
rocksdb.table.open.io.micros P50 : 1666.890130 P95 : 3733.526401 P99 : 5117.855769 P100 : 98591.000000 COUNT : 22313 SUM : 41593797
rocksdb.db.multiget.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.read.block.compaction.micros P50 : 0.824239 P95 : 1.990457 P99 : 30.852504 P100 : 74142.000000 COUNT : 468167910 SUM : 1809804370
rocksdb.read.block.get.micros P50 : 84.372591 P95 : 191.984776 P99 : 353.402209 P100 : 80705.000000 COUNT : 47810275 SUM : 3725966499
rocksdb.write.raw.block.micros P50 : 0.501660 P95 : 0.953153 P99 : 0.993286 P100 : 1749.000000 COUNT : 505202676 SUM : 159470613
rocksdb.l0.slowdown.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.memtable.compaction.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.files.stall.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.hard.rate.limit.delay.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.soft.rate.limit.delay.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.numfiles.in.singlecompaction P50 : 3.504394 P95 : 9.692276 P99 : 42.950787 P100 : 46.000000 COUNT : 4214 SUM : 21987
rocksdb.db.seek.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.db.write.stall P50 : 0.537003 P95 : 1094.179910 P99 : 2595.733653 P100 : 14715253.000000 COUNT : 2050127 SUM : 427408831
rocksdb.sst.read.micros P50 : 0.573582 P95 : 85.799231 P99 : 166.713208 P100 : 80693.000000 COUNT : 516045124 SUM : 5087096304
rocksdb.num.subcompactions.scheduled P50 : 5.266234 P95 : 8.000000 P99 : 8.000000 P100 : 8.000000 COUNT : 309 SUM : 1722
rocksdb.bytes.per.read P50 : 991.526666 P95 : 1024.000000 P99 : 1024.000000 P100 : 1024.000000 COUNT : 12582920 SUM : 8980535296
rocksdb.bytes.per.write P50 : 1056.000000 P95 : 1056.000000 P99 : 1056.000000 P100 : 1056.000000 COUNT : 176160760 SUM : 186025762560
rocksdb.bytes.per.multiget P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.bytes.compressed P50 : 3650.005948 P95 : 4325.059877 P99 : 4385.064670 P100 : 553918.000000 COUNT : 505158033 SUM : 2129245623333
rocksdb.bytes.decompressed P50 : 3650.006569 P95 : 4325.058696 P99 : 4385.063329 P100 : 553918.000000 COUNT : 515978168 SUM : 2174672104349
rocksdb.compression.times.nanos P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.decompression.times.nanos P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.read.num.merge_operands P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.blobdb.key.size P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.blobdb.value.size P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.blobdb.write.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.blobdb.get.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.blobdb.multiget.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.blobdb.seek.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.blobdb.next.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.blobdb.prev.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.blobdb.blob.file.write.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.blobdb.blob.file.read.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.blobdb.blob.file.sync.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.blobdb.gc.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.blobdb.compression.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.blobdb.decompression.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.db.flush.micros P50 : 153753.351206 P95 : 248989.816701 P99 : 361911.111111 P100 : 2968202.000000 COUNT : 2828 SUM : 466067547
rocksdb.sst.batch.size P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.index.and.filter.blocks.read.per.level P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.data.blocks.read.per.level P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.sst.read.per.level P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.error.handler.autoresume.retry.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.async.read.bytes P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.poll.wait.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.prefetched.bytes.discarded P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 36623 SUM : 0
rocksdb.multiget.io.batch.size P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.level.read.per.multiget P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
7119	27	176160760	12582920	0	588721	2617534	1735	
GetTotalBytesWritten :: 2042256535552
UserByteWritten : 1424937079458
FAR STAT :: WA_zc (mb) : 588721
@@~Zenfs Last Free percent freepercent 27 
SEQUENCE OVER SEQ_DIST_MAX : 6032SEQUENCE OVER SEQ_DIST_MAX : 5117SEQUENCE OVER SEQ_DIST_MAX : 5550SEQUENCE OVER SEQ_DIST_MAX : 5494SEQUENCE OVER SEQ_DIST_MAX : 5186SEQUENCE OVER SEQ_DIST_MAX : 5186SEQUENCE OVER SEQ_DIST_MAX : 5125SEQUENCE OVER SEQ_DIST_MAX : 9798zone size at ~ 1077
============================================================
WWP (MB) : 1575651, R_wp : 15
NEW WWP(MB) : 1575651
Runtime zone reset R_wp 15
ZONE FINISH VALID(MB) 0
ZONE FINISH WWP(MB) : 0
ZC IO Blocking time : 0
============================================================
[1] :: 256 ~ 256, 56 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[2] :: 258 ~ 258, 44 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[3] :: 262 ~ 262, 312 ms, 26 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[4] :: 262 ~ 263, 328 ms, 38 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[5] :: 263 ~ 265, 1317 ms, 102 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[6] :: 265 ~ 265, 672 ms, 79 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[7] :: 269 ~ 270, 518 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[8] :: 272 ~ 272, 190 ms, 8 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[9] :: 273 ~ 274, 645 ms, 50 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[10] :: 274 ~ 274, 358 ms, 35 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[11] :: 284 ~ 285, 347 ms, 52 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[12] :: 285 ~ 285, 297 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[13] :: 290 ~ 291, 1314 ms, 99 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[14] :: 302 ~ 302, 491 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[15] :: 303 ~ 303, 518 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[16] :: 308 ~ 309, 881 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[17] :: 309 ~ 309, 664 ms, 57 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[18] :: 309 ~ 310, 612 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[19] :: 311 ~ 311, 408 ms, 46 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[20] :: 311 ~ 312, 444 ms, 89 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[21] :: 318 ~ 318, 148 ms, 7 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[22] :: 326 ~ 327, 658 ms, 42 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[23] :: 327 ~ 327, 867 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[24] :: 327 ~ 328, 830 ms, 72 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[25] :: 328 ~ 328, 90 ms, 6 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[26] :: 337 ~ 338, 755 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[27] :: 344 ~ 346, 1805 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[28] :: 346 ~ 347, 1125 ms, 166 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[29] :: 347 ~ 348, 690 ms, 179 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[30] :: 349 ~ 350, 426 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[31] :: 353 ~ 353, 62 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[32] :: 355 ~ 355, 752 ms, 54 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[33] :: 355 ~ 356, 760 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[34] :: 356 ~ 357, 815 ms, 66 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[35] :: 357 ~ 357, 393 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[36] :: 363 ~ 363, 496 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[37] :: 364 ~ 365, 1330 ms, 116 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[38] :: 367 ~ 368, 459 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[39] :: 368 ~ 368, 184 ms, 29 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[40] :: 369 ~ 369, 112 ms, 4 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[41] :: 371 ~ 372, 1121 ms, 181 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[42] :: 373 ~ 375, 2564 ms, 206 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[43] :: 375 ~ 376, 773 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[44] :: 376 ~ 377, 508 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[45] :: 377 ~ 377, 358 ms, 88 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[46] :: 377 ~ 378, 775 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[47] :: 378 ~ 378, 323 ms, 69 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[48] :: 379 ~ 379, 559 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[49] :: 384 ~ 385, 890 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[50] :: 385 ~ 386, 766 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[51] :: 386 ~ 386, 324 ms, 31 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[52] :: 388 ~ 389, 619 ms, 75 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[53] :: 389 ~ 390, 501 ms, 61 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[54] :: 390 ~ 391, 1218 ms, 287 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[55] :: 394 ~ 395, 1453 ms, 106 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[56] :: 395 ~ 396, 732 ms, 68 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[57] :: 396 ~ 397, 852 ms, 164 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[58] :: 397 ~ 398, 1101 ms, 273 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[59] :: 404 ~ 405, 350 ms, 46 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[60] :: 405 ~ 407, 1987 ms, 136 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[61] :: 407 ~ 408, 1225 ms, 181 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[62] :: 408 ~ 409, 637 ms, 164 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[63] :: 409 ~ 410, 662 ms, 161 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[64] :: 410 ~ 410, 519 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[65] :: 410 ~ 410, 247 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[66] :: 411 ~ 412, 531 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[67] :: 417 ~ 418, 809 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[68] :: 418 ~ 420, 1381 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[69] :: 420 ~ 420, 335 ms, 47 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[70] :: 420 ~ 421, 1305 ms, 326 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[71] :: 421 ~ 421, 110 ms, 20 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[72] :: 421 ~ 422, 717 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[73] :: 424 ~ 424, 425 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[74] :: 425 ~ 426, 1304 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[75] :: 426 ~ 427, 568 ms, 66 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[76] :: 428 ~ 429, 788 ms, 146 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[77] :: 430 ~ 431, 514 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[78] :: 431 ~ 434, 2860 ms, 297 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[79] :: 434 ~ 435, 489 ms, 117 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[80] :: 435 ~ 435, 272 ms, 65 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[81] :: 435 ~ 435, 342 ms, 76 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[82] :: 437 ~ 437, 263 ms, 26 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[83] :: 442 ~ 442, 177 ms, 10 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[84] :: 442 ~ 443, 1155 ms, 93 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[85] :: 443 ~ 444, 705 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[86] :: 444 ~ 444, 376 ms, 33 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[87] :: 446 ~ 446, 632 ms, 74 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[88] :: 446 ~ 447, 63 ms, 2 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[89] :: 447 ~ 448, 1131 ms, 188 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[90] :: 453 ~ 455, 2537 ms, 204 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[91] :: 455 ~ 456, 578 ms, 122 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[92] :: 456 ~ 457, 1060 ms, 287 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[93] :: 458 ~ 459, 1368 ms, 249 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[94] :: 464 ~ 466, 1411 ms, 113 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[95] :: 466 ~ 467, 1214 ms, 169 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[96] :: 467 ~ 467, 208 ms, 43 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[97] :: 467 ~ 468, 228 ms, 44 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[98] :: 468 ~ 469, 809 ms, 112 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[99] :: 469 ~ 469, 214 ms, 19 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[100] :: 469 ~ 469, 295 ms, 47 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[101] :: 476 ~ 476, 68 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[102] :: 476 ~ 479, 3296 ms, 483 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[103] :: 479 ~ 479, 173 ms, 36 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[104] :: 481 ~ 482, 521 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[105] :: 484 ~ 485, 468 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[106] :: 485 ~ 486, 1343 ms, 189 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[107] :: 487 ~ 488, 785 ms, 107 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[108] :: 488 ~ 488, 583 ms, 139 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[109] :: 488 ~ 489, 744 ms, 54 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[110] :: 489 ~ 492, 2809 ms, 364 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[111] :: 492 ~ 492, 182 ms, 34 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[112] :: 492 ~ 493, 662 ms, 166 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[113] :: 493 ~ 494, 1129 ms, 275 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[114] :: 500 ~ 501, 729 ms, 58 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[115] :: 501 ~ 503, 1467 ms, 101 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[116] :: 503 ~ 504, 1060 ms, 200 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[117] :: 505 ~ 507, 1683 ms, 351 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[118] :: 508 ~ 508, 131 ms, 6 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[119] :: 511 ~ 511, 477 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[120] :: 512 ~ 515, 3333 ms, 425 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[121] :: 515 ~ 515, 286 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[122] :: 515 ~ 516, 408 ms, 99 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[123] :: 516 ~ 517, 821 ms, 212 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[124] :: 517 ~ 518, 991 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[125] :: 518 ~ 518, 275 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[126] :: 518 ~ 520, 1518 ms, 228 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[127] :: 522 ~ 522, 35 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[128] :: 523 ~ 523, 582 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[129] :: 523 ~ 524, 983 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[130] :: 527 ~ 530, 2891 ms, 375 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[131] :: 530 ~ 530, 262 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[132] :: 530 ~ 531, 655 ms, 156 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[133] :: 534 ~ 535, 207 ms, 15 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[134] :: 536 ~ 537, 1099 ms, 216 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[135] :: 537 ~ 540, 2532 ms, 186 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[136] :: 540 ~ 540, 336 ms, 62 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[137] :: 540 ~ 540, 147 ms, 23 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[138] :: 540 ~ 541, 441 ms, 106 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[139] :: 541 ~ 541, 510 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[140] :: 541 ~ 542, 639 ms, 151 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[141] :: 542 ~ 544, 1768 ms, 300 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[142] :: 550 ~ 550, 246 ms, 32 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[143] :: 551 ~ 554, 3471 ms, 429 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[144] :: 554 ~ 555, 825 ms, 220 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[145] :: 555 ~ 556, 310 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[146] :: 556 ~ 557, 957 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[147] :: 558 ~ 559, 1037 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[148] :: 562 ~ 563, 962 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[149] :: 564 ~ 564, 424 ms, 26 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[150] :: 564 ~ 566, 1585 ms, 122 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[151] :: 566 ~ 567, 564 ms, 90 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[152] :: 567 ~ 568, 916 ms, 223 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[153] :: 568 ~ 569, 1304 ms, 325 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[154] :: 569 ~ 570, 915 ms, 120 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[155] :: 573 ~ 573, 117 ms, 7 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[156] :: 573 ~ 574, 566 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[157] :: 574 ~ 575, 1306 ms, 214 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[158] :: 578 ~ 581, 2561 ms, 244 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[159] :: 581 ~ 581, 769 ms, 173 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[160] :: 581 ~ 583, 1552 ms, 399 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[161] :: 583 ~ 583, 348 ms, 78 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[162] :: 584 ~ 584, 489 ms, 61 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[163] :: 590 ~ 591, 537 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[164] :: 591 ~ 591, 407 ms, 86 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[165] :: 591 ~ 592, 996 ms, 78 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[166] :: 592 ~ 596, 3415 ms, 574 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[167] :: 596 ~ 596, 297 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[168] :: 596 ~ 597, 953 ms, 243 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[169] :: 597 ~ 598, 537 ms, 124 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[170] :: 598 ~ 598, 857 ms, 224 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[171] :: 599 ~ 600, 1711 ms, 265 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[172] :: 601 ~ 601, 623 ms, 81 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[173] :: 602 ~ 603, 1715 ms, 229 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[174] :: 606 ~ 607, 1081 ms, 150 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[175] :: 607 ~ 608, 1078 ms, 141 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[176] :: 608 ~ 609, 292 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[177] :: 609 ~ 610, 978 ms, 239 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[178] :: 610 ~ 611, 524 ms, 30 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[179] :: 611 ~ 613, 1922 ms, 179 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[180] :: 613 ~ 614, 1535 ms, 396 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[181] :: 615 ~ 615, 518 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[182] :: 615 ~ 616, 427 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[183] :: 619 ~ 620, 397 ms, 60 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[184] :: 622 ~ 623, 1144 ms, 86 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[185] :: 623 ~ 624, 990 ms, 90 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[186] :: 624 ~ 626, 1923 ms, 434 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[187] :: 626 ~ 627, 280 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[188] :: 627 ~ 628, 534 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[189] :: 628 ~ 629, 1279 ms, 221 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[190] :: 629 ~ 630, 833 ms, 210 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[191] :: 630 ~ 632, 2376 ms, 427 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[192] :: 633 ~ 633, 500 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[193] :: 633 ~ 634, 909 ms, 124 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[194] :: 636 ~ 638, 1527 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[195] :: 638 ~ 638, 493 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[196] :: 639 ~ 641, 2592 ms, 589 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[197] :: 642 ~ 643, 1794 ms, 127 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[198] :: 643 ~ 644, 677 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[199] :: 644 ~ 644, 321 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[200] :: 644 ~ 645, 1118 ms, 289 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[201] :: 646 ~ 647, 930 ms, 123 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[202] :: 647 ~ 648, 791 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[203] :: 649 ~ 649, 342 ms, 31 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[204] :: 650 ~ 651, 1162 ms, 146 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[205] :: 654 ~ 656, 1622 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[206] :: 656 ~ 658, 1925 ms, 409 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[207] :: 658 ~ 659, 1023 ms, 264 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[208] :: 659 ~ 660, 744 ms, 92 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[209] :: 660 ~ 660, 66 ms, 5 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[210] :: 662 ~ 662, 509 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[211] :: 664 ~ 665, 561 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[212] :: 665 ~ 666, 569 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[213] :: 668 ~ 670, 2418 ms, 240 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[214] :: 670 ~ 671, 661 ms, 154 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[215] :: 671 ~ 671, 309 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[216] :: 671 ~ 673, 1586 ms, 422 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[217] :: 673 ~ 674, 1358 ms, 334 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[218] :: 674 ~ 677, 2642 ms, 564 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[219] :: 677 ~ 678, 732 ms, 185 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[220] :: 678 ~ 680, 2004 ms, 538 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[221] :: 681 ~ 683, 1639 ms, 261 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[222] :: 687 ~ 688, 395 ms, 24 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[223] :: 688 ~ 688, 518 ms, 41 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[224] :: 688 ~ 690, 1494 ms, 151 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[225] :: 693 ~ 694, 477 ms, 65 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[226] :: 695 ~ 696, 1432 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[227] :: 696 ~ 697, 487 ms, 112 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[228] :: 697 ~ 699, 1420 ms, 262 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[229] :: 699 ~ 700, 1287 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[230] :: 700 ~ 704, 3365 ms, 367 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[231] :: 704 ~ 705, 971 ms, 236 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[232] :: 705 ~ 706, 1408 ms, 359 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[233] :: 706 ~ 709, 2561 ms, 461 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[234] :: 709 ~ 710, 1030 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[235] :: 715 ~ 716, 561 ms, 69 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[236] :: 716 ~ 717, 1767 ms, 439 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[237] :: 718 ~ 719, 911 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[238] :: 719 ~ 721, 2473 ms, 370 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[239] :: 721 ~ 721, 304 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[240] :: 721 ~ 723, 1290 ms, 310 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[241] :: 723 ~ 726, 3385 ms, 698 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[242] :: 727 ~ 729, 1196 ms, 152 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[243] :: 729 ~ 729, 551 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[244] :: 733 ~ 734, 1127 ms, 178 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[245] :: 734 ~ 737, 2359 ms, 184 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[246] :: 737 ~ 738, 1772 ms, 444 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[247] :: 738 ~ 739, 527 ms, 123 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[248] :: 739 ~ 741, 1684 ms, 295 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[249] :: 741 ~ 741, 312 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[250] :: 742 ~ 745, 2832 ms, 488 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[251] :: 745 ~ 747, 1997 ms, 272 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[252] :: 747 ~ 748, 308 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[253] :: 748 ~ 749, 562 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[254] :: 749 ~ 749, 905 ms, 155 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[255] :: 749 ~ 751, 1632 ms, 404 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[256] :: 754 ~ 754, 50 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[257] :: 754 ~ 755, 1648 ms, 129 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[258] :: 755 ~ 757, 1623 ms, 305 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[259] :: 757 ~ 757, 284 ms, 58 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[260] :: 757 ~ 759, 2086 ms, 531 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[261] :: 760 ~ 761, 1248 ms, 172 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[262] :: 761 ~ 763, 1655 ms, 375 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[263] :: 764 ~ 766, 1169 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[264] :: 766 ~ 768, 1786 ms, 238 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[265] :: 768 ~ 769, 585 ms, 106 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[266] :: 769 ~ 769, 359 ms, 81 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[267] :: 770 ~ 772, 1729 ms, 345 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[268] :: 773 ~ 775, 1846 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[269] :: 775 ~ 776, 1473 ms, 281 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[270] :: 779 ~ 780, 1011 ms, 125 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[271] :: 781 ~ 783, 1114 ms, 132 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[272] :: 783 ~ 784, 1635 ms, 283 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[273] :: 784 ~ 785, 1044 ms, 256 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[274] :: 786 ~ 788, 2151 ms, 156 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[275] :: 788 ~ 790, 1895 ms, 432 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[276] :: 790 ~ 790, 311 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[277] :: 790 ~ 791, 708 ms, 179 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[278] :: 791 ~ 792, 1028 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[279] :: 792 ~ 792, 413 ms, 94 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[280] :: 792 ~ 794, 1330 ms, 329 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[281] :: 794 ~ 795, 1448 ms, 204 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[282] :: 801 ~ 804, 2635 ms, 242 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[283] :: 804 ~ 804, 746 ms, 176 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[284] :: 804 ~ 806, 1273 ms, 311 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[285] :: 806 ~ 806, 298 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[286] :: 806 ~ 806, 305 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[287] :: 806 ~ 807, 455 ms, 106 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[288] :: 807 ~ 807, 589 ms, 139 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[289] :: 808 ~ 809, 1086 ms, 147 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[290] :: 809 ~ 810, 865 ms, 148 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[291] :: 810 ~ 811, 1142 ms, 265 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[292] :: 811 ~ 811, 52 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[293] :: 815 ~ 816, 580 ms, 74 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[294] :: 816 ~ 817, 987 ms, 134 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[295] :: 817 ~ 817, 291 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[296] :: 817 ~ 820, 2396 ms, 187 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[297] :: 820 ~ 823, 2844 ms, 661 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[298] :: 823 ~ 823, 289 ms, 65 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[299] :: 825 ~ 825, 757 ms, 101 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[300] :: 830 ~ 831, 587 ms, 37 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[301] :: 831 ~ 832, 791 ms, 61 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[302] :: 832 ~ 834, 2668 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[303] :: 834 ~ 835, 271 ms, 55 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[304] :: 835 ~ 838, 2714 ms, 518 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[305] :: 838 ~ 839, 798 ms, 199 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[306] :: 839 ~ 839, 303 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[307] :: 839 ~ 841, 2097 ms, 547 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[308] :: 846 ~ 846, 272 ms, 26 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[309] :: 847 ~ 848, 1021 ms, 149 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[310] :: 848 ~ 849, 1017 ms, 242 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[311] :: 849 ~ 852, 3247 ms, 315 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[312] :: 852 ~ 854, 2161 ms, 567 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[313] :: 854 ~ 855, 282 ms, 66 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[314] :: 855 ~ 857, 1989 ms, 520 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[315] :: 857 ~ 858, 1291 ms, 177 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[316] :: 858 ~ 861, 2646 ms, 614 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[317] :: 862 ~ 863, 1406 ms, 205 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[318] :: 865 ~ 865, 270 ms, 27 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[319] :: 866 ~ 866, 271 ms, 28 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[320] :: 866 ~ 867, 1153 ms, 237 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[321] :: 867 ~ 870, 2369 ms, 382 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[322] :: 870 ~ 871, 1529 ms, 384 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[323] :: 871 ~ 871, 309 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[324] :: 872 ~ 872, 542 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[325] :: 872 ~ 873, 545 ms, 104 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[326] :: 873 ~ 877, 4219 ms, 639 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[327] :: 877 ~ 878, 555 ms, 136 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[328] :: 880 ~ 881, 1264 ms, 187 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[329] :: 881 ~ 882, 800 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[330] :: 883 ~ 885, 1940 ms, 306 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[331] :: 885 ~ 887, 2091 ms, 307 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[332] :: 887 ~ 888, 744 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[333] :: 888 ~ 891, 3210 ms, 602 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[334] :: 892 ~ 894, 1918 ms, 375 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[335] :: 894 ~ 894, 364 ms, 85 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[336] :: 895 ~ 897, 2085 ms, 139 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[337] :: 897 ~ 899, 1020 ms, 173 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[338] :: 899 ~ 899, 852 ms, 204 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[339] :: 899 ~ 900, 522 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[340] :: 902 ~ 903, 898 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[341] :: 903 ~ 903, 104 ms, 15 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[342] :: 903 ~ 904, 1165 ms, 286 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[343] :: 908 ~ 910, 2298 ms, 545 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[344] :: 911 ~ 915, 4092 ms, 573 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[345] :: 915 ~ 915, 281 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[346] :: 915 ~ 916, 1172 ms, 284 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[347] :: 916 ~ 917, 571 ms, 129 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[348] :: 917 ~ 918, 768 ms, 186 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[349] :: 919 ~ 921, 1925 ms, 340 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[350] :: 921 ~ 921, 72 ms, 5 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[351] :: 925 ~ 927, 2336 ms, 431 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[352] :: 927 ~ 930, 2942 ms, 744 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[353] :: 930 ~ 934, 3644 ms, 406 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[354] :: 934 ~ 935, 943 ms, 230 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[355] :: 935 ~ 937, 1980 ms, 517 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[356] :: 937 ~ 937, 490 ms, 120 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[357] :: 937 ~ 938, 567 ms, 129 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[358] :: 938 ~ 939, 1043 ms, 252 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[359] :: 939 ~ 942, 2842 ms, 749 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[360] :: 942 ~ 944, 1903 ms, 487 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[361] :: 944 ~ 945, 1308 ms, 360 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[362] :: 945 ~ 948, 2345 ms, 376 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[363] :: 948 ~ 949, 946 ms, 244 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[364] :: 950 ~ 951, 1733 ms, 245 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[365] :: 954 ~ 955, 710 ms, 105 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[366] :: 955 ~ 957, 1873 ms, 331 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[367] :: 957 ~ 957, 558 ms, 131 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[368] :: 958 ~ 962, 3902 ms, 579 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[369] :: 962 ~ 963, 795 ms, 199 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[370] :: 963 ~ 963, 348 ms, 79 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[371] :: 963 ~ 963, 488 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[372] :: 963 ~ 964, 525 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[373] :: 964 ~ 966, 1809 ms, 480 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[374] :: 966 ~ 969, 2831 ms, 524 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[375] :: 969 ~ 970, 1278 ms, 327 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[376] :: 976 ~ 976, 416 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[377] :: 976 ~ 979, 3097 ms, 805 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[378] :: 980 ~ 982, 2431 ms, 188 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[379] :: 982 ~ 983, 619 ms, 140 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[380] :: 983 ~ 983, 401 ms, 94 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[381] :: 983 ~ 986, 2661 ms, 656 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[382] :: 986 ~ 987, 1058 ms, 279 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[383] :: 987 ~ 989, 1358 ms, 194 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[384] :: 989 ~ 991, 1921 ms, 452 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[385] :: 991 ~ 996, 4096 ms, 904 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[386] :: 998 ~ 1000, 2449 ms, 483 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[387] :: 1000 ~ 1001, 801 ms, 204 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[388] :: 1001 ~ 1003, 2279 ms, 414 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[389] :: 1003 ~ 1003, 3 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[390] :: 1004 ~ 1004, 0 ms, 16 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[391] :: 1004 ~ 1004, 595 ms, 145 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[392] :: 1006 ~ 1007, 1845 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[393] :: 1008 ~ 1011, 3323 ms, 748 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[394] :: 1011 ~ 1012, 726 ms, 182 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[395] :: 1012 ~ 1014, 1350 ms, 185 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[396] :: 1014 ~ 1014, 613 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[397] :: 1017 ~ 1018, 497 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[398] :: 1018 ~ 1021, 2863 ms, 478 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[399] :: 1021 ~ 1022, 1233 ms, 313 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[400] :: 1022 ~ 1023, 683 ms, 162 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[401] :: 1023 ~ 1026, 2592 ms, 475 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[402] :: 1026 ~ 1026, 856 ms, 230 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[403] :: 1026 ~ 1028, 1866 ms, 474 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[404] :: 1028 ~ 1029, 526 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[405] :: 1029 ~ 1032, 2454 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[406] :: 1032 ~ 1035, 3044 ms, 777 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[407] :: 1035 ~ 1035, 641 ms, 157 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[408] :: 1035 ~ 1036, 674 ms, 171 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[409] :: 1036 ~ 1038, 1874 ms, 293 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[410] :: 1039 ~ 1040, 1366 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[411] :: 1043 ~ 1043, 588 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[412] :: 1043 ~ 1045, 1899 ms, 384 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[413] :: 1045 ~ 1046, 623 ms, 149 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[414] :: 1046 ~ 1050, 3369 ms, 755 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[415] :: 1050 ~ 1051, 1086 ms, 272 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[416] :: 1051 ~ 1052, 1610 ms, 286 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[417] :: 1052 ~ 1055, 2136 ms, 547 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[418] :: 1055 ~ 1056, 1219 ms, 192 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[419] :: 1056 ~ 1059, 2682 ms, 219 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[420] :: 1059 ~ 1060, 1014 ms, 245 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[421] :: 1060 ~ 1061, 1231 ms, 315 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[422] :: 1061 ~ 1064, 2691 ms, 666 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[423] :: 1065 ~ 1067, 1715 ms, 326 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[424] :: 1067 ~ 1070, 3103 ms, 525 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[425] :: 1070 ~ 1071, 346 ms, 88 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[426] :: 1073 ~ 1077, 3566 ms, 818 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[427] :: 1077 ~ 1077, 307 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[428] :: 1077 ~ 1078, 843 ms, 214 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[429] :: 1079 ~ 1083, 4380 ms, 714 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[430] :: 1083 ~ 1083, 521 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[431] :: 1083 ~ 1085, 1443 ms, 379 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[432] :: 1085 ~ 1088, 2325 ms, 396 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[433] :: 1088 ~ 1089, 1207 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[434] :: 1089 ~ 1091, 1872 ms, 252 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[435] :: 1091 ~ 1094, 2593 ms, 609 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[436] :: 1094 ~ 1099, 4883 ms, 947 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[437] :: 1099 ~ 1099, 547 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[438] :: 1099 ~ 1101, 1333 ms, 195 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[439] :: 1101 ~ 1102, 1190 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[440] :: 1102 ~ 1104, 1799 ms, 405 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[441] :: 1104 ~ 1106, 1860 ms, 323 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[442] :: 1106 ~ 1107, 977 ms, 245 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[443] :: 1107 ~ 1109, 1553 ms, 261 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[444] :: 1112 ~ 1115, 2936 ms, 273 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[445] :: 1115 ~ 1118, 2815 ms, 744 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[446] :: 1118 ~ 1119, 1100 ms, 283 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[447] :: 1119 ~ 1120, 961 ms, 242 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[448] :: 1120 ~ 1121, 1159 ms, 288 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[449] :: 1121 ~ 1122, 1054 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[450] :: 1122 ~ 1124, 1784 ms, 258 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[451] :: 1124 ~ 1126, 2045 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[452] :: 1126 ~ 1128, 1514 ms, 398 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[453] :: 1128 ~ 1130, 1867 ms, 309 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[454] :: 1133 ~ 1133, 552 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[455] :: 1133 ~ 1134, 404 ms, 63 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[456] :: 1134 ~ 1137, 2871 ms, 607 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[457] :: 1137 ~ 1141, 4002 ms, 887 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[458] :: 1141 ~ 1142, 768 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[459] :: 1142 ~ 1144, 1903 ms, 499 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[460] :: 1144 ~ 1148, 3893 ms, 539 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[461] :: 1148 ~ 1149, 1258 ms, 310 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[462] :: 1149 ~ 1151, 2139 ms, 563 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[463] :: 1151 ~ 1153, 1154 ms, 296 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[464] :: 1153 ~ 1155, 2037 ms, 564 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[465] :: 1155 ~ 1156, 1587 ms, 227 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[466] :: 1156 ~ 1160, 3191 ms, 768 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[467] :: 1162 ~ 1163, 1569 ms, 299 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[468] :: 1165 ~ 1165, 541 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[469] :: 1166 ~ 1167, 1446 ms, 332 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[470] :: 1168 ~ 1170, 2118 ms, 155 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[471] :: 1170 ~ 1172, 2352 ms, 548 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[472] :: 1172 ~ 1173, 316 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[473] :: 1173 ~ 1176, 3017 ms, 775 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[474] :: 1176 ~ 1176, 725 ms, 178 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[475] :: 1176 ~ 1179, 2693 ms, 617 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[476] :: 1179 ~ 1181, 1809 ms, 484 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[477] :: 1181 ~ 1183, 1987 ms, 339 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[478] :: 1183 ~ 1185, 2233 ms, 618 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[479] :: 1185 ~ 1187, 1639 ms, 409 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[480] :: 1187 ~ 1188, 970 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[481] :: 1193 ~ 1194, 941 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[482] :: 1194 ~ 1197, 2936 ms, 476 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[483] :: 1197 ~ 1199, 2545 ms, 664 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[484] :: 1199 ~ 1200, 401 ms, 97 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[485] :: 1200 ~ 1202, 2297 ms, 582 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[486] :: 1202 ~ 1203, 938 ms, 237 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[487] :: 1203 ~ 1206, 3229 ms, 681 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[488] :: 1206 ~ 1207, 943 ms, 227 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[489] :: 1208 ~ 1210, 1913 ms, 298 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[490] :: 1213 ~ 1216, 3092 ms, 549 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[491] :: 1216 ~ 1217, 824 ms, 190 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[492] :: 1217 ~ 1218, 731 ms, 192 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[493] :: 1218 ~ 1219, 563 ms, 145 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[494] :: 1219 ~ 1222, 2776 ms, 250 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[495] :: 1222 ~ 1224, 2666 ms, 701 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[496] :: 1224 ~ 1227, 3109 ms, 792 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[497] :: 1227 ~ 1230, 2757 ms, 721 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[498] :: 1230 ~ 1231, 778 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[499] :: 1231 ~ 1232, 1282 ms, 334 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[500] :: 1233 ~ 1233, 75 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[501] :: 1233 ~ 1234, 1523 ms, 225 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[502] :: 1239 ~ 1239, 90 ms, 2 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[503] :: 1239 ~ 1241, 1382 ms, 280 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[504] :: 1241 ~ 1242, 1487 ms, 111 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[505] :: 1242 ~ 1244, 2133 ms, 326 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[506] :: 1244 ~ 1245, 557 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[507] :: 1245 ~ 1248, 2987 ms, 726 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[508] :: 1248 ~ 1252, 3576 ms, 765 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[509] :: 1252 ~ 1253, 787 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[510] :: 1254 ~ 1254, 41 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[511] :: 1255 ~ 1256, 1383 ms, 249 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[512] :: 1256 ~ 1257, 1140 ms, 273 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[513] :: 1258 ~ 1259, 1393 ms, 195 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[514] :: 1260 ~ 1262, 2510 ms, 550 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[515] :: 1262 ~ 1264, 1861 ms, 291 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[516] :: 1264 ~ 1266, 1601 ms, 400 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[517] :: 1266 ~ 1267, 1127 ms, 162 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[518] :: 1267 ~ 1270, 2503 ms, 623 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[519] :: 1270 ~ 1275, 4648 ms, 742 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[520] :: 1275 ~ 1277, 1931 ms, 525 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[521] :: 1277 ~ 1278, 796 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[522] :: 1278 ~ 1278, 765 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[523] :: 1278 ~ 1279, 981 ms, 245 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[524] :: 1280 ~ 1281, 1518 ms, 229 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[525] :: 1281 ~ 1283, 1876 ms, 413 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[526] :: 1283 ~ 1284, 1269 ms, 341 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[527] :: 1286 ~ 1287, 1181 ms, 164 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[528] :: 1287 ~ 1291, 3736 ms, 936 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[529] :: 1291 ~ 1292, 790 ms, 98 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[530] :: 1295 ~ 1298, 3523 ms, 820 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[531] :: 1299 ~ 1301, 2539 ms, 491 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[532] :: 1301 ~ 1303, 1733 ms, 414 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[533] :: 1303 ~ 1303, 555 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[534] :: 1305 ~ 1307, 2029 ms, 428 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[535] :: 1307 ~ 1309, 1990 ms, 480 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[536] :: 1311 ~ 1313, 1997 ms, 435 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[537] :: 1313 ~ 1316, 2261 ms, 588 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[538] :: 1316 ~ 1319, 2825 ms, 226 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[539] :: 1319 ~ 1320, 991 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[540] :: 1320 ~ 1323, 3014 ms, 821 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[541] :: 1323 ~ 1326, 3136 ms, 663 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[542] :: 1326 ~ 1327, 1473 ms, 387 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[543] :: 1327 ~ 1329, 1520 ms, 379 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[544] :: 1329 ~ 1331, 1913 ms, 493 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[545] :: 1331 ~ 1334, 2392 ms, 498 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[546] :: 1334 ~ 1335, 1682 ms, 443 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[547] :: 1335 ~ 1337, 1645 ms, 403 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[548] :: 1340 ~ 1343, 2333 ms, 481 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[549] :: 1344 ~ 1346, 2222 ms, 447 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[550] :: 1346 ~ 1348, 2196 ms, 522 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[551] :: 1348 ~ 1349, 526 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[552] :: 1349 ~ 1352, 2565 ms, 537 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[553] :: 1356 ~ 1359, 3868 ms, 817 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[554] :: 1359 ~ 1360, 905 ms, 220 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[555] :: 1360 ~ 1363, 2731 ms, 680 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[556] :: 1363 ~ 1364, 860 ms, 197 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[557] :: 1364 ~ 1366, 1538 ms, 222 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[558] :: 1366 ~ 1367, 1043 ms, 260 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[559] :: 1367 ~ 1369, 2075 ms, 364 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[560] :: 1373 ~ 1375, 1985 ms, 406 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[561] :: 1375 ~ 1376, 1297 ms, 316 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[562] :: 1376 ~ 1377, 639 ms, 162 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[563] :: 1377 ~ 1378, 1358 ms, 182 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[564] :: 1378 ~ 1379, 866 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[565] :: 1381 ~ 1383, 1731 ms, 362 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[566] :: 1383 ~ 1385, 1845 ms, 463 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[567] :: 1385 ~ 1388, 2603 ms, 532 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[568] :: 1388 ~ 1390, 1956 ms, 499 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[569] :: 1390 ~ 1391, 1817 ms, 428 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[570] :: 1392 ~ 1394, 2022 ms, 382 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[571] :: 1394 ~ 1395, 1631 ms, 419 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[572] :: 1395 ~ 1398, 2458 ms, 635 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[573] :: 1398 ~ 1399, 1537 ms, 355 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[574] :: 1400 ~ 1402, 2132 ms, 371 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[575] :: 1402 ~ 1404, 1860 ms, 463 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[576] :: 1408 ~ 1411, 2935 ms, 660 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[577] :: 1411 ~ 1414, 2431 ms, 600 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[578] :: 1414 ~ 1416, 1731 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[579] :: 1416 ~ 1417, 1117 ms, 269 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[580] :: 1417 ~ 1418, 1206 ms, 312 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[581] :: 1418 ~ 1421, 2315 ms, 406 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[582] :: 1421 ~ 1422, 1568 ms, 399 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[583] :: 1425 ~ 1426, 1379 ms, 265 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[584] :: 1426 ~ 1427, 986 ms, 266 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[585] :: 1427 ~ 1430, 2097 ms, 544 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[586] :: 1430 ~ 1432, 1781 ms, 288 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[587] :: 1432 ~ 1434, 1849 ms, 479 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[588] :: 1436 ~ 1439, 2607 ms, 523 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[589] :: 1439 ~ 1441, 2265 ms, 618 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[590] :: 1441 ~ 1442, 797 ms, 192 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[591] :: 1442 ~ 1445, 2624 ms, 475 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[592] :: 1445 ~ 1446, 1137 ms, 275 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[593] :: 1446 ~ 1448, 1954 ms, 493 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[594] :: 1448 ~ 1450, 2035 ms, 318 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[595] :: 1450 ~ 1452, 1562 ms, 423 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[596] :: 1452 ~ 1453, 1054 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[597] :: 1457 ~ 1459, 2434 ms, 437 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[598] :: 1459 ~ 1461, 1743 ms, 444 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[599] :: 1461 ~ 1464, 3014 ms, 545 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[600] :: 1464 ~ 1465, 815 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[601] :: 1465 ~ 1466, 1110 ms, 285 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[602] :: 1467 ~ 1468, 1708 ms, 229 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[603] :: 1468 ~ 1469, 1025 ms, 199 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[604] :: 1471 ~ 1472, 1594 ms, 327 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[605] :: 1472 ~ 1473, 1004 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[606] :: 1473 ~ 1475, 1144 ms, 290 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[607] :: 1475 ~ 1477, 2131 ms, 574 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[608] :: 1479 ~ 1480, 1195 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[609] :: 1480 ~ 1482, 2519 ms, 639 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[610] :: 1532 ~ 1533, 917 ms, 183 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[611] :: 1533 ~ 1534, 1219 ms, 313 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[612] :: 1553 ~ 1554, 1523 ms, 333 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[613] :: 1572 ~ 1573, 620 ms, 109 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[614] :: 1573 ~ 1574, 1451 ms, 354 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[615] :: 1575 ~ 1576, 1548 ms, 379 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[616] :: 1580 ~ 1582, 1847 ms, 411 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[617] :: 1596 ~ 1597, 747 ms, 148 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[618] :: 1614 ~ 1615, 1009 ms, 195 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[619] :: 1616 ~ 1618, 1905 ms, 452 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[620] :: 1637 ~ 1637, 526 ms, 124 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[621] :: 1639 ~ 1640, 1319 ms, 278 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[622] :: 1640 ~ 1642, 1816 ms, 461 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[623] :: 1643 ~ 1644, 1546 ms, 371 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[624] :: 1644 ~ 1645, 752 ms, 194 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[625] :: 1650 ~ 1651, 1786 ms, 337 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[626] :: 1655 ~ 1655, 340 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[627] :: 1660 ~ 1661, 1143 ms, 246 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[628] :: 1663 ~ 1665, 2374 ms, 567 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[629] :: 1682 ~ 1682, 200 ms, 17 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[630] :: 1682 ~ 1683, 443 ms, 80 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[631] :: 1683 ~ 1683, 443 ms, 102 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[632] :: 1711 ~ 1713, 1692 ms, 379 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[633] :: 1721 ~ 1722, 886 ms, 186 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[634] :: 1724 ~ 1725, 1456 ms, 354 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[635] :: 1728 ~ 1728, 511 ms, 100 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[636] :: 1737 ~ 1739, 1395 ms, 327 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[637] :: 1744 ~ 1744, 457 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[638] :: 1744 ~ 1746, 2043 ms, 511 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[639] :: 1746 ~ 1747, 776 ms, 177 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[640] :: 1749 ~ 1751, 1964 ms, 470 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[641] :: 1772 ~ 1773, 595 ms, 105 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[642] :: 1773 ~ 1775, 1854 ms, 472 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[643] :: 1789 ~ 1791, 2023 ms, 486 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[644] :: 1811 ~ 1813, 2149 ms, 471 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[645] :: 1813 ~ 1815, 2422 ms, 641 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[646] :: 1818 ~ 1821, 2631 ms, 641 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[647] :: 1821 ~ 1822, 1682 ms, 430 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[648] :: 1828 ~ 1830, 1925 ms, 478 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[649] :: 1834 ~ 1835, 568 ms, 148 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[650] :: 1840 ~ 1842, 1473 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[651] :: 1843 ~ 1846, 2877 ms, 668 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[652] :: 1846 ~ 1848, 2129 ms, 448 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[653] :: 1848 ~ 1850, 1489 ms, 376 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[654] :: 1855 ~ 1855, 508 ms, 114 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[655] :: 1865 ~ 1865, 451 ms, 57 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[656] :: 1870 ~ 1870, 669 ms, 132 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[657] :: 1885 ~ 1886, 1621 ms, 368 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[658] :: 1886 ~ 1888, 1909 ms, 487 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[659] :: 1890 ~ 1892, 1026 ms, 248 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[660] :: 1893 ~ 1895, 2102 ms, 421 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[661] :: 1915 ~ 1916, 857 ms, 164 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[662] :: 1918 ~ 1919, 1291 ms, 310 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[663] :: 1919 ~ 1921, 2191 ms, 541 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[664] :: 1933 ~ 1934, 1704 ms, 368 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[665] :: 1934 ~ 1937, 2838 ms, 692 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[666] :: 1978 ~ 1978, 730 ms, 130 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[667] :: 1995 ~ 1995, 71 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[668] :: 1995 ~ 1996, 706 ms, 137 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[669] :: 2000 ~ 2000, 405 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[670] :: 2006 ~ 2007, 986 ms, 186 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[671] :: 2017 ~ 2017, 520 ms, 97 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[672] :: 2017 ~ 2019, 1799 ms, 402 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[673] :: 2037 ~ 2037, 634 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[674] :: 2037 ~ 2038, 276 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[675] :: 2038 ~ 2040, 2797 ms, 723 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[676] :: 2061 ~ 2063, 2175 ms, 555 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[677] :: 2069 ~ 2070, 428 ms, 81 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[678] :: 2072 ~ 2074, 2137 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[679] :: 2084 ~ 2085, 515 ms, 74 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[680] :: 2086 ~ 2087, 929 ms, 215 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[681] :: 2095 ~ 2097, 2352 ms, 477 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[682] :: 2106 ~ 2108, 2446 ms, 567 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[683] :: 2108 ~ 2111, 2914 ms, 793 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[684] :: 2111 ~ 2114, 2963 ms, 754 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[685] :: 2114 ~ 2115, 877 ms, 201 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[686] :: 2115 ~ 2117, 2142 ms, 518 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[687] :: 2121 ~ 2123, 2590 ms, 566 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[688] :: 2123 ~ 2125, 1183 ms, 310 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[689] :: 2141 ~ 2142, 1891 ms, 415 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[690] :: 2149 ~ 2151, 2575 ms, 586 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[691] :: 2163 ~ 2164, 432 ms, 65 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[692] :: 2165 ~ 2166, 448 ms, 99 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[693] :: 2166 ~ 2168, 1798 ms, 406 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[694] :: 2170 ~ 2171, 1440 ms, 333 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[695] :: 2186 ~ 2187, 1458 ms, 344 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[696] :: 2207 ~ 2209, 1661 ms, 421 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[697] :: 2212 ~ 2212, 418 ms, 80 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[698] :: 2212 ~ 2214, 2035 ms, 552 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[699] :: 2214 ~ 2217, 2711 ms, 647 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[700] :: 2220 ~ 2220, 923 ms, 210 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[701] :: 2227 ~ 2229, 1758 ms, 441 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[702] :: 2234 ~ 2236, 1871 ms, 443 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[703] :: 2236 ~ 2236, 158 ms, 37 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[704] :: 2240 ~ 2241, 1689 ms, 416 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[705] :: 2241 ~ 2245, 3470 ms, 881 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[706] :: 2261 ~ 2264, 2843 ms, 693 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[707] :: 2264 ~ 2267, 2776 ms, 759 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[708] :: 2286 ~ 2286, 89 ms, 4 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[709] :: 2287 ~ 2288, 1447 ms, 330 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[710] :: 2288 ~ 2290, 1807 ms, 511 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[711] :: 2309 ~ 2310, 693 ms, 131 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[712] :: 2310 ~ 2312, 2105 ms, 424 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[713] :: 2315 ~ 2315, 66 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[714] :: 2330 ~ 2332, 1596 ms, 385 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[715] :: 2332 ~ 2334, 2245 ms, 535 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[716] :: 2336 ~ 2338, 2109 ms, 441 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[717] :: 2344 ~ 2345, 1760 ms, 414 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[718] :: 2356 ~ 2359, 3011 ms, 668 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[719] :: 2363 ~ 2365, 1922 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[720] :: 2367 ~ 2368, 87 ms, 5 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[721] :: 2370 ~ 2373, 2890 ms, 687 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[722] :: 2378 ~ 2380, 2326 ms, 532 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[723] :: 2383 ~ 2387, 3253 ms, 806 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[724] :: 2387 ~ 2389, 2253 ms, 536 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[725] :: 2389 ~ 2391, 2324 ms, 570 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[726] :: 2400 ~ 2403, 2812 ms, 707 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[727] :: 2413 ~ 2415, 1235 ms, 282 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[728] :: 2415 ~ 2418, 3159 ms, 689 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[729] :: 2437 ~ 2438, 844 ms, 170 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[730] :: 2441 ~ 2443, 1731 ms, 408 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[731] :: 2446 ~ 2448, 1838 ms, 416 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[732] :: 2448 ~ 2450, 2268 ms, 560 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[733] :: 2451 ~ 2454, 2345 ms, 486 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[734] :: 2454 ~ 2458, 3983 ms, 812 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[735] :: 2463 ~ 2464, 1512 ms, 380 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[736] :: 2465 ~ 2466, 1256 ms, 300 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[737] :: 2472 ~ 2475, 2653 ms, 626 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[738] :: 2487 ~ 2488, 892 ms, 167 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[739] :: 2488 ~ 2489, 1374 ms, 352 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[740] :: 2493 ~ 2494, 892 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[741] :: 2494 ~ 2494, 427 ms, 89 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[742] :: 2510 ~ 2514, 3566 ms, 856 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[743] :: 2514 ~ 2515, 1494 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[744] :: 2524 ~ 2527, 2549 ms, 582 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[745] :: 2535 ~ 2536, 893 ms, 189 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[746] :: 2536 ~ 2537, 1224 ms, 289 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[747] :: 2542 ~ 2545, 2588 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[748] :: 2545 ~ 2546, 1645 ms, 402 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[749] :: 2550 ~ 2550, 356 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[750] :: 2560 ~ 2562, 1550 ms, 334 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[751] :: 2562 ~ 2563, 1093 ms, 290 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[752] :: 2568 ~ 2571, 3353 ms, 816 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[753] :: 2571 ~ 2573, 1435 ms, 411 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[754] :: 2586 ~ 2587, 424 ms, 60 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[755] :: 2587 ~ 2588, 1208 ms, 300 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[756] :: 2594 ~ 2595, 1711 ms, 387 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[757] :: 2595 ~ 2598, 2104 ms, 560 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[758] :: 2602 ~ 2603, 1376 ms, 328 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[759] :: 2614 ~ 2615, 949 ms, 202 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[760] :: 2615 ~ 2615, 431 ms, 100 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[761] :: 2622 ~ 2625, 2698 ms, 682 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[762] :: 2625 ~ 2628, 2788 ms, 755 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[763] :: 2645 ~ 2647, 1864 ms, 402 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[764] :: 2647 ~ 2648, 1411 ms, 366 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[765] :: 2663 ~ 2664, 1112 ms, 220 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[766] :: 2664 ~ 2667, 3293 ms, 853 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[767] :: 2671 ~ 2671, 48 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[768] :: 2691 ~ 2691, 356 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[769] :: 2708 ~ 2709, 896 ms, 190 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[770] :: 2709 ~ 2711, 1980 ms, 494 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[771] :: 2714 ~ 2716, 2294 ms, 551 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[772] :: 2716 ~ 2718, 1877 ms, 503 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[773] :: 2734 ~ 2738, 3403 ms, 737 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[774] :: 2738 ~ 2741, 2789 ms, 671 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[775] :: 2741 ~ 2741, 678 ms, 167 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[776] :: 2744 ~ 2746, 1283 ms, 274 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[777] :: 2746 ~ 2747, 1289 ms, 345 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[778] :: 2753 ~ 2757, 3605 ms, 795 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[779] :: 2764 ~ 2764, 451 ms, 60 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[780] :: 2764 ~ 2765, 334 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[781] :: 2785 ~ 2785, 94 ms, 2 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[782] :: 2786 ~ 2787, 1365 ms, 318 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[783] :: 2796 ~ 2798, 2327 ms, 501 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[784] :: 2809 ~ 2810, 1602 ms, 334 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[785] :: 2810 ~ 2811, 740 ms, 190 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[786] :: 2828 ~ 2830, 1242 ms, 249 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[787] :: 2830 ~ 2832, 1858 ms, 513 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[788] :: 2832 ~ 2835, 2952 ms, 733 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[789] :: 2838 ~ 2840, 1674 ms, 415 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[790] :: 2843 ~ 2844, 903 ms, 191 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[791] :: 2845 ~ 2849, 3127 ms, 595 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[792] :: 2856 ~ 2857, 551 ms, 96 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[793] :: 2857 ~ 2859, 2117 ms, 540 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[794] :: 2865 ~ 2866, 1102 ms, 226 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[795] :: 2866 ~ 2869, 3033 ms, 691 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[796] :: 2872 ~ 2875, 2410 ms, 519 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[797] :: 2878 ~ 2880, 2335 ms, 561 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[798] :: 2883 ~ 2884, 1107 ms, 244 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[799] :: 2885 ~ 2888, 2916 ms, 690 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[800] :: 2907 ~ 2908, 774 ms, 167 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[801] :: 2928 ~ 2929, 1434 ms, 333 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[802] :: 2929 ~ 2932, 3025 ms, 830 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[803] :: 2932 ~ 2936, 3377 ms, 812 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[804] :: 2943 ~ 2945, 2152 ms, 493 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[805] :: 2945 ~ 2949, 3884 ms, 946 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[806] :: 2950 ~ 2953, 3237 ms, 765 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[807] :: 2953 ~ 2955, 1501 ms, 378 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[808] :: 2955 ~ 2958, 3628 ms, 897 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[809] :: 2967 ~ 2968, 616 ms, 150 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[810] :: 2968 ~ 2970, 2117 ms, 519 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[811] :: 2973 ~ 2974, 1115 ms, 256 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[812] :: 2975 ~ 2976, 1648 ms, 441 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[813] :: 2993 ~ 2993, 628 ms, 120 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[814] :: 3008 ~ 3009, 450 ms, 93 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[815] :: 3014 ~ 3016, 1965 ms, 454 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[816] :: 3018 ~ 3020, 2002 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[817] :: 3020 ~ 3023, 2703 ms, 630 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[818] :: 3029 ~ 3032, 2628 ms, 592 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[819] :: 3032 ~ 3035, 2963 ms, 791 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[820] :: 3035 ~ 3038, 3220 ms, 847 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[821] :: 3049 ~ 3051, 2161 ms, 501 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[822] :: 3051 ~ 3054, 2833 ms, 656 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[823] :: 3057 ~ 3058, 1657 ms, 409 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[824] :: 3058 ~ 3062, 3422 ms, 913 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[825] :: 3067 ~ 3069, 2317 ms, 562 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[826] :: 3069 ~ 3070, 311 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[827] :: 3080 ~ 3082, 2149 ms, 458 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[828] :: 3082 ~ 3084, 2143 ms, 538 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[829] :: 3084 ~ 3088, 3734 ms, 939 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[830] :: 3090 ~ 3092, 1380 ms, 353 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[831] :: 3109 ~ 3110, 661 ms, 114 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[832] :: 3110 ~ 3110, 628 ms, 156 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[833] :: 3131 ~ 3132, 870 ms, 189 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[834] :: 3132 ~ 3133, 1440 ms, 376 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[835] :: 3143 ~ 3144, 1406 ms, 268 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[836] :: 3160 ~ 3162, 1544 ms, 328 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[837] :: 3165 ~ 3168, 2581 ms, 515 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[838] :: 3176 ~ 3178, 2000 ms, 470 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[839] :: 3178 ~ 3180, 2170 ms, 536 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[840] :: 3180 ~ 3183, 2869 ms, 728 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[841] :: 3183 ~ 3183, 487 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[842] :: 3204 ~ 3204, 81 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[843] :: 3204 ~ 3207, 3032 ms, 738 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[844] :: 3207 ~ 3210, 3050 ms, 753 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[845] :: 3213 ~ 3216, 2679 ms, 680 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[846] :: 3232 ~ 3234, 1928 ms, 451 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[847] :: 3234 ~ 3236, 2163 ms, 554 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[848] :: 3238 ~ 3240, 1565 ms, 362 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[849] :: 3241 ~ 3242, 72 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[850] :: 3259 ~ 3260, 983 ms, 237 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[851] :: 3260 ~ 3261, 1039 ms, 283 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[852] :: 3266 ~ 3268, 2156 ms, 523 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[853] :: 3268 ~ 3271, 2240 ms, 531 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[854] :: 3273 ~ 3276, 2676 ms, 684 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[855] :: 3276 ~ 3279, 3491 ms, 841 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[856] :: 3294 ~ 3294, 508 ms, 103 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[857] :: 3294 ~ 3295, 597 ms, 144 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[858] :: 3295 ~ 3297, 1831 ms, 397 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[859] :: 3301 ~ 3301, 280 ms, 52 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[860] :: 3307 ~ 3309, 2496 ms, 537 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[861] :: 3312 ~ 3313, 715 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[862] :: 3313 ~ 3316, 3131 ms, 789 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[863] :: 3316 ~ 3318, 1662 ms, 390 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[864] :: 3339 ~ 3341, 1918 ms, 508 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[865] :: 3360 ~ 3360, 563 ms, 104 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[866] :: 3360 ~ 3363, 2781 ms, 664 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[867] :: 3366 ~ 3368, 2037 ms, 461 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[868] :: 3368 ~ 3371, 2668 ms, 606 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[869] :: 3387 ~ 3388, 587 ms, 86 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[870] :: 3388 ~ 3390, 2614 ms, 688 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[871] :: 3410 ~ 3412, 2075 ms, 548 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[872] :: 3412 ~ 3414, 1916 ms, 488 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[873] :: 3414 ~ 3415, 651 ms, 140 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[874] :: 3415 ~ 3418, 2922 ms, 722 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[875] :: 3421 ~ 3425, 3705 ms, 853 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[876] :: 3425 ~ 3425, 91 ms, 7 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[877] :: 3435 ~ 3438, 2133 ms, 457 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[878] :: 3441 ~ 3444, 2223 ms, 529 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[879] :: 3444 ~ 3446, 1954 ms, 517 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[880] :: 3447 ~ 3449, 2040 ms, 448 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[881] :: 3449 ~ 3452, 2243 ms, 554 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[882] :: 3454 ~ 3456, 2353 ms, 531 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[883] :: 3471 ~ 3471, 445 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[884] :: 3471 ~ 3474, 2742 ms, 689 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[885] :: 3477 ~ 3478, 1024 ms, 220 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[886] :: 3478 ~ 3480, 2122 ms, 505 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[887] :: 3498 ~ 3499, 1597 ms, 399 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[888] :: 3519 ~ 3520, 1233 ms, 300 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[889] :: 3520 ~ 3523, 3047 ms, 773 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[890] :: 3523 ~ 3525, 1591 ms, 353 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[891] :: 3528 ~ 3530, 2153 ms, 546 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[892] :: 3530 ~ 3533, 3041 ms, 857 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[893] :: 3535 ~ 3535, 85 ms, 5 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[894] :: 3544 ~ 3547, 3237 ms, 819 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[895] :: 3552 ~ 3553, 669 ms, 134 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[896] :: 3553 ~ 3556, 3040 ms, 723 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[897] :: 3556 ~ 3559, 3345 ms, 898 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[898] :: 3562 ~ 3564, 1695 ms, 350 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[899] :: 3564 ~ 3567, 2908 ms, 766 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[900] :: 3583 ~ 3586, 2627 ms, 610 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[901] :: 3586 ~ 3587, 1782 ms, 421 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[902] :: 3590 ~ 3591, 708 ms, 150 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[903] :: 3593 ~ 3595, 2278 ms, 547 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[904] :: 3610 ~ 3612, 1393 ms, 353 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[905] :: 3616 ~ 3617, 667 ms, 127 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[906] :: 3617 ~ 3619, 2290 ms, 561 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[907] :: 3634 ~ 3637, 3127 ms, 750 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[908] :: 3638 ~ 3641, 3446 ms, 866 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[909] :: 3644 ~ 3645, 804 ms, 168 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[910] :: 3645 ~ 3646, 1225 ms, 310 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[911] :: 3662 ~ 3663, 941 ms, 234 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[912] :: 3663 ~ 3666, 2234 ms, 447 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[913] :: 3666 ~ 3668, 2755 ms, 730 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[914] :: 3690 ~ 3692, 1991 ms, 458 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[915] :: 3695 ~ 3699, 3634 ms, 836 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[916] :: 3708 ~ 3708, 127 ms, 13 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[917] :: 3713 ~ 3715, 1702 ms, 328 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[918] :: 3715 ~ 3717, 2147 ms, 565 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[919] :: 3717 ~ 3720, 2638 ms, 666 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[920] :: 3720 ~ 3723, 2644 ms, 722 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[921] :: 3723 ~ 3726, 3026 ms, 738 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[922] :: 3729 ~ 3731, 1486 ms, 315 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[923] :: 3732 ~ 3736, 3926 ms, 1012 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[924] :: 3738 ~ 3738, 196 ms, 31 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[925] :: 3749 ~ 3750, 1800 ms, 449 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[926] :: 3771 ~ 3772, 515 ms, 83 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[927] :: 3772 ~ 3774, 1998 ms, 539 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[928] :: 3774 ~ 3776, 2382 ms, 626 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[929] :: 3777 ~ 3779, 2071 ms, 468 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[930] :: 3798 ~ 3800, 1407 ms, 328 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[931] :: 3803 ~ 3805, 2180 ms, 457 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[932] :: 3805 ~ 3807, 2219 ms, 565 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[933] :: 3814 ~ 3817, 3618 ms, 743 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[934] :: 3825 ~ 3826, 1053 ms, 212 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[935] :: 3826 ~ 3827, 467 ms, 104 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[936] :: 3827 ~ 3830, 2967 ms, 729 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[937] :: 3834 ~ 3836, 2216 ms, 518 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[938] :: 3836 ~ 3839, 3103 ms, 791 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[939] :: 3855 ~ 3856, 1558 ms, 339 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[940] :: 3856 ~ 3859, 3103 ms, 829 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[941] :: 3860 ~ 3862, 1965 ms, 480 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[942] :: 3865 ~ 3868, 2548 ms, 585 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[943] :: 3884 ~ 3885, 1159 ms, 253 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[944] :: 3885 ~ 3886, 1000 ms, 245 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[945] :: 3891 ~ 3893, 1862 ms, 435 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[946] :: 3908 ~ 3909, 1167 ms, 218 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[947] :: 3909 ~ 3912, 3280 ms, 849 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[948] :: 3912 ~ 3913, 1100 ms, 300 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[949] :: 3918 ~ 3918, 44 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[950] :: 3934 ~ 3934, 80 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[951] :: 3934 ~ 3936, 2059 ms, 524 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[952] :: 3936 ~ 3937, 1566 ms, 403 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[953] :: 3941 ~ 3943, 1366 ms, 310 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[954] :: 3944 ~ 3948, 3508 ms, 811 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[955] :: 3948 ~ 3950, 2506 ms, 622 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[956] :: 3964 ~ 3968, 3701 ms, 893 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[957] :: 3968 ~ 3969, 876 ms, 204 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[958] :: 3973 ~ 3974, 1512 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[959] :: 3980 ~ 3980, 159 ms, 23 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[960] :: 3990 ~ 3992, 1715 ms, 363 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[961] :: 4013 ~ 4015, 2298 ms, 583 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[962] :: 4017 ~ 4018, 1729 ms, 428 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[963] :: 4018 ~ 4022, 4081 ms, 948 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[964] :: 4025 ~ 4027, 2634 ms, 687 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[965] :: 4027 ~ 4030, 2128 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[966] :: 4032 ~ 4034, 1601 ms, 347 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[967] :: 4034 ~ 4037, 3668 ms, 940 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[968] :: 4039 ~ 4043, 4036 ms, 1012 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[969] :: 4043 ~ 4044, 1400 ms, 319 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[970] :: 4049 ~ 4052, 2296 ms, 588 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[971] :: 4052 ~ 4053, 1408 ms, 358 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[972] :: 4058 ~ 4060, 1114 ms, 245 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[973] :: 4060 ~ 4061, 988 ms, 252 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[974] :: 4061 ~ 4064, 3503 ms, 976 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[975] :: 4106 ~ 4106, 449 ms, 69 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[976] :: 4106 ~ 4107, 1213 ms, 328 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[977] :: 4107 ~ 4108, 1213 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[978] :: 4111 ~ 4113, 2295 ms, 624 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[979] :: 4113 ~ 4116, 2490 ms, 671 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[980] :: 4119 ~ 4122, 3118 ms, 761 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[981] :: 4122 ~ 4125, 2796 ms, 692 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[982] :: 4138 ~ 4142, 3149 ms, 688 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[983] :: 4142 ~ 4145, 3308 ms, 780 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[984] :: 4148 ~ 4151, 2740 ms, 682 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[985] :: 4153 ~ 4156, 2994 ms, 684 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[986] :: 4156 ~ 4157, 1029 ms, 268 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[987] :: 4160 ~ 4164, 3976 ms, 1026 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[988] :: 4164 ~ 4165, 1247 ms, 326 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[989] :: 4176 ~ 4179, 3032 ms, 683 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[990] :: 4179 ~ 4181, 2488 ms, 632 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[991] :: 4186 ~ 4187, 1697 ms, 393 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[992] :: 4187 ~ 4191, 3620 ms, 832 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[993] :: 4192 ~ 4195, 3236 ms, 756 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[994] :: 4195 ~ 4197, 2011 ms, 538 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[995] :: 4199 ~ 4202, 2783 ms, 604 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[996] :: 4211 ~ 4213, 2028 ms, 456 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[997] :: 4213 ~ 4215, 2011 ms, 507 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[998] :: 4218 ~ 4221, 3097 ms, 778 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[999] :: 4242 ~ 4244, 1918 ms, 445 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1000] :: 4244 ~ 4247, 3089 ms, 807 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1001] :: 4264 ~ 4264, 285 ms, 32 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1002] :: 4264 ~ 4265, 707 ms, 165 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1003] :: 4265 ~ 4268, 2887 ms, 666 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1004] :: 4271 ~ 4273, 2336 ms, 549 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1005] :: 4273 ~ 4275, 2187 ms, 557 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1006] :: 4275 ~ 4278, 3115 ms, 735 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1007] :: 4279 ~ 4280, 1060 ms, 223 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1008] :: 4280 ~ 4282, 1810 ms, 478 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1009] :: 4291 ~ 4292, 633 ms, 137 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1010] :: 4297 ~ 4297, 158 ms, 11 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1011] :: 4297 ~ 4298, 1075 ms, 264 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1012] :: 4298 ~ 4300, 1966 ms, 483 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1013] :: 4307 ~ 4309, 2438 ms, 604 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1014] :: 4309 ~ 4312, 2333 ms, 540 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1015] :: 4328 ~ 4328, 749 ms, 181 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1016] :: 4347 ~ 4348, 1139 ms, 250 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1017] :: 4350 ~ 4352, 2024 ms, 467 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1018] :: 4370 ~ 4371, 1223 ms, 319 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1019] :: 4375 ~ 4376, 593 ms, 122 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1020] :: 4391 ~ 4392, 1170 ms, 280 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1021] :: 4393 ~ 4394, 678 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1022] :: 4394 ~ 4397, 2576 ms, 669 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1023] :: 4416 ~ 4416, 60 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1024] :: 4416 ~ 4418, 1530 ms, 356 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1025] :: 4418 ~ 4420, 2475 ms, 607 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1026] :: 4430 ~ 4433, 3410 ms, 715 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1027] :: 4441 ~ 4444, 2733 ms, 665 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1028] :: 4444 ~ 4446, 1284 ms, 328 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1029] :: 4446 ~ 4447, 1636 ms, 439 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1030] :: 4457 ~ 4460, 3302 ms, 612 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1031] :: 4468 ~ 4469, 1215 ms, 324 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1032] :: 4469 ~ 4470, 974 ms, 184 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1033] :: 4470 ~ 4473, 2559 ms, 618 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1034] :: 4473 ~ 4476, 2404 ms, 581 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1035] :: 4495 ~ 4496, 1023 ms, 225 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1036] :: 4496 ~ 4497, 880 ms, 222 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1037] :: 4497 ~ 4498, 1039 ms, 259 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1038] :: 4503 ~ 4506, 2890 ms, 647 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1039] :: 4506 ~ 4507, 1282 ms, 355 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1040] :: 4522 ~ 4524, 2025 ms, 467 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1041] :: 4524 ~ 4525, 1584 ms, 401 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1042] :: 4526 ~ 4529, 2844 ms, 607 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1043] :: 4532 ~ 4534, 2487 ms, 584 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1044] :: 4534 ~ 4536, 2317 ms, 633 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1045] :: 4536 ~ 4539, 2661 ms, 619 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1046] :: 4539 ~ 4543, 3888 ms, 1012 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1047] :: 4543 ~ 4544, 693 ms, 148 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1048] :: 4549 ~ 4552, 2965 ms, 799 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1049] :: 4557 ~ 4560, 2639 ms, 533 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1050] :: 4584 ~ 4585, 1563 ms, 356 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1051] :: 4587 ~ 4588, 1847 ms, 459 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1052] :: 4588 ~ 4590, 1988 ms, 549 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1053] :: 4596 ~ 4598, 2374 ms, 591 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1054] :: 4598 ~ 4600, 2427 ms, 636 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1055] :: 4603 ~ 4607, 3132 ms, 639 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1056] :: 4607 ~ 4607, 571 ms, 125 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1057] :: 4615 ~ 4618, 3161 ms, 731 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1058] :: 4618 ~ 4620, 1685 ms, 447 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1059] :: 4622 ~ 4624, 2461 ms, 631 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1060] :: 4628 ~ 4630, 2511 ms, 678 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1061] :: 4630 ~ 4634, 3550 ms, 888 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1062] :: 4638 ~ 4642, 4017 ms, 1012 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1063] :: 4652 ~ 4653, 699 ms, 126 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1064] :: 4653 ~ 4654, 795 ms, 199 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1065] :: 4656 ~ 4658, 2449 ms, 521 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1066] :: 4658 ~ 4660, 1110 ms, 290 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1067] :: 4661 ~ 4664, 3301 ms, 744 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1068] :: 4666 ~ 4669, 2371 ms, 592 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1069] :: 4682 ~ 4683, 510 ms, 66 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1070] :: 4683 ~ 4686, 3312 ms, 857 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1071] :: 4709 ~ 4709, 631 ms, 112 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1072] :: 4713 ~ 4714, 1283 ms, 310 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1073] :: 4719 ~ 4719, 407 ms, 80 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1074] :: 4730 ~ 4731, 1593 ms, 378 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1075] :: 4731 ~ 4734, 2467 ms, 520 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1076] :: 4735 ~ 4738, 2564 ms, 630 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1077] :: 4738 ~ 4739, 1403 ms, 348 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1078] :: 4757 ~ 4760, 2695 ms, 689 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1079] :: 4760 ~ 4762, 2403 ms, 608 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1080] :: 4762 ~ 4765, 2719 ms, 735 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1081] :: 4765 ~ 4767, 2139 ms, 517 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1082] :: 4787 ~ 4787, 49 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1083] :: 4807 ~ 4807, 299 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1084] :: 4807 ~ 4808, 879 ms, 226 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1085] :: 4808 ~ 4809, 493 ms, 70 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1086] :: 4809 ~ 4811, 1644 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1087] :: 4811 ~ 4813, 2407 ms, 662 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1088] :: 4834 ~ 4836, 1386 ms, 339 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1089] :: 4839 ~ 4839, 774 ms, 166 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1090] :: 4839 ~ 4842, 3092 ms, 789 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1091] :: 4847 ~ 4851, 3222 ms, 833 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1092] :: 4861 ~ 4862, 313 ms, 47 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1093] :: 4863 ~ 4866, 2601 ms, 612 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1094] :: 4869 ~ 4871, 2713 ms, 702 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1095] :: 4871 ~ 4875, 3619 ms, 1009 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1096] :: 4880 ~ 4885, 5052 ms, 997 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1097] :: 4892 ~ 4893, 740 ms, 194 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1098] :: 4893 ~ 4894, 1618 ms, 362 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1099] :: 4894 ~ 4898, 3530 ms, 949 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1100] :: 4898 ~ 4899, 894 ms, 236 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1101] :: 4904 ~ 4907, 2577 ms, 636 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1102] :: 4912 ~ 4915, 3068 ms, 776 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1103] :: 4925 ~ 4926, 731 ms, 155 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1104] :: 4926 ~ 4929, 2472 ms, 599 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1105] :: 4929 ~ 4930, 1724 ms, 419 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1106] :: 4933 ~ 4936, 2656 ms, 550 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1107] :: 4956 ~ 4957, 1415 ms, 308 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1108] :: 4959 ~ 4961, 2499 ms, 543 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1109] :: 4965 ~ 4966, 372 ms, 73 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1110] :: 4976 ~ 4979, 2915 ms, 725 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1111] :: 4979 ~ 4981, 2385 ms, 627 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1112] :: 4984 ~ 4986, 1364 ms, 348 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1113] :: 4986 ~ 4989, 3455 ms, 802 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1114] :: 4989 ~ 4992, 2484 ms, 585 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1115] :: 4992 ~ 4995, 2792 ms, 753 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1116] :: 4996 ~ 4998, 2871 ms, 707 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1117] :: 5003 ~ 5006, 2987 ms, 703 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1118] :: 5009 ~ 5013, 3654 ms, 750 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1119] :: 5016 ~ 5017, 1019 ms, 237 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1120] :: 5017 ~ 5020, 2905 ms, 708 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1121] :: 5023 ~ 5023, 653 ms, 146 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1122] :: 5023 ~ 5024, 755 ms, 188 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1123] :: 5025 ~ 5027, 2093 ms, 451 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1124] :: 5027 ~ 5032, 4094 ms, 950 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1125] :: 5037 ~ 5039, 2203 ms, 480 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1126] :: 5059 ~ 5060, 1442 ms, 296 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1127] :: 5074 ~ 5078, 4286 ms, 1012 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1128] :: 5079 ~ 5080, 1766 ms, 378 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1129] :: 5080 ~ 5082, 1498 ms, 410 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1130] :: 5082 ~ 5085, 3015 ms, 835 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1131] :: 5096 ~ 5097, 1669 ms, 328 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1132] :: 5101 ~ 5104, 2505 ms, 626 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1133] :: 5104 ~ 5107, 2837 ms, 750 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1134] :: 5107 ~ 5108, 1533 ms, 340 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1135] :: 5128 ~ 5129, 650 ms, 108 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1136] :: 5129 ~ 5130, 679 ms, 172 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1137] :: 5130 ~ 5131, 1581 ms, 424 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1138] :: 5139 ~ 5142, 2955 ms, 678 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1139] :: 5142 ~ 5145, 2803 ms, 747 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1140] :: 5157 ~ 5159, 2181 ms, 475 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1141] :: 5161 ~ 5163, 2130 ms, 531 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1142] :: 5170 ~ 5171, 489 ms, 91 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1143] :: 5181 ~ 5183, 1700 ms, 388 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1144] :: 5183 ~ 5185, 2524 ms, 664 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1145] :: 5186 ~ 5187, 1537 ms, 406 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1146] :: 5191 ~ 5194, 2210 ms, 459 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1147] :: 5194 ~ 5197, 3108 ms, 814 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1148] :: 5211 ~ 5212, 956 ms, 208 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1149] :: 5212 ~ 5217, 4422 ms, 975 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1150] :: 5219 ~ 5222, 2833 ms, 699 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1151] :: 5222 ~ 5224, 2121 ms, 573 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1152] :: 5225 ~ 5226, 1274 ms, 277 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1153] :: 5236 ~ 5240, 3574 ms, 735 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1154] :: 5242 ~ 5246, 3483 ms, 894 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1155] :: 5246 ~ 5247, 1006 ms, 225 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1156] :: 5251 ~ 5253, 1948 ms, 455 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1157] :: 5259 ~ 5259, 342 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1158] :: 5269 ~ 5270, 506 ms, 88 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1159] :: 5270 ~ 5271, 552 ms, 133 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1160] :: 5274 ~ 5277, 2709 ms, 623 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1161] :: 5277 ~ 5281, 4020 ms, 1012 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1162] :: 5297 ~ 5300, 2840 ms, 666 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1163] :: 5300 ~ 5303, 2879 ms, 735 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1164] :: 5305 ~ 5307, 1611 ms, 435 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1165] :: 5309 ~ 5313, 3679 ms, 865 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1166] :: 5313 ~ 5316, 3279 ms, 853 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1167] :: 5318 ~ 5320, 1576 ms, 391 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1168] :: 5320 ~ 5324, 4498 ms, 1037 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1169] :: 5327 ~ 5327, 590 ms, 124 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1170] :: 5338 ~ 5342, 4207 ms, 989 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1171] :: 5342 ~ 5343, 1432 ms, 373 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1172] :: 5345 ~ 5348, 3546 ms, 811 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1173] :: 5357 ~ 5359, 2345 ms, 547 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1174] :: 5368 ~ 5369, 927 ms, 198 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1175] :: 5369 ~ 5370, 1427 ms, 390 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1176] :: 5394 ~ 5395, 893 ms, 194 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1177] :: 5395 ~ 5397, 1830 ms, 459 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1178] :: 5401 ~ 5404, 2008 ms, 482 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1179] :: 5404 ~ 5406, 2540 ms, 671 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1180] :: 5408 ~ 5411, 2397 ms, 518 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1181] :: 5411 ~ 5414, 3075 ms, 678 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1182] :: 5420 ~ 5421, 924 ms, 164 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1183] :: 5421 ~ 5422, 609 ms, 140 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1184] :: 5422 ~ 5424, 1823 ms, 457 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1185] :: 5429 ~ 5431, 2358 ms, 615 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1186] :: 5448 ~ 5449, 604 ms, 123 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1187] :: 5449 ~ 5452, 3394 ms, 833 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1188] :: 5455 ~ 5456, 1083 ms, 232 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1189] :: 5456 ~ 5457, 1565 ms, 368 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1190] :: 5457 ~ 5460, 3076 ms, 768 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1191] :: 5470 ~ 5474, 3970 ms, 824 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1192] :: 5476 ~ 5478, 1383 ms, 343 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1193] :: 5481 ~ 5482, 1264 ms, 298 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1194] :: 5482 ~ 5486, 3661 ms, 912 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1195] :: 5487 ~ 5490, 3781 ms, 908 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1196] :: 5508 ~ 5510, 1705 ms, 389 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1197] :: 5510 ~ 5511, 1312 ms, 322 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1198] :: 5512 ~ 5516, 3914 ms, 956 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1199] :: 5519 ~ 5522, 2723 ms, 703 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1200] :: 5539 ~ 5540, 1771 ms, 366 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1201] :: 5541 ~ 5544, 3032 ms, 648 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1202] :: 5544 ~ 5546, 2284 ms, 572 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1203] :: 5548 ~ 5551, 2161 ms, 490 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1204] :: 5551 ~ 5554, 3363 ms, 785 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1205] :: 5559 ~ 5560, 627 ms, 139 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1206] :: 5571 ~ 5573, 2082 ms, 435 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1207] :: 5574 ~ 5578, 3512 ms, 849 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1208] :: 5578 ~ 5582, 3629 ms, 872 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1209] :: 5583 ~ 5583, 516 ms, 112 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1210] :: 5599 ~ 5601, 1467 ms, 350 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1211] :: 5601 ~ 5603, 1914 ms, 527 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1212] :: 5604 ~ 5607, 3073 ms, 750 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1213] :: 5610 ~ 5612, 1995 ms, 433 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1214] :: 5612 ~ 5615, 3195 ms, 851 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1215] :: 5620 ~ 5621, 624 ms, 146 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1216] :: 5621 ~ 5623, 2425 ms, 589 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1217] :: 5634 ~ 5636, 1458 ms, 295 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1218] :: 5636 ~ 5639, 3343 ms, 882 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1219] :: 5639 ~ 5643, 3842 ms, 936 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1220] :: 5643 ~ 5644, 1407 ms, 368 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1221] :: 5650 ~ 5654, 3914 ms, 1012 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1222] :: 5670 ~ 5673, 3699 ms, 931 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1223] :: 5673 ~ 5676, 2982 ms, 760 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1224] :: 5678 ~ 5681, 2796 ms, 723 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1225] :: 5684 ~ 5688, 4387 ms, 997 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1226] :: 5693 ~ 5694, 515 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1227] :: 5699 ~ 5700, 679 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1228] :: 5705 ~ 5707, 1914 ms, 421 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1229] :: 5707 ~ 5710, 2903 ms, 671 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1230] :: 5710 ~ 5714, 3998 ms, 975 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1231] :: 5718 ~ 5721, 3593 ms, 819 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1232] :: 5721 ~ 5725, 4105 ms, 1018 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1233] :: 5741 ~ 5742, 1138 ms, 245 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1234] :: 5742 ~ 5743, 1692 ms, 437 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1235] :: 5743 ~ 5746, 2467 ms, 622 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1236] :: 5750 ~ 5753, 3363 ms, 755 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1237] :: 5753 ~ 5756, 2726 ms, 672 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1238] :: 5757 ~ 5760, 2415 ms, 573 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1239] :: 5760 ~ 5763, 3436 ms, 812 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1240] :: 5778 ~ 5780, 1968 ms, 467 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1241] :: 5780 ~ 5784, 3389 ms, 882 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1242] :: 5784 ~ 5786, 2492 ms, 648 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1243] :: 5790 ~ 5792, 1701 ms, 416 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1244] :: 5798 ~ 5801, 3461 ms, 935 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1245] :: 5812 ~ 5815, 2393 ms, 620 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1246] :: 5815 ~ 5816, 1092 ms, 297 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1247] :: 5831 ~ 5835, 3730 ms, 813 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1248] :: 5838 ~ 5839, 1067 ms, 213 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1249] :: 5839 ~ 5840, 826 ms, 211 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1250] :: 5840 ~ 5844, 4226 ms, 1013 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1251] :: 5849 ~ 5850, 1411 ms, 293 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1252] :: 5855 ~ 5857, 1938 ms, 509 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1253] :: 5868 ~ 5871, 2697 ms, 667 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1254] :: 5871 ~ 5874, 3312 ms, 812 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1255] :: 5874 ~ 5878, 4228 ms, 1045 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1256] :: 5881 ~ 5883, 2391 ms, 538 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1257] :: 5883 ~ 5887, 3445 ms, 889 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1258] :: 5887 ~ 5890, 2987 ms, 710 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1259] :: 5894 ~ 5895, 1052 ms, 223 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1260] :: 5905 ~ 5908, 2280 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1261] :: 5911 ~ 5914, 3075 ms, 724 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1262] :: 5914 ~ 5917, 2295 ms, 649 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1263] :: 5918 ~ 5920, 2660 ms, 653 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1264] :: 5920 ~ 5924, 3423 ms, 766 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1265] :: 5924 ~ 5928, 4094 ms, 978 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1266] :: 5936 ~ 5937, 1237 ms, 279 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1267] :: 5942 ~ 5945, 2897 ms, 743 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1268] :: 5945 ~ 5948, 2906 ms, 744 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1269] :: 5949 ~ 5951, 1587 ms, 392 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1270] :: 5951 ~ 5954, 3122 ms, 794 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1271] :: 5956 ~ 5960, 3345 ms, 801 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1272] :: 5965 ~ 5969, 3826 ms, 850 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1273] :: 5977 ~ 5980, 2561 ms, 611 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1274] :: 5980 ~ 5981, 1128 ms, 298 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1275] :: 5983 ~ 5985, 2474 ms, 637 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1276] :: 5985 ~ 5989, 3551 ms, 944 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1277] :: 5993 ~ 5996, 3223 ms, 733 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1278] :: 6000 ~ 6005, 5038 ms, 956 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1279] :: 6012 ~ 6013, 1086 ms, 247 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1280] :: 6018 ~ 6021, 2766 ms, 710 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1281] :: 6021 ~ 6024, 3893 ms, 959 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1282] :: 6029 ~ 6033, 3298 ms, 843 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1283] :: 6043 ~ 6044, 997 ms, 205 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1284] :: 6044 ~ 6047, 3162 ms, 849 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1285] :: 6047 ~ 6050, 3091 ms, 814 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1286] :: 6053 ~ 6055, 1605 ms, 342 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1287] :: 6055 ~ 6057, 1600 ms, 414 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1288] :: 6063 ~ 6066, 3039 ms, 787 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1289] :: 6076 ~ 6077, 932 ms, 175 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1290] :: 6077 ~ 6080, 2304 ms, 625 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1291] :: 6086 ~ 6088, 2254 ms, 584 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1292] :: 6088 ~ 6092, 4040 ms, 937 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1293] :: 6096 ~ 6100, 3612 ms, 758 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1294] :: 6108 ~ 6109, 1216 ms, 258 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1295] :: 6109 ~ 6113, 3795 ms, 975 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1296] :: 6115 ~ 6117, 2597 ms, 592 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1297] :: 6117 ~ 6119, 2133 ms, 584 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1298] :: 6119 ~ 6122, 2849 ms, 760 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1299] :: 6123 ~ 6127, 3945 ms, 911 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1300] :: 6127 ~ 6130, 3019 ms, 783 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1301] :: 6130 ~ 6132, 2624 ms, 553 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1302] :: 6132 ~ 6136, 3931 ms, 991 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1303] :: 6137 ~ 6141, 3480 ms, 884 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1304] :: 6143 ~ 6145, 2333 ms, 547 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1305] :: 6150 ~ 6153, 2981 ms, 654 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1306] :: 6158 ~ 6160, 2473 ms, 617 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1307] :: 6164 ~ 6167, 3286 ms, 812 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1308] :: 6167 ~ 6170, 3116 ms, 819 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1309] :: 6175 ~ 6175, 602 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1310] :: 6186 ~ 6187, 1111 ms, 269 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1311] :: 6187 ~ 6188, 1188 ms, 333 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1312] :: 6210 ~ 6210, 454 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1313] :: 6210 ~ 6213, 2623 ms, 686 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1314] :: 6214 ~ 6217, 2963 ms, 715 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1315] :: 6217 ~ 6220, 2957 ms, 774 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1316] :: 6228 ~ 6229, 648 ms, 138 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1317] :: 6240 ~ 6243, 3816 ms, 904 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1318] :: 6243 ~ 6246, 2104 ms, 527 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1319] :: 6246 ~ 6248, 2697 ms, 648 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1320] :: 6248 ~ 6252, 3574 ms, 882 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1321] :: 6256 ~ 6258, 2790 ms, 660 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1322] :: 6258 ~ 6261, 2746 ms, 672 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1323] :: 6261 ~ 6265, 3806 ms, 967 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1324] :: 6270 ~ 6273, 2129 ms, 545 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1325] :: 6283 ~ 6285, 1368 ms, 315 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1326] :: 6285 ~ 6286, 1384 ms, 357 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1327] :: 6290 ~ 6294, 3366 ms, 877 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1328] :: 6294 ~ 6297, 2827 ms, 699 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1329] :: 6314 ~ 6316, 2266 ms, 526 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1330] :: 6316 ~ 6317, 987 ms, 217 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1331] :: 6338 ~ 6342, 3180 ms, 813 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1332] :: 6342 ~ 6344, 2258 ms, 576 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1333] :: 6344 ~ 6347, 2729 ms, 623 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1334] :: 6351 ~ 6354, 3165 ms, 848 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1335] :: 6354 ~ 6358, 3896 ms, 1001 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1336] :: 6358 ~ 6361, 3320 ms, 842 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1337] :: 6361 ~ 6363, 1785 ms, 477 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1338] :: 6368 ~ 6370, 2139 ms, 541 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1339] :: 6370 ~ 6373, 2406 ms, 664 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1340] :: 6378 ~ 6381, 2488 ms, 559 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1341] :: 6384 ~ 6387, 2525 ms, 571 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1342] :: 6387 ~ 6389, 1757 ms, 461 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1343] :: 6389 ~ 6391, 2625 ms, 668 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1344] :: 6392 ~ 6393, 1509 ms, 360 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1345] :: 6393 ~ 6395, 1667 ms, 454 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1346] :: 6401 ~ 6403, 2457 ms, 600 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1347] :: 6403 ~ 6405, 2035 ms, 545 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1348] :: 6408 ~ 6410, 2289 ms, 532 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1349] :: 6419 ~ 6420, 1049 ms, 242 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1350] :: 6420 ~ 6423, 2602 ms, 716 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1351] :: 6424 ~ 6426, 2483 ms, 637 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1352] :: 6429 ~ 6433, 3177 ms, 756 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1353] :: 6450 ~ 6451, 1345 ms, 303 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1354] :: 6451 ~ 6455, 3764 ms, 911 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1355] :: 6458 ~ 6460, 2105 ms, 539 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1356] :: 6460 ~ 6462, 1533 ms, 333 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1357] :: 6462 ~ 6465, 3357 ms, 802 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1358] :: 6483 ~ 6484, 1211 ms, 254 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1359] :: 6484 ~ 6487, 3187 ms, 841 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1360] :: 6490 ~ 6493, 3424 ms, 877 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1361] :: 6493 ~ 6497, 4122 ms, 951 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1362] :: 6498 ~ 6502, 3165 ms, 707 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1363] :: 6502 ~ 6506, 4154 ms, 1011 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1364] :: 6509 ~ 6513, 3862 ms, 1009 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1365] :: 6514 ~ 6518, 3666 ms, 976 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1366] :: 6529 ~ 6530, 1441 ms, 326 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1367] :: 6532 ~ 6534, 1796 ms, 442 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1368] :: 6534 ~ 6537, 3200 ms, 820 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1369] :: 6545 ~ 6548, 2920 ms, 777 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1370] :: 6559 ~ 6562, 2532 ms, 572 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1371] :: 6562 ~ 6565, 3052 ms, 790 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1372] :: 6568 ~ 6570, 1727 ms, 387 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1373] :: 6587 ~ 6588, 960 ms, 198 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1374] :: 6588 ~ 6590, 1961 ms, 447 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1375] :: 6590 ~ 6593, 3195 ms, 850 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1376] :: 6593 ~ 6596, 3164 ms, 761 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1377] :: 6601 ~ 6603, 1541 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1378] :: 6608 ~ 6612, 3113 ms, 695 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1379] :: 6620 ~ 6622, 1857 ms, 468 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1380] :: 6622 ~ 6625, 2870 ms, 660 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1381] :: 6625 ~ 6630, 4850 ms, 1012 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1382] :: 6633 ~ 6636, 2663 ms, 612 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1383] :: 6636 ~ 6639, 2956 ms, 782 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1384] :: 6639 ~ 6642, 3331 ms, 835 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1385] :: 6644 ~ 6645, 992 ms, 185 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1386] :: 6645 ~ 6649, 3119 ms, 817 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1387] :: 6651 ~ 6653, 1070 ms, 264 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1388] :: 6653 ~ 6655, 2272 ms, 552 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1389] :: 6660 ~ 6663, 2613 ms, 677 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1390] :: 6668 ~ 6672, 4100 ms, 1012 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1391] :: 6673 ~ 6677, 4400 ms, 1050 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1392] :: 6679 ~ 6682, 3631 ms, 828 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1393] :: 6683 ~ 6685, 2503 ms, 530 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1394] :: 6691 ~ 6694, 3582 ms, 673 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1395] :: 6702 ~ 6705, 3095 ms, 765 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1396] :: 6705 ~ 6707, 1130 ms, 289 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1397] :: 6710 ~ 6713, 3283 ms, 715 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1398] :: 6730 ~ 6733, 2976 ms, 716 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1399] :: 6734 ~ 6737, 3405 ms, 787 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1400] :: 6737 ~ 6739, 2080 ms, 553 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1401] :: 6745 ~ 6749, 4172 ms, 991 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1402] :: 6749 ~ 6753, 4158 ms, 1002 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1403] :: 6755 ~ 6759, 3587 ms, 785 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1404] :: 6767 ~ 6769, 2516 ms, 663 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1405] :: 6770 ~ 6772, 2837 ms, 660 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1406] :: 6772 ~ 6773, 159 ms, 33 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1407] :: 6773 ~ 6775, 2288 ms, 575 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1408] :: 6775 ~ 6778, 3127 ms, 780 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1409] :: 6782 ~ 6786, 3606 ms, 847 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1410] :: 6786 ~ 6789, 3051 ms, 804 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1411] :: 6789 ~ 6792, 3184 ms, 698 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1412] :: 6795 ~ 6800, 4392 ms, 916 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1413] :: 6807 ~ 6809, 1790 ms, 398 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1414] :: 6809 ~ 6811, 2407 ms, 634 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1415] :: 6815 ~ 6818, 2985 ms, 745 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1416] :: 6819 ~ 6822, 2860 ms, 666 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1417] :: 6822 ~ 6824, 2826 ms, 705 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1418] :: 6830 ~ 6834, 3987 ms, 953 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1419] :: 6842 ~ 6843, 1105 ms, 222 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1420] :: 6843 ~ 6845, 2323 ms, 644 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1421] :: 6845 ~ 6848, 3106 ms, 801 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1422] :: 6848 ~ 6851, 2422 ms, 673 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1423] :: 6861 ~ 6865, 3330 ms, 880 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1424] :: 6865 ~ 6867, 2548 ms, 644 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1425] :: 6878 ~ 6879, 958 ms, 203 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1426] :: 6879 ~ 6881, 1575 ms, 406 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1427] :: 6881 ~ 6882, 1558 ms, 377 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1428] :: 6882 ~ 6885, 2451 ms, 607 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1429] :: 6887 ~ 6889, 1828 ms, 420 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1430] :: 6890 ~ 6893, 2508 ms, 624 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1431] :: 6893 ~ 6896, 2588 ms, 656 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1432] :: 6896 ~ 6901, 4525 ms, 1031 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1433] :: 6903 ~ 6907, 3760 ms, 940 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1434] :: 6918 ~ 6921, 2657 ms, 639 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1435] :: 6921 ~ 6922, 1685 ms, 458 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1436] :: 6925 ~ 6927, 2875 ms, 652 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1437] :: 6928 ~ 6931, 3017 ms, 684 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1438] :: 6948 ~ 6952, 3561 ms, 834 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1439] :: 6956 ~ 6959, 2950 ms, 748 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1440] :: 6959 ~ 6960, 1476 ms, 384 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1441] :: 6966 ~ 6970, 3955 ms, 949 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1442] :: 6981 ~ 6982, 1478 ms, 324 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1443] :: 6982 ~ 6984, 1197 ms, 324 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1444] :: 6984 ~ 6986, 2706 ms, 635 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1445] :: 6987 ~ 6991, 3748 ms, 940 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1446] :: 6997 ~ 7001, 3860 ms, 974 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1447] :: 7004 ~ 7005, 640 ms, 164 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1448] :: 7015 ~ 7018, 2785 ms, 675 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1449] :: 7018 ~ 7020, 1462 ms, 385 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1450] :: 7020 ~ 7022, 1805 ms, 484 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1451] :: 7022 ~ 7025, 3142 ms, 747 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1452] :: 7030 ~ 7033, 3206 ms, 820 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1453] :: 7033 ~ 7036, 2703 ms, 701 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1454] :: 7041 ~ 7045, 3225 ms, 721 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1455] :: 7053 ~ 7054, 1309 ms, 278 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1456] :: 7054 ~ 7057, 2729 ms, 724 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1457] :: 7062 ~ 7065, 3147 ms, 738 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1458] :: 7065 ~ 7068, 2704 ms, 739 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1459] :: 7072 ~ 7076, 3821 ms, 940 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1460] :: 7082 ~ 7084, 2340 ms, 599 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1461] :: 7090 ~ 7091, 1880 ms, 443 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1462] :: 7091 ~ 7096, 4363 ms, 1058 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1463] :: 7099 ~ 7103, 3912 ms, 948 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1464] :: 7104 ~ 7107, 3400 ms, 863 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[1465] :: 7107 ~ 7111, 4032 ms, 1063 (MB), Reclaimed Zone : 1, ZLV: 0.000000
Total ZC Copied (MB) :: 588738, Recaimed by ZC :: 1465 
Total ZC copied- GC_BYTES_WRITTEN(MB):: 588721 
Reset Count (R+ZC) : 270+1465=1735
Finish Count : 0
Average ZLV :: 0.000000
propagation count : 2746
TOTAL I/O BLOKCING TIME 4094
TOTAL I/O BLOCKING TIME(ms) 2617534
Cumulative I/O Blocking(ms) 2617534
Calculate Lifetime Time(ms) 3031
copy/written ratio : 617319456094/1424937079458=43
level[0]: 분자(overlapping) 161729658955 / 분모(file size) 107923021666 = 1.4986
level[1]: 분자(overlapping) 410448930711 / 분모(file size) 106108216336 = 3.8682
level[2]: 분자(overlapping) 292349432286 / 분모(file size) 95351890757 = 3.0660
level[3]: 분자(overlapping) 0 / 분모(file size) 41444994141 = 0.0000
level[4]: 분자(overlapping) 0 / 분모(file size) 0 = 0.0000
avg deletion after time 407490146 us (total: 1495488838281 us, count: 3670)
reset_count_before_full_ 0 reset_size_before_full_ 0
SEQUENCE DISTRIBUTION
74 42 61 87 63 14 21 29 37 13 19 25 39 17 14 11 19 17 26 20 37 31 29 53 27 9 22 13 28 20 16 9 7 5 11 3 3 25 10 17 8 13 11 17 5 8 32 15 19 3 3 9 15 4 5 10 6 8 15 17 10 15 14 17 16 30 19 13 10 5 8 3 11 5 15 12 14 10 7 15 10 11 15 8 10 7 7 7 5 9 18 5 8 4 8 7 3 4 5 13 5 5 4 2 6 5 6 6 6 5 8 13 2 4 13 2 3 9 6 12 9 8 6 8 12 4 3 16 5 8 1 10 2 3 4 5 5 5 6 12 5 9 1 7 4 7 5 7 7 6 16 1 7 6 4 5 6 14 1 9 6 4 7 1 5 18 7 6 1 6 3 6 9 2 2 5 7 2 3 2 3 8 2 1 14 3 9 1 3 4 4 9 5 8 1 4 2 2 0 3 2 0 2 8 3 6 3 2 2 3 0 1 0 0 1 3 4 7 7 1 3 1 5 1 2 6 6 2 0 6 5 9 1 0 4 4 3 1 2 4 3 7 1 5 2 3 0 6 1 2 3 2 1 4 1 3 0 3 1 10 1 1 2 1 5 0 4 1 0 0 3 0 9 4 5 2 0 1 2 3 6 1 6 2 4 0 1 1 1 4 0 5 0 1 0 0 3 4 1 1 0 2 5 5 3 0 2 0 1 5 1 1 4 5 2 0 1 10 3 0 2 1 4 5 4 2 3 2 2 0 0 1 2 2 1 3 0 0 0 0 0 1 2 2 7 6 2 2 11 1 0 2 4 3 0 0 0 2 3 0 8 2 0 3 1 2 7 1 3 5 2 2 1 0 2 5 2 2 0 4 3 0 0 1 1 5 2 4 3 1 1 2 6 0 0 1 0 1 2 3 3 0 2 2 2 1 5 0 1 3 2 2 0 9 4 3 0 4 0 2 1 9 0 2 1 2 0 0 2 0 0 0 0 1 0 0 2 5 0 0 1 0 1 0 0 1 0 2 0 0 2 1 0 1 1 3 5 0 7 2 1 5 0 0 0 5 0 0 0 1 0 0 3 0 5 1 1 0 3 0 1 6 0 2 1 2 3 2 1 5 1 1 1 2 0 0 2 1 1 1 0 3 0 3 4 1 0 2 0 0 0 3 1 2 0 0 2 0 2 0 2 2 0 1 0 0 2 0 5 0 3 2 0 3 0 3 1 5 0 0 1 0 0 0 0 0 1 0 0 2 3 2 3 0 1 3 2 0 1 0 10 1 0 5 1 1 1 0 2 0 0 1 1 0 2 0 1 3 0 0 1 0 0 0 1 2 0 4 3 2 0 2 0 3 1 2 1 1 0 0 1 2 0 2 0 7 0 0 0 0 0 0 0 0 1 0 0 1 0 2 5 0 1 1 0 1 2 2 2 1 1 0 0 0 1 1 0 5 0 1 1 2 4 1 1 0 0 2 0 2 2 0 0 1 1 1 3 0 1 2 3 2 1 0 1 0 1 0 0 0 0 0 2 0 1 0 0 0 0 6 1 1 0 0 0 0 0 0 1 0 0 1 0 0 0 1 0 0 0 0 0 3 0 2 3 1 0 4 0 1 2 0 0 0 0 4 0 2 1 0 0 0 0 0 0 1 1 0 1 0 0 0 0 0 1 0 3 0 0 1 0 1 1 0 3 5 1 2 0 4 2 0 2 0 1 0 0 0 0 0 0 0 3 0 1 0 0 0 0 3 0 1 0 0 0 0 1 1 1 2 0 0 0 0 0 0 0 1 0 0 3 0 0 2 0 0 0 1 1 0 1 3 3 3 2 0 2 0 0 1 3 1 0 1 0 1 0 1 2 0 0 0 0 1 1 2 0 1 0 0 0 1 0 1 0 0 0 0 0 0 1 0 0 0 1 0 3 0 2 0 0 0 0 1 2 0 0 0 0 2 0 0 0 0 2 0 0 1 0 1 1 0 2 0 1 0 0 2 1 2 1 0 0 1 0 0 0 1 0 1 1 1 0 0 0 0 0 0 0 0 2 0 0 0 2 0 1 0 0 1 0 3 0 1 0 1 1 0 1 1 2 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 5 1 0 0 1 0 0 0 0 0 0 1 2 0 0 0 1 0 1 1 0 2 2 0 1 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 2 1 1 1 0 0 0 0 0 1 0 0 4 0 0 0 1 1 1 1 0 0 0 0 0 1 1 0 2 0 1 4 3 1 1 0 0 0 2 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 1 0 0 0 0 0 0 1 0 0 0 0 3 0 1 0 1 0 2 0 0 0 0 1 1 3 2 4 1 2 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 3 0 0 0 2 1 2 0 1 0 1 0 1 0 1 0 0 0 1 0 0 1 3 0 2 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 7 1 0 0 0 1 0 0 1 0 0 0 0 0 4 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 2 0 0 0 1 0 0 0 0 1 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0 0 1 0 2 0 2 2 0 0 0 0 1 1 1 0 2 1 2 0 0 0 0 0 0 0 0 0 0 0 0 2 1 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 1 1 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 1 2 0 0 1 1 0 1 0 0 1 0 1 3 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 1 2 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 2 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 1 0 0 0 2 1 0 0 0 0 1 0 2 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 2 0 1 0 0 0 1 0 1 0 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 1 0 0 0 1 0 0 0 0 0 1 0 1 0 0 2 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 1 1 0 1 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 3 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 1 0 0 0 1 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 2 4 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 2 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 2 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 FILE SIZE DISTRIBUITION
163 63 64 67 66 62 79 92 69 72 84 75 100 78 89 99 99 91 80 78 81 94 76 91 86 85 88 86 70 89 84 88 99 66 79 85 2911 94 88 98 88 94 100 92 95 68 93 94 77 87 88 108 91 115 105 105 107 105 98 108 116 128 95 2919 13758 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 PrintMisPredictStats
[Accumulated Stats] right_vertical_total=7403, false_vertical_total=9237, right_horizontal_total=2290597, false_horizontal_total=50540
[Accumulated] Vertical false/(right+false) = 0.555108 (≈ 55.5108%)
[Accumulated] Horizontal false/(right+false) = 0.0215878 (≈ 2.15878%)

