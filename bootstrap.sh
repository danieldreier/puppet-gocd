#!/bin/bash
curl getpuppet.whilefork.com | sudo bash
curl https://www.getchef.com/chef/install.sh | sudo bash
#echo "pwd: $PWD"
#env
sudo puppet module install /tmp/kitchen/data/danieldreier-gocd-*.tar.gz
sudo puppet apply -e 'include gocd::server'
sudo puppet apply -e 'include gocd::agent'
