FROM centos:7

# Set DNS servers temporarily for yum
RUN echo "nameserver 8.8.8.8" > /tmp/resolv.conf && \
    echo "nameserver 8.8.4.4" >> /tmp/resolv.conf && \
    cp /tmp/resolv.conf /etc/resolv.conf

# Install necessary packages including MySQL
RUN yum clean all && \
    yum makecache && \
    yum -y update && \
    yum -y install mysql && \
    yum clean all

# Remove temporary resolv.conf
RUN rm -f /etc/resolv.conf

# Copy your application files and configurations
# COPY ./path/to/your/application /app

# Define the port your application will run on
# EXPOSE 8080

# Command to run your application
# CMD ["command", "to", "run", "your", "application"]
