setup: ssh_host_rsa_key sshd_config authorized_keys

ssh_host_rsa_key:
	ssh-keygen -f $@ -N ''

sshd_config: sshd_config.template
	sed 's,/path/to/sshd-on-the-go,$(PWD),' $< > $@

authorized_keys:
	touch $@

start:
	@ip=$$(ifconfig | grep 'inet ' | grep -v '127\.0\.0\.1' | head -1 | awk '{print $$2}'); \
		port=$$(grep '^Port' sshd_config | awk '{print $$2}'); \
		echo "Listening on $$ip:$$port"; \
		echo; \
		echo "    Example: ssh -p $$port you@$$ip"; \
		echo
	/usr/sbin/sshd -f sshd_config -D
