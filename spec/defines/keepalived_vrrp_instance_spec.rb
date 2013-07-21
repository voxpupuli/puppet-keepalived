require 'spec_helper'

describe 'keepalived::vrrp::instance', :type => :define do
  let (:facts) { debian_facts }
  let (:pre_condition) { '$concat_basedir = "/tmp"' }

  describe 'without parameters' do
    let (:title) { '_VALUE_' }

    it do
      expect { should create_class('keepalived') }.to raise_error(Puppet::Error)
    end
  end

  describe 'with parameter interface' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :interface => '_VALUE_',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => ''
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /interface.*_VALUE_/
      )
    }
  end

  describe 'with parameter priority' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :priority => '_VALUE_',
        :interface => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => ''
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
          'content' => /priority.*_VALUE_/
      )
    }
  end

  describe 'with parameter state' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :state => '_VALUE_',
        :interface => '',
        :priority => '',
        :virtual_ipaddress => [],
        :virtual_router_id => ''
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /state.*_VALUE_/
      )
    }
  end

  describe 'with parameter virtual_ipaddress' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress => [ '_VALUE_' ],
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_router_id => ''
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /_VALUE_/
      )
    }
  end

  describe 'with parameter virtual_router_id' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_router_id => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => []
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /virtual_router_id.*_VALUE_/
      )
    }
  end

  describe 'with parameter: ensure' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :ensure => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => ''
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'ensure' => /_VALUE_/
      )
    }
  end

  describe 'with parameter auth_type' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :auth_type => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => ''
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /auth_type.*_VALUE_/
      )
    }
  end

  describe 'with parameter auth_pass' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :auth_type => '_AUTH_TYPE_',
        :auth_pass => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => ''
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /auth_pass.*_VALUE_/
      )
    }
  end

  describe 'with parameter track_script' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :track_script => [ '_VALUE_' ],
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => ''
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /track_script/,
        'content' => /_VALUE_/
      )
    }
  end

  describe 'with parameter lvs_interface' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :lvs_interface => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => ''
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /lvs_sync_daemon_interface _VALUE_/
      )
    }
  end

  describe 'with parameter virtual_ipaddress_int' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => ['192.168.1.1'],
        :virtual_router_id => ''
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /192.168.1.1 dev _VALUE_/
      )
    }
    end
end
