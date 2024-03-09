# sudo mkdir /mnt/sb/immich-dbbackup
docker exec -t immich_postgres pg_dumpall -c -U postgres | /usr/bin/gzip > /mnt/sb/immich-dbbackup/immich-database.sql.gz

# chmod +x /home/hetzner.github/initial-scripts/05_backup_immich_db.sh
# sudo crontab -e
# add a line
# 0 1 * * * /home/hetzner.github/initial-scripts/05_backup_immich_db.sh

