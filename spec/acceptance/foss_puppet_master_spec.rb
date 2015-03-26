require 'spec_helper_acceptance'

describe '::profiles::puppet::hiera' do

  it 'should apply the hiera config' do
    expect(shell('puppet apply --environment=master -e "include ::profiles::puppet::hiera').exit_code).to be_zero
    
    #pp = <<-EOS 
    #       include ::profiles::puppet::hiera
    #     EOS

    #apply_manifest(pp,:catch_failures => true)
    #expect(apply_manifest(pp,:catch_failures => true).exit_code).to be_zero
  end

end
