# sudo mkdir /mnt/sb/immich-dbbackup
docker exec -t gf-postgres pg_dumpall -c -U user | /usr/bin/gzip > /mnt/sb/immich-dbbackup/ghostfolio-database.sql.gz

# chmod +x /home/hetzner.github/initial-scripts/07_backup_ghostfolio.sh
# sudo crontab -e
# add a line
# 0 3 * * * /home/hetzner.github/initial-scripts/07_backup_ghostfolio.sh
