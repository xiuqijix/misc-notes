=================How-to-setup-environment-for-Report-Service===================
1. Host: Ubuntu LTS 18.04
2. Install Python3.8, Mysql5.7, Django3.0.5, Apache2.4.29, mod-wsgi 4.7.1

### Setup network for Ubuntu 18.04
`$ sudo gedit /etc/apt/apt.conf.d/proxy.conf`

```
Acquire {
  HTTP::proxy "http://child-prc.intel.com:913";
  HTTPS::proxy "http://child-prc.intel.com:913";
}
```

### Setup python3.8 pip3 mysql5.7
```
$ sudo apt-get install python3.8
$ sudo apt install python3.8-dev
$ sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
$ sudo apt-get install python3-pip
$ sudo apt-get install mysql-server-5.7
```

### Setup mysql
Recover your MySQL password:

```
mysql> use mysql;
​mysql> update user set authentication_string=password('NEWPASSWORD') where user='root';
​mysql> flush privileges;
​mysql> quit
```

`$ sudo mysql -u root`

```
mysql>USE mysql;
mysql>UPDATE user SET plugin='mysql_native_password' WHERE User='root'; // mysql_native_password is the plugin value, can't change it.
mysql>FLUSH PRIVILEGES;
mysql>exit;
```

`$ sudo systemctl restart mysql.service`

`$ sudo mysql_secure_installation`

```
Enter current password for root (enter for none): Just press Enter
Set root password? [Y/n]: Y
New password: Enter password
Re-enter new password: Repeat password
Remove anonymous users? [Y/n]: Y
Disallow root login remotely? [Y/n]: Y
Remove test database and access to it? [Y/n]:  Y
Reload privilege tables now? [Y/n]:  Y
```

### Setup other environments
```
$ sudo pip3 --proxy http://proxy:1234 install django-filter  // django 3.0.5
$ sudo pip3 --proxy http://proxy:1234 install django==3.0.5
$ sudo pip3 --proxy http://proxy:1234 install djangorestframework // 3.11.0
$ sudo pip3 --proxy http://proxy:1234 install django-robots //4.0
$ sudo pip3 --proxy https://proxy:1234 install xlrd
$ sudo pip3 --proxy https://proxy:1234 install PyMySQL
```

Modify /usr/local/lib/python3.8/dist-packages/django/\_\_init\_\_.py, add the following codes:

```
  import pymysql
  pymysql.version_info = (1, 3, 13, "final", 0)
  pymysql.install_as_MySQLdb()
```
```
$ sudo apt-get install apache2 apache2-dev libapache2-mod-wsgi-py3
$ sudo apt install phpmyadmin
```

### Configure default python3 is python3.8 in Ubuntu18.04
```
$ cd /usr/bin/
$ ls -alt python3
$ sudo rm python3
$ sudo ln -s python3.8 python3
```
```
$ cd /etc/alternatives
$ ls -alt python3
$ sudo rm python3
```
`$ sudo update-alternatives --config python3`

### Download lastest mod-wsgi 4.7.1
[download file link](https://pypi.org/project/mod-wsgi/#files)

```
$ tar xvfz mod_wsgi-4.7.1.tar.gz
$ cd mod_wsgi-4.7.1
$ ./configure --with-apxs=/usr/bin/apxs --with-python=/usr/bin/python3.8
$ make
$ sudo make install
```
### Fix terminal "ModuleNotFoundError: No module named 'apt_pkg'" issue

`$ sudo vim /usr/bin/gnome-terminal`

```
#...python => #...python3.6
```
```
$ cd /usr/lib/python3/dist-packages
$ sudo ln -s apt_pkg.cpython-36m-x86_64-linux-gnu.so apt_pkg.so
```


### Configure apache2
`$ sudo vim /etc/apache2/sites-available/000-default.conf`

```Listen 80
<VirtualHost *:80>
        ServerAdmin username@intel.com
        ErrorLog ${APACHE_LOG_DIR}/error.log
        LogLevel warn
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        <Directory />
                Options FollowSymLinks
                AllowOverride None
        </Directory>

        Alias /media/ /path-to/web_pnp_report/media/
        Alias /static/ /path-to/web_pnp_report/static/

        <Directory /path-to/web_pnp_report/media>
                Require all granted
        </Directory>

        <Directory /path-to/web_pnp_report/static>
                Require all granted
        </Directory>

        WSGIScriptAlias / /path-to/web_pnp_report/web_pnp_report/wsgi.py
        WSGIPassAuthorization On

        <Directory "/path-to/web_pnp_report/web_pnp_report">
                Options Indexes MultiViews FollowSymLinks
                AllowOverride All
                Require all granted
        </Directory>

        Include /etc/phpmyadmin/apache.conf

</VirtualHost>
```

### Visit phpmyadmin

Visit URL: http://server/phpmyadmin

Fix phpmyadmin "count" issue:

`$ sudo vim /usr/share/phpmyadmin/libraries/sql.lib.php`

Replace:

```
((empty($analyzed_sql_results['select_expr']))
    || (count($analyzed_sql_results['select_expr'] == 1)
        && ($analyzed_sql_results['select_expr'][0] == '*')))
```
With:

```
((empty($analyzed_sql_results['select_expr']))
    || (count($analyzed_sql_results['select_expr']) == 1)
        && ($analyzed_sql_results['select_expr'][0] == '*'))
```


### Start/Restart Apache2 service:
```
$ sudo service apache2 start
$ sudo service apache2 restart
```

### Setup ASGI
```
$ sudo pip3 install --upgrade setuptools
$ sudo apt install -y python3-autobahn
$ sudo apt install python3-twisted
$ pip3 install wheel
$ pip3 install daphne-2.5.0-py2.py3-none-any.whl
$ daphne -b 0.0.0.0 -p 8001 django_project.asgi:application
```

### Setup database
Create database:

`$ mysql -uroot -p#input password`

```
mysql> create database <your_database_name> default character set utf8 collate utf8_unicode_ci;
mysql> grant all on  <your_database_name>.* to '<your_account>'@localhost identified by "<your_password>";
```
Configure database in /path/.../settings.py:

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': '<your_database_name>',
        'USER': '<your_account>',
        'PASSWORD': '<your_password>',
        'HOST': 'localhost',
    }
}
```
Create database tables:

```
$ cd /path/...
$ python manage.py migrate
$ python manage.py makemigrations
$ python manage.py sqlmigrate
```

Create super user:

```
$ python manage.py createsuperuser
```

Create group and permission to reporter:

1. Visit http://server/admin/
2. Create a group which name is "reporter" # The "reporter" name is fixed
3. Set permissions to "reporter"
4. Create a user and add he to "reporter" group, select the "Staff status" to make sure he can visit /admin address
5. Create token to the user

Create project by super user:

```
$ curl -d "name=<name>&description=<desc>&short_name=<short_name>" http://<server>/api/project/ -H 'Authorization: Token <token>'
```

### Upload reports
Set 777 permission to media folder to backup the reports:

`$ chmod 777 /path/.../media/`

```
curl -F files=@/path/<filename> -F files=@/path/<filename> -F project=<project_id> http://<server>/api/report/ -H 'Authorization: Token <token>'
```

https://docs.djangoproject.com/zh-hans/3.0/
https://docs.djangoproject.com/zh-hans/3.0/genindex/
https://docs.djangoproject.com/en/3.0/
https://docs.djangoproject.com/en/3.0/genindex/

