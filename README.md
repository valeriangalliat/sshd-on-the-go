# `sshd` on the go

> Portable userland SSH server configuration. 🧳

Inspired by [this blog post](https://www.codejam.info/2021/11/standalone-userland-ssh-server.html).

## Overview

Sometimes you want to access a host via SSH but there's no SSH server
configured on the system. And maybe we don't have `root` access (or
don't want to setup a "proper" SSH server as `root`).

This simple configuration allows to run a SSH server on an unprivileged
port, that allows login with a single user (the one running the server),
either via SSH keys or password.

## Usage

```sh
git clone https://github.com/valeriangalliat/sshd-on-the-go.git
cd sshd-on-the-go

# Setup with SSH key
make setup-with-key
# Then, add your public key to the `authorized_keys` file

# Alternatively, setup with password
make setup-with-password

make start
# Profit 🎉
```

Typical output of `make start`:

```
Listening on 192.168.0.42:2222

    Example: ssh -p 2222 you@192.168.0.42

/usr/sbin/sshd -f sshd_config -D
```
