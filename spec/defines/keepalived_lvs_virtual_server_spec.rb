
require 'spec_helper'

describe 'keepalived::lvs::virtual_server', type: 'define' do
  let(:title) { '_TITLE_' }
  let(:pre_condition) do
    'include keepalived'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'without parameters' do
        let(:title) { '_TITLE_' }

        it do
          expect { is_expected.to create_class('keepalived') }.to raise_error(Puppet::Error)
        end
      end

      context 'with bare minimum: ip address, lb_algo and port' do
        let(:params) do
          {
            ip_address: '10.1.1.1',
            port: 8080,
            lb_algo: 'lc'
          }
        end

        it {
          is_expected.to contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with(
            'content' => %r{^virtual_server 10.1.1.1 8080 \{\s+lb_algo lc\s+lb_kind NAT\s+protocol TCP\s+}
          )
          is_expected.to contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_-footer').with(
            'content' => %r{^\}}
          )
        }
      end

      context 'with bare minimum alternative: fwmark and lb_algo' do
        let(:params) do
          {
            fwmark: 123,
            lb_algo: 'lc'
          }
        end

        it {
          is_expected.to contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with(
            'content' => %r{^virtual_server fwmark 123 \{\s+lb_algo lc\s+lb_kind NAT\s+protocol TCP\s+}
          )
          is_expected.to contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_-footer').with(
            'content' => %r{^\}}
          )
        }
      end

      context 'with optional parameters' do
        let(:params) do
          {
            ip_address: '10.1.1.1',
            port: 8080,
            lb_algo: 'lc',
            lb_kind: 'NAT',
            protocol: 'UDP',
            delay_loop: 60,
            persistence_timeout: 5,
            ha_suspend: true,
            virtualhost: 'example.com',
            alpha: true,
            omega: true,
            quorum: 5,
            quorum_up: '/bin/true',
            quorum_down: '/bin/true',
            hysteresis: 9,
            sorry_server: { 'ip_address' => '10.1.1.3',
                            'port' => 999 }
          }
        end

        it {
          is_expected.to contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with_content(
            %r{\s+delay_loop 60\s+lb_algo lc\s+lb_kind NAT\s+persistence_timeout 5\s+ha_suspend\s+virtualhost example.com}
          )
        }
        it {
          is_expected.to contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with_content(
            %r{\s+alpha\s+omega\s+quorum 5\s+quorum_up "\/bin\/true"\s+quorum_down "\/bin\/true"}
          )
        }
        it {
          is_expected.to contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with_content(
            %r{\s+hysteresis 9\s+protocol UDP\s+sorry_server 10.1.1.3 999\s+}
          )
        }
      end

      context 'with invalid IP address' do
        let(:title) { '_TITLE_' }
        let(:params) do
          {
            ip_address: 'rubbish',
            port: 8080,
            lb_algo: 'lc'
          }
        end

        it { is_expected.not_to compile }
      end

      context 'with invalid firewall mark' do
        let(:title) { '_TITLE_' }
        let(:params) do
          {
            fwmark: 'rubbish',
            lb_algo: 'lc'
          }
        end

        it { is_expected.not_to compile }
      end

      context 'with invalid port' do
        let(:title) { '_TITLE_' }
        let(:params) do
          {
            ip_address: '10.1.1.1',
            port: 'something',
            lb_algo: 'lc'
          }
        end

        it { is_expected.not_to compile }
      end

      context 'with invalid delay_loop' do
        let(:title) { '_TITLE_' }
        let(:params) do
          {
            ip_address: '10.1.1.1',
            port: 80,
            lb_algo: 'rr',
            delay_loop: 'NaN'
          }
        end

        it { is_expected.not_to compile }
      end

      context 'with invalid lb_algo' do
        let(:title) { '_TITLE_' }
        let(:params) do
          {
            ip_address: '10.1.1.1',
            port: 80,
            lb_algo: 'rubbish'
          }
        end

        it { is_expected.not_to compile }
      end

      context 'with invalid protocol' do
        let(:title) { '_TITLE_' }
        let(:params) do
          {
            ip_address: '10.1.1.1',
            port: 80,
            lb_algo: 'rr',
            protocol: 'ICMP'
          }
        end

        it { is_expected.not_to compile }
      end

      context 'with invalid lb_kind' do
        let(:title) { '_TITLE_' }
        let(:params) do
          {
            ip_address: '10.1.1.1',
            port: 80,
            lb_algo: 'rr',
            lb_kind: 'BAT'
          }
        end

        it { is_expected.not_to compile }
      end

      context 'with a single real_server' do
        let(:params) do
          {
            ip_address: '10.1.1.1',
            port: 8080,
            lb_algo: 'lc',
            real_servers: [{ 'ip_address' => '10.1.1.2',
                             'port'       => 8081 }]
          }
        end

        it {
          is_expected.to contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with(
            'content' => %r{real_server 10.1.1.2 8081 \{\s+\}}
          )
        }
      end

      context 'with a real_server with a TCP_CHECK' do
        let(:params) do
          {
            ip_address: '10.1.1.1',
            port: 8080,
            lb_algo: 'lc',
            tcp_check: { 'connect_timeout' => 5 },
            real_servers: [{ 'ip_address' => '10.1.1.2',
                             'port'       => 8081 }]
          }
        end

        it {
          is_expected.to contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with(
            'content' => %r{real_server 10.1.1.2 8081 \{\s+TCP_CHECK \{\s+connect_port 8081\s+connect_timeout 5\s+\}\s+\}}
          )
        }
      end

      context 'with a real_server with a TCP_CHECK and non-overwritting real_server_options' do
        let(:params) do
          {
            ip_address: '10.1.1.1',
            port: 8080,
            lb_algo: 'lc',
            tcp_check: { 'connect_timeout' => 5 },
            real_servers: [{ 'ip_address' => '10.1.1.2',
                             'port'       => 8081 }],
            real_server_options: {
              'MISC_CHECK' => {
                'misc_path' => 'somepath'
              }
            }
          }
        end

        it {
          is_expected.to contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with(
            'content' => %r{real_server 10.1.1.2 8081 \{\s+MISC_CHECK \{\s+misc_path somepath\s+\}\s+TCP_CHECK \{\s+connect_port 8081\s+connect_timeout 5\s+\}\s+\}}
          )
        }
      end

      context 'with a real_server with a TCP_CHECK and overwritting real_server_options' do
        let(:params) do
          {
            ip_address: '10.1.1.1',
            port: 8080,
            lb_algo: 'lc',
            tcp_check: { 'connect_timeout' => 5 },
            real_servers: [{ 'ip_address' => '10.1.1.2',
                             'port'       => 8081 }],
            real_server_options: {
              'TCP_CHECK' => {
                'connect_port'    => 42,
                'connect_timeout' => 10
              }
            }
          }
        end

        it {
          is_expected.to contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with(
            'content' => %r{real_server 10.1.1.2 8081 \{\s+TCP_CHECK \{\s+connect_port 42\s+connect_timeout 10\s+\}\s+\}}
          )
        }
      end

      context 'with a real_server without a port should default to VIP port' do
        let(:params) do
          {
            ip_address: '10.1.1.1',
            port: 8080,
            lb_algo: 'lc',
            tcp_check: { 'connect_timeout' => 5 },
            real_servers: [{ 'ip_address' => '10.1.1.2' }]
          }
        end

        it {
          is_expected.to contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with(
            'content' => %r{real_server 10.1.1.2 8080 \{\s+TCP_CHECK \{\s+connect_port 8080\s+connect_timeout 5\s+\}\s+\}}
          )
        }
      end

      context 'two real_servers' do
        let(:params) do
          {
            ip_address: '10.1.1.1',
            port: 8080,
            lb_algo: 'lc',
            real_servers: [{ 'ip_address' => '10.1.1.2',
                             'port'       => 8081 },
                           { 'ip_address' => '10.1.1.3',
                             'port'       => 8082 }]
          }
        end

        it {
          is_expected.to contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with(
            'content' => %r{real_server 10.1.1.2 8081\s+\{\s+\}\s+real_server 10.1.1.3 8082\s+}
          )
        }
      end
    end
  end
end
