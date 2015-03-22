require 'spec_helper'

describe 'profiles::puppet::master' do

 context 'Redhat/centos based system' do
    let :facts do
    {
      :osfamily => 'RedHat'
    }
    end
    
    context 'check the class inclusion' do
      it { should contain_class('profiles::puppet::master') }
      it { should contain_class('custom::puppet::install')  }
      it { should contain_class('custom::puppet::config')   }
      it { should contain_class('custom::puppet::service')  }
    end

    context 'check the hiera data' do
   
    end

  end

end
