minsky@minsky-MS-7E13:~/EZC/data$ cat dbbench_GREEDY_fill_rwrandom2080
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
reset_scheme 1 partial_reset_scheme 1 tuning_point 80 allocation_scheme 2 compaction_scheme 0 input_aware_scheme 0 zc_scheme 0 alpha_value 0.500000 sigma_value 0.000000 disable finish 1 predict_cnt 0
ZenFS::SetResetScheme: r = 1, T = 80, allocation_schme = 2, zc_scheme = 0, finish_scheme = 1, predict_cnt = 0
zbd_->SetResetScheme: r = 1, T = 80, allocation_schme = 2, zc_scheme = 0, finish_scheme = 1, predict_cnt = 0
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
reset_scheme 1 partial_reset_scheme 1 tuning_point 80 allocation_scheme 2 compaction_scheme 0 input_aware_scheme 0 zc_scheme 0 alpha_value 0.500000 sigma_value 0.000000 disable finish 1 predict_cnt 0
ZenFS::SetResetScheme: r = 1, T = 80, allocation_schme = 2, zc_scheme = 0, finish_scheme = 1, predict_cnt = 0
zbd_->SetResetScheme: r = 1, T = 80, allocation_schme = 2, zc_scheme = 0, finish_scheme = 1, predict_cnt = 0
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
0       99      458379  0       0       0       0       0
50      76      12292038        0       0       0       0       19
100     62      21416910        0       0       0       0       47
150     56      29258391        0       0       0       0       84
200     44      37230888        0       0       0       0       115
250     35      44684855        0       0       0       0       148
300     32      51917272        0       0       302     3506    188
350     33      58363797        0       0       2150    18452   228
400     30      64376444        0       0       4794    40180   264
450     29      69945253        0       0       8099    64733   301
500     29      74945507        0       0       11772   88291   336
550     28      79957300        0       0       15924   115370  370
600     30      83713450        0       0       20826   144540  404
650     30      87506415        0       0       26561   175714  435
700     28      91251092        0       0       32618   206507  463
750     27      94971770        0       0       39176   242181  491
800     30      97889214        0       0       46478   278739  521
850     29      100981007       0       0       54060   315862  547
900     28      103682702       0       0       61105   350027  572
950     28      105055434       0       0       69930   391723  595
1000    28      107496349       0       0       78277   429996  620
1050    29      109987066       0       0       86616   472812  646
1100    28      112515678       0       0       94864   513278  670
1150    29      114645651       0       0       103608  554369  695
1200    30      116316383       0       0       112427  597300  718
1250    30      117764790       0       0       121536  639476  740
1300    27      120441266       0       0       129655  678943  763
1350    27      122049550       0       0       138479  721948  785
1400    28      124095588       0       0       148030  764656  808
1450    26      125619991       0       0       157344  806005  829
fillrandom   :      11.638 micros/op 85921 ops/sec 1464.459 seconds 125829120 operations;   85.2 MB/s
Microseconds per write:
Count: 125829120 Average: 11.6385  StdDev: 5813.69
Min: 0  Median: 0.7282  Max: 13768451
Percentiles: P50: 0.73 P75: 1.27 P99: 5.48 P99.9: 1930.92 P99.99: 4660.83
------------------------------------------------------
[       0,       1 ] 86392718  68.659%  68.659% ##############
(       1,       2 ] 29699401  23.603%  92.262% #####
(       2,       3 ]  4801087   3.816%  96.077% #
(       3,       4 ]  2472513   1.965%  98.042%
(       4,       6 ]  1626430   1.293%  99.335%
(       6,      10 ]   435963   0.346%  99.681%
(      10,      15 ]    81231   0.065%  99.746%
(      15,      22 ]    22090   0.018%  99.763%
(      22,      34 ]    13216   0.011%  99.774%
(      34,      51 ]     4612   0.004%  99.778%
(      51,      76 ]     3054   0.002%  99.780%
(      76,     110 ]     2903   0.002%  99.782%
(     110,     170 ]     1918   0.002%  99.784%
(     170,     250 ]      940   0.001%  99.785%
(     250,     380 ]      636   0.001%  99.785%
(     380,     580 ]     5791   0.005%  99.790%
(     580,     870 ]    24612   0.020%  99.809%
(     870,    1300 ]    96695   0.077%  99.886%
(    1300,    1900 ]    14794   0.012%  99.898%
(    1900,    2900 ]    86907   0.069%  99.967%
(    2900,    4400 ]    27610   0.022%  99.989%
(    4400,    6600 ]    11944   0.009%  99.998%
(    6600,    9900 ]     1495   0.001% 100.000%
(    9900,   14000 ]      198   0.000% 100.000%
(   14000,   22000 ]       63   0.000% 100.000%
(   22000,   33000 ]        2   0.000% 100.000%
(   33000,   50000 ]        3   0.000% 100.000%
(   50000,   75000 ]        4   0.000% 100.000%
(   75000,  110000 ]       22   0.000% 100.000%
(  110000,  170000 ]       16   0.000% 100.000%
(  170000,  250000 ]       11   0.000% 100.000%
(  250000,  380000 ]       11   0.000% 100.000%
(  380000,  570000 ]       19   0.000% 100.000%
(  570000,  860000 ]       22   0.000% 100.000%
(  860000, 1200000 ]       14   0.000% 100.000%
( 1200000, 1900000 ]       31   0.000% 100.000%
( 1900000, 2900000 ]       41   0.000% 100.000%
( 2900000, 4300000 ]       47   0.000% 100.000%
( 4300000, 6500000 ]       29   0.000% 100.000%
( 6500000, 9800000 ]       18   0.000% 100.000%
( 9800000, 14000000 ]        9   0.000% 100.000%

DB path: [rocksdbtest/dbbench]
1500    27      125890560       15361   0       166142  845888  850
1550    29      126006720       44401   0       175104  888654  873
1600    29      126170800       85433   0       182969  926397  895
1650    30      126750633       230380  0       184693  933613  901
1700    29      127334480       376355  0       186453  941164  907
1750    26      127986560       539377  0       186611  941920  909
1800    28      128549760       680164  0       188751  951004  918
1850    27      129120960       822963  0       190655  959275  925
1900    28      129636000       951731  0       193610  970667  933
1950    29      130184400       1088825 0       195951  981706  941
2000    28      130769862       1235200 0       197370  987819  946
2050    28      131314480       1371360 0       199541  995585  953
2100    28      131832240       1500787 0       202974  1011499 962
2150    29      132362880       1633456 0       205379  1021868 970
2200    28      132883360       1763571 0       207769  1032023 976
2250    29      133367920       1884715 0       211505  1047565 985
2300    29      133852640       2005891 0       214818  1061186 993
2350    27      134368000       2134727 0       216992  1069881 998
2400    28      134899280       2267546 0       219276  1079417 1005
2450    28      135393120       2391012 0       222118  1090824 1012
2500    27      135858880       2507459 0       225835  1105954 1020
2550    28      136324640       2623884 0       229914  1122890 1029
2600    28      136786960       2739473 0       234154  1139536 1037
2650    29      137169840       2835199 0       239184  1160984 1047
2700    28      137610960       2945471 0       243716  1177725 1055
2750    28      138104480       3068846 0       247182  1194583 1063
2800    28      138595040       3191491 0       249930  1204460 1070
2850    28      139076480       3311850 0       253700  1221663 1078
2900    30      139479520       3412617 0       258630  1241786 1087
2950    27      140000769       3542920 0       260538  1249409 1091
3000    29      140433360       3651063 0       265134  1268416 1102
3050    28      140926960       3774471 0       267759  1279552 1108
3100    27      141441760       3903177 0       270062  1289723 1114
3150    27      141914320       4021309 0       273017  1302424 1121
3200    29      142351120       4130511 0       277198  1319462 1131
3250    28      142819360       4247571 0       281054  1335371 1139
3300    28      143264880       4358952 0       284493  1347198 1145
3350    28      143708720       4469920 0       288144  1364035 1153
3400    28      144124880       4573960 0       292486  1381008 1161
3450    27      144621440       4698086 0       295726  1395394 1168
3500    27      145078240       4812298 0       299763  1412392 1177
3550    27      145570837       4935440 0       302457  1423732 1183
3600    27      145992160       5040771 0       307594  1442582 1192
3650    28      146423280       5148550 0       312241  1462787 1201
3700    27      146880240       5262796 0       315729  1477615 1208
3750    28      147281280       5363048 0       321149  1499616 1218
3800    28      147736160       5476766 0       324390  1512224 1225
3850    28      148167520       5584612 0       328427  1530042 1233
3900    29      148567040       5684486 0       333784  1552123 1243
3950    27      149056400       5806828 0       336612  1564142 1249
4000    28      149489280       5915057 0       340289  1578327 1256
4050    28      149891841       6015700 0       344751  1598343 1265
4100    27      150379520       6137601 0       347710  1610912 1271
4150    27      150809680       6245152 0       351665  1626773 1280
4200    27      151223680       6348648 0       355930  1643360 1287
4250    29      151627840       6449689 0       361499  1668208 1298
4300    27      152115680       6571656 0       364086  1679119 1303
4350    27      152520960       6672980 0       368795  1697936 1312
4400    28      152944880       6778957 0       372792  1715102 1320
4450    28      153313840       6871190 0       378052  1736585 1329
4500    28      153716000       6971728 0       382866  1753022 1337
4550    28      154171840       7085699 0       386892  1772377 1345
4600    28      154553680       7181157 0       391862  1792867 1354
4650    29      154971840       7285699 0       397239  1815837 1363
4700    26      155459600       7407638 0       399976  1825124 1368
4750    27      155865520       7509106 0       404283  1843748 1377
4800    28      156294560       7616374 0       408769  1862811 1386
4850    28      156677670       7712140 0       413870  1884019 1394
4900    27      157098640       7817389 0       417885  1900870 1401
4950    27      157514640       7921400 0       422441  1917614 1410
5000    29      157950480       8030355 0       427234  1940044 1419
5050    28      158428400       8149836 0       430342  1953468 1425
5100    28      158789600       8240134 0       436338  1977691 1436
5150    27      159196720       8341917 0       440252  1992942 1442
5200    27      159600640       8442900 0       445193  2013158 1451
5250    27      159998860       8542440 0       450297  2033256 1459
5300    27      160397920       8642217 0       455145  2054110 1467
5350    28      160690080       8715257 0       461800  2078250 1477
5400    27      161134880       8826458 0       465097  2093942 1483
5450    26      161519920       8922713 0       470005  2113928 1492
5500    28      161941360       9028061 0       474511  2131704 1501
5550    27      162368160       9134770 0       478791  2148856 1508
5600    29      162703840       9218682 0       485116  2174959 1519
5650    28      163118400       9322329 0       490779  2198809 1528
5700    28      163474000       9411222 0       496356  2219747 1536
5750    27      163871120       9510513 0       500774  2238310 1543
5800    27      164263680       9608646 0       505624  2257857 1552
5850    28      164657680       9707142 0       510194  2277297 1560
5900    27      164982880       9788444 0       517067  2302568 1570
5950    28      165381200       9888025 0       521319  2322347 1578
6000    28      165745520       9979108 0       526643  2343852 1587
6050    27      166171545       10085620        0       530278  2357781 1593
6100    28      166545840       10179184        0       535974  2382251 1603
6150    27      166919280       10272548        0       540533  2399190 1609
6200    27      167300240       10367799        0       545188  2419249 1617
6250    27      167665360       10459078        0       550957  2440431 1626
6300    27      167993680       10541151        0       556855  2464421 1635
6350    28      168343577       10628620        0       561975  2486615 1643
6400    27      168662320       10708302        0       568158  2508875 1652
6450    28      169006720       10794401        0       574523  2536723 1662
6500    27      169409760       10895170        0       578395  2552563 1668
6550    28      169816720       10996907        0       583094  2572157 1677
6600    28      170140720       11077906        0       589924  2600042 1687
6650    28      170525760       11174178        0       594764  2618037 1695
6700    28      170900560       11267869        0       600124  2640706 1703
6750    26      171209394       11345080        0       606295  2662931 1711
6800    27      171557600       11432129        0       611590  2687497 1719
6850    27      171925520       11524118        0       617515  2713012 1729
6900    26      172332000       11625726        0       621591  2727578 1735
6950    28      172649120       11705001        0       627611  2753203 1745
7000    27      173018160       11797276        0       632385  2772953 1753
7050    27      173408560       11894868        0       637741  2794694 1761
7100    28      173690080       11965252        0       644414  2821259 1771
7150    27      174013520       12046116        0       650535  2844856 1780
7200    26      174393200       12141023        0       655019  2860737 1786
7250    27      174760480       12232859        0       661327  2889944 1797
7300    27      175140240       12327782        0       666845  2912200 1805
7350    27      175436320       12401820        0       673832  2940710 1815
7400    28      175851120       12505513        0       679883  2967323 1824
7450    26      176135600       12576632        0       687417  2995513 1833
readrandomwriterandom :      95.354 micros/op 10487 ops/sec 5999.158 seconds 62914560 operations; ( reads:12582920 writes:50331640 total:125829120 found:8770054)
Microseconds per read:
Count: 12582920 Average: 439.5028  StdDev: 22861.48
Min: 0  Median: 304.1344  Max: 12089411
Percentiles: P50: 304.13 P75: 384.84 P99: 1009.80 P99.9: 1567.87 P99.99: 2568.71
------------------------------------------------------
[       0,       1 ]      374   0.003%   0.003%
(       1,       2 ]      593   0.005%   0.008%
(       2,       3 ]      563   0.004%   0.012%
(       3,       4 ]     1203   0.010%   0.022%
(       4,       6 ]     3551   0.028%   0.050%
(       6,      10 ]     9605   0.076%   0.126%
(      10,      15 ]    15208   0.121%   0.247%
(      15,      22 ]    19515   0.155%   0.402%
(      22,      34 ]    22492   0.179%   0.581%
(      34,      51 ]    36381   0.289%   0.870%
(      51,      76 ]    59549   0.473%   1.343%
(      76,     110 ]   266224   2.116%   3.459%
(     110,     170 ]  1132706   9.002%  12.461% ##
(     170,     250 ]  2521369  20.038%  32.499% ####
(     250,     380 ]  5288258  42.027%  74.526% ########
(     380,     580 ]  2463858  19.581%  94.107% ####
(     580,     870 ]   565061   4.491%  98.598% #
(     870,    1300 ]   155583   1.236%  99.834%
(    1300,    1900 ]    18466   0.147%  99.981%
(    1900,    2900 ]     1649   0.013%  99.994%
(    2900,    4400 ]       81   0.001%  99.995%
(    4400,    6600 ]        1   0.000%  99.995%
(    6600,    9900 ]        1   0.000%  99.995%
(   22000,   33000 ]        4   0.000%  99.995%
(   33000,   50000 ]       28   0.000%  99.995%
(   50000,   75000 ]       91   0.001%  99.996%
(   75000,  110000 ]        6   0.000%  99.996%
(  110000,  170000 ]       11   0.000%  99.996%
(  170000,  250000 ]        1   0.000%  99.996%
(  250000,  380000 ]        9   0.000%  99.996%
(  380000,  570000 ]       13   0.000%  99.996%
(  570000,  860000 ]       15   0.000%  99.996%
(  860000, 1200000 ]       49   0.000%  99.997%
( 1200000, 1900000 ]      114   0.001%  99.998%
( 1900000, 2900000 ]       96   0.001%  99.998%
( 2900000, 4300000 ]       82   0.001%  99.999%
( 4300000, 6500000 ]       68   0.001% 100.000%
( 6500000, 9800000 ]       36   0.000% 100.000%
( 9800000, 14000000 ]        6   0.000% 100.000%

Microseconds per write:
Count: 50331640 Average: 9.3168  StdDev: 3802.47
Min: 0  Median: 4.5952  Max: 8052794
Percentiles: P50: 4.60 P75: 5.79 P99: 13.58 P99.9: 409.19 P99.99: 865.81
------------------------------------------------------
[       0,       1 ]  7056478  14.020%  14.020% ###
(       1,       2 ]  7607630  15.115%  29.135% ###
(       2,       3 ]  1917238   3.809%  32.944% #
(       3,       4 ]  2322810   4.615%  37.559% #
(       4,       6 ] 21040239  41.803%  79.362% ########
(       6,      10 ]  9059438  17.999%  97.362% ####
(      10,      15 ]  1149941   2.285%  99.647%
(      15,      22 ]    94590   0.188%  99.835%
(      22,      34 ]    25142   0.050%  99.884%
(      34,      51 ]     4736   0.009%  99.894%
(      51,      76 ]      566   0.001%  99.895%
(      76,     110 ]      440   0.001%  99.896%
(     110,     170 ]      361   0.001%  99.897%
(     170,     250 ]      538   0.001%  99.898%
(     250,     380 ]      377   0.001%  99.898%
(     380,     580 ]     5374   0.011%  99.909%
(     580,     870 ]    41306   0.082%  99.991%
(     870,    1300 ]     2424   0.005%  99.996%
(    1300,    1900 ]     1093   0.002%  99.998%
(    1900,    2900 ]      339   0.001%  99.999%
(    2900,    4400 ]      394   0.001% 100.000%
(    4400,    6600 ]       86   0.000% 100.000%
(    6600,    9900 ]        9   0.000% 100.000%
(   75000,  110000 ]        1   0.000% 100.000%
(  110000,  170000 ]        9   0.000% 100.000%
(  170000,  250000 ]       10   0.000% 100.000%
(  250000,  380000 ]        7   0.000% 100.000%
(  570000,  860000 ]        3   0.000% 100.000%
(  860000, 1200000 ]       10   0.000% 100.000%
( 1200000, 1900000 ]       11   0.000% 100.000%
( 1900000, 2900000 ]       12   0.000% 100.000%
( 2900000, 4300000 ]       15   0.000% 100.000%
( 4300000, 6500000 ]       10   0.000% 100.000%
( 6500000, 9800000 ]        3   0.000% 100.000%

