# Complete automate installation of WP
yum update

yum install -y vim wget zip unzip
echo "************installation of Packages done***********"

yum install -y httpd
echo "************installation of Apache Server done***********"

service httpd start
echo "************installation of Apache Server started***********"

yum install -y php php-mysql
echo "************installation of PHP and PHP-MYSQL is done***********"

service httpd restart
echo "************Apache service is Restarted***********"

cd /var/www/html/
vim test.php -c '$put ="<?php phpinfo() ?>"' -c 'wq'
echo "************OPened vim editor and added php info and saved the php file***********"

yum update
echo "************updating completed***********"

wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
echo "*****Updating the MYSQL Repositories*****"
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
sudo yum update

yum -y install mysql server
echo "********************installation of MYSQL service is completed***************"

service mysql start
echo "*************Service started***************"

sudo mysqladmin -u root create satpriya
echo "*****Rename the Wordpress to Arvisat *****"

mysql_secure_installation # go with all Yes Options

wget http://wordpress.org/latest.tar.gz
echo "*****Wordpress is Downloaded*****"

tar -xzvf latest.tar.gz
echo "*****Untar of Wordpress is done"

mv wordpress satpriya
echo "*****Renamed the Wordpress to Arvisat"

cd /arvisat/


mv wp-config-sample.php wp-config.php

vim /etc/httpd/conf/httpd.conf # <directory> /var/www/html/ All Override None to replace with All#
