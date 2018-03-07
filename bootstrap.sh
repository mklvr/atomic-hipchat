#!/bin/bash
set -x
set -e

apt update; apt install -y apt-utils; apt install -y ansible
ansible-playbook -i "localhost," -c local /build.yml
apt-get purge -y ansible; apt autoremove -y
