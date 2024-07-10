FROM centos:7

# Set up users and passwords
RUN useradd SriPrabandhaVydya && \
    echo "1234" | passwd SriPrabandhaVydya --stdin

# Update and install MySQL
RUN yum update -y && \
    yum install -y mysql

# Clean up YUM caches to reduce image size
RUN yum clean all

# Optionally, if you want to copy files or set up configurations, you can add them here:
# COPY ./path/to/your/application /app
# EXPOSE 3306 (MySQL port, if necessary)

# Command to run MySQL service or any other application
# CMD ["mysqld"] (Example MySQL command, adjust as needed)
