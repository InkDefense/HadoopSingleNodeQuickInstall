#!/bin/bash
echo '----------'
echo '----- Preparing to install Hadoop on a Single Node: Part 1-----'
echo '----- Amazon Web Services EC2 ------'
echo '----- Ubuntu Server 16.04 LTS (HVM), SSD Volume Type -----'
echo '----------'

# Update instance and install openjdk-8-jdk
sudo apt-get update
sudo apt-get -y install openjdk-8-jdk
if [ $? -eq 0 ]; then
	echo 'openjdk-8-jdk installed successfully'
else
	echo 'openjdk-8-jdk FAILED to install'
fi

#Check java version
java -version

# Configure JAVA_HOME
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/' >> .bashrc

# Download Hadoop from Apache and unpack it
cd ~
wget http://apache.claz.org/hadoop/common/hadoop-2.8.4/hadoop-2.8.4.tar.gz
tar -xzf hadoop-2.8.4.tar.gz

# Install openssh-server and rsync incase ssh is not installed by default?
# I've never had this problem but I do it anyways
sudo apt-get -y install openssh-server
sudo apt-get install rsync

# Create keys
cd .ssh
ssh-keygen -f id_rsa -t rsa -N ''

cd ~

# Write to new authorized_keys file
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys

# Set path variables for simpler navigation
echo 'export HADOOP_PREFIX="/home/ubuntu/hadoop-2.8.4"' >> .bashrc
echo 'export HADOOP_HOME="/home/ubuntu/hadoop-2.8.4"' >> .bashrc
echo 'export HADOOP_INSTALL="/home/ubuntu/hadoop-2.8.4"' >> .bashrc
echo 'export PATH=$PATH:$HADOOP_INSTALL/bin:$HADOOP_INSTALL/sbin' >> .bashrc

# source command cannot be run from child shell to affect parent shell
# so this has to be done manually for the time being
# I'm looking for a way around it but the unix community disagrees
echo '---------'
echo '----- Run command: source ~/.bashrc -----'
echo '----- Followed by command: hadoop version -----'
echo '----- to enable changes made and ensure hadoop -----'
echo '----- installed successfully -----'
echo '----- Now, run HSNI_2.sh to finish installation -----'