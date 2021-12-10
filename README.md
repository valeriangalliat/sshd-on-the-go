# `sshd` on the go

> Portable userland SSH server configuration. 🧳

Inspired by [this blog post](https://www.codejam.info/2021/11/standalone-userland-ssh-server.html).

## Usage

```sh
git clone https://github.com/valeriangalliat/sshd-on-the-go.git
cd sshd-on-the-go
make setup
# Add your public key to the `authorized_keys` file
make start
# Profit 🎉
```

Typical output of `make start`:

```
Listening on 192.168.0.42:2222

    Example: ssh -p 2222 you@192.168.0.42

/usr/sbin/sshd -f sshd_config -D
```
