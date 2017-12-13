# php-fpm-setup
Skelleton for a flexible PHP-FPM for use with Apache2 or NGINX

Tested on Debian/Ubuntu

## Installation on Debian/Ubuntu

Use of 3rd-party PPAs may be useful to aquire recent PHP-Versions
I'm using Ondrej’s PPA for Ubuntu/Debian on this on different systems for longer time without hassle and being able to install multiple PHP-Versions at once.

```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
```

### Then install like this:
```
# Virtal-Package containing all available PHP-Versions
sudo apt-get install php-fpm

# or select which one:
sudo apt-get install php5.6-fpm php7.0-fpm php7.1-fpm

# don't forget to install the PHP-Binaries themselve (most importand is php-cgi!)
sudo apt-get install php7 php7.0-cli php7.0-cgi php7.0-common
```

### For use on Apache2
You need at least
```
sudo apt-get install libapache2-mod-fastcgi
sudo a2enmod actions alias
```

#### Start/Stop FPM-Services
```
# Default using UpStart
sudo service php7.0-fpm [start|stop|restart|status]
# or using init.d
sudo /etc/init.d/php7.0-fpm [start|stop|restart|status]
```
For PHP-Versions installed using [PhpBrew](https://github.com/phpbrew/phpbrew) look in the documentation for PhpBrew and make shure you have a symlink for your desired PhpBrew-FPM-Service Files in a handy place (f.e. /etc/init.d/).

#### Test your Setup (also recomennded before every restart on production)
```
# NGINX
sudo nginx -t

# Apache2
sudo apache2ctl -t
```

# For use with OSX
I recommend using Brew and [PhpBrew](https://github.com/phpbrew/phpbrew)  to install the desired PHP-Versions. Installing other PHP-Versions has been tested on linux using [PhpBrew](https://github.com/phpbrew/phpbrew) and approved to be working! Don't forget to update the PHP-Config for Apache2/NGINX linking to the correct FPM-Socket-Path of your PhpBrew-Instance!
