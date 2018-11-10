# HadoopSingleNodeQuickInstall
Unix files for installing Hadoop on a Single Node on Ubuntu 18.04 LTS

Commands to be run before executing scripts (I'm hoping to convert these and reupload them at some point to save a few steps)
sudo apt-get update
sudo apt-get install dos2unix
dos2unix HSNI_1.sh
dos2unix HSNI_2.sh
chmod 755 HSNI_1.sh
chmod 755 HSNI_2.sh

HSNI_1 (Hadoop Single Node Install) is to be run first.
The user must run the command 'source ~/.bashrc' in the parent shell for changes to take effect

Then run HSNI_2 to configure hadoop files for running on a single instance.
Logout and restart shell for changes to take effect.

The method used for setting up Hadoop in this fashion can be found in Appendix A of Tom White's Hadoop The Definitive Guide
