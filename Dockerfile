#define the validate image "debian:buster" by Docker

FROM debian:buster



#Install the packages and the updates needed

RUN apt-get update
RUN apt-get upgrade -y

#installing nginx (an HTTP and reverse proxy server)
RUN apt-get -y install nginx

#installing the SSL protocol " Secure Sockets Layer"( an encryption-based Internet security protocol)
RUN apt-get install openssl -y

#installing wget (a command line utility for downloading files from the Internet.)
RUN apt-get -y install wget

#installing MariaDB Database for WordPress

RUN apt-get install mariadb-server -y
#installing phpMyAdmin and MySql tools
#php-mbstring: a PHP extension used to manage non-ASCII strings and convert strings to different encodings

#php-zip: a PHP module that supports uploading .zip files to phpMyAdmin

#php-gd: another PHP module, this one enables support for the GD Graphics Library

RUN apt install php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cli php-cgi -y
RUN apt-get install php-mysql -y
RUN apt-get install php7.3-fpm -y

#Starting the docker

COPY srcs/tmp
COPY srcs/start.sh ./
RUN mkdir -p /var/www/ft_server

# the SSL certificate
#openssl: This is the basic command line tool for creating and managing OpenSSL certificates, keys, and other files.

#req: This subcommand specifies that we want to use X.509 certificate signing request (CSR) management. The “X.509” is a public key infrastructure standard that SSL and TLS adheres to for its key and certificate management. We want to create a new X.509 cert, so we are using this subcommand.

#-x509: This further modifies the previous subcommand by telling the utility that we want to make a self-signed certificate instead of generating a certificate signing request, as would normally happen.

#-nodes: This tells OpenSSL to skip the option to secure our certificate with a passphrase. We need Apache to be able to read the file, without user intervention, when the server starts up. A passphrase would prevent this from happening because we would have to enter it after every restart.

#-days 365: This option sets the length of time that the certificate will be considered valid. We set it for one year here.

#-newkey rsa:2048: This specifies that we want to generate a new certificate and a new key at the same time. We did not create the key that is required to sign the certificate in a previous step, so we need to create it along with the certificate. The rsa:2048 portion tells it to make an RSA key that is 2048 bits long.

#-keyout: This line tells OpenSSL where to place the generated private key file that we are creating.

#-out: This tells OpenSSL where to place the certificate that we are creating.

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=ft_server"

#NGINX
RUN mv /tmp/nginx/default /etc/nginx/sites-available/default
RUN mv /var/www/html/index.nginx-debian.html /var/www/ft_server/index.nginx-debian.html

#Script for creating directories needed
RUN mkdir -p /var/www/ft_server
	#PHPMYADMIN
RUN bash /tmp/phpmyadmin/phpSetup.sh
	#WordPress
RUN bash /tmp/wordpress/wpSetup.sh
	#DataBase
RUN bash /tmp/database/DBsetup.sh


#ENTRYPOINT

# this used to specifying some metadata in your image that describes how to run a container based on this image
CMD bash start.sh

