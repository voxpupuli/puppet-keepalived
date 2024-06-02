# frozen_string_literal: true

require 'spec_helper'

describe 'keepalived', type: :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      describe 'without parameters' do
        it { is_expected.to create_class('keepalived') }
        it { is_expected.to contain_class('keepalived::install') }
        it { is_expected.to contain_class('keepalived::config') }
        it { is_expected.to contain_class('keepalived::service') }

        it {
          is_expected.to contain_package('keepalived').with(
            'ensure' => 'present'
          )
        }

        it {
          is_expected.to contain_concat('/etc/keepalived/keepalived.conf').with(
            'group' => 'root',
            'mode' => '0644',
            'owner' => 'root'
          )
        }

        it {
          is_expected.to contain_service('keepalived').with(
            'ensure' => 'running',
            'enable' => 'true'
          )
        }
      end

      describe 'with parameter: config_dir' do
        let(:params) { { config_dir: '/foo/bar' } }

        it {
          is_expected.to contain_file('/foo/bar').with(
            'ensure' => 'directory'
          )
        }
      end

      describe 'with parameter: config_dir_mode' do
        let(:params) { { config_dir_mode: '0755' } }

        it {
          is_expected.to contain_file('/etc/keepalived').with(
            'mode' => '0755'
          )
        }
      end

      describe 'with parameter: config_file_mode' do
        let(:params) { { config_file_mode: '0644' } }

        it {
          is_expected.to contain_concat('/etc/keepalived/keepalived.conf').with(
            'mode' => '0644'
          )
        }
      end

      describe 'with parameter: config_group' do
        let(:params) { { config_group: '_VALUE_' } }

        it {
          is_expected.to contain_file('/etc/keepalived').with(
            'group' => '_VALUE_'
          )
        }
      end

      describe 'with parameter: config_owner' do
        let(:params) { { config_owner: '_VALUE_' } }

        it {
          is_expected.to contain_file('/etc/keepalived').with(
            'owner' => '_VALUE_'
          )
        }
      end

      describe 'with parameter: pkg_ensure' do
        let(:params) { { pkg_ensure: '_VALUE_' } }

        it {
          is_expected.to contain_package('keepalived').with(
            'ensure' => '_VALUE_'
          )
        }
      end

      describe 'with parameter: pkg_list' do
        let(:params) { { pkg_list: ['_VALUE_'] } }

        it { is_expected.to contain_package('_VALUE_') }
      end

      describe 'with parameter: service_enable' do
        let(:params) { { service_enable: true } }

        it {
          is_expected.to contain_service('keepalived').with(
            'enable' => true
          )
        }
      end

      describe 'with parameter: service_ensure' do
        let(:params) { { service_ensure: 'running' } }

        it {
          is_expected.to contain_service('keepalived').with(
            'ensure' => 'running'
          )
        }
      end

      describe 'with parameter: service_hasrestart' do
        let(:params) { { service_hasrestart: true } }

        it {
          is_expected.to contain_service('keepalived').with(
            'hasrestart' => true
          )
        }
      end

      describe 'with parameter: service_hasstatus' do
        let(:params) { { service_hasstatus: true } }

        it {
          is_expected.to contain_service('keepalived').with(
            'hasstatus' => true
          )
        }
      end

      describe 'with parameter: service_manage' do
        let(:params) { { service_manage: true } }

        it { is_expected.to contain_service('keepalived') }
      end

      describe 'with parameter: service_name' do
        let(:params) { { service_name: '_VALUE_' } }

        it {
          is_expected.to contain_service('_VALUE_').with(
            'name' => '_VALUE_'
          )
        }
      end

      describe 'with parameter: service_restart' do
        let(:params) { { service_restart: '_VALUE_' } }

        it {
          is_expected.to contain_service('keepalived').with(
            'restart' => '_VALUE_'
          )
        }
      end

      describe 'with parameter: global_defs' do
        let(:params) { { global_defs: { enable_script_security: 'true' } } }

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_globaldefs').with(
              'content' => %r{enable_script_security$}
            )
        }
      end
    end
  end
end
