require 'spec_helper_acceptance'

context "Apply puppet master profiles/roles" do
  
  describe '::profiles::puppet::hiera' do

    it 'should apply the hiera config' do
      expect(shell('puppet apply --environment=master --environmentpath=/etc/puppet/environments -e "include ::profiles::puppet::hiera"').exit_code).to be_zero
    end
  
    it 'should apply the hiera config ONLY ONCE' do
      expect(shell('puppet apply --environment=master --environmentpath=/etc/puppet/environments -e "include ::profiles::puppet::hiera"').exit_code).to be_zero
    end

  end

  describe '::roles::puppet::master' do

    it 'should apply puppet master role' do
      expect(shell('puppet apply --environment=master --environmetpath=/etc/puppet/environments -e "include ::riles::puppet::master"')).to be_zero
    end

    it 'should apply puppet master role ONLY ONCE' do
      expect(shell('puppet apply --environment=master --environmetpath=/etc/puppet/environments -e "include ::riles::puppet::master"')).to be_zero
    end
  end

end

context "Check installed packages" do

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

context "Check running services" do

   describe process('puppet') do
     it { should be_running }
   end  

   describe process('puppetmaster') do
     it { should be_running }
   end
end
