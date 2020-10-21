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

      describe 'with parameter process_names' do
        let(:params) do
          {
            process_names: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*process_names$}
            )
        }
      end

      describe 'with parameter process_name' do
        let(:params) do
          {
            process_name: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*process_name\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_process_name' do
        let(:params) do
          {
            vrrp_process_name: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_process_name\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter ipvs_process_name' do
        let(:params) do
          {
            ipvs_process_name: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*ipvs_process_name\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter bfd_process_name' do
        let(:params) do
          {
            bfd_process_name: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*bfd_process_name\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter startup_script' do
        let(:params) do
          {
            startup_script: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*startup_script\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter startup_script_timeout' do
        let(:params) do
          {
            startup_script_timeout: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*startup_script_timeout\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter shutdown_script' do
        let(:params) do
          {
            shutdown_script: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*shutdown_script\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter shutdown_script_timeout' do
        let(:params) do
          {
            shutdown_script_timeout: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*shutdown_script_timeout\s+_VALUE_$}
            )
        }
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
              'content' => %r{^\s*notification_email_from\s+_VALUE_}
            )
        }
      end

      describe 'with parameter smtp_server' do
        let(:params) do
          {
            smtp_server: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*smtp_server\s+_VALUE_}
            )
        }
      end

      describe 'with parameter smtp_connect_timeout' do
        let(:params) do
          {
            smtp_connect_timeout: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*smtp_connect_timeout\s+_VALUE_}
            )
        }
      end

      describe 'with parameter smtp_alert' do
        let(:params) do
          {
            smtp_alert: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*smtp_alert\s+_VALUE_}
            )
        }
      end

      describe 'with parameter smtp_alert_vrrp' do
        let(:params) do
          {
            smtp_alert_vrrp: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*smtp_alert_vrrp\s+_VALUE_}
            )
        }
      end

      describe 'with parameter smtp_alert_checker' do
        let(:params) do
          {
            smtp_alert_checker: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*smtp_alert_checker\s+_VALUE_}
            )
        }
      end

      describe 'with parameter checker_log_all_failures' do
        let(:params) do
          {
            checker_log_all_failures: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*checker_log_all_failures\s+_VALUE_}
            )
        }
      end

      describe 'with parameter no_email_faults' do
        let(:params) do
          {
            no_email_faults: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*no_email_faults$}
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
              'content' => %r{^\s*router_id\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_mcast_group4' do
        let(:params) do
          {
            vrrp_mcast_group4: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_mcast_group4\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_mcast_group6' do
        let(:params) do
          {
            vrrp_mcast_group6: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_mcast_group6\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter default_interface' do
        let(:params) do
          {
            default_interface: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*default_interface\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter lvs_sync_daemon' do
        let(:params) do
          {
            lvs_sync_daemon: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*lvs_sync_daemon\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter lvs_flush' do
        let(:params) do
          {
            lvs_flush: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*lvs_flush$}
            )
        }
      end

      describe 'with parameter lvs_flush_onstop' do
        let(:params) do
          {
            lvs_flush_onstop: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*lvs_flush_onstop$}
            )
        }
      end

      describe 'with parameter lvs_flush_onstop VS' do
        let(:params) do
          {
            lvs_flush_onstop: 'VS'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*lvs_flush_onstop\s+VS$}
            )
        }
      end

      describe 'with parameter vrrp_garp_master_delay' do
        let(:params) do
          {
            vrrp_garp_master_delay: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_garp_master_delay\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_garp_master_repeat' do
        let(:params) do
          {
            vrrp_garp_master_repeat: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_garp_master_repeat\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_garp_lower_prio_delay' do
        let(:params) do
          {
            vrrp_garp_lower_prio_delay: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_garp_lower_prio_delay\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_garp_lower_prio_repeat' do
        let(:params) do
          {
            vrrp_garp_lower_prio_repeat: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_garp_lower_prio_repeat\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_garp_master_refresh' do
        let(:params) do
          {
            vrrp_garp_master_refresh: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_garp_master_refresh\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_garp_master_refresh_repeat' do
        let(:params) do
          {
            vrrp_garp_master_refresh_repeat: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_garp_master_refresh_repeat\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_garp_interval' do
        let(:params) do
          {
            vrrp_garp_interval: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_garp_interval\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_gna_interval' do
        let(:params) do
          {
            vrrp_gna_interval: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_gna_interval\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_min_garp' do
        let(:params) do
          {
            vrrp_min_garp: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_min_garp\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_lower_prio_no_advert' do
        let(:params) do
          {
            vrrp_lower_prio_no_advert: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_lower_prio_no_advert\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_higher_prio_send_advert' do
        let(:params) do
          {
            vrrp_higher_prio_send_advert: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_higher_prio_send_advert\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_version' do
        let(:params) do
          {
            vrrp_version: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_version\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter nftables' do
        let(:params) do
          {
            nftables: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*nftables$}
            )
        }
      end

      describe 'with parameter nftables' do
        let(:params) do
          {
            nftables: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*nftables\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter nftables_priority' do
        let(:params) do
          {
            nftables_priority: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*nftables_priority\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter nftables_counters' do
        let(:params) do
          {
            nftables_counters: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*nftables_counters$}
            )
        }
      end

      describe 'with parameter nftables_ifindex' do
        let(:params) do
          {
            nftables_ifindex: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*nftables_ifindex$}
            )
        }
      end

      describe 'with parameter vrrp_iptables' do
        let(:params) do
          {
            vrrp_iptables: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_iptables$}
            )
        }
      end

      describe 'with parameter vrrp_iptables' do
        let(:params) do
          {
            vrrp_iptables: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_iptables\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_ipsets' do
        let(:params) do
          {
            vrrp_ipsets: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_ipsets\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_check_unicast_src' do
        let(:params) do
          {
            vrrp_check_unicast_src: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_check_unicast_src$}
            )
        }
      end

      describe 'with parameter vrrp_skip_check_adv_addr' do
        let(:params) do
          {
            vrrp_skip_check_adv_addr: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_skip_check_adv_addr$}
            )
        }
      end

      describe 'with parameter vrrp_strict' do
        let(:params) do
          {
            vrrp_strict: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_strict$}
            )
        }
      end

      describe 'with parameter vrrp_notify_priority_changes' do
        let(:params) do
          {
            vrrp_notify_priority_changes: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_notify_priority_changes\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter max_auto_priority' do
        let(:params) do
          {
            max_auto_priority: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*max_auto_priority$}
            )
        }
      end

      describe 'with parameter max_auto_priority' do
        let(:params) do
          {
            max_auto_priority: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*max_auto_priority\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter min_auto_priority_delay' do
        let(:params) do
          {
            min_auto_priority_delay: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*min_auto_priority_delay\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_priority' do
        let(:params) do
          {
            vrrp_priority: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_priority\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter checker_priority' do
        let(:params) do
          {
            checker_priority: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*checker_priority\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter bfd_priority' do
        let(:params) do
          {
            bfd_priority: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*bfd_priority\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_no_swap' do
        let(:params) do
          {
            vrrp_no_swap: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_no_swap$}
            )
        }
      end

      describe 'with parameter checker_no_swap' do
        let(:params) do
          {
            checker_no_swap: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*checker_no_swap$}
            )
        }
      end

      describe 'with parameter bfd_no_swap' do
        let(:params) do
          {
            bfd_no_swap: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*bfd_no_swap$}
            )
        }
      end

      describe 'with parameter vrrp_cpu_affinity' do
        let(:params) do
          {
            vrrp_cpu_affinity: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_cpu_affinity\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter checker_cpu_affinity' do
        let(:params) do
          {
            checker_cpu_affinity: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*checker_cpu_affinity\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter bfd_cpu_affinity' do
        let(:params) do
          {
            bfd_cpu_affinity: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*bfd_cpu_affinity\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_rt_priority' do
        let(:params) do
          {
            vrrp_rt_priority: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_rt_priority\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter checker_rt_priority' do
        let(:params) do
          {
            checker_rt_priority: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*checker_rt_priority\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter bfd_rt_priority' do
        let(:params) do
          {
            bfd_rt_priority: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*bfd_rt_priority\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_rlimit_rttime' do
        let(:params) do
          {
            vrrp_rlimit_rttime: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_rlimit_rttime\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter checker_rlimit_rttime' do
        let(:params) do
          {
            checker_rlimit_rttime: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*checker_rlimit_rttime\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter bfd_rlimit_rttime' do
        let(:params) do
          {
            bfd_rlimit_rttime: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*bfd_rlimit_rttime\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter snmp_socket' do
        let(:params) do
          {
            snmp_socket: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*snmp_socket\s+_VALUE_$}
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
              'content' => %r{^\s*enable_snmp_keepalived$}
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
              'content' => %r{^\s*enable_snmp_vrrp$}
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
              'content' => %r{^\s*enable_snmp_checker$}
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
              'content' => %r{^\s*enable_snmp_rfc$}
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
              'content' => %r{^\s*enable_snmp_rfcv2$}
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
              'content' => %r{^\s*enable_snmp_rfcv3$}
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
              'content' => %r{^\s*enable_traps$}
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
              'content' => %r{^\s*enable_dbus$}
            )
        }
      end

      describe 'with parameter dbus_service_name' do
        let(:params) do
          {
            dbus_service_name: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*dbus_service_name\s+_VALUE_$}
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
              'content' => %r{^\s*script_user\s+_VALUE_$}
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
              'content' => %r{^\s*enable_script_security$}
            )
        }
      end

      describe 'with parameter notify_fifo' do
        let(:params) do
          {
            notify_fifo: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*notify_fifo\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter notify_fifo_script' do
        let(:params) do
          {
            notify_fifo_script: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*notify_fifo_script\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_notify_fifo' do
        let(:params) do
          {
            vrrp_notify_fifo: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_notify_fifo\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_notify_fifo_script' do
        let(:params) do
          {
            vrrp_notify_fifo_script: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_notify_fifo_script\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter lvs_notify_fifo' do
        let(:params) do
          {
            lvs_notify_fifo: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*lvs_notify_fifo\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter lvs_notify_fifo_script' do
        let(:params) do
          {
            lvs_notify_fifo_script: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*lvs_notify_fifo_script\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter dynamic_interfaces' do
        let(:params) do
          {
            dynamic_interfaces: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*dynamic_interfaces$}
            )
        }
      end

      describe 'with parameter dynamic_interfaces allow_if_changes' do
        let(:params) do
          {
            dynamic_interfaces: 'allow_if_changes'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*dynamic_interfaces\s+allow_if_changes$}
            )
        }
      end

      describe 'with parameter vrrp_netlink_cmd_rcv_bufs' do
        let(:params) do
          {
            vrrp_netlink_cmd_rcv_bufs: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_netlink_cmd_rcv_bufs\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_netlink_cmd_rcv_bufs_force' do
        let(:params) do
          {
            vrrp_netlink_cmd_rcv_bufs_force: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_netlink_cmd_rcv_bufs_force\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_netlink_monitor_rcv_bufs' do
        let(:params) do
          {
            vrrp_netlink_monitor_rcv_bufs: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_netlink_monitor_rcv_bufs\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_netlink_monitor_rcv_bufs_force' do
        let(:params) do
          {
            vrrp_netlink_monitor_rcv_bufs_force: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_netlink_monitor_rcv_bufs_force\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter lvs_netlink_cmd_rcv_bufs' do
        let(:params) do
          {
            lvs_netlink_cmd_rcv_bufs: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*lvs_netlink_cmd_rcv_bufs\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter lvs_netlink_cmd_rcv_bufs_force' do
        let(:params) do
          {
            lvs_netlink_cmd_rcv_bufs_force: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*lvs_netlink_cmd_rcv_bufs_force\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter lvs_netlink_monitor_rcv_bufs' do
        let(:params) do
          {
            lvs_netlink_monitor_rcv_bufs: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*lvs_netlink_monitor_rcv_bufs\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter lvs_netlink_monitor_rcv_bufs_force' do
        let(:params) do
          {
            lvs_netlink_monitor_rcv_bufs_force: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*lvs_netlink_monitor_rcv_bufs_force\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter process_monitor_rcv_bufs' do
        let(:params) do
          {
            process_monitor_rcv_bufs: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*process_monitor_rcv_bufs\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter process_monitor_rcv_bufs_force' do
        let(:params) do
          {
            process_monitor_rcv_bufs_force: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*process_monitor_rcv_bufs_force\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_rx_bufs_policy' do
        let(:params) do
          {
            vrrp_rx_bufs_policy: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_rx_bufs_policy\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter vrrp_rx_bufs_multiplier' do
        let(:params) do
          {
            vrrp_rx_bufs_multiplier: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_rx_bufs_multiplier\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter rs_init_notifies' do
        let(:params) do
          {
            rs_init_notifies: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*rs_init_notifies$}
            )
        }
      end

      describe 'with parameter no_checker_emails' do
        let(:params) do
          {
            no_checker_emails: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*no_checker_emails$}
            )
        }
      end

      describe 'with parameter umask' do
        let(:params) do
          {
            umask: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*umask$}
            )
        }
      end

      describe 'with parameter umask' do
        let(:params) do
          {
            umask: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*umask\s+_VALUE_$}
            )
        }
      end



      describe 'with parameter vrrp_startup_delay' do
        let(:params) do
          {
            vrrp_startup_delay: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*vrrp_startup_delay\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter log_unknown_vrids' do
        let(:params) do
          {
            log_unknown_vrids: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*log_unknown_vrids$}
            )
        }
      end

      describe 'with parameter random_seed' do
        let(:params) do
          {
            random_seed: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*random_seed\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter reload_time_file' do
        let(:params) do
          {
            reload_time_file: '_VALUE_'
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*reload_time_file\s+_VALUE_$}
            )
        }
      end

      describe 'with parameter reload_repeat' do
        let(:params) do
          {
            reload_repeat: true
          }
        end

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{^\s*reload_repeat$}
            )
        }
      end
    end
  end
end
