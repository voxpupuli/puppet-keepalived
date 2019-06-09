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

      describe 'with parameter notify_script_master' do
        let(:params) do
          {
            group: '_GROUP_',
            notify_script_master: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{notify_master\s.*_SCRIPT_}
            )
        }
      end

      describe 'with parameter notify_script_backup' do
        let(:params) do
          {
            group: '_GROUP_',
            notify_script_backup: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{notify_backup\s.*_SCRIPT_}
            )
        }
      end

      describe 'with parameter notify_script_fault' do
        let(:params) do
          {
            group: '_GROUP_',
            notify_script_fault: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{notify_fault\s.*_SCRIPT_}
            )
        }
      end

      describe 'with parameter notify_script' do
        let(:params) do
          {
            group: '_GROUP_',
            notify_script: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__sync_group('_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
              'content' => %r{notify\s.*_SCRIPT_}
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
              'content' => %r{smtp_alert}
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
              'content' => %r{global_tracking}
            )
        }
      end
    end
  end
end
