require 'spec_helper'

describe 'profiles::puppet::master' do

  include_context "hieradata"
  
  shared_context "os_independed_class" do
    
    it { should contain_class('profiles::puppet::master') }

    
    it { should contain_class('custom::puppet::host').with_hostdata({ `hostname`.strip.downcase  => {"ip" => "10.10.10.10",
                                                                                                       "target" => "/etc/hosts",
                                                                                                       "host_aliases" => ["puppet","puppetmaster",`hostname`.strip.downcase], 
                                                                                                      } 
                                                                       }) 
         }
    
      it { should contain_class('custom::puppet::config').with_files(
                                                {"/etc/puppet/puppet.conf" => {"template"=>"profiles/puppet_master.erb"},                   
                                                "/etc/puppet/environments/test/environment.conf"=> {"template"=>"profiles/puppet_environment.erb" } } )   
         }
      
      it { should contain_class('custom::puppet::config').with_file_defaults({"ensure" => "file"}) }
      
      it { should contain_class('custom::puppet::service').with_services("puppetmaster"=>{"name"=>"puppetmaster"})  }
      
      it { should contain_class('custom::puppet::service').with_service_defaults({"hasstatus"=>true, "hasrestart"=>true, "enable"=>true, "ensure"=>"running"})  }
    
      it { should contain_custom__puppet__template('/etc/puppet/environments/test/environment.conf') }

      it { should contain_custom__puppet__template('/etc/puppet/puppet.conf') }

      it { should contain_host(`hostname`.strip.downcase) }
      
      it { should contain_file('/etc/puppet/puppet.conf') }
    
      it { should contain_file('/etc/puppet/environments/test/environment.conf') }
      
      it { should contain_service('puppetmaster') }

  end
  
  context 'Redhat/centos based system' do
    
    let :facts do
    {
      :osfamily       => 'RedHat',
      :environment    => 'test',
      :ipaddress_eth0 => '10.10.10.10',
    }
    end
    
    include_context "os_independed_class" 
    
    it { should contain_class('custom::puppet::install').with_packages("puppet-server"=>{"ensure"=>"installed"}) }

    it { should contain_package('puppet-server') }
    

  end

  context 'Ubuntu/Debian based system' do
    
    let :facts do
    {
      :osfamily       => 'Debian',
      :environment    => 'test',
      :ipaddress_eth0 => '10.10.10.10',
    }
    end

    include_context "os_independed_class"
    
    it { should contain_class('custom::puppet::install').with_packages("puppetmaster"=>{"ensure"=>"installed"}) }

    it { should contain_package('puppetmaster') }
 

  end

end
