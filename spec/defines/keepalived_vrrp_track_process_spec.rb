require 'spec_helper'

describe 'keepalived::vrrp::track_process', type: :define do
  let(:title) { '_PROC_NAME_' }
  let(:pre_condition) do
    'include keepalived'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      describe 'without parameters', type: :define do
        it do
          expect { is_expected.to create_class('keepalived') }.to raise_error(Puppet::Error)
        end
      end

      describe 'with parameter proc_name' do
        let(:params) do
          {
            proc_name: '_PROC_NAME_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__track_process('_PROC_NAME_') }
        it do
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_track_process__PROC_NAME_').with(
              'content' => %r{process.*_PROC_NAME_}
            )
        end
      end

      describe 'with parameter weight' do
        let(:params) do
          {
            weight: 110,
            proc_name: '_PROC_NAME_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__track_process('_PROC_NAME_') }
        it do
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_track_process__PROC_NAME_').with(
              'content' => %r{weight.*110}
            )
        end
      end

      describe 'with parameter quorum' do
        let(:params) do
          {
            quorum:    203,
            proc_name: '_PROC_NAME_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__track_process('_PROC_NAME_') }
        it do
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_track_process__PROC_NAME_').with(
              'content' => %r{quorum.*203}
            )
        end
      end

      describe 'with parameter delay' do
        let(:params) do
          {
            delay:     1200,
            proc_name: '_PROC_NAME_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__track_process('_PROC_NAME_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_track_process__PROC_NAME_').with(
              'content' => %r{delay.*1200}
            )
        }
      end

      describe 'with parameter full_command' do
        let(:params) do
          {
            full_command: true,
            proc_name:   '_PROC_NAME_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__track_process('_PROC_NAME_') }
        it do
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_track_process__PROC_NAME_').with(
              'content' => %r{full_command$}
            )
        end
      end
    end
  end
end
