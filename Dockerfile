FROM centos:7

# Set DNS servers
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf && \
    echo "nameserver 8.8.4.4" >> /etc/resolv.conf

# Install necessary packages and MySQL
RUN yum clean all && \
    yum makecache && \
    yum -y update && \
    yum -y install mysql
