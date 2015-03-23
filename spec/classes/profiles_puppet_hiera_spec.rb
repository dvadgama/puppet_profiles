require 'spec_helper'

describe 'profiles::puppet::hiera' do
  
  it { should contain_class('custom::hiera::config').with({ "config"   => "/etc/puppet/hiera.yaml",
                                                            "template" => "profiles/hiera.erb",
                                                            "symlink"  => "/etc/hiera.yaml" }) }
    
  it { should contain_class('profiles::puppet::hiera') }
  
  it { should contain_file('/etc/hiera.yaml') }
  
  it { should contain_file('/etc/puppet/hiera.yaml') }
       
  
end