source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "~> #{ENV['PUPPET_VERSION']}" : ['>= 3.2.1']
gem 'puppet', puppetversion

# Support ruby < 2.0.0
# https://github.com/rspec/rspec-core/issues/1864
gem 'rspec',     '~> 2.0'   if RUBY_VERSION >= '1.8.7' && RUBY_VERSION < '1.9'
gem 'rake',      '~> 10.0'  if RUBY_VERSION >= '1.8.7' && RUBY_VERSION < '1.9'
gem 'json',      '<= 1.8'   if RUBY_VERSION < '2.0.0'
gem 'json_pure', '<= 2.0.1' if RUBY_VERSION < '2.0.0'

if puppetversion =~ /^3/
  ## rspec-hiera-puppet is puppet 3 only
  gem 'rspec-hiera-puppet', '>=1.0.0'
end

facterversion = ENV.key?('FACTER_VERSION') ? "~> #{ENV['FACTER_VERSION']}" : ['>= 1.7.1']

gem 'facter', facterversion

gem 'puppet-lint', '>=0.3.2'
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
