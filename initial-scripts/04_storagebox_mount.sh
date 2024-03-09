echo -e "username=SB_USERNAME\npassword=SB_PASSWORD" | sudo tee /etc/cifs-media-credentials.txt

sudo mkdir /mnt/sb

sudo apt install cifs-utils

# add to /etc/fstab
# //SB_USERNAME.your-storagebox.de/backup /mnt/sb cifs seal,vers=3,iocharset=utf8,rw,credentials=/etc/cifs-media-credentials.txt,uid=999,gid=998,file_mode=0664,dir_mode=0775 0 0


