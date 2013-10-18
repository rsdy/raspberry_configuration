#!/bin/sh -x

sudo mount -t tmpfs none /tmp

dir=$(mktemp -d)
hosts=/tmp/ansible-hosts
echo "[pies]\n$(uname -n)" > ${hosts}

apt-get install -y python-pip python-yaml python-paramiko python-jinja2 git-core
pip install ansible

ansible-pull -U https://github.com/KitchenSync/raspberry_configuration.git -i ${hosts} -d ${dir} main.yml

echo "Check the passwords under ${dir}/credentials/ and change them. They'll be gone after the next reboot."
