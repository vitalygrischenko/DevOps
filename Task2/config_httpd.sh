!#/bin/bash/
echo -e '172.16.0.2 server1 server1\n172.16.0.3 server2 server2' >> /etc/hosts
sudo yum install httpd -y
sudo cp /vagrant/mod_jk.so /etc/httpd/modules/
echo -e "worker.list=lb\nworker.lb.type=lb\nworker.lb.balance_workers=server1, server2\nworker.server1.host=172.16.0.2\nworker.server1.port=8009\nworker.server1.type=ajp13\nworker.server2.host=172.16.0.3\nworker.server2.port=8009\nworker.server2.type=ajp13" > /etc/httpd/conf/workers.properties
echo -e "LoadModule jk_module modules/mod_jk.so\nJkWorkersFile conf/workers.properties\nJkShmFile /tmp/shm\nJkLogFile logs/mod_jk.log\nJkLogLevel info\nJkMount /test* lb" >> /etc/httpd/conf/httpd.conf
sudo systemctl stop firewalld
sudo systemctl enable httpd
sudo systemctl start httpd