require 'spec_helper'

describe 'keepalived::vrrp::script', :type => :define do
  let (:facts) { debian_facts }
  let (:pre_condition) { '$concat_basedir = "/tmp"' }

  describe 'without parameters', :type => :define do
    let (:facts) { debian_facts }
    let (:title) { '_TITLE_' }

    it do
      expect { should create_class('keepalived') }.to raise_error(Puppet::Error)
    end
  end

  describe 'with parameter interval' do
    let (:title) { '_TITLE_' }
    let (:params) {
      {
        :interval => '_VALUE_',
        :script => '_SCRIPT_'
      }
    }

    it { should create_keepalived__vrrp__script('_TITLE_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
          'content' => /interval.*_VALUE_/
      )
    }
  end

  describe 'with parameter script' do
    let (:title) { '_TITLE_' }
    let (:params) {
      {
        :script => '_VALUE_'
      }
    }

    it { should create_keepalived__vrrp__script('_TITLE_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
          'content' => /script.*_VALUE_/
      )
    }
  end

  describe 'with parameter weight' do
    let (:title) { '_TITLE_' }
    let (:params) {
      {
        :weight => '_VALUE_',
        :script => '_SCRIPT_'
      }
    }

    it { should create_keepalived__vrrp__script('_TITLE_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
          'content' => /weight.*_VALUE_/
      )
    }
  end

  describe 'with parameter no_weight' do
    let (:title) { '_TITLE_' }
    let (:params) {
      {
        :no_weight => true,
        :script => '_SCRIPT_'
      }
    }

    it { should create_keepalived__vrrp__script('_TITLE_') }
    it {
      should_not \
        contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
          'content' => /weight.*_VALUE_/
      )
    }
  end

  describe 'with parameter fall' do
    let (:title) { '_TITLE_' }
    let (:params) {
      {
        :fall   => '_VALUE_',
        :script => '_SCRIPT_'
      }
    }

    it { should create_keepalived__vrrp__script('_TITLE_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
          'content' => /fall.*_VALUE_/
      )
    }
  end

  describe 'with parameter rise' do
    let (:title) { '_TITLE_' }
    let (:params) {
      {
        :rise   => '_VALUE_',
        :script => '_SCRIPT_'
      }
    }

    it { should create_keepalived__vrrp__script('_TITLE_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_script__TITLE_').with(
          'content' => /rise.*_VALUE_/
      )
    }
  end
end

