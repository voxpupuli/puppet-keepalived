source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "~> #{ENV['PUPPET_VERSION']}" : ['>= 3.2.1']
gem 'puppet', puppetversion

if puppetversion =~ /^3/
  ## rspec-hiera-puppet is puppet 3 only
  gem 'rspec-hiera-puppet', '>=1.0.0'
end

facterversion = ENV.key?('FACTER_VERSION') ? "~> #{ENV['FACTER_VERSION']}" : ['>= 1.7.1']

gem 'facter', facterversion

gem 'rake'
gem 'rspec', '< 3.0.0'
gem 'puppet-lint', '>=0.3.2'
gem 'rspec-puppet', :git => 'https://github.com/rodjek/rspec-puppet.git'
gem 'puppetlabs_spec_helper', '>=0.8.0'
gem 'puppet-syntax'

group :development do
  gem 'guard'
  gem 'guard-rake'
end

group :system_tests do
  gem 'beaker-rspec',  :require => false
  gem 'serverspec',    :require => false
  gem 'vagrant-wrapper', :require => false
end