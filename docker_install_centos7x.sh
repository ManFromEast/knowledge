#!/bin/bash
# Author : ChengFuyi
echo "install docker community edition in centos 7.x"
# Uninstall old versions
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

# SET UP THE REPOSITORY
# Install required packages. yum-utils provides the yum-config-manager utility, and device-mapper-persistent-data and lvm2 are required by the devicemapper storage driver.
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# Use the following command to set up the stable repository.
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# INSTALL DOCKER CE
sudo yum install -y docker-ce-18.06.0.ce-3.el7

# Start docker 
sudo systemctl start docker

# Verify the docker status
sudo systemctl status docker

# Enable docker it starts every server reboot
sudo systemctl enable docker
