FROM centos:7

# Copy a custom resolv.conf file into the container
COPY resolv.conf /etc/resolv.conf

# Install necessary packages including MySQL
RUN yum clean all && \
    yum makecache && \
    yum -y update && \
    yum -y install mysql

# Cleanup temporary files (if needed)
# RUN rm -f /etc/resolv.conf

# Define entry point or CMD if needed
# ENTRYPOINT ["entrypoint.sh"]

# Example CMD to run something on container startup
CMD ["echo", "Hello World!"]
