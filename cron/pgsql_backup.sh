#!/bin/bash

# Read environment variables from postgre.env
source /etc/postgres.env

# Set the backup directory (customize as needed)
BACKUP_DIR="/data/pg_dump/"

# Get the current date and time
TIMESTAMP=$(date +'%Y%m%d%H%M%S')
#
# Backup a Postgresql database into a daily file.
#
# Loop through all databases (excluding system databases)
psql -h localhost -U "$POSTGRES_USER" -d postgres -Atc "SELECT datname FROM pg_database WHERE datistemplate = false" | while read -r DBNAME; do
    BACKUP_FILE="$BACKUP_DIR${DBNAME}_${TIMESTAMP}.tar"
    pg_dump --no-owner --no-acl --dbname="postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:5432/${DBNAME}" -Fc > "$BACKUP_FILE"
    if [ $? -eq 0 ]; then
        echo "Backup completed for database $DBNAME. File saved as: $BACKUP_FILE"
    else
        echo "Backup failed for database $DBNAME."
    fi
done
#### Auto remove old backups
find /data/pg_dump -maxdepth 1 -mtime +14 | xargs rm -f \;
