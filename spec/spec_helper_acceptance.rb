require 'beaker-rspec'
require 'pry'
 
hosts.each do |host|
  #Install puppet
  on host, install_puppet
end

RSpec.configure do | config |
  module_path = File.expand_path(File.join(File.dirname(__FILE__),'../..'))
  module_root = File.expand_path(File.join(File.dirname(__FILE__),'..'))
  module_name = module_root.split('/').last

  config.formatter = :documentation

  config.before :suite do
    #Install moudles
    puppet_module_install(:source => "#{module_path}/#{module_name}", :module_name => module_name)
    puppet_module_install(:source => "#{module_path}/custom", :module_name => 'custom')
  end

end
