require 'spec_helper'

describe 'profiles::puppet::master' do

  include_context "hieradata"

  context 'Redhat/centos based system' do
    let :facts do
    {
      :osfamily       => 'RedHat',
      :environment    => 'test',
      :ipaddress_eth0 => '10.10.10.10',
    }
    end
    
    context 'check the class inclusion' do
      it { should contain_class('custom::puppet::host').with_hostdata({ `hostname`.strip.downcase  => {"ip" => "10.10.10.10",
                                                                                                       "target" => "/etc/hosts",
                                                                                                       "host_aliases" => ["puppet","puppetmaster",`hostname`.strip.downcase], 
                                                                                                      } 
                                                                       }) 
         }

      it { should contain_class('custom::puppet::install').with_packages("puppet-server"=>{"ensure"=>"installed"}) }

      it { should contain_class('custom::puppet::config')   }

      it { should contain_class('custom::puppet::service')  }

      it { should contain_class('profiles::puppet::master') }

      it { should contain_file('/etc/puppet/puppet.conf') }
    
      it { should contain_file('/etc/puppet/environments/test/environment.conf') }

      it { should contain_host(`hostname`.strip.downcase) }

      it { should contain_package('puppet-server') }
 
      it { should contain_service('puppetmaster') }

      it { should contain_custom__puppet__template('/etc/puppet/environments/test/environment.conf') }

      it { should contain_custom__puppet__template('/etc/puppet/puppet.conf') }
    end
  end

  context 'Ubuntu/Debian based system' do
    let :facts do
    {
      :osfamily       => 'Debian',
      :environment    => 'test',
      :ipaddress_eth0 => '10.10.10.10',
    }
    end
    
    context 'check the class inclusion' do
      it { should contain_class('custom::puppet::host').with_hostdata({ `hostname`.strip.downcase  => {"ip" => "10.10.10.10",
                                                                                                       "target" => "/etc/hosts",
                                                                                                       "host_aliases" => ["puppet","puppetmaster",`hostname`.strip.downcase], 
                                                                                                      } 
                                                                       }) 
         }

      it { should contain_class('custom::puppet::install').with_packages("puppetmaster"=>{"ensure"=>"installed"}) }

      it { should contain_class('custom::puppet::config')   }

      it { should contain_class('custom::puppet::service')  }

      it { should contain_class('profiles::puppet::master') }

      it { should contain_file('/etc/puppet/puppet.conf') }
    
      it { should contain_file('/etc/puppet/environments/test/environment.conf') }

      it { should contain_host(`hostname`.strip.downcase) }

      it { should contain_package('puppetmaster') }
 
      it { should contain_service('puppetmaster') }

      it { should contain_custom__puppet__template('/etc/puppet/environments/test/environment.conf') }

      it { should contain_custom__puppet__template('/etc/puppet/puppet.conf') }
    end
  end

end
