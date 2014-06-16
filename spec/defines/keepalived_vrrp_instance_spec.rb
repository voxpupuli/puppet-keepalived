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

  describe 'with parameter track_interface' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :interface => '',
        :priority => '',
        :state => '',
        :track_interface => [ '_VALUE_' ],
        :virtual_ipaddress => [ '_VALUE_' ],
        :virtual_router_id => '',
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

  describe 'with parameter notify_script' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :notify_script => '_VALUE_',
        :virtual_ipaddress => [],
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

  describe 'with parameter smtp_alert' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :smtp_alert => true,
        :virtual_ipaddress => [],
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
        'content' => /smtp_alert/
      )
    }
  end

  describe 'with parameter nopreempt' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :nopreempt => true,
        :virtual_ipaddress => [],
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
        'content' => /nopreempt/
      )
    }
  end

  describe 'with parameter notify_script_master' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :notify_script_master => '_VALUE_',
        :virtual_ipaddress => [],
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
        'content' => /notify_master.*_VALUE_/
      )
    }
  end

  describe 'with parameter notify_script_backup' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :notify_script_backup => '_VALUE_',
        :virtual_ipaddress => [],
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
        'content' => /notify_backup.*_VALUE_/
      )
    }
  end

  describe 'with parameter notify_script_fault' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :notify_script_fault => '_VALUE_',
        :virtual_ipaddress => [],
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
        'content' => /notify_fault.*_VALUE_/
      )
    }
  end

  describe 'with parameter notify_script' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :notify_script => '_VALUE_',
        :virtual_ipaddress => [],
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
        'content' => /notify.*_VALUE_/
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

  describe 'with parameter advert_int' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :advert_int => '_VALUE_',
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
        'content' => /advert_int/,
        'content' => /_VALUE_/
      )
    }
  end

 describe 'with parameter garp_master_delay' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :garp_master_delay => '_VALUE_',
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
        'content' => /garp_master_delay/,
        'content' => /_VALUE_/
      )
    }
  end

 describe 'with parameter garp_master_refresh' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :garp_master_refresh => '_VALUE_',
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
        'content' => /garp_master_refresh/,
        'content' => /_VALUE_/
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

  describe 'with virtual_ipaddress as hash' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => { 'ip' => '192.168.1.1'},
        :virtual_router_id => '',
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /^\s+192.168.1.1 dev _VALUE_/
      )
    }
  end

  describe 'with virtual_ipaddress as array of hashes' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [ { 'ip' => '192.168.1.1'},
                                { 'ip' => '192.168.1.2'} ],
        :virtual_router_id => '',
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /192.168.1.1 dev _VALUE_/
      )
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /192.168.1.2 dev _VALUE_/
      )
    }
  end

  # device in hash overrides anything
  describe 'with virtual_ipaddress as hash containing device' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [ { 'ip' => '192.168.1.1',
                                  'dev' => '_DEV_' } ],
        :virtual_router_id => '',
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /192.168.1.1 dev _DEV_/
      )
    }
  end

  describe 'with virtual_ipaddress as hash containing label' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [ { 'ip' => '192.168.1.1',
                                  'label' => '_LABEL_' } ],
        :virtual_router_id => '',
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /192.168.1.1 dev _VALUE_ label _LABEL_/
      )
    }
  end

  describe 'with virtual_ipaddress as hash containing brd' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [ { 'ip' => '192.168.1.1',
                                  'brd' => '_BRD_' } ],
        :virtual_router_id => '',
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /192.168.1.1 dev _VALUE_ brd _BRD_/
      )
    }
  end

  describe 'with virtual_ipaddress as hash containing scope' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [ { 'ip' => '192.168.1.1',
                                  'scope' => '_SCOPE_' } ],
        :virtual_router_id => '',
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /192.168.1.1 dev _VALUE_ scope _SCOPE_/
      )
    }
  end

  describe 'with parameter virtual_ipaddress_excluded' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => '',
        :virtual_ipaddress_excluded => ['192.168.1.1']
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

  describe 'with virtual_ipaddress_excluded as hash' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => '',
        :virtual_ipaddress_excluded => {'ip' => '192.168.1.1'},
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /^\s+192.168.1.1 dev _VALUE_/
      )
    }
  end

  describe 'with virtual_ipaddress_excluded as array of hashes' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => '',
        :virtual_ipaddress_excluded => [ {'ip' => '192.168.1.1'},
                                         {'ip' => '192.168.1.2'} ],
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /192.168.1.1 dev _VALUE_/
      )
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /192.168.1.2 dev _VALUE_/
      )
    }
  end

  # device in hash overrides anything
  describe 'with virtual_ipaddress_excluded as hash containing device' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => '',
        :virtual_ipaddress_excluded => [ {'ip' => '192.168.1.1',
                                          'dev' => '_DEV_'} ],
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /192.168.1.1 dev _DEV_/
      )
    }
  end

  describe 'with virtual_ipaddress_excluded as hash containing label' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => '',
        :virtual_ipaddress_excluded => [ {'ip' => '192.168.1.1',
                                          'label' => '_LABEL_' } ],
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /192.168.1.1 dev _VALUE_ label _LABEL_/
      )
    }
  end

  describe 'with virtual_ipaddress_excluded as hash containing brd' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => '',
        :virtual_ipaddress_excluded => [ {'ip' => '192.168.1.1',
                                         'brd' => '_BRD_'} ],
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /192.168.1.1 dev _VALUE_ brd _BRD_/
      )
    }
  end

  describe 'with virtual_ipaddress_excluded as hash containing scope' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => '',
        :virtual_ipaddress_excluded => [ {'ip' => '192.168.1.1',
                                          'scope' => '_SCOPE_'} ],
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /192.168.1.1 dev _VALUE_ scope _SCOPE_/
      )
    }
  end

  describe 'with parameter virtual_routes not in a hash' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => '',
        :virtual_routes => ['192.168.1.0/24']
      }
    }

    it do
      expect { should contain_concat__fragment() }.to raise_error(Puppet::Error)
    end

  end

  describe 'with virtual_routes as hash' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => '',
        :virtual_routes => {'to' => '10.0.1.0/24', 'via' => '192.168.0.1'},
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /^\s+to 10.0.1.0\/24 via 192.168.0.1/
      )
    }
  end

  describe 'with virtual_routes as array of hashes' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => '',
        :virtual_routes => [ {'to' => '10.0.1.0/24', 'via' => '192.168.0.1'},
                             {'to' => '10.0.2.0/24', 'via' => '192.168.0.2'} ],
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /^\s+to 10.0.1.0\/24 via 192.168.0.1/
      )
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /^\s+to 10.0.2.0\/24 via 192.168.0.2/
      )
    }
  end

  # device in hash overrides anything
  describe 'with virtual_routes as hash containing device parameter' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => '',
        :virtual_routes => [ {'to'  => '10.0.1.0/24',
                              'via' => '192.168.0.1',
                              'dev' => '_DEV_'} ],
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /dev _DEV_ to 10.0.1.0\/24 via 192.168.0.1/
      )
    }
  end

  describe 'with virtual_routes as hash containing src parameter' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => '',
        :virtual_routes => [ {'to'  => '10.0.1.0/24',
                              'via' => '192.168.0.1',
                              'src' => '_SOURCE_'} ],
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /src _SOURCE_ to 10.0.1.0\/24 via 192.168.0.1/
      )
    }
  end

  describe 'with virtual_routes as hash containing scope parameter' do
    let (:title) { '_NAME_' }
    let (:params) {
      {
        :virtual_ipaddress_int => '_VALUE_',
        :interface => '',
        :priority => '',
        :state => '',
        :virtual_ipaddress => [],
        :virtual_router_id => '',
        :virtual_routes => [ {'to'    => '10.0.1.0/24',
                              'via'   => '192.168.0.1',
                              'scope' => '_SCOPE_'} ],
      }
    }

    it { should create_keepalived__vrrp__instance('_NAME_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_instance__NAME_').with(
        'content' => /scope _SCOPE_ to 10.0.1.0\/24 via 192.168.0.1/
      )
    }
  end

end
