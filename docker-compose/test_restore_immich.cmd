:: cleanuping
rmdir /S /Q D:\usr\data\immich-app\Backups

:: updating and creating containers
curl -O https://raw.githubusercontent.com/adrian-bulicanu/hetzner/main/docker-compose/immich-app/docker-compose.yml
docker compose down -v
docker compose rm -f
docker compose pull
docker compose create

:: disabling autorestart
:: NOTE: the docker can throw the unimportant error "failed to get console mode for stdout: The handle is invalid.", which should be fixed in docker.
FOR /F "tokens=*" %%i IN ('docker ps -aqf "name=immich*"') DO (
    docker update --restart=no %%i
)

:: restoring database and media
docker start immich_postgres
"C:\Program Files\WinRAR\Rar.exe" x "E:\Backups\immich\immich_arch_20240309_163040.rar" D:\usr\data\immich-app\
gzip-bin\gzip.exe -d < D:\usr\data\immich-app\Backups\immich\immich-dbbackup\immich-database.sql.gz | docker exec -i immich_postgres psql -U postgres -d immich

:: starting
docker compose up -d
