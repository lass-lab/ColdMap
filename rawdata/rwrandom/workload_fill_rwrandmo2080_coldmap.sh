minsky@minsky-MS-7E13:~/EZC/data$ cat ../mix.sh 
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
minsky@minsky-MS-7E13:~/EZC/data$ 



aminsky@minsky-MS-7E13:~/EZC/data$ cat /home/minsky/EZC/data/fill_CBZC_8STEP_a0.5_fill_rwrandom2080
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
reset_scheme 1 partial_reset_scheme 1 tuning_point 80 allocation_scheme 2 compaction_scheme 0 input_aware_scheme 0 zc_scheme 3 alpha_value 0.500000 sigma_value 0.000000 disable finish 1 predict_cnt 8
ZenFS::SetResetScheme: r = 1, T = 80, allocation_schme = 2, zc_scheme = 3, finish_scheme = 1, predict_cnt = 8
zbd_->SetResetScheme: r = 1, T = 80, allocation_schme = 2, zc_scheme = 3, finish_scheme = 1, predict_cnt = 8
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
reset_scheme 1 partial_reset_scheme 1 tuning_point 80 allocation_scheme 2 compaction_scheme 0 input_aware_scheme 0 zc_scheme 3 alpha_value 0.500000 sigma_value 0.000000 disable finish 1 predict_cnt 8
ZenFS::SetResetScheme: r = 1, T = 80, allocation_schme = 2, zc_scheme = 3, finish_scheme = 1, predict_cnt = 8
zbd_->SetResetScheme: r = 1, T = 80, allocation_schme = 2, zc_scheme = 3, finish_scheme = 1, predict_cnt = 8
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
0	99	454171	0	0	0	0	0	
50	78	12308680	0	0	0	0	20	
100	61	21274122	0	0	0	0	46	
150	58	29515603	0	0	0	0	85	
200	45	36987936	0	0	0	0	114	
250	38	44449500	0	0	0	0	150	
300	31	51691818	0	0	0	0	186	
350	31	58782704	0	0	404	4971	228	
400	31	65616777	0	0	2004	19106	268	
450	29	70685141	0	0	5470	42307	303	
500	32	76094882	0	0	8977	67502	343	
550	30	80739106	0	0	12838	92060	375	
600	28	85814267	0	0	16579	114100	408	
650	31	89615412	0	0	22207	145887	442	
700	28	94522205	0	0	26786	171138	472	
750	31	97270443	0	0	33896	207397	502	
800	26	100917474	0	0	39467	234812	528	
850	29	103510479	0	0	46973	271722	557	
900	27	107247273	0	0	53123	303497	584	
950	29	109799517	0	0	60340	340116	613	
1000	30	112713027	0	0	68022	379055	641	
1050	31	114960081	0	0	76625	420593	666	
1100	28	117514400	0	0	83838	454484	689	
1150	28	120077084	0	0	91731	491794	714	
1200	30	121996985	0	0	100539	533770	739	
1250	30	124107571	0	0	108911	572495	763	
fillrandom   :      10.158 micros/op 98449 ops/sec 1278.114 seconds 125829120 operations;   97.6 MB/s
Microseconds per write:
Count: 125829120 Average: 10.1575  StdDev: 4726.92
Min: 0  Median: 0.7261  Max: 14181259
Percentiles: P50: 0.73 P75: 1.26 P99: 5.46 P99.9: 2108.61 P99.99: 4483.22
------------------------------------------------------
[       0,       1 ] 86642060  68.857%  68.857% ##############
(       1,       2 ] 30095158  23.917%  92.774% #####
(       2,       3 ]  4505983   3.581%  96.355% #
(       3,       4 ]  2232114   1.774%  98.129% 
(       4,       6 ]  1503700   1.195%  99.324% 
(       6,      10 ]   420340   0.334%  99.658% 
(      10,      15 ]    79552   0.063%  99.722% 
(      15,      22 ]    22054   0.018%  99.739% 
(      22,      34 ]    12605   0.010%  99.749% 
(      34,      51 ]     4558   0.004%  99.753% 
(      51,      76 ]     3201   0.003%  99.755% 
(      76,     110 ]     3029   0.002%  99.758% 
(     110,     170 ]     1776   0.001%  99.759% 
(     170,     250 ]      896   0.001%  99.760% 
(     250,     380 ]      596   0.000%  99.760% 
(     380,     580 ]     5813   0.005%  99.765% 
(     580,     870 ]    23244   0.018%  99.783% 
(     870,    1300 ]   110059   0.087%  99.871% 
(    1300,    1900 ]    14756   0.012%  99.883% 
(    1900,    2900 ]   104487   0.083%  99.966% 
(    2900,    4400 ]    30136   0.024%  99.990% 
(    4400,    6600 ]    11106   0.009%  99.998% 
(    6600,    9900 ]     1429   0.001% 100.000% 
(    9900,   14000 ]      213   0.000% 100.000% 
(   14000,   22000 ]       69   0.000% 100.000% 
(   22000,   33000 ]        2   0.000% 100.000% 
(   33000,   50000 ]        6   0.000% 100.000% 
(   75000,  110000 ]        4   0.000% 100.000% 
(  110000,  170000 ]        5   0.000% 100.000% 
(  170000,  250000 ]        1   0.000% 100.000% 
(  250000,  380000 ]        8   0.000% 100.000% 
(  380000,  570000 ]       15   0.000% 100.000% 
(  570000,  860000 ]       10   0.000% 100.000% 
(  860000, 1200000 ]       12   0.000% 100.000% 
( 1200000, 1900000 ]       17   0.000% 100.000% 
( 1900000, 2900000 ]       36   0.000% 100.000% 
( 2900000, 4300000 ]       29   0.000% 100.000% 
( 4300000, 6500000 ]       20   0.000% 100.000% 
( 6500000, 9800000 ]       17   0.000% 100.000% 
( 9800000, 14000000 ]        3   0.000% 100.000% 
( 14000000, 22000000 ]        1   0.000% 100.000% 

DB path: [rocksdbtest/dbbench]
1300	27	125858160	7263	0	115587	605390	786	
1350	28	125937360	27066	0	125547	647934	806	
1400	29	126057120	57007	0	133579	684658	828	
1450	30	126253200	106025	0	140703	718267	851	
1500	28	126867360	259568	0	141941	723551	856	
1550	28	127441120	403016	0	144215	733521	862	
1600	29	128011920	545713	0	146511	743106	870	
1650	27	128560560	682879	0	148798	752112	876	
1700	28	129098160	817270	0	152150	766582	885	
1750	27	129698000	967238	0	153319	771561	889	
1800	29	130235360	1101576	0	156133	783643	898	
1850	29	130808960	1244969	0	157847	791374	906	
1900	28	131396160	1391773	0	159295	797804	911	
1950	28	131947680	1529660	0	161382	806798	918	
2000	27	132497600	1667132	0	163624	816368	925	
2050	28	132978480	1787354	0	166982	829704	933	
2100	28	133522720	1923404	0	169305	839404	940	
2150	29	134022320	2048310	0	172206	852204	949	
2200	29	134532480	2175853	0	174711	862593	956	
2250	30	135021200	2298037	0	177634	874921	964	
2300	30	135483200	2413525	0	181361	888369	971	
2350	27	136087200	2564535	0	181945	893002	975	
2400	28	136598480	2692356	0	184864	904550	984	
2450	28	137201040	2842982	0	185901	910821	989	
2500	28	137648640	2954894	0	190184	928004	998	
2550	28	138205920	3094202	0	192816	940873	1006	
2600	28	138693535	3216120	0	196212	954698	1013	
2650	27	139189200	3340032	0	199168	966907	1020	
2700	28	139620240	3447793	0	203027	983390	1029	
2750	29	140114080	3571254	0	205840	995052	1037	
2800	29	140623280	3698559	0	208214	1005007	1044	
2850	28	141137040	3826986	0	210526	1014229	1049	
2900	27	141660640	3957899	0	212698	1023294	1055	
2950	28	142158160	4082274	0	216403	1039173	1065	
3000	28	142638080	4202252	0	219840	1053725	1073	
3050	28	143101600	4318126	0	223558	1068752	1081	
3100	29	143624427	4448840	0	225870	1078110	1088	
3150	28	143994240	4541286	0	231514	1099358	1097	
3200	29	144486000	4664228	0	234253	1112349	1105	
3250	29	144945840	4779182	0	237476	1125474	1112	
3300	28	145433280	4901047	0	240081	1136132	1118	
3350	28	145880320	5012809	0	243656	1151304	1126	
3400	28	146321360	5123062	0	247707	1168053	1134	
3450	28	146734480	5226354	0	252409	1187481	1143	
3500	29	147255436	5356580	0	254581	1197203	1150	
3550	27	147810640	5495396	0	255973	1203096	1155	
3600	28	148253760	5606169	0	260048	1219967	1164	
3650	28	148770320	5735305	0	262237	1229185	1171	
3700	28	149234560	5851379	0	265811	1244173	1178	
3750	28	149691200	5965537	0	269527	1258944	1186	
3800	29	150177680	6087145	0	272843	1272611	1194	
3850	27	150719128	6222520	0	274445	1278603	1199	
3900	28	151156720	6331909	0	277797	1294229	1206	
3950	28	151657860	6457200	0	280388	1305122	1213	
4000	28	152170960	6585476	0	282776	1314461	1221	
4050	28	152644720	6703918	0	285820	1329140	1228	
4100	29	153087360	6814574	0	290258	1347290	1237	
4150	28	153553840	6931183	0	293168	1360103	1244	
4200	28	153957720	7032160	0	298267	1378719	1253	
4250	29	154404240	7143783	0	301765	1395289	1261	
4300	27	154916720	7271912	0	304217	1404315	1266	
4350	28	155363360	7383576	0	307980	1420893	1275	
4400	27	155895520	7516610	0	310249	1430928	1281	
4450	28	156374160	7636263	0	313060	1442803	1288	
4500	28	156740640	7727890	0	319340	1468932	1299	
4550	27	157189920	7840211	0	323269	1482970	1306	
4600	27	157638654	7952400	0	326723	1497342	1313	
4650	28	158121200	8073029	0	329371	1510026	1320	
4700	28	158513520	8171119	0	334250	1528551	1330	
4750	27	158964960	8283978	0	337856	1544547	1337	
4800	28	159411040	8395485	0	341416	1557737	1344	
4850	28	159874400	8511321	0	344511	1570988	1351	
4900	28	160179440	8587585	0	350726	1596220	1361	
4950	26	160627840	8699700	0	354070	1606486	1366	
5000	28	160943360	8778573	0	360305	1634175	1377	
5050	27	161376720	8886906	0	364741	1651548	1384	
5100	29	161701680	8968143	0	371183	1679238	1396	
5150	28	162150160	9080279	0	374429	1691602	1402	
5200	29	162568240	9184789	0	379540	1714936	1411	
5250	27	162990080	9290250	0	383860	1731958	1418	
5300	28	163444800	9403939	0	387303	1746380	1427	
5350	30	163779680	9487641	0	393159	1769964	1437	
5400	28	164255040	9606482	0	395646	1780179	1442	
5450	27	164669943	9710220	0	400142	1797181	1450	
5500	27	165150285	9830300	0	402490	1808006	1456	
5550	28	165566413	9934340	0	407147	1828219	1465	
5600	27	165992960	10040979	0	411122	1845517	1473	
5650	27	166413803	10146180	0	415130	1859856	1480	
5700	28	166698800	10217434	0	421748	1888523	1490	
5750	29	167105440	10319100	0	426682	1907920	1498	
5800	28	167492720	10415916	0	431134	1927137	1506	
5850	27	167926800	10524421	0	434863	1942502	1513	
5900	27	168351680	10630649	0	439322	1959540	1520	
5950	27	168677520	10712102	0	445414	1985151	1530	
6000	27	169143200	10828540	0	448366	1996834	1537	
6050	28	169466960	10909478	0	455234	2024966	1548	
6100	27	169898080	11017252	0	459100	2039865	1554	
6150	28	170254560	11106379	0	465718	2067976	1564	
6200	28	170606800	11194426	0	471818	2093167	1573	
6250	27	170916720	11271908	0	478212	2117327	1581	
6300	28	171288400	11364837	0	483531	2141358	1590	
6350	27	171646560	11454369	0	488721	2162225	1598	
6400	28	172073360	11561078	0	492652	2178086	1605	
6450	28	172348320	11629802	0	499672	2203170	1615	
6500	28	172741040	11727982	0	503985	2222902	1622	
6550	27	173147040	11829482	0	508513	2240917	1630	
6600	26	173606320	11944308	0	511784	2254481	1636	
6650	27	173936796	12026920	0	517332	2278189	1646	
6700	28	174380080	12137752	0	521153	2294712	1654	
6750	27	174766640	12234391	0	526162	2315427	1662	
6800	27	175138960	12327466	0	532419	2342361	1671	
6850	28	175470000	12410238	0	539091	2369570	1682	
6900	28	175833120	12501004	0	544467	2392505	1690	
readrandomwriterandom :      89.952 micros/op 11117 ops/sec 5659.299 seconds 62914560 operations; ( reads:12582920 writes:50331640 total:125829120 found:8770054)
Microseconds per read:
Count: 12582920 Average: 410.2097  StdDev: 19319.05
Min: 0  Median: 298.5681  Max: 13108992
Percentiles: P50: 298.57 P75: 376.53 P99: 977.25 P99.9: 1598.53 P99.99: 3683.76
------------------------------------------------------
[       0,       1 ]      300   0.002%   0.002% 
(       1,       2 ]      636   0.005%   0.007% 
(       2,       3 ]      631   0.005%   0.012% 
(       3,       4 ]     1169   0.009%   0.022% 
(       4,       6 ]     3643   0.029%   0.051% 
(       6,      10 ]    10301   0.082%   0.133% 
(      10,      15 ]    16853   0.134%   0.266% 
(      15,      22 ]    21427   0.170%   0.437% 
(      22,      34 ]    24402   0.194%   0.631% 
(      34,      51 ]    40686   0.323%   0.954% 
(      51,      76 ]    71382   0.567%   1.521% 
(      76,     110 ]   296274   2.355%   3.876% 
(     110,     170 ]  1214389   9.651%  13.527% ##
(     170,     250 ]  2629616  20.898%  34.425% ####
(     250,     380 ]  5245575  41.688%  76.113% ########
(     380,     580 ]  2333419  18.544%  94.658% ####
(     580,     870 ]   511452   4.065%  98.722% #
(     870,    1300 ]   140070   1.113%  99.836% 
(    1300,    1900 ]    16304   0.130%  99.965% 
(    1900,    2900 ]     2501   0.020%  99.985% 
(    2900,    4400 ]     1209   0.010%  99.995% 
(    4400,    6600 ]      115   0.001%  99.996% 
(    6600,    9900 ]        2   0.000%  99.996% 
(   14000,   22000 ]        1   0.000%  99.996% 
(   22000,   33000 ]        5   0.000%  99.996% 
(   33000,   50000 ]       14   0.000%  99.996% 
(   50000,   75000 ]      108   0.001%  99.997% 
(   75000,  110000 ]        5   0.000%  99.997% 
(  110000,  170000 ]        5   0.000%  99.997% 
(  170000,  250000 ]        7   0.000%  99.997% 
(  250000,  380000 ]        8   0.000%  99.997% 
(  380000,  570000 ]       14   0.000%  99.997% 
(  570000,  860000 ]       20   0.000%  99.997% 
(  860000, 1200000 ]       31   0.000%  99.997% 
( 1200000, 1900000 ]       73   0.001%  99.998% 
( 1900000, 2900000 ]      130   0.001%  99.999% 
( 2900000, 4300000 ]       72   0.001%  99.999% 
( 4300000, 6500000 ]       51   0.000% 100.000% 
( 6500000, 9800000 ]       17   0.000% 100.000% 
( 9800000, 14000000 ]        3   0.000% 100.000% 

Microseconds per write:
Count: 50331640 Average: 9.8877  StdDev: 3825.66
Min: 0  Median: 4.5666  Max: 6198612
Percentiles: P50: 4.57 P75: 5.76 P99: 13.55 P99.9: 408.89 P99.99: 863.43
------------------------------------------------------
[       0,       1 ]  7355663  14.614%  14.614% ###
(       1,       2 ]  7569306  15.039%  29.653% ###
(       2,       3 ]  1857042   3.690%  33.343% #
(       3,       4 ]  2424690   4.817%  38.160% #
(       4,       6 ] 21033613  41.790%  79.950% ########
(       6,      10 ]  8785194  17.455%  97.405% ###
(      10,      15 ]  1131065   2.247%  99.652% 
(      15,      22 ]    92766   0.184%  99.836% 
(      22,      34 ]    24542   0.049%  99.885% 
(      34,      51 ]     4508   0.009%  99.894% 
(      51,      76 ]      533   0.001%  99.895% 
(      76,     110 ]      444   0.001%  99.896% 
(     110,     170 ]      267   0.001%  99.897% 
(     170,     250 ]      578   0.001%  99.898% 
(     250,     380 ]      328   0.001%  99.898% 
(     380,     580 ]     5327   0.011%  99.909% 
(     580,     870 ]    41685   0.083%  99.992% 
(     870,    1300 ]     2008   0.004%  99.996% 
(    1300,    1900 ]     1107   0.002%  99.998% 
(    1900,    2900 ]      392   0.001%  99.999% 
(    2900,    4400 ]      399   0.001% 100.000% 
(    4400,    6600 ]       86   0.000% 100.000% 
(    6600,    9900 ]        5   0.000% 100.000% 
(   75000,  110000 ]        1   0.000% 100.000% 
(  110000,  170000 ]        6   0.000% 100.000% 
(  170000,  250000 ]        5   0.000% 100.000% 
(  250000,  380000 ]        3   0.000% 100.000% 
(  570000,  860000 ]        7   0.000% 100.000% 
(  860000, 1200000 ]        1   0.000% 100.000% 
( 1200000, 1900000 ]       11   0.000% 100.000% 
( 1900000, 2900000 ]       24   0.000% 100.000% 
( 2900000, 4300000 ]       24   0.000% 100.000% 
( 4300000, 6500000 ]       10   0.000% 100.000% 

