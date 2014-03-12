
require 'spec_helper'

describe 'keepalived::lvs::real_server', :type => 'define' do
  let(:title) { 'test' }
  let(:facts) { debian_facts }
  let(:pre_condition) { '$concat_basedir = "/tmp"' }

  context 'with bare minimum: virtual_server, ip_address, and port' do
    let(:params) {
      {
        :virtual_server => 'virtual_server',
        :ip_address     => '127.3.4.5',
        :port           => '8080'
      }
    }

    it {
      should contain_concat__fragment('keepalived.conf_lvs_real_server_test').with( {
        'content' => <<-CONTENT.gsub(/ {10}/, '  ')
          real_server 127.3.4.5 8080 {
          }
        CONTENT
      })
    }
  end

  context 'with an invalid IP address' do
    let(:title) { 'test' }
    let(:params) {
      {
        :virtual_server => 'virtual_server',
        :ip_address     => 'rubbish',
        :port           => '8080',
      }
    }

    it do
      expect { should contain_concat__fragment() }.to raise_error(Puppet::Error, /Invalid IP/)
    end
  end

  context 'with an invalid port' do
    let(:title) { 'test' }
    let(:params) {
      {
        :virtual_server => 'virtual_server',
        :ip_address     => '10.1.1.1',
        :port           => 'something',
      }
    }

    it do
      expect {
        should contain_concat__fragment('keepalived.conf_lvs_real_server_test') 
      }.to raise_error(Puppet::Error, /Invalid port/) 
    end
  end

  context 'with single-line and block options' do
    let(:params) {{
      :virtual_server => 'virtual_server',
      :ip_address     => '127.3.4.5',
      :port           => '789',
      :options        => {
        'weight' => 1,
        'notify_up' => "'notify-send \"good to go!\"'",
        'inhibit_on_failure' => true,
        'SMTP_CHECK' => {
          'connect_timeout' => 10,
          'host' => {
            'connect_ip' => '127.0.0.1'
          }
        }
      }
    }}

    it {
      should contain_concat__fragment('keepalived.conf_lvs_real_server_test').with({
        'content' => <<-CONTENT.gsub(/ {10}/, '  ')
          real_server 127.3.4.5 789 {
            inhibit_on_failure
            notify_up 'notify-send "good to go!"'
            weight 1

            SMTP_CHECK {
              connect_timeout 10

              host {
                connect_ip 127.0.0.1
              }
            }
          }
        CONTENT
      })
    }
  end

  context 'with only block options' do
    let(:params) {{
      :virtual_server => 'virtual_server',
      :ip_address     => '127.3.4.5',
      :port           => '789',
      :options        => {
        'SMTP_CHECK' => {
          'host' => {
            'connect_ip' => '127.0.0.1'
          }
        }
      }
    }}

    it {
      should contain_concat__fragment('keepalived.conf_lvs_real_server_test').with({
        'content' => <<-CONTENT.gsub(/ {10}/, '  ')
          real_server 127.3.4.5 789 {
            SMTP_CHECK {
              host {
                connect_ip 127.0.0.1
              }
            }
          }
        CONTENT
      })
    }
  end

  context 'with only single-line options' do
    let(:params) {{
      :virtual_server => 'virtual_server',
      :ip_address     => '127.3.4.5',
      :port           => '789',
      :options        => {
        'weight' => 1,
        'notify_up' => "'notify-send \"good to go!\"'",
        'inhibit_on_failure' => true,
      }
    }}

    it {
      should contain_concat__fragment('keepalived.conf_lvs_real_server_test').with({
        'content' => <<-CONTENT.gsub(/ {10}/, '  ')
          real_server 127.3.4.5 789 {
            inhibit_on_failure
            notify_up 'notify-send "good to go!"'
            weight 1
          }
        CONTENT
      })
    }
  end

end
