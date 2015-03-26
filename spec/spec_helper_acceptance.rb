require 'beaker-rspec'
require 'beaker-rspec/helpers/serverspec'
require 'pry'
 
hosts.each do |host|
  #Install puppet
  on host, install_puppet
end

RSpec.configure do | config |
  module_path = File.expand_path(File.join(File.dirname(__FILE__),'..'))

  config.formatter = :documentation

  config.before :suite do
    hosts.each do | host |
      if host['roles'].include?('foss_master_from_scretch')
        scp_to host, "#{module_path}/spec/puppetmaster.sh",'/tmp/'
        on host,"/tmp/puppetmaster.sh"
      end #if
    end #host.ech
  end #config.before

end # rspec.configure
