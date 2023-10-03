
!!There is no warranty for this patch.
!!Please use it at your own risk

tested environment: 
Fedora38
kernel 6.5.5-200.fc38.aarch64 (64-bit)
Parallels tools 19.0.0.54570

---------
Howto use

1.From Parallels menu, select install Parallels Tools.
 A: If Installer was automatically invoked,
  Select CD-ROM menu from Parallels Tool bar and select
  "prl-tools-lin-arm.iso" and mount it.
 B: If your desktop asked you mount or not, mount it.

2.After mounting it, copy all files to your own directory.
 ex. ~/ptools

3.copy 2 files to the directory
 autopatch.sh
 ptools_kernel6.5.patch

4.Run the script
 $ sh autopatch.sh

5.Install Parallels Tools
 $ sudo ./install


That's it! Enjoy!
