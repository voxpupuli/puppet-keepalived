require 'spec_helper'

describe 'keepalived::vrrp::sync_group', type: :define do
  let(:title) { '_NAME_' }
  let(:pre_condition) do
    'include keepalived'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      describe 'without parameters' do
        it do
          expect { is_expected.to create_class('keepalived') }.to raise_error(Puppet::Error)
        end
      end

      describe 'with parameter group' do
        let(:params) do
          {
            group: '_VALUE_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{group \{\n\s.*_VALUE_}
            )
        }
      end

      describe 'with parameter group' do
        let(:params) do
          {
            group: %w[_VALUE1_ _VALUE2_]
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{group \{\n\s.*_VALUE1_\n\s.*_VALUE2_}
            )
        }
      end

      describe 'with parameter track_interface' do
        let(:params) do
          {
            group: '_GROUP_',
            track_interface: '_VALUE_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{track_interface \{\n\s.*_VALUE_}
            )
        }
      end

      describe 'with parameter track_interface' do
        let(:params) do
          {
            group: '_GROUP_',
            track_interface: %w[_VALUE1_ _VALUE2_]
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{track_interface \{\n\s.*_VALUE1_\n\s.*_VALUE2_}
            )
        }
      end

      describe 'with parameter track_script' do
        let(:params) do
          {
            group: '_GROUP_',
            track_script: '_VALUE_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{track_script \{\n\s.*_VALUE_}
            )
        }
      end

      describe 'with parameter track_script' do
        let(:params) do
          {
            group: '_GROUP_',
            track_script: %w[_VALUE1_ _VALUE2_]
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{track_script \{\n\s.*_VALUE1_\n\s.*_VALUE2_}
            )
        }
      end

      describe 'with parameter track_file' do
        let(:params) do
          {
            group: '_GROUP_',
            track_file: '_VALUE_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{track_file \{\n\s.*_VALUE_}
            )
        }
      end

      describe 'with parameter track_file' do
        let(:params) do
          {
            group: '_GROUP_',
            track_file: %w[_VALUE1_ _VALUE2_]
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{track_file \{\n\s.*_VALUE1_\n\s.*_VALUE2_}
            )
        }
      end

      describe 'with parameter track_process' do
        let(:params) do
          {
            group: '_GROUP_',
            track_process: '_VALUE_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{track_process \{\n\s.*_VALUE_}
            )
        }
      end

      describe 'with parameter track_process' do
        let(:params) do
          {
            group: '_GROUP_',
            track_process: %w[_VALUE1_ _VALUE2_]
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{track_process \{\n\s.*_VALUE1_\n\s.*_VALUE2_}
            )
        }
      end

      describe 'with parameter track_bfd' do
        let(:params) do
          {
            group: '_GROUP_',
            track_bfd: '_VALUE_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{track_bfd \{\n\s.*_VALUE_}
            )
        }
      end

      describe 'with parameter track_bfd' do
        let(:params) do
          {
            group: '_GROUP_',
            track_bfd: %w[_VALUE1_ _VALUE2_]
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{track_bfd \{\n\s.*_VALUE1_\n\s.*_VALUE2_}
            )
        }
      end

      describe 'with parameter notify_master' do
        let(:params) do
          {
            group: '_GROUP_',
            notify_master: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{^\s*notify_master\s+_SCRIPT_$}
            )
        }
      end

      describe 'with parameter notify_backup' do
        let(:params) do
          {
            group: '_GROUP_',
            notify_backup: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{^\s*notify_backup\s+_SCRIPT_$}
            )
        }
      end

      describe 'with parameter notify_fault' do
        let(:params) do
          {
            group: '_GROUP_',
            notify_fault: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{^\s*notify_fault\s+_SCRIPT_$}
            )
        }
      end

      describe 'with parameter notify_stop' do
        let(:params) do
          {
            group: '_GROUP_',
            notify_stop: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{^\s*notify_stop\s+_SCRIPT_$}
            )
        }
      end

      describe 'with parameter notify_deleted' do
        let(:params) do
          {
            group: '_GROUP_',
            notify_deleted: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{^\s*notify_deleted\s+_SCRIPT_$}
            )
        }
      end

      describe 'with parameter notify_deleted' do
        let(:params) do
          {
            group: '_GROUP_',
            notify_deleted: true
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{^\s*notify_deleted$}
            )
        }
      end

      describe 'with parameter notify' do
        let(:params) do
          {
            group: '_GROUP_',
            notify: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{^\s+notify\s+_SCRIPT_$}
            )
        }
      end

      describe 'with parameter notify_priority_changes' do
        let(:params) do
          {
            group: '_GROUP_',
            notify_priority_changes: true
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{^\s+notify_priority_changes$}
            )
        }
      end

      describe 'with parameter smtp_alert' do
        let(:params) do
          {
            group: '_GROUP_',
            smtp_alert: true
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{^\s+smtp_alert$}
            )
        }
      end

      describe 'with parameter global_tracking' do
        let(:params) do
          {
            group: '_GROUP_',
            global_tracking: true
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{^\s+global_tracking$}
            )
        }
      end

      describe 'with parameter sync_group_tracking_weight' do
        let(:params) do
          {
            group: '_GROUP_',
            sync_group_tracking_weight: true
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{^\s+sync_group_tracking_weight$}
            )
        }
      end
    end
  end
end
