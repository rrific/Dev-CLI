#!/bin/bash

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
        source /usr/local/etc/config.sh
        dbname=$2
        
        # (1) set up all the mysqldump variables
        filepath="/var/dbbackup/$dbname"

        if [ ! -d "$filepath" ]; then
          mkdir $filepath
        fi

        filename="$filepath/"`date +"%Y%m%d"`.sql
        echo -e $filename
        
        # (2) in case you run this more than once a day, remove the previous version of the file
        unalias rm     2> /dev/null
        rm ${FILE}     2> /dev/null
        rm ${FILE}.gz  2> /dev/null
        
        # (3) do the mysql database backup (dump)
        
        # use this command for a database server on a separate host:
        #mysqldump --opt --protocol=TCP --user=${MYSQL_USER} --password=${PASS} --host=${DBSERVER} ${DATABASE} > ${FILE}
        
        # use this command for a database server on localhost. add other options if need be.
        mysqldump -u "$MYSQL_USER" -p$MYSQL_PWD "$dbname" > "$filename"
        
        # (4) gzip the mysql database dump file
        #gzip $filename
        
        # (5) show the user the result
        echo "$filename was created in folder $filepath"
    ;;
esac
