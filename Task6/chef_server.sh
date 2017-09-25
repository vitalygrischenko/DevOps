!#/bin/bash/
sudo su -
yum install -y wget curl
wget https://packages.chef.io/files/stable/chef-server/12.16.9/el/7/chef-server-core-12.16.9-1.el7.x86_64.rpm
rpm -Uvh chef-server-core-12.16.9-1.el7.x86_64.rpm
chef-server-ctl reconfigure
chef-server-ctl user-create admin1 Admin Adminov adminov@tut.ru 'admin123' --filename /vagrant/admin.pem
chef-server-ctl org-create gsu 'Gomel State University' --association_user admin1 --filename /vagrant/gsu-validator.pem
firewall-cmd --permanent --zone public --add-service http
firewall-cmd --permanent --zone public --add-service https
firewall-cmd --reload
chef-server-ctl install chef-manage
chef-server-ctl reconfigure
chef-manage-ctl reconfigure
