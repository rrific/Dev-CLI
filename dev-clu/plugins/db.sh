#!/usr/bin/env bash

case "$fn" in
    # Create a new user (find another way to execute this safely
    "db:user:create")
        echo -e "${LIGHTBLUE}Create db and associated ${NC}";
        read -p 'DB and user name (ENTER) : ' userbdd
        echo -e "${LIGHTBLUE}$userbdd ${NC}";
        source /usr/local/etc/config.sh
        OUTPUT="$(openssl rand -base64 32)"
        printf "${LIGHTBLUE}Generated user password${NC} ${userbdd} : ${OUTPUT}"
        if [ $MYSQL_PWD ]
        then
        printf "CREATE DATABASE $userbdd;" | mysql -u$MYSQL_USER -p$MYSQL_PWD
        printf "GRANT ALL PRIVILEGES ON $userbdd.* TO '$userbdd'@'localhost' IDENTIFIED BY '${OUTPUT}'" | mysql -u$MYSQL_USER -p$MYSQL_PWD
        else
          mysql -u "$MYSQL_USER" -e "SHOW DATABASES"
        fi
    ;;
esac

case "$fn" in
    "db:backup")
        dbname=$2
        
        # (1) set up all the mysqldump variables
        filepath="/var/dbbackup/$dbname"

        if [ ! -d "$filepath" ]; then
          mkdir $filepath
        fi

        filename="$filepath/"`date +"%Y%m%d"`.sql
                
        # use this command for a database server on localhost. add other options if need be.
        mysqldump --login-path=dump "$dbname" > "$filename"
        
        # (5) show the user the result
        echo "$dbname was backuped up as $filename"
    ;;
esac
