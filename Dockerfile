FROM centos:7

# Set DNS servers using RUN command
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf && \
    echo "nameserver 8.8.4.4" >> /etc/resolv.conf

# Install necessary packages including MySQL
RUN yum clean all && \
    yum makecache && \
    yum -y update && \
    yum -y install mysql

# Cleanup temporary files
RUN rm -f /etc/resolv.conf

# Define entry point or CMD if needed
# ENTRYPOINT ["entrypoint.sh"]
