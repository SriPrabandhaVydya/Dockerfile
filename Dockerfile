FROM centos:7

# Set DNS servers using RUN command
RUN echo "nameserver 8.8.8.8" > /tmp/resolv.conf && \
    echo "nameserver 8.8.4.4" >> /tmp/resolv.conf && \
    cat /tmp/resolv.conf > /etc/resolv.conf && \
    rm -f /tmp/resolv.conf

# Install necessary packages including MySQL
RUN yum clean all && \
    yum makecache && \
    yum -y update && \
    yum -y install mysql && \
    yum clean all

# Define entry point or CMD if needed
# ENTRYPOINT ["entrypoint.sh"]
