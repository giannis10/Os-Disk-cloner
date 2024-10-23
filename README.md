# Os-Disk-cloner
This sh program clone disk Os to other disk BackUp Os

# Use this Sh file:
First check to if to rsync with: rsync --version  if this comand rsync --version   not found rsync   install it with   sudo apt install rsync

Create script: nano clone_disk.sh

Make the Script Executable: chmod +x clone_disk.sh

Mount the Target Disk: sudo mount /dev/sdX1 /mnt/backup

Run Script: sudo ./clone_disk.sh /mnt/backup

Checking the Results: cat BackUp.log

Disks finder: lsblk

Running a Pension Check:

Customize Disks: Depending on your setup, you may need to change the disks in the definition (SOURCE_DISK and TARGET_DISK).
Data: The process will erase all data on the target disk.

Attention:bash -n clone_disk.sh
