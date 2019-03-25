require 'spec_helper'

describe 'keepalived::vrrp::script', type: :define do
  let(:title) { '_TITLE_' }
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

      describe 'with parameter interval' do
        let(:params) do
          {
            interval: '_VALUE_',
            script: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
              'content' => %r{interval.*_VALUE_}
            )
        }
      end

      describe 'with parameter script' do
        let(:params) do
          {
            script: '_VALUE_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
              'content' => %r{script.*_VALUE_}
            )
        }
      end

      describe 'with parameter weight' do
        let(:params) do
          {
            weight: '_VALUE_',
            script: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
              'content' => %r{weight.*_VALUE_}
            )
        }
      end

      describe 'with parameter no_weight' do
        let(:params) do
          {
            no_weight: true,
            script: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
        it {
          is_expected.not_to \
            contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
              'content' => %r{weight.*_VALUE_}
            )
        }
      end

      describe 'with parameter fall' do
        let(:params) do
          {
            fall: '_VALUE_',
            script: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
              'content' => %r{fall.*_VALUE_}
            )
        }
      end

      describe 'with parameter rise' do
        let(:params) do
          {
            rise: '_VALUE_',
            script: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
              'content' => %r{rise.*_VALUE_}
            )
        }
      end

      describe 'with parameter timeout' do
        let(:params) do
          {
            timeout: '_VALUE_',
            script: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
              'content' => %r{timeout.*_VALUE_}
            )
        }
      end

      describe 'with parameter user' do
        let(:params) do
          {
            user: '_VALUE_',
            script: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
              'content' => %r{user.*_VALUE_}
            )
        }
      end

      describe 'with parameter group' do
        let(:params) do
          {
            user: '_USER_VALUE_',
            group: '_GROUP_VALUE_',
            script: '_SCRIPT_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
              'content' => %r{user.*_USER_VALUE_ _GROUP_VALUE_}
            )
        }
      end
    end
  end
end
