# mysql���ݿ�����ȫ��ִ�нű�

<h2>1. �ļ��嵥</h2>
	1.1. backup.shΪ�������ݽű�
	1.2. full-backup.shΪȫ�����ݽű�
	1.3. my.cnfΪmysql5.7.23���ݿ������ļ� (�����ҿ��ܻ���Ҫ)

<h2>2. ��Ҫ�õ�������</h2>
	2.1. �鿴mysql�Ƿ�����binlog
		show variables like '%log_bin%';
	2.2. �鿴mysql��ǰ���µ�binlog�ļ����
		show master status;
	2.3. �鿴mysql���ݿ�汾
		select version();
	2.4. �ָ���ָ��binlog�ļ��ڵ�״̬
		./mysqlbinlog /data/mysql/mysql-bin.000004 | mysql -uroot -p123456 sys;
	2.5. �鿴������binlog�ļ����� (���ַ�ʽ���ɣ�һ����sql��䣬һ��������)
		show binlog events in 'mysql-bin.000007';
		./mysqlbinlog /data/mysql/mysql-bin.000003
	2.6. ��mysql��������ӵ�ֱ�ӿ�ִ�е�ϵͳ����� (ֻ��Ҫ�滻bin/����������ļ�����)
		ln -s  /usr/local/mysql/bin/mysql  /usr/bin

  <h2>5. ʵս</h2>
  https://blog.csdn.net/AinUser/article/details/109201841
