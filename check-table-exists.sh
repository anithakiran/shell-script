#!/bin/bash
user="db_user"
password="db_password"
database="db_name"
table="table_name"

exists=$(mysql -u "$user" -p"$password" -e "USE $database; SHOW TABLES LIKE '$table';" | grep "$table")

if [ "$exists" ]; then
    echo "Table $table exists in $database"
else
    echo "Table $table does not exist in $database"
fi
