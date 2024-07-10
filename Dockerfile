FROM centos:7

# Install necessary packages including MySQL
RUN yum clean all && \
    yum makecache && \
    yum -y update && \
    yum -y install mysql

# Create a temporary resolv.conf file and set DNS servers
RUN echo "nameserver 8.8.8.8" > /tmp/resolv.conf && \
    echo "nameserver 8.8.4.4" >> /tmp/resolv.conf

# Install wget to download the resolv.conf file
RUN yum -y install wget

# Download the EPEL repository
RUN wget -O /tmp/epel-release-latest-7.noarch.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Configure the EPEL repository
RUN rpm -Uvh /tmp/epel-release-latest-7.noarch.rpm

# Install the EPEL repository
RUN yum -y install epel-release

# Define the port for the port
