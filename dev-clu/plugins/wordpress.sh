#!/bin/bash

case "$fn" in
    # Update Homebrew and installed packages
    "wp:update")
        echo -e "${LIGHTBLUE}Ready to update wp";
        echo -e "${WHITEBOLD}==================${NC}";
        cd application;
        echo -e "${LIGHTBLUE}Update wp${NC}"
        wp core update --quiet;
        echo -e "${LIGHTBLUE}Update plugins${NC}"
        wp plugin update --all --quiet;
        echo -e "${LIGHTBLUE}Update translations${NC}"
        wp core language update --quiet;
        cd ..;
        echo -e "${LIGHTGREEN} Seems ok. Thank you${NC}";
 ;;
esac

case "$fn" in
    # Prepare path and bdd for a wordpress (beta) and with apache for now
    "wp:install")
#        read -p 'Project name : ' path
#        read -p 'TLD : ' domain
#        ## create folders
#        sudo mkdir "/var/www/$path"
#        sudo mkdir "/var/www/$path/application"
#        sudo mkdir "/var/www/$path/hosting"
#        sudo mkdir "/var/www/$path/databases"
#        sudo mkdir "/var/www/$path/media"
#        USERSCRIPT="$(who am i | awk '{print $1}')"
#        git clone https://github.com/WordPress/WordPress.git /var/www/$path/application/.
#        sudo chown ${USERSCRIPT}:www-data /var/www/$path/ -R
#        git clone https://github.com/patpetit/wp-smtp.git /var/www/$path/application/wp-content/plugins/wp-mail-smtp/
#        sudo chown www-data:www-data /var/www/$path/application -R
#
#        echo "Creating the vhost config file"
#        cat <<EOF > /var/www/$path/hosting/$domain.conf
#        <VirtualHost *:80>
#                ServerName $domain
#                ServerAlias www.$domain
#
#                DocumentRoot /var/www/$path/application
#                Alias /media /var/www/$path/media
#
#                LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
#                LogLevel warn
#                ErrorLog /var/log/httpd/${domain}_error_log
#                #CustomLog  "/var/log/httpd/%Y/%m%d_${domain}_access_log" combined
#        </VirtualHost>
#        EOF
#        echo "Linking vhost to Apache"
#        sudo ln -s /var/www/$path/hosting/$domain.conf /etc/apache2/sites-enabled/.
#        echo "Restarting Apache, cross fingers please"
#        sudo apachectl restart
#        ## create bdd
#        read -p 'Nom bdd et user : ' userbdd
#        echo "$userbdd choisi"
#        source /usr/local/etc/config.sh
#        OUTPUT="$(openssl rand -base64 32)"
#        echo "MOT DE PASSE USER ${userbdd} : ${OUTPUT}"
#        if [ $MYSQL_PWD ]
#        then
#        echo "CREATE DATABASE $userbdd;" | mysql -u$MYSQL_USER -p$MYSQL_PWD
#        echo "GRANT ALL PRIVILEGES ON $userbdd.* TO '$userbdd'@'localhost' IDENTIFIED BY '${OUTPUT}'" | mysql -u$MYSQL_USER -p$MYSQL_PWD
#        else
#          mysql -u "$MYSQL_USER" -e "SHOW DATABASES"
#        fi
 ;;
esac
