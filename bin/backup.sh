#!/bin/sh
today=$(date +"%Y_%d_%b")
tar --exclude='/home/nova/.*' --exclude='/home/nova/zig' --exclude='/home/nova/git-repos'\
		--exclude='/home/nova/Downloads'  --exclude='/home/nova/Desktop' --exclude='/home/nova/vms'\
	--exclude='/home/nova/dist' -czvf nova_backup_"$today".tar.gz /home/nova



