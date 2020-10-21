# mysql数据库增量全量执行脚本

<h2>1. 文件清单</h2>
	1.1. backup.sh为增量备份脚本
	1.2. full-backup.sh为全量备份脚本
	1.3. my.cnf为mysql5.7.23数据库配置文件 (我想大家可能会需要)

<h2>2. 需要用到的命令</h2>
	2.1. 查看mysql是否开启了binlog
		show variables like '%log_bin%';
	2.2. 查看mysql当前最新的binlog文件编号
		show master status;
	2.3. 查看mysql数据库版本
		select version();
	2.4. 恢复到指定binlog文件节点状态
		./mysqlbinlog /data/mysql/mysql-bin.000004 | mysql -uroot -p123456 sys;
	2.5. 查看二进制binlog文件内容 (两种方式均可，一个是sql语句，一个是命令)
		show binlog events in 'mysql-bin.000007';
		./mysqlbinlog /data/mysql/mysql-bin.000003
	2.6. 将mysql相关命令，添加到直接可执行的系统命令当中 (只需要替换bin/后面的命令文件即可)
		ln -s  /usr/local/mysql/bin/mysql  /usr/bin

  <h2>5. 实战</h2>
  https://blog.csdn.net/AinUser/article/details/109201841
