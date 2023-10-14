20231003
!!There is no warranty for this patch.
!!Please use it at your own risk

tested environment: 

- Fedora38
kernel 6.5.5-200.fc38.aarch64 (64-bit)
Parallels tools 19.0.0.54570

- Ubuntu 23.10(kubuntu)
kernel 6.5.0-9-generic (64-bit)

---------
Howto use

1.From Parallels menu, select install Parallels Tools.
 A: If Installer was automatically invoked, 
  1. don't close the window
  2. select CD-ROM menu from Parallels Tool bar 
  2. select "prl-tools-lin-arm.iso" and mount it.
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
