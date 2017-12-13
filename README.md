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

Then install like this:
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
