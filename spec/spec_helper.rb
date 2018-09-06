require 'rubygems'
require 'rspec-puppet'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

RSpec.configure do |c|
  c.module_path = File.join(fixture_path, 'modules')
  c.manifest_dir = File.join(fixture_path, 'manifests')
  c.environmentpath = File.join(fixture_path,'..')
  # explicitely enable both syntaxes to avoid deprecation warning
  c.expect_with :rspec do |ce|
    ce.syntax = [:should, :expect]
  end
end

def centos_facts
  {
    :operatingsystem => 'CentOS',
    :osfamily        => 'RedHat',
    :puppetversion   => ENV['PUPPET_VERSION'] || '3.7.5',
  }
end

def debian_facts
  {
    :operatingsystem => 'Debian',
    :osfamily        => 'Debian',
    :puppetversion   => ENV['PUPPET_VERSION'] || '3.7.5',
  }
end
