
require 'spec_helper'

# explicitely enable both syntaxes to avoid deprecation warnung
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe 'keepalived::lvs::real_server::misc_check', :type => 'define' do
  let(:title) { 'test' }
  let(:facts) { debian_facts }
  let(:pre_condition) { '$concat_basedir = "/tmp"' }

  context 'with bare minimum: real_server, misc_path' do
    let(:params) {
      {
        :virtual_server => 'virt1',
        :real_server => 'real1',
        :misc_path => '/bin/true'
      }
    }

    it {
      should contain_concat__fragment('keepalived.conf_lvs_real_server_misc_check_test').with( {
        'content' => <<-CONTENT.gsub(/ {10}/, '  ')
            MISC_CHECK {
              misc_path "/bin/true"
            }
        CONTENT
      })
    }
  end

end
