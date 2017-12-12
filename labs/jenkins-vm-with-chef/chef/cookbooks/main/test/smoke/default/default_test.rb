require 'chefspec'

describe 'package::install' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'installs a package nmap' do
    expect(chef_run).to install_package('nmap')
  end

  it 'installs a package default-jdk' do
    expect(chef_run).to install_package('default-jdk')
  end

end
