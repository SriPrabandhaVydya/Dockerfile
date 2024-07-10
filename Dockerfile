FROM centos:7

# Add user
RUN for user in SriPrabandhaVydya; do \
    useradd $user; \
    echo "1234" | passwd $user --stdin; \
done

# Use an available mirror and update and install MySQL
RUN yum clean all && \
    yum makecache && \
    yum -y update && \
    yum -y install mysql
