require 'spec_helper'

describe 'profiles::puppet::master' do

 let :facts do
  {
    :osfamily => 'RedHat'
  }
 end

 it { should contain_class('profiles::puppet::master') }
 it { should contain_class('custom::puppet::install')  }
 it { should contain_class('custom::puppet::config')   }
 it { should contain_class('custom::puppet::service')  }
end
