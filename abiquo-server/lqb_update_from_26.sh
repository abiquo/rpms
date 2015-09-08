#!/bin/bash

DATADIR="/usr/share/doc/abiquo-server/database/"
URL="jdbc:mysql://localhost:3306/kinton"
DBUSER="root"
DBPASSWORD=""
DRIVER="com.mysql.jdbc.Driver"
CLASSPATH=`rpm -ql abiquo-core | grep mysql-connector`
LOGLEVEL="debug"
LOGFILE="/var/log/abiquo-liquibase.log"

if [ ! -f "$CLASSPATH" ]; then
        echo "Cannot find database connector."
        exit 1
fi

pushd $DATADIR > /dev/null
# 1st step with schema and some data migration
liquibase --changeLogFile=src/kinton_26_to_29.xml --url=$URL --username=$DBUSER --password=$DBPASSWORD --driver=$DRIVER \
          --classpath=$CLASSPATH --logLevel=$LOGLEVEL --logFile=$LOGFILE update

# Accounting upgrade. Add -h IP if your mysql is not in localhost
mysql -u$DBUSER --password="$DBPASSWORD" < src/accounting/kinton_accounting.sql

# Post step for vm accounting data migration and column cleaning/removal
liquibase --changeLogFile=src/2.9.0/kinton_29_poststep.xml --url=$URL --username=$DBUSER --password=$DBPASSWORD --driver=$DRIVER \
          --classpath=$CLASSPATH --logLevel=$LOGLEVEL --logFile=$LOGFILE update

# Upgrading to 3.0 and latest
liquibase --changeLogFile=src/kinton_master_changelog.xml --url=$URL --username=$DBUSER --password=$DBPASSWORD --driver=$DRIVER \
          --classpath=$CLASSPATH --logLevel=$LOGLEVEL --logFile=$LOGFILE update

if [ $? == 0 ]; then
        echo "Done."

        echo "The password for default_user_for_m is: "
        mysql -u$DBUSER --password="$DBPASSWORD" kinton -B --skip-column-names -e "select COMMENTS from DATABASECHANGELOG where ID = 'default_user_for_m'"
else
        echo "Failed! See log in $LOGFILE"
fi
popd > /dev/null
