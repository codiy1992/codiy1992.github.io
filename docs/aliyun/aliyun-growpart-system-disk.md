---
layout: default
title: 阿里云ECS扩容系统盘
parent: aliyun
nav_order: 2
---


详见 [扩展分区和文件系统_Linux系统盘][1]

针对centos7系统，操作如下，注意是**系统盘**, 不是**数据盘**:

```
# 安装扩容工具
yum install cloud-utils-growpart
yum install xfsprogs
# 确定内核版本大于3.6.0
uname -a 
```

```
[root@ecshost ~]# fdisk -l
Disk /dev/vda: 107.4 GB, 107374182400 bytes, 209715200 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x0008d73a

   Device Boot      Start         End      Blocks   Id  System
/dev/vda1   *        2048    41943039    20970496   83  Linux
```
```
[root@ecshost ~]# df -h
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        7.8G     0  7.8G   0% /dev
tmpfs           7.8G     0  7.8G   0% /dev/shm
tmpfs           7.8G  344K  7.8G   1% /run
tmpfs           7.8G     0  7.8G   0% /sys/fs/cgroup
tmpfs           1.6G     0  1.6G   0% /run/user/0
/dev/vda1        20G  1.5G   18G   8% /
```

```
[root@ecshost ~]# growpart /dev/vda 1
CHANGED: partition=1 start=2048 old: size=41940992 end=41943040 new: size=209710462,end=209712510
```

```
[root@ecshost ~]# resize2fs /dev/vda1
resize2fs 1.42.9 (28-Dec-2013)
Filesystem at /dev/vda1 is mounted on /; on-line resizing required
old_desc_blocks = 2, new_desc_blocks = 7
The filesystem on /dev/vda1 is now 26213807 blocks long.
```

```
[root@ecshost ~]# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        99G  1.6G   93G   2% /
devtmpfs        7.8G     0  7.8G   0% /dev
tmpfs           7.8G     0  7.8G   0% /dev/shm
tmpfs           7.8G  500K  7.8G   1% /run
tmpfs           7.8G     0  7.8G   0% /sys/fs/cgroup
tmpfs           1.6G     0  1.6G   0% /run/user/0
```
[1]: https://help.aliyun.com/document_detail/111738.html?spm=a2c4g.11186623.6.789.e7b91b251yWyb6
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE4OTY1MzQzNzNdfQ==
-->