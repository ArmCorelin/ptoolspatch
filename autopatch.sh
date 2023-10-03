#!/usr/bin/bash
# Kernel 6.5 Patch script for Parallels Tools
# There is NO WARRANTY for this software. Please use at your own risk! 
# Copyright (c)2023 Armlin
# This script is free software. if you modify and/or redistribute,
# Please inform to: armcore128@gmail.com

#Preparation
if tar xzf kmods/prl_mod.tar.gz -C kmods ; then
    echo "extracted the driver tar ball." ; echo""
else
    echo "Failed to extract the driver tar ball."
    echo "Please execute in the Parallels Tools source directory"
    exit 1
fi 

#Filecheck
DestFiles=(\
       "kmods/prl_fs/SharedFolders/Guest/Linux/prl_fs/file.c" \
       "kmods/prl_tg/Toolgate/Guest/Linux/prl_tg/prltg_compat.h")

ckflag=0
for files in ${DestFiles[@]}; do
    echo "Checking $files..."
    if [ -f "$files" ]; then
	echo " > Found!"
    else
	echo " > Not found.."
	ckflag=1
    fi
done

if [ $ckflag = 1 ]; then
    echo "Some of the files are not found. aborting.."
    exit 1
else
    echo "All files are found. continue installation..."
fi

echo
read -p "Press enter key to continue"

#PT Version check
PTver="19.0.0.54570"
if grep $PTver version; then
    echo "PTversion OK"
else
    read -p 'Parallels Tools Version is not correct. Force patching? [Y to force]' ans
    if [ "$ans" = "Y" ] || [ "$ans" = "y" ]; then
	echo "OK, will continue.."; echo ""
    else
	echo "Aborted."
	exit 1
    fi   
fi

#Patch
if patch -Np1 < ptools_kernel6.5.patch ; then
    echo "Patched successfully"
else
    echo "Failed to patch. Possiblly the had already patched."
#    exit 1
fi

#zip up
ZipFiles=(\
       "dkms.conf" \
       "Makefile.kmods" \
       "prl_eth" \
       "prl_fs" \
       "prl_fs_freeze" \
       "prl_notifier" \
       "prl_tg" \
       "prl_vid")

mv kmods/prl_mod.tar.gz kmods/prl_mod.tar.gz.orig

if tar czf kmods/prl_mod.tar.gz -C kmods ${ZipFiles[*]} --remove-files ; then
    echo
    echo "Complete! Plese do \"sudo ./install\" Now!"
    exit 0
else
    echo "Zip-up failed...Aborting."
    exit 1
fi
