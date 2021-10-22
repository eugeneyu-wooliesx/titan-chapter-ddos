FROM centos:centos7

RUN yum update -y
RUN yum install -y epel-release
RUN yum install -y wget iftop htop iptables net-tools

# WORKDIR /opt
# RUN wget https://install.fastnetmon.com/installer -Oinstaller
# RUN chmod +x installer
# RUN ./installer -install_community_edition -do_not_check_license