STATISTICS:
rocksdb.block.cache.miss COUNT : 519291921
rocksdb.block.cache.hit COUNT : 20370605
rocksdb.block.cache.add COUNT : 47685883
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
rocksdb.block.cache.data.miss COUNT : 519291922
rocksdb.block.cache.data.hit COUNT : 20370605
rocksdb.block.cache.data.add COUNT : 47685883
rocksdb.block.cache.data.bytes.insert COUNT : 203714856992
rocksdb.block.cache.bytes.read COUNT : 87023625072
rocksdb.block.cache.bytes.write COUNT : 203714856992
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
rocksdb.l0.hit COUNT : 10074
rocksdb.l1.hit COUNT : 41971
rocksdb.l2andup.hit COUNT : 8714573
rocksdb.compaction.key.drop.new COUNT : 59748171
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
rocksdb.no.file.opens COUNT : 22464
rocksdb.no.file.errors COUNT : 0
rocksdb.l0.slowdown.micros COUNT : 0
rocksdb.memtable.compaction.micros COUNT : 0
rocksdb.l0.num.files.stall.micros COUNT : 0
rocksdb.stall.micros COUNT : 464579894
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
rocksdb.compact.read.bytes COUNT : 1153651068175
rocksdb.compact.write.bytes COUNT : 1136009799596
rocksdb.flush.write.bytes COUNT : 107999877207
rocksdb.compact.read.marked.bytes COUNT : 0
rocksdb.compact.read.periodic.bytes COUNT : 0
rocksdb.compact.read.ttl.bytes COUNT : 0
rocksdb.compact.write.marked.bytes COUNT : 0
rocksdb.compact.write.periodic.bytes COUNT : 0
rocksdb.compact.write.ttl.bytes COUNT : 0
rocksdb.number.direct.load.table.properties COUNT : 0
rocksdb.number.superversion_acquires COUNT : 3638
rocksdb.number.superversion_releases COUNT : 2630
rocksdb.number.superversion_cleanups COUNT : 2615
rocksdb.number.block.compressed COUNT : 508478064
rocksdb.number.block.decompressed COUNT : 519314375
rocksdb.number.block.not_compressed COUNT : 12
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
rocksdb.files.deleted.immediately COUNT : 24135
rocksdb.error.handler.bg.errro.count COUNT : 0
rocksdb.error.handler.bg.io.errro.count COUNT : 0
rocksdb.error.handler.bg.retryable.io.errro.count COUNT : 0
rocksdb.error.handler.autoresume.count COUNT : 0
rocksdb.error.handler.autoresume.retry.total.count COUNT : 0
rocksdb.error.handler.autoresume.success.count COUNT : 0
rocksdb.memtable.payload.bytes.at.flush COUNT : 184583797744
rocksdb.memtable.garbage.bytes.at.flush COUNT : 45649832
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
rocksdb.non.last.level.read.bytes COUNT : 1271551377511
rocksdb.non.last.level.read.count COUNT : 519381780
rocksdb.block.checksum.compute.count COUNT : 519336852
rocksdb.multiget.coroutine.count COUNT : 0
rocksdb.db.get.micros P50 : 303.360416 P95 : 636.650636 P99 : 1008.769035 P100 : 12089408.000000 COUNT : 12582920 SUM : 5522977876
rocksdb.db.write.micros P50 : 0.824821 P95 : 5.662704 P99 : 9.386203 P100 : 13768449.000000 COUNT : 176160760 SUM : 1875585501
rocksdb.compaction.times.micros P50 : 1492544.459644 P95 : 2807816.711590 P99 : 3538234.000000 P100 : 3538234.000000 COUNT : 3388 SUM : 5136726399
rocksdb.compaction.times.cpu_micros P50 : 728384.615385 P95 : 1570354.609929 P99 : 5627702.000000 P100 : 5627702.000000 COUNT : 3388 SUM : 2887974416
rocksdb.subcompaction.setup.times.micros P50 : 364.805195 P95 : 1085.000000 P99 : 1790.000000 P100 : 2994.000000 COUNT : 310 SUM : 131742
rocksdb.table.sync.micros P50 : 72525.107604 P95 : 179109.489051 P99 : 245164.963504 P100 : 567661.000000 COUNT : 2828 SUM : 245878081
rocksdb.compaction.outfile.sync.micros P50 : 112070.030896 P95 : 484617.283951 P99 : 558327.901235 P100 : 821783.000000 COUNT : 19640 SUM : 3164135996
rocksdb.wal.file.sync.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.manifest.file.sync.micros P50 : 82.541304 P95 : 244.346420 P99 : 982.516667 P100 : 12209.000000 COUNT : 6672 SUM : 876472
rocksdb.table.open.io.micros P50 : 1659.640584 P95 : 3694.196429 P99 : 5065.530055 P100 : 75402.000000 COUNT : 22464 SUM : 42213780
rocksdb.db.multiget.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.read.block.compaction.micros P50 : 0.820684 P95 : 1.991323 P99 : 31.309560 P100 : 117573.000000 COUNT : 471606069 SUM : 1831958996
rocksdb.read.block.get.micros P50 : 84.825634 P95 : 196.790923 P99 : 356.892041 P100 : 73706.000000 COUNT : 47708347 SUM : 3767284873
rocksdb.write.raw.block.micros P50 : 0.501649 P95 : 0.953133 P99 : 0.993265 P100 : 816.000000 COUNT : 508523045 SUM : 160102833
rocksdb.l0.slowdown.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.memtable.compaction.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.files.stall.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.hard.rate.limit.delay.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.soft.rate.limit.delay.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.numfiles.in.singlecompaction P50 : 3.504032 P95 : 9.783368 P99 : 43.318925 P100 : 47.000000 COUNT : 4202 SUM : 22128
rocksdb.db.seek.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.db.write.stall P50 : 0.536753 P95 : 1087.712173 P99 : 2589.370951 P100 : 13768425.000000 COUNT : 2088504 SUM : 464642599
rocksdb.sst.read.micros P50 : 0.572986 P95 : 86.011862 P99 : 168.044324 P100 : 117528.000000 COUNT : 519381836 SUM : 5148955429
rocksdb.num.subcompactions.scheduled P50 : 5.304348 P95 : 8.000000 P99 : 8.000000 P100 : 8.000000 COUNT : 310 SUM : 1740
rocksdb.bytes.per.read P50 : 991.526666 P95 : 1024.000000 P99 : 1024.000000 P100 : 1024.000000 COUNT : 12582920 SUM : 8980535296
rocksdb.bytes.per.write P50 : 1056.000000 P95 : 1056.000000 P99 : 1056.000000 P100 : 1056.000000 COUNT : 176160760 SUM : 186025762560
rocksdb.bytes.per.multiget P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.bytes.compressed P50 : 3650.006033 P95 : 4325.059888 P99 : 4385.064676 P100 : 553925.000000 COUNT : 508478124 SUM : 2143238678740
rocksdb.bytes.decompressed P50 : 3650.006502 P95 : 4325.058688 P99 : 4385.063326 P100 : 553925.000000 COUNT : 519314437 SUM : 2188730952022
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
rocksdb.db.flush.micros P50 : 152268.041237 P95 : 248197.894737 P99 : 360403.703704 P100 : 4386429.000000 COUNT : 2828 SUM : 470225894
rocksdb.sst.batch.size P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.index.and.filter.blocks.read.per.level P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.data.blocks.read.per.level P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.sst.read.per.level P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.error.handler.autoresume.retry.count P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.async.read.bytes P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.poll.wait.micros P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.prefetched.bytes.discarded P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 36864 SUM : 0
rocksdb.multiget.io.batch.size P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0
rocksdb.num.level.read.per.multiget P50 : 0.000000 P95 : 0.000000 P99 : 0.000000 P100 : 0.000000 COUNT : 0 SUM : 0

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
7462    28      176160760       12582920        0       689981  3009513 1837
GetTotalBytesWritten :: 2156502691840
UserByteWritten : 1433004233160
FAR STAT :: WA_zc (mb) : 689981
@@~Zenfs Last Free percent freepercent 28
SEQUENCE OVER SEQ_DIST_MAX : 6426SEQUENCE OVER SEQ_DIST_MAX : 5078SEQUENCE OVER SEQ_DIST_MAX : 5098SEQUENCE OVER SEQ_DIST_MAX : 5509SEQUENCE OVER SEQ_DIST_MAX : 5195SEQUENCE OVER SEQ_DIST_MAX : 5124zone size at ~ 1077
============================================================
WWP (MB) : 1712430, R_wp : 13
NEW WWP(MB) : 1712430
Runtime zone reset R_wp 13
ZONE FINISH VALID(MB) 0
ZONE FINISH WWP(MB) : 0
ZC IO Blocking time : 0
============================================================
[1] :: 253 ~ 254, 634 ms, 53 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[2] :: 254 ~ 254, 706 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[3] :: 296 ~ 296, 232 ms, 12 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[4] :: 296 ~ 297, 625 ms, 43 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[5] :: 297 ~ 297, 771 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[6] :: 297 ~ 298, 538 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[7] :: 306 ~ 307, 585 ms, 45 (MB), Reclaimed Zone : 1, ZLV: 0.707714
[8] :: 311 ~ 311, 586 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[9] :: 311 ~ 312, 386 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.095238
[10] :: 312 ~ 312, 357 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[11] :: 312 ~ 312, 288 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[12] :: 315 ~ 316, 988 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[13] :: 316 ~ 316, 661 ms, 54 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[14] :: 324 ~ 325, 704 ms, 48 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[15] :: 325 ~ 326, 1015 ms, 79 (MB), Reclaimed Zone : 1, ZLV: 0.802469
[16] :: 327 ~ 328, 556 ms, 70 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[17] :: 331 ~ 332, 561 ms, 75 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[18] :: 333 ~ 333, 375 ms, 22 (MB), Reclaimed Zone : 1, ZLV: 0.043478
[19] :: 333 ~ 334, 968 ms, 90 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[20] :: 335 ~ 335, 892 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[21] :: 341 ~ 342, 511 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[22] :: 342 ~ 342, 348 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[23] :: 342 ~ 343, 973 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[24] :: 343 ~ 344, 829 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.078704
[25] :: 344 ~ 345, 889 ms, 106 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[26] :: 345 ~ 346, 475 ms, 114 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[27] :: 346 ~ 346, 520 ms, 119 (MB), Reclaimed Zone : 1, ZLV: 0.662997
[28] :: 346 ~ 347, 490 ms, 124 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[29] :: 347 ~ 347, 512 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.365756
[30] :: 347 ~ 348, 477 ms, 125 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[31] :: 355 ~ 356, 905 ms, 71 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[32] :: 356 ~ 357, 508 ms, 92 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[33] :: 359 ~ 359, 99 ms, 3 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[34] :: 360 ~ 360, 122 ms, 6 (MB), Reclaimed Zone : 1, ZLV: 0.762589
[35] :: 360 ~ 360, 177 ms, 23 (MB), Reclaimed Zone : 1, ZLV: 0.375000
[36] :: 362 ~ 363, 573 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[37] :: 363 ~ 363, 416 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[38] :: 364 ~ 364, 944 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[39] :: 364 ~ 365, 723 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.327586
[40] :: 365 ~ 366, 673 ms, 74 (MB), Reclaimed Zone : 1, ZLV: 0.453735
[41] :: 372 ~ 373, 951 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[42] :: 373 ~ 374, 929 ms, 71 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[43] :: 374 ~ 375, 770 ms, 98 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[44] :: 375 ~ 375, 515 ms, 114 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[45] :: 375 ~ 376, 496 ms, 116 (MB), Reclaimed Zone : 1, ZLV: 0.683797
[46] :: 376 ~ 377, 490 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[47] :: 377 ~ 377, 229 ms, 22 (MB), Reclaimed Zone : 1, ZLV: 0.709677
[48] :: 377 ~ 378, 459 ms, 80 (MB), Reclaimed Zone : 1, ZLV: 0.360740
[49] :: 382 ~ 383, 941 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.064000
[50] :: 383 ~ 384, 787 ms, 56 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[51] :: 384 ~ 385, 1011 ms, 116 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[52] :: 385 ~ 385, 513 ms, 118 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[53] :: 388 ~ 388, 579 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[54] :: 388 ~ 389, 730 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[55] :: 389 ~ 389, 520 ms, 121 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[56] :: 391 ~ 392, 973 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.500000
[57] :: 392 ~ 393, 609 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[58] :: 393 ~ 394, 945 ms, 125 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[59] :: 394 ~ 396, 1844 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[60] :: 396 ~ 397, 980 ms, 133 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[61] :: 397 ~ 397, 621 ms, 143 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[62] :: 399 ~ 399, 696 ms, 89 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[63] :: 400 ~ 401, 661 ms, 94 (MB), Reclaimed Zone : 1, ZLV: 0.123663
[64] :: 403 ~ 404, 689 ms, 110 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[65] :: 404 ~ 405, 781 ms, 51 (MB), Reclaimed Zone : 1, ZLV: 0.317857
[66] :: 405 ~ 406, 1090 ms, 82 (MB), Reclaimed Zone : 1, ZLV: 0.813393
[67] :: 406 ~ 407, 819 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[68] :: 407 ~ 407, 501 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[69] :: 408 ~ 409, 887 ms, 120 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[70] :: 409 ~ 410, 416 ms, 49 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[71] :: 410 ~ 411, 673 ms, 99 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[72] :: 412 ~ 413, 916 ms, 114 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[73] :: 415 ~ 415, 735 ms, 118 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[74] :: 416 ~ 417, 965 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.177318
[75] :: 417 ~ 418, 1312 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.267606
[76] :: 418 ~ 419, 622 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.504166
[77] :: 419 ~ 419, 543 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[78] :: 420 ~ 420, 514 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[79] :: 421 ~ 422, 540 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[80] :: 427 ~ 428, 1135 ms, 75 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[81] :: 428 ~ 429, 1293 ms, 125 (MB), Reclaimed Zone : 1, ZLV: 0.687227
[82] :: 429 ~ 430, 575 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[83] :: 430 ~ 431, 984 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[84] :: 431 ~ 432, 589 ms, 142 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[85] :: 432 ~ 433, 618 ms, 150 (MB), Reclaimed Zone : 1, ZLV: 0.369675
[86] :: 436 ~ 437, 407 ms, 42 (MB), Reclaimed Zone : 1, ZLV: 0.306915
[87] :: 437 ~ 437, 382 ms, 52 (MB), Reclaimed Zone : 1, ZLV: 0.388017
[88] :: 438 ~ 439, 991 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[89] :: 439 ~ 439, 854 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.073826
[90] :: 439 ~ 440, 955 ms, 114 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[91] :: 440 ~ 441, 541 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.321966
[92] :: 441 ~ 441, 541 ms, 131 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[93] :: 441 ~ 442, 598 ms, 147 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[94] :: 442 ~ 442, 166 ms, 11 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[95] :: 443 ~ 444, 220 ms, 33 (MB), Reclaimed Zone : 1, ZLV: 0.277778
[96] :: 449 ~ 450, 1040 ms, 84 (MB), Reclaimed Zone : 1, ZLV: 0.749082
[97] :: 451 ~ 452, 593 ms, 44 (MB), Reclaimed Zone : 1, ZLV: 0.587407
[98] :: 452 ~ 452, 707 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[99] :: 453 ~ 454, 867 ms, 160 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[100] :: 454 ~ 455, 601 ms, 153 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[101] :: 455 ~ 456, 1242 ms, 169 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[102] :: 456 ~ 457, 820 ms, 177 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[103] :: 462 ~ 464, 1801 ms, 163 (MB), Reclaimed Zone : 1, ZLV: 0.215540
[104] :: 464 ~ 465, 1044 ms, 176 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[105] :: 465 ~ 466, 747 ms, 180 (MB), Reclaimed Zone : 1, ZLV: 0.642857
[106] :: 466 ~ 466, 770 ms, 185 (MB), Reclaimed Zone : 1, ZLV: 0.435425
[107] :: 467 ~ 467, 385 ms, 45 (MB), Reclaimed Zone : 1, ZLV: 0.894388
[108] :: 467 ~ 468, 691 ms, 101 (MB), Reclaimed Zone : 1, ZLV: 0.359223
[109] :: 471 ~ 472, 576 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.340768
[110] :: 473 ~ 474, 718 ms, 119 (MB), Reclaimed Zone : 1, ZLV: 0.818377
[111] :: 474 ~ 475, 898 ms, 160 (MB), Reclaimed Zone : 1, ZLV: 0.601227
[112] :: 475 ~ 475, 15 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[113] :: 475 ~ 477, 2128 ms, 144 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[114] :: 477 ~ 478, 842 ms, 143 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[115] :: 478 ~ 479, 571 ms, 143 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[116] :: 479 ~ 479, 717 ms, 178 (MB), Reclaimed Zone : 1, ZLV: 0.710412
[117] :: 479 ~ 480, 700 ms, 174 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[118] :: 481 ~ 481, 48 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.166667
[119] :: 487 ~ 488, 958 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.165625
[120] :: 488 ~ 489, 1336 ms, 120 (MB), Reclaimed Zone : 1, ZLV: 0.700307
[121] :: 489 ~ 490, 629 ms, 120 (MB), Reclaimed Zone : 1, ZLV: 0.097534
[122] :: 490 ~ 490, 567 ms, 135 (MB), Reclaimed Zone : 1, ZLV: 0.628086
[123] :: 490 ~ 491, 640 ms, 160 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[124] :: 496 ~ 497, 510 ms, 62 (MB), Reclaimed Zone : 1, ZLV: 0.169645
[125] :: 497 ~ 498, 480 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.448194
[126] :: 498 ~ 499, 957 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.262346
[127] :: 499 ~ 501, 1637 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[128] :: 501 ~ 501, 570 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.543845
[129] :: 501 ~ 502, 579 ms, 141 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[130] :: 503 ~ 504, 771 ms, 118 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[131] :: 505 ~ 506, 528 ms, 84 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[132] :: 510 ~ 512, 1226 ms, 95 (MB), Reclaimed Zone : 1, ZLV: 0.282609
[133] :: 512 ~ 513, 1396 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.245455
[134] :: 513 ~ 514, 738 ms, 162 (MB), Reclaimed Zone : 1, ZLV: 0.603659
[135] :: 514 ~ 515, 693 ms, 170 (MB), Reclaimed Zone : 1, ZLV: 0.412862
[136] :: 515 ~ 516, 677 ms, 84 (MB), Reclaimed Zone : 1, ZLV: 0.081395
[137] :: 516 ~ 517, 1095 ms, 182 (MB), Reclaimed Zone : 1, ZLV: 0.190568
[138] :: 517 ~ 517, 747 ms, 182 (MB), Reclaimed Zone : 1, ZLV: 0.497276
[139] :: 518 ~ 518, 508 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[140] :: 523 ~ 523, 664 ms, 80 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[141] :: 523 ~ 524, 674 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[142] :: 524 ~ 525, 938 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.242515
[143] :: 525 ~ 526, 1019 ms, 68 (MB), Reclaimed Zone : 1, ZLV: 0.340016
[144] :: 526 ~ 527, 1109 ms, 169 (MB), Reclaimed Zone : 1, ZLV: 0.408533
[145] :: 527 ~ 528, 782 ms, 186 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[146] :: 528 ~ 529, 808 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[147] :: 529 ~ 530, 707 ms, 93 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[148] :: 530 ~ 531, 1068 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.364560
[149] :: 531 ~ 532, 779 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[150] :: 537 ~ 538, 400 ms, 56 (MB), Reclaimed Zone : 1, ZLV: 0.066730
[151] :: 538 ~ 539, 1078 ms, 71 (MB), Reclaimed Zone : 1, ZLV: 0.265016
[152] :: 539 ~ 541, 1236 ms, 96 (MB), Reclaimed Zone : 1, ZLV: 0.341792
[153] :: 541 ~ 541, 654 ms, 106 (MB), Reclaimed Zone : 1, ZLV: 0.465228
[154] :: 541 ~ 542, 543 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[155] :: 542 ~ 542, 573 ms, 139 (MB), Reclaimed Zone : 1, ZLV: 0.893517
[156] :: 542 ~ 543, 769 ms, 179 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[157] :: 543 ~ 545, 1306 ms, 196 (MB), Reclaimed Zone : 1, ZLV: 0.899497
[158] :: 545 ~ 546, 807 ms, 196 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[159] :: 551 ~ 551, 56 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.605831
[160] :: 552 ~ 552, 564 ms, 83 (MB), Reclaimed Zone : 1, ZLV: 0.286632
[161] :: 552 ~ 553, 751 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[162] :: 553 ~ 554, 1067 ms, 90 (MB), Reclaimed Zone : 1, ZLV: 0.102939
[163] :: 554 ~ 555, 1219 ms, 170 (MB), Reclaimed Zone : 1, ZLV: 0.211368
[164] :: 555 ~ 556, 738 ms, 176 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[165] :: 558 ~ 558, 944 ms, 175 (MB), Reclaimed Zone : 1, ZLV: 0.307070
[166] :: 558 ~ 559, 824 ms, 196 (MB), Reclaimed Zone : 1, ZLV: 0.549702
[167] :: 559 ~ 560, 820 ms, 211 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[168] :: 566 ~ 566, 779 ms, 110 (MB), Reclaimed Zone : 1, ZLV: 0.688791
[169] :: 567 ~ 568, 1454 ms, 99 (MB), Reclaimed Zone : 1, ZLV: 0.401699
[170] :: 568 ~ 570, 1449 ms, 136 (MB), Reclaimed Zone : 1, ZLV: 0.322050
[171] :: 570 ~ 570, 579 ms, 137 (MB), Reclaimed Zone : 1, ZLV: 0.372072
[172] :: 570 ~ 571, 682 ms, 172 (MB), Reclaimed Zone : 1, ZLV: 0.562231
[173] :: 571 ~ 572, 901 ms, 218 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[174] :: 572 ~ 573, 985 ms, 246 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[175] :: 573 ~ 574, 1359 ms, 192 (MB), Reclaimed Zone : 1, ZLV: 0.494181
[176] :: 574 ~ 575, 950 ms, 243 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[177] :: 580 ~ 581, 1063 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.666314
[178] :: 581 ~ 582, 789 ms, 198 (MB), Reclaimed Zone : 1, ZLV: 0.286530
[179] :: 583 ~ 585, 2761 ms, 251 (MB), Reclaimed Zone : 1, ZLV: 0.825593
[180] :: 585 ~ 586, 1033 ms, 251 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[181] :: 586 ~ 587, 983 ms, 258 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[182] :: 587 ~ 588, 1014 ms, 266 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[183] :: 589 ~ 590, 570 ms, 65 (MB), Reclaimed Zone : 1, ZLV: 0.028966
[184] :: 590 ~ 590, 253 ms, 22 (MB), Reclaimed Zone : 1, ZLV: 0.296875
[185] :: 590 ~ 591, 780 ms, 131 (MB), Reclaimed Zone : 1, ZLV: 0.455005
[186] :: 596 ~ 597, 939 ms, 63 (MB), Reclaimed Zone : 1, ZLV: 0.358382
[187] :: 597 ~ 598, 961 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.153179
[188] :: 598 ~ 599, 711 ms, 74 (MB), Reclaimed Zone : 1, ZLV: 0.203100
[189] :: 599 ~ 600, 598 ms, 125 (MB), Reclaimed Zone : 1, ZLV: 0.166976
[190] :: 600 ~ 600, 594 ms, 142 (MB), Reclaimed Zone : 1, ZLV: 0.492999
[191] :: 600 ~ 601, 1042 ms, 272 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[192] :: 601 ~ 602, 1174 ms, 296 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[193] :: 603 ~ 604, 1564 ms, 244 (MB), Reclaimed Zone : 1, ZLV: 0.736842
[194] :: 604 ~ 605, 1017 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[195] :: 606 ~ 606, 219 ms, 17 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[196] :: 613 ~ 614, 1499 ms, 131 (MB), Reclaimed Zone : 1, ZLV: 0.007324
[197] :: 614 ~ 615, 1103 ms, 132 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[198] :: 615 ~ 616, 746 ms, 187 (MB), Reclaimed Zone : 1, ZLV: 0.700654
[199] :: 616 ~ 617, 970 ms, 246 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[200] :: 617 ~ 618, 1068 ms, 262 (MB), Reclaimed Zone : 1, ZLV: 0.891726
[201] :: 618 ~ 619, 1111 ms, 277 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[202] :: 620 ~ 621, 1519 ms, 234 (MB), Reclaimed Zone : 1, ZLV: 0.542898
[203] :: 621 ~ 622, 1068 ms, 260 (MB), Reclaimed Zone : 1, ZLV: 0.461674
[204] :: 622 ~ 623, 1154 ms, 297 (MB), Reclaimed Zone : 1, ZLV: 0.784768
[205] :: 628 ~ 628, 698 ms, 109 (MB), Reclaimed Zone : 1, ZLV: 0.277321
[206] :: 629 ~ 630, 965 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.140805
[207] :: 630 ~ 632, 1626 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.646552
[208] :: 632 ~ 633, 833 ms, 192 (MB), Reclaimed Zone : 1, ZLV: 0.415157
[209] :: 633 ~ 634, 819 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.400861
[210] :: 637 ~ 638, 837 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[211] :: 638 ~ 638, 712 ms, 144 (MB), Reclaimed Zone : 1, ZLV: 0.405348
[212] :: 639 ~ 641, 1408 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[213] :: 642 ~ 643, 1266 ms, 205 (MB), Reclaimed Zone : 1, ZLV: 0.214485
[214] :: 643 ~ 646, 2460 ms, 200 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[215] :: 646 ~ 647, 1157 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.587371
[216] :: 647 ~ 648, 998 ms, 256 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[217] :: 648 ~ 649, 1039 ms, 260 (MB), Reclaimed Zone : 1, ZLV: 0.825889
[218] :: 649 ~ 650, 1102 ms, 287 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[219] :: 650 ~ 651, 1134 ms, 300 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[220] :: 652 ~ 654, 1847 ms, 309 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[221] :: 654 ~ 655, 1217 ms, 307 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[222] :: 655 ~ 656, 801 ms, 110 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[223] :: 661 ~ 662, 1062 ms, 191 (MB), Reclaimed Zone : 1, ZLV: 0.206935
[224] :: 662 ~ 663, 855 ms, 214 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[225] :: 663 ~ 664, 1194 ms, 310 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[226] :: 664 ~ 667, 2807 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.272665
[227] :: 667 ~ 668, 951 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.361544
[228] :: 668 ~ 669, 1292 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.413925
[229] :: 669 ~ 670, 1214 ms, 320 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[230] :: 671 ~ 672, 896 ms, 140 (MB), Reclaimed Zone : 1, ZLV: 0.157428
[231] :: 672 ~ 673, 1168 ms, 299 (MB), Reclaimed Zone : 1, ZLV: 0.655459
[232] :: 675 ~ 675, 345 ms, 42 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[233] :: 677 ~ 678, 858 ms, 109 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[234] :: 678 ~ 679, 982 ms, 152 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[235] :: 679 ~ 680, 1326 ms, 234 (MB), Reclaimed Zone : 1, ZLV: 0.269260
[236] :: 681 ~ 683, 2621 ms, 214 (MB), Reclaimed Zone : 1, ZLV: 0.327599
[237] :: 683 ~ 684, 1011 ms, 233 (MB), Reclaimed Zone : 1, ZLV: 0.653251
[238] :: 684 ~ 686, 1223 ms, 320 (MB), Reclaimed Zone : 1, ZLV: 0.798666
[239] :: 686 ~ 687, 1307 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[240] :: 687 ~ 688, 1189 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[241] :: 690 ~ 690, 531 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[242] :: 692 ~ 693, 978 ms, 125 (MB), Reclaimed Zone : 1, ZLV: 0.531950
[243] :: 693 ~ 694, 938 ms, 174 (MB), Reclaimed Zone : 1, ZLV: 0.317385
[244] :: 694 ~ 695, 1046 ms, 261 (MB), Reclaimed Zone : 1, ZLV: 0.873627
[245] :: 698 ~ 701, 2627 ms, 262 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[246] :: 701 ~ 702, 1078 ms, 279 (MB), Reclaimed Zone : 1, ZLV: 0.706920
[247] :: 702 ~ 703, 1083 ms, 281 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[248] :: 703 ~ 704, 1180 ms, 281 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[249] :: 704 ~ 706, 1450 ms, 231 (MB), Reclaimed Zone : 1, ZLV: 0.469270
[250] :: 706 ~ 707, 1202 ms, 306 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[251] :: 710 ~ 711, 522 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[252] :: 711 ~ 713, 1900 ms, 287 (MB), Reclaimed Zone : 1, ZLV: 0.308434
[253] :: 713 ~ 714, 1009 ms, 135 (MB), Reclaimed Zone : 1, ZLV: 0.104528
[254] :: 714 ~ 715, 910 ms, 188 (MB), Reclaimed Zone : 1, ZLV: 0.122622
[255] :: 716 ~ 718, 2370 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.107639
[256] :: 718 ~ 719, 1006 ms, 235 (MB), Reclaimed Zone : 1, ZLV: 0.580090
[257] :: 719 ~ 720, 1041 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.363662
[258] :: 720 ~ 721, 1255 ms, 327 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[259] :: 722 ~ 723, 1765 ms, 264 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[260] :: 723 ~ 725, 1294 ms, 324 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[261] :: 725 ~ 726, 1350 ms, 341 (MB), Reclaimed Zone : 1, ZLV: 0.436323
[262] :: 731 ~ 732, 717 ms, 111 (MB), Reclaimed Zone : 1, ZLV: 0.465963
[263] :: 732 ~ 732, 625 ms, 129 (MB), Reclaimed Zone : 1, ZLV: 0.162702
[264] :: 732 ~ 734, 1747 ms, 122 (MB), Reclaimed Zone : 1, ZLV: 0.107610
[265] :: 734 ~ 736, 1444 ms, 238 (MB), Reclaimed Zone : 1, ZLV: 0.489118
[266] :: 736 ~ 737, 1037 ms, 269 (MB), Reclaimed Zone : 1, ZLV: 0.147059
[267] :: 737 ~ 738, 1096 ms, 281 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[268] :: 738 ~ 739, 1268 ms, 332 (MB), Reclaimed Zone : 1, ZLV: 0.407722
[269] :: 739 ~ 740, 1305 ms, 342 (MB), Reclaimed Zone : 1, ZLV: 0.667630
[270] :: 741 ~ 742, 1399 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.309397
[271] :: 742 ~ 744, 1541 ms, 336 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[272] :: 746 ~ 747, 453 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[273] :: 750 ~ 751, 918 ms, 159 (MB), Reclaimed Zone : 1, ZLV: 0.446105
[274] :: 751 ~ 753, 2353 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 0.335602
[275] :: 753 ~ 754, 1071 ms, 199 (MB), Reclaimed Zone : 1, ZLV: 0.739804
[276] :: 754 ~ 755, 907 ms, 246 (MB), Reclaimed Zone : 1, ZLV: 0.437658
[277] :: 755 ~ 756, 1133 ms, 303 (MB), Reclaimed Zone : 1, ZLV: 0.561675
[278] :: 756 ~ 758, 1283 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.364569
[279] :: 758 ~ 760, 2044 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.600000
[280] :: 760 ~ 761, 1249 ms, 333 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[281] :: 764 ~ 764, 191 ms, 27 (MB), Reclaimed Zone : 1, ZLV: 0.520880
[282] :: 766 ~ 766, 11 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.008505
[283] :: 766 ~ 767, 948 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.267691
[284] :: 767 ~ 768, 619 ms, 92 (MB), Reclaimed Zone : 1, ZLV: 0.133244
[285] :: 768 ~ 768, 680 ms, 161 (MB), Reclaimed Zone : 1, ZLV: 0.462671
[286] :: 768 ~ 770, 1312 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.151369
[287] :: 770 ~ 773, 3082 ms, 305 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[288] :: 773 ~ 773, 40 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.482756
[289] :: 773 ~ 774, 1246 ms, 320 (MB), Reclaimed Zone : 1, ZLV: 0.901492
[290] :: 774 ~ 775, 1340 ms, 354 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[291] :: 775 ~ 777, 1356 ms, 353 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[292] :: 777 ~ 778, 1388 ms, 348 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[293] :: 785 ~ 786, 588 ms, 69 (MB), Reclaimed Zone : 1, ZLV: 0.365068
[294] :: 786 ~ 786, 556 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[295] :: 786 ~ 787, 659 ms, 160 (MB), Reclaimed Zone : 1, ZLV: 0.339986
[296] :: 787 ~ 788, 1212 ms, 315 (MB), Reclaimed Zone : 1, ZLV: 0.449408
[297] :: 788 ~ 790, 1706 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.321608
[298] :: 790 ~ 792, 1950 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[299] :: 792 ~ 793, 1297 ms, 335 (MB), Reclaimed Zone : 1, ZLV: 0.409365
[300] :: 793 ~ 795, 1385 ms, 361 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[301] :: 795 ~ 796, 1404 ms, 357 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[302] :: 796 ~ 797, 1522 ms, 394 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[303] :: 799 ~ 800, 1108 ms, 160 (MB), Reclaimed Zone : 1, ZLV: 0.572153
[304] :: 800 ~ 801, 1543 ms, 404 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[305] :: 801 ~ 803, 1617 ms, 401 (MB), Reclaimed Zone : 1, ZLV: 0.284300
[306] :: 806 ~ 807, 578 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.394408
[307] :: 808 ~ 811, 2623 ms, 224 (MB), Reclaimed Zone : 1, ZLV: 0.222794
[308] :: 811 ~ 812, 1142 ms, 297 (MB), Reclaimed Zone : 1, ZLV: 0.775570
[309] :: 812 ~ 813, 1197 ms, 300 (MB), Reclaimed Zone : 1, ZLV: 0.399729
[310] :: 813 ~ 815, 1314 ms, 354 (MB), Reclaimed Zone : 1, ZLV: 0.431989
[311] :: 815 ~ 816, 1411 ms, 364 (MB), Reclaimed Zone : 1, ZLV: 0.493638
[312] :: 816 ~ 818, 1505 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 0.874680
[313] :: 818 ~ 820, 2073 ms, 355 (MB), Reclaimed Zone : 1, ZLV: 0.377550
[314] :: 820 ~ 822, 1457 ms, 365 (MB), Reclaimed Zone : 1, ZLV: 0.400428
[315] :: 822 ~ 823, 1452 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[316] :: 827 ~ 828, 561 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[317] :: 828 ~ 828, 419 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 0.730337
[318] :: 828 ~ 830, 1275 ms, 284 (MB), Reclaimed Zone : 1, ZLV: 0.271626
[319] :: 830 ~ 832, 1617 ms, 286 (MB), Reclaimed Zone : 1, ZLV: 0.447410
[320] :: 832 ~ 833, 1198 ms, 309 (MB), Reclaimed Zone : 1, ZLV: 0.353434
[321] :: 833 ~ 836, 2824 ms, 260 (MB), Reclaimed Zone : 1, ZLV: 0.135695
[322] :: 836 ~ 837, 1264 ms, 299 (MB), Reclaimed Zone : 1, ZLV: 0.324308
[323] :: 837 ~ 838, 1247 ms, 330 (MB), Reclaimed Zone : 1, ZLV: 0.489551
[324] :: 838 ~ 840, 1346 ms, 342 (MB), Reclaimed Zone : 1, ZLV: 0.503921
[325] :: 840 ~ 841, 1376 ms, 360 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[326] :: 841 ~ 843, 1865 ms, 390 (MB), Reclaimed Zone : 1, ZLV: 0.835443
[327] :: 844 ~ 845, 842 ms, 112 (MB), Reclaimed Zone : 1, ZLV: 0.210197
[328] :: 845 ~ 847, 1869 ms, 331 (MB), Reclaimed Zone : 1, ZLV: 0.503708
[329] :: 847 ~ 848, 1508 ms, 385 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[330] :: 852 ~ 852, 507 ms, 52 (MB), Reclaimed Zone : 1, ZLV: 0.351504
[331] :: 854 ~ 855, 1467 ms, 285 (MB), Reclaimed Zone : 1, ZLV: 0.399283
[332] :: 855 ~ 857, 1463 ms, 378 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[333] :: 857 ~ 860, 2984 ms, 279 (MB), Reclaimed Zone : 1, ZLV: 0.243091
[334] :: 860 ~ 861, 1283 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.376956
[335] :: 861 ~ 862, 1257 ms, 345 (MB), Reclaimed Zone : 1, ZLV: 0.823311
[336] :: 862 ~ 864, 1549 ms, 375 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[337] :: 864 ~ 865, 1417 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 0.387334
[338] :: 868 ~ 869, 1167 ms, 194 (MB), Reclaimed Zone : 1, ZLV: 0.275696
[339] :: 869 ~ 871, 1234 ms, 314 (MB), Reclaimed Zone : 1, ZLV: 0.293397
[340] :: 872 ~ 873, 1689 ms, 297 (MB), Reclaimed Zone : 1, ZLV: 0.133333
[341] :: 875 ~ 877, 1495 ms, 278 (MB), Reclaimed Zone : 1, ZLV: 0.041284
[342] :: 877 ~ 878, 1147 ms, 303 (MB), Reclaimed Zone : 1, ZLV: 0.242140
[343] :: 878 ~ 881, 2888 ms, 269 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[344] :: 883 ~ 884, 846 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.552449
[345] :: 884 ~ 885, 891 ms, 147 (MB), Reclaimed Zone : 1, ZLV: 0.466137
[346] :: 885 ~ 886, 1006 ms, 251 (MB), Reclaimed Zone : 1, ZLV: 0.316562
[347] :: 886 ~ 887, 1134 ms, 290 (MB), Reclaimed Zone : 1, ZLV: 0.268554
[348] :: 887 ~ 888, 1344 ms, 340 (MB), Reclaimed Zone : 1, ZLV: 0.251180
[349] :: 888 ~ 890, 1382 ms, 360 (MB), Reclaimed Zone : 1, ZLV: 0.408990
[350] :: 890 ~ 891, 1443 ms, 379 (MB), Reclaimed Zone : 1, ZLV: 0.135172
[351] :: 891 ~ 893, 1487 ms, 397 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[352] :: 897 ~ 899, 1754 ms, 331 (MB), Reclaimed Zone : 1, ZLV: 0.264179
[353] :: 899 ~ 900, 1331 ms, 334 (MB), Reclaimed Zone : 1, ZLV: 0.301818
[354] :: 900 ~ 902, 1612 ms, 290 (MB), Reclaimed Zone : 1, ZLV: 0.304159
[355] :: 902 ~ 903, 1235 ms, 300 (MB), Reclaimed Zone : 1, ZLV: 0.745035
[356] :: 903 ~ 905, 1246 ms, 315 (MB), Reclaimed Zone : 1, ZLV: 0.207558
[357] :: 905 ~ 908, 3394 ms, 365 (MB), Reclaimed Zone : 1, ZLV: 0.213341
[358] :: 910 ~ 910, 0 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[359] :: 910 ~ 911, 632 ms, 64 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[360] :: 911 ~ 913, 1748 ms, 350 (MB), Reclaimed Zone : 1, ZLV: 0.173039
[361] :: 913 ~ 914, 1488 ms, 385 (MB), Reclaimed Zone : 1, ZLV: 0.951484
[362] :: 914 ~ 916, 1512 ms, 380 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[363] :: 916 ~ 918, 2557 ms, 376 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[364] :: 918 ~ 920, 1554 ms, 391 (MB), Reclaimed Zone : 1, ZLV: 0.247000
[365] :: 920 ~ 922, 1771 ms, 440 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[366] :: 922 ~ 924, 1780 ms, 440 (MB), Reclaimed Zone : 1, ZLV: 0.193397
[367] :: 925 ~ 927, 1734 ms, 295 (MB), Reclaimed Zone : 1, ZLV: 0.284065
[368] :: 927 ~ 929, 1844 ms, 451 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[369] :: 929 ~ 930, 1564 ms, 289 (MB), Reclaimed Zone : 1, ZLV: 0.157234
[370] :: 930 ~ 932, 1859 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[371] :: 934 ~ 935, 1642 ms, 404 (MB), Reclaimed Zone : 1, ZLV: 0.246801
[372] :: 937 ~ 940, 3353 ms, 401 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[373] :: 940 ~ 942, 1680 ms, 421 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[374] :: 942 ~ 943, 1620 ms, 430 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[375] :: 943 ~ 945, 1712 ms, 439 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[376] :: 945 ~ 947, 1742 ms, 449 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[377] :: 947 ~ 949, 2417 ms, 459 (MB), Reclaimed Zone : 1, ZLV: 0.424913
[378] :: 949 ~ 951, 1701 ms, 452 (MB), Reclaimed Zone : 1, ZLV: 0.367677
[379] :: 951 ~ 953, 1824 ms, 456 (MB), Reclaimed Zone : 1, ZLV: 0.255975
[380] :: 953 ~ 955, 1643 ms, 467 (MB), Reclaimed Zone : 1, ZLV: 0.375042
[381] :: 955 ~ 957, 1882 ms, 494 (MB), Reclaimed Zone : 1, ZLV: 0.397589
[382] :: 957 ~ 959, 2325 ms, 354 (MB), Reclaimed Zone : 1, ZLV: 0.416472
[383] :: 959 ~ 961, 1610 ms, 424 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[384] :: 964 ~ 965, 1152 ms, 255 (MB), Reclaimed Zone : 1, ZLV: 0.127521
[385] :: 965 ~ 966, 1388 ms, 388 (MB), Reclaimed Zone : 1, ZLV: 0.590115
[386] :: 969 ~ 970, 1158 ms, 240 (MB), Reclaimed Zone : 1, ZLV: 0.187574
[387] :: 970 ~ 971, 1473 ms, 389 (MB), Reclaimed Zone : 1, ZLV: 0.512319
[388] :: 972 ~ 975, 3305 ms, 361 (MB), Reclaimed Zone : 1, ZLV: 0.265063
[389] :: 975 ~ 976, 1202 ms, 318 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[390] :: 976 ~ 978, 1470 ms, 396 (MB), Reclaimed Zone : 1, ZLV: 0.418982
[391] :: 978 ~ 979, 1536 ms, 399 (MB), Reclaimed Zone : 1, ZLV: 0.432930
[392] :: 979 ~ 981, 1667 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 0.433552
[393] :: 981 ~ 983, 2309 ms, 397 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[394] :: 983 ~ 985, 1713 ms, 448 (MB), Reclaimed Zone : 1, ZLV: 0.947368
[395] :: 985 ~ 987, 1379 ms, 196 (MB), Reclaimed Zone : 1, ZLV: 0.193137
[396] :: 987 ~ 988, 1248 ms, 239 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[397] :: 991 ~ 992, 1242 ms, 322 (MB), Reclaimed Zone : 1, ZLV: 0.506520
[398] :: 992 ~ 994, 1161 ms, 152 (MB), Reclaimed Zone : 1, ZLV: 0.385742
[399] :: 994 ~ 995, 1707 ms, 339 (MB), Reclaimed Zone : 1, ZLV: 0.231462
[400] :: 996 ~ 997, 1130 ms, 171 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[401] :: 997 ~ 998, 1048 ms, 260 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[402] :: 998 ~ 1001, 2969 ms, 327 (MB), Reclaimed Zone : 1, ZLV: 0.211411
[403] :: 1001 ~ 1003, 1415 ms, 374 (MB), Reclaimed Zone : 1, ZLV: 0.471252
[404] :: 1003 ~ 1004, 1537 ms, 397 (MB), Reclaimed Zone : 1, ZLV: 0.492706
[405] :: 1004 ~ 1007, 2427 ms, 410 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[406] :: 1007 ~ 1009, 1718 ms, 414 (MB), Reclaimed Zone : 1, ZLV: 0.307305
[407] :: 1009 ~ 1010, 1504 ms, 204 (MB), Reclaimed Zone : 1, ZLV: 0.221414
[408] :: 1014 ~ 1014, 273 ms, 32 (MB), Reclaimed Zone : 1, ZLV: 0.240036
[409] :: 1015 ~ 1017, 2834 ms, 305 (MB), Reclaimed Zone : 1, ZLV: 0.006452
[410] :: 1017 ~ 1019, 1205 ms, 313 (MB), Reclaimed Zone : 1, ZLV: 0.352973
[411] :: 1019 ~ 1020, 1362 ms, 352 (MB), Reclaimed Zone : 1, ZLV: 0.680927
[412] :: 1020 ~ 1022, 1540 ms, 385 (MB), Reclaimed Zone : 1, ZLV: 0.320424
[413] :: 1022 ~ 1023, 1554 ms, 392 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[414] :: 1023 ~ 1025, 1784 ms, 437 (MB), Reclaimed Zone : 1, ZLV: 0.594257
[415] :: 1025 ~ 1027, 1983 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.178086
[416] :: 1027 ~ 1029, 1599 ms, 415 (MB), Reclaimed Zone : 1, ZLV: 0.176176
[417] :: 1029 ~ 1031, 1678 ms, 440 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[418] :: 1031 ~ 1032, 1248 ms, 156 (MB), Reclaimed Zone : 1, ZLV: 0.393459
[419] :: 1035 ~ 1036, 1525 ms, 203 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[420] :: 1037 ~ 1039, 1896 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 0.253000
[421] :: 1039 ~ 1040, 1517 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 0.095625
[422] :: 1040 ~ 1042, 1845 ms, 355 (MB), Reclaimed Zone : 1, ZLV: 0.457437
[423] :: 1042 ~ 1044, 1448 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 0.295919
[424] :: 1044 ~ 1047, 3353 ms, 377 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[425] :: 1047 ~ 1048, 873 ms, 225 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[426] :: 1048 ~ 1050, 1729 ms, 434 (MB), Reclaimed Zone : 1, ZLV: 0.404913
[427] :: 1050 ~ 1052, 1842 ms, 483 (MB), Reclaimed Zone : 1, ZLV: 0.522690
[428] :: 1052 ~ 1054, 1957 ms, 476 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[429] :: 1054 ~ 1056, 2054 ms, 487 (MB), Reclaimed Zone : 1, ZLV: 0.737903
[430] :: 1056 ~ 1058, 2182 ms, 398 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[431] :: 1059 ~ 1059, 236 ms, 17 (MB), Reclaimed Zone : 1, ZLV: 0.392857
[432] :: 1063 ~ 1064, 1441 ms, 206 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[433] :: 1064 ~ 1066, 1270 ms, 304 (MB), Reclaimed Zone : 1, ZLV: 0.287700
[434] :: 1066 ~ 1067, 1250 ms, 325 (MB), Reclaimed Zone : 1, ZLV: 0.813912
[435] :: 1067 ~ 1070, 2728 ms, 229 (MB), Reclaimed Zone : 1, ZLV: 0.163098
[436] :: 1070 ~ 1071, 1370 ms, 327 (MB), Reclaimed Zone : 1, ZLV: 0.453476
[437] :: 1071 ~ 1073, 1578 ms, 396 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[438] :: 1073 ~ 1075, 1641 ms, 414 (MB), Reclaimed Zone : 1, ZLV: 0.320080
[439] :: 1075 ~ 1076, 1827 ms, 435 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[440] :: 1077 ~ 1079, 2326 ms, 411 (MB), Reclaimed Zone : 1, ZLV: 0.314991
[441] :: 1079 ~ 1081, 1817 ms, 472 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[442] :: 1081 ~ 1083, 1896 ms, 481 (MB), Reclaimed Zone : 1, ZLV: 0.987402
[443] :: 1086 ~ 1086, 555 ms, 89 (MB), Reclaimed Zone : 1, ZLV: 0.994565
[444] :: 1087 ~ 1089, 1981 ms, 309 (MB), Reclaimed Zone : 1, ZLV: 0.190920
[445] :: 1089 ~ 1091, 1836 ms, 474 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[446] :: 1091 ~ 1093, 1838 ms, 322 (MB), Reclaimed Zone : 1, ZLV: 0.286896
[447] :: 1093 ~ 1095, 1571 ms, 394 (MB), Reclaimed Zone : 1, ZLV: 0.237394
[448] :: 1095 ~ 1096, 1694 ms, 418 (MB), Reclaimed Zone : 1, ZLV: 0.334144
[449] :: 1097 ~ 1099, 2563 ms, 218 (MB), Reclaimed Zone : 1, ZLV: 0.260585
[450] :: 1099 ~ 1100, 1013 ms, 252 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[451] :: 1100 ~ 1101, 1206 ms, 306 (MB), Reclaimed Zone : 1, ZLV: 0.506230
[452] :: 1101 ~ 1103, 1643 ms, 435 (MB), Reclaimed Zone : 1, ZLV: 0.203160
[453] :: 1103 ~ 1105, 1898 ms, 461 (MB), Reclaimed Zone : 1, ZLV: 0.331590
[454] :: 1105 ~ 1108, 2560 ms, 476 (MB), Reclaimed Zone : 1, ZLV: 0.860412
[455] :: 1108 ~ 1111, 2935 ms, 487 (MB), Reclaimed Zone : 1, ZLV: 0.769856
[456] :: 1112 ~ 1114, 2299 ms, 341 (MB), Reclaimed Zone : 1, ZLV: 0.255474
[457] :: 1115 ~ 1115, 48 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[458] :: 1116 ~ 1118, 1784 ms, 403 (MB), Reclaimed Zone : 1, ZLV: 0.464017
[459] :: 1118 ~ 1120, 1792 ms, 355 (MB), Reclaimed Zone : 1, ZLV: 0.250331
[460] :: 1120 ~ 1121, 1343 ms, 357 (MB), Reclaimed Zone : 1, ZLV: 0.176709
[461] :: 1121 ~ 1123, 1405 ms, 355 (MB), Reclaimed Zone : 1, ZLV: 0.795927
[462] :: 1124 ~ 1127, 3012 ms, 318 (MB), Reclaimed Zone : 1, ZLV: 0.296467
[463] :: 1127 ~ 1129, 1626 ms, 445 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[464] :: 1129 ~ 1131, 1741 ms, 468 (MB), Reclaimed Zone : 1, ZLV: 0.009760
[465] :: 1131 ~ 1133, 1968 ms, 484 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[466] :: 1133 ~ 1135, 2122 ms, 422 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[467] :: 1135 ~ 1137, 1818 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[468] :: 1137 ~ 1139, 1772 ms, 275 (MB), Reclaimed Zone : 1, ZLV: 0.308597
[469] :: 1139 ~ 1139, 588 ms, 146 (MB), Reclaimed Zone : 1, ZLV: 0.322001
[470] :: 1141 ~ 1143, 1797 ms, 327 (MB), Reclaimed Zone : 1, ZLV: 0.315789
[471] :: 1143 ~ 1144, 1191 ms, 159 (MB), Reclaimed Zone : 1, ZLV: 0.331539
[472] :: 1144 ~ 1146, 1650 ms, 326 (MB), Reclaimed Zone : 1, ZLV: 0.302517
[473] :: 1146 ~ 1148, 1428 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.231249
[474] :: 1148 ~ 1149, 1465 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 0.143567
[475] :: 1149 ~ 1151, 1665 ms, 422 (MB), Reclaimed Zone : 1, ZLV: 0.332606
[476] :: 1151 ~ 1153, 2122 ms, 421 (MB), Reclaimed Zone : 1, ZLV: 0.847775
[477] :: 1155 ~ 1158, 3048 ms, 371 (MB), Reclaimed Zone : 1, ZLV: 0.235294
[478] :: 1158 ~ 1160, 1639 ms, 405 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[479] :: 1160 ~ 1161, 1647 ms, 419 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[480] :: 1161 ~ 1163, 1856 ms, 446 (MB), Reclaimed Zone : 1, ZLV: 0.936118
[481] :: 1163 ~ 1165, 1773 ms, 460 (MB), Reclaimed Zone : 1, ZLV: 0.643752
[482] :: 1165 ~ 1167, 1862 ms, 463 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[483] :: 1167 ~ 1169, 1900 ms, 473 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[484] :: 1169 ~ 1169, 94 ms, 5 (MB), Reclaimed Zone : 1, ZLV: 0.437500
[485] :: 1170 ~ 1173, 2359 ms, 394 (MB), Reclaimed Zone : 1, ZLV: 0.379186
[486] :: 1173 ~ 1174, 1632 ms, 410 (MB), Reclaimed Zone : 1, ZLV: 0.259770
[487] :: 1175 ~ 1176, 1678 ms, 454 (MB), Reclaimed Zone : 1, ZLV: 0.249006
[488] :: 1178 ~ 1180, 2181 ms, 398 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[489] :: 1182 ~ 1184, 2084 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.130460
[490] :: 1184 ~ 1185, 1419 ms, 364 (MB), Reclaimed Zone : 1, ZLV: 0.418655
[491] :: 1185 ~ 1187, 1735 ms, 349 (MB), Reclaimed Zone : 1, ZLV: 0.175141
[492] :: 1187 ~ 1189, 1742 ms, 439 (MB), Reclaimed Zone : 1, ZLV: 0.229382
[493] :: 1189 ~ 1191, 1737 ms, 441 (MB), Reclaimed Zone : 1, ZLV: 0.862283
[494] :: 1191 ~ 1194, 3021 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.187245
[495] :: 1194 ~ 1196, 1520 ms, 382 (MB), Reclaimed Zone : 1, ZLV: 0.748024
[496] :: 1196 ~ 1198, 1909 ms, 490 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[497] :: 1198 ~ 1200, 2308 ms, 398 (MB), Reclaimed Zone : 1, ZLV: 0.888337
[498] :: 1200 ~ 1202, 1908 ms, 491 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[499] :: 1202 ~ 1204, 1194 ms, 157 (MB), Reclaimed Zone : 1, ZLV: 0.297787
[500] :: 1204 ~ 1205, 1780 ms, 297 (MB), Reclaimed Zone : 1, ZLV: 0.339016
[501] :: 1205 ~ 1207, 1172 ms, 320 (MB), Reclaimed Zone : 1, ZLV: 0.409183
[502] :: 1209 ~ 1211, 2194 ms, 372 (MB), Reclaimed Zone : 1, ZLV: 0.136916
[503] :: 1211 ~ 1212, 996 ms, 128 (MB), Reclaimed Zone : 1, ZLV: 0.277638
[504] :: 1212 ~ 1213, 922 ms, 218 (MB), Reclaimed Zone : 1, ZLV: 0.249138
[505] :: 1213 ~ 1215, 1954 ms, 366 (MB), Reclaimed Zone : 1, ZLV: 0.161828
[506] :: 1215 ~ 1217, 1821 ms, 457 (MB), Reclaimed Zone : 1, ZLV: 0.859611
[507] :: 1217 ~ 1219, 2236 ms, 441 (MB), Reclaimed Zone : 1, ZLV: 0.551782
[508] :: 1219 ~ 1221, 1847 ms, 484 (MB), Reclaimed Zone : 1, ZLV: 0.616278
[509] :: 1222 ~ 1224, 1777 ms, 364 (MB), Reclaimed Zone : 1, ZLV: 0.322064
[510] :: 1224 ~ 1226, 1924 ms, 492 (MB), Reclaimed Zone : 1, ZLV: 0.220328
[511] :: 1226 ~ 1228, 1862 ms, 512 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[512] :: 1228 ~ 1230, 2580 ms, 509 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[513] :: 1230 ~ 1233, 2186 ms, 536 (MB), Reclaimed Zone : 1, ZLV: 0.880074
[514] :: 1235 ~ 1238, 3276 ms, 471 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[515] :: 1238 ~ 1241, 2075 ms, 527 (MB), Reclaimed Zone : 1, ZLV: 0.454094
[516] :: 1241 ~ 1243, 2086 ms, 532 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[517] :: 1243 ~ 1245, 2188 ms, 408 (MB), Reclaimed Zone : 1, ZLV: 0.454298
[518] :: 1245 ~ 1247, 2058 ms, 533 (MB), Reclaimed Zone : 1, ZLV: 0.890741
[519] :: 1247 ~ 1249, 2140 ms, 539 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[520] :: 1250 ~ 1251, 1307 ms, 183 (MB), Reclaimed Zone : 1, ZLV: 0.339250
[521] :: 1254 ~ 1256, 2109 ms, 363 (MB), Reclaimed Zone : 1, ZLV: 0.155287
[522] :: 1257 ~ 1259, 2260 ms, 165 (MB), Reclaimed Zone : 1, ZLV: 0.355225
[523] :: 1259 ~ 1260, 1069 ms, 257 (MB), Reclaimed Zone : 1, ZLV: 0.377361
[524] :: 1260 ~ 1262, 1449 ms, 346 (MB), Reclaimed Zone : 1, ZLV: 0.405146
[525] :: 1262 ~ 1263, 1769 ms, 442 (MB), Reclaimed Zone : 1, ZLV: 0.342832
[526] :: 1263 ~ 1265, 1940 ms, 498 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[527] :: 1265 ~ 1268, 2319 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 0.864040
[528] :: 1268 ~ 1269, 856 ms, 104 (MB), Reclaimed Zone : 1, ZLV: 0.561041
[529] :: 1269 ~ 1271, 2220 ms, 414 (MB), Reclaimed Zone : 1, ZLV: 0.561410
[530] :: 1275 ~ 1278, 3370 ms, 413 (MB), Reclaimed Zone : 1, ZLV: 0.164533
[531] :: 1278 ~ 1280, 1695 ms, 439 (MB), Reclaimed Zone : 1, ZLV: 0.611285
[532] :: 1280 ~ 1282, 1700 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 0.352875
[533] :: 1282 ~ 1284, 1760 ms, 458 (MB), Reclaimed Zone : 1, ZLV: 0.461293
[534] :: 1284 ~ 1285, 1759 ms, 459 (MB), Reclaimed Zone : 1, ZLV: 0.526871
[535] :: 1286 ~ 1288, 2194 ms, 418 (MB), Reclaimed Zone : 1, ZLV: 0.507991
[536] :: 1288 ~ 1289, 1614 ms, 419 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[537] :: 1290 ~ 1291, 1222 ms, 178 (MB), Reclaimed Zone : 1, ZLV: 0.334138
[538] :: 1292 ~ 1294, 2235 ms, 407 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[539] :: 1295 ~ 1298, 2908 ms, 460 (MB), Reclaimed Zone : 1, ZLV: 0.356771
[540] :: 1298 ~ 1300, 1712 ms, 469 (MB), Reclaimed Zone : 1, ZLV: 0.347291
[541] :: 1300 ~ 1301, 1852 ms, 479 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[542] :: 1301 ~ 1303, 1824 ms, 331 (MB), Reclaimed Zone : 1, ZLV: 0.265626
[543] :: 1303 ~ 1305, 1998 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 0.268272
[544] :: 1305 ~ 1307, 2081 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[545] :: 1308 ~ 1309, 1603 ms, 272 (MB), Reclaimed Zone : 1, ZLV: 0.468863
[546] :: 1309 ~ 1311, 1675 ms, 449 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[547] :: 1311 ~ 1313, 1772 ms, 313 (MB), Reclaimed Zone : 1, ZLV: 0.362009
[548] :: 1316 ~ 1317, 1851 ms, 426 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[549] :: 1318 ~ 1320, 2311 ms, 452 (MB), Reclaimed Zone : 1, ZLV: 0.857768
[550] :: 1320 ~ 1321, 1002 ms, 75 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[551] :: 1321 ~ 1324, 2519 ms, 341 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[552] :: 1324 ~ 1325, 1804 ms, 473 (MB), Reclaimed Zone : 1, ZLV: 0.421933
[553] :: 1325 ~ 1327, 1730 ms, 466 (MB), Reclaimed Zone : 1, ZLV: 0.906780
[554] :: 1327 ~ 1329, 1977 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 0.344478
[555] :: 1329 ~ 1331, 2014 ms, 520 (MB), Reclaimed Zone : 1, ZLV: 0.435971
[556] :: 1331 ~ 1333, 2041 ms, 522 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[557] :: 1334 ~ 1336, 2671 ms, 497 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[558] :: 1336 ~ 1338, 1996 ms, 513 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[559] :: 1339 ~ 1341, 2234 ms, 318 (MB), Reclaimed Zone : 1, ZLV: 0.238694
[560] :: 1341 ~ 1343, 1800 ms, 434 (MB), Reclaimed Zone : 1, ZLV: 0.219657
[561] :: 1343 ~ 1344, 1866 ms, 466 (MB), Reclaimed Zone : 1, ZLV: 0.119231
[562] :: 1348 ~ 1350, 2384 ms, 177 (MB), Reclaimed Zone : 1, ZLV: 0.769231
[563] :: 1350 ~ 1352, 1711 ms, 402 (MB), Reclaimed Zone : 1, ZLV: 0.415388
[564] :: 1352 ~ 1354, 1667 ms, 433 (MB), Reclaimed Zone : 1, ZLV: 0.491651
[565] :: 1354 ~ 1356, 1757 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 0.537596
[566] :: 1356 ~ 1357, 1807 ms, 489 (MB), Reclaimed Zone : 1, ZLV: 0.455334
[567] :: 1357 ~ 1359, 1857 ms, 501 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[568] :: 1359 ~ 1361, 2006 ms, 513 (MB), Reclaimed Zone : 1, ZLV: 0.998081
[569] :: 1362 ~ 1364, 2645 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 0.379079
[570] :: 1364 ~ 1365, 484 ms, 127 (MB), Reclaimed Zone : 1, ZLV: 0.245256
[571] :: 1365 ~ 1367, 1298 ms, 167 (MB), Reclaimed Zone : 1, ZLV: 0.156923
[572] :: 1367 ~ 1369, 2152 ms, 503 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[573] :: 1372 ~ 1374, 2167 ms, 435 (MB), Reclaimed Zone : 1, ZLV: 0.458169
[574] :: 1374 ~ 1376, 1643 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 0.171189
[575] :: 1376 ~ 1379, 3073 ms, 345 (MB), Reclaimed Zone : 1, ZLV: 0.176018
[576] :: 1379 ~ 1381, 1176 ms, 307 (MB), Reclaimed Zone : 1, ZLV: 0.008163
[577] :: 1381 ~ 1382, 1849 ms, 436 (MB), Reclaimed Zone : 1, ZLV: 0.380464
[578] :: 1382 ~ 1384, 1780 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[579] :: 1384 ~ 1386, 1923 ms, 482 (MB), Reclaimed Zone : 1, ZLV: 0.400710
[580] :: 1386 ~ 1388, 2001 ms, 501 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[581] :: 1388 ~ 1390, 2077 ms, 527 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[582] :: 1391 ~ 1393, 2790 ms, 528 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[583] :: 1393 ~ 1395, 2130 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[584] :: 1396 ~ 1398, 2314 ms, 324 (MB), Reclaimed Zone : 1, ZLV: 0.453554
[585] :: 1398 ~ 1399, 401 ms, 99 (MB), Reclaimed Zone : 1, ZLV: 0.179348
[586] :: 1401 ~ 1403, 1718 ms, 315 (MB), Reclaimed Zone : 1, ZLV: 0.405110
[587] :: 1403 ~ 1405, 1940 ms, 358 (MB), Reclaimed Zone : 1, ZLV: 0.098837
[588] :: 1405 ~ 1407, 1885 ms, 468 (MB), Reclaimed Zone : 1, ZLV: 0.877417
[589] :: 1407 ~ 1409, 1825 ms, 474 (MB), Reclaimed Zone : 1, ZLV: 0.213631
[590] :: 1409 ~ 1412, 3164 ms, 420 (MB), Reclaimed Zone : 1, ZLV: 0.257610
[591] :: 1412 ~ 1414, 1526 ms, 423 (MB), Reclaimed Zone : 1, ZLV: 0.371764
[592] :: 1414 ~ 1415, 1661 ms, 436 (MB), Reclaimed Zone : 1, ZLV: 0.552325
[593] :: 1415 ~ 1417, 1855 ms, 474 (MB), Reclaimed Zone : 1, ZLV: 0.325310
[594] :: 1417 ~ 1419, 1901 ms, 476 (MB), Reclaimed Zone : 1, ZLV: 0.463289
[595] :: 1419 ~ 1421, 1914 ms, 488 (MB), Reclaimed Zone : 1, ZLV: 0.433937
[596] :: 1421 ~ 1423, 1803 ms, 385 (MB), Reclaimed Zone : 1, ZLV: 0.266447
[597] :: 1423 ~ 1426, 2784 ms, 437 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[598] :: 1427 ~ 1429, 2280 ms, 314 (MB), Reclaimed Zone : 1, ZLV: 0.304297
[599] :: 1429 ~ 1431, 1711 ms, 385 (MB), Reclaimed Zone : 1, ZLV: 0.306771
[600] :: 1431 ~ 1433, 2444 ms, 418 (MB), Reclaimed Zone : 1, ZLV: 0.208873
[601] :: 1433 ~ 1435, 1954 ms, 526 (MB), Reclaimed Zone : 1, ZLV: 0.958724
[602] :: 1435 ~ 1437, 1999 ms, 541 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[603] :: 1438 ~ 1439, 997 ms, 157 (MB), Reclaimed Zone : 1, ZLV: 0.477085
[604] :: 1439 ~ 1440, 1132 ms, 256 (MB), Reclaimed Zone : 1, ZLV: 0.307703
[605] :: 1440 ~ 1443, 2705 ms, 545 (MB), Reclaimed Zone : 1, ZLV: 0.179112
[606] :: 1443 ~ 1445, 2151 ms, 561 (MB), Reclaimed Zone : 1, ZLV: 0.257932
[607] :: 1447 ~ 1451, 3536 ms, 445 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[608] :: 1451 ~ 1451, 528 ms, 123 (MB), Reclaimed Zone : 1, ZLV: 0.227018
[609] :: 1451 ~ 1453, 1744 ms, 442 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[610] :: 1453 ~ 1455, 1865 ms, 486 (MB), Reclaimed Zone : 1, ZLV: 0.169713
[611] :: 1455 ~ 1457, 2054 ms, 541 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[612] :: 1457 ~ 1459, 2058 ms, 549 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[613] :: 1459 ~ 1462, 2446 ms, 501 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[614] :: 1462 ~ 1464, 2059 ms, 535 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[615] :: 1464 ~ 1466, 2241 ms, 398 (MB), Reclaimed Zone : 1, ZLV: 0.414977
[616] :: 1466 ~ 1468, 1892 ms, 451 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[617] :: 1471 ~ 1473, 2462 ms, 380 (MB), Reclaimed Zone : 1, ZLV: 0.079979
[618] :: 1473 ~ 1475, 1695 ms, 335 (MB), Reclaimed Zone : 1, ZLV: 0.555875
[619] :: 1475 ~ 1477, 1457 ms, 384 (MB), Reclaimed Zone : 1, ZLV: 0.468918
[620] :: 1477 ~ 1478, 1516 ms, 415 (MB), Reclaimed Zone : 1, ZLV: 0.231356
[621] :: 1482 ~ 1484, 1726 ms, 375 (MB), Reclaimed Zone : 1, ZLV: 0.286505
[622] :: 1484 ~ 1487, 2141 ms, 388 (MB), Reclaimed Zone : 1, ZLV: 0.188584
[623] :: 1487 ~ 1488, 1475 ms, 408 (MB), Reclaimed Zone : 1, ZLV: 0.153163
[624] :: 1488 ~ 1490, 1612 ms, 407 (MB), Reclaimed Zone : 1, ZLV: 0.610713
[625] :: 1490 ~ 1491, 1696 ms, 433 (MB), Reclaimed Zone : 1, ZLV: 0.245056
[626] :: 1491 ~ 1493, 1753 ms, 437 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[627] :: 1497 ~ 1499, 1927 ms, 369 (MB), Reclaimed Zone : 1, ZLV: 0.864000
[628] :: 1499 ~ 1501, 1620 ms, 431 (MB), Reclaimed Zone : 1, ZLV: 0.416373
[629] :: 1501 ~ 1503, 2166 ms, 389 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[630] :: 1503 ~ 1505, 1741 ms, 452 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[631] :: 1505 ~ 1507, 1861 ms, 444 (MB), Reclaimed Zone : 1, ZLV: 0.347840
[632] :: 1507 ~ 1509, 2568 ms, 469 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[633] :: 1509 ~ 1511, 1925 ms, 470 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[634] :: 1511 ~ 1513, 1746 ms, 468 (MB), Reclaimed Zone : 1, ZLV: 0.200338
[635] :: 1516 ~ 1517, 1868 ms, 353 (MB), Reclaimed Zone : 1, ZLV: 0.812227
[636] :: 1517 ~ 1519, 1346 ms, 346 (MB), Reclaimed Zone : 1, ZLV: 0.997780
[637] :: 1519 ~ 1521, 2296 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 0.300546
[638] :: 1521 ~ 1523, 1707 ms, 453 (MB), Reclaimed Zone : 1, ZLV: 0.821140
[639] :: 1523 ~ 1525, 1852 ms, 469 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[640] :: 1525 ~ 1527, 2049 ms, 336 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[641] :: 1527 ~ 1529, 1771 ms, 462 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[642] :: 1533 ~ 1535, 1893 ms, 352 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[643] :: 1535 ~ 1536, 1491 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[644] :: 1536 ~ 1538, 2080 ms, 331 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[645] :: 1538 ~ 1540, 1566 ms, 393 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[646] :: 1540 ~ 1542, 1672 ms, 410 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[647] :: 1542 ~ 1544, 2434 ms, 399 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[648] :: 1544 ~ 1546, 1536 ms, 413 (MB), Reclaimed Zone : 1, ZLV: 0.289495
[649] :: 1546 ~ 1547, 1696 ms, 428 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[650] :: 1548 ~ 1550, 1882 ms, 341 (MB), Reclaimed Zone : 1, ZLV: 0.997118
[651] :: 1550 ~ 1552, 1710 ms, 438 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[652] :: 1552 ~ 1555, 2365 ms, 438 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[653] :: 1555 ~ 1557, 2457 ms, 390 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[654] :: 1557 ~ 1559, 1699 ms, 435 (MB), Reclaimed Zone : 1, ZLV: 0.757919
[655] :: 1562 ~ 1564, 1471 ms, 296 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[656] :: 1564 ~ 1565, 1478 ms, 342 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[657] :: 1565 ~ 1567, 1495 ms, 386 (MB), Reclaimed Zone : 1, ZLV: 0.177192
[658] :: 1567 ~ 1570, 2557 ms, 336 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[659] :: 1570 ~ 1571, 1458 ms, 383 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[660] :: 1571 ~ 1573, 1588 ms, 388 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[661] :: 1573 ~ 1574, 1622 ms, 392 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[662] :: 1574 ~ 1576, 1615 ms, 404 (MB), Reclaimed Zone : 1, ZLV: 0.682927
[663] :: 1576 ~ 1578, 1973 ms, 335 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[664] :: 1578 ~ 1580, 1513 ms, 375 (MB), Reclaimed Zone : 1, ZLV: 0.314720
[665] :: 1580 ~ 1581, 1477 ms, 391 (MB), Reclaimed Zone : 1, ZLV: 0.591304
[666] :: 1582 ~ 1583, 1456 ms, 193 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[667] :: 1583 ~ 1585, 1531 ms, 348 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[668] :: 1586 ~ 1587, 1710 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.561080
[669] :: 1589 ~ 1591, 1465 ms, 313 (MB), Reclaimed Zone : 1, ZLV: 0.826467
[670] :: 1591 ~ 1593, 2327 ms, 340 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[671] :: 1593 ~ 1595, 1448 ms, 371 (MB), Reclaimed Zone : 1, ZLV: 0.512268
[672] :: 1599 ~ 1600, 1328 ms, 239 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[673] :: 1601 ~ 1602, 1015 ms, 250 (MB), Reclaimed Zone : 1, ZLV: 0.152492
[674] :: 1612 ~ 1613, 1174 ms, 267 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[675] :: 1632 ~ 1633, 1282 ms, 266 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[676] :: 1633 ~ 1634, 1142 ms, 286 (MB), Reclaimed Zone : 1, ZLV: 0.487189
[677] :: 1635 ~ 1636, 1267 ms, 322 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[678] :: 1638 ~ 1640, 1336 ms, 330 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[679] :: 1655 ~ 1656, 1368 ms, 305 (MB), Reclaimed Zone : 1, ZLV: 0.534898
[680] :: 1656 ~ 1658, 1375 ms, 342 (MB), Reclaimed Zone : 1, ZLV: 0.560736
[681] :: 1661 ~ 1662, 668 ms, 154 (MB), Reclaimed Zone : 1, ZLV: 0.180038
[682] :: 1677 ~ 1678, 1428 ms, 313 (MB), Reclaimed Zone : 1, ZLV: 0.274598
[683] :: 1678 ~ 1680, 1400 ms, 353 (MB), Reclaimed Zone : 1, ZLV: 0.890872
[684] :: 1685 ~ 1686, 1312 ms, 289 (MB), Reclaimed Zone : 1, ZLV: 0.134060
[685] :: 1702 ~ 1702, 50 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.230769
[686] :: 1721 ~ 1721, 706 ms, 157 (MB), Reclaimed Zone : 1, ZLV: 0.283500
[687] :: 1751 ~ 1751, 5 ms, 1 (MB), Reclaimed Zone : 1, ZLV: 0.038462
[688] :: 1751 ~ 1752, 1101 ms, 279 (MB), Reclaimed Zone : 1, ZLV: 0.769526
[689] :: 1757 ~ 1758, 1274 ms, 290 (MB), Reclaimed Zone : 1, ZLV: 0.000000
[690] :: 1758 ~ 1759, 1287 ms, 302 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[691] :: 1759 ~ 1760, 1291 ms, 332 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[692] :: 1761 ~ 1762, 1355 ms, 302 (MB), Reclaimed Zone : 1, ZLV: 0.592455
[693] :: 1780 ~ 1781, 1113 ms, 264 (MB), Reclaimed Zone : 1, ZLV: 0.210749
[694] :: 1788 ~ 1788, 339 ms, 63 (MB), Reclaimed Zone : 1, ZLV: 0.409091
[695] :: 1790 ~ 1792, 1319 ms, 303 (MB), Reclaimed Zone : 1, ZLV: 0.256061
[696] :: 1803 ~ 1804, 1444 ms, 329 (MB), Reclaimed Zone : 1, ZLV: 0.240842
[697] :: 1804 ~ 1806, 1446 ms, 372 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[698] :: 1807 ~ 1808, 528 ms, 121 (MB), Reclaimed Zone : 1, ZLV: 0.197073
[699] :: 1808 ~ 1809, 1153 ms, 295 (MB), Reclaimed Zone : 1, ZLV: 0.168188
[700] :: 1814 ~ 1815, 1292 ms, 312 (MB), Reclaimed Zone : 1, ZLV: 0.882105
[701] :: 1820 ~ 1822, 1621 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[702] :: 1844 ~ 1845, 787 ms, 151 (MB), Reclaimed Zone : 1, ZLV: 0.941905
[703] :: 1851 ~ 1851, 902 ms, 214 (MB), Reclaimed Zone : 1, ZLV: 0.167456
[704] :: 1865 ~ 1866, 1029 ms, 280 (MB), Reclaimed Zone : 1, ZLV: 0.113601
[705] :: 1866 ~ 1868, 1552 ms, 350 (MB), Reclaimed Zone : 1, ZLV: 0.394178
[706] :: 1868 ~ 1869, 1546 ms, 387 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[707] :: 1873 ~ 1874, 1154 ms, 273 (MB), Reclaimed Zone : 1, ZLV: 0.273118
[708] :: 1890 ~ 1891, 1642 ms, 377 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[709] :: 1892 ~ 1894, 1760 ms, 393 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[710] :: 1898 ~ 1899, 1807 ms, 394 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[711] :: 1899 ~ 1901, 1480 ms, 392 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[712] :: 1903 ~ 1905, 1343 ms, 355 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[713] :: 1914 ~ 1916, 1824 ms, 412 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[714] :: 1919 ~ 1920, 1414 ms, 349 (MB), Reclaimed Zone : 1, ZLV: 0.066783
[715] :: 1920 ~ 1922, 1708 ms, 419 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[716] :: 1943 ~ 1944, 958 ms, 191 (MB), Reclaimed Zone : 1, ZLV: 0.639645
[717] :: 1944 ~ 1945, 954 ms, 225 (MB), Reclaimed Zone : 1, ZLV: 0.212126
[718] :: 1949 ~ 1950, 1358 ms, 279 (MB), Reclaimed Zone : 1, ZLV: 0.787360
[719] :: 1959 ~ 1960, 1658 ms, 352 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[720] :: 1979 ~ 1980, 783 ms, 152 (MB), Reclaimed Zone : 1, ZLV: 0.600437
[721] :: 1980 ~ 1981, 1078 ms, 272 (MB), Reclaimed Zone : 1, ZLV: 0.498142
[722] :: 1983 ~ 1984, 1198 ms, 278 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[723] :: 1987 ~ 1988, 1396 ms, 363 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[724] :: 2002 ~ 2002, 243 ms, 29 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[725] :: 2003 ~ 2005, 1397 ms, 360 (MB), Reclaimed Zone : 1, ZLV: 0.286919
[726] :: 2018 ~ 2018, 95 ms, 9 (MB), Reclaimed Zone : 1, ZLV: 0.473049
[727] :: 2023 ~ 2025, 1533 ms, 351 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[728] :: 2025 ~ 2026, 1451 ms, 385 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[729] :: 2026 ~ 2028, 1552 ms, 416 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[730] :: 2047 ~ 2049, 1495 ms, 346 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[731] :: 2049 ~ 2051, 1745 ms, 415 (MB), Reclaimed Zone : 1, ZLV: 0.930693
[732] :: 2053 ~ 2055, 1529 ms, 353 (MB), Reclaimed Zone : 1, ZLV: 0.402962
[733] :: 2055 ~ 2056, 1711 ms, 453 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[734] :: 2056 ~ 2058, 2008 ms, 453 (MB), Reclaimed Zone : 1, ZLV: 0.983766
[735] :: 2063 ~ 2065, 2100 ms, 477 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[736] :: 2069 ~ 2071, 2379 ms, 484 (MB), Reclaimed Zone : 1, ZLV: 0.318080
[737] :: 2075 ~ 2077, 1621 ms, 411 (MB), Reclaimed Zone : 1, ZLV: 0.933696
[738] :: 2081 ~ 2082, 1879 ms, 477 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[739] :: 2097 ~ 2098, 942 ms, 178 (MB), Reclaimed Zone : 1, ZLV: 0.965841
[740] :: 2102 ~ 2103, 1133 ms, 229 (MB), Reclaimed Zone : 1, ZLV: 0.472149
[741] :: 2117 ~ 2119, 1299 ms, 306 (MB), Reclaimed Zone : 1, ZLV: 0.711180
[742] :: 2119 ~ 2120, 1422 ms, 347 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[743] :: 2120 ~ 2122, 1473 ms, 387 (MB), Reclaimed Zone : 1, ZLV: 0.769882
[744] :: 2129 ~ 2130, 884 ms, 211 (MB), Reclaimed Zone : 1, ZLV: 0.291394
[745] :: 2142 ~ 2143, 1579 ms, 379 (MB), Reclaimed Zone : 1, ZLV: 0.179153
[746] :: 2146 ~ 2147, 1202 ms, 258 (MB), Reclaimed Zone : 1, ZLV: 0.193744
[747] :: 2147 ~ 2148, 1377 ms, 285 (MB), Reclaimed Zone : 1, ZLV: 0.906831
[748] :: 2164 ~ 2165, 960 ms, 169 (MB), Reclaimed Zone : 1, ZLV: 0.559197
[749] :: 2165 ~ 2167, 1459 ms, 364 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[750] :: 2170 ~ 2172, 1813 ms, 448 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[751] :: 2188 ~ 2190, 1907 ms, 449 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[752] :: 2190 ~ 2192, 1906 ms, 468 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[753] :: 2195 ~ 2197, 2110 ms, 488 (MB), Reclaimed Zone : 1, ZLV: 0.997980
[754] :: 2201 ~ 2203, 1929 ms, 453 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[755] :: 2214 ~ 2216, 1808 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[756] :: 2216 ~ 2218, 1799 ms, 472 (MB), Reclaimed Zone : 1, ZLV: 0.223569
[757] :: 2224 ~ 2225, 974 ms, 203 (MB), Reclaimed Zone : 1, ZLV: 0.628241
[758] :: 2225 ~ 2226, 1329 ms, 372 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[759] :: 2229 ~ 2231, 2108 ms, 461 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[760] :: 2240 ~ 2242, 2039 ms, 469 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[761] :: 2242 ~ 2244, 1988 ms, 480 (MB), Reclaimed Zone : 1, ZLV: 0.518352
[762] :: 2246 ~ 2247, 1568 ms, 372 (MB), Reclaimed Zone : 1, ZLV: 0.227394
[763] :: 2254 ~ 2255, 1638 ms, 380 (MB), Reclaimed Zone : 1, ZLV: 0.289988
[764] :: 2264 ~ 2267, 2029 ms, 480 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[765] :: 2267 ~ 2268, 1815 ms, 486 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[766] :: 2269 ~ 2271, 2270 ms, 490 (MB), Reclaimed Zone : 1, ZLV: 0.835823
[767] :: 2271 ~ 2273, 2007 ms, 497 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[768] :: 2291 ~ 2292, 1044 ms, 220 (MB), Reclaimed Zone : 1, ZLV: 0.181761
[769] :: 2292 ~ 2294, 1422 ms, 387 (MB), Reclaimed Zone : 1, ZLV: 0.443495
[770] :: 2298 ~ 2300, 1396 ms, 371 (MB), Reclaimed Zone : 1, ZLV: 0.224374
[771] :: 2315 ~ 2316, 1661 ms, 384 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[772] :: 2316 ~ 2318, 1758 ms, 469 (MB), Reclaimed Zone : 1, ZLV: 0.398575
[773] :: 2319 ~ 2321, 1913 ms, 505 (MB), Reclaimed Zone : 1, ZLV: 0.385944
[774] :: 2321 ~ 2323, 1957 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[775] :: 2342 ~ 2344, 1406 ms, 298 (MB), Reclaimed Zone : 1, ZLV: 0.871906
[776] :: 2363 ~ 2364, 1193 ms, 253 (MB), Reclaimed Zone : 1, ZLV: 0.197312
[777] :: 2364 ~ 2365, 991 ms, 260 (MB), Reclaimed Zone : 1, ZLV: 0.363388
[778] :: 2365 ~ 2367, 1603 ms, 411 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[779] :: 2370 ~ 2372, 2004 ms, 481 (MB), Reclaimed Zone : 1, ZLV: 0.813348
[780] :: 2388 ~ 2389, 1664 ms, 366 (MB), Reclaimed Zone : 1, ZLV: 0.976543
[781] :: 2390 ~ 2392, 1425 ms, 361 (MB), Reclaimed Zone : 1, ZLV: 0.352120
[782] :: 2392 ~ 2392, 79 ms, 13 (MB), Reclaimed Zone : 1, ZLV: 0.084594
[783] :: 2395 ~ 2396, 577 ms, 133 (MB), Reclaimed Zone : 1, ZLV: 0.183423
[784] :: 2411 ~ 2412, 1571 ms, 371 (MB), Reclaimed Zone : 1, ZLV: 0.893285
[785] :: 2412 ~ 2414, 1598 ms, 378 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[786] :: 2414 ~ 2415, 1569 ms, 395 (MB), Reclaimed Zone : 1, ZLV: 0.375938
[787] :: 2415 ~ 2418, 2048 ms, 519 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[788] :: 2421 ~ 2422, 1340 ms, 341 (MB), Reclaimed Zone : 1, ZLV: 0.395000
[789] :: 2438 ~ 2440, 1726 ms, 424 (MB), Reclaimed Zone : 1, ZLV: 0.200337
[790] :: 2441 ~ 2442, 1555 ms, 409 (MB), Reclaimed Zone : 1, ZLV: 0.260191
[791] :: 2461 ~ 2463, 1817 ms, 426 (MB), Reclaimed Zone : 1, ZLV: 0.746910
[792] :: 2463 ~ 2465, 1913 ms, 497 (MB), Reclaimed Zone : 1, ZLV: 0.788447
[793] :: 2465 ~ 2467, 1915 ms, 504 (MB), Reclaimed Zone : 1, ZLV: 0.455310
[794] :: 2469 ~ 2472, 2157 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[795] :: 2472 ~ 2474, 2198 ms, 478 (MB), Reclaimed Zone : 1, ZLV: 0.768963
[796] :: 2479 ~ 2481, 1768 ms, 428 (MB), Reclaimed Zone : 1, ZLV: 0.307001
[797] :: 2490 ~ 2492, 1641 ms, 429 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[798] :: 2493 ~ 2495, 1721 ms, 437 (MB), Reclaimed Zone : 1, ZLV: 0.884216
[799] :: 2504 ~ 2505, 1270 ms, 272 (MB), Reclaimed Zone : 1, ZLV: 0.121623
[800] :: 2509 ~ 2510, 1380 ms, 320 (MB), Reclaimed Zone : 1, ZLV: 0.236611
[801] :: 2514 ~ 2516, 1961 ms, 436 (MB), Reclaimed Zone : 1, ZLV: 0.305191
[802] :: 2516 ~ 2518, 1946 ms, 491 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[803] :: 2518 ~ 2520, 1984 ms, 520 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[804] :: 2520 ~ 2522, 2012 ms, 523 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[805] :: 2523 ~ 2525, 2343 ms, 536 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[806] :: 2543 ~ 2545, 1994 ms, 479 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[807] :: 2546 ~ 2548, 2046 ms, 499 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[808] :: 2557 ~ 2559, 2007 ms, 475 (MB), Reclaimed Zone : 1, ZLV: 0.310222
[809] :: 2568 ~ 2570, 2019 ms, 497 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[810] :: 2570 ~ 2572, 2313 ms, 512 (MB), Reclaimed Zone : 1, ZLV: 0.467586
[811] :: 2572 ~ 2574, 1908 ms, 515 (MB), Reclaimed Zone : 1, ZLV: 0.940541
[812] :: 2577 ~ 2579, 1864 ms, 484 (MB), Reclaimed Zone : 1, ZLV: 0.270506
[813] :: 2584 ~ 2586, 2258 ms, 485 (MB), Reclaimed Zone : 1, ZLV: 0.385328
[814] :: 2595 ~ 2597, 2205 ms, 522 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[815] :: 2597 ~ 2599, 2072 ms, 525 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[816] :: 2599 ~ 2602, 2114 ms, 528 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[817] :: 2602 ~ 2604, 1990 ms, 528 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[818] :: 2609 ~ 2610, 1600 ms, 403 (MB), Reclaimed Zone : 1, ZLV: 0.486278
[819] :: 2610 ~ 2612, 2000 ms, 514 (MB), Reclaimed Zone : 1, ZLV: 0.229494
[820] :: 2626 ~ 2629, 2202 ms, 545 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[821] :: 2631 ~ 2634, 2365 ms, 542 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[822] :: 2634 ~ 2636, 2179 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[823] :: 2636 ~ 2638, 2398 ms, 508 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[824] :: 2638 ~ 2641, 2561 ms, 557 (MB), Reclaimed Zone : 1, ZLV: 0.993816
[825] :: 2641 ~ 2643, 2039 ms, 564 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[826] :: 2653 ~ 2655, 2139 ms, 491 (MB), Reclaimed Zone : 1, ZLV: 0.578780
[827] :: 2659 ~ 2661, 2422 ms, 573 (MB), Reclaimed Zone : 1, ZLV: 0.903373
[828] :: 2662 ~ 2665, 2252 ms, 509 (MB), Reclaimed Zone : 1, ZLV: 0.715963
[829] :: 2682 ~ 2684, 1850 ms, 439 (MB), Reclaimed Zone : 1, ZLV: 0.516937
[830] :: 2684 ~ 2686, 2239 ms, 576 (MB), Reclaimed Zone : 1, ZLV: 0.687231
[831] :: 2689 ~ 2691, 1923 ms, 467 (MB), Reclaimed Zone : 1, ZLV: 0.724649
[832] :: 2692 ~ 2694, 1943 ms, 511 (MB), Reclaimed Zone : 1, ZLV: 0.872643
[833] :: 2694 ~ 2696, 1973 ms, 532 (MB), Reclaimed Zone : 1, ZLV: 0.304762
[834] :: 2699 ~ 2701, 2184 ms, 558 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[835] :: 2703 ~ 2705, 1714 ms, 317 (MB), Reclaimed Zone : 1, ZLV: 0.399574
[836] :: 2705 ~ 2708, 2608 ms, 519 (MB), Reclaimed Zone : 1, ZLV: 0.967043
[837] :: 2710 ~ 2712, 2727 ms, 572 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[838] :: 2720 ~ 2723, 2468 ms, 578 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[839] :: 2723 ~ 2725, 2134 ms, 577 (MB), Reclaimed Zone : 1, ZLV: 0.271405
[840] :: 2747 ~ 2749, 1361 ms, 338 (MB), Reclaimed Zone : 1, ZLV: 0.342566
[841] :: 2749 ~ 2750, 1662 ms, 432 (MB), Reclaimed Zone : 1, ZLV: 0.229095
[842] :: 2768 ~ 2769, 523 ms, 95 (MB), Reclaimed Zone : 1, ZLV: 0.287755
[843] :: 2769 ~ 2770, 849 ms, 188 (MB), Reclaimed Zone : 1, ZLV: 0.477751
[844] :: 2780 ~ 2781, 1326 ms, 347 (MB), Reclaimed Zone : 1, ZLV: 0.412363
[845] :: 2786 ~ 2788, 1578 ms, 385 (MB), Reclaimed Zone : 1, ZLV: 0.094999
[846] :: 2788 ~ 2789, 1645 ms, 448 (MB), Reclaimed Zone : 1, ZLV: 0.913929
[847] :: 2789 ~ 2791, 1754 ms, 454 (MB), Reclaimed Zone : 1, ZLV: 0.472690
[848] :: 2797 ~ 2799, 2202 ms, 509 (MB), Reclaimed Zone : 1, ZLV: 0.422681
[849] :: 2799 ~ 2801, 2157 ms, 533 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[850] :: 2805 ~ 2807, 2629 ms, 520 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[851] :: 2815 ~ 2818, 2159 ms, 544 (MB), Reclaimed Zone : 1, ZLV: 0.680318
[852] :: 2818 ~ 2820, 2471 ms, 588 (MB), Reclaimed Zone : 1, ZLV: 0.709796
[853] :: 2823 ~ 2824, 1760 ms, 401 (MB), Reclaimed Zone : 1, ZLV: 0.217380
[854] :: 2841 ~ 2843, 2298 ms, 559 (MB), Reclaimed Zone : 1, ZLV: 0.582787
[855] :: 2844 ~ 2846, 1774 ms, 407 (MB), Reclaimed Zone : 1, ZLV: 0.264417
[856] :: 2846 ~ 2848, 1955 ms, 534 (MB), Reclaimed Zone : 1, ZLV: 0.292265
[857] :: 2850 ~ 2853, 2338 ms, 543 (MB), Reclaimed Zone : 1, ZLV: 0.303251
[858] :: 2853 ~ 2855, 2288 ms, 561 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[859] :: 2864 ~ 2866, 2104 ms, 501 (MB), Reclaimed Zone : 1, ZLV: 0.195547
[860] :: 2870 ~ 2873, 2761 ms, 579 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[861] :: 2873 ~ 2875, 2180 ms, 583 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[862] :: 2876 ~ 2878, 1700 ms, 438 (MB), Reclaimed Zone : 1, ZLV: 0.229025
[863] :: 2878 ~ 2880, 2223 ms, 590 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[864] :: 2882 ~ 2884, 2294 ms, 551 (MB), Reclaimed Zone : 1, ZLV: 0.321767
[865] :: 2884 ~ 2887, 2235 ms, 582 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[866] :: 2903 ~ 2905, 1718 ms, 418 (MB), Reclaimed Zone : 1, ZLV: 0.295226
[867] :: 2905 ~ 2907, 1889 ms, 453 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[868] :: 2907 ~ 2909, 2331 ms, 592 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[869] :: 2931 ~ 2932, 1685 ms, 443 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[870] :: 2951 ~ 2953, 1654 ms, 372 (MB), Reclaimed Zone : 1, ZLV: 0.221306
[871] :: 2953 ~ 2954, 1464 ms, 379 (MB), Reclaimed Zone : 1, ZLV: 0.369313
[872] :: 2960 ~ 2961, 1327 ms, 303 (MB), Reclaimed Zone : 1, ZLV: 0.400430
[873] :: 2961 ~ 2963, 1562 ms, 420 (MB), Reclaimed Zone : 1, ZLV: 0.300958
[874] :: 2966 ~ 2967, 389 ms, 86 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[875] :: 2977 ~ 2980, 2070 ms, 499 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[876] :: 2982 ~ 2984, 1908 ms, 447 (MB), Reclaimed Zone : 1, ZLV: 0.284868
[877] :: 2984 ~ 2986, 1878 ms, 485 (MB), Reclaimed Zone : 1, ZLV: 0.505224
[878] :: 2989 ~ 2991, 2207 ms, 539 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[879] :: 2991 ~ 2994, 2161 ms, 546 (MB), Reclaimed Zone : 1, ZLV: 0.230697
[880] :: 2996 ~ 2998, 2387 ms, 513 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[881] :: 3007 ~ 3009, 2467 ms, 577 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[882] :: 3009 ~ 3011, 2153 ms, 574 (MB), Reclaimed Zone : 1, ZLV: 0.437230
[883] :: 3015 ~ 3018, 2388 ms, 581 (MB), Reclaimed Zone : 1, ZLV: 0.202055
[884] :: 3034 ~ 3036, 1382 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 0.300738
[885] :: 3039 ~ 3040, 893 ms, 195 (MB), Reclaimed Zone : 1, ZLV: 0.490075
[886] :: 3046 ~ 3048, 1853 ms, 374 (MB), Reclaimed Zone : 1, ZLV: 0.514475
[887] :: 3057 ~ 3059, 2015 ms, 511 (MB), Reclaimed Zone : 1, ZLV: 0.236524
[888] :: 3059 ~ 3061, 2208 ms, 517 (MB), Reclaimed Zone : 1, ZLV: 0.752964
[889] :: 3066 ~ 3067, 1113 ms, 239 (MB), Reclaimed Zone : 1, ZLV: 0.220183
[890] :: 3082 ~ 3083, 1652 ms, 371 (MB), Reclaimed Zone : 1, ZLV: 0.343086
[891] :: 3084 ~ 3086, 2175 ms, 449 (MB), Reclaimed Zone : 1, ZLV: 0.916720
[892] :: 3089 ~ 3090, 1008 ms, 213 (MB), Reclaimed Zone : 1, ZLV: 0.256897
[893] :: 3106 ~ 3108, 2205 ms, 464 (MB), Reclaimed Zone : 1, ZLV: 0.642183
[894] :: 3110 ~ 3112, 1969 ms, 467 (MB), Reclaimed Zone : 1, ZLV: 0.221359
[895] :: 3112 ~ 3114, 1763 ms, 475 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[896] :: 3116 ~ 3118, 1836 ms, 396 (MB), Reclaimed Zone : 1, ZLV: 0.230312
[897] :: 3133 ~ 3134, 1453 ms, 304 (MB), Reclaimed Zone : 1, ZLV: 0.639610
[898] :: 3134 ~ 3134, 148 ms, 23 (MB), Reclaimed Zone : 1, ZLV: 0.250000
[899] :: 3134 ~ 3136, 1552 ms, 412 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[900] :: 3139 ~ 3140, 1775 ms, 408 (MB), Reclaimed Zone : 1, ZLV: 0.176608
[901] :: 3158 ~ 3159, 1804 ms, 398 (MB), Reclaimed Zone : 1, ZLV: 0.189027
[902] :: 3159 ~ 3161, 1709 ms, 447 (MB), Reclaimed Zone : 1, ZLV: 0.731696
[903] :: 3165 ~ 3167, 1651 ms, 396 (MB), Reclaimed Zone : 1, ZLV: 0.178264
[904] :: 3170 ~ 3172, 1872 ms, 459 (MB), Reclaimed Zone : 1, ZLV: 0.223140
[905] :: 3172 ~ 3174, 1841 ms, 494 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[906] :: 3176 ~ 3176, 177 ms, 41 (MB), Reclaimed Zone : 1, ZLV: 0.357483
[907] :: 3180 ~ 3182, 1537 ms, 396 (MB), Reclaimed Zone : 1, ZLV: 0.603058
[908] :: 3187 ~ 3189, 2171 ms, 506 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[909] :: 3189 ~ 3191, 1963 ms, 513 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[910] :: 3191 ~ 3194, 2313 ms, 526 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[911] :: 3214 ~ 3216, 1635 ms, 406 (MB), Reclaimed Zone : 1, ZLV: 0.289058
[912] :: 3220 ~ 3221, 1123 ms, 258 (MB), Reclaimed Zone : 1, ZLV: 0.332229
[913] :: 3224 ~ 3227, 2564 ms, 525 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[914] :: 3235 ~ 3238, 2264 ms, 547 (MB), Reclaimed Zone : 1, ZLV: 0.844983
[915] :: 3238 ~ 3240, 2100 ms, 580 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[916] :: 3241 ~ 3243, 2002 ms, 523 (MB), Reclaimed Zone : 1, ZLV: 0.193557
[917] :: 3246 ~ 3248, 1941 ms, 469 (MB), Reclaimed Zone : 1, ZLV: 0.328889
[918] :: 3248 ~ 3250, 2280 ms, 543 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[919] :: 3255 ~ 3257, 2112 ms, 523 (MB), Reclaimed Zone : 1, ZLV: 0.524712
[920] :: 3267 ~ 3270, 2204 ms, 547 (MB), Reclaimed Zone : 1, ZLV: 0.149154
[921] :: 3270 ~ 3272, 2353 ms, 570 (MB), Reclaimed Zone : 1, ZLV: 0.921646
[922] :: 3277 ~ 3278, 1260 ms, 327 (MB), Reclaimed Zone : 1, ZLV: 0.156097
[923] :: 3293 ~ 3295, 1734 ms, 431 (MB), Reclaimed Zone : 1, ZLV: 0.277607
[924] :: 3295 ~ 3297, 2164 ms, 540 (MB), Reclaimed Zone : 1, ZLV: 0.391871
[925] :: 3298 ~ 3301, 2349 ms, 559 (MB), Reclaimed Zone : 1, ZLV: 0.798037
[926] :: 3301 ~ 3303, 2383 ms, 577 (MB), Reclaimed Zone : 1, ZLV: 0.676259
[927] :: 3306 ~ 3308, 2090 ms, 482 (MB), Reclaimed Zone : 1, ZLV: 0.887796
[928] :: 3324 ~ 3326, 2045 ms, 493 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[929] :: 3326 ~ 3326, 43 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.333333
[930] :: 3326 ~ 3328, 1963 ms, 523 (MB), Reclaimed Zone : 1, ZLV: 0.920627
[931] :: 3328 ~ 3330, 2087 ms, 539 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[932] :: 3333 ~ 3335, 2388 ms, 577 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[933] :: 3342 ~ 3343, 1489 ms, 395 (MB), Reclaimed Zone : 1, ZLV: 0.214220
[934] :: 3354 ~ 3355, 1961 ms, 501 (MB), Reclaimed Zone : 1, ZLV: 0.575344
[935] :: 3358 ~ 3360, 2504 ms, 525 (MB), Reclaimed Zone : 1, ZLV: 0.242460
[936] :: 3360 ~ 3362, 1990 ms, 531 (MB), Reclaimed Zone : 1, ZLV: 0.224512
[937] :: 3369 ~ 3371, 2135 ms, 526 (MB), Reclaimed Zone : 1, ZLV: 0.300177
[938] :: 3382 ~ 3384, 2356 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[939] :: 3387 ~ 3390, 2264 ms, 562 (MB), Reclaimed Zone : 1, ZLV: 0.278088
[940] :: 3390 ~ 3392, 2217 ms, 574 (MB), Reclaimed Zone : 1, ZLV: 0.476825
[941] :: 3395 ~ 3396, 1546 ms, 419 (MB), Reclaimed Zone : 1, ZLV: 0.530521
[942] :: 3400 ~ 3401, 1672 ms, 377 (MB), Reclaimed Zone : 1, ZLV: 0.813762
[943] :: 3411 ~ 3413, 2078 ms, 461 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[944] :: 3413 ~ 3415, 2128 ms, 506 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[945] :: 3417 ~ 3420, 2436 ms, 579 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[946] :: 3422 ~ 3424, 2040 ms, 500 (MB), Reclaimed Zone : 1, ZLV: 0.191270
[947] :: 3428 ~ 3430, 1731 ms, 401 (MB), Reclaimed Zone : 1, ZLV: 0.302231
[948] :: 3442 ~ 3444, 2301 ms, 519 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[949] :: 3450 ~ 3451, 1395 ms, 292 (MB), Reclaimed Zone : 1, ZLV: 0.469284
[950] :: 3461 ~ 3462, 1476 ms, 325 (MB), Reclaimed Zone : 1, ZLV: 0.298688
[951] :: 3462 ~ 3464, 1915 ms, 464 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[952] :: 3468 ~ 3470, 1932 ms, 463 (MB), Reclaimed Zone : 1, ZLV: 0.649041
[953] :: 3475 ~ 3477, 2009 ms, 461 (MB), Reclaimed Zone : 1, ZLV: 0.145990
[954] :: 3487 ~ 3489, 1973 ms, 469 (MB), Reclaimed Zone : 1, ZLV: 0.851507
[955] :: 3489 ~ 3491, 2057 ms, 579 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[956] :: 3491 ~ 3493, 2495 ms, 581 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[957] :: 3497 ~ 3499, 1746 ms, 437 (MB), Reclaimed Zone : 1, ZLV: 0.696513
[958] :: 3514 ~ 3516, 2233 ms, 570 (MB), Reclaimed Zone : 1, ZLV: 0.243217
[959] :: 3516 ~ 3519, 2625 ms, 597 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[960] :: 3519 ~ 3521, 2453 ms, 596 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[961] :: 3525 ~ 3527, 1621 ms, 375 (MB), Reclaimed Zone : 1, ZLV: 0.227033
[962] :: 3531 ~ 3532, 319 ms, 75 (MB), Reclaimed Zone : 1, ZLV: 0.255388
[963] :: 3542 ~ 3544, 2089 ms, 478 (MB), Reclaimed Zone : 1, ZLV: 0.632117
[964] :: 3554 ~ 3555, 1048 ms, 245 (MB), Reclaimed Zone : 1, ZLV: 0.147725
[965] :: 3565 ~ 3567, 2331 ms, 569 (MB), Reclaimed Zone : 1, ZLV: 0.973521
[966] :: 3567 ~ 3569, 2140 ms, 579 (MB), Reclaimed Zone : 1, ZLV: 0.411559
[967] :: 3571 ~ 3573, 2231 ms, 573 (MB), Reclaimed Zone : 1, ZLV: 0.838361
[968] :: 3576 ~ 3577, 1817 ms, 441 (MB), Reclaimed Zone : 1, ZLV: 0.239804
[969] :: 3578 ~ 3580, 1965 ms, 446 (MB), Reclaimed Zone : 1, ZLV: 0.259822
[970] :: 3580 ~ 3582, 2149 ms, 533 (MB), Reclaimed Zone : 1, ZLV: 0.406632
[971] :: 3586 ~ 3589, 2602 ms, 559 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[972] :: 3592 ~ 3595, 2567 ms, 575 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[973] :: 3598 ~ 3601, 2506 ms, 612 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[974] :: 3601 ~ 3603, 2234 ms, 603 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[975] :: 3603 ~ 3605, 2280 ms, 604 (MB), Reclaimed Zone : 1, ZLV: 0.593877
[976] :: 3626 ~ 3628, 1773 ms, 427 (MB), Reclaimed Zone : 1, ZLV: 0.294091
[977] :: 3628 ~ 3630, 2345 ms, 583 (MB), Reclaimed Zone : 1, ZLV: 0.397040
[978] :: 3633 ~ 3635, 2413 ms, 603 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[979] :: 3635 ~ 3637, 2281 ms, 617 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[980] :: 3638 ~ 3639, 1713 ms, 370 (MB), Reclaimed Zone : 1, ZLV: 0.178578
[981] :: 3644 ~ 3646, 2660 ms, 589 (MB), Reclaimed Zone : 1, ZLV: 0.902725
[982] :: 3649 ~ 3652, 2265 ms, 615 (MB), Reclaimed Zone : 1, ZLV: 0.577649
[983] :: 3657 ~ 3660, 2471 ms, 630 (MB), Reclaimed Zone : 1, ZLV: 0.956828
[984] :: 3662 ~ 3664, 2176 ms, 511 (MB), Reclaimed Zone : 1, ZLV: 0.284589
[985] :: 3670 ~ 3672, 1356 ms, 356 (MB), Reclaimed Zone : 1, ZLV: 0.346454
[986] :: 3672 ~ 3674, 2018 ms, 521 (MB), Reclaimed Zone : 1, ZLV: 0.170190
[987] :: 3685 ~ 3687, 2373 ms, 558 (MB), Reclaimed Zone : 1, ZLV: 0.253979
[988] :: 3692 ~ 3694, 2169 ms, 538 (MB), Reclaimed Zone : 1, ZLV: 0.250952
[989] :: 3704 ~ 3706, 2146 ms, 567 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[990] :: 3711 ~ 3713, 2288 ms, 573 (MB), Reclaimed Zone : 1, ZLV: 0.473144
[991] :: 3713 ~ 3716, 2227 ms, 576 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[992] :: 3716 ~ 3718, 2363 ms, 536 (MB), Reclaimed Zone : 1, ZLV: 0.384550
[993] :: 3724 ~ 3726, 1573 ms, 336 (MB), Reclaimed Zone : 1, ZLV: 0.232014
[994] :: 3726 ~ 3728, 2179 ms, 564 (MB), Reclaimed Zone : 1, ZLV: 0.212371
[995] :: 3730 ~ 3732, 2198 ms, 520 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[996] :: 3736 ~ 3738, 2231 ms, 563 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[997] :: 3743 ~ 3746, 2343 ms, 588 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[998] :: 3746 ~ 3748, 2453 ms, 593 (MB), Reclaimed Zone : 1, ZLV: 0.815309
[999] :: 3751 ~ 3753, 1495 ms, 335 (MB), Reclaimed Zone : 1, ZLV: 0.297030
[1000] :: 3769 ~ 3770, 1873 ms, 461 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1001] :: 3770 ~ 3773, 2475 ms, 598 (MB), Reclaimed Zone : 1, ZLV: 0.849271
[1002] :: 3774 ~ 3776, 2234 ms, 606 (MB), Reclaimed Zone : 1, ZLV: 0.617631
[1003] :: 3780 ~ 3781, 1040 ms, 212 (MB), Reclaimed Zone : 1, ZLV: 0.262403
[1004] :: 3791 ~ 3792, 1195 ms, 298 (MB), Reclaimed Zone : 1, ZLV: 0.881994
[1005] :: 3797 ~ 3800, 2296 ms, 509 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1006] :: 3800 ~ 3802, 2070 ms, 551 (MB), Reclaimed Zone : 1, ZLV: 0.401195
[1007] :: 3805 ~ 3808, 2902 ms, 628 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1008] :: 3808 ~ 3811, 2557 ms, 625 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1009] :: 3811 ~ 3813, 2133 ms, 480 (MB), Reclaimed Zone : 1, ZLV: 0.245990
[1010] :: 3829 ~ 3831, 2302 ms, 542 (MB), Reclaimed Zone : 1, ZLV: 0.845935
[1011] :: 3833 ~ 3835, 2357 ms, 625 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1012] :: 3838 ~ 3840, 1817 ms, 404 (MB), Reclaimed Zone : 1, ZLV: 0.719998
[1013] :: 3844 ~ 3845, 1680 ms, 396 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1014] :: 3856 ~ 3858, 2273 ms, 494 (MB), Reclaimed Zone : 1, ZLV: 0.967646
[1015] :: 3858 ~ 3860, 2110 ms, 552 (MB), Reclaimed Zone : 1, ZLV: 0.398224
[1016] :: 3860 ~ 3862, 2067 ms, 560 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1017] :: 3862 ~ 3865, 2488 ms, 590 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1018] :: 3867 ~ 3869, 1508 ms, 371 (MB), Reclaimed Zone : 1, ZLV: 0.902317
[1019] :: 3869 ~ 3869, 26 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.062097
[1020] :: 3869 ~ 3872, 2197 ms, 527 (MB), Reclaimed Zone : 1, ZLV: 0.180933
[1021] :: 3882 ~ 3884, 2113 ms, 470 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1022] :: 3887 ~ 3890, 2227 ms, 529 (MB), Reclaimed Zone : 1, ZLV: 0.457494
[1023] :: 3890 ~ 3892, 2477 ms, 629 (MB), Reclaimed Zone : 1, ZLV: 0.954968
[1024] :: 3892 ~ 3895, 2595 ms, 630 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1025] :: 3914 ~ 3916, 1660 ms, 415 (MB), Reclaimed Zone : 1, ZLV: 0.293179
[1026] :: 3918 ~ 3920, 2134 ms, 468 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1027] :: 3920 ~ 3923, 2442 ms, 536 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1028] :: 3923 ~ 3925, 2257 ms, 566 (MB), Reclaimed Zone : 1, ZLV: 0.470361
[1029] :: 3941 ~ 3943, 1514 ms, 347 (MB), Reclaimed Zone : 1, ZLV: 0.718787
[1030] :: 3943 ~ 3945, 2012 ms, 492 (MB), Reclaimed Zone : 1, ZLV: 0.227979
[1031] :: 3954 ~ 3956, 1656 ms, 398 (MB), Reclaimed Zone : 1, ZLV: 0.252589
[1032] :: 3966 ~ 3968, 2066 ms, 516 (MB), Reclaimed Zone : 1, ZLV: 0.282940
[1033] :: 3968 ~ 3970, 1993 ms, 538 (MB), Reclaimed Zone : 1, ZLV: 0.772898
[1034] :: 3974 ~ 3976, 1839 ms, 470 (MB), Reclaimed Zone : 1, ZLV: 0.321964
[1035] :: 3976 ~ 3978, 2083 ms, 544 (MB), Reclaimed Zone : 1, ZLV: 0.623452
[1036] :: 3995 ~ 3997, 2223 ms, 547 (MB), Reclaimed Zone : 1, ZLV: 0.564371
[1037] :: 3997 ~ 4000, 2325 ms, 590 (MB), Reclaimed Zone : 1, ZLV: 0.833057
[1038] :: 4000 ~ 4003, 2818 ms, 613 (MB), Reclaimed Zone : 1, ZLV: 0.870192
[1039] :: 4022 ~ 4023, 1185 ms, 242 (MB), Reclaimed Zone : 1, ZLV: 0.688259
[1040] :: 4023 ~ 4025, 1531 ms, 385 (MB), Reclaimed Zone : 1, ZLV: 0.961141
[1041] :: 4025 ~ 4028, 2987 ms, 616 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1042] :: 4031 ~ 4034, 2682 ms, 616 (MB), Reclaimed Zone : 1, ZLV: 0.764504
[1043] :: 4034 ~ 4036, 2520 ms, 634 (MB), Reclaimed Zone : 1, ZLV: 0.908515
[1044] :: 4036 ~ 4038, 2225 ms, 488 (MB), Reclaimed Zone : 1, ZLV: 0.250646
[1045] :: 4038 ~ 4041, 2519 ms, 632 (MB), Reclaimed Zone : 1, ZLV: 0.708135
[1046] :: 4046 ~ 4048, 1549 ms, 302 (MB), Reclaimed Zone : 1, ZLV: 0.789882
[1047] :: 4052 ~ 4054, 1811 ms, 367 (MB), Reclaimed Zone : 1, ZLV: 0.883960
[1048] :: 4058 ~ 4061, 2743 ms, 625 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1049] :: 4061 ~ 4064, 2542 ms, 626 (MB), Reclaimed Zone : 1, ZLV: 0.731062
[1050] :: 4073 ~ 4075, 1727 ms, 444 (MB), Reclaimed Zone : 1, ZLV: 0.281282
[1051] :: 4087 ~ 4089, 2125 ms, 527 (MB), Reclaimed Zone : 1, ZLV: 0.460149
[1052] :: 4097 ~ 4099, 1621 ms, 367 (MB), Reclaimed Zone : 1, ZLV: 0.178453
[1053] :: 4108 ~ 4110, 1729 ms, 411 (MB), Reclaimed Zone : 1, ZLV: 0.250771
[1054] :: 4110 ~ 4110, 139 ms, 26 (MB), Reclaimed Zone : 1, ZLV: 0.320453
[1055] :: 4110 ~ 4112, 1896 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 0.799701
[1056] :: 4112 ~ 4114, 2200 ms, 572 (MB), Reclaimed Zone : 1, ZLV: 0.618350
[1057] :: 4121 ~ 4122, 983 ms, 234 (MB), Reclaimed Zone : 1, ZLV: 0.158365
[1058] :: 4136 ~ 4138, 2153 ms, 571 (MB), Reclaimed Zone : 1, ZLV: 0.524888
[1059] :: 4138 ~ 4140, 2384 ms, 621 (MB), Reclaimed Zone : 1, ZLV: 0.762860
[1060] :: 4141 ~ 4143, 2720 ms, 632 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1061] :: 4146 ~ 4148, 1657 ms, 434 (MB), Reclaimed Zone : 1, ZLV: 0.291004
[1062] :: 4164 ~ 4165, 1381 ms, 321 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1063] :: 4165 ~ 4168, 2650 ms, 643 (MB), Reclaimed Zone : 1, ZLV: 0.369597
[1064] :: 4171 ~ 4173, 2543 ms, 638 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1065] :: 4173 ~ 4176, 2879 ms, 646 (MB), Reclaimed Zone : 1, ZLV: 0.999172
[1066] :: 4177 ~ 4179, 2282 ms, 478 (MB), Reclaimed Zone : 1, ZLV: 0.189828
[1067] :: 4194 ~ 4197, 2491 ms, 583 (MB), Reclaimed Zone : 1, ZLV: 0.839909
[1068] :: 4197 ~ 4199, 2361 ms, 621 (MB), Reclaimed Zone : 1, ZLV: 0.635208
[1069] :: 4199 ~ 4201, 2378 ms, 621 (MB), Reclaimed Zone : 1, ZLV: 0.365934
[1070] :: 4203 ~ 4205, 2031 ms, 486 (MB), Reclaimed Zone : 1, ZLV: 0.159813
[1071] :: 4205 ~ 4208, 2187 ms, 604 (MB), Reclaimed Zone : 1, ZLV: 0.508690
[1072] :: 4210 ~ 4211, 1743 ms, 435 (MB), Reclaimed Zone : 1, ZLV: 0.230561
[1073] :: 4211 ~ 4214, 2730 ms, 638 (MB), Reclaimed Zone : 1, ZLV: 0.826017
[1074] :: 4216 ~ 4218, 2737 ms, 661 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1075] :: 4218 ~ 4221, 2616 ms, 663 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1076] :: 4229 ~ 4231, 1825 ms, 363 (MB), Reclaimed Zone : 1, ZLV: 0.673219
[1077] :: 4239 ~ 4240, 1696 ms, 378 (MB), Reclaimed Zone : 1, ZLV: 0.171395
[1078] :: 4241 ~ 4243, 2287 ms, 484 (MB), Reclaimed Zone : 1, ZLV: 0.286295
[1079] :: 4247 ~ 4249, 2618 ms, 562 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1080] :: 4258 ~ 4260, 2145 ms, 484 (MB), Reclaimed Zone : 1, ZLV: 0.101614
[1081] :: 4260 ~ 4263, 2466 ms, 619 (MB), Reclaimed Zone : 1, ZLV: 0.440359
[1082] :: 4273 ~ 4275, 2221 ms, 473 (MB), Reclaimed Zone : 1, ZLV: 0.272358
[1083] :: 4284 ~ 4286, 2101 ms, 489 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1084] :: 4286 ~ 4288, 1978 ms, 521 (MB), Reclaimed Zone : 1, ZLV: 0.374736
[1085] :: 4309 ~ 4311, 1865 ms, 460 (MB), Reclaimed Zone : 1, ZLV: 0.265321
[1086] :: 4311 ~ 4313, 1955 ms, 517 (MB), Reclaimed Zone : 1, ZLV: 0.389767
[1087] :: 4313 ~ 4315, 2184 ms, 531 (MB), Reclaimed Zone : 1, ZLV: 0.713399
[1088] :: 4315 ~ 4317, 2231 ms, 535 (MB), Reclaimed Zone : 1, ZLV: 0.999286
[1089] :: 4324 ~ 4325, 1435 ms, 330 (MB), Reclaimed Zone : 1, ZLV: 0.456274
[1090] :: 4325 ~ 4327, 2218 ms, 560 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1091] :: 4330 ~ 4332, 2352 ms, 512 (MB), Reclaimed Zone : 1, ZLV: 0.994475
[1092] :: 4341 ~ 4344, 2297 ms, 528 (MB), Reclaimed Zone : 1, ZLV: 0.647360
[1093] :: 4344 ~ 4346, 2280 ms, 582 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1094] :: 4350 ~ 4352, 2146 ms, 518 (MB), Reclaimed Zone : 1, ZLV: 0.280236
[1095] :: 4357 ~ 4359, 1523 ms, 379 (MB), Reclaimed Zone : 1, ZLV: 0.252047
[1096] :: 4359 ~ 4361, 2138 ms, 519 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1097] :: 4366 ~ 4368, 2353 ms, 567 (MB), Reclaimed Zone : 1, ZLV: 0.254322
[1098] :: 4375 ~ 4377, 2389 ms, 577 (MB), Reclaimed Zone : 1, ZLV: 0.292255
[1099] :: 4382 ~ 4384, 1756 ms, 370 (MB), Reclaimed Zone : 1, ZLV: 0.230014
[1100] :: 4384 ~ 4386, 2300 ms, 602 (MB), Reclaimed Zone : 1, ZLV: 0.612176
[1101] :: 4391 ~ 4393, 2561 ms, 611 (MB), Reclaimed Zone : 1, ZLV: 0.951928
[1102] :: 4402 ~ 4405, 2343 ms, 603 (MB), Reclaimed Zone : 1, ZLV: 0.483287
[1103] :: 4405 ~ 4407, 2449 ms, 630 (MB), Reclaimed Zone : 1, ZLV: 0.451409
[1104] :: 4412 ~ 4415, 2932 ms, 644 (MB), Reclaimed Zone : 1, ZLV: 0.243209
[1105] :: 4429 ~ 4432, 2040 ms, 434 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1106] :: 4432 ~ 4434, 2468 ms, 630 (MB), Reclaimed Zone : 1, ZLV: 0.824638
[1107] :: 4434 ~ 4437, 2676 ms, 651 (MB), Reclaimed Zone : 1, ZLV: 0.942459
[1108] :: 4437 ~ 4440, 2635 ms, 658 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1109] :: 4445 ~ 4447, 1576 ms, 405 (MB), Reclaimed Zone : 1, ZLV: 0.177312
[1110] :: 4447 ~ 4449, 2364 ms, 600 (MB), Reclaimed Zone : 1, ZLV: 0.940808
[1111] :: 4452 ~ 4454, 1924 ms, 483 (MB), Reclaimed Zone : 1, ZLV: 0.995771
[1112] :: 4459 ~ 4461, 2542 ms, 666 (MB), Reclaimed Zone : 1, ZLV: 0.909157
[1113] :: 4473 ~ 4473, 447 ms, 104 (MB), Reclaimed Zone : 1, ZLV: 0.261479
[1114] :: 4477 ~ 4480, 2266 ms, 487 (MB), Reclaimed Zone : 1, ZLV: 0.955981
[1115] :: 4483 ~ 4485, 1850 ms, 488 (MB), Reclaimed Zone : 1, ZLV: 0.264098
[1116] :: 4491 ~ 4493, 2601 ms, 639 (MB), Reclaimed Zone : 1, ZLV: 0.417483
[1117] :: 4493 ~ 4496, 2421 ms, 661 (MB), Reclaimed Zone : 1, ZLV: 0.836979
[1118] :: 4496 ~ 4498, 2386 ms, 670 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1119] :: 4498 ~ 4501, 2687 ms, 677 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1120] :: 4501 ~ 4504, 2837 ms, 676 (MB), Reclaimed Zone : 1, ZLV: 0.940923
[1121] :: 4511 ~ 4513, 1992 ms, 479 (MB), Reclaimed Zone : 1, ZLV: 0.470354
[1122] :: 4513 ~ 4515, 1987 ms, 520 (MB), Reclaimed Zone : 1, ZLV: 0.225069
[1123] :: 4516 ~ 4518, 2554 ms, 553 (MB), Reclaimed Zone : 1, ZLV: 0.368953
[1124] :: 4518 ~ 4521, 2869 ms, 572 (MB), Reclaimed Zone : 1, ZLV: 0.846599
[1125] :: 4528 ~ 4530, 2485 ms, 643 (MB), Reclaimed Zone : 1, ZLV: 0.725615
[1126] :: 4541 ~ 4543, 1944 ms, 515 (MB), Reclaimed Zone : 1, ZLV: 0.222801
[1127] :: 4556 ~ 4558, 2249 ms, 569 (MB), Reclaimed Zone : 1, ZLV: 0.836160
[1128] :: 4561 ~ 4563, 1885 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 0.912201
[1129] :: 4567 ~ 4569, 1705 ms, 458 (MB), Reclaimed Zone : 1, ZLV: 0.196113
[1130] :: 4580 ~ 4582, 2424 ms, 605 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1131] :: 4582 ~ 4585, 2834 ms, 614 (MB), Reclaimed Zone : 1, ZLV: 0.441041
[1132] :: 4585 ~ 4587, 2323 ms, 635 (MB), Reclaimed Zone : 1, ZLV: 0.623696
[1133] :: 4590 ~ 4592, 2024 ms, 465 (MB), Reclaimed Zone : 1, ZLV: 0.254731
[1134] :: 4592 ~ 4595, 2828 ms, 651 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1135] :: 4595 ~ 4597, 2218 ms, 519 (MB), Reclaimed Zone : 1, ZLV: 0.294074
[1136] :: 4619 ~ 4622, 2307 ms, 488 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1137] :: 4622 ~ 4624, 2444 ms, 568 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1138] :: 4628 ~ 4630, 2462 ms, 575 (MB), Reclaimed Zone : 1, ZLV: 0.233057
[1139] :: 4630 ~ 4633, 2606 ms, 606 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1140] :: 4634 ~ 4636, 2137 ms, 508 (MB), Reclaimed Zone : 1, ZLV: 0.369995
[1141] :: 4639 ~ 4642, 2796 ms, 631 (MB), Reclaimed Zone : 1, ZLV: 0.710547
[1142] :: 4642 ~ 4644, 2495 ms, 655 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1143] :: 4644 ~ 4647, 2694 ms, 657 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1144] :: 4647 ~ 4650, 3029 ms, 684 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1145] :: 4656 ~ 4658, 1502 ms, 348 (MB), Reclaimed Zone : 1, ZLV: 0.209590
[1146] :: 4671 ~ 4673, 1677 ms, 360 (MB), Reclaimed Zone : 1, ZLV: 0.365223
[1147] :: 4675 ~ 4677, 2045 ms, 499 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1148] :: 4684 ~ 4686, 1883 ms, 494 (MB), Reclaimed Zone : 1, ZLV: 0.352468
[1149] :: 4696 ~ 4699, 2180 ms, 529 (MB), Reclaimed Zone : 1, ZLV: 0.466656
[1150] :: 4699 ~ 4701, 1979 ms, 555 (MB), Reclaimed Zone : 1, ZLV: 0.439760
[1151] :: 4701 ~ 4703, 1924 ms, 453 (MB), Reclaimed Zone : 1, ZLV: 0.671543
[1152] :: 4703 ~ 4703, 69 ms, 7 (MB), Reclaimed Zone : 1, ZLV: 0.215982
[1153] :: 4706 ~ 4707, 1079 ms, 285 (MB), Reclaimed Zone : 1, ZLV: 0.158359
[1154] :: 4708 ~ 4710, 2198 ms, 567 (MB), Reclaimed Zone : 1, ZLV: 0.476556
[1155] :: 4726 ~ 4728, 2291 ms, 559 (MB), Reclaimed Zone : 1, ZLV: 0.856780
[1156] :: 4728 ~ 4730, 2116 ms, 560 (MB), Reclaimed Zone : 1, ZLV: 0.834520
[1157] :: 4730 ~ 4733, 2453 ms, 663 (MB), Reclaimed Zone : 1, ZLV: 0.617573
[1158] :: 4737 ~ 4739, 2099 ms, 508 (MB), Reclaimed Zone : 1, ZLV: 0.086113
[1159] :: 4739 ~ 4741, 2416 ms, 649 (MB), Reclaimed Zone : 1, ZLV: 0.273471
[1160] :: 4752 ~ 4755, 2674 ms, 510 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1161] :: 4759 ~ 4761, 2183 ms, 516 (MB), Reclaimed Zone : 1, ZLV: 0.233805
[1162] :: 4761 ~ 4763, 2173 ms, 594 (MB), Reclaimed Zone : 1, ZLV: 0.838158
[1163] :: 4763 ~ 4765, 2471 ms, 625 (MB), Reclaimed Zone : 1, ZLV: 0.888515
[1164] :: 4766 ~ 4768, 2849 ms, 646 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1165] :: 4777 ~ 4778, 1143 ms, 252 (MB), Reclaimed Zone : 1, ZLV: 0.260932
[1166] :: 4789 ~ 4791, 2117 ms, 485 (MB), Reclaimed Zone : 1, ZLV: 0.794003
[1167] :: 4794 ~ 4795, 1521 ms, 328 (MB), Reclaimed Zone : 1, ZLV: 0.259618
[1168] :: 4796 ~ 4797, 1932 ms, 527 (MB), Reclaimed Zone : 1, ZLV: 0.261211
[1169] :: 4803 ~ 4805, 2128 ms, 546 (MB), Reclaimed Zone : 1, ZLV: 0.190452
[1170] :: 4816 ~ 4818, 2177 ms, 552 (MB), Reclaimed Zone : 1, ZLV: 0.780114
[1171] :: 4821 ~ 4824, 2580 ms, 641 (MB), Reclaimed Zone : 1, ZLV: 0.696909
[1172] :: 4824 ~ 4827, 2723 ms, 649 (MB), Reclaimed Zone : 1, ZLV: 0.344621
[1173] :: 4827 ~ 4830, 2753 ms, 668 (MB), Reclaimed Zone : 1, ZLV: 0.727716
[1174] :: 4830 ~ 4833, 3025 ms, 678 (MB), Reclaimed Zone : 1, ZLV: 0.782228
[1175] :: 4833 ~ 4836, 2690 ms, 679 (MB), Reclaimed Zone : 1, ZLV: 0.417758
[1176] :: 4846 ~ 4850, 3132 ms, 685 (MB), Reclaimed Zone : 1, ZLV: 0.806122
[1177] :: 4852 ~ 4855, 2934 ms, 681 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1178] :: 4855 ~ 4858, 3103 ms, 697 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1179] :: 4859 ~ 4861, 1961 ms, 449 (MB), Reclaimed Zone : 1, ZLV: 0.251422
[1180] :: 4861 ~ 4863, 2727 ms, 695 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1181] :: 4865 ~ 4867, 1719 ms, 428 (MB), Reclaimed Zone : 1, ZLV: 0.271545
[1182] :: 4884 ~ 4887, 2598 ms, 667 (MB), Reclaimed Zone : 1, ZLV: 0.212295
[1183] :: 4893 ~ 4895, 1809 ms, 394 (MB), Reclaimed Zone : 1, ZLV: 0.144479
[1184] :: 4903 ~ 4905, 1647 ms, 438 (MB), Reclaimed Zone : 1, ZLV: 0.410760
[1185] :: 4910 ~ 4913, 2042 ms, 484 (MB), Reclaimed Zone : 1, ZLV: 0.402123
[1186] :: 4913 ~ 4914, 1975 ms, 497 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1187] :: 4919 ~ 4921, 2123 ms, 454 (MB), Reclaimed Zone : 1, ZLV: 0.151461
[1188] :: 4921 ~ 4923, 1771 ms, 463 (MB), Reclaimed Zone : 1, ZLV: 0.299811
[1189] :: 4928 ~ 4930, 2008 ms, 478 (MB), Reclaimed Zone : 1, ZLV: 0.271937
[1190] :: 4939 ~ 4941, 2224 ms, 522 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1191] :: 4943 ~ 4944, 777 ms, 165 (MB), Reclaimed Zone : 1, ZLV: 0.238164
[1192] :: 4947 ~ 4949, 2177 ms, 552 (MB), Reclaimed Zone : 1, ZLV: 0.739337
[1193] :: 4949 ~ 4951, 2081 ms, 581 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1194] :: 4951 ~ 4953, 2585 ms, 585 (MB), Reclaimed Zone : 1, ZLV: 0.534398
[1195] :: 4956 ~ 4959, 2916 ms, 600 (MB), Reclaimed Zone : 1, ZLV: 0.741375
[1196] :: 4959 ~ 4962, 2521 ms, 593 (MB), Reclaimed Zone : 1, ZLV: 0.270337
[1197] :: 4968 ~ 4971, 2366 ms, 592 (MB), Reclaimed Zone : 1, ZLV: 0.217260
[1198] :: 4973 ~ 4976, 2543 ms, 600 (MB), Reclaimed Zone : 1, ZLV: 0.463430
[1199] :: 4976 ~ 4978, 2412 ms, 615 (MB), Reclaimed Zone : 1, ZLV: 0.199420
[1200] :: 4995 ~ 4998, 2453 ms, 508 (MB), Reclaimed Zone : 1, ZLV: 0.793810
[1201] :: 4998 ~ 5000, 2553 ms, 610 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1202] :: 5000 ~ 5003, 2516 ms, 628 (MB), Reclaimed Zone : 1, ZLV: 0.837963
[1203] :: 5003 ~ 5006, 2689 ms, 629 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1204] :: 5026 ~ 5027, 1729 ms, 428 (MB), Reclaimed Zone : 1, ZLV: 0.182971
[1205] :: 5033 ~ 5035, 1481 ms, 365 (MB), Reclaimed Zone : 1, ZLV: 0.276445
[1206] :: 5035 ~ 5037, 2117 ms, 506 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1207] :: 5041 ~ 5044, 2892 ms, 551 (MB), Reclaimed Zone : 1, ZLV: 0.225898
[1208] :: 5052 ~ 5055, 2667 ms, 620 (MB), Reclaimed Zone : 1, ZLV: 0.410998
[1209] :: 5055 ~ 5057, 2361 ms, 636 (MB), Reclaimed Zone : 1, ZLV: 0.592418
[1210] :: 5060 ~ 5063, 2652 ms, 649 (MB), Reclaimed Zone : 1, ZLV: 0.278520
[1211] :: 5064 ~ 5064, 343 ms, 71 (MB), Reclaimed Zone : 1, ZLV: 0.497167
[1212] :: 5071 ~ 5072, 1460 ms, 392 (MB), Reclaimed Zone : 1, ZLV: 0.297634
[1213] :: 5072 ~ 5074, 2157 ms, 576 (MB), Reclaimed Zone : 1, ZLV: 0.258764
[1214] :: 5074 ~ 5077, 2273 ms, 605 (MB), Reclaimed Zone : 1, ZLV: 0.767446
[1215] :: 5082 ~ 5085, 2675 ms, 605 (MB), Reclaimed Zone : 1, ZLV: 0.920972
[1216] :: 5085 ~ 5087, 2765 ms, 631 (MB), Reclaimed Zone : 1, ZLV: 0.220446
[1217] :: 5090 ~ 5092, 2624 ms, 642 (MB), Reclaimed Zone : 1, ZLV: 0.323383
[1218] :: 5097 ~ 5100, 2246 ms, 563 (MB), Reclaimed Zone : 1, ZLV: 0.189655
[1219] :: 5117 ~ 5120, 2522 ms, 590 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1220] :: 5120 ~ 5122, 2115 ms, 584 (MB), Reclaimed Zone : 1, ZLV: 0.192933
[1221] :: 5122 ~ 5125, 2776 ms, 585 (MB), Reclaimed Zone : 1, ZLV: 0.234819
[1222] :: 5125 ~ 5128, 2627 ms, 646 (MB), Reclaimed Zone : 1, ZLV: 0.663939
[1223] :: 5128 ~ 5130, 2611 ms, 645 (MB), Reclaimed Zone : 1, ZLV: 0.825845
[1224] :: 5147 ~ 5150, 2600 ms, 643 (MB), Reclaimed Zone : 1, ZLV: 0.608454
[1225] :: 5150 ~ 5152, 2661 ms, 650 (MB), Reclaimed Zone : 1, ZLV: 0.815635
[1226] :: 5152 ~ 5155, 2854 ms, 659 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1227] :: 5159 ~ 5161, 1883 ms, 499 (MB), Reclaimed Zone : 1, ZLV: 0.984257
[1228] :: 5161 ~ 5161, 42 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.384095
[1229] :: 5166 ~ 5168, 1892 ms, 485 (MB), Reclaimed Zone : 1, ZLV: 0.922191
[1230] :: 5178 ~ 5181, 2299 ms, 553 (MB), Reclaimed Zone : 1, ZLV: 0.241436
[1231] :: 5181 ~ 5183, 2392 ms, 620 (MB), Reclaimed Zone : 1, ZLV: 0.685296
[1232] :: 5187 ~ 5187, 855 ms, 221 (MB), Reclaimed Zone : 1, ZLV: 0.197674
[1233] :: 5187 ~ 5190, 2507 ms, 572 (MB), Reclaimed Zone : 1, ZLV: 0.696815
[1234] :: 5196 ~ 5199, 2831 ms, 612 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1235] :: 5199 ~ 5202, 2815 ms, 627 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1236] :: 5208 ~ 5210, 2452 ms, 659 (MB), Reclaimed Zone : 1, ZLV: 0.470409
[1237] :: 5231 ~ 5234, 2238 ms, 527 (MB), Reclaimed Zone : 1, ZLV: 0.298868
[1238] :: 5234 ~ 5236, 2293 ms, 595 (MB), Reclaimed Zone : 1, ZLV: 0.405152
[1239] :: 5236 ~ 5238, 2229 ms, 619 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1240] :: 5238 ~ 5241, 2703 ms, 661 (MB), Reclaimed Zone : 1, ZLV: 0.913767
[1241] :: 5243 ~ 5245, 2668 ms, 673 (MB), Reclaimed Zone : 1, ZLV: 0.268228
[1242] :: 5245 ~ 5248, 2700 ms, 670 (MB), Reclaimed Zone : 1, ZLV: 0.230186
[1243] :: 5249 ~ 5251, 2584 ms, 611 (MB), Reclaimed Zone : 1, ZLV: 0.938230
[1244] :: 5251 ~ 5254, 2425 ms, 654 (MB), Reclaimed Zone : 1, ZLV: 0.322656
[1245] :: 5259 ~ 5262, 2336 ms, 592 (MB), Reclaimed Zone : 1, ZLV: 0.654279
[1246] :: 5262 ~ 5264, 2482 ms, 652 (MB), Reclaimed Zone : 1, ZLV: 0.346813
[1247] :: 5269 ~ 5272, 2911 ms, 672 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1248] :: 5276 ~ 5278, 2745 ms, 678 (MB), Reclaimed Zone : 1, ZLV: 0.268509
[1249] :: 5279 ~ 5281, 2899 ms, 683 (MB), Reclaimed Zone : 1, ZLV: 0.398368
[1250] :: 5284 ~ 5286, 2472 ms, 654 (MB), Reclaimed Zone : 1, ZLV: 0.434743
[1251] :: 5304 ~ 5306, 2492 ms, 618 (MB), Reclaimed Zone : 1, ZLV: 0.442852
[1252] :: 5309 ~ 5312, 2854 ms, 682 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1253] :: 5313 ~ 5314, 1369 ms, 316 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1254] :: 5314 ~ 5317, 2379 ms, 605 (MB), Reclaimed Zone : 1, ZLV: 0.264624
[1255] :: 5322 ~ 5324, 2095 ms, 562 (MB), Reclaimed Zone : 1, ZLV: 0.264896
[1256] :: 5324 ~ 5327, 2428 ms, 595 (MB), Reclaimed Zone : 1, ZLV: 0.795289
[1257] :: 5327 ~ 5329, 2477 ms, 622 (MB), Reclaimed Zone : 1, ZLV: 0.542368
[1258] :: 5334 ~ 5337, 2487 ms, 676 (MB), Reclaimed Zone : 1, ZLV: 0.247410
[1259] :: 5343 ~ 5346, 2947 ms, 678 (MB), Reclaimed Zone : 1, ZLV: 0.978134
[1260] :: 5346 ~ 5348, 2612 ms, 683 (MB), Reclaimed Zone : 1, ZLV: 0.771835
[1261] :: 5348 ~ 5351, 2465 ms, 686 (MB), Reclaimed Zone : 1, ZLV: 0.738529
[1262] :: 5351 ~ 5354, 2862 ms, 699 (MB), Reclaimed Zone : 1, ZLV: 0.721739
[1263] :: 5356 ~ 5359, 2511 ms, 623 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1264] :: 5359 ~ 5361, 2830 ms, 689 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1265] :: 5379 ~ 5381, 2696 ms, 592 (MB), Reclaimed Zone : 1, ZLV: 0.964969
[1266] :: 5381 ~ 5384, 2328 ms, 621 (MB), Reclaimed Zone : 1, ZLV: 0.517179
[1267] :: 5405 ~ 5407, 2265 ms, 528 (MB), Reclaimed Zone : 1, ZLV: 0.340097
[1268] :: 5407 ~ 5409, 2290 ms, 592 (MB), Reclaimed Zone : 1, ZLV: 0.761108
[1269] :: 5409 ~ 5412, 2819 ms, 683 (MB), Reclaimed Zone : 1, ZLV: 0.620717
[1270] :: 5413 ~ 5414, 1441 ms, 375 (MB), Reclaimed Zone : 1, ZLV: 0.418121
[1271] :: 5418 ~ 5421, 3050 ms, 686 (MB), Reclaimed Zone : 1, ZLV: 0.775371
[1272] :: 5421 ~ 5424, 2723 ms, 699 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1273] :: 5428 ~ 5429, 1280 ms, 314 (MB), Reclaimed Zone : 1, ZLV: 0.120770
[1274] :: 5440 ~ 5442, 2157 ms, 505 (MB), Reclaimed Zone : 1, ZLV: 0.750378
[1275] :: 5444 ~ 5446, 1961 ms, 522 (MB), Reclaimed Zone : 1, ZLV: 0.671831
[1276] :: 5453 ~ 5455, 1295 ms, 277 (MB), Reclaimed Zone : 1, ZLV: 0.731944
[1277] :: 5466 ~ 5469, 2463 ms, 526 (MB), Reclaimed Zone : 1, ZLV: 0.819924
[1278] :: 5469 ~ 5471, 1956 ms, 528 (MB), Reclaimed Zone : 1, ZLV: 0.509019
[1279] :: 5473 ~ 5474, 1027 ms, 244 (MB), Reclaimed Zone : 1, ZLV: 0.871096
[1280] :: 5479 ~ 5480, 1688 ms, 445 (MB), Reclaimed Zone : 1, ZLV: 0.198756
[1281] :: 5491 ~ 5493, 2258 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 0.177875
[1282] :: 5493 ~ 5495, 2131 ms, 598 (MB), Reclaimed Zone : 1, ZLV: 0.291577
[1283] :: 5495 ~ 5498, 2555 ms, 658 (MB), Reclaimed Zone : 1, ZLV: 0.851625
[1284] :: 5498 ~ 5500, 2403 ms, 669 (MB), Reclaimed Zone : 1, ZLV: 0.965402
[1285] :: 5505 ~ 5507, 2272 ms, 523 (MB), Reclaimed Zone : 1, ZLV: 0.528449
[1286] :: 5512 ~ 5514, 2254 ms, 570 (MB), Reclaimed Zone : 1, ZLV: 0.463158
[1287] :: 5525 ~ 5527, 2433 ms, 607 (MB), Reclaimed Zone : 1, ZLV: 0.428502
[1288] :: 5527 ~ 5530, 2534 ms, 674 (MB), Reclaimed Zone : 1, ZLV: 0.508841
[1289] :: 5531 ~ 5534, 2633 ms, 649 (MB), Reclaimed Zone : 1, ZLV: 0.216133
[1290] :: 5534 ~ 5537, 2577 ms, 692 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1291] :: 5544 ~ 5547, 2449 ms, 561 (MB), Reclaimed Zone : 1, ZLV: 0.272776
[1292] :: 5556 ~ 5558, 2288 ms, 591 (MB), Reclaimed Zone : 1, ZLV: 0.538783
[1293] :: 5558 ~ 5560, 2321 ms, 592 (MB), Reclaimed Zone : 1, ZLV: 0.617407
[1294] :: 5561 ~ 5563, 2602 ms, 619 (MB), Reclaimed Zone : 1, ZLV: 0.550398
[1295] :: 5563 ~ 5566, 2667 ms, 633 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1296] :: 5566 ~ 5569, 2701 ms, 648 (MB), Reclaimed Zone : 1, ZLV: 0.658449
[1297] :: 5572 ~ 5574, 1672 ms, 346 (MB), Reclaimed Zone : 1, ZLV: 0.273478
[1298] :: 5578 ~ 5579, 1468 ms, 341 (MB), Reclaimed Zone : 1, ZLV: 0.436704
[1299] :: 5580 ~ 5582, 2123 ms, 561 (MB), Reclaimed Zone : 1, ZLV: 0.513833
[1300] :: 5587 ~ 5590, 2801 ms, 611 (MB), Reclaimed Zone : 1, ZLV: 0.554423
[1301] :: 5593 ~ 5596, 2650 ms, 688 (MB), Reclaimed Zone : 1, ZLV: 0.356846
[1302] :: 5596 ~ 5599, 2810 ms, 690 (MB), Reclaimed Zone : 1, ZLV: 0.913087
[1303] :: 5601 ~ 5604, 2943 ms, 694 (MB), Reclaimed Zone : 1, ZLV: 0.613464
[1304] :: 5610 ~ 5613, 2075 ms, 459 (MB), Reclaimed Zone : 1, ZLV: 0.264245
[1305] :: 5621 ~ 5624, 2149 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 0.236405
[1306] :: 5624 ~ 5626, 2403 ms, 620 (MB), Reclaimed Zone : 1, ZLV: 0.910775
[1307] :: 5631 ~ 5633, 2409 ms, 643 (MB), Reclaimed Zone : 1, ZLV: 0.943775
[1308] :: 5634 ~ 5636, 2665 ms, 591 (MB), Reclaimed Zone : 1, ZLV: 0.750741
[1309] :: 5636 ~ 5639, 2623 ms, 689 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1310] :: 5643 ~ 5647, 3253 ms, 704 (MB), Reclaimed Zone : 1, ZLV: 0.625929
[1311] :: 5647 ~ 5650, 3330 ms, 703 (MB), Reclaimed Zone : 1, ZLV: 0.854846
[1312] :: 5655 ~ 5658, 3082 ms, 714 (MB), Reclaimed Zone : 1, ZLV: 0.832366
[1313] :: 5658 ~ 5661, 2722 ms, 713 (MB), Reclaimed Zone : 1, ZLV: 0.640316
[1314] :: 5661 ~ 5664, 2775 ms, 716 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1315] :: 5664 ~ 5667, 2928 ms, 712 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1316] :: 5688 ~ 5690, 1924 ms, 461 (MB), Reclaimed Zone : 1, ZLV: 0.300727
[1317] :: 5690 ~ 5692, 2263 ms, 600 (MB), Reclaimed Zone : 1, ZLV: 0.964890
[1318] :: 5692 ~ 5694, 2629 ms, 653 (MB), Reclaimed Zone : 1, ZLV: 0.495774
[1319] :: 5695 ~ 5697, 2615 ms, 671 (MB), Reclaimed Zone : 1, ZLV: 0.369423
[1320] :: 5699 ~ 5702, 2812 ms, 677 (MB), Reclaimed Zone : 1, ZLV: 0.082095
[1321] :: 5702 ~ 5704, 2775 ms, 727 (MB), Reclaimed Zone : 1, ZLV: 0.656175
[1322] :: 5706 ~ 5709, 2730 ms, 664 (MB), Reclaimed Zone : 1, ZLV: 0.427054
[1323] :: 5709 ~ 5711, 2771 ms, 736 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1324] :: 5727 ~ 5730, 2354 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 0.745042
[1325] :: 5732 ~ 5735, 2524 ms, 668 (MB), Reclaimed Zone : 1, ZLV: 0.698690
[1326] :: 5735 ~ 5737, 2597 ms, 717 (MB), Reclaimed Zone : 1, ZLV: 0.727486
[1327] :: 5755 ~ 5756, 1706 ms, 457 (MB), Reclaimed Zone : 1, ZLV: 0.184721
[1328] :: 5757 ~ 5759, 2233 ms, 564 (MB), Reclaimed Zone : 1, ZLV: 0.167814
[1329] :: 5760 ~ 5762, 2341 ms, 568 (MB), Reclaimed Zone : 1, ZLV: 0.207540
[1330] :: 5762 ~ 5764, 2359 ms, 663 (MB), Reclaimed Zone : 1, ZLV: 0.750393
[1331] :: 5768 ~ 5769, 1384 ms, 353 (MB), Reclaimed Zone : 1, ZLV: 0.395728
[1332] :: 5769 ~ 5772, 2361 ms, 618 (MB), Reclaimed Zone : 1, ZLV: 0.272914
[1333] :: 5777 ~ 5780, 2511 ms, 607 (MB), Reclaimed Zone : 1, ZLV: 0.899116
[1334] :: 5785 ~ 5788, 3286 ms, 699 (MB), Reclaimed Zone : 1, ZLV: 0.386441
[1335] :: 5792 ~ 5793, 1366 ms, 318 (MB), Reclaimed Zone : 1, ZLV: 0.392558
[1336] :: 5803 ~ 5806, 2693 ms, 611 (MB), Reclaimed Zone : 1, ZLV: 0.246658
[1337] :: 5815 ~ 5818, 2813 ms, 633 (MB), Reclaimed Zone : 1, ZLV: 0.678925
[1338] :: 5818 ~ 5821, 2764 ms, 644 (MB), Reclaimed Zone : 1, ZLV: 0.422462
[1339] :: 5821 ~ 5823, 2605 ms, 644 (MB), Reclaimed Zone : 1, ZLV: 0.891147
[1340] :: 5828 ~ 5830, 2497 ms, 609 (MB), Reclaimed Zone : 1, ZLV: 0.552433
[1341] :: 5830 ~ 5833, 2585 ms, 677 (MB), Reclaimed Zone : 1, ZLV: 0.474250
[1342] :: 5833 ~ 5835, 1865 ms, 356 (MB), Reclaimed Zone : 1, ZLV: 0.222811
[1343] :: 5845 ~ 5846, 1618 ms, 392 (MB), Reclaimed Zone : 1, ZLV: 0.256088
[1344] :: 5852 ~ 5855, 2699 ms, 670 (MB), Reclaimed Zone : 1, ZLV: 0.569445
[1345] :: 5855 ~ 5858, 3001 ms, 717 (MB), Reclaimed Zone : 1, ZLV: 0.913894
[1346] :: 5865 ~ 5868, 2336 ms, 589 (MB), Reclaimed Zone : 1, ZLV: 0.579976
[1347] :: 5870 ~ 5872, 2073 ms, 466 (MB), Reclaimed Zone : 1, ZLV: 0.456555
[1348] :: 5872 ~ 5874, 2808 ms, 608 (MB), Reclaimed Zone : 1, ZLV: 0.940823
[1349] :: 5881 ~ 5884, 2563 ms, 656 (MB), Reclaimed Zone : 1, ZLV: 0.258113
[1350] :: 5886 ~ 5888, 2538 ms, 623 (MB), Reclaimed Zone : 1, ZLV: 0.221421
[1351] :: 5888 ~ 5891, 2616 ms, 647 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1352] :: 5893 ~ 5895, 2150 ms, 510 (MB), Reclaimed Zone : 1, ZLV: 0.831170
[1353] :: 5895 ~ 5898, 2487 ms, 684 (MB), Reclaimed Zone : 1, ZLV: 0.258498
[1354] :: 5898 ~ 5901, 2637 ms, 698 (MB), Reclaimed Zone : 1, ZLV: 0.288285
[1355] :: 5911 ~ 5914, 2489 ms, 677 (MB), Reclaimed Zone : 1, ZLV: 0.918877
[1356] :: 5919 ~ 5922, 3103 ms, 707 (MB), Reclaimed Zone : 1, ZLV: 0.609622
[1357] :: 5922 ~ 5925, 2753 ms, 720 (MB), Reclaimed Zone : 1, ZLV: 0.933398
[1358] :: 5925 ~ 5928, 2820 ms, 736 (MB), Reclaimed Zone : 1, ZLV: 0.820266
[1359] :: 5930 ~ 5932, 2386 ms, 565 (MB), Reclaimed Zone : 1, ZLV: 0.289322
[1360] :: 5933 ~ 5935, 1625 ms, 385 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1361] :: 5935 ~ 5937, 1966 ms, 458 (MB), Reclaimed Zone : 1, ZLV: 0.271417
[1362] :: 5954 ~ 5956, 2482 ms, 569 (MB), Reclaimed Zone : 1, ZLV: 0.811599
[1363] :: 5956 ~ 5959, 2806 ms, 698 (MB), Reclaimed Zone : 1, ZLV: 0.997491
[1364] :: 5961 ~ 5964, 2684 ms, 711 (MB), Reclaimed Zone : 1, ZLV: 0.654450
[1365] :: 5968 ~ 5970, 1886 ms, 416 (MB), Reclaimed Zone : 1, ZLV: 0.278199
[1366] :: 5972 ~ 5975, 2428 ms, 606 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1367] :: 5986 ~ 5988, 2488 ms, 618 (MB), Reclaimed Zone : 1, ZLV: 0.274363
[1368] :: 5992 ~ 5994, 2475 ms, 627 (MB), Reclaimed Zone : 1, ZLV: 0.428682
[1369] :: 5994 ~ 5997, 2488 ms, 672 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1370] :: 5998 ~ 6000, 1768 ms, 402 (MB), Reclaimed Zone : 1, ZLV: 0.299951
[1371] :: 6010 ~ 6011, 1482 ms, 367 (MB), Reclaimed Zone : 1, ZLV: 0.380185
[1372] :: 6017 ~ 6019, 2485 ms, 554 (MB), Reclaimed Zone : 1, ZLV: 0.211655
[1373] :: 6019 ~ 6021, 2058 ms, 527 (MB), Reclaimed Zone : 1, ZLV: 0.446695
[1374] :: 6021 ~ 6024, 2362 ms, 590 (MB), Reclaimed Zone : 1, ZLV: 0.569880
[1375] :: 6027 ~ 6030, 2792 ms, 699 (MB), Reclaimed Zone : 1, ZLV: 0.844427
[1376] :: 6030 ~ 6033, 2750 ms, 696 (MB), Reclaimed Zone : 1, ZLV: 0.832312
[1377] :: 6049 ~ 6052, 2397 ms, 587 (MB), Reclaimed Zone : 1, ZLV: 0.225732
[1378] :: 6054 ~ 6057, 2540 ms, 638 (MB), Reclaimed Zone : 1, ZLV: 0.743812
[1379] :: 6057 ~ 6060, 2876 ms, 655 (MB), Reclaimed Zone : 1, ZLV: 0.196780
[1380] :: 6067 ~ 6070, 2461 ms, 582 (MB), Reclaimed Zone : 1, ZLV: 0.208685
[1381] :: 6079 ~ 6081, 2293 ms, 600 (MB), Reclaimed Zone : 1, ZLV: 0.854211
[1382] :: 6081 ~ 6084, 2502 ms, 657 (MB), Reclaimed Zone : 1, ZLV: 0.694150
[1383] :: 6085 ~ 6088, 2857 ms, 693 (MB), Reclaimed Zone : 1, ZLV: 0.277710
[1384] :: 6088 ~ 6091, 3150 ms, 742 (MB), Reclaimed Zone : 1, ZLV: 0.709096
[1385] :: 6093 ~ 6094, 386 ms, 70 (MB), Reclaimed Zone : 1, ZLV: 0.177272
[1386] :: 6094 ~ 6097, 3008 ms, 665 (MB), Reclaimed Zone : 1, ZLV: 0.192538
[1387] :: 6105 ~ 6108, 2888 ms, 714 (MB), Reclaimed Zone : 1, ZLV: 0.827974
[1388] :: 6114 ~ 6118, 3127 ms, 741 (MB), Reclaimed Zone : 1, ZLV: 0.889899
[1389] :: 6121 ~ 6124, 2455 ms, 598 (MB), Reclaimed Zone : 1, ZLV: 0.843037
[1390] :: 6124 ~ 6126, 2715 ms, 688 (MB), Reclaimed Zone : 1, ZLV: 0.470848
[1391] :: 6126 ~ 6129, 2832 ms, 712 (MB), Reclaimed Zone : 1, ZLV: 0.161807
[1392] :: 6129 ~ 6132, 2922 ms, 713 (MB), Reclaimed Zone : 1, ZLV: 0.747765
[1393] :: 6149 ~ 6151, 2618 ms, 648 (MB), Reclaimed Zone : 1, ZLV: 0.539145
[1394] :: 6151 ~ 6154, 2724 ms, 723 (MB), Reclaimed Zone : 1, ZLV: 0.698015
[1395] :: 6154 ~ 6157, 2784 ms, 744 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1396] :: 6157 ~ 6160, 2966 ms, 755 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1397] :: 6164 ~ 6166, 2328 ms, 520 (MB), Reclaimed Zone : 1, ZLV: 0.998106
[1398] :: 6172 ~ 6174, 1812 ms, 419 (MB), Reclaimed Zone : 1, ZLV: 0.998821
[1399] :: 6174 ~ 6176, 2076 ms, 548 (MB), Reclaimed Zone : 1, ZLV: 0.497294
[1400] :: 6186 ~ 6189, 2751 ms, 686 (MB), Reclaimed Zone : 1, ZLV: 0.324515
[1401] :: 6210 ~ 6212, 2355 ms, 562 (MB), Reclaimed Zone : 1, ZLV: 0.323523
[1402] :: 6212 ~ 6214, 2193 ms, 590 (MB), Reclaimed Zone : 1, ZLV: 0.613650
[1403] :: 6214 ~ 6217, 2570 ms, 652 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1404] :: 6217 ~ 6220, 3089 ms, 758 (MB), Reclaimed Zone : 1, ZLV: 0.477908
[1405] :: 6220 ~ 6223, 2825 ms, 759 (MB), Reclaimed Zone : 1, ZLV: 0.704381
[1406] :: 6228 ~ 6230, 1537 ms, 295 (MB), Reclaimed Zone : 1, ZLV: 0.253625
[1407] :: 6230 ~ 6231, 1506 ms, 402 (MB), Reclaimed Zone : 1, ZLV: 0.240654
[1408] :: 6234 ~ 6237, 2527 ms, 561 (MB), Reclaimed Zone : 1, ZLV: 0.199124
[1409] :: 6246 ~ 6248, 2580 ms, 584 (MB), Reclaimed Zone : 1, ZLV: 0.746458
[1410] :: 6248 ~ 6251, 2420 ms, 648 (MB), Reclaimed Zone : 1, ZLV: 0.395740
[1411] :: 6251 ~ 6253, 2424 ms, 660 (MB), Reclaimed Zone : 1, ZLV: 0.815963
[1412] :: 6256 ~ 6259, 3182 ms, 737 (MB), Reclaimed Zone : 1, ZLV: 0.531670
[1413] :: 6259 ~ 6262, 2890 ms, 764 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1414] :: 6269 ~ 6271, 2078 ms, 556 (MB), Reclaimed Zone : 1, ZLV: 0.390104
[1415] :: 6282 ~ 6285, 3150 ms, 729 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1416] :: 6285 ~ 6288, 2830 ms, 729 (MB), Reclaimed Zone : 1, ZLV: 0.592637
[1417] :: 6291 ~ 6293, 2287 ms, 553 (MB), Reclaimed Zone : 1, ZLV: 0.193903
[1418] :: 6293 ~ 6296, 2729 ms, 709 (MB), Reclaimed Zone : 1, ZLV: 0.216754
[1419] :: 6299 ~ 6301, 1927 ms, 490 (MB), Reclaimed Zone : 1, ZLV: 0.397796
[1420] :: 6301 ~ 6303, 2796 ms, 732 (MB), Reclaimed Zone : 1, ZLV: 0.900920
[1421] :: 6307 ~ 6310, 2796 ms, 720 (MB), Reclaimed Zone : 1, ZLV: 0.428393
[1422] :: 6321 ~ 6324, 3114 ms, 750 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1423] :: 6324 ~ 6327, 2679 ms, 683 (MB), Reclaimed Zone : 1, ZLV: 0.998622
[1424] :: 6327 ~ 6330, 2991 ms, 754 (MB), Reclaimed Zone : 1, ZLV: 0.939293
[1425] :: 6330 ~ 6334, 3434 ms, 770 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1426] :: 6343 ~ 6345, 2457 ms, 627 (MB), Reclaimed Zone : 1, ZLV: 0.341880
[1427] :: 6356 ~ 6359, 2943 ms, 664 (MB), Reclaimed Zone : 1, ZLV: 0.656364
[1428] :: 6359 ~ 6362, 2552 ms, 691 (MB), Reclaimed Zone : 1, ZLV: 0.395685
[1429] :: 6362 ~ 6364, 2623 ms, 720 (MB), Reclaimed Zone : 1, ZLV: 0.397409
[1430] :: 6365 ~ 6368, 2255 ms, 598 (MB), Reclaimed Zone : 1, ZLV: 0.301430
[1431] :: 6368 ~ 6370, 2569 ms, 662 (MB), Reclaimed Zone : 1, ZLV: 0.496644
[1432] :: 6376 ~ 6378, 1789 ms, 450 (MB), Reclaimed Zone : 1, ZLV: 0.192036
[1433] :: 6380 ~ 6383, 2203 ms, 613 (MB), Reclaimed Zone : 1, ZLV: 0.310045
[1434] :: 6393 ~ 6395, 2269 ms, 624 (MB), Reclaimed Zone : 1, ZLV: 0.496604
[1435] :: 6396 ~ 6399, 3057 ms, 764 (MB), Reclaimed Zone : 1, ZLV: 0.999006
[1436] :: 6399 ~ 6402, 2861 ms, 761 (MB), Reclaimed Zone : 1, ZLV: 0.609611
[1437] :: 6402 ~ 6405, 2993 ms, 758 (MB), Reclaimed Zone : 1, ZLV: 0.704421
[1438] :: 6408 ~ 6411, 2540 ms, 577 (MB), Reclaimed Zone : 1, ZLV: 0.212999
[1439] :: 6412 ~ 6414, 2579 ms, 608 (MB), Reclaimed Zone : 1, ZLV: 0.380845
[1440] :: 6418 ~ 6421, 3121 ms, 663 (MB), Reclaimed Zone : 1, ZLV: 0.589103
[1441] :: 6430 ~ 6432, 2715 ms, 671 (MB), Reclaimed Zone : 1, ZLV: 0.212200
[1442] :: 6432 ~ 6435, 2815 ms, 679 (MB), Reclaimed Zone : 1, ZLV: 0.563895
[1443] :: 6437 ~ 6440, 3279 ms, 771 (MB), Reclaimed Zone : 1, ZLV: 0.998811
[1444] :: 6442 ~ 6444, 1907 ms, 483 (MB), Reclaimed Zone : 1, ZLV: 0.276069
[1445] :: 6444 ~ 6447, 3038 ms, 782 (MB), Reclaimed Zone : 1, ZLV: 0.862652
[1446] :: 6458 ~ 6461, 2591 ms, 601 (MB), Reclaimed Zone : 1, ZLV: 0.198191
[1447] :: 6464 ~ 6466, 2366 ms, 635 (MB), Reclaimed Zone : 1, ZLV: 0.675061
[1448] :: 6474 ~ 6476, 2107 ms, 509 (MB), Reclaimed Zone : 1, ZLV: 0.265899
[1449] :: 6476 ~ 6479, 2743 ms, 737 (MB), Reclaimed Zone : 1, ZLV: 0.950242
[1450] :: 6481 ~ 6485, 3277 ms, 691 (MB), Reclaimed Zone : 1, ZLV: 0.953837
[1451] :: 6485 ~ 6487, 2756 ms, 697 (MB), Reclaimed Zone : 1, ZLV: 0.715834
[1452] :: 6501 ~ 6502, 907 ms, 194 (MB), Reclaimed Zone : 1, ZLV: 0.079293
[1453] :: 6511 ~ 6512, 1384 ms, 377 (MB), Reclaimed Zone : 1, ZLV: 0.219074
[1454] :: 6523 ~ 6526, 2663 ms, 666 (MB), Reclaimed Zone : 1, ZLV: 0.356201
[1455] :: 6526 ~ 6529, 2806 ms, 699 (MB), Reclaimed Zone : 1, ZLV: 0.804979
[1456] :: 6532 ~ 6535, 2277 ms, 544 (MB), Reclaimed Zone : 1, ZLV: 0.280389
[1457] :: 6535 ~ 6537, 2721 ms, 649 (MB), Reclaimed Zone : 1, ZLV: 0.305684
[1458] :: 6538 ~ 6539, 1383 ms, 301 (MB), Reclaimed Zone : 1, ZLV: 0.277010
[1459] :: 6539 ~ 6542, 2391 ms, 616 (MB), Reclaimed Zone : 1, ZLV: 0.134987
[1460] :: 6546 ~ 6549, 3062 ms, 648 (MB), Reclaimed Zone : 1, ZLV: 0.851863
[1461] :: 6558 ~ 6561, 3011 ms, 673 (MB), Reclaimed Zone : 1, ZLV: 0.417022
[1462] :: 6561 ~ 6563, 2533 ms, 691 (MB), Reclaimed Zone : 1, ZLV: 0.441837
[1463] :: 6563 ~ 6566, 2880 ms, 732 (MB), Reclaimed Zone : 1, ZLV: 0.454499
[1464] :: 6567 ~ 6570, 2937 ms, 736 (MB), Reclaimed Zone : 1, ZLV: 0.930990
[1465] :: 6572 ~ 6574, 2607 ms, 620 (MB), Reclaimed Zone : 1, ZLV: 0.669369
[1466] :: 6575 ~ 6576, 1601 ms, 407 (MB), Reclaimed Zone : 1, ZLV: 0.266773
[1467] :: 6576 ~ 6579, 3011 ms, 763 (MB), Reclaimed Zone : 1, ZLV: 0.390399
[1468] :: 6582 ~ 6585, 3062 ms, 730 (MB), Reclaimed Zone : 1, ZLV: 0.525339
[1469] :: 6587 ~ 6590, 2877 ms, 714 (MB), Reclaimed Zone : 1, ZLV: 0.626944
[1470] :: 6595 ~ 6599, 3366 ms, 759 (MB), Reclaimed Zone : 1, ZLV: 0.284551
[1471] :: 6604 ~ 6607, 2466 ms, 650 (MB), Reclaimed Zone : 1, ZLV: 0.161299
[1472] :: 6625 ~ 6627, 2115 ms, 490 (MB), Reclaimed Zone : 1, ZLV: 0.620180
[1473] :: 6627 ~ 6629, 2176 ms, 624 (MB), Reclaimed Zone : 1, ZLV: 0.359769
[1474] :: 6629 ~ 6631, 2346 ms, 649 (MB), Reclaimed Zone : 1, ZLV: 0.789644
[1475] :: 6632 ~ 6634, 2245 ms, 552 (MB), Reclaimed Zone : 1, ZLV: 0.234851
[1476] :: 6634 ~ 6634, 38 ms, 0 (MB), Reclaimed Zone : 1, ZLV: 0.513871
[1477] :: 6634 ~ 6636, 2428 ms, 657 (MB), Reclaimed Zone : 1, ZLV: 0.394191
[1478] :: 6642 ~ 6644, 2098 ms, 527 (MB), Reclaimed Zone : 1, ZLV: 0.361314
[1479] :: 6644 ~ 6646, 2083 ms, 538 (MB), Reclaimed Zone : 1, ZLV: 0.200522
[1480] :: 6650 ~ 6652, 2183 ms, 554 (MB), Reclaimed Zone : 1, ZLV: 0.473870
[1481] :: 6663 ~ 6666, 3003 ms, 704 (MB), Reclaimed Zone : 1, ZLV: 0.483642
[1482] :: 6666 ~ 6669, 2984 ms, 756 (MB), Reclaimed Zone : 1, ZLV: 0.259430
[1483] :: 6669 ~ 6672, 3143 ms, 762 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1484] :: 6674 ~ 6677, 3383 ms, 792 (MB), Reclaimed Zone : 1, ZLV: 0.457796
[1485] :: 6679 ~ 6681, 2340 ms, 603 (MB), Reclaimed Zone : 1, ZLV: 0.253090
[1486] :: 6681 ~ 6684, 2793 ms, 718 (MB), Reclaimed Zone : 1, ZLV: 0.836066
[1487] :: 6689 ~ 6692, 2840 ms, 615 (MB), Reclaimed Zone : 1, ZLV: 0.202127
[1488] :: 6701 ~ 6704, 3130 ms, 721 (MB), Reclaimed Zone : 1, ZLV: 0.636342
[1489] :: 6704 ~ 6706, 2580 ms, 711 (MB), Reclaimed Zone : 1, ZLV: 0.498950
[1490] :: 6706 ~ 6709, 2854 ms, 731 (MB), Reclaimed Zone : 1, ZLV: 0.555864
[1491] :: 6720 ~ 6722, 2390 ms, 542 (MB), Reclaimed Zone : 1, ZLV: 0.713670
[1492] :: 6733 ~ 6736, 2795 ms, 659 (MB), Reclaimed Zone : 1, ZLV: 0.509629
[1493] :: 6736 ~ 6739, 2852 ms, 691 (MB), Reclaimed Zone : 1, ZLV: 0.371090
[1494] :: 6739 ~ 6741, 2797 ms, 723 (MB), Reclaimed Zone : 1, ZLV: 0.460049
[1495] :: 6741 ~ 6744, 2827 ms, 779 (MB), Reclaimed Zone : 1, ZLV: 0.542701
[1496] :: 6748 ~ 6751, 2615 ms, 612 (MB), Reclaimed Zone : 1, ZLV: 0.214203
[1497] :: 6751 ~ 6754, 3092 ms, 727 (MB), Reclaimed Zone : 1, ZLV: 0.353271
[1498] :: 6754 ~ 6757, 2864 ms, 752 (MB), Reclaimed Zone : 1, ZLV: 0.218078
[1499] :: 6762 ~ 6766, 3420 ms, 681 (MB), Reclaimed Zone : 1, ZLV: 0.428062
[1500] :: 6774 ~ 6777, 3027 ms, 756 (MB), Reclaimed Zone : 1, ZLV: 0.341876
[1501] :: 6777 ~ 6780, 3060 ms, 783 (MB), Reclaimed Zone : 1, ZLV: 0.512130
[1502] :: 6780 ~ 6784, 3399 ms, 796 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1503] :: 6784 ~ 6787, 3089 ms, 794 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1504] :: 6808 ~ 6809, 1308 ms, 288 (MB), Reclaimed Zone : 1, ZLV: 0.214229
[1505] :: 6809 ~ 6812, 2605 ms, 583 (MB), Reclaimed Zone : 1, ZLV: 0.710208
[1506] :: 6812 ~ 6814, 2402 ms, 603 (MB), Reclaimed Zone : 1, ZLV: 0.682021
[1507] :: 6819 ~ 6821, 1791 ms, 390 (MB), Reclaimed Zone : 1, ZLV: 0.234700
[1508] :: 6826 ~ 6828, 1749 ms, 461 (MB), Reclaimed Zone : 1, ZLV: 0.250123
[1509] :: 6833 ~ 6836, 2705 ms, 563 (MB), Reclaimed Zone : 1, ZLV: 0.399635
[1510] :: 6836 ~ 6839, 3468 ms, 691 (MB), Reclaimed Zone : 1, ZLV: 0.386165
[1511] :: 6840 ~ 6843, 2983 ms, 759 (MB), Reclaimed Zone : 1, ZLV: 0.443449
[1512] :: 6843 ~ 6846, 3189 ms, 787 (MB), Reclaimed Zone : 1, ZLV: 0.818583
[1513] :: 6846 ~ 6850, 3315 ms, 794 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1514] :: 6853 ~ 6856, 2379 ms, 599 (MB), Reclaimed Zone : 1, ZLV: 0.222820
[1515] :: 6872 ~ 6874, 2677 ms, 672 (MB), Reclaimed Zone : 1, ZLV: 0.606449
[1516] :: 6877 ~ 6880, 2776 ms, 688 (MB), Reclaimed Zone : 1, ZLV: 0.909077
[1517] :: 6880 ~ 6882, 1895 ms, 425 (MB), Reclaimed Zone : 1, ZLV: 0.246927
[1518] :: 6883 ~ 6885, 2323 ms, 591 (MB), Reclaimed Zone : 1, ZLV: 0.234231
[1519] :: 6885 ~ 6887, 2516 ms, 667 (MB), Reclaimed Zone : 1, ZLV: 0.588441
[1520] :: 6899 ~ 6901, 2927 ms, 650 (MB), Reclaimed Zone : 1, ZLV: 0.474935
[1521] :: 6908 ~ 6910, 2724 ms, 685 (MB), Reclaimed Zone : 1, ZLV: 0.340699
[1522] :: 6913 ~ 6915, 2772 ms, 680 (MB), Reclaimed Zone : 1, ZLV: 0.299410
[1523] :: 6915 ~ 6918, 2807 ms, 696 (MB), Reclaimed Zone : 1, ZLV: 0.673178
[1524] :: 6919 ~ 6921, 1859 ms, 417 (MB), Reclaimed Zone : 1, ZLV: 0.583428
[1525] :: 6921 ~ 6923, 2390 ms, 625 (MB), Reclaimed Zone : 1, ZLV: 0.998678
[1526] :: 6923 ~ 6926, 2936 ms, 708 (MB), Reclaimed Zone : 1, ZLV: 0.649749
[1527] :: 6937 ~ 6938, 1555 ms, 371 (MB), Reclaimed Zone : 1, ZLV: 0.814674
[1528] :: 6939 ~ 6941, 2743 ms, 724 (MB), Reclaimed Zone : 1, ZLV: 0.297239
[1529] :: 6947 ~ 6950, 2912 ms, 747 (MB), Reclaimed Zone : 1, ZLV: 0.249404
[1530] :: 6950 ~ 6953, 2963 ms, 761 (MB), Reclaimed Zone : 1, ZLV: 0.930604
[1531] :: 6953 ~ 6956, 2895 ms, 755 (MB), Reclaimed Zone : 1, ZLV: 0.496822
[1532] :: 6960 ~ 6963, 2071 ms, 484 (MB), Reclaimed Zone : 1, ZLV: 0.301714
[1533] :: 6979 ~ 6981, 2185 ms, 492 (MB), Reclaimed Zone : 1, ZLV: 0.391890
[1534] :: 6985 ~ 6987, 2563 ms, 607 (MB), Reclaimed Zone : 1, ZLV: 0.267098
[1535] :: 6987 ~ 6989, 2275 ms, 618 (MB), Reclaimed Zone : 1, ZLV: 0.216486
[1536] :: 6990 ~ 6992, 2416 ms, 564 (MB), Reclaimed Zone : 1, ZLV: 0.874538
[1537] :: 6992 ~ 6995, 2382 ms, 621 (MB), Reclaimed Zone : 1, ZLV: 0.279649
[1538] :: 7000 ~ 7003, 3060 ms, 638 (MB), Reclaimed Zone : 1, ZLV: 0.266309
[1539] :: 7006 ~ 7009, 3080 ms, 722 (MB), Reclaimed Zone : 1, ZLV: 0.513992
[1540] :: 7012 ~ 7015, 2844 ms, 723 (MB), Reclaimed Zone : 1, ZLV: 0.201579
[1541] :: 7015 ~ 7018, 2825 ms, 748 (MB), Reclaimed Zone : 1, ZLV: 0.528998
[1542] :: 7018 ~ 7021, 2932 ms, 758 (MB), Reclaimed Zone : 1, ZLV: 0.969867
[1543] :: 7026 ~ 7028, 2095 ms, 524 (MB), Reclaimed Zone : 1, ZLV: 0.445570
[1544] :: 7044 ~ 7047, 2371 ms, 610 (MB), Reclaimed Zone : 1, ZLV: 0.204062
[1545] :: 7047 ~ 7049, 2534 ms, 635 (MB), Reclaimed Zone : 1, ZLV: 0.528576
[1546] :: 7054 ~ 7056, 2237 ms, 574 (MB), Reclaimed Zone : 1, ZLV: 0.302603
[1547] :: 7057 ~ 7060, 2412 ms, 638 (MB), Reclaimed Zone : 1, ZLV: 0.441696
[1548] :: 7060 ~ 7063, 2929 ms, 698 (MB), Reclaimed Zone : 1, ZLV: 0.945277
[1549] :: 7067 ~ 7069, 1736 ms, 418 (MB), Reclaimed Zone : 1, ZLV: 0.752280
[1550] :: 7069 ~ 7071, 2386 ms, 637 (MB), Reclaimed Zone : 1, ZLV: 0.669732
[1551] :: 7082 ~ 7085, 3218 ms, 724 (MB), Reclaimed Zone : 1, ZLV: 0.551502
[1552] :: 7085 ~ 7089, 3170 ms, 746 (MB), Reclaimed Zone : 1, ZLV: 0.660403
[1553] :: 7089 ~ 7091, 2715 ms, 747 (MB), Reclaimed Zone : 1, ZLV: 0.410735
[1554] :: 7091 ~ 7094, 2974 ms, 761 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1555] :: 7098 ~ 7100, 2788 ms, 726 (MB), Reclaimed Zone : 1, ZLV: 0.779120
[1556] :: 7101 ~ 7103, 2581 ms, 626 (MB), Reclaimed Zone : 1, ZLV: 0.443041
[1557] :: 7109 ~ 7112, 2132 ms, 572 (MB), Reclaimed Zone : 1, ZLV: 0.314467
[1558] :: 7112 ~ 7114, 2753 ms, 707 (MB), Reclaimed Zone : 1, ZLV: 0.500569
[1559] :: 7125 ~ 7128, 3281 ms, 727 (MB), Reclaimed Zone : 1, ZLV: 0.656413
[1560] :: 7128 ~ 7131, 2921 ms, 781 (MB), Reclaimed Zone : 1, ZLV: 0.919351
[1561] :: 7131 ~ 7134, 2912 ms, 789 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1562] :: 7137 ~ 7140, 2636 ms, 600 (MB), Reclaimed Zone : 1, ZLV: 0.451200
[1563] :: 7144 ~ 7146, 2128 ms, 502 (MB), Reclaimed Zone : 1, ZLV: 0.160781
[1564] :: 7146 ~ 7148, 2253 ms, 616 (MB), Reclaimed Zone : 1, ZLV: 0.258828
[1565] :: 7150 ~ 7152, 2482 ms, 642 (MB), Reclaimed Zone : 1, ZLV: 0.415598
[1566] :: 7152 ~ 7155, 2436 ms, 648 (MB), Reclaimed Zone : 1, ZLV: 0.236159
[1567] :: 7166 ~ 7168, 2851 ms, 706 (MB), Reclaimed Zone : 1, ZLV: 0.234956
[1568] :: 7168 ~ 7171, 2754 ms, 741 (MB), Reclaimed Zone : 1, ZLV: 0.462933
[1569] :: 7171 ~ 7174, 2990 ms, 785 (MB), Reclaimed Zone : 1, ZLV: 0.622363
[1570] :: 7196 ~ 7198, 2368 ms, 598 (MB), Reclaimed Zone : 1, ZLV: 0.215347
[1571] :: 7198 ~ 7201, 2586 ms, 633 (MB), Reclaimed Zone : 1, ZLV: 0.758646
[1572] :: 7201 ~ 7204, 2876 ms, 700 (MB), Reclaimed Zone : 1, ZLV: 0.991966
[1573] :: 7210 ~ 7212, 1923 ms, 438 (MB), Reclaimed Zone : 1, ZLV: 0.509810
[1574] :: 7212 ~ 7214, 1986 ms, 496 (MB), Reclaimed Zone : 1, ZLV: 0.717937
[1575] :: 7216 ~ 7217, 1516 ms, 350 (MB), Reclaimed Zone : 1, ZLV: 0.208313
[1576] :: 7218 ~ 7221, 2876 ms, 606 (MB), Reclaimed Zone : 1, ZLV: 0.626074
[1577] :: 7226 ~ 7229, 3266 ms, 711 (MB), Reclaimed Zone : 1, ZLV: 0.499771
[1578] :: 7230 ~ 7234, 3034 ms, 739 (MB), Reclaimed Zone : 1, ZLV: 0.235582
[1579] :: 7234 ~ 7237, 3034 ms, 760 (MB), Reclaimed Zone : 1, ZLV: 0.595925
[1580] :: 7238 ~ 7241, 3181 ms, 759 (MB), Reclaimed Zone : 1, ZLV: 0.409023
[1581] :: 7243 ~ 7246, 2929 ms, 667 (MB), Reclaimed Zone : 1, ZLV: 0.304022
[1582] :: 7256 ~ 7258, 2641 ms, 563 (MB), Reclaimed Zone : 1, ZLV: 0.540756
[1583] :: 7262 ~ 7265, 2971 ms, 701 (MB), Reclaimed Zone : 1, ZLV: 0.391456
[1584] :: 7265 ~ 7267, 2602 ms, 711 (MB), Reclaimed Zone : 1, ZLV: 0.452824
[1585] :: 7268 ~ 7271, 3152 ms, 741 (MB), Reclaimed Zone : 1, ZLV: 0.806917
[1586] :: 7274 ~ 7276, 1906 ms, 440 (MB), Reclaimed Zone : 1, ZLV: 0.228265
[1587] :: 7276 ~ 7279, 2688 ms, 695 (MB), Reclaimed Zone : 1, ZLV: 0.483925
[1588] :: 7279 ~ 7282, 3097 ms, 804 (MB), Reclaimed Zone : 1, ZLV: 0.694370
[1589] :: 7288 ~ 7291, 3199 ms, 554 (MB), Reclaimed Zone : 1, ZLV: 0.681394
[1590] :: 7299 ~ 7301, 2527 ms, 562 (MB), Reclaimed Zone : 1, ZLV: 0.371289
[1591] :: 7301 ~ 7304, 2785 ms, 733 (MB), Reclaimed Zone : 1, ZLV: 0.759646
[1592] :: 7304 ~ 7307, 2930 ms, 714 (MB), Reclaimed Zone : 1, ZLV: 0.381981
[1593] :: 7307 ~ 7310, 2881 ms, 740 (MB), Reclaimed Zone : 1, ZLV: 0.804147
[1594] :: 7314 ~ 7316, 2363 ms, 624 (MB), Reclaimed Zone : 1, ZLV: 0.240240
[1595] :: 7333 ~ 7336, 3127 ms, 776 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1596] :: 7336 ~ 7339, 2894 ms, 783 (MB), Reclaimed Zone : 1, ZLV: 0.566008
[1597] :: 7339 ~ 7342, 3067 ms, 806 (MB), Reclaimed Zone : 1, ZLV: 0.365150
[1598] :: 7344 ~ 7347, 3034 ms, 755 (MB), Reclaimed Zone : 1, ZLV: 0.328666
[1599] :: 7347 ~ 7350, 2902 ms, 795 (MB), Reclaimed Zone : 1, ZLV: 0.213225
[1600] :: 7351 ~ 7354, 2450 ms, 528 (MB), Reclaimed Zone : 1, ZLV: 0.378143
[1601] :: 7358 ~ 7361, 2726 ms, 730 (MB), Reclaimed Zone : 1, ZLV: 0.273892
[1602] :: 7367 ~ 7370, 3728 ms, 724 (MB), Reclaimed Zone : 1, ZLV: 0.578624
[1603] :: 7373 ~ 7377, 3236 ms, 727 (MB), Reclaimed Zone : 1, ZLV: 0.553170
[1604] :: 7378 ~ 7381, 2856 ms, 677 (MB), Reclaimed Zone : 1, ZLV: 0.210499
[1605] :: 7381 ~ 7383, 2053 ms, 463 (MB), Reclaimed Zone : 1, ZLV: 0.419404
[1606] :: 7384 ~ 7387, 3136 ms, 723 (MB), Reclaimed Zone : 1, ZLV: 0.345843
[1607] :: 7387 ~ 7391, 3344 ms, 738 (MB), Reclaimed Zone : 1, ZLV: 0.408190
[1608] :: 7397 ~ 7400, 3084 ms, 736 (MB), Reclaimed Zone : 1, ZLV: 0.249930
[1609] :: 7403 ~ 7407, 3476 ms, 783 (MB), Reclaimed Zone : 1, ZLV: 0.920003
[1610] :: 7411 ~ 7414, 2844 ms, 725 (MB), Reclaimed Zone : 1, ZLV: 0.141221
[1611] :: 7417 ~ 7420, 2923 ms, 733 (MB), Reclaimed Zone : 1, ZLV: 0.237833
[1612] :: 7422 ~ 7426, 3859 ms, 695 (MB), Reclaimed Zone : 1, ZLV: 0.368437
[1613] :: 7426 ~ 7429, 3053 ms, 734 (MB), Reclaimed Zone : 1, ZLV: 0.599792
[1614] :: 7429 ~ 7432, 3020 ms, 791 (MB), Reclaimed Zone : 1, ZLV: 0.365606
[1615] :: 7432 ~ 7435, 2932 ms, 796 (MB), Reclaimed Zone : 1, ZLV: 0.215992
[1616] :: 7435 ~ 7438, 2930 ms, 799 (MB), Reclaimed Zone : 1, ZLV: 0.210630
[1617] :: 7438 ~ 7442, 3153 ms, 799 (MB), Reclaimed Zone : 1, ZLV: 0.519938
[1618] :: 7447 ~ 7451, 3610 ms, 802 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1619] :: 7451 ~ 7454, 3398 ms, 803 (MB), Reclaimed Zone : 1, ZLV: 0.637846
[1620] :: 7454 ~ 7458, 3239 ms, 817 (MB), Reclaimed Zone : 1, ZLV: 1.000000
[1621] :: 7458 ~ 7461, 3753 ms, 814 (MB), Reclaimed Zone : 1, ZLV: 1.000000
Total ZC Copied (MB) :: 689982, Recaimed by ZC :: 1621
Total ZC copied- GC_BYTES_WRITTEN(MB):: 689981
Reset Count (R+ZC) : 216+1621=1837
Finish Count : 0
Average ZLV :: 0.604637
propagation count : 0
TOTAL I/O BLOKCING TIME 4627
TOTAL I/O BLOCKING TIME(ms) 3009513
Cumulative I/O Blocking(ms) 3009513
Calculate Lifetime Time(ms) 8716
copy/written ratio : 723498458680/1433004233160=50
level[0]: 분자(overlapping) 162775816522 / 분모(file size) 107999448321 = 1.5072
level[1]: 분자(overlapping) 411487386477 / 분모(file size) 106171214993 = 3.8757
level[2]: 분자(overlapping) 297773543597 / 분모(file size) 95222184806 = 3.1271
level[3]: 분자(overlapping) 0 / 분모(file size) 41113932668 = 0.0000
level[4]: 분자(overlapping) 0 / 분모(file size) 0 = 0.0000
avg deletion after time 360782456 us (total: 1921527364960 us, count: 5326)
reset_count_before_full_ 0 reset_size_before_full_ 0
SEQUENCE DISTRIBUTION
154 69 136 127 73 32 28 84 58 66 31 64 75 82 37 45 57 50 27 46 46 61 52 54 28 35 40 28 31 34 18 24 14 24 40 31 12 36 34 32 24 36 21 20 23 23 16 21 28 39 24 11 20 24 13 16 23 23 21 9 13 20 49 23 7 15 14 20 20 18 26 19 14 19 13 22 19 17 19 18 20 27 17 21 27 19 16 6 8 6 10 8 13 17 7 5 3 4 15 15 10 12 18 8 2 13 14 7 3 1 16 2 9 1 7 7 4 27 5 7 4 13 1 8 22 14 6 4 9 5 3 6 9 8 5 2 6 6 2 6 4 5 5 15 6 8 18 7 8 4 7 5 7 12 8 10 9 4 5 5 8 8 8 8 10 12 13 7 8 6 3 5 8 2 3 4 3 8 1 4 6 8 4 8 10 4 4 5 8 4 8 7 3 3 1 2 1 21 1 8 11 1 3 4 4 3 1 0 0 5 3 3 0 1 6 1 1 9 7 4 7 7 10 4 5 2 4 3 4 3 0 7 0 6 2 12 1 2 6 3 2 4 3 1 5 9 5 5 3 4 2 3 1 5 3 2 0 1 6 1 0 2 1 4 3 0 1 1 5 1 3 3 0 3 2 2 0 0 2 3 4 1 1 6 1 2 4 4 1 1 3 4 0 6 2 0 1 3 1 4 5 0 6 3 2 7 4 5 0 4 0 1 3 2 3 3 0 0 1 1 0 0 5 4 1 1 2 3 6 2 4 2 3 9 8 1 3 0 5 3 2 4 6 2 0 0 0 1 0 0 0 0 2 0 0 1 2 2 0 6 1 0 1 0 3 0 1 0 1 0 0 0 1 0 7 3 2 0 0 0 4 3 0 5 2 1 1 4 3 0 2 0 0 0 2 4 1 3 0 0 2 1 7 3 2 3 0 1 1 0 5 2 3 0 2 1 1 4 1 1 0 4 0 3 4 2 4 3 0 2 2 0 0 0 8 0 0 1 0 1 0 0 2 7 5 0 1 2 2 0 3 0 0 1 0 2 2 4 1 0 2 2 2 2 9 0 0 1 1 1 1 2 0 0 0 0 0 0 2 0 0 5 0 0 1 0 6 1 4 3 4 3 0 5 0 1 1 0 2 1 0 2 0 2 1 0 1 1 0 1 0 0 1 1 2 0 0 1 1 0 0 2 0 3 0 0 0 3 0 0 0 0 0 1 1 0 0 0 2 0 1 0 0 0 0 0 0 1 1 1 0 3 0 1 1 3 1 1 0 1 1 2 0 1 1 0 0 1 1 0 2 0 1 1 0 0 0 0 1 2 4 2 1 5 1 0 0 2 1 3 2 0 0 1 0 0 3 0 1 1 0 0 2 0 0 1 1 1 0 0 1 1 0 1 0 0 2 0 2 1 0 1 1 0 0 0 0 0 6 1 0 0 1 0 0 2 0 2 2 0 0 1 0 1 0 1 0 0 1 1 1 0 1 4 0 0 0 1 3 3 3 1 0 0 7 7 0 3 0 2 2 0 2 0 0 2 1 1 0 0 1 3 0 0 0 1 1 1 1 3 0 1 0 0 3 1 0 0 1 0 1 2 0 2 0 0 0 0 0 0 0 1 1 0 2 0 0 0 1 2 1 0 1 2 1 0 0 4 1 0 0 0 0 5 0 0 0 0 0 0 2 0 4 0 3 1 7 2 0 1 0 0 4 0 6 1 0 3 3 0 1 1 1 1 0 0 0 0 0 1 0 0 0 0 1 0 0 2 1 0 2 3 0 1 0 3 1 1 1 0 0 1 0 2 0 0 1 0 0 1 0 1 0 2 1 2 2 1 1 0 1 2 2 1 0 1 0 0 0 1 0 1 0 2 0 1 0 0 1 0 0 0 0 1 2 0 0 2 0 0 0 0 3 0 0 0 0 1 0 0 3 0 0 5 3 0 0 0 0 0 0 0 0 1 0 0 4 0 0 0 3 5 0 1 0 1 0 1 0 0 0 1 1 0 0 1 2 0 0 0 2 1 0 1 0 0 2 3 0 0 0 0 0 1 0 0 2 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 2 1 0 0 2 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0 2 0 2 0 0 1 1 0 1 1 0 0 0 1 1 2 0 3 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 1 1 1 0 2 0 0 0 2 0 3 0 1 1 0 0 0 4 0 0 0 0 0 0 1 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 5 0 0 1 0 0 0 4 0 0 7 0 0 0 1 0 2 1 2 1 0 1 0 0 2 0 2 0 0 2 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 0 1 0 1 0 0 0 0 1 0 1 0 3 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 2 0 0 0 0 0 1 0 2 0 1 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 2 0 1 0 0 0 0 0 1 0 0 0 0 1 2 1 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 1 0 0 0 0 2 0 1 0 0 1 0 1 0 0 0 0 0 0 1 0 0 0 0 2 0 0 0 5 0 0 0 1 0 0 0 3 0 1 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 1 0 1 0 2 0 0 0 0 0 0 0 0 0 0 0 7 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 2 0 1 0 0 0 1 4 0 2 0 0 0 0 0 0 0 0 0 1 1 0 1 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 2 0 1 0 0 4 0 0 0 0 0 0 2 0 1 0 0 0 0 0 0 0 0 0 1 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 1 1 0 1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 5 0 0 0 1 0 0 1 0 0 0 1 0 0 0 1 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 2 1 18 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 2 0 0 0 1 0 1 0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 0 2 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 14 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 13 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9 4 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 4 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 3 0 0 0 0 0 0 0 2 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 FILE SIZE DISTRIBUITION
170 65 49 68 73 59 67 71 73 82 64 91 96 98 88 103 112 100 86 84 95 93 86 93 76 95 84 92 74 83 99 84 103 74 82 84 2899 85 89 76 97 76 87 111 97 103 95 88 97 90 92 94 89 87 91 102 117 103 111 100 107 110 114 2914 13880 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 PrintMisPredictStats
[Accumulated Stats] right_vertical_total=7402, false_vertical_total=9191, right_horizontal_total=2284637, false_horizontal_total=50726
[Accumulated] Vertical false/(right+false) = 0.553908 (≈ 55.3908%)
[Accumulated] Horizontal false/(right+false) = 0.0217208 (≈ 2.17208%)