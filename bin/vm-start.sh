#!/bin/sh
# This script will later be aliased to "vm" in my .bashrc
VMS_DIR=$HOME/vms

if [[ -d $VMS_DIR/$1 ]]; then
	$VMS_DIR/$1/start.sh # entry point script for starting any of my vms
else
	echo -e "Error $VMS_DIR/$1 does not exsist!\n"
fi

