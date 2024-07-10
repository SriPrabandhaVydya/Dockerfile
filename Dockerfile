FROM centos:7

RUN for user in prabha; do useadd $user; echo "1234" | passwd $user --stdin; done
RUN you update && install mysql -y
