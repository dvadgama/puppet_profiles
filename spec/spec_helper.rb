require 'puppetlabs_spec_helper/module_spec_helper'
require 'hiera-puppet-helper'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

shared_context "hieradata" do
  let(:hiera_config) do 
    { :backends => ['yaml'],
      :hierarchy => [ "nodes/%{clientcert}",
                      "osfamily/%{osfamily}",
                      "osfamily/%{osfamily}/defaults",
                      "osfamily/%{osfamily}/global",
                      "virtual/%{virtual}",
                      "system/users",
                      "defaults",
                      "global"],

       :yaml => { :datadir => File.join(fixture_path,'modules/data') }
     }
  end
end

at_exit { RSpec::Puppet::Coverage.report! }
