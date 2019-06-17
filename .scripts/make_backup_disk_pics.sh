
#!/usr/bin/env bash
source ~/.config/scripts/external_disk.conf
sudo cp -avr ~/Obrazy/photos/* /media/$(whoami)/$DISK_NAME/photos/
date >> ~/Dokumenty/logs/disk_backup_pics.log
