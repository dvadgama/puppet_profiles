require 'spec_helper_acceptance'

describe "Apply puppet master profiles/roles" do

  context '::profiles::puppet::hiera' do

    it 'should apply the hiera config' do
      expect(shell('puppet apply --environment=master --environmentpath=/etc/puppet/environments -e "include ::profiles::puppet::hiera"').exit_code).to be_zero
    end
  
    it 'should apply the hiera config ONLY ONCE' do
      expect(shell('puppet apply --environment=master --environmentpath=/etc/puppet/environments -e "include ::profiles::puppet::hiera"').exit_code).to be_zero
    end

  end

  context '::roles::puppet::master' do

    it 'should apply puppet master role' do
      expect(shell('puppet apply --environment=master --environmentpath=/etc/puppet/environments -e " include roles::puppet::master"').exit_code).to be_zero
    end

    it 'should apply puppet master role ONLY ONCE' do
      expect(shell('puppet apply --environment=master --environmentpath=/etc/puppet/environments -e " include roles::puppet::master"').exit_code).to be_zero
    end
  end

end

describe "Check installed packages" do

  case fact('osfamily')
    when /debian/i,/ubuntu/i

      describe package('puppetmaster') do
        it { should be_installed }
      end
     
      when /redhat/i,/centos/i
 
        describe package('puppet-server') do
          it { should be_installed }
        end
    end      
    
    describe package('puppet') do
      it { should be_installed }
    end

    describe package('hiera') do
        it { should be_installed }
    end

end

describe "Check running services" do

   describe process('puppet agent') do
     it { should be_running }
   end  

   describe process('puppet master') do
     it { should be_running }
   end
end
