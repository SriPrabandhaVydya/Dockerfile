FROM centos:7

# Add user
RUN for user in SriPrabandhaVydya; do \
    useradd $user; \
    echo "1234" | passwd $user --stdin; \
done

# Set DNS and install MySQL
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf && \
    echo "nameserver 8.8.4.4" >> /etc/resolv.conf && \
    yum clean all && \
    yum makecache && \
    yum -y update && \
    yum -y install mysql
