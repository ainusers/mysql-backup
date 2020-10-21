#!/bin/bash


# author：ty
# date: 2020年10月21日11:35:02
# target: mysql5.7.23版本数据库全量脚本
# timer: 0 0 * * 0 为每周日12点crontab表达式

# 变量定义区域
now=$(date "+%Y%m%d-%H%M%S")
backUpFolder=/usr/local/backup/weekend
username=root
password=123456
db_name="sys"

# 定义备份文件名
fileName="${db_name}_${now}.sql"
# 定义备份文件目录
backUpFileName="${backUpFolder}/${fileName}"
echo "starting backup mysql ${db_name} at ${date_now}."
/usr/bin/mysqldump -u${username} -p${password}  --lock-all-tables --flush-logs ${db_name} > ${backUpFileName}
# 进入到备份文件目录
cd ${backUpFolder}
# 压缩备份文件
tar zcvf ${fileName}.tar.gz ${fileName}

date=$(date "+%Y%m%d-%H%M%S")
echo "backup mysql database ${db_name} success at ${date}"
