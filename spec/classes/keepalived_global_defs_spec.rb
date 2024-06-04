# frozen_string_literal: true

require 'spec_helper'

describe 'keepalived::global_defs', type: :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end
      let(:pre_condition) { 'include keepalived' }

      describe 'without parameters' do
        it { is_expected.to create_class('keepalived::global_defs') }
      end

      describe 'with parameter notification_email as string' do
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

      describe 'with parameter notification_email as array' do
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

      describe 'with parameter enable_snmp_vrrp' do
        let(:params) do
          {
            enable_snmp_vrrp: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{enable_snmp_vrrp$}
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

      describe 'with parameter enable_dbus' do
        let(:params) do
          {
            enable_dbus: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{enable_dbus$}
            )
        }
      end

      describe 'with vrrp_higher_prio_send_advert' do
        let(:params) do
          {
            vrrp_higher_prio_send_advert: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_higher_prio_send_advert true$}
            )
        }
      end

      describe 'with parameter vrrp_garp_lower_prio_repeat' do
        let(:params) do
          {
            vrrp_garp_lower_prio_repeat: 3
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_garp_lower_prio_repeat 3$}
            )
        }
      end

      describe 'with parameter vrrp_garp_master_delay' do
        let(:params) do
          {
            vrrp_garp_master_delay: 30
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_garp_master_delay 30$}
            )
        }
      end

      describe 'with parameter vrrp_garp_master_refresh' do
        let(:params) do
          {
            vrrp_garp_master_refresh: 0
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_garp_master_refresh 0$}
            )
        }
      end

      describe 'with parameter vrrp_garp_master_repeat' do
        let(:params) do
          {
            vrrp_garp_master_repeat: 15
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_garp_master_repeat 15$}
            )
        }
      end

      describe 'with parameter vrrp_garp_master_refresh_repeat' do
        let(:params) do
          {
            vrrp_garp_master_refresh_repeat: 10
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_garp_master_refresh_repeat 10$}
            )
        }
      end

      describe 'with parameter vrrp_garp_lower_prio_delay' do
        let(:params) do
          {
            vrrp_garp_lower_prio_delay: 10
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_garp_lower_prio_delay 10$}
            )
        }
      end

      describe 'with parameter vrrp_startup_delay: 5.5' do
        let(:params) do
          {
            vrrp_startup_delay: 5.5
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_startup_delay 5.5$}
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

      describe 'with parameter bfd_rlimit_rttime: 15000' do
        let(:params) do
          {
            bfd_rlimit_rttime: 15_000
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{bfd_rlimit_rttime 15000$}
            )
        }
      end

      describe 'with parameter checker_rlimit_rttime: 15000' do
        let(:params) do
          {
            checker_rlimit_rttime: 15_000
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{checker_rlimit_rttime 15000$}
            )
        }
      end

      describe 'with parameter vrrp_rlimit_rttime: 15000' do
        let(:params) do
          {
            vrrp_rlimit_rttime: 15_000
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_rlimit_rttime 15000$}
            )
        }
      end

      describe 'with parameter bfd_priority: -15' do
        let(:params) do
          {
            bfd_priority: -15
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{bfd_priority -15$}
            )
        }
      end

      describe 'with parameter checker_priority: -15' do
        let(:params) do
          {
            checker_priority: -15
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{checker_priority -15$}
            )
        }
      end

      describe 'with parameter vrrp_priority: -15' do
        let(:params) do
          {
            vrrp_priority: -15
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_priority -15$}
            )
        }
      end

      describe 'with parameter bfd_rt_priority: 99' do
        let(:params) do
          {
            bfd_rt_priority: 99
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{bfd_rt_priority 99$}
            )
        }
      end

      describe 'with parameter checker_rt_priority: 99' do
        let(:params) do
          {
            checker_rt_priority: 99
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{checker_rt_priority 99$}
            )
        }
      end

      describe 'with parameter vrrp_rt_priority: 99' do
        let(:params) do
          {
            vrrp_rt_priority: 99
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_rt_priority 99$}
            )
        }
      end

      describe 'with parameter bfd_no_swap: true' do
        let(:params) do
          {
            bfd_no_swap: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{bfd_no_swap$}
            )
        }
      end

      describe 'with parameter checker_no_swap: true' do
        let(:params) do
          {
            checker_no_swap: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{checker_no_swap$}
            )
        }
      end

      describe 'with parameter vrrp_no_swap: true' do
        let(:params) do
          {
            vrrp_no_swap: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_no_swap$}
            )
        }
      end

      describe 'with parameter vrrp_check_unicast_src: true' do
        let(:params) do
          {
            vrrp_check_unicast_src: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_check_unicast_src$}
            )
        }
      end

      describe 'with parameter vrrp_version: 3' do
        let(:params) do
          {
            vrrp_version: 3
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_version 3$}
            )
        }
      end

      describe 'with parameter max_auto_priority: 99' do
        let(:params) do
          {
            max_auto_priority: 99
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{max_auto_priority 99$}
            )
        }
      end

      describe 'with parameter dynamic_interfaces: true' do
        let(:params) do
          {
            dynamic_interfaces: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{dynamic_interfaces}
            )
        }
      end

      describe 'with parameter vrrp_notify_fifo: /run/keepalived.fifo' do
        let(:params) do
          {
            vrrp_notify_fifo: '/run/keepalived.fifo'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_notify_fifo /run/keepalived.fifo$}
            )
        }
      end

      describe 'with parameter vrrp_notify_fifo_script: /root/fifo.sh' do
        let(:params) do
          {
            vrrp_notify_fifo_script: '/root/fifo.sh'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_notify_fifo_script /root/fifo.sh$}
            )
        }
      end

      describe 'with parameter vrrp_min_garp: true' do
        let(:params) do
          {
            vrrp_min_garp: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{vrrp_min_garp true}
            )
        }
      end

      describe 'with parameter lvs_sync_daemon (minimal)' do
        let(:params) do
          {
            lvs_sync_daemon: {
              'interface'     => 'eth0',
              'vrrp_instance' => 'VRRP',
            }
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{lvs_sync_daemon eth0 VRRP$}
            )
        }
      end

      describe 'with parameter lvs_sync_daemon (full)' do
        let(:params) do
          {
            lvs_sync_daemon: {
              'interface'     => 'eth0',
              'vrrp_instance' => 'VRRP',
              'id'            => 42,
              'maxlen'        => 4711,
              'port'          => 8848,
              'ttl'           => 128,
              'group'         => '192.0.2.1',
            }
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{lvs_sync_daemon eth0 VRRP id 42 maxlen 4711 port 8848 ttl 128 group 192\.0\.2\.1$}
            )
        }
      end
    end
  end
end
