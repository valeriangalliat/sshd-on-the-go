setup-with-key: TEMPLATE = sshd_config.key.template
setup-with-key: ssh_host_rsa_key sshd_config authorized_keys

setup-with-password: TEMPLATE = sshd_config.password.template
setup-with-password: ssh_host_rsa_key sshd_config authorized_keys

ssh_host_rsa_key:
	ssh-keygen -f $@ -N ''

sshd_config:
	sed 's,$$PWD,$(PWD),;s,$$USER,$(USER),' $(TEMPLATE) > $@

authorized_keys:
	touch $@

start:
	@ip=$$(ifconfig | grep 'inet ' | grep -v '127\.0\.0\.1' | head -1 | awk '{print $$2}'); \
		port=$$(grep '^Port' sshd_config | awk '{print $$2}'); \
		echo "Listening on $$ip:$$port"; \
		echo; \
		echo "    Example: ssh -p $$port $$USER@$$ip"; \
		echo
	/usr/sbin/sshd -f sshd_config -D
