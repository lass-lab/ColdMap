# Currently in VLDB '26 submission.

| Authors             | Institute                         |
|------------------|------------------------------|
| Sungjin Byeon*    | Sogang University            |
| Kyungwook Min*    | Sogang University            |
| Jaewan Park      | Sogang University            |
| Sangyun Lee      | Sogang University            |
| Hong-Yeon Kim    | ETRI                         |
| Jun Young Han    | Samsung Electronics Co.      |
| Joo-Young Hwang  | Samsung Electronics Co.      |
| Zhichao Cao      | Arizona State University     |
| Youngjae Kim     | Sogang University            |

*Co-first author

To compile original source code, you need to
```
cd src && sudo DEBUG_LEVEL=0 ROCKSDB_PLUGINS=zenfs make  db_bench install -j16
```


# Todo for authors.
1) Change minsky(author's local directory) to $HOME.
~~2) upload mariadb source code compatible with rocksdb-zenfs.~~
3) upload missing experiment result(zipfian,nutanix,fillrandom,uniform)
