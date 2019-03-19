require 'spec_helper'

describe 'keepalived::global_defs', type: :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      describe 'without parameters' do
        it { is_expected.to create_class('keepalived::global_defs') }
      end

      describe 'with parameter notification_email' do
        let(:params) do
          {
            notification_email: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{notification_email\s*\{\n\s*_VALUE_}
            )
        }
      end

      describe 'with parameter notification_email' do
        let(:params) do
          {
            notification_email: %w[_VALUE1_ _VALUE2_]
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{notification_email\s*\{\n\s*_VALUE1_\n\s*_VALUE2_}
            )
        }
      end

      describe 'with parameter notification_email_from' do
        let(:params) do
          {
            notification_email_from: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{notification_email_from\s*_VALUE_}
            )
        }
      end

      describe 'with parameter smtp_server' do
        let(:params) do
          {
            smtp_server: '127.0.0.1'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{smtp_server\s*127.0.0.1}
            )
        }
      end

      describe 'with parameter smtp_connect_timeout' do
        let(:params) do
          {
            smtp_connect_timeout: '30'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{smtp_connect_timeout\s*30}
            )
        }
      end

      describe 'with parameter router_id' do
        let(:params) do
          {
            router_id: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{router_id\s*_VALUE_}
            )
        }
      end

      describe 'with parameter script_user' do
        let(:params) do
          {
            script_user: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{script_user _VALUE_$}
            )
        }
      end

      describe 'with parameter enable_script_security' do
        let(:params) do
          {
            enable_script_security: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{enable_script_security$}
            )
        }
      end

      describe 'with parameter enable_snmp_keepalived' do
        let(:params) do
          {
            enable_snmp_keepalived: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{enable_snmp_keepalived$}
            )
        }
      end

      describe 'with parameter enable_snmp_checker' do
        let(:params) do
          {
            enable_snmp_checker: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{enable_snmp_checker$}
            )
        }
      end

      describe 'with parameter enable_snmp_rfc' do
        let(:params) do
          {
            enable_snmp_rfc: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{enable_snmp_rfc$}
            )
        }
      end

      describe 'with parameter enable_snmp_rfcv2' do
        let(:params) do
          {
            enable_snmp_rfcv2: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{enable_snmp_rfcv2$}
            )
        }
      end

      describe 'with parameter enable_snmp_rfcv3' do
        let(:params) do
          {
            enable_snmp_rfcv3: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{enable_snmp_rfcv3$}
            )
        }
      end

      describe 'with parameter enable_traps' do
        let(:params) do
          {
            enable_traps: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{enable_traps$}
            )
        }
      end

      describe 'with parameter snmp_socket' do
        let(:params) do
          {
            snmp_socket: '/path'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{snmp_socket /path$}
            )
        }
      end
    end
  end
end