STATISTICS:
rocksdb.block.cache.miss COUNT : 515754363
rocksdb.block.cache.hit COUNT : 20409126
rocksdb.block.cache.add COUNT : 47919154
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
rocksdb.block.cache.data.miss COUNT : 515754363
rocksdb.block.cache.data.hit COUNT : 20409126
rocksdb.block.cache.data.add COUNT : 47919154
rocksdb.block.cache.data.bytes.insert COUNT : 204712101520
rocksdb.block.cache.bytes.read COUNT : 87188440288
rocksdb.block.cache.bytes.write COUNT : 204712101520
rocksdb.bloom.filter.useful COUNT : 0
rocksdb.bloom.filter.full.positive COUNT : 0
rocksdb.bloom.filter.full.true.positive COUNT : 0
rocksdb.bloom.filter.micros COUNT : 0
rocksdb.persistent.cache.hit COUNT : 0
rocksdb.persistent.cache.miss COUNT : 0
rocksdb.sim.block.cache.hit COUNT : 0
rocksdb.sim.block.cache.miss COUNT : 0
rocksdb.memtable.hit COUNT : 3436
rocksdb.memtable.miss COUNT : 12579484
rocksdb.l0.hit COUNT : 10210
rocksdb.l1.hit COUNT : 42252
rocksdb.l2andup.hit COUNT : 8714156
rocksdb.compaction.key.drop.new COUNT : 59999497
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
rocksdb.no.file.opens COUNT : 22314
rocksdb.no.file.errors COUNT : 0
rocksdb.l0.slowdown.micros COUNT : 0
rocksdb.memtable.compaction.micros COUNT : 0
rocksdb.l0.num.files.stall.micros COUNT : 0
rocksdb.stall.micros COUNT : 559010190
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
rocksdb.compact.read.bytes COUNT : 1144412722461
rocksdb.compact.write.bytes COUNT : 1126660764607
rocksdb.flush.write.bytes COUNT : 107999759991
rocksdb.compact.read.marked.bytes COUNT : 0
rocksdb.compact.read.periodic.bytes COUNT : 0
rocksdb.compact.read.ttl.bytes COUNT : 0
rocksdb.compact.write.marked.bytes COUNT : 0
rocksdb.compact.write.periodic.bytes COUNT : 0
rocksdb.compact.write.ttl.bytes COUNT : 0
rocksdb.number.direct.load.table.properties COUNT : 0
rocksdb.number.superversion_acquires COUNT : 3638
rocksdb.number.superversion_releases COUNT : 2620
rocksdb.number.superversion_cleanups COUNT : 2590
rocksdb.number.block.compressed COUNT : 504654196
rocksdb.number.block.decompressed COUNT : 515776658
rocksdb.number.block.not_compressed COUNT : 19
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
rocksdb.files.deleted.immediately COUNT : 23993
rocksdb.error.handler.bg.errro.count COUNT : 0
rocksdb.error.handler.bg.io.errro.count COUNT : 0
rocksdb.error.handler.bg.retryable.io.errro.count COUNT : 0
rocksdb.error.handler.autoresume.count COUNT : 0
rocksdb.error.handler.autoresume.retry.total.count COUNT : 0
rocksdb.error.handler.autoresume.success.count COUNT : 0
rocksdb.memtable.payload.bytes.at.flush COUNT : 184583783072
rocksdb.memtable.garbage.bytes.at.flush COUNT : 45673936
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
rocksdb.non.last.level.read.bytes COUNT : 1262891992354
rocksdb.non.last.level.read.count COUNT : 515843619
rocksdb.block.checksum.compute.count COUNT : 515798991
rocksdb.multiget.coroutine.count COUNT : 0
rocksdb.db.get.micros P50 : 297.789106 P95 : 603.321674 P99 : 976.322987 P100 : 13108988.000000 COUNT : 12582920 SUM : 5154620326
rocksdb.db.write.micros P50 : 0.820845 P95 : 5.643635 P99 : 9.408052 P100 : 14181256.000000 COUNT : 176160760 SUM : 1719099935
rocksdb.compaction.times.micros P50 : 1468949.771689 P95 : 2812752.721617 P99 : 3474643.000000 P100 : 3474643.000000 COUNT : 3402 SUM : 5045351971
rocksdb.compaction.times.cpu_micros P50 : 714211.956522 P95 : 1557050.359712 P99 : 5668400.000000 P100 : 5726495.000000 COUNT : 3402 SUM : 2896876908
rocksdb.subcompaction.setup.times.micros P50 : 359.255319 P95 : 1164.857143 P99 : 1828.000000 P100 : 2136.000000 COUNT : 308 SUM : 138102
rocksdb.table.sync.micros P50 : 72922.960725 P95 : 169581.395349 P99 : 243654.700855 P100 : 508356.000000 COUNT : 2828 SUM : 244958927
rocksdb.compaction.outfile.sync.micros P50 : 109916.534181 P95 : 478679.333680 P99 : 555771.264966 P100 : 811503.000000 COUNT : 19486 SUM : 3079806163
rocksdb.wal.file.sync.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.manifest.file.sync.micros P50 : 80.801179 P95 : 242.246575 P99 : 807.820588 P100 : 12044.000000 COUNT : 6729 SUM : 840242
rocksdb.table.open.io.micros P50 : 1656.979232 P95 : 3683.276158 P99 : 5051.520833 P100 : 108547.000000 COUNT : 22314 SUM : 41439884
rocksdb.db.multiget.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.read.block.compaction.micros P50 : 0.834423 P95 : 1.990235 P99 : 30.642604 P100 : 134104.000000 COUNT : 467835209 SUM : 1811013613
rocksdb.read.block.get.micros P50 : 83.638381 P95 : 190.482996 P99 : 351.856404 P100 : 79557.000000 COUNT : 47941468 SUM : 3679770249
rocksdb.write.raw.block.micros P50 : 0.501661 P95 : 0.953156 P99 : 0.993289 P100 : 1060.000000 COUNT : 504698843 SUM : 159540731
rocksdb.l0.slowdown.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.memtable.compaction.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.files.stall.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.hard.rate.limit.delay.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.soft.rate.limit.delay.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.numfiles.in.singlecompaction P50 : 3.489152 P95 : 9.708615 P99 : 43.161319 P100 : 47.000000 COUNT : 4196 SUM : 21959
rocksdb.db.seek.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.db.write.stall P50 : 0.536231 P95 : 1082.976016 P99 : 2590.660163 P100 : 14181234.000000 COUNT : 2580973 SUM : 559084683
rocksdb.sst.read.micros P50 : 0.573223 P95 : 85.242487 P99 : 166.282978 P100 : 134025.000000 COUNT : 515843619 SUM : 5039831010
rocksdb.num.subcompactions.scheduled P50 : 5.313253 P95 : 8.000000 P99 : 8.000000 P100 : 8.000000 COUNT : 308 SUM : 1733
rocksdb.bytes.per.read P50 : 991.526666 P95 : 1024.000000 P99 : 1024.000000 P100 : 1024.000000 COUNT : 12582920 SUM : 8980535296
rocksdb.bytes.per.write P50 : 1056.000000 P95 : 1056.000000 P99 : 1056.000000 P100 : 1056.000000 COUNT : 176160760 SUM : 186025762560
rocksdb.bytes.per.multiget P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.bytes.compressed P50 : 3650.005984 P95 : 4325.059894 P99 : 4385.064686 P100 : 553914.000000 COUNT : 504654196 SUM : 2127121660731
rocksdb.bytes.decompressed P50 : 3650.006518 P95 : 4325.058669 P99 : 4385.063304 P100 : 553914.000000 COUNT : 515776658 SUM : 2173816888534
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
rocksdb.db.flush.micros P50 : 152195.540309 P95 : 246184.994861 P99 : 357081.481481 P100 : 10045218.000000 COUNT : 2828 SUM : 468831936
rocksdb.sst.batch.size P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.index.and.filter.blocks.read.per.level P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.data.blocks.read.per.level P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.sst.read.per.level P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.error.handler.autoresume.retry.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.async.read.bytes P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.poll.wait.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.prefetched.bytes.discarded P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 36827 SUM : 0
rocksdb.multiget.io.batch.size P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.level.read.per.multiget P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0

