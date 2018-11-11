#!/bin/bash
echo '----------'
echo '----- Preparing to install Hadoop on a Single Node: Part 2-----'
echo '----- Amazon Web Services EC2 ------'
echo '----- Ubuntu Server 16.04 LTS (HVM), SSD Volume Type -----'
echo '----------'

cd $HADOOP_INSTALL/etc/hadoop

# Set $JAVAHOME
sed -i 's%${JAVA_HOME}%/usr/lib/jvm/java-8-openjdk-amd64/%' hadoop-env.sh
# Configure core-site.xml
sed -i 's%<configuration>%<configuration>\n\t<property>\n\t\t<name>fs.defaultFS</name>\n\t\t<value>hdfs://localhost/</value>\n\t</property>%' core-site.xml
# Configure hdfs-site.xml
sed -i 's%<configuration>%<configuration>\n\t<property>\n\t\t<name>dfs.replication</name>\n\t\t<value>1</value>\n\t</property>%' hdfs-site.xml
# Create mapred-site.xml from template mapred-site.xml.template
cp mapred-site.xml.template mapred-site.xml
# Configure mapred-site.xml
sed -i 's%<configuration>%<configuration>\n\t<property>\n\t\t<name>mapreduce.framework.name</name>\n\t\t<value>local</value>\n\t</property>%' mapred-site.xml
# Configure yarn-site.xml
sed -i 's%<configuration>%<configuration>\n\t<property>\n\t\t<name>yarn.nodemanager.aux-services</name>\n\t\t<value>mapreduce_shuffle</value>\n\t</property>\n\t\t<name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>\n\t\t<value>org.apache.hadoop.mapred.ShuffleHandler</value>\n\t</property>%' yarn-site.xml

echo '----------'
echo '----- Logout and log back in to apply changes -----'
echo '----------'
