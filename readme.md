# mysql���ݿ�����ȫ��ִ�нű�

<h2>1. �ļ��嵥</h2>
	1.1. backup.shΪ�������ݽű�
	1.2. full-backup.shΪȫ�����ݽű�
	1.3. my.cnfΪmysql5.7.23���ݿ������ļ� (�����ҿ��ܻ���Ҫ)

<h2>2. ��Ҫ�õ�������</h2>
	2.1. �鿴mysql�Ƿ�����binlog <br/>
		show variables like '%log_bin%';<br/>
	2.2. �鿴mysql��ǰ���µ�binlog�ļ����<br/>
		show master status;<br/>
	2.3. �鿴mysql���ݿ�汾<br/>
		select version();<br/>
	2.4. �ָ���ָ��binlog�ļ��ڵ�״̬<br/>
		./mysqlbinlog /data/mysql/mysql-bin.000004 | mysql -uroot -p123456 sys;<br/>
	2.5. �鿴������binlog�ļ����� (���ַ�ʽ���ɣ�һ����sql��䣬һ��������)<br/>
		show binlog events in 'mysql-bin.000007';<br/>
		./mysqlbinlog /data/mysql/mysql-bin.000003<br/>
	2.6. ��mysql��������ӵ�ֱ�ӿ�ִ�е�ϵͳ����� (ֻ��Ҫ�滻bin/����������ļ�����)<br/>
		ln -s  /usr/local/mysql/bin/mysql  /usr/bin

  <h2>3. ʵս</h2>
  https://blog.csdn.net/AinUser/article/details/109201841
