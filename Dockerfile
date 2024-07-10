FROM centos:7

# Create a temporary resolv.conf file with desired nameservers
RUN echo "nameserver 8.8.8.8" > /tmp/resolv.conf && \
    echo "nameserver 8.8.4.4" >> /tmp/resolv.conf

# Copy the temporary resolv.conf to /etc/resolv.conf
RUN cp /tmp/resolv.conf /etc/resolv.conf

# Install necessary packages and MySQL
RUN yum clean all && \
    yum makecache && \
    yum -y update && \
    yum -y install mysql

# Cleanup temporary files
RUN rm /tmp/resolv.conf
