#!/bin/bash


# author：ty
# date: 2020年10月21日11:35:02
# target: mysql5.7.23版本数据库增量备份脚本
# timer: 0 0 * * * 为每天12点crontab表达式

# 注意：执行改脚本之前，请自行创建如下目录 (logs是个文件，可以使用touch创建)
backupDir=/usr/local/backup/daily
logFile=/usr/local/backup/logs

# 增量备份目标binlog文件目录 (mysql安装时指定目录，/etc/my.cnf配置文件中)
mysqlDir=/data/mysql

# mysql数据文件 (sql语句可查看：show variables like '%log_bin%';)
binFile=/data/mysql/mysql-bin.index

# 生成新的binlog文件命令
mysqladmin -uroot -p123456 flush-logs

# 核心内容
counter=`wc -l $binFile | awk '{print $1}'`
nextNum=0

# 这个for循环用于比对$Counter,$NextNum这两个值来确定文件是不是存在或最新的
for file in `cat $binFile`
do
   base=`basename $file`
   echo $base
   # basename用于截取mysql-bin.00000*文件名，去掉./mysql-bin.000005前面的./
   nextNum=`expr $nextNum + 1`
   if [ $nextNum -eq $counter ]
   then
       echo $base skip! >> $logFile
   else
       dest=$backupDir/$base
       if(test -e $dest)
       # test -e用于检测目标文件是否存在，存在就写exist!到$logFile去
       then
           echo $base exist! >> $logFile
       else
           cp $mysqlDir/$base $backupDir
           echo $base copying >> $logFile
        fi
    fi
done
echo `date +"%Y年%m月%d日 %H:%M:%S"`  backup success >> $logFile
