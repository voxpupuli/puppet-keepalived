require 'spec_helper'

describe 'keepalived::vrrp::script', type: :define do
  let (:facts) { debian_facts }
  let (:pre_condition) { '$concat_basedir = "/tmp"' }

  describe 'without parameters', type: :define do
    let (:facts) { debian_facts }
    let (:title) { '_TITLE_' }

    it do
      expect { is_expected.to create_class('keepalived') }.to raise_error(Puppet::Error)
    end
  end

  describe 'with parameter interval' do
    let (:title) { '_TITLE_' }
    let (:params) do
      {
        interval: '_VALUE_',
        script: '_SCRIPT_'
      }
    end

    it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
          'content' => /interval.*_VALUE_/
        )
    }
  end

  describe 'with parameter script' do
    let (:title) { '_TITLE_' }
    let (:params) do
      {
        script: '_VALUE_'
      }
    end

    it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
          'content' => /script.*_VALUE_/
        )
    }
  end

  describe 'with parameter weight' do
    let (:title) { '_TITLE_' }
    let (:params) do
      {
        weight: '_VALUE_',
        script: '_SCRIPT_'
      }
    end

    it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
          'content' => /weight.*_VALUE_/
        )
    }
  end

  describe 'with parameter no_weight' do
    let (:title) { '_TITLE_' }
    let (:params) do
      {
        no_weight: true,
        script: '_SCRIPT_'
      }
    end

    it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
    it {
      is_expected.not_to \
        contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
          'content' => /weight.*_VALUE_/
        )
    }
  end

  describe 'with parameter fall' do
    let (:title) { '_TITLE_' }
    let (:params) do
      {
        fall: '_VALUE_',
        script: '_SCRIPT_'
      }
    end

    it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
          'content' => /fall.*_VALUE_/
        )
    }
  end

  describe 'with parameter rise' do
    let (:title) { '_TITLE_' }
    let (:params) do
      {
        rise: '_VALUE_',
        script: '_SCRIPT_'
      }
    end

    it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
          'content' => /rise.*_VALUE_/
        )
    }
  end

  describe 'with parameter timeout' do
    let (:title) { '_TITLE_' }
    let (:params) do
      {
        timeout: '_VALUE_',
        script: '_SCRIPT_'
      }
    end

    it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
          'content' => /timeout.*_VALUE_/
        )
    }
  end

  describe 'with parameter user' do
    let (:title) { '_TITLE_' }
    let (:params) do
      {
        user: '_VALUE_',
        script: '_SCRIPT_'
      }
    end

    it { is_expected.to create_keepalived__vrrp__script('_TITLE_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
          'content' => /user.*_VALUE_/
        )
    }
  end

  describe 'with parameter group' do
    let (:title) { '_TITLE_' }
    let (:params) do
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
          'content' => /user.*_USER_VALUE_ _GROUP_VALUE_/
        )
    }
  end
end
