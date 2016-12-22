# sshd-docker

An image based on Debian Jessie which runs an openssh server.

## Usage

```sh
$ docker run -p 11022:22 -e SSH_USER=my_user -e SSH_PASS=my_pass teezily/sshd
```
