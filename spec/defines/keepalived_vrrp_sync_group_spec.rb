require 'spec_helper'

describe 'keepalived::vrrp::sync_group', :type => :define do
  let (:facts) { debian_facts }
  let (:pre_condition) { '$concat_basedir = "/tmp"' }

  describe 'without parameters' do
    let (:title) { '_VALUE_' }

    it do
      expect { should create_class('keepalived') }.to raise_error(Puppet::Error)
    end
  end

  describe 'with parameter group' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :group => '_VALUE_',
      }
    }

    it { should create_keepalived__vrrp__sync_group('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
          'content' => /group \{\n\s.*_VALUE_/
      )
    }
  end

  describe 'with parameter group' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :group => ['_VALUE1_','_VALUE2_'],
      }
    }

    it { should create_keepalived__vrrp__sync_group('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
          'content' => /group \{\n\s.*_VALUE1_\n\s.*_VALUE2_/
      )
    }
  end

  describe 'with parameter notify_script_master' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :group => '_GROUP_',
        :notify_script_master => '_SCRIPT_',
      }
    }

    it { should create_keepalived__vrrp__sync_group('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
          'content' => /notify_master\s.*_SCRIPT_/
      )
    }
  end

  describe 'with parameter notify_script_backup' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :group => '_GROUP_',
        :notify_script_backup => '_SCRIPT_',
      }
    }

    it { should create_keepalived__vrrp__sync_group('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
          'content' => /notify_backup\s.*_SCRIPT_/
      )
    }
  end

  describe 'with parameter notify_script_fault' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :group => '_GROUP_',
        :notify_script_fault => '_SCRIPT_',
      }
    }

    it { should create_keepalived__vrrp__sync_group('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
          'content' => /notify_fault\s.*_SCRIPT_/
      )
    }
  end

  describe 'with parameter notify_script' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :group => '_GROUP_',
        :notify_script => '_SCRIPT_',
      }
    }

    it { should create_keepalived__vrrp__sync_group('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
          'content' => /notify\s.*_SCRIPT_/
      )
    }
  end

  describe 'with parameter smtp_alert' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :group => '_GROUP_',
        :smtp_alert => true,
      }
    }

    it { should create_keepalived__vrrp__sync_group('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_sync_group__NAME_').with(
          'content' => /smtp_alert/
      )
    }
  end

end
