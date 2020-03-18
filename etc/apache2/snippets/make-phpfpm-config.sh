#!/bin/bash
configPath='/etc/apache2/snippets/';

if [[ -z $@ ]];
then
  echo -e "\nSyntax: $(basename $0) {php-version}";
  echo -e "\tExample: $(basename $0) 7.2\n";
  exit 1;
fi

phpVersion="${1}";
phpVersionNumeric=${phpVersion/./};

if [[ ! $(which "php${phpVersion}") ]];
then
  echo "Cannot find php${phpVersion} binary!";
  exit 1;
fi

if [[ ! $(which "php-fpm${phpVersion}") ]];
then
  echo "Cannot find php-fpm${phpVersion} binary!";
  exit 1;
fi

cat <<CONFIG > ${configPath}/vhost-php${phpVersion}-fpm.conf
#
# PHP-FPM ${phpVersion}
#

<IfModule mod_fastcgi.c>
    # Apache2 version < 2.4.10
    <IfVersion !~ ^2.4.1[0-9]*$>
        AddType application/x-httpd-fastphp${phpVersionNumeric} .php
        Action application/x-httpd-fastphp${phpVersionNumeric} /php${phpVersion}-fcgi
        Alias /php${phpVersion}-fcgi /usr/lib/cgi-bin/php${phpVersion}
        AddHandler php${phpVersion}-fcgi .php

        <FilesMatch "\.php$">
                SetHandler application/x-httpd-fastphp${phpVersionNumeric}
        </FilesMatch>
    </IfVersion>

    # Apache2 version >2.4.10
    <IfVersion /^2.4.18[0-9]*$/>
        <FilesMatch "\.php$">
                SetHandler proxy:unix:/run/php/php${phpVersion}-fpm.sock|fcgi://localhost/
        </FilesMatch>
    </IfVersion>
</IfModule>
CONFIG
