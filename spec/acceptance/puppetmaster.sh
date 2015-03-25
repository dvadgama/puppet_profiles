#!/usr/bin/env bash

if [ "$EUID" -ne "0" ] 
then
  echo "This script must be run as root"
  exit 1
fi

case $1 in 

"Redhat") echo "installing puppet3.x repo"
            rpm -ivh http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-5.noarch.rpm
          echo "running update"
             yum check-update
          echo "Installing Puppet Clinet"
            yum install -y puppet 
          echo "Installing gem"
            yum install -y rubygems
          echo "Installing hiera"
            yum install -y hiera
            gem install deep_merge
          echo "Installing git"
            yum install -y git
          ;;
"Debian") echo "Installing Puppet Clinet"
            apt-get install -y puppet 
          echo "Installing git"
            apt-get install -y git
          ;;
*) echo "please specify which OSfamily you wish to deploy"
  ;;
esac

echo "Installing r10k"
 gem install r10k

echo "configuring r10k"

cat >> /etc/puppet/r10k.yaml << EOF
sources:
  Puppetfile:
    basedir: /etc/puppet/environments/
    remote: "https://github.com/dvadgama/puppetfile.git"
     
  hiera_data:
    basedir: /etc/puppet/data/
    remote: "https://github.com/dvadgama/puppet_data.git"

purgedirs:
  - /etc/puppet/environments

cachedir: /var/cache/r10k
EOF

if [ -f  /etc/r10k.yaml ]
then
  rm -f /etc/r10k.yaml
fi

ln -s /etc/puppet/r10k.yaml /etc/r10k.yaml

echo "deploying puppet modules in default master environment"
 r10k deploy environment -p


#puppet apply --environment=master --modulepath="/etc/puppet/environments/master/modules/" -e "include ::profiles::puppet::hiera"
#puppet apply --environment=master --modulepath="/etc/puppet/environments/master/modules/" -e "include ::roles::puppet::master"
