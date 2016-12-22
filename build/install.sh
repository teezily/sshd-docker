#! /bin/bash
set -e

apt-get install -y --no-install-recommends openssh-server

mkdir -p /var/run/sshd \
    && sed -i 's/^#PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
