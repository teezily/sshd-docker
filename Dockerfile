FROM debian:jessie
MAINTAINER Teezily <dev@teezily.com>

ENV SSH_USER ssh_user
ENV SSH_PASS ssh_password

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd \
    && sed -i 's/^#PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ADD run /app/run

EXPOSE 22

CMD ["/app/run"]