6936	26	176160760	12582920	0	546944	2402399	1694	
GetTotalBytesWritten :: 1997163352064
UserByteWritten : 1423650087746
FAR STAT :: WA_zc (mb) : 546944
@@~Zenfs Last Free percent freepercent 26 
SEQUENCE OVER SEQ_DIST_MAX : 5782SEQUENCE OVER SEQ_DIST_MAX : 5296SEQUENCE OVER SEQ_DIST_MAX : 5343zone size at ~ 1077
============================================================
WWP (MB) : 1477644, R_wp : 19
NEW WWP(MB) : 1477644
Runtime zone reset R_wp 19
ZONE FINISH VALID(MB) 0
ZONE FINISH WWP(MB) : 0
ZC IO Blocking time : 0
============================================================
[1] :: 302 ~ 302, 87 ms, 2 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[2] :: 303 ~ 303, 235 ms, 12 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[3] :: 310 ~ 310, 355 ms, 36 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[4] :: 311 ~ 311, 539 ms, 36 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[5] :: 311 ~ 312, 731 ms, 52 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[6] :: 313 ~ 314, 606 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[7] :: 322 ~ 322, 293 ms, 18 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[8] :: 328 ~ 329, 774 ms, 52 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[9] :: 329 ~ 329, 733 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[10] :: 329 ~ 330, 618 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[11] :: 352 ~ 353, 47 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[12] :: 354 ~ 354, 100 ms, 2 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[13] :: 354 ~ 355, 854 ms, 60 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[14] :: 355 ~ 356, 850 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[15] :: 356 ~ 357, 577 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[16] :: 360 ~ 360, 54 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[17] :: 363 ~ 364, 269 ms, 14 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[18] :: 364 ~ 365, 725 ms, 49 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[19] :: 371 ~ 371, 474 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[20] :: 373 ~ 373, 474 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[21] :: 373 ~ 374, 955 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[22] :: 380 ~ 380, 75 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.736268
[23] :: 381 ~ 382, 544 ms, 77 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[24] :: 382 ~ 383, 1445 ms, 101 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[25] :: 383 ~ 385, 1152 ms, 113 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[26] :: 385 ~ 385, 550 ms, 114 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[27] :: 391 ~ 391, 62 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.500000
[28] :: 391 ~ 392, 898 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[29] :: 392 ~ 393, 1254 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[30] :: 393 ~ 394, 639 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[31] :: 394 ~ 395, 497 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[32] :: 395 ~ 395, 525 ms, 131 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[33] :: 395 ~ 396, 747 ms, 104 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[34] :: 397 ~ 397, 368 ms, 50 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[35] :: 402 ~ 403, 103 ms, 3 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[36] :: 403 ~ 404, 1127 ms, 77 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[37] :: 404 ~ 405, 1269 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[38] :: 405 ~ 406, 591 ms, 136 (MB), Reclaimed Zone : 1, ZLV: 0.927007
[39] :: 406 ~ 406, 568 ms, 130 (MB), Reclaimed Zone : 1, ZLV: 0.797850
[40] :: 406 ~ 408, 1235 ms, 168 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[41] :: 413 ~ 414, 992 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[42] :: 414 ~ 414, 563 ms, 49 (MB), Reclaimed Zone : 1, ZLV: 0.436567
[43] :: 414 ~ 415, 1015 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[44] :: 415 ~ 415, 333 ms, 75 (MB), Reclaimed Zone : 1, ZLV: 0.583482
[45] :: 416 ~ 416, 616 ms, 71 (MB), Reclaimed Zone : 1, ZLV: 0.517956
[46] :: 417 ~ 417, 585 ms, 71 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[47] :: 422 ~ 423, 438 ms, 86 (MB), Reclaimed Zone : 1, ZLV: 0.792284
[48] :: 423 ~ 425, 1606 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[49] :: 425 ~ 426, 1135 ms, 143 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[50] :: 426 ~ 426, 439 ms, 105 (MB), Reclaimed Zone : 1, ZLV: 0.750859
[51] :: 426 ~ 427, 647 ms, 162 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[52] :: 427 ~ 428, 664 ms, 169 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[53] :: 428 ~ 428, 717 ms, 175 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[54] :: 429 ~ 430, 1256 ms, 177 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[55] :: 430 ~ 431, 719 ms, 179 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[56] :: 431 ~ 432, 696 ms, 179 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[57] :: 437 ~ 438, 915 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[58] :: 438 ~ 440, 1340 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[59] :: 440 ~ 440, 322 ms, 86 (MB), Reclaimed Zone : 1, ZLV: 0.880000
[60] :: 440 ~ 440, 456 ms, 110 (MB), Reclaimed Zone : 1, ZLV: 0.804811
[61] :: 440 ~ 441, 308 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.401262
[62] :: 441 ~ 441, 443 ms, 103 (MB), Reclaimed Zone : 1, ZLV: 0.646585
[63] :: 443 ~ 443, 295 ms, 22 (MB), Reclaimed Zone : 1, ZLV: 0.656368
[64] :: 445 ~ 445, 125 ms, 13 (MB), Reclaimed Zone : 1, ZLV: 0.338170
[65] :: 448 ~ 450, 1683 ms, 127 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[66] :: 450 ~ 451, 922 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[67] :: 451 ~ 451, 519 ms, 129 (MB), Reclaimed Zone : 1, ZLV: 0.993028
[68] :: 451 ~ 452, 879 ms, 108 (MB), Reclaimed Zone : 1, ZLV: 0.671656
[69] :: 455 ~ 456, 233 ms, 18 (MB), Reclaimed Zone : 1, ZLV: 0.440276
[70] :: 456 ~ 456, 298 ms, 37 (MB), Reclaimed Zone : 1, ZLV: 0.627763
[71] :: 458 ~ 459, 790 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[72] :: 459 ~ 461, 2385 ms, 185 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[73] :: 461 ~ 462, 408 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.455427
[74] :: 462 ~ 462, 262 ms, 58 (MB), Reclaimed Zone : 1, ZLV: 0.291619
[75] :: 462 ~ 463, 555 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.642454
[76] :: 463 ~ 463, 305 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.294975
[77] :: 463 ~ 464, 778 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[78] :: 464 ~ 464, 838 ms, 202 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[79] :: 466 ~ 467, 415 ms, 46 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[80] :: 467 ~ 468, 1065 ms, 161 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[81] :: 468 ~ 470, 1146 ms, 157 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[82] :: 472 ~ 472, 310 ms, 30 (MB), Reclaimed Zone : 1, ZLV: 0.315338
[83] :: 473 ~ 474, 518 ms, 82 (MB), Reclaimed Zone : 1, ZLV: 0.537313
[84] :: 474 ~ 476, 1670 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[85] :: 476 ~ 477, 890 ms, 162 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[86] :: 477 ~ 477, 283 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.341456
[87] :: 477 ~ 478, 809 ms, 113 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[88] :: 478 ~ 478, 334 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.308303
[89] :: 484 ~ 485, 934 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.310897
[90] :: 485 ~ 487, 1745 ms, 208 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[91] :: 487 ~ 487, 885 ms, 224 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[92] :: 492 ~ 492, 56 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[93] :: 493 ~ 493, 59 ms, 2 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[94] :: 494 ~ 495, 817 ms, 55 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[95] :: 495 ~ 497, 1668 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[96] :: 497 ~ 497, 424 ms, 81 (MB), Reclaimed Zone : 1, ZLV: 0.479915
[97] :: 497 ~ 498, 723 ms, 182 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[98] :: 499 ~ 500, 1272 ms, 226 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[99] :: 505 ~ 506, 647 ms, 43 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[100] :: 506 ~ 507, 1182 ms, 109 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[101] :: 507 ~ 508, 1305 ms, 227 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[102] :: 508 ~ 509, 901 ms, 228 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[103] :: 510 ~ 511, 1362 ms, 188 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[104] :: 511 ~ 512, 1018 ms, 247 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[105] :: 512 ~ 513, 953 ms, 251 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[106] :: 519 ~ 521, 1651 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.840685
[107] :: 521 ~ 521, 267 ms, 20 (MB), Reclaimed Zone : 1, ZLV: 0.123461
[108] :: 521 ~ 522, 1024 ms, 173 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[109] :: 522 ~ 523, 308 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.377072
[110] :: 523 ~ 523, 398 ms, 88 (MB), Reclaimed Zone : 1, ZLV: 0.531565
[111] :: 523 ~ 524, 1127 ms, 152 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[112] :: 524 ~ 526, 1018 ms, 219 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[113] :: 532 ~ 534, 1743 ms, 149 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[114] :: 534 ~ 535, 752 ms, 85 (MB), Reclaimed Zone : 1, ZLV: 0.585172
[115] :: 535 ~ 535, 395 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.513533
[116] :: 535 ~ 536, 624 ms, 154 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[117] :: 536 ~ 537, 925 ms, 126 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[118] :: 537 ~ 538, 966 ms, 194 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[119] :: 544 ~ 544, 494 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[120] :: 544 ~ 545, 759 ms, 175 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[121] :: 545 ~ 546, 1053 ms, 250 (MB), Reclaimed Zone : 1, ZLV: 0.980237
[122] :: 547 ~ 550, 2908 ms, 258 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[123] :: 550 ~ 550, 778 ms, 195 (MB), Reclaimed Zone : 1, ZLV: 0.671717
[124] :: 550 ~ 551, 649 ms, 161 (MB), Reclaimed Zone : 1, ZLV: 0.499248
[125] :: 551 ~ 552, 697 ms, 173 (MB), Reclaimed Zone : 1, ZLV: 0.541386
[126] :: 559 ~ 561, 1632 ms, 129 (MB), Reclaimed Zone : 1, ZLV: 0.682322
[127] :: 561 ~ 562, 1531 ms, 270 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[128] :: 562 ~ 563, 306 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.363082
[129] :: 563 ~ 563, 614 ms, 155 (MB), Reclaimed Zone : 1, ZLV: 0.519573
[130] :: 564 ~ 566, 1273 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[131] :: 566 ~ 567, 1085 ms, 290 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[132] :: 574 ~ 574, 86 ms, 3 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[133] :: 574 ~ 576, 2098 ms, 163 (MB), Reclaimed Zone : 1, ZLV: 0.633865
[134] :: 576 ~ 577, 897 ms, 108 (MB), Reclaimed Zone : 1, ZLV: 0.419493
[135] :: 577 ~ 577, 460 ms, 109 (MB), Reclaimed Zone : 1, ZLV: 0.460091
[136] :: 577 ~ 578, 534 ms, 135 (MB), Reclaimed Zone : 1, ZLV: 0.510857
[137] :: 578 ~ 579, 1033 ms, 256 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[138] :: 585 ~ 586, 910 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.663561
[139] :: 586 ~ 587, 470 ms, 100 (MB), Reclaimed Zone : 1, ZLV: 0.482961
[140] :: 587 ~ 590, 2488 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[141] :: 590 ~ 590, 737 ms, 151 (MB), Reclaimed Zone : 1, ZLV: 0.620202
[142] :: 590 ~ 592, 1081 ms, 259 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[143] :: 592 ~ 593, 1137 ms, 286 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[144] :: 594 ~ 595, 734 ms, 81 (MB), Reclaimed Zone : 1, ZLV: 0.792683
[145] :: 595 ~ 596, 1049 ms, 177 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[146] :: 600 ~ 600, 539 ms, 83 (MB), Reclaimed Zone : 1, ZLV: 0.961115
[147] :: 601 ~ 602, 1053 ms, 173 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[148] :: 602 ~ 602, 770 ms, 188 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[149] :: 602 ~ 603, 721 ms, 177 (MB), Reclaimed Zone : 1, ZLV: 0.610335
[150] :: 603 ~ 606, 3056 ms, 291 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[151] :: 606 ~ 607, 586 ms, 151 (MB), Reclaimed Zone : 1, ZLV: 0.470134
[152] :: 607 ~ 607, 647 ms, 161 (MB), Reclaimed Zone : 1, ZLV: 0.426294
[153] :: 607 ~ 608, 807 ms, 205 (MB), Reclaimed Zone : 1, ZLV: 0.562114
[154] :: 609 ~ 610, 1747 ms, 281 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[155] :: 616 ~ 617, 1512 ms, 117 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[156] :: 617 ~ 618, 688 ms, 71 (MB), Reclaimed Zone : 1, ZLV: 0.358396
[157] :: 618 ~ 619, 924 ms, 183 (MB), Reclaimed Zone : 1, ZLV: 0.532652
[158] :: 619 ~ 620, 1145 ms, 302 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[159] :: 620 ~ 621, 1278 ms, 322 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[160] :: 622 ~ 623, 1389 ms, 216 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[161] :: 623 ~ 624, 1080 ms, 264 (MB), Reclaimed Zone : 1, ZLV: 0.997484
[162] :: 630 ~ 631, 457 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[163] :: 631 ~ 631, 458 ms, 93 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[164] :: 631 ~ 633, 1693 ms, 114 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[165] :: 633 ~ 635, 1374 ms, 215 (MB), Reclaimed Zone : 1, ZLV: 0.854963
[166] :: 635 ~ 635, 455 ms, 107 (MB), Reclaimed Zone : 1, ZLV: 0.354793
[167] :: 635 ~ 636, 973 ms, 264 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[168] :: 636 ~ 637, 1128 ms, 277 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[169] :: 637 ~ 638, 1213 ms, 314 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[170] :: 638 ~ 640, 1258 ms, 317 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[171] :: 640 ~ 640, 548 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.251083
[172] :: 640 ~ 642, 1602 ms, 327 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[173] :: 647 ~ 648, 1225 ms, 93 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[174] :: 648 ~ 649, 571 ms, 53 (MB), Reclaimed Zone : 1, ZLV: 0.295069
[175] :: 649 ~ 650, 698 ms, 82 (MB), Reclaimed Zone : 1, ZLV: 0.324656
[176] :: 650 ~ 650, 731 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.409550
[177] :: 651 ~ 653, 1667 ms, 292 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[178] :: 654 ~ 654, 383 ms, 48 (MB), Reclaimed Zone : 1, ZLV: 0.525842
[179] :: 658 ~ 659, 921 ms, 159 (MB), Reclaimed Zone : 1, ZLV: 0.915968
[180] :: 660 ~ 662, 2475 ms, 200 (MB), Reclaimed Zone : 1, ZLV: 0.683564
[181] :: 662 ~ 663, 298 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.301948
[182] :: 663 ~ 663, 514 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.323454
[183] :: 663 ~ 665, 1288 ms, 334 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[184] :: 672 ~ 672, 604 ms, 83 (MB), Reclaimed Zone : 1, ZLV: 0.417856
[185] :: 672 ~ 675, 2041 ms, 170 (MB), Reclaimed Zone : 1, ZLV: 0.464963
[186] :: 675 ~ 675, 479 ms, 43 (MB), Reclaimed Zone : 1, ZLV: 0.123776
[187] :: 675 ~ 676, 1447 ms, 326 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[188] :: 676 ~ 677, 882 ms, 232 (MB), Reclaimed Zone : 1, ZLV: 0.636473
[189] :: 677 ~ 679, 1367 ms, 345 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[190] :: 679 ~ 680, 1308 ms, 349 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[191] :: 680 ~ 681, 1396 ms, 366 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[192] :: 681 ~ 682, 976 ms, 255 (MB), Reclaimed Zone : 1, ZLV: 0.585586
[193] :: 683 ~ 684, 1223 ms, 167 (MB), Reclaimed Zone : 1, ZLV: 0.434806
[194] :: 690 ~ 690, 762 ms, 140 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[195] :: 690 ~ 691, 709 ms, 174 (MB), Reclaimed Zone : 1, ZLV: 0.475563
[196] :: 691 ~ 695, 3094 ms, 338 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[197] :: 695 ~ 696, 1417 ms, 356 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[198] :: 700 ~ 702, 1927 ms, 292 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[199] :: 702 ~ 704, 1281 ms, 312 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[200] :: 704 ~ 704, 590 ms, 142 (MB), Reclaimed Zone : 1, ZLV: 0.294677
[201] :: 706 ~ 707, 1200 ms, 241 (MB), Reclaimed Zone : 1, ZLV: 0.759161
[202] :: 707 ~ 708, 1175 ms, 307 (MB), Reclaimed Zone : 1, ZLV: 0.775052
[203] :: 709 ~ 710, 990 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.135204
[204] :: 710 ~ 712, 2533 ms, 384 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[205] :: 712 ~ 713, 1073 ms, 263 (MB), Reclaimed Zone : 1, ZLV: 0.670046
[206] :: 713 ~ 715, 1524 ms, 392 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[207] :: 715 ~ 716, 1542 ms, 394 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[208] :: 716 ~ 717, 686 ms, 160 (MB), Reclaimed Zone : 1, ZLV: 0.298975
[209] :: 717 ~ 719, 1954 ms, 325 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[210] :: 719 ~ 720, 751 ms, 195 (MB), Reclaimed Zone : 1, ZLV: 0.452348
[211] :: 721 ~ 721, 141 ms, 11 (MB), Reclaimed Zone : 1, ZLV: 0.319412
[212] :: 722 ~ 723, 448 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[213] :: 726 ~ 728, 2414 ms, 206 (MB), Reclaimed Zone : 1, ZLV: 0.736321
[214] :: 728 ~ 730, 1428 ms, 323 (MB), Reclaimed Zone : 1, ZLV: 0.971035
[215] :: 730 ~ 730, 545 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.323344
[216] :: 730 ~ 732, 1505 ms, 383 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[217] :: 732 ~ 733, 517 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.244468
[218] :: 733 ~ 734, 1636 ms, 284 (MB), Reclaimed Zone : 1, ZLV: 0.779249
[219] :: 734 ~ 736, 1482 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[220] :: 740 ~ 741, 271 ms, 33 (MB), Reclaimed Zone : 1, ZLV: 0.289450
[221] :: 741 ~ 742, 416 ms, 28 (MB), Reclaimed Zone : 1, ZLV: 0.237864
[222] :: 742 ~ 743, 1505 ms, 116 (MB), Reclaimed Zone : 1, ZLV: 0.644231
[223] :: 743 ~ 744, 780 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.118932
[224] :: 744 ~ 746, 1621 ms, 384 (MB), Reclaimed Zone : 1, ZLV: 0.953728
[225] :: 746 ~ 747, 1176 ms, 299 (MB), Reclaimed Zone : 1, ZLV: 0.662931
[226] :: 747 ~ 748, 1541 ms, 412 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[227] :: 748 ~ 750, 1607 ms, 425 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[228] :: 750 ~ 752, 1758 ms, 305 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[229] :: 758 ~ 759, 1306 ms, 235 (MB), Reclaimed Zone : 1, ZLV: 0.844163
[230] :: 759 ~ 760, 655 ms, 164 (MB), Reclaimed Zone : 1, ZLV: 0.378156
[231] :: 760 ~ 761, 841 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.340476
[232] :: 761 ~ 762, 1251 ms, 88 (MB), Reclaimed Zone : 1, ZLV: 0.317328
[233] :: 762 ~ 763, 1085 ms, 138 (MB), Reclaimed Zone : 1, ZLV: 0.254218
[234] :: 763 ~ 764, 306 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.283408
[235] :: 764 ~ 764, 807 ms, 216 (MB), Reclaimed Zone : 1, ZLV: 0.378646
[236] :: 764 ~ 766, 1567 ms, 400 (MB), Reclaimed Zone : 1, ZLV: 0.862478
[237] :: 766 ~ 768, 1705 ms, 462 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[238] :: 769 ~ 771, 1329 ms, 178 (MB), Reclaimed Zone : 1, ZLV: 0.486705
[239] :: 771 ~ 772, 1489 ms, 379 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[240] :: 777 ~ 778, 684 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[241] :: 778 ~ 781, 2877 ms, 280 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[242] :: 781 ~ 781, 549 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.443777
[243] :: 781 ~ 782, 833 ms, 214 (MB), Reclaimed Zone : 1, ZLV: 0.438401
[244] :: 782 ~ 784, 1646 ms, 405 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[245] :: 784 ~ 785, 1016 ms, 256 (MB), Reclaimed Zone : 1, ZLV: 0.482464
[246] :: 785 ~ 786, 928 ms, 248 (MB), Reclaimed Zone : 1, ZLV: 0.427339
[247] :: 786 ~ 787, 954 ms, 246 (MB), Reclaimed Zone : 1, ZLV: 0.399463
[248] :: 787 ~ 788, 1209 ms, 312 (MB), Reclaimed Zone : 1, ZLV: 0.529357
[249] :: 794 ~ 794, 97 ms, 6 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[250] :: 794 ~ 795, 880 ms, 127 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[251] :: 796 ~ 797, 881 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[252] :: 797 ~ 797, 762 ms, 166 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[253] :: 798 ~ 801, 2974 ms, 301 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[254] :: 801 ~ 801, 308 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.262521
[255] :: 801 ~ 801, 554 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.334455
[256] :: 802 ~ 803, 1129 ms, 279 (MB), Reclaimed Zone : 1, ZLV: 0.729483
[257] :: 803 ~ 804, 1139 ms, 281 (MB), Reclaimed Zone : 1, ZLV: 0.640997
[258] :: 804 ~ 805, 1602 ms, 408 (MB), Reclaimed Zone : 1, ZLV: 0.858728
[259] :: 806 ~ 808, 2073 ms, 435 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[260] :: 809 ~ 809, 350 ms, 43 (MB), Reclaimed Zone : 1, ZLV: 0.407824
[261] :: 815 ~ 816, 316 ms, 41 (MB), Reclaimed Zone : 1, ZLV: 0.333164
[262] :: 816 ~ 818, 1594 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.287915
[263] :: 818 ~ 820, 1767 ms, 297 (MB), Reclaimed Zone : 1, ZLV: 0.805944
[264] :: 820 ~ 821, 956 ms, 254 (MB), Reclaimed Zone : 1, ZLV: 0.538112
[265] :: 821 ~ 822, 1538 ms, 399 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[266] :: 822 ~ 823, 1269 ms, 331 (MB), Reclaimed Zone : 1, ZLV: 0.697046
[267] :: 823 ~ 824, 973 ms, 264 (MB), Reclaimed Zone : 1, ZLV: 0.428258
[268] :: 824 ~ 826, 1764 ms, 469 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[269] :: 826 ~ 829, 2441 ms, 437 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[270] :: 829 ~ 831, 1688 ms, 459 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[271] :: 831 ~ 832, 594 ms, 82 (MB), Reclaimed Zone : 1, ZLV: 0.287149
[272] :: 836 ~ 838, 2579 ms, 482 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[273] :: 838 ~ 840, 1760 ms, 311 (MB), Reclaimed Zone : 1, ZLV: 0.712478
[274] :: 840 ~ 841, 1087 ms, 272 (MB), Reclaimed Zone : 1, ZLV: 0.423223
[275] :: 843 ~ 844, 1798 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.344753
[276] :: 844 ~ 846, 1175 ms, 158 (MB), Reclaimed Zone : 1, ZLV: 0.368466
[277] :: 846 ~ 847, 1746 ms, 468 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[278] :: 847 ~ 849, 1736 ms, 445 (MB), Reclaimed Zone : 1, ZLV: 0.912356
[279] :: 849 ~ 851, 1786 ms, 493 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[280] :: 851 ~ 854, 2682 ms, 485 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[281] :: 854 ~ 856, 1750 ms, 452 (MB), Reclaimed Zone : 1, ZLV: 0.858079
[282] :: 856 ~ 858, 2008 ms, 507 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[283] :: 863 ~ 864, 399 ms, 50 (MB), Reclaimed Zone : 1, ZLV: 0.378772
[284] :: 864 ~ 865, 1322 ms, 296 (MB), Reclaimed Zone : 1, ZLV: 0.651917
[285] :: 866 ~ 867, 1901 ms, 132 (MB), Reclaimed Zone : 1, ZLV: 0.586449
[286] :: 867 ~ 869, 1582 ms, 287 (MB), Reclaimed Zone : 1, ZLV: 0.610756
[287] :: 869 ~ 870, 739 ms, 183 (MB), Reclaimed Zone : 1, ZLV: 0.523004
[288] :: 870 ~ 870, 671 ms, 162 (MB), Reclaimed Zone : 1, ZLV: 0.446370
[289] :: 870 ~ 871, 864 ms, 222 (MB), Reclaimed Zone : 1, ZLV: 0.532043
[290] :: 871 ~ 872, 773 ms, 189 (MB), Reclaimed Zone : 1, ZLV: 0.386866
[291] :: 872 ~ 874, 1479 ms, 389 (MB), Reclaimed Zone : 1, ZLV: 0.896065
[292] :: 874 ~ 875, 936 ms, 247 (MB), Reclaimed Zone : 1, ZLV: 0.419156
[293] :: 875 ~ 875, 50 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.634256
[294] :: 879 ~ 879, 610 ms, 82 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[295] :: 880 ~ 880, 341 ms, 36 (MB), Reclaimed Zone : 1, ZLV: 0.260000
[296] :: 882 ~ 883, 1113 ms, 173 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[297] :: 883 ~ 885, 1385 ms, 100 (MB), Reclaimed Zone : 1, ZLV: 0.290659
[298] :: 885 ~ 886, 974 ms, 82 (MB), Reclaimed Zone : 1, ZLV: 0.181321
[299] :: 886 ~ 887, 1635 ms, 378 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[300] :: 887 ~ 889, 1656 ms, 403 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[301] :: 890 ~ 892, 2187 ms, 381 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[302] :: 892 ~ 893, 1242 ms, 320 (MB), Reclaimed Zone : 1, ZLV: 0.660240
[303] :: 893 ~ 895, 1690 ms, 449 (MB), Reclaimed Zone : 1, ZLV: 0.971491
[304] :: 900 ~ 901, 1030 ms, 228 (MB), Reclaimed Zone : 1, ZLV: 0.889478
[305] :: 902 ~ 903, 967 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.387324
[306] :: 903 ~ 904, 1703 ms, 419 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[307] :: 904 ~ 905, 536 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.208138
[308] :: 905 ~ 907, 1722 ms, 120 (MB), Reclaimed Zone : 1, ZLV: 0.350290
[309] :: 907 ~ 909, 2434 ms, 457 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[310] :: 909 ~ 910, 713 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.453978
[311] :: 910 ~ 912, 1753 ms, 470 (MB), Reclaimed Zone : 1, ZLV: 0.935540
[312] :: 916 ~ 917, 1117 ms, 162 (MB), Reclaimed Zone : 1, ZLV: 0.496312
[313] :: 917 ~ 918, 465 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.112862
[314] :: 918 ~ 921, 2758 ms, 462 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[315] :: 921 ~ 922, 1749 ms, 468 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[316] :: 922 ~ 924, 1938 ms, 482 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[317] :: 925 ~ 926, 1524 ms, 284 (MB), Reclaimed Zone : 1, ZLV: 0.595920
[318] :: 926 ~ 928, 1405 ms, 354 (MB), Reclaimed Zone : 1, ZLV: 0.698814
[319] :: 928 ~ 928, 553 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.165888
[320] :: 928 ~ 931, 2114 ms, 152 (MB), Reclaimed Zone : 1, ZLV: 0.255223
[321] :: 931 ~ 933, 2096 ms, 460 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[322] :: 934 ~ 935, 1662 ms, 319 (MB), Reclaimed Zone : 1, ZLV: 0.556851
[323] :: 935 ~ 936, 899 ms, 223 (MB), Reclaimed Zone : 1, ZLV: 0.318325
[324] :: 937 ~ 937, 567 ms, 73 (MB), Reclaimed Zone : 1, ZLV: 0.257060
[325] :: 937 ~ 939, 1456 ms, 246 (MB), Reclaimed Zone : 1, ZLV: 0.357524
[326] :: 944 ~ 945, 1087 ms, 85 (MB), Reclaimed Zone : 1, ZLV: 0.348072
[327] :: 945 ~ 946, 1417 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.330144
[328] :: 946 ~ 947, 1035 ms, 248 (MB), Reclaimed Zone : 1, ZLV: 0.526477
[329] :: 947 ~ 949, 1919 ms, 489 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[330] :: 949 ~ 952, 2196 ms, 542 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[331] :: 952 ~ 953, 1406 ms, 236 (MB), Reclaimed Zone : 1, ZLV: 0.471366
[332] :: 953 ~ 955, 1592 ms, 394 (MB), Reclaimed Zone : 1, ZLV: 0.698621
[333] :: 955 ~ 956, 634 ms, 76 (MB), Reclaimed Zone : 1, ZLV: 0.910196
[334] :: 956 ~ 958, 1332 ms, 207 (MB), Reclaimed Zone : 1, ZLV: 0.599078
[335] :: 959 ~ 961, 2025 ms, 335 (MB), Reclaimed Zone : 1, ZLV: 0.855282
[336] :: 963 ~ 966, 2247 ms, 467 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[337] :: 966 ~ 968, 1940 ms, 508 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[338] :: 968 ~ 969, 1299 ms, 227 (MB), Reclaimed Zone : 1, ZLV: 0.328236
[339] :: 969 ~ 970, 828 ms, 192 (MB), Reclaimed Zone : 1, ZLV: 0.242606
[340] :: 970 ~ 972, 1947 ms, 531 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[341] :: 972 ~ 973, 567 ms, 47 (MB), Reclaimed Zone : 1, ZLV: 0.229167
[342] :: 973 ~ 974, 1756 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.247619
[343] :: 974 ~ 975, 531 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.143824
[344] :: 975 ~ 976, 1189 ms, 298 (MB), Reclaimed Zone : 1, ZLV: 0.388678
[345] :: 976 ~ 978, 2131 ms, 547 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[346] :: 983 ~ 983, 153 ms, 17 (MB), Reclaimed Zone : 1, ZLV: 0.117988
[347] :: 984 ~ 986, 2766 ms, 517 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[348] :: 987 ~ 988, 1704 ms, 306 (MB), Reclaimed Zone : 1, ZLV: 0.491031
[349] :: 988 ~ 989, 792 ms, 203 (MB), Reclaimed Zone : 1, ZLV: 0.254549
[350] :: 989 ~ 990, 1004 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.334964
[351] :: 990 ~ 992, 2068 ms, 548 (MB), Reclaimed Zone : 1, ZLV: 0.949731
[352] :: 992 ~ 996, 3073 ms, 297 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[353] :: 996 ~ 996, 537 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.461014
[354] :: 996 ~ 997, 1232 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.495072
[355] :: 997 ~ 999, 1990 ms, 511 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[356] :: 1003 ~ 1004, 829 ms, 121 (MB), Reclaimed Zone : 1, ZLV: 0.287064
[357] :: 1005 ~ 1008, 2601 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[358] :: 1008 ~ 1009, 1130 ms, 158 (MB), Reclaimed Zone : 1, ZLV: 0.245847
[359] :: 1009 ~ 1011, 2139 ms, 468 (MB), Reclaimed Zone : 1, ZLV: 0.840845
[360] :: 1011 ~ 1013, 2019 ms, 515 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[361] :: 1014 ~ 1017, 3972 ms, 509 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[362] :: 1017 ~ 1018, 805 ms, 194 (MB), Reclaimed Zone : 1, ZLV: 0.352994
[363] :: 1018 ~ 1020, 1253 ms, 318 (MB), Reclaimed Zone : 1, ZLV: 0.481488
[364] :: 1020 ~ 1022, 2208 ms, 586 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[365] :: 1022 ~ 1024, 1841 ms, 345 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[366] :: 1024 ~ 1026, 1965 ms, 272 (MB), Reclaimed Zone : 1, ZLV: 0.663433
[367] :: 1026 ~ 1026, 7 ms, 2 (MB), Reclaimed Zone : 1, ZLV: 0.051282
[368] :: 1026 ~ 1028, 1922 ms, 486 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[369] :: 1031 ~ 1033, 2522 ms, 574 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[370] :: 1034 ~ 1036, 2147 ms, 287 (MB), Reclaimed Zone : 1, ZLV: 0.550885
[371] :: 1036 ~ 1038, 2480 ms, 591 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[372] :: 1038 ~ 1041, 2269 ms, 591 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[373] :: 1041 ~ 1043, 2208 ms, 466 (MB), Reclaimed Zone : 1, ZLV: 0.812067
[374] :: 1043 ~ 1044, 746 ms, 192 (MB), Reclaimed Zone : 1, ZLV: 0.190367
[375] :: 1044 ~ 1046, 2613 ms, 596 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[376] :: 1047 ~ 1049, 2446 ms, 602 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[377] :: 1049 ~ 1050, 1416 ms, 204 (MB), Reclaimed Zone : 1, ZLV: 0.417396
[378] :: 1050 ~ 1052, 1027 ms, 253 (MB), Reclaimed Zone : 1, ZLV: 0.288669
[379] :: 1053 ~ 1057, 3977 ms, 560 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[380] :: 1057 ~ 1058, 780 ms, 205 (MB), Reclaimed Zone : 1, ZLV: 0.242919
[381] :: 1058 ~ 1059, 1644 ms, 440 (MB), Reclaimed Zone : 1, ZLV: 0.642027
[382] :: 1061 ~ 1063, 2097 ms, 477 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[383] :: 1063 ~ 1064, 1445 ms, 379 (MB), Reclaimed Zone : 1, ZLV: 0.583872
[384] :: 1068 ~ 1070, 1966 ms, 382 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[385] :: 1070 ~ 1072, 1854 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.216981
[386] :: 1072 ~ 1074, 1286 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.265330
[387] :: 1074 ~ 1075, 968 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.420869
[388] :: 1075 ~ 1076, 1189 ms, 295 (MB), Reclaimed Zone : 1, ZLV: 0.439799
[389] :: 1076 ~ 1078, 2066 ms, 545 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[390] :: 1078 ~ 1080, 2454 ms, 583 (MB), Reclaimed Zone : 1, ZLV: 0.960295
[391] :: 1081 ~ 1083, 1988 ms, 366 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[392] :: 1083 ~ 1083, 150 ms, 10 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[393] :: 1083 ~ 1084, 294 ms, 35 (MB), Reclaimed Zone : 1, ZLV: 0.400269
[394] :: 1085 ~ 1086, 499 ms, 80 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[395] :: 1089 ~ 1091, 2239 ms, 480 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[396] :: 1091 ~ 1092, 1172 ms, 302 (MB), Reclaimed Zone : 1, ZLV: 0.427574
[397] :: 1092 ~ 1095, 2295 ms, 553 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[398] :: 1095 ~ 1096, 1663 ms, 271 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[399] :: 1096 ~ 1097, 539 ms, 129 (MB), Reclaimed Zone : 1, ZLV: 0.423990
[400] :: 1097 ~ 1097, 299 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.176288
[401] :: 1098 ~ 1102, 4026 ms, 537 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[402] :: 1102 ~ 1102, 457 ms, 115 (MB), Reclaimed Zone : 1, ZLV: 0.294717
[403] :: 1102 ~ 1103, 470 ms, 108 (MB), Reclaimed Zone : 1, ZLV: 0.247165
[404] :: 1103 ~ 1104, 972 ms, 239 (MB), Reclaimed Zone : 1, ZLV: 0.412266
[405] :: 1104 ~ 1105, 1389 ms, 369 (MB), Reclaimed Zone : 1, ZLV: 0.602271
[406] :: 1105 ~ 1107, 1882 ms, 350 (MB), Reclaimed Zone : 1, ZLV: 0.454468
[407] :: 1115 ~ 1115, 538 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.160214
[408] :: 1115 ~ 1117, 1306 ms, 305 (MB), Reclaimed Zone : 1, ZLV: 0.427760
[409] :: 1117 ~ 1121, 3980 ms, 526 (MB), Reclaimed Zone : 1, ZLV: 0.894398
[410] :: 1121 ~ 1122, 1138 ms, 282 (MB), Reclaimed Zone : 1, ZLV: 0.452182
[411] :: 1122 ~ 1123, 1330 ms, 345 (MB), Reclaimed Zone : 1, ZLV: 0.581431
[412] :: 1123 ~ 1125, 2201 ms, 564 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[413] :: 1125 ~ 1127, 1491 ms, 375 (MB), Reclaimed Zone : 1, ZLV: 0.464406
[414] :: 1127 ~ 1129, 2120 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 0.923759
[415] :: 1129 ~ 1132, 2190 ms, 412 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[416] :: 1132 ~ 1134, 2202 ms, 529 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[417] :: 1134 ~ 1136, 2366 ms, 599 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[418] :: 1137 ~ 1137, 117 ms, 9 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[419] :: 1139 ~ 1142, 2587 ms, 563 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[420] :: 1143 ~ 1145, 2199 ms, 373 (MB), Reclaimed Zone : 1, ZLV: 0.512334
[421] :: 1145 ~ 1147, 2349 ms, 600 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[422] :: 1149 ~ 1151, 2927 ms, 560 (MB), Reclaimed Zone : 1, ZLV: 0.813594
[423] :: 1152 ~ 1152, 943 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.066847
[424] :: 1153 ~ 1155, 2945 ms, 418 (MB), Reclaimed Zone : 1, ZLV: 0.651016
[425] :: 1155 ~ 1156, 1011 ms, 245 (MB), Reclaimed Zone : 1, ZLV: 0.415398
[426] :: 1156 ~ 1158, 1927 ms, 495 (MB), Reclaimed Zone : 1, ZLV: 0.659276
[427] :: 1158 ~ 1161, 2378 ms, 619 (MB), Reclaimed Zone : 1, ZLV: 0.998425
[428] :: 1161 ~ 1163, 2415 ms, 621 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[429] :: 1163 ~ 1166, 2530 ms, 640 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[430] :: 1167 ~ 1170, 3170 ms, 652 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[431] :: 1175 ~ 1179, 3493 ms, 440 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[432] :: 1179 ~ 1181, 1557 ms, 400 (MB), Reclaimed Zone : 1, ZLV: 0.886442
[433] :: 1181 ~ 1181, 925 ms, 229 (MB), Reclaimed Zone : 1, ZLV: 0.362564
[434] :: 1181 ~ 1182, 1043 ms, 266 (MB), Reclaimed Zone : 1, ZLV: 0.335231
[435] :: 1182 ~ 1184, 1245 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.412148
[436] :: 1184 ~ 1185, 1656 ms, 434 (MB), Reclaimed Zone : 1, ZLV: 0.584323
[437] :: 1186 ~ 1187, 1490 ms, 240 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[438] :: 1187 ~ 1189, 2162 ms, 582 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[439] :: 1189 ~ 1191, 1518 ms, 390 (MB), Reclaimed Zone : 1, ZLV: 0.475037
[440] :: 1191 ~ 1193, 1536 ms, 205 (MB), Reclaimed Zone : 1, ZLV: 0.563052
[441] :: 1193 ~ 1194, 1056 ms, 206 (MB), Reclaimed Zone : 1, ZLV: 0.265791
[442] :: 1195 ~ 1197, 1858 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.343110
[443] :: 1197 ~ 1199, 2191 ms, 564 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[444] :: 1199 ~ 1202, 2398 ms, 461 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[445] :: 1202 ~ 1202, 525 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.092593
[446] :: 1207 ~ 1209, 2361 ms, 189 (MB), Reclaimed Zone : 1, ZLV: 0.280084
[447] :: 1209 ~ 1210, 1041 ms, 245 (MB), Reclaimed Zone : 1, ZLV: 0.388228
[448] :: 1210 ~ 1211, 1221 ms, 310 (MB), Reclaimed Zone : 1, ZLV: 0.462274
[449] :: 1211 ~ 1213, 2041 ms, 529 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[450] :: 1213 ~ 1215, 2107 ms, 539 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[451] :: 1215 ~ 1217, 1252 ms, 320 (MB), Reclaimed Zone : 1, ZLV: 0.401149
[452] :: 1217 ~ 1218, 1232 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.366963
[453] :: 1218 ~ 1221, 2942 ms, 578 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[454] :: 1222 ~ 1224, 2406 ms, 368 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[455] :: 1229 ~ 1230, 1065 ms, 196 (MB), Reclaimed Zone : 1, ZLV: 0.655702
[456] :: 1230 ~ 1230, 631 ms, 157 (MB), Reclaimed Zone : 1, ZLV: 0.399198
[457] :: 1230 ~ 1233, 2285 ms, 590 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[458] :: 1233 ~ 1237, 4216 ms, 600 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[459] :: 1237 ~ 1238, 501 ms, 129 (MB), Reclaimed Zone : 1, ZLV: 0.203671
[460] :: 1238 ~ 1238, 453 ms, 105 (MB), Reclaimed Zone : 1, ZLV: 0.151118
[461] :: 1238 ~ 1239, 1210 ms, 334 (MB), Reclaimed Zone : 1, ZLV: 0.390134
[462] :: 1239 ~ 1242, 2304 ms, 600 (MB), Reclaimed Zone : 1, ZLV: 0.971947
[463] :: 1242 ~ 1244, 2386 ms, 592 (MB), Reclaimed Zone : 1, ZLV: 0.905000
[464] :: 1244 ~ 1247, 2071 ms, 378 (MB), Reclaimed Zone : 1, ZLV: 0.664865
[465] :: 1247 ~ 1249, 2077 ms, 550 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[466] :: 1249 ~ 1251, 2348 ms, 578 (MB), Reclaimed Zone : 1, ZLV: 0.907412
[467] :: 1251 ~ 1254, 2689 ms, 565 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[468] :: 1257 ~ 1261, 3445 ms, 576 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[469] :: 1261 ~ 1262, 1130 ms, 287 (MB), Reclaimed Zone : 1, ZLV: 0.273589
[470] :: 1263 ~ 1264, 1154 ms, 234 (MB), Reclaimed Zone : 1, ZLV: 0.580458
[471] :: 1264 ~ 1265, 840 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.349282
[472] :: 1265 ~ 1266, 944 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.272727
[473] :: 1266 ~ 1268, 1782 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.336364
[474] :: 1268 ~ 1269, 1249 ms, 318 (MB), Reclaimed Zone : 1, ZLV: 0.373579
[475] :: 1269 ~ 1270, 1161 ms, 301 (MB), Reclaimed Zone : 1, ZLV: 0.331696
[476] :: 1270 ~ 1272, 1450 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 0.465389
[477] :: 1272 ~ 1274, 1814 ms, 365 (MB), Reclaimed Zone : 1, ZLV: 0.382454
[478] :: 1274 ~ 1276, 2086 ms, 532 (MB), Reclaimed Zone : 1, ZLV: 0.710282
[479] :: 1284 ~ 1285, 515 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.174020
[480] :: 1285 ~ 1287, 2415 ms, 515 (MB), Reclaimed Zone : 1, ZLV: 0.998925
[481] :: 1288 ~ 1288, 402 ms, 56 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[482] :: 1288 ~ 1290, 2118 ms, 472 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[483] :: 1291 ~ 1294, 2457 ms, 553 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[484] :: 1295 ~ 1298, 2896 ms, 516 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[485] :: 1298 ~ 1301, 2649 ms, 522 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[486] :: 1301 ~ 1303, 2051 ms, 529 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[487] :: 1303 ~ 1305, 2032 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 0.875000
[488] :: 1306 ~ 1309, 3034 ms, 593 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[489] :: 1309 ~ 1311, 2253 ms, 579 (MB), Reclaimed Zone : 1, ZLV: 0.891414
[490] :: 1311 ~ 1313, 1692 ms, 461 (MB), Reclaimed Zone : 1, ZLV: 0.559078
[491] :: 1313 ~ 1315, 2173 ms, 496 (MB), Reclaimed Zone : 1, ZLV: 0.870775
[492] :: 1315 ~ 1318, 2287 ms, 571 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[493] :: 1318 ~ 1321, 2778 ms, 564 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[494] :: 1321 ~ 1323, 2350 ms, 613 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[495] :: 1323 ~ 1325, 1099 ms, 151 (MB), Reclaimed Zone : 1, ZLV: 0.195760
[496] :: 1325 ~ 1325, 455 ms, 92 (MB), Reclaimed Zone : 1, ZLV: 0.096367
[497] :: 1325 ~ 1327, 2080 ms, 445 (MB), Reclaimed Zone : 1, ZLV: 0.997778
[498] :: 1328 ~ 1330, 2253 ms, 462 (MB), Reclaimed Zone : 1, ZLV: 0.652884
[499] :: 1332 ~ 1334, 2089 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 0.899344
[500] :: 1334 ~ 1336, 1966 ms, 537 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[501] :: 1337 ~ 1339, 2137 ms, 478 (MB), Reclaimed Zone : 1, ZLV: 0.845664
[502] :: 1341 ~ 1343, 2794 ms, 577 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[503] :: 1343 ~ 1346, 2212 ms, 578 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[504] :: 1346 ~ 1348, 2160 ms, 580 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[505] :: 1348 ~ 1351, 2572 ms, 523 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[506] :: 1351 ~ 1352, 1249 ms, 310 (MB), Reclaimed Zone : 1, ZLV: 0.427564
[507] :: 1352 ~ 1354, 2275 ms, 577 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[508] :: 1355 ~ 1357, 2536 ms, 507 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[509] :: 1360 ~ 1363, 3084 ms, 497 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[510] :: 1363 ~ 1365, 1615 ms, 426 (MB), Reclaimed Zone : 1, ZLV: 0.715999
[511] :: 1365 ~ 1367, 2108 ms, 529 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[512] :: 1367 ~ 1369, 2297 ms, 530 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[513] :: 1369 ~ 1371, 1219 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.412408
[514] :: 1371 ~ 1372, 1475 ms, 384 (MB), Reclaimed Zone : 1, ZLV: 0.526481
[515] :: 1372 ~ 1374, 1601 ms, 402 (MB), Reclaimed Zone : 1, ZLV: 0.554296
[516] :: 1374 ~ 1374, 225 ms, 20 (MB), Reclaimed Zone : 1, ZLV: 0.564525
[517] :: 1378 ~ 1379, 997 ms, 125 (MB), Reclaimed Zone : 1, ZLV: 0.206351
[518] :: 1380 ~ 1381, 911 ms, 227 (MB), Reclaimed Zone : 1, ZLV: 0.538129
[519] :: 1383 ~ 1385, 1850 ms, 341 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[520] :: 1385 ~ 1387, 1761 ms, 453 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[521] :: 1390 ~ 1392, 1653 ms, 346 (MB), Reclaimed Zone : 1, ZLV: 0.925357
[522] :: 1392 ~ 1393, 1418 ms, 374 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[523] :: 1393 ~ 1395, 1874 ms, 465 (MB), Reclaimed Zone : 1, ZLV: 0.998559
[524] :: 1395 ~ 1398, 2246 ms, 403 (MB), Reclaimed Zone : 1, ZLV: 0.841076
[525] :: 1398 ~ 1399, 1758 ms, 454 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[526] :: 1399 ~ 1401, 1813 ms, 468 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[527] :: 1401 ~ 1403, 1915 ms, 470 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[528] :: 1403 ~ 1406, 2260 ms, 429 (MB), Reclaimed Zone : 1, ZLV: 0.852539
[529] :: 1409 ~ 1411, 1930 ms, 335 (MB), Reclaimed Zone : 1, ZLV: 0.858824
[530] :: 1411 ~ 1413, 1497 ms, 381 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[531] :: 1413 ~ 1414, 1588 ms, 414 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[532] :: 1415 ~ 1417, 2407 ms, 391 (MB), Reclaimed Zone : 1, ZLV: 0.844626
[533] :: 1417 ~ 1418, 1026 ms, 271 (MB), Reclaimed Zone : 1, ZLV: 0.469686
[534] :: 1418 ~ 1420, 1933 ms, 453 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[535] :: 1422 ~ 1423, 1758 ms, 370 (MB), Reclaimed Zone : 1, ZLV: 0.703659
[536] :: 1423 ~ 1425, 1812 ms, 461 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[537] :: 1425 ~ 1426, 492 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.229412
[538] :: 1427 ~ 1428, 1750 ms, 345 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[539] :: 1428 ~ 1430, 1799 ms, 472 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[540] :: 1436 ~ 1437, 1317 ms, 200 (MB), Reclaimed Zone : 1, ZLV: 0.763261
[541] :: 1437 ~ 1438, 969 ms, 252 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[542] :: 1438 ~ 1440, 1512 ms, 381 (MB), Reclaimed Zone : 1, ZLV: 0.997159
[543] :: 1440 ~ 1440, 545 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.320630
[544] :: 1440 ~ 1441, 467 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.250000
[545] :: 1441 ~ 1442, 1165 ms, 266 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[546] :: 1447 ~ 1448, 1355 ms, 326 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[547] :: 1448 ~ 1450, 1734 ms, 388 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[548] :: 1450 ~ 1450, 565 ms, 141 (MB), Reclaimed Zone : 1, ZLV: 0.382039
[549] :: 1451 ~ 1451, 646 ms, 161 (MB), Reclaimed Zone : 1, ZLV: 0.420619
[550] :: 1469 ~ 1470, 570 ms, 99 (MB), Reclaimed Zone : 1, ZLV: 0.178312
[551] :: 1488 ~ 1490, 1555 ms, 353 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[552] :: 1490 ~ 1491, 1084 ms, 241 (MB), Reclaimed Zone : 1, ZLV: 0.575297
[553] :: 1491 ~ 1493, 1429 ms, 382 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[554] :: 1519 ~ 1521, 1333 ms, 246 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[555] :: 1524 ~ 1526, 1207 ms, 304 (MB), Reclaimed Zone : 1, ZLV: 0.677029
[556] :: 1530 ~ 1532, 1866 ms, 428 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[557] :: 1532 ~ 1534, 1610 ms, 433 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[558] :: 1537 ~ 1539, 1907 ms, 442 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[559] :: 1544 ~ 1546, 2047 ms, 418 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[560] :: 1554 ~ 1556, 1803 ms, 439 (MB), Reclaimed Zone : 1, ZLV: 0.989566
[561] :: 1556 ~ 1556, 402 ms, 99 (MB), Reclaimed Zone : 1, ZLV: 0.219878
[562] :: 1562 ~ 1563, 906 ms, 184 (MB), Reclaimed Zone : 1, ZLV: 0.737361
[563] :: 1563 ~ 1563, 455 ms, 105 (MB), Reclaimed Zone : 1, ZLV: 0.155670
[564] :: 1575 ~ 1577, 1869 ms, 447 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[565] :: 1577 ~ 1579, 1574 ms, 410 (MB), Reclaimed Zone : 1, ZLV: 0.892361
[566] :: 1598 ~ 1599, 840 ms, 159 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[567] :: 1599 ~ 1600, 1736 ms, 449 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[568] :: 1618 ~ 1619, 1669 ms, 366 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[569] :: 1619 ~ 1621, 1453 ms, 383 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[570] :: 1626 ~ 1627, 1367 ms, 301 (MB), Reclaimed Zone : 1, ZLV: 0.569572
[571] :: 1627 ~ 1629, 1703 ms, 439 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[572] :: 1642 ~ 1644, 1933 ms, 437 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[573] :: 1644 ~ 1645, 881 ms, 221 (MB), Reclaimed Zone : 1, ZLV: 0.403601
[574] :: 1650 ~ 1652, 2022 ms, 457 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[575] :: 1652 ~ 1653, 1640 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[576] :: 1657 ~ 1659, 1800 ms, 391 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[577] :: 1659 ~ 1661, 2023 ms, 459 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[578] :: 1667 ~ 1669, 1741 ms, 430 (MB), Reclaimed Zone : 1, ZLV: 0.880149
[579] :: 1670 ~ 1672, 1987 ms, 484 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[580] :: 1689 ~ 1690, 828 ms, 169 (MB), Reclaimed Zone : 1, ZLV: 0.341340
[581] :: 1695 ~ 1696, 817 ms, 213 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[582] :: 1696 ~ 1698, 1612 ms, 430 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[583] :: 1701 ~ 1702, 676 ms, 166 (MB), Reclaimed Zone : 1, ZLV: 0.286917
[584] :: 1731 ~ 1731, 424 ms, 54 (MB), Reclaimed Zone : 1, ZLV: 0.590642
[585] :: 1733 ~ 1735, 2032 ms, 459 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[586] :: 1735 ~ 1737, 1847 ms, 488 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[587] :: 1753 ~ 1754, 1239 ms, 296 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[588] :: 1754 ~ 1755, 293 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.207355
[589] :: 1761 ~ 1761, 657 ms, 136 (MB), Reclaimed Zone : 1, ZLV: 0.218901
[590] :: 1769 ~ 1770, 1661 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[591] :: 1775 ~ 1776, 1626 ms, 353 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[592] :: 1776 ~ 1777, 830 ms, 213 (MB), Reclaimed Zone : 1, ZLV: 0.388790
[593] :: 1780 ~ 1782, 2118 ms, 494 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[594] :: 1782 ~ 1784, 1847 ms, 498 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[595] :: 1798 ~ 1800, 1811 ms, 435 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[596] :: 1800 ~ 1801, 691 ms, 140 (MB), Reclaimed Zone : 1, ZLV: 0.178536
[597] :: 1823 ~ 1823, 121 ms, 16 (MB), Reclaimed Zone : 1, ZLV: 0.338854
[598] :: 1824 ~ 1825, 1056 ms, 230 (MB), Reclaimed Zone : 1, ZLV: 0.381466
[599] :: 1829 ~ 1830, 350 ms, 84 (MB), Reclaimed Zone : 1, ZLV: 0.288002
[600] :: 1830 ~ 1832, 1532 ms, 329 (MB), Reclaimed Zone : 1, ZLV: 0.916469
[601] :: 1841 ~ 1843, 2255 ms, 497 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[602] :: 1843 ~ 1844, 625 ms, 159 (MB), Reclaimed Zone : 1, ZLV: 0.300414
[603] :: 1845 ~ 1846, 1101 ms, 255 (MB), Reclaimed Zone : 1, ZLV: 0.366786
[604] :: 1854 ~ 1856, 2287 ms, 501 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[605] :: 1868 ~ 1869, 793 ms, 192 (MB), Reclaimed Zone : 1, ZLV: 0.277310
[606] :: 1875 ~ 1875, 508 ms, 93 (MB), Reclaimed Zone : 1, ZLV: 0.186604
[607] :: 1889 ~ 1890, 1014 ms, 202 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[608] :: 1890 ~ 1892, 1828 ms, 458 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[609] :: 1902 ~ 1903, 1168 ms, 302 (MB), Reclaimed Zone : 1, ZLV: 0.697534
[610] :: 1908 ~ 1910, 2007 ms, 483 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[611] :: 1910 ~ 1912, 1937 ms, 500 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[612] :: 1918 ~ 1919, 755 ms, 156 (MB), Reclaimed Zone : 1, ZLV: 0.920045
[613] :: 1919 ~ 1920, 457 ms, 103 (MB), Reclaimed Zone : 1, ZLV: 0.228703
[614] :: 1922 ~ 1924, 1916 ms, 379 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[615] :: 1932 ~ 1933, 754 ms, 160 (MB), Reclaimed Zone : 1, ZLV: 0.300983
[616] :: 1953 ~ 1955, 1899 ms, 422 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[617] :: 1955 ~ 1956, 1813 ms, 503 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[618] :: 1961 ~ 1964, 2251 ms, 504 (MB), Reclaimed Zone : 1, ZLV: 0.998182
[619] :: 1977 ~ 1978, 1437 ms, 307 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[620] :: 1983 ~ 1983, 287 ms, 59 (MB), Reclaimed Zone : 1, ZLV: 0.465479
[621] :: 1999 ~ 2000, 1883 ms, 445 (MB), Reclaimed Zone : 1, ZLV: 0.946471
[622] :: 2002 ~ 2004, 1999 ms, 465 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[623] :: 2004 ~ 2006, 1737 ms, 466 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[624] :: 2006 ~ 2007, 656 ms, 137 (MB), Reclaimed Zone : 1, ZLV: 0.296817
[625] :: 2012 ~ 2014, 1798 ms, 467 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[626] :: 2024 ~ 2026, 2058 ms, 472 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[627] :: 2026 ~ 2027, 830 ms, 222 (MB), Reclaimed Zone : 1, ZLV: 0.377492
[628] :: 2030 ~ 2032, 2172 ms, 511 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[629] :: 2032 ~ 2034, 2086 ms, 531 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[630] :: 2050 ~ 2051, 897 ms, 173 (MB), Reclaimed Zone : 1, ZLV: 0.711940
[631] :: 2051 ~ 2053, 2316 ms, 533 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[632] :: 2074 ~ 2075, 1253 ms, 273 (MB), Reclaimed Zone : 1, ZLV: 0.369577
[633] :: 2075 ~ 2077, 2017 ms, 492 (MB), Reclaimed Zone : 1, ZLV: 0.844707
[634] :: 2093 ~ 2095, 2048 ms, 460 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[635] :: 2095 ~ 2097, 1169 ms, 315 (MB), Reclaimed Zone : 1, ZLV: 0.485951
[636] :: 2100 ~ 2101, 1381 ms, 322 (MB), Reclaimed Zone : 1, ZLV: 0.576698
[637] :: 2101 ~ 2103, 2205 ms, 548 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[638] :: 2120 ~ 2121, 790 ms, 171 (MB), Reclaimed Zone : 1, ZLV: 0.438898
[639] :: 2121 ~ 2123, 2005 ms, 482 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[640] :: 2131 ~ 2133, 2080 ms, 494 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[641] :: 2133 ~ 2135, 2006 ms, 511 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[642] :: 2144 ~ 2146, 1691 ms, 365 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[643] :: 2146 ~ 2147, 642 ms, 162 (MB), Reclaimed Zone : 1, ZLV: 0.357143
[644] :: 2151 ~ 2152, 856 ms, 180 (MB), Reclaimed Zone : 1, ZLV: 0.677104
[645] :: 2152 ~ 2154, 1856 ms, 477 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[646] :: 2168 ~ 2171, 2352 ms, 559 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[647] :: 2171 ~ 2173, 2031 ms, 507 (MB), Reclaimed Zone : 1, ZLV: 0.811721
[648] :: 2177 ~ 2178, 880 ms, 196 (MB), Reclaimed Zone : 1, ZLV: 0.246354
[649] :: 2198 ~ 2198, 501 ms, 107 (MB), Reclaimed Zone : 1, ZLV: 0.242625
[650] :: 2198 ~ 2200, 1913 ms, 475 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[651] :: 2216 ~ 2216, 630 ms, 125 (MB), Reclaimed Zone : 1, ZLV: 0.316670
[652] :: 2221 ~ 2222, 1540 ms, 319 (MB), Reclaimed Zone : 1, ZLV: 0.658175
[653] :: 2222 ~ 2223, 1087 ms, 271 (MB), Reclaimed Zone : 1, ZLV: 0.358682
[654] :: 2223 ~ 2225, 1990 ms, 528 (MB), Reclaimed Zone : 1, ZLV: 0.998203
[655] :: 2240 ~ 2242, 2337 ms, 546 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[656] :: 2245 ~ 2247, 2190 ms, 506 (MB), Reclaimed Zone : 1, ZLV: 0.827732
[657] :: 2247 ~ 2248, 368 ms, 59 (MB), Reclaimed Zone : 1, ZLV: 0.102949
[658] :: 2248 ~ 2250, 2186 ms, 564 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[659] :: 2256 ~ 2259, 2721 ms, 568 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[660] :: 2267 ~ 2269, 2019 ms, 494 (MB), Reclaimed Zone : 1, ZLV: 0.756667
[661] :: 2273 ~ 2276, 2590 ms, 569 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[662] :: 2276 ~ 2278, 2152 ms, 570 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[663] :: 2294 ~ 2296, 2049 ms, 498 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[664] :: 2296 ~ 2297, 979 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.351545
[665] :: 2297 ~ 2298, 938 ms, 253 (MB), Reclaimed Zone : 1, ZLV: 0.292682
[666] :: 2298 ~ 2301, 2333 ms, 578 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[667] :: 2306 ~ 2306, 630 ms, 125 (MB), Reclaimed Zone : 1, ZLV: 0.287321
[668] :: 2324 ~ 2326, 1598 ms, 393 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[669] :: 2345 ~ 2345, 72 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[670] :: 2360 ~ 2361, 474 ms, 67 (MB), Reclaimed Zone : 1, ZLV: 0.304282
[671] :: 2364 ~ 2366, 1837 ms, 428 (MB), Reclaimed Zone : 1, ZLV: 0.874625
[672] :: 2368 ~ 2369, 692 ms, 158 (MB), Reclaimed Zone : 1, ZLV: 0.333724
[673] :: 2369 ~ 2370, 548 ms, 135 (MB), Reclaimed Zone : 1, ZLV: 0.274474
[674] :: 2372 ~ 2374, 1600 ms, 335 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[675] :: 2383 ~ 2385, 2072 ms, 506 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[676] :: 2386 ~ 2388, 1117 ms, 262 (MB), Reclaimed Zone : 1, ZLV: 0.427383
[677] :: 2392 ~ 2395, 2579 ms, 564 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[678] :: 2395 ~ 2396, 629 ms, 158 (MB), Reclaimed Zone : 1, ZLV: 0.266263
[679] :: 2399 ~ 2401, 2437 ms, 507 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[680] :: 2404 ~ 2407, 2513 ms, 560 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[681] :: 2420 ~ 2420, 42 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[682] :: 2431 ~ 2432, 1279 ms, 269 (MB), Reclaimed Zone : 1, ZLV: 0.382221
[683] :: 2453 ~ 2454, 1239 ms, 281 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[684] :: 2457 ~ 2459, 2143 ms, 515 (MB), Reclaimed Zone : 1, ZLV: 0.962812
[685] :: 2459 ~ 2461, 2019 ms, 504 (MB), Reclaimed Zone : 1, ZLV: 0.881760
[686] :: 2462 ~ 2464, 2205 ms, 530 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[687] :: 2464 ~ 2466, 2143 ms, 566 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[688] :: 2475 ~ 2477, 2621 ms, 575 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[689] :: 2480 ~ 2482, 2334 ms, 579 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[690] :: 2483 ~ 2485, 2301 ms, 580 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[691] :: 2485 ~ 2485, 178 ms, 31 (MB), Reclaimed Zone : 1, ZLV: 0.515625
[692] :: 2500 ~ 2502, 2424 ms, 491 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[693] :: 2510 ~ 2510, 622 ms, 123 (MB), Reclaimed Zone : 1, ZLV: 0.196565
[694] :: 2510 ~ 2512, 2050 ms, 522 (MB), Reclaimed Zone : 1, ZLV: 0.836556
[695] :: 2527 ~ 2528, 644 ms, 113 (MB), Reclaimed Zone : 1, ZLV: 0.177930
[696] :: 2532 ~ 2532, 374 ms, 72 (MB), Reclaimed Zone : 1, ZLV: 0.409910
[697] :: 2532 ~ 2534, 1812 ms, 436 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[698] :: 2539 ~ 2541, 2351 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[699] :: 2545 ~ 2547, 2592 ms, 538 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[700] :: 2550 ~ 2552, 2151 ms, 552 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[701] :: 2552 ~ 2554, 1067 ms, 282 (MB), Reclaimed Zone : 1, ZLV: 0.465209
[702] :: 2555 ~ 2557, 2245 ms, 582 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[703] :: 2570 ~ 2572, 2054 ms, 503 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[704] :: 2579 ~ 2581, 2169 ms, 515 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[705] :: 2588 ~ 2591, 2258 ms, 480 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[706] :: 2594 ~ 2596, 1881 ms, 479 (MB), Reclaimed Zone : 1, ZLV: 0.839642
[707] :: 2601 ~ 2604, 2265 ms, 534 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[708] :: 2604 ~ 2605, 1301 ms, 301 (MB), Reclaimed Zone : 1, ZLV: 0.420576
[709] :: 2605 ~ 2608, 2495 ms, 564 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[710] :: 2626 ~ 2628, 2132 ms, 504 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[711] :: 2628 ~ 2630, 1952 ms, 518 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[712] :: 2630 ~ 2632, 2064 ms, 533 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[713] :: 2651 ~ 2653, 1863 ms, 382 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[714] :: 2653 ~ 2655, 2106 ms, 492 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[715] :: 2659 ~ 2661, 2269 ms, 509 (MB), Reclaimed Zone : 1, ZLV: 0.968636
[716] :: 2661 ~ 2663, 2055 ms, 535 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[717] :: 2679 ~ 2681, 1815 ms, 411 (MB), Reclaimed Zone : 1, ZLV: 0.677273
[718] :: 2681 ~ 2682, 1146 ms, 304 (MB), Reclaimed Zone : 1, ZLV: 0.473367
[719] :: 2686 ~ 2686, 393 ms, 77 (MB), Reclaimed Zone : 1, ZLV: 0.234040
[720] :: 2686 ~ 2689, 2578 ms, 560 (MB), Reclaimed Zone : 1, ZLV: 0.928335
[721] :: 2689 ~ 2691, 2258 ms, 583 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[722] :: 2707 ~ 2709, 2421 ms, 563 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[723] :: 2709 ~ 2711, 2238 ms, 588 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[724] :: 2731 ~ 2733, 1345 ms, 287 (MB), Reclaimed Zone : 1, ZLV: 0.562608
[725] :: 2733 ~ 2733, 732 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.415298
[726] :: 2734 ~ 2736, 1603 ms, 376 (MB), Reclaimed Zone : 1, ZLV: 0.632460
[727] :: 2738 ~ 2741, 2220 ms, 509 (MB), Reclaimed Zone : 1, ZLV: 0.782895
[728] :: 2741 ~ 2742, 1103 ms, 292 (MB), Reclaimed Zone : 1, ZLV: 0.321886
[729] :: 2757 ~ 2759, 2309 ms, 517 (MB), Reclaimed Zone : 1, ZLV: 0.714213
[730] :: 2759 ~ 2760, 681 ms, 170 (MB), Reclaimed Zone : 1, ZLV: 0.258880
[731] :: 2760 ~ 2761, 1150 ms, 284 (MB), Reclaimed Zone : 1, ZLV: 0.422257
[732] :: 2764 ~ 2765, 1126 ms, 256 (MB), Reclaimed Zone : 1, ZLV: 0.262029
[733] :: 2782 ~ 2783, 974 ms, 216 (MB), Reclaimed Zone : 1, ZLV: 0.218164
[734] :: 2787 ~ 2788, 1485 ms, 356 (MB), Reclaimed Zone : 1, ZLV: 0.760219
[735] :: 2788 ~ 2790, 2230 ms, 572 (MB), Reclaimed Zone : 1, ZLV: 0.927061
[736] :: 2814 ~ 2816, 1733 ms, 440 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[737] :: 2817 ~ 2819, 1809 ms, 502 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[738] :: 2819 ~ 2820, 1201 ms, 323 (MB), Reclaimed Zone : 1, ZLV: 0.417687
[739] :: 2831 ~ 2833, 1973 ms, 465 (MB), Reclaimed Zone : 1, ZLV: 0.734322
[740] :: 2834 ~ 2837, 2506 ms, 579 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[741] :: 2855 ~ 2857, 2267 ms, 561 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[742] :: 2857 ~ 2858, 877 ms, 231 (MB), Reclaimed Zone : 1, ZLV: 0.348455
[743] :: 2859 ~ 2861, 2554 ms, 599 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[744] :: 2870 ~ 2871, 876 ms, 183 (MB), Reclaimed Zone : 1, ZLV: 0.748710
[745] :: 2881 ~ 2883, 1833 ms, 428 (MB), Reclaimed Zone : 1, ZLV: 0.998107
[746] :: 2883 ~ 2883, 658 ms, 167 (MB), Reclaimed Zone : 1, ZLV: 0.400550
[747] :: 2903 ~ 2904, 1372 ms, 335 (MB), Reclaimed Zone : 1, ZLV: 0.627551
[748] :: 2904 ~ 2905, 1160 ms, 287 (MB), Reclaimed Zone : 1, ZLV: 0.453206
[749] :: 2906 ~ 2908, 2005 ms, 511 (MB), Reclaimed Zone : 1, ZLV: 0.998481
[750] :: 2922 ~ 2924, 2015 ms, 385 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[751] :: 2927 ~ 2929, 1949 ms, 460 (MB), Reclaimed Zone : 1, ZLV: 0.843259
[752] :: 2929 ~ 2930, 791 ms, 190 (MB), Reclaimed Zone : 1, ZLV: 0.372678
[753] :: 2930 ~ 2932, 1947 ms, 525 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[754] :: 2939 ~ 2939, 504 ms, 104 (MB), Reclaimed Zone : 1, ZLV: 0.259466
[755] :: 2942 ~ 2944, 1681 ms, 364 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[756] :: 2947 ~ 2950, 2455 ms, 541 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[757] :: 2953 ~ 2955, 2442 ms, 547 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[758] :: 2956 ~ 2956, 436 ms, 101 (MB), Reclaimed Zone : 1, ZLV: 0.169855
[759] :: 2956 ~ 2958, 2502 ms, 572 (MB), Reclaimed Zone : 1, ZLV: 0.942677
[760] :: 2961 ~ 2961, 88 ms, 4 (MB), Reclaimed Zone : 1, ZLV: 0.427083
[761] :: 2967 ~ 2967, 302 ms, 66 (MB), Reclaimed Zone : 1, ZLV: 0.092614
[762] :: 2977 ~ 2979, 2168 ms, 610 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[763] :: 2980 ~ 2982, 2593 ms, 614 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[764] :: 2988 ~ 2989, 1478 ms, 349 (MB), Reclaimed Zone : 1, ZLV: 0.901175
[765] :: 2990 ~ 2992, 2543 ms, 570 (MB), Reclaimed Zone : 1, ZLV: 0.998788
[766] :: 3004 ~ 3007, 2320 ms, 545 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[767] :: 3009 ~ 3011, 2165 ms, 562 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[768] :: 3012 ~ 3013, 586 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.270000
[769] :: 3013 ~ 3016, 2387 ms, 575 (MB), Reclaimed Zone : 1, ZLV: 0.898537
[770] :: 3025 ~ 3028, 2268 ms, 596 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[771] :: 3033 ~ 3035, 2452 ms, 615 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[772] :: 3035 ~ 3036, 575 ms, 141 (MB), Reclaimed Zone : 1, ZLV: 0.242229
[773] :: 3041 ~ 3043, 2274 ms, 551 (MB), Reclaimed Zone : 1, ZLV: 0.884491
[774] :: 3057 ~ 3057, 355 ms, 44 (MB), Reclaimed Zone : 1, ZLV: 0.305779
[775] :: 3057 ~ 3059, 1777 ms, 479 (MB), Reclaimed Zone : 1, ZLV: 0.808423
[776] :: 3079 ~ 3080, 1217 ms, 263 (MB), Reclaimed Zone : 1, ZLV: 0.509301
[777] :: 3081 ~ 3083, 2261 ms, 542 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[778] :: 3086 ~ 3087, 353 ms, 65 (MB), Reclaimed Zone : 1, ZLV: 0.343689
[779] :: 3087 ~ 3088, 1198 ms, 332 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[780] :: 3098 ~ 3100, 2197 ms, 584 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[781] :: 3105 ~ 3108, 2487 ms, 601 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[782] :: 3108 ~ 3110, 1648 ms, 446 (MB), Reclaimed Zone : 1, ZLV: 0.597705
[783] :: 3110 ~ 3112, 2573 ms, 619 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[784] :: 3131 ~ 3133, 2262 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 0.898625
[785] :: 3133 ~ 3135, 2033 ms, 553 (MB), Reclaimed Zone : 1, ZLV: 0.893231
[786] :: 3138 ~ 3141, 2445 ms, 528 (MB), Reclaimed Zone : 1, ZLV: 0.911308
[787] :: 3141 ~ 3143, 2361 ms, 629 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[788] :: 3143 ~ 3146, 2800 ms, 631 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[789] :: 3146 ~ 3149, 2639 ms, 631 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[790] :: 3149 ~ 3151, 2556 ms, 639 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[791] :: 3167 ~ 3169, 1478 ms, 320 (MB), Reclaimed Zone : 1, ZLV: 0.880801
[792] :: 3169 ~ 3170, 1270 ms, 335 (MB), Reclaimed Zone : 1, ZLV: 0.394078
[793] :: 3190 ~ 3191, 1399 ms, 318 (MB), Reclaimed Zone : 1, ZLV: 0.637940
[794] :: 3191 ~ 3192, 996 ms, 264 (MB), Reclaimed Zone : 1, ZLV: 0.537645
[795] :: 3192 ~ 3193, 1104 ms, 289 (MB), Reclaimed Zone : 1, ZLV: 0.336599
[796] :: 3195 ~ 3197, 1714 ms, 373 (MB), Reclaimed Zone : 1, ZLV: 0.369128
[797] :: 3197 ~ 3199, 2474 ms, 643 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[798] :: 3217 ~ 3217, 827 ms, 169 (MB), Reclaimed Zone : 1, ZLV: 0.442829
[799] :: 3224 ~ 3226, 2479 ms, 601 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[800] :: 3230 ~ 3232, 2520 ms, 588 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[801] :: 3242 ~ 3244, 1983 ms, 491 (MB), Reclaimed Zone : 1, ZLV: 0.662801
[802] :: 3244 ~ 3247, 2526 ms, 621 (MB), Reclaimed Zone : 1, ZLV: 0.998433
[803] :: 3247 ~ 3248, 1497 ms, 403 (MB), Reclaimed Zone : 1, ZLV: 0.480459
[804] :: 3248 ~ 3250, 1293 ms, 346 (MB), Reclaimed Zone : 1, ZLV: 0.364915
[805] :: 3270 ~ 3271, 1276 ms, 268 (MB), Reclaimed Zone : 1, ZLV: 0.401302
[806] :: 3271 ~ 3273, 1689 ms, 449 (MB), Reclaimed Zone : 1, ZLV: 0.649947
[807] :: 3273 ~ 3274, 1773 ms, 437 (MB), Reclaimed Zone : 1, ZLV: 0.536620
[808] :: 3274 ~ 3277, 2450 ms, 643 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[809] :: 3280 ~ 3283, 2704 ms, 655 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[810] :: 3300 ~ 3300, 669 ms, 138 (MB), Reclaimed Zone : 1, ZLV: 0.216387
[811] :: 3300 ~ 3300, 97 ms, 11 (MB), Reclaimed Zone : 1, ZLV: 0.437500
[812] :: 3300 ~ 3302, 1663 ms, 388 (MB), Reclaimed Zone : 1, ZLV: 0.781246
[813] :: 3305 ~ 3307, 1444 ms, 325 (MB), Reclaimed Zone : 1, ZLV: 0.296099
[814] :: 3323 ~ 3325, 1839 ms, 464 (MB), Reclaimed Zone : 1, ZLV: 0.690179
[815] :: 3325 ~ 3327, 2320 ms, 571 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[816] :: 3335 ~ 3336, 1040 ms, 224 (MB), Reclaimed Zone : 1, ZLV: 0.267621
[817] :: 3336 ~ 3338, 2702 ms, 606 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[818] :: 3340 ~ 3342, 2087 ms, 492 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[819] :: 3347 ~ 3349, 2077 ms, 501 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[820] :: 3359 ~ 3359, 764 ms, 157 (MB), Reclaimed Zone : 1, ZLV: 0.284485
[821] :: 3360 ~ 3362, 2442 ms, 597 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[822] :: 3362 ~ 3363, 889 ms, 241 (MB), Reclaimed Zone : 1, ZLV: 0.218884
[823] :: 3373 ~ 3375, 2086 ms, 473 (MB), Reclaimed Zone : 1, ZLV: 0.753462
[824] :: 3379 ~ 3381, 2396 ms, 616 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[825] :: 3381 ~ 3384, 3069 ms, 643 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[826] :: 3385 ~ 3387, 2610 ms, 657 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[827] :: 3387 ~ 3390, 2493 ms, 663 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[828] :: 3409 ~ 3411, 2454 ms, 580 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[829] :: 3413 ~ 3414, 908 ms, 194 (MB), Reclaimed Zone : 1, ZLV: 0.308473
[830] :: 3414 ~ 3417, 2673 ms, 674 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[831] :: 3420 ~ 3420, 742 ms, 157 (MB), Reclaimed Zone : 1, ZLV: 0.322600
[832] :: 3424 ~ 3426, 1918 ms, 458 (MB), Reclaimed Zone : 1, ZLV: 0.926245
[833] :: 3435 ~ 3438, 3176 ms, 668 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[834] :: 3438 ~ 3439, 1327 ms, 357 (MB), Reclaimed Zone : 1, ZLV: 0.376470
[835] :: 3444 ~ 3445, 782 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.772549
[836] :: 3445 ~ 3447, 2535 ms, 677 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[837] :: 3447 ~ 3450, 2913 ms, 678 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[838] :: 3450 ~ 3453, 2775 ms, 697 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[839] :: 3469 ~ 3470, 1830 ms, 439 (MB), Reclaimed Zone : 1, ZLV: 0.769602
[840] :: 3471 ~ 3473, 2407 ms, 589 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[841] :: 3477 ~ 3477, 430 ms, 73 (MB), Reclaimed Zone : 1, ZLV: 0.259257
[842] :: 3492 ~ 3494, 1170 ms, 236 (MB), Reclaimed Zone : 1, ZLV: 0.291395
[843] :: 3499 ~ 3500, 1110 ms, 196 (MB), Reclaimed Zone : 1, ZLV: 0.219500
[844] :: 3514 ~ 3517, 2479 ms, 643 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[845] :: 3517 ~ 3519, 1868 ms, 431 (MB), Reclaimed Zone : 1, ZLV: 0.443827
[846] :: 3521 ~ 3521, 480 ms, 99 (MB), Reclaimed Zone : 1, ZLV: 0.074361
[847] :: 3540 ~ 3540, 632 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.207575
[848] :: 3546 ~ 3546, 434 ms, 89 (MB), Reclaimed Zone : 1, ZLV: 0.278565
[849] :: 3554 ~ 3556, 1843 ms, 484 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[850] :: 3561 ~ 3563, 2300 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 0.872521
[851] :: 3564 ~ 3567, 2165 ms, 507 (MB), Reclaimed Zone : 1, ZLV: 0.725772
[852] :: 3568 ~ 3571, 2614 ms, 629 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[853] :: 3572 ~ 3574, 1970 ms, 412 (MB), Reclaimed Zone : 1, ZLV: 0.997619
[854] :: 3578 ~ 3580, 1960 ms, 508 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[855] :: 3590 ~ 3591, 1092 ms, 227 (MB), Reclaimed Zone : 1, ZLV: 0.254381
[856] :: 3592 ~ 3593, 1339 ms, 306 (MB), Reclaimed Zone : 1, ZLV: 0.387219
[857] :: 3593 ~ 3595, 1588 ms, 442 (MB), Reclaimed Zone : 1, ZLV: 0.503495
[858] :: 3614 ~ 3615, 1165 ms, 249 (MB), Reclaimed Zone : 1, ZLV: 0.585861
[859] :: 3615 ~ 3615, 507 ms, 126 (MB), Reclaimed Zone : 1, ZLV: 0.419999
[860] :: 3617 ~ 3619, 2110 ms, 510 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[861] :: 3641 ~ 3641, 342 ms, 78 (MB), Reclaimed Zone : 1, ZLV: 0.295823
[862] :: 3641 ~ 3642, 612 ms, 125 (MB), Reclaimed Zone : 1, ZLV: 0.268590
[863] :: 3642 ~ 3644, 2236 ms, 544 (MB), Reclaimed Zone : 1, ZLV: 0.824396
[864] :: 3644 ~ 3647, 2246 ms, 554 (MB), Reclaimed Zone : 1, ZLV: 0.689329
[865] :: 3657 ~ 3660, 2818 ms, 633 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[866] :: 3663 ~ 3666, 2656 ms, 671 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[867] :: 3666 ~ 3667, 1348 ms, 342 (MB), Reclaimed Zone : 1, ZLV: 0.384059
[868] :: 3672 ~ 3674, 2163 ms, 507 (MB), Reclaimed Zone : 1, ZLV: 0.998108
[869] :: 3674 ~ 3675, 957 ms, 247 (MB), Reclaimed Zone : 1, ZLV: 0.662798
[870] :: 3690 ~ 3693, 2681 ms, 585 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[871] :: 3695 ~ 3697, 2365 ms, 586 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[872] :: 3715 ~ 3716, 787 ms, 159 (MB), Reclaimed Zone : 1, ZLV: 0.244505
[873] :: 3716 ~ 3718, 1842 ms, 481 (MB), Reclaimed Zone : 1, ZLV: 0.978717
[874] :: 3720 ~ 3722, 2451 ms, 606 (MB), Reclaimed Zone : 1, ZLV: 0.917425
[875] :: 3722 ~ 3724, 1575 ms, 418 (MB), Reclaimed Zone : 1, ZLV: 0.483719
[876] :: 3726 ~ 3728, 2544 ms, 640 (MB), Reclaimed Zone : 1, ZLV: 0.998846
[877] :: 3731 ~ 3734, 2636 ms, 637 (MB), Reclaimed Zone : 1, ZLV: 0.998848
[878] :: 3735 ~ 3737, 1315 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[879] :: 3747 ~ 3749, 1621 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 0.660753
[880] :: 3755 ~ 3755, 167 ms, 21 (MB), Reclaimed Zone : 1, ZLV: 0.519853
[881] :: 3758 ~ 3760, 1698 ms, 344 (MB), Reclaimed Zone : 1, ZLV: 0.638884
[882] :: 3769 ~ 3771, 1368 ms, 312 (MB), Reclaimed Zone : 1, ZLV: 0.271266
[883] :: 3771 ~ 3772, 1469 ms, 367 (MB), Reclaimed Zone : 1, ZLV: 0.422558
[884] :: 3772 ~ 3775, 2758 ms, 691 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[885] :: 3775 ~ 3777, 1492 ms, 397 (MB), Reclaimed Zone : 1, ZLV: 0.328792
[886] :: 3781 ~ 3784, 2381 ms, 545 (MB), Reclaimed Zone : 1, ZLV: 0.948936
[887] :: 3797 ~ 3799, 2334 ms, 575 (MB), Reclaimed Zone : 1, ZLV: 0.735336
[888] :: 3800 ~ 3802, 1496 ms, 380 (MB), Reclaimed Zone : 1, ZLV: 0.323022
[889] :: 3805 ~ 3805, 598 ms, 113 (MB), Reclaimed Zone : 1, ZLV: 0.412488
[890] :: 3821 ~ 3823, 1806 ms, 449 (MB), Reclaimed Zone : 1, ZLV: 0.446381
[891] :: 3828 ~ 3829, 780 ms, 158 (MB), Reclaimed Zone : 1, ZLV: 0.131829
[892] :: 3846 ~ 3848, 1312 ms, 266 (MB), Reclaimed Zone : 1, ZLV: 0.861270
[893] :: 3849 ~ 3852, 2979 ms, 670 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[894] :: 3852 ~ 3855, 2632 ms, 662 (MB), Reclaimed Zone : 1, ZLV: 0.917634
[895] :: 3855 ~ 3856, 1585 ms, 350 (MB), Reclaimed Zone : 1, ZLV: 0.421468
[896] :: 3856 ~ 3859, 2738 ms, 695 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[897] :: 3859 ~ 3862, 3185 ms, 697 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[898] :: 3878 ~ 3880, 2035 ms, 472 (MB), Reclaimed Zone : 1, ZLV: 0.809311
[899] :: 3887 ~ 3888, 472 ms, 96 (MB), Reclaimed Zone : 1, ZLV: 0.425072
[900] :: 3901 ~ 3902, 1071 ms, 238 (MB), Reclaimed Zone : 1, ZLV: 0.288721
[901] :: 3902 ~ 3904, 2056 ms, 553 (MB), Reclaimed Zone : 1, ZLV: 0.928104
[902] :: 3904 ~ 3906, 1864 ms, 488 (MB), Reclaimed Zone : 1, ZLV: 0.687161
[903] :: 3911 ~ 3912, 1028 ms, 241 (MB), Reclaimed Zone : 1, ZLV: 0.374448
[904] :: 3912 ~ 3913, 895 ms, 239 (MB), Reclaimed Zone : 1, ZLV: 0.275173
[905] :: 3928 ~ 3929, 904 ms, 190 (MB), Reclaimed Zone : 1, ZLV: 0.346463
[906] :: 3929 ~ 3932, 3075 ms, 640 (MB), Reclaimed Zone : 1, ZLV: 0.962574
[907] :: 3955 ~ 3956, 836 ms, 167 (MB), Reclaimed Zone : 1, ZLV: 0.252749
[908] :: 3961 ~ 3963, 1756 ms, 360 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[909] :: 3966 ~ 3968, 1902 ms, 379 (MB), Reclaimed Zone : 1, ZLV: 0.929687
[910] :: 3972 ~ 3973, 751 ms, 150 (MB), Reclaimed Zone : 1, ZLV: 0.993464
[911] :: 3979 ~ 3980, 587 ms, 144 (MB), Reclaimed Zone : 1, ZLV: 0.170485
[912] :: 3980 ~ 3982, 2310 ms, 537 (MB), Reclaimed Zone : 1, ZLV: 0.911344
[913] :: 3982 ~ 3984, 1197 ms, 269 (MB), Reclaimed Zone : 1, ZLV: 0.288853
[914] :: 3998 ~ 4001, 2436 ms, 526 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[915] :: 4004 ~ 4005, 743 ms, 154 (MB), Reclaimed Zone : 1, ZLV: 0.312763
[916] :: 4005 ~ 4008, 2426 ms, 632 (MB), Reclaimed Zone : 1, ZLV: 0.914179
[917] :: 4025 ~ 4027, 2594 ms, 589 (MB), Reclaimed Zone : 1, ZLV: 0.936176
[918] :: 4031 ~ 4033, 2302 ms, 545 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[919] :: 4033 ~ 4035, 2246 ms, 595 (MB), Reclaimed Zone : 1, ZLV: 0.906001
[920] :: 4046 ~ 4047, 1932 ms, 376 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[921] :: 4051 ~ 4054, 2550 ms, 659 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[922] :: 4056 ~ 4059, 2556 ms, 665 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[923] :: 4059 ~ 4061, 2291 ms, 625 (MB), Reclaimed Zone : 1, ZLV: 0.886007
[924] :: 4063 ~ 4063, 691 ms, 161 (MB), Reclaimed Zone : 1, ZLV: 0.145145
[925] :: 4074 ~ 4077, 3308 ms, 677 (MB), Reclaimed Zone : 1, ZLV: 0.982052
[926] :: 4080 ~ 4082, 2854 ms, 698 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[927] :: 4083 ~ 4084, 1072 ms, 245 (MB), Reclaimed Zone : 1, ZLV: 0.286273
[928] :: 4086 ~ 4088, 2828 ms, 703 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[929] :: 4101 ~ 4102, 1240 ms, 282 (MB), Reclaimed Zone : 1, ZLV: 0.364599
[930] :: 4106 ~ 4109, 2341 ms, 584 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[931] :: 4129 ~ 4129, 226 ms, 25 (MB), Reclaimed Zone : 1, ZLV: 0.149313
[932] :: 4129 ~ 4131, 2259 ms, 513 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[933] :: 4135 ~ 4138, 2518 ms, 545 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[934] :: 4138 ~ 4139, 1344 ms, 323 (MB), Reclaimed Zone : 1, ZLV: 0.371104
[935] :: 4139 ~ 4142, 2885 ms, 634 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[936] :: 4153 ~ 4155, 1760 ms, 444 (MB), Reclaimed Zone : 1, ZLV: 0.987094
[937] :: 4160 ~ 4161, 1110 ms, 260 (MB), Reclaimed Zone : 1, ZLV: 0.239963
[938] :: 4164 ~ 4167, 2522 ms, 622 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[939] :: 4168 ~ 4169, 1330 ms, 334 (MB), Reclaimed Zone : 1, ZLV: 0.305227
[940] :: 4169 ~ 4172, 2532 ms, 642 (MB), Reclaimed Zone : 1, ZLV: 0.893521
[941] :: 4182 ~ 4185, 2650 ms, 579 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[942] :: 4190 ~ 4191, 1331 ms, 325 (MB), Reclaimed Zone : 1, ZLV: 0.364709
[943] :: 4191 ~ 4194, 2741 ms, 688 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[944] :: 4196 ~ 4198, 2640 ms, 645 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[945] :: 4198 ~ 4201, 2648 ms, 705 (MB), Reclaimed Zone : 1, ZLV: 0.992050
[946] :: 4201 ~ 4204, 3107 ms, 710 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[947] :: 4215 ~ 4216, 1405 ms, 294 (MB), Reclaimed Zone : 1, ZLV: 0.784683
[948] :: 4220 ~ 4223, 2968 ms, 710 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[949] :: 4223 ~ 4225, 1659 ms, 405 (MB), Reclaimed Zone : 1, ZLV: 0.435224
[950] :: 4226 ~ 4229, 2558 ms, 688 (MB), Reclaimed Zone : 1, ZLV: 0.910077
[951] :: 4248 ~ 4249, 1269 ms, 286 (MB), Reclaimed Zone : 1, ZLV: 0.523694
[952] :: 4249 ~ 4250, 956 ms, 254 (MB), Reclaimed Zone : 1, ZLV: 0.329423
[953] :: 4260 ~ 4262, 1846 ms, 422 (MB), Reclaimed Zone : 1, ZLV: 0.882120
[954] :: 4271 ~ 4273, 1721 ms, 437 (MB), Reclaimed Zone : 1, ZLV: 0.893319
[955] :: 4273 ~ 4275, 2221 ms, 562 (MB), Reclaimed Zone : 1, ZLV: 0.917076
[956] :: 4296 ~ 4297, 1617 ms, 411 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[957] :: 4297 ~ 4299, 1621 ms, 395 (MB), Reclaimed Zone : 1, ZLV: 0.789398
[958] :: 4299 ~ 4302, 2272 ms, 544 (MB), Reclaimed Zone : 1, ZLV: 0.698329
[959] :: 4304 ~ 4305, 831 ms, 167 (MB), Reclaimed Zone : 1, ZLV: 0.179396
[960] :: 4305 ~ 4307, 2283 ms, 549 (MB), Reclaimed Zone : 1, ZLV: 0.861222
[961] :: 4308 ~ 4311, 2188 ms, 558 (MB), Reclaimed Zone : 1, ZLV: 0.550386
[962] :: 4325 ~ 4328, 2523 ms, 653 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[963] :: 4328 ~ 4329, 1184 ms, 308 (MB), Reclaimed Zone : 1, ZLV: 0.320876
[964] :: 4335 ~ 4337, 2668 ms, 573 (MB), Reclaimed Zone : 1, ZLV: 0.724890
[965] :: 4337 ~ 4340, 2629 ms, 631 (MB), Reclaimed Zone : 1, ZLV: 0.841166
[966] :: 4353 ~ 4355, 1939 ms, 455 (MB), Reclaimed Zone : 1, ZLV: 0.685389
[967] :: 4358 ~ 4358, 342 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.098039
[968] :: 4364 ~ 4366, 1433 ms, 314 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[969] :: 4375 ~ 4377, 2327 ms, 509 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[970] :: 4380 ~ 4383, 2944 ms, 638 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[971] :: 4399 ~ 4400, 1050 ms, 220 (MB), Reclaimed Zone : 1, ZLV: 0.644856
[972] :: 4400 ~ 4401, 1145 ms, 304 (MB), Reclaimed Zone : 1, ZLV: 0.337225
[973] :: 4401 ~ 4404, 2338 ms, 530 (MB), Reclaimed Zone : 1, ZLV: 0.677934
[974] :: 4407 ~ 4408, 1047 ms, 246 (MB), Reclaimed Zone : 1, ZLV: 0.237217
[975] :: 4419 ~ 4421, 2487 ms, 599 (MB), Reclaimed Zone : 1, ZLV: 0.768133
[976] :: 4426 ~ 4427, 1350 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.259258
[977] :: 4427 ~ 4429, 1704 ms, 440 (MB), Reclaimed Zone : 1, ZLV: 0.493256
[978] :: 4434 ~ 4436, 1804 ms, 432 (MB), Reclaimed Zone : 1, ZLV: 0.594176
[979] :: 4452 ~ 4453, 1300 ms, 353 (MB), Reclaimed Zone : 1, ZLV: 0.341183
[980] :: 4453 ~ 4456, 2418 ms, 585 (MB), Reclaimed Zone : 1, ZLV: 0.642753
[981] :: 4456 ~ 4457, 1489 ms, 407 (MB), Reclaimed Zone : 1, ZLV: 0.434721
[982] :: 4457 ~ 4459, 2153 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 0.690665
[983] :: 4461 ~ 4464, 3243 ms, 715 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[984] :: 4465 ~ 4468, 3011 ms, 663 (MB), Reclaimed Zone : 1, ZLV: 0.775274
[985] :: 4468 ~ 4470, 2225 ms, 620 (MB), Reclaimed Zone : 1, ZLV: 0.633747
[986] :: 4476 ~ 4477, 627 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.111213
[987] :: 4477 ~ 4480, 3236 ms, 739 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[988] :: 4488 ~ 4491, 3051 ms, 746 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[989] :: 4493 ~ 4497, 3376 ms, 762 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[990] :: 4502 ~ 4505, 2375 ms, 474 (MB), Reclaimed Zone : 1, ZLV: 0.998614
[991] :: 4513 ~ 4514, 1288 ms, 286 (MB), Reclaimed Zone : 1, ZLV: 0.342183
[992] :: 4514 ~ 4516, 1800 ms, 445 (MB), Reclaimed Zone : 1, ZLV: 0.397865
[993] :: 4522 ~ 4524, 1976 ms, 476 (MB), Reclaimed Zone : 1, ZLV: 0.719648
[994] :: 4524 ~ 4527, 2739 ms, 739 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[995] :: 4541 ~ 4544, 2695 ms, 640 (MB), Reclaimed Zone : 1, ZLV: 0.826882
[996] :: 4544 ~ 4545, 1165 ms, 317 (MB), Reclaimed Zone : 1, ZLV: 0.337128
[997] :: 4548 ~ 4551, 3214 ms, 763 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[998] :: 4551 ~ 4554, 2467 ms, 641 (MB), Reclaimed Zone : 1, ZLV: 0.573727
[999] :: 4556 ~ 4558, 1938 ms, 487 (MB), Reclaimed Zone : 1, ZLV: 0.382139
[1000] :: 4558 ~ 4561, 3007 ms, 779 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1001] :: 4574 ~ 4575, 467 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.102757
[1002] :: 4575 ~ 4577, 2177 ms, 602 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1003] :: 4582 ~ 4583, 1102 ms, 270 (MB), Reclaimed Zone : 1, ZLV: 0.375000
[1004] :: 4599 ~ 4601, 2303 ms, 597 (MB), Reclaimed Zone : 1, ZLV: 0.928195
[1005] :: 4601 ~ 4602, 805 ms, 215 (MB), Reclaimed Zone : 1, ZLV: 0.347557
[1006] :: 4604 ~ 4606, 2446 ms, 625 (MB), Reclaimed Zone : 1, ZLV: 0.746417
[1007] :: 4608 ~ 4610, 1510 ms, 332 (MB), Reclaimed Zone : 1, ZLV: 0.282729
[1008] :: 4626 ~ 4628, 2058 ms, 451 (MB), Reclaimed Zone : 1, ZLV: 0.679429
[1009] :: 4628 ~ 4631, 2667 ms, 617 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1010] :: 4635 ~ 4636, 895 ms, 202 (MB), Reclaimed Zone : 1, ZLV: 0.257188
[1011] :: 4652 ~ 4653, 1706 ms, 397 (MB), Reclaimed Zone : 1, ZLV: 0.555012
[1012] :: 4653 ~ 4654, 1070 ms, 266 (MB), Reclaimed Zone : 1, ZLV: 0.299910
[1013] :: 4654 ~ 4657, 2669 ms, 657 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1014] :: 4659 ~ 4662, 2922 ms, 736 (MB), Reclaimed Zone : 1, ZLV: 0.920027
[1015] :: 4680 ~ 4682, 1748 ms, 396 (MB), Reclaimed Zone : 1, ZLV: 0.426679
[1016] :: 4682 ~ 4684, 1632 ms, 420 (MB), Reclaimed Zone : 1, ZLV: 0.571715
[1017] :: 4684 ~ 4686, 2367 ms, 636 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1018] :: 4691 ~ 4693, 1978 ms, 475 (MB), Reclaimed Zone : 1, ZLV: 0.797212
[1019] :: 4693 ~ 4696, 2433 ms, 669 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1020] :: 4700 ~ 4701, 1452 ms, 351 (MB), Reclaimed Zone : 1, ZLV: 0.379551
[1021] :: 4710 ~ 4713, 2940 ms, 680 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1022] :: 4714 ~ 4716, 2605 ms, 662 (MB), Reclaimed Zone : 1, ZLV: 0.722563
[1023] :: 4730 ~ 4731, 464 ms, 115 (MB), Reclaimed Zone : 1, ZLV: 0.310364
[1024] :: 4736 ~ 4739, 3076 ms, 742 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1025] :: 4739 ~ 4741, 1948 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 0.495520
[1026] :: 4742 ~ 4745, 3511 ms, 762 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1027] :: 4751 ~ 4752, 965 ms, 246 (MB), Reclaimed Zone : 1, ZLV: 0.513528
[1028] :: 4752 ~ 4754, 1969 ms, 540 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1029] :: 4756 ~ 4757, 559 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.207234
[1030] :: 4757 ~ 4759, 1816 ms, 497 (MB), Reclaimed Zone : 1, ZLV: 0.563614
[1031] :: 4770 ~ 4773, 3113 ms, 755 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1032] :: 4775 ~ 4778, 2725 ms, 658 (MB), Reclaimed Zone : 1, ZLV: 0.665515
[1033] :: 4778 ~ 4780, 2043 ms, 539 (MB), Reclaimed Zone : 1, ZLV: 0.427229
[1034] :: 4800 ~ 4801, 1565 ms, 377 (MB), Reclaimed Zone : 1, ZLV: 0.769592
[1035] :: 4801 ~ 4804, 3045 ms, 780 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1036] :: 4807 ~ 4808, 1379 ms, 316 (MB), Reclaimed Zone : 1, ZLV: 0.500267
[1037] :: 4808 ~ 4809, 802 ms, 206 (MB), Reclaimed Zone : 1, ZLV: 0.239809
[1038] :: 4819 ~ 4822, 2760 ms, 725 (MB), Reclaimed Zone : 1, ZLV: 0.855940
[1039] :: 4828 ~ 4829, 1439 ms, 335 (MB), Reclaimed Zone : 1, ZLV: 0.325889
[1040] :: 4829 ~ 4829, 74 ms, 5 (MB), Reclaimed Zone : 1, ZLV: 0.067427
[1041] :: 4829 ~ 4832, 2187 ms, 539 (MB), Reclaimed Zone : 1, ZLV: 0.383239
[1042] :: 4851 ~ 4852, 1206 ms, 261 (MB), Reclaimed Zone : 1, ZLV: 0.191938
[1043] :: 4855 ~ 4857, 2504 ms, 633 (MB), Reclaimed Zone : 1, ZLV: 0.662835
[1044] :: 4857 ~ 4861, 3189 ms, 781 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1045] :: 4862 ~ 4865, 3312 ms, 790 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1046] :: 4865 ~ 4868, 3059 ms, 730 (MB), Reclaimed Zone : 1, ZLV: 0.761394
[1047] :: 4868 ~ 4871, 3269 ms, 796 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1048] :: 4871 ~ 4874, 2859 ms, 729 (MB), Reclaimed Zone : 1, ZLV: 0.734994
[1049] :: 4885 ~ 4887, 2013 ms, 538 (MB), Reclaimed Zone : 1, ZLV: 0.519235
[1050] :: 4893 ~ 4895, 2270 ms, 541 (MB), Reclaimed Zone : 1, ZLV: 0.375679
[1051] :: 4895 ~ 4896, 1551 ms, 411 (MB), Reclaimed Zone : 1, ZLV: 0.335191
[1052] :: 4917 ~ 4918, 1357 ms, 295 (MB), Reclaimed Zone : 1, ZLV: 0.705113
[1053] :: 4918 ~ 4921, 2632 ms, 650 (MB), Reclaimed Zone : 1, ZLV: 0.741810
[1054] :: 4921 ~ 4923, 1691 ms, 458 (MB), Reclaimed Zone : 1, ZLV: 0.303594
[1055] :: 4923 ~ 4925, 2067 ms, 545 (MB), Reclaimed Zone : 1, ZLV: 0.376714
[1056] :: 4934 ~ 4937, 2519 ms, 637 (MB), Reclaimed Zone : 1, ZLV: 0.803984
[1057] :: 4948 ~ 4951, 2957 ms, 756 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1058] :: 4951 ~ 4953, 2672 ms, 687 (MB), Reclaimed Zone : 1, ZLV: 0.755833
[1059] :: 4953 ~ 4955, 2175 ms, 598 (MB), Reclaimed Zone : 1, ZLV: 0.516973
[1060] :: 4958 ~ 4960, 2493 ms, 655 (MB), Reclaimed Zone : 1, ZLV: 0.703822
[1061] :: 4962 ~ 4964, 1536 ms, 334 (MB), Reclaimed Zone : 1, ZLV: 0.456220
[1062] :: 4964 ~ 4967, 2848 ms, 761 (MB), Reclaimed Zone : 1, ZLV: 0.998976
[1063] :: 4967 ~ 4970, 2925 ms, 738 (MB), Reclaimed Zone : 1, ZLV: 0.807525
[1064] :: 4970 ~ 4972, 2058 ms, 553 (MB), Reclaimed Zone : 1, ZLV: 0.388322
[1065] :: 4983 ~ 4984, 1365 ms, 365 (MB), Reclaimed Zone : 1, ZLV: 0.188503
[1066] :: 4992 ~ 4995, 3704 ms, 800 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1067] :: 4997 ~ 5000, 2956 ms, 739 (MB), Reclaimed Zone : 1, ZLV: 0.920662
[1068] :: 5000 ~ 5002, 1369 ms, 288 (MB), Reclaimed Zone : 1, ZLV: 0.232055
[1069] :: 5005 ~ 5009, 3170 ms, 685 (MB), Reclaimed Zone : 1, ZLV: 0.690937
[1070] :: 5011 ~ 5015, 3144 ms, 805 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1071] :: 5022 ~ 5024, 2748 ms, 651 (MB), Reclaimed Zone : 1, ZLV: 0.836302
[1072] :: 5028 ~ 5029, 1773 ms, 394 (MB), Reclaimed Zone : 1, ZLV: 0.720458
[1073] :: 5029 ~ 5032, 2948 ms, 768 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1074] :: 5047 ~ 5049, 2221 ms, 523 (MB), Reclaimed Zone : 1, ZLV: 0.539731
[1075] :: 5049 ~ 5051, 1641 ms, 430 (MB), Reclaimed Zone : 1, ZLV: 0.338181
[1076] :: 5051 ~ 5054, 2296 ms, 511 (MB), Reclaimed Zone : 1, ZLV: 0.331172
[1077] :: 5054 ~ 5057, 3243 ms, 776 (MB), Reclaimed Zone : 1, ZLV: 0.984944
[1078] :: 5057 ~ 5059, 1767 ms, 501 (MB), Reclaimed Zone : 1, ZLV: 0.299737
[1079] :: 5061 ~ 5063, 2147 ms, 505 (MB), Reclaimed Zone : 1, ZLV: 0.605225
[1080] :: 5063 ~ 5066, 2320 ms, 532 (MB), Reclaimed Zone : 1, ZLV: 0.370098
[1081] :: 5077 ~ 5079, 2116 ms, 433 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1082] :: 5083 ~ 5084, 1668 ms, 407 (MB), Reclaimed Zone : 1, ZLV: 0.225524
[1083] :: 5084 ~ 5086, 1694 ms, 445 (MB), Reclaimed Zone : 1, ZLV: 0.403444
[1084] :: 5090 ~ 5093, 2881 ms, 702 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1085] :: 5094 ~ 5097, 3126 ms, 759 (MB), Reclaimed Zone : 1, ZLV: 0.897719
[1086] :: 5097 ~ 5100, 2791 ms, 754 (MB), Reclaimed Zone : 1, ZLV: 0.871156
[1087] :: 5115 ~ 5117, 2452 ms, 595 (MB), Reclaimed Zone : 1, ZLV: 0.650022
[1088] :: 5117 ~ 5119, 1924 ms, 504 (MB), Reclaimed Zone : 1, ZLV: 0.436683
[1089] :: 5125 ~ 5126, 1111 ms, 231 (MB), Reclaimed Zone : 1, ZLV: 0.253142
[1090] :: 5141 ~ 5144, 2920 ms, 641 (MB), Reclaimed Zone : 1, ZLV: 0.998888
[1091] :: 5144 ~ 5145, 1582 ms, 401 (MB), Reclaimed Zone : 1, ZLV: 0.404805
[1092] :: 5145 ~ 5148, 2375 ms, 597 (MB), Reclaimed Zone : 1, ZLV: 0.801059
[1093] :: 5149 ~ 5152, 2786 ms, 654 (MB), Reclaimed Zone : 1, ZLV: 0.513890
[1094] :: 5154 ~ 5157, 3110 ms, 815 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1095] :: 5158 ~ 5159, 1749 ms, 385 (MB), Reclaimed Zone : 1, ZLV: 0.273041
[1096] :: 5159 ~ 5162, 3081 ms, 768 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1097] :: 5172 ~ 5176, 3640 ms, 756 (MB), Reclaimed Zone : 1, ZLV: 0.777836
[1098] :: 5179 ~ 5181, 1967 ms, 458 (MB), Reclaimed Zone : 1, ZLV: 0.238659
[1099] :: 5185 ~ 5187, 2077 ms, 452 (MB), Reclaimed Zone : 1, ZLV: 0.405431
[1100] :: 5187 ~ 5189, 1650 ms, 443 (MB), Reclaimed Zone : 1, ZLV: 0.243962
[1101] :: 5193 ~ 5196, 3274 ms, 648 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1102] :: 5205 ~ 5207, 2757 ms, 721 (MB), Reclaimed Zone : 1, ZLV: 0.645957
[1103] :: 5207 ~ 5209, 1779 ms, 474 (MB), Reclaimed Zone : 1, ZLV: 0.385509
[1104] :: 5209 ~ 5212, 2582 ms, 612 (MB), Reclaimed Zone : 1, ZLV: 0.422790
[1105] :: 5212 ~ 5214, 1814 ms, 477 (MB), Reclaimed Zone : 1, ZLV: 0.270363
[1106] :: 5233 ~ 5236, 3250 ms, 776 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1107] :: 5240 ~ 5241, 1517 ms, 336 (MB), Reclaimed Zone : 1, ZLV: 0.154790
[1108] :: 5241 ~ 5245, 3323 ms, 821 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1109] :: 5250 ~ 5251, 444 ms, 111 (MB), Reclaimed Zone : 1, ZLV: 0.182112
[1110] :: 5261 ~ 5263, 2253 ms, 540 (MB), Reclaimed Zone : 1, ZLV: 0.883636
[1111] :: 5267 ~ 5269, 2537 ms, 630 (MB), Reclaimed Zone : 1, ZLV: 0.660598
[1112] :: 5269 ~ 5272, 2530 ms, 682 (MB), Reclaimed Zone : 1, ZLV: 0.820388
[1113] :: 5288 ~ 5288, 622 ms, 117 (MB), Reclaimed Zone : 1, ZLV: 0.319050
[1114] :: 5288 ~ 5290, 1971 ms, 490 (MB), Reclaimed Zone : 1, ZLV: 0.593705
[1115] :: 5294 ~ 5295, 831 ms, 168 (MB), Reclaimed Zone : 1, ZLV: 0.178934
[1116] :: 5295 ~ 5296, 1044 ms, 248 (MB), Reclaimed Zone : 1, ZLV: 0.190290
[1117] :: 5296 ~ 5299, 2190 ms, 552 (MB), Reclaimed Zone : 1, ZLV: 0.473097
[1118] :: 5309 ~ 5312, 2564 ms, 645 (MB), Reclaimed Zone : 1, ZLV: 0.622085
[1119] :: 5317 ~ 5318, 955 ms, 222 (MB), Reclaimed Zone : 1, ZLV: 0.167480
[1120] :: 5318 ~ 5318, 100 ms, 16 (MB), Reclaimed Zone : 1, ZLV: 0.125000
[1121] :: 5318 ~ 5321, 2298 ms, 559 (MB), Reclaimed Zone : 1, ZLV: 0.380154
[1122] :: 5321 ~ 5324, 2708 ms, 682 (MB), Reclaimed Zone : 1, ZLV: 0.539564
[1123] :: 5327 ~ 5328, 1058 ms, 259 (MB), Reclaimed Zone : 1, ZLV: 0.154438
[1124] :: 5328 ~ 5329, 1853 ms, 452 (MB), Reclaimed Zone : 1, ZLV: 0.337715
[1125] :: 5330 ~ 5333, 3594 ms, 823 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1126] :: 5335 ~ 5338, 3085 ms, 823 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1127] :: 5338 ~ 5341, 2899 ms, 732 (MB), Reclaimed Zone : 1, ZLV: 0.643315
[1128] :: 5344 ~ 5347, 2470 ms, 636 (MB), Reclaimed Zone : 1, ZLV: 0.863523
[1129] :: 5368 ~ 5368, 589 ms, 132 (MB), Reclaimed Zone : 1, ZLV: 0.248522
[1130] :: 5379 ~ 5382, 2320 ms, 559 (MB), Reclaimed Zone : 1, ZLV: 0.370600
[1131] :: 5382 ~ 5384, 2043 ms, 467 (MB), Reclaimed Zone : 1, ZLV: 0.356223
[1132] :: 5384 ~ 5385, 1878 ms, 536 (MB), Reclaimed Zone : 1, ZLV: 0.388306
[1133] :: 5391 ~ 5394, 3385 ms, 790 (MB), Reclaimed Zone : 1, ZLV: 0.940733
[1134] :: 5409 ~ 5411, 1753 ms, 418 (MB), Reclaimed Zone : 1, ZLV: 0.478046
[1135] :: 5415 ~ 5417, 1934 ms, 435 (MB), Reclaimed Zone : 1, ZLV: 0.388501
[1136] :: 5421 ~ 5424, 2438 ms, 615 (MB), Reclaimed Zone : 1, ZLV: 0.995095
[1137] :: 5424 ~ 5426, 2174 ms, 604 (MB), Reclaimed Zone : 1, ZLV: 0.621737
[1138] :: 5426 ~ 5429, 2841 ms, 743 (MB), Reclaimed Zone : 1, ZLV: 0.947618
[1139] :: 5434 ~ 5436, 1981 ms, 521 (MB), Reclaimed Zone : 1, ZLV: 0.413259
[1140] :: 5441 ~ 5444, 3006 ms, 748 (MB), Reclaimed Zone : 1, ZLV: 0.954152
[1141] :: 5444 ~ 5445, 875 ms, 217 (MB), Reclaimed Zone : 1, ZLV: 0.197313
[1142] :: 5449 ~ 5451, 2007 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 0.368031
[1143] :: 5451 ~ 5453, 1071 ms, 284 (MB), Reclaimed Zone : 1, ZLV: 0.187070
[1144] :: 5469 ~ 5471, 2490 ms, 612 (MB), Reclaimed Zone : 1, ZLV: 0.729987
[1145] :: 5471 ~ 5473, 1458 ms, 384 (MB), Reclaimed Zone : 1, ZLV: 0.412275
[1146] :: 5494 ~ 5495, 1267 ms, 272 (MB), Reclaimed Zone : 1, ZLV: 0.236196
[1147] :: 5495 ~ 5497, 2532 ms, 534 (MB), Reclaimed Zone : 1, ZLV: 0.522046
[1148] :: 5502 ~ 5504, 2017 ms, 458 (MB), Reclaimed Zone : 1, ZLV: 0.457231
[1149] :: 5504 ~ 5507, 2919 ms, 686 (MB), Reclaimed Zone : 1, ZLV: 0.891106
[1150] :: 5517 ~ 5520, 3294 ms, 661 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1151] :: 5523 ~ 5526, 3192 ms, 715 (MB), Reclaimed Zone : 1, ZLV: 0.994017
[1152] :: 5526 ~ 5527, 1490 ms, 348 (MB), Reclaimed Zone : 1, ZLV: 0.369865
[1153] :: 5527 ~ 5529, 1408 ms, 355 (MB), Reclaimed Zone : 1, ZLV: 0.356961
[1154] :: 5536 ~ 5539, 2591 ms, 648 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1155] :: 5539 ~ 5540, 1338 ms, 326 (MB), Reclaimed Zone : 1, ZLV: 0.280889
[1156] :: 5542 ~ 5544, 1964 ms, 456 (MB), Reclaimed Zone : 1, ZLV: 0.537857
[1157] :: 5554 ~ 5557, 2965 ms, 665 (MB), Reclaimed Zone : 1, ZLV: 0.810640
[1158] :: 5557 ~ 5560, 2515 ms, 617 (MB), Reclaimed Zone : 1, ZLV: 0.699253
[1159] :: 5564 ~ 5566, 1330 ms, 294 (MB), Reclaimed Zone : 1, ZLV: 0.326471
[1160] :: 5568 ~ 5571, 2320 ms, 523 (MB), Reclaimed Zone : 1, ZLV: 0.859048
[1161] :: 5582 ~ 5585, 2634 ms, 592 (MB), Reclaimed Zone : 1, ZLV: 0.869392
[1162] :: 5585 ~ 5589, 3240 ms, 711 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1163] :: 5591 ~ 5593, 1662 ms, 437 (MB), Reclaimed Zone : 1, ZLV: 0.828186
[1164] :: 5594 ~ 5594, 632 ms, 132 (MB), Reclaimed Zone : 1, ZLV: 0.131047
[1165] :: 5604 ~ 5606, 1984 ms, 527 (MB), Reclaimed Zone : 1, ZLV: 0.615546
[1166] :: 5612 ~ 5615, 2897 ms, 690 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1167] :: 5615 ~ 5616, 1171 ms, 309 (MB), Reclaimed Zone : 1, ZLV: 0.358920
[1168] :: 5616 ~ 5619, 2344 ms, 578 (MB), Reclaimed Zone : 1, ZLV: 0.582829
[1169] :: 5621 ~ 5624, 2678 ms, 675 (MB), Reclaimed Zone : 1, ZLV: 0.759758
[1170] :: 5641 ~ 5644, 2684 ms, 675 (MB), Reclaimed Zone : 1, ZLV: 0.902620
[1171] :: 5647 ~ 5648, 581 ms, 121 (MB), Reclaimed Zone : 1, ZLV: 0.384383
[1172] :: 5649 ~ 5651, 2728 ms, 659 (MB), Reclaimed Zone : 1, ZLV: 0.967520
[1173] :: 5651 ~ 5654, 2502 ms, 668 (MB), Reclaimed Zone : 1, ZLV: 0.772136
[1174] :: 5654 ~ 5657, 3240 ms, 751 (MB), Reclaimed Zone : 1, ZLV: 0.916136
[1175] :: 5657 ~ 5660, 3107 ms, 766 (MB), Reclaimed Zone : 1, ZLV: 0.942234
[1176] :: 5660 ~ 5663, 2986 ms, 800 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1177] :: 5663 ~ 5666, 2378 ms, 640 (MB), Reclaimed Zone : 1, ZLV: 0.492059
[1178] :: 5676 ~ 5679, 2630 ms, 656 (MB), Reclaimed Zone : 1, ZLV: 0.706391
[1179] :: 5684 ~ 5687, 2899 ms, 708 (MB), Reclaimed Zone : 1, ZLV: 0.595007
[1180] :: 5687 ~ 5690, 2178 ms, 573 (MB), Reclaimed Zone : 1, ZLV: 0.381838
[1181] :: 5691 ~ 5695, 4019 ms, 821 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1182] :: 5703 ~ 5705, 2565 ms, 540 (MB), Reclaimed Zone : 1, ZLV: 0.512924
[1183] :: 5714 ~ 5716, 1860 ms, 477 (MB), Reclaimed Zone : 1, ZLV: 0.348684
[1184] :: 5716 ~ 5719, 2927 ms, 707 (MB), Reclaimed Zone : 1, ZLV: 0.834361
[1185] :: 5724 ~ 5726, 2601 ms, 631 (MB), Reclaimed Zone : 1, ZLV: 0.647725
[1186] :: 5726 ~ 5729, 2959 ms, 731 (MB), Reclaimed Zone : 1, ZLV: 0.933973
[1187] :: 5739 ~ 5741, 1771 ms, 391 (MB), Reclaimed Zone : 1, ZLV: 0.220358
[1188] :: 5745 ~ 5747, 2535 ms, 623 (MB), Reclaimed Zone : 1, ZLV: 0.493634
[1189] :: 5747 ~ 5749, 2179 ms, 583 (MB), Reclaimed Zone : 1, ZLV: 0.549515
[1190] :: 5749 ~ 5752, 2659 ms, 653 (MB), Reclaimed Zone : 1, ZLV: 0.624642
[1191] :: 5755 ~ 5757, 1325 ms, 295 (MB), Reclaimed Zone : 1, ZLV: 0.128025
[1192] :: 5763 ~ 5765, 2456 ms, 613 (MB), Reclaimed Zone : 1, ZLV: 0.479874
[1193] :: 5776 ~ 5779, 3274 ms, 743 (MB), Reclaimed Zone : 1, ZLV: 0.801592
[1194] :: 5779 ~ 5782, 2256 ms, 579 (MB), Reclaimed Zone : 1, ZLV: 0.496624
[1195] :: 5782 ~ 5786, 3108 ms, 785 (MB), Reclaimed Zone : 1, ZLV: 0.866384
[1196] :: 5786 ~ 5789, 3202 ms, 786 (MB), Reclaimed Zone : 1, ZLV: 0.850928
[1197] :: 5798 ~ 5799, 937 ms, 241 (MB), Reclaimed Zone : 1, ZLV: 0.334777
[1198] :: 5810 ~ 5812, 2397 ms, 578 (MB), Reclaimed Zone : 1, ZLV: 0.888961
[1199] :: 5812 ~ 5814, 2168 ms, 566 (MB), Reclaimed Zone : 1, ZLV: 0.440402
[1200] :: 5814 ~ 5817, 2550 ms, 589 (MB), Reclaimed Zone : 1, ZLV: 0.406968
[1201] :: 5817 ~ 5819, 2015 ms, 563 (MB), Reclaimed Zone : 1, ZLV: 0.336673
[1202] :: 5823 ~ 5824, 877 ms, 185 (MB), Reclaimed Zone : 1, ZLV: 0.271684
[1203] :: 5828 ~ 5830, 1852 ms, 474 (MB), Reclaimed Zone : 1, ZLV: 0.939059
[1204] :: 5841 ~ 5844, 3506 ms, 760 (MB), Reclaimed Zone : 1, ZLV: 0.805394
[1205] :: 5850 ~ 5854, 3703 ms, 824 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1206] :: 5857 ~ 5860, 2477 ms, 524 (MB), Reclaimed Zone : 1, ZLV: 0.828426
[1207] :: 5862 ~ 5865, 2906 ms, 790 (MB), Reclaimed Zone : 1, ZLV: 0.998745
[1208] :: 5871 ~ 5872, 1834 ms, 463 (MB), Reclaimed Zone : 1, ZLV: 0.246477
[1209] :: 5872 ~ 5875, 2237 ms, 570 (MB), Reclaimed Zone : 1, ZLV: 0.523748
[1210] :: 5877 ~ 5879, 1819 ms, 405 (MB), Reclaimed Zone : 1, ZLV: 0.301974
[1211] :: 5879 ~ 5881, 2062 ms, 548 (MB), Reclaimed Zone : 1, ZLV: 0.480379
[1212] :: 5899 ~ 5901, 2231 ms, 545 (MB), Reclaimed Zone : 1, ZLV: 0.449357
[1213] :: 5901 ~ 5903, 1872 ms, 497 (MB), Reclaimed Zone : 1, ZLV: 0.324548
[1214] :: 5906 ~ 5909, 3274 ms, 785 (MB), Reclaimed Zone : 1, ZLV: 0.950274
[1215] :: 5926 ~ 5929, 2395 ms, 526 (MB), Reclaimed Zone : 1, ZLV: 0.456375
[1216] :: 5929 ~ 5930, 1605 ms, 424 (MB), Reclaimed Zone : 1, ZLV: 0.396696
[1217] :: 5930 ~ 5933, 2595 ms, 693 (MB), Reclaimed Zone : 1, ZLV: 0.636177
[1218] :: 5937 ~ 5939, 2757 ms, 722 (MB), Reclaimed Zone : 1, ZLV: 0.641059
[1219] :: 5939 ~ 5942, 3046 ms, 761 (MB), Reclaimed Zone : 1, ZLV: 0.767689
[1220] :: 5943 ~ 5946, 3215 ms, 757 (MB), Reclaimed Zone : 1, ZLV: 0.847868
[1221] :: 5946 ~ 5949, 2621 ms, 718 (MB), Reclaimed Zone : 1, ZLV: 0.606067
[1222] :: 5959 ~ 5960, 1187 ms, 307 (MB), Reclaimed Zone : 1, ZLV: 0.244220
[1223] :: 5966 ~ 5969, 3623 ms, 771 (MB), Reclaimed Zone : 1, ZLV: 0.876278
[1224] :: 5969 ~ 5971, 1972 ms, 519 (MB), Reclaimed Zone : 1, ZLV: 0.413260
[1225] :: 5971 ~ 5973, 1920 ms, 519 (MB), Reclaimed Zone : 1, ZLV: 0.346493
[1226] :: 5979 ~ 5980, 483 ms, 102 (MB), Reclaimed Zone : 1, ZLV: 0.103577
[1227] :: 5980 ~ 5982, 2431 ms, 624 (MB), Reclaimed Zone : 1, ZLV: 0.780429
[1228] :: 5996 ~ 5996, 67 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.329547
[1229] :: 6000 ~ 6001, 1505 ms, 342 (MB), Reclaimed Zone : 1, ZLV: 0.887483
[1230] :: 6001 ~ 6004, 2361 ms, 555 (MB), Reclaimed Zone : 1, ZLV: 0.471743
[1231] :: 6004 ~ 6008, 3246 ms, 768 (MB), Reclaimed Zone : 1, ZLV: 0.916129
[1232] :: 6008 ~ 6010, 2659 ms, 687 (MB), Reclaimed Zone : 1, ZLV: 0.706463
[1233] :: 6010 ~ 6013, 2586 ms, 744 (MB), Reclaimed Zone : 1, ZLV: 0.804558
[1234] :: 6022 ~ 6026, 3936 ms, 836 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1235] :: 6028 ~ 6032, 3343 ms, 838 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1236] :: 6032 ~ 6034, 2100 ms, 566 (MB), Reclaimed Zone : 1, ZLV: 0.437372
[1237] :: 6035 ~ 6036, 1520 ms, 399 (MB), Reclaimed Zone : 1, ZLV: 0.190351
[1238] :: 6036 ~ 6039, 3387 ms, 838 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1239] :: 6042 ~ 6044, 1489 ms, 395 (MB), Reclaimed Zone : 1, ZLV: 0.458601
[1240] :: 6050 ~ 6052, 2058 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 0.363265
[1241] :: 6052 ~ 6055, 3022 ms, 787 (MB), Reclaimed Zone : 1, ZLV: 0.869208
[1242] :: 6066 ~ 6070, 3498 ms, 841 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1243] :: 6070 ~ 6072, 2427 ms, 648 (MB), Reclaimed Zone : 1, ZLV: 0.439341
[1244] :: 6093 ~ 6095, 1299 ms, 279 (MB), Reclaimed Zone : 1, ZLV: 0.339186
[1245] :: 6095 ~ 6097, 2595 ms, 666 (MB), Reclaimed Zone : 1, ZLV: 0.709983
[1246] :: 6100 ~ 6101, 1084 ms, 218 (MB), Reclaimed Zone : 1, ZLV: 0.239496
[1247] :: 6101 ~ 6103, 1665 ms, 359 (MB), Reclaimed Zone : 1, ZLV: 0.224602
[1248] :: 6103 ~ 6106, 3093 ms, 776 (MB), Reclaimed Zone : 1, ZLV: 0.914920
[1249] :: 6116 ~ 6119, 3722 ms, 799 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1250] :: 6122 ~ 6125, 2853 ms, 704 (MB), Reclaimed Zone : 1, ZLV: 0.558534
[1251] :: 6128 ~ 6131, 2884 ms, 716 (MB), Reclaimed Zone : 1, ZLV: 0.593826
[1252] :: 6131 ~ 6134, 3084 ms, 772 (MB), Reclaimed Zone : 1, ZLV: 0.737285
[1253] :: 6134 ~ 6137, 3147 ms, 826 (MB), Reclaimed Zone : 1, ZLV: 0.911262
[1254] :: 6137 ~ 6141, 3342 ms, 844 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1255] :: 6146 ~ 6150, 3237 ms, 728 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1256] :: 6158 ~ 6160, 2798 ms, 713 (MB), Reclaimed Zone : 1, ZLV: 0.906833
[1257] :: 6165 ~ 6166, 1436 ms, 343 (MB), Reclaimed Zone : 1, ZLV: 0.190018
[1258] :: 6166 ~ 6170, 3227 ms, 845 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1259] :: 6170 ~ 6173, 3508 ms, 848 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1260] :: 6184 ~ 6186, 2045 ms, 480 (MB), Reclaimed Zone : 1, ZLV: 0.994415
[1261] :: 6186 ~ 6189, 3335 ms, 735 (MB), Reclaimed Zone : 1, ZLV: 0.659530
[1262] :: 6190 ~ 6194, 3546 ms, 841 (MB), Reclaimed Zone : 1, ZLV: 0.949291
[1263] :: 6194 ~ 6196, 2214 ms, 587 (MB), Reclaimed Zone : 1, ZLV: 0.391237
[1264] :: 6196 ~ 6199, 3082 ms, 704 (MB), Reclaimed Zone : 1, ZLV: 0.573085
[1265] :: 6204 ~ 6207, 3228 ms, 773 (MB), Reclaimed Zone : 1, ZLV: 0.956426
[1266] :: 6207 ~ 6210, 3049 ms, 819 (MB), Reclaimed Zone : 1, ZLV: 0.934367
[1267] :: 6210 ~ 6214, 3258 ms, 744 (MB), Reclaimed Zone : 1, ZLV: 0.617190
[1268] :: 6225 ~ 6228, 3349 ms, 816 (MB), Reclaimed Zone : 1, ZLV: 0.827907
[1269] :: 6231 ~ 6234, 3512 ms, 853 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1270] :: 6234 ~ 6237, 2653 ms, 627 (MB), Reclaimed Zone : 1, ZLV: 0.510060
[1271] :: 6237 ~ 6239, 1796 ms, 484 (MB), Reclaimed Zone : 1, ZLV: 0.288295
[1272] :: 6244 ~ 6247, 3315 ms, 758 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1273] :: 6248 ~ 6251, 2991 ms, 723 (MB), Reclaimed Zone : 1, ZLV: 0.681004
[1274] :: 6251 ~ 6255, 3390 ms, 866 (MB), Reclaimed Zone : 1, ZLV: 0.999068
[1275] :: 6258 ~ 6260, 2113 ms, 548 (MB), Reclaimed Zone : 1, ZLV: 0.314904
[1276] :: 6266 ~ 6269, 3247 ms, 661 (MB), Reclaimed Zone : 1, ZLV: 0.449147
[1277] :: 6272 ~ 6275, 3397 ms, 799 (MB), Reclaimed Zone : 1, ZLV: 0.760765
[1278] :: 6275 ~ 6277, 1936 ms, 525 (MB), Reclaimed Zone : 1, ZLV: 0.321022
[1279] :: 6282 ~ 6284, 1711 ms, 378 (MB), Reclaimed Zone : 1, ZLV: 0.271742
[1280] :: 6294 ~ 6297, 3225 ms, 807 (MB), Reclaimed Zone : 1, ZLV: 0.836803
[1281] :: 6297 ~ 6299, 2021 ms, 523 (MB), Reclaimed Zone : 1, ZLV: 0.240889
[1282] :: 6305 ~ 6308, 3725 ms, 874 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1283] :: 6308 ~ 6311, 2354 ms, 582 (MB), Reclaimed Zone : 1, ZLV: 0.431124
[1284] :: 6313 ~ 6316, 3072 ms, 779 (MB), Reclaimed Zone : 1, ZLV: 0.604388
[1285] :: 6334 ~ 6337, 2700 ms, 654 (MB), Reclaimed Zone : 1, ZLV: 0.842038
[1286] :: 6337 ~ 6338, 1614 ms, 396 (MB), Reclaimed Zone : 1, ZLV: 0.327225
[1287] :: 6338 ~ 6341, 2667 ms, 703 (MB), Reclaimed Zone : 1, ZLV: 0.894907
[1288] :: 6344 ~ 6346, 2262 ms, 602 (MB), Reclaimed Zone : 1, ZLV: 0.534318
[1289] :: 6348 ~ 6350, 2473 ms, 594 (MB), Reclaimed Zone : 1, ZLV: 0.701849
[1290] :: 6350 ~ 6352, 1870 ms, 469 (MB), Reclaimed Zone : 1, ZLV: 0.431896
[1291] :: 6363 ~ 6364, 1543 ms, 393 (MB), Reclaimed Zone : 1, ZLV: 0.210153
[1292] :: 6371 ~ 6373, 2059 ms, 515 (MB), Reclaimed Zone : 1, ZLV: 0.375177
[1293] :: 6375 ~ 6378, 2595 ms, 685 (MB), Reclaimed Zone : 1, ZLV: 0.591671
[1294] :: 6379 ~ 6381, 2403 ms, 520 (MB), Reclaimed Zone : 1, ZLV: 0.777106
[1295] :: 6385 ~ 6387, 2209 ms, 536 (MB), Reclaimed Zone : 1, ZLV: 0.349478
[1296] :: 6393 ~ 6396, 3182 ms, 813 (MB), Reclaimed Zone : 1, ZLV: 0.998326
[1297] :: 6401 ~ 6404, 2232 ms, 506 (MB), Reclaimed Zone : 1, ZLV: 0.230322
[1298] :: 6404 ~ 6406, 2292 ms, 584 (MB), Reclaimed Zone : 1, ZLV: 0.360702
[1299] :: 6411 ~ 6413, 2068 ms, 491 (MB), Reclaimed Zone : 1, ZLV: 0.306994
[1300] :: 6413 ~ 6415, 2638 ms, 703 (MB), Reclaimed Zone : 1, ZLV: 0.512714
[1301] :: 6421 ~ 6423, 1726 ms, 453 (MB), Reclaimed Zone : 1, ZLV: 0.497858
[1302] :: 6428 ~ 6430, 2399 ms, 624 (MB), Reclaimed Zone : 1, ZLV: 0.635265
[1303] :: 6436 ~ 6439, 3399 ms, 792 (MB), Reclaimed Zone : 1, ZLV: 0.770320
[1304] :: 6439 ~ 6442, 2824 ms, 759 (MB), Reclaimed Zone : 1, ZLV: 0.632246
[1305] :: 6442 ~ 6445, 2890 ms, 752 (MB), Reclaimed Zone : 1, ZLV: 0.613505
[1306] :: 6445 ~ 6447, 2616 ms, 726 (MB), Reclaimed Zone : 1, ZLV: 0.536407
[1307] :: 6448 ~ 6451, 3799 ms, 859 (MB), Reclaimed Zone : 1, ZLV: 0.994575
[1308] :: 6453 ~ 6457, 3034 ms, 789 (MB), Reclaimed Zone : 1, ZLV: 0.622769
[1309] :: 6474 ~ 6477, 3064 ms, 706 (MB), Reclaimed Zone : 1, ZLV: 0.588723
[1310] :: 6477 ~ 6479, 1979 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 0.458099
[1311] :: 6479 ~ 6482, 2988 ms, 753 (MB), Reclaimed Zone : 1, ZLV: 0.654251
[1312] :: 6487 ~ 6490, 3133 ms, 794 (MB), Reclaimed Zone : 1, ZLV: 0.661902
[1313] :: 6490 ~ 6492, 1735 ms, 476 (MB), Reclaimed Zone : 1, ZLV: 0.185098
[1314] :: 6508 ~ 6510, 1567 ms, 357 (MB), Reclaimed Zone : 1, ZLV: 0.200784
[1315] :: 6510 ~ 6512, 1897 ms, 509 (MB), Reclaimed Zone : 1, ZLV: 0.353721
[1316] :: 6513 ~ 6516, 3364 ms, 856 (MB), Reclaimed Zone : 1, ZLV: 0.990714
[1317] :: 6520 ~ 6522, 2789 ms, 716 (MB), Reclaimed Zone : 1, ZLV: 0.677546
[1318] :: 6522 ~ 6524, 1958 ms, 504 (MB), Reclaimed Zone : 1, ZLV: 0.270788
[1319] :: 6535 ~ 6537, 2094 ms, 456 (MB), Reclaimed Zone : 1, ZLV: 0.492155
[1320] :: 6541 ~ 6544, 2839 ms, 644 (MB), Reclaimed Zone : 1, ZLV: 0.366807
[1321] :: 6547 ~ 6548, 1507 ms, 334 (MB), Reclaimed Zone : 1, ZLV: 0.192977
[1322] :: 6550 ~ 6552, 1854 ms, 472 (MB), Reclaimed Zone : 1, ZLV: 0.260397
[1323] :: 6556 ~ 6559, 2552 ms, 474 (MB), Reclaimed Zone : 1, ZLV: 0.845441
[1324] :: 6568 ~ 6571, 3371 ms, 798 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1325] :: 6571 ~ 6573, 1618 ms, 449 (MB), Reclaimed Zone : 1, ZLV: 0.320102
[1326] :: 6573 ~ 6575, 2271 ms, 577 (MB), Reclaimed Zone : 1, ZLV: 0.390399
[1327] :: 6596 ~ 6598, 1898 ms, 456 (MB), Reclaimed Zone : 1, ZLV: 0.768497
[1328] :: 6599 ~ 6602, 2522 ms, 592 (MB), Reclaimed Zone : 1, ZLV: 0.473715
[1329] :: 6604 ~ 6606, 1707 ms, 394 (MB), Reclaimed Zone : 1, ZLV: 0.225475
[1330] :: 6606 ~ 6608, 2166 ms, 524 (MB), Reclaimed Zone : 1, ZLV: 0.262560
[1331] :: 6608 ~ 6610, 1936 ms, 429 (MB), Reclaimed Zone : 1, ZLV: 0.340189
[1332] :: 6610 ~ 6612, 2186 ms, 570 (MB), Reclaimed Zone : 1, ZLV: 0.358472
[1333] :: 6624 ~ 6627, 2929 ms, 664 (MB), Reclaimed Zone : 1, ZLV: 0.835044
[1334] :: 6632 ~ 6635, 2725 ms, 655 (MB), Reclaimed Zone : 1, ZLV: 0.514542
[1335] :: 6635 ~ 6637, 1839 ms, 502 (MB), Reclaimed Zone : 1, ZLV: 0.333657
[1336] :: 6637 ~ 6639, 2075 ms, 575 (MB), Reclaimed Zone : 1, ZLV: 0.402541
[1337] :: 6639 ~ 6643, 3623 ms, 827 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1338] :: 6662 ~ 6663, 112 ms, 10 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1339] :: 6663 ~ 6666, 2679 ms, 622 (MB), Reclaimed Zone : 1, ZLV: 0.788668
[1340] :: 6669 ~ 6670, 378 ms, 67 (MB), Reclaimed Zone : 1, ZLV: 0.097675
[1341] :: 6671 ~ 6674, 3122 ms, 671 (MB), Reclaimed Zone : 1, ZLV: 0.792081
[1342] :: 6677 ~ 6679, 2180 ms, 519 (MB), Reclaimed Zone : 1, ZLV: 0.578523
[1343] :: 6685 ~ 6686, 1386 ms, 333 (MB), Reclaimed Zone : 1, ZLV: 0.261450
[1344] :: 6691 ~ 6694, 3183 ms, 778 (MB), Reclaimed Zone : 1, ZLV: 0.933808
[1345] :: 6694 ~ 6697, 3483 ms, 819 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1346] :: 6701 ~ 6704, 3065 ms, 801 (MB), Reclaimed Zone : 1, ZLV: 0.821899
[1347] :: 6706 ~ 6711, 4433 ms, 840 (MB), Reclaimed Zone : 1, ZLV: 0.857845
[1348] :: 6716 ~ 6717, 1117 ms, 238 (MB), Reclaimed Zone : 1, ZLV: 0.179826
[1349] :: 6722 ~ 6725, 3069 ms, 765 (MB), Reclaimed Zone : 1, ZLV: 0.553998
[1350] :: 6726 ~ 6728, 2365 ms, 579 (MB), Reclaimed Zone : 1, ZLV: 0.342132
[1351] :: 6732 ~ 6734, 2357 ms, 618 (MB), Reclaimed Zone : 1, ZLV: 0.495105
[1352] :: 6734 ~ 6736, 1761 ms, 467 (MB), Reclaimed Zone : 1, ZLV: 0.206512
[1353] :: 6742 ~ 6744, 2548 ms, 589 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1354] :: 6750 ~ 6753, 2997 ms, 637 (MB), Reclaimed Zone : 1, ZLV: 0.398647
[1355] :: 6753 ~ 6757, 4230 ms, 880 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1356] :: 6757 ~ 6761, 3273 ms, 802 (MB), Reclaimed Zone : 1, ZLV: 0.643607
[1357] :: 6761 ~ 6763, 2343 ms, 649 (MB), Reclaimed Zone : 1, ZLV: 0.449930
[1358] :: 6763 ~ 6765, 2524 ms, 657 (MB), Reclaimed Zone : 1, ZLV: 0.409827
[1359] :: 6771 ~ 6772, 1885 ms, 442 (MB), Reclaimed Zone : 1, ZLV: 0.245501
[1360] :: 6778 ~ 6781, 3862 ms, 787 (MB), Reclaimed Zone : 1, ZLV: 0.669004
[1361] :: 6789 ~ 6793, 3115 ms, 788 (MB), Reclaimed Zone : 1, ZLV: 0.661378
[1362] :: 6793 ~ 6795, 2705 ms, 717 (MB), Reclaimed Zone : 1, ZLV: 0.507336
[1363] :: 6802 ~ 6806, 3796 ms, 887 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1364] :: 6806 ~ 6809, 3183 ms, 889 (MB), Reclaimed Zone : 1, ZLV: 0.997195
[1365] :: 6811 ~ 6814, 2757 ms, 650 (MB), Reclaimed Zone : 1, ZLV: 0.690867
[1366] :: 6825 ~ 6827, 2630 ms, 631 (MB), Reclaimed Zone : 1, ZLV: 0.370016
[1367] :: 6827 ~ 6829, 2174 ms, 601 (MB), Reclaimed Zone : 1, ZLV: 0.391826
[1368] :: 6833 ~ 6834, 1585 ms, 347 (MB), Reclaimed Zone : 1, ZLV: 0.478460
[1369] :: 6834 ~ 6837, 2418 ms, 581 (MB), Reclaimed Zone : 1, ZLV: 0.577814
[1370] :: 6837 ~ 6839, 1774 ms, 395 (MB), Reclaimed Zone : 1, ZLV: 0.246029
[1371] :: 6839 ~ 6841, 2477 ms, 559 (MB), Reclaimed Zone : 1, ZLV: 0.349189
[1372] :: 6841 ~ 6843, 1884 ms, 453 (MB), Reclaimed Zone : 1, ZLV: 0.277039
[1373] :: 6847 ~ 6850, 2531 ms, 610 (MB), Reclaimed Zone : 1, ZLV: 0.571909
[1374] :: 6850 ~ 6852, 2548 ms, 519 (MB), Reclaimed Zone : 1, ZLV: 0.216492
[1375] :: 6854 ~ 6857, 2659 ms, 720 (MB), Reclaimed Zone : 1, ZLV: 0.450188
[1376] :: 6862 ~ 6866, 3291 ms, 813 (MB), Reclaimed Zone : 1, ZLV: 0.640986
[1377] :: 6866 ~ 6868, 2284 ms, 594 (MB), Reclaimed Zone : 1, ZLV: 0.347597
[1378] :: 6869 ~ 6872, 3449 ms, 902 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1379] :: 6874 ~ 6878, 3478 ms, 760 (MB), Reclaimed Zone : 1, ZLV: 0.507774
[1380] :: 6878 ~ 6881, 3589 ms, 820 (MB), Reclaimed Zone : 1, ZLV: 0.598512
[1381] :: 6898 ~ 6900, 1637 ms, 307 (MB), Reclaimed Zone : 1, ZLV: 0.159465
[1382] :: 6902 ~ 6904, 2572 ms, 632 (MB), Reclaimed Zone : 1, ZLV: 0.277919
[1383] :: 6923 ~ 6925, 2029 ms, 520 (MB), Reclaimed Zone : 1, ZLV: 0.486593
[1384] :: 6925 ~ 6927, 1629 ms, 447 (MB), Reclaimed Zone : 1, ZLV: 0.334036
[1385] :: 6930 ~ 6933, 2443 ms, 602 (MB), Reclaimed Zone : 1, ZLV: 0.902496
[1386] :: 6935 ~ 6936, 1221 ms, 562 (MB), Reclaimed Zone : 1, ZLV: 0.951887
Total ZC Copied (MB) :: 547232, Recaimed by ZC :: 1386 
Total ZC copied- GC_BYTES_WRITTEN(MB):: 546944 
Reset Count (R+ZC) : 308+1386=1694
Finish Count : 0
Average ZLV :: 0.699668
propagation count : 4588
TOTAL I/O BLOKCING TIME 3795
TOTAL I/O BLOCKING TIME(ms) 2402399
Cumulative I/O Blocking(ms) 2402399
Calculate Lifetime Time(ms) 5240
copy/written ratio : 573513264318/1423650087746=40
level[0]: 분자(overlapping) 164857241724 / 분모(file size) 107961123103 = 1.5270
level[1]: 분자(overlapping) 403858262594 / 분모(file size) 106106560670 = 3.8062
level[2]: 분자(overlapping) 293222447233 / 분모(file size) 95241842074 = 3.0787
level[3]: 분자(overlapping) 0 / 분모(file size) 41044417023 = 0.0000
level[4]: 분자(overlapping) 0 / 분모(file size) 0 = 0.0000
avg deletion after time 389688530 us (total: 1503418352371 us, count: 3858)
reset_count_before_full_ 0 reset_size_before_full_ 0
SEQUENCE DISTRIBUTION
87 53 68 130 89 17 17 29 49 30 19 23 21 23 35 31 34 20 26 21 41 48 40 34 26 26 36 30 20 29 13 4 8 9 11 28 14 17 17 2 21 18 23 23 18 21 11 15 12 40 6 8 6 13 14 8 13 10 22 6 7 25 6 11 20 8 5 12 12 12 12 17 4 19 18 15 14 9 6 15 10 12 28 16 11 8 22 16 15 6 7 24 1 2 8 4 10 9 15 3 9 4 5 5 3 5 4 11 2 6 13 4 3 5 9 1 4 2 7 4 6 11 5 5 5 9 2 4 9 7 1 2 1 2 3 5 7 2 13 7 6 3 5 4 15 7 9 6 8 3 3 3 6 3 5 2 6 6 5 4 8 17 10 3 7 7 2 8 11 0 1 2 3 5 4 3 8 5 0 7 2 1 4 5 13 2 3 5 2 0 1 2 1 2 1 0 3 1 2 1 3 1 1 4 2 4 1 0 3 8 2 2 3 3 1 2 0 3 0 2 2 4 0 6 1 4 2 0 2 0 3 4 2 4 2 2 2 5 1 5 3 4 0 6 4 4 4 4 2 0 0 3 4 1 4 0 8 0 4 2 1 2 3 2 6 3 0 1 1 3 3 1 2 1 1 1 1 3 1 1 0 1 0 1 4 1 3 1 1 2 1 1 0 0 0 0 1 4 1 3 2 1 2 1 2 0 1 1 8 19 0 1 0 2 1 0 0 4 3 1 1 5 0 3 2 3 0 2 1 1 0 3 0 1 1 0 0 0 0 0 7 2 4 0 3 1 8 0 0 4 0 0 1 0 1 1 2 0 2 0 0 5 4 5 1 7 2 0 0 0 1 1 0 0 0 1 0 1 0 0 0 0 0 6 0 0 0 0 2 1 8 0 1 1 0 0 0 0 0 1 1 0 2 2 1 0 2 7 0 2 1 0 5 2 0 5 0 2 1 0 2 1 0 6 0 1 0 5 3 1 2 0 2 1 1 1 8 0 5 0 0 1 1 0 5 6 0 2 0 1 0 1 1 0 0 0 1 2 1 2 10 0 2 0 0 0 2 1 1 0 0 0 0 1 1 4 0 0 1 0 7 1 1 2 9 2 0 2 4 2 5 4 6 1 2 0 1 0 1 3 1 2 1 7 3 0 2 3 0 0 1 1 0 1 3 3 0 0 0 1 1 1 3 2 0 4 0 0 0 1 3 0 0 2 2 0 3 3 1 0 0 1 0 2 0 3 13 0 0 0 3 0 2 0 0 0 0 8 0 0 1 2 0 1 0 0 0 2 0 1 0 1 0 1 0 0 1 1 1 2 1 0 0 1 0 0 0 1 0 0 0 1 2 1 0 0 0 0 1 2 2 0 0 0 1 2 0 0 0 0 0 0 0 1 2 1 1 0 3 2 2 2 1 0 0 0 0 0 0 0 1 0 0 3 0 0 0 1 0 0 0 2 0 0 2 0 0 1 0 1 0 2 0 0 0 0 0 6 0 4 1 0 2 0 1 1 2 0 0 1 3 0 1 1 7 3 0 0 0 3 4 1 1 1 0 1 0 0 1 0 0 0 0 0 0 0 0 1 0 1 1 0 1 0 0 2 3 0 0 0 1 1 0 2 0 0 5 1 0 0 0 0 0 2 0 0 0 1 0 0 0 0 1 1 0 2 0 1 1 0 0 1 1 0 2 4 0 1 0 0 0 2 0 0 1 0 1 1 0 0 1 0 0 0 0 0 1 2 2 0 0 2 2 3 0 1 3 2 0 3 0 0 0 0 3 1 1 1 0 0 0 0 0 0 0 0 0 0 0 1 1 10 0 0 2 0 0 0 0 0 1 0 0 1 2 0 0 0 0 0 0 1 0 0 2 0 0 0 2 0 0 0 0 1 0 2 3 1 0 1 4 0 1 0 0 0 1 0 0 1 0 0 0 0 0 1 2 1 0 1 0 0 0 0 0 1 2 1 0 4 2 0 0 0 0 0 1 0 0 1 1 0 1 0 3 1 0 0 0 0 2 1 0 0 0 0 0 0 1 0 0 0 1 0 0 1 0 0 1 0 0 0 1 1 0 1 0 1 0 0 4 0 0 1 0 1 0 1 1 2 2 0 0 0 1 0 0 0 0 0 0 0 3 0 0 0 0 0 1 0 0 0 1 0 3 0 1 0 0 0 0 0 0 0 0 2 0 0 1 0 1 1 0 0 1 0 0 0 0 0 1 1 1 0 1 1 0 0 1 1 0 2 2 0 1 0 1 0 0 0 0 0 1 0 0 0 1 0 0 1 1 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 3 1 0 0 0 1 0 1 0 0 0 0 0 1 0 0 0 6 0 2 0 0 0 0 0 0 1 0 1 1 2 0 1 0 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 1 0 0 0 0 3 0 0 0 1 0 0 4 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 2 0 2 5 1 0 1 0 1 0 0 0 0 0 1 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 2 1 3 0 2 0 0 1 0 0 0 1 0 0 0 1 0 2 0 0 0 0 1 2 2 0 0 1 0 2 0 1 0 0 0 0 0 1 0 0 0 1 0 2 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 1 0 0 0 2 0 0 0 1 0 0 0 0 1 0 0 4 0 2 0 0 0 2 0 0 0 0 0 0 0 0 2 0 0 0 3 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 2 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 1 3 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 1 2 0 1 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 4 0 0 0 1 1 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 1 0 0 2 0 0 0 1 3 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 2 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 2 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 2 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 7 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 2 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 5 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 2 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 1 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 FILE SIZE DISTRIBUITION
172 64 47 65 70 54 69 72 58 70 79 96 105 83 85 98 93 89 99 88 91 98 89 87 87 95 87 75 75 102 78 94 89 94 70 70 2922 101 81 94 58 93 92 102 99 105 93 95 102 108 83 82 103 117 118 122 96 124 101 115 83 115 95 2914 13693 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 PrintMisPredictStats
[Accumulated Stats] right_vertical_total=7336, false_vertical_total=9247, right_horizontal_total=2297667, false_horizontal_total=50471
[Accumulated] Vertical false/(right+false) = 0.557619 (≈ 55.7619%)
[Accumulated] Horizontal false/(right+false) = 0.0214941 (≈ 2.14941%)
minsky@minsky-MS-7E13:~/EZC/data$ 


