# sudo mkdir /mnt/sb/immich-dbbackup
docker exec -t ryot-db pg_dumpall -c -U postgres | /usr/bin/gzip > /mnt/sb/immich-dbbackup/ryot-database.sql.gz

# chmod +x /home/hetzner.github/initial-scripts/06_backup_ryot.sh
# sudo crontab -e
# add a line
# 0 3 * * * /home/hetzner.github/initial-scripts/06_backup_ryot.sh

