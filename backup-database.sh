#!/bin/bash
user="db_user"
password="db_password"
database="db_name"
backup_dir="dest-dir"

mysqldump -u "$user" -p"$password" "$database" > "$backup_dir/${database}_$(date +%F).sql"
echo "Database $database backed up successfully"
