require 'spec_helper'

describe 'keepalived::global_defs', :type => :class do
  let (:facts) { debian_facts }
  let (:pre_condition) { '$concat_basedir = "/tmp"' }

  describe 'without parameters' do
    it { should create_class('keepalived::global_defs') }
  end

  describe 'with parameter notification_email' do
    let (:params) {
      {
        :notification_email => '_VALUE_',
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /notification_email\s*\{\n\s*_VALUE_/
      )
    }
  end

  describe 'with parameter notification_email' do
    let (:params) {
      {
        :notification_email => ['_VALUE1_','_VALUE2_']
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /notification_email\s*\{\n\s*_VALUE1_\n\s*_VALUE2_/
      )
    }
  end

  describe 'with parameter notification_email_from' do
    let (:params) {
      {
        :notification_email_from => '_VALUE_'
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /notification_email_from\s*_VALUE_/
      )
    }
  end

  describe 'with parameter smtp_server' do
    let (:params) {
      {
        :smtp_server => '127.0.0.1'
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /smtp_server\s*127.0.0.1/
      )
    }
  end

  describe 'with parameter smtp_connect_timeout' do
    let (:params) {
      {
        :smtp_connect_timeout => '30'
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /smtp_connect_timeout\s*30/
      )
    }
  end

  describe 'with parameter router_id' do
    let (:params) {
      {
        :router_id => '_VALUE_'
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /router_id\s*_VALUE_/
      )
    }
  end

  describe 'with parameter script_user' do
    let (:params) {
      {
        :script_user => '_VALUE_'
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /script_user _VALUE_$/
      )
    }
  end

  describe 'with parameter enable_script_security' do
    let (:params) {
      {
        :enable_script_security => true
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /enable_script_security$/
      )
    }
  end

  describe 'with parameter enable_snmp_keepalived' do
    let (:params) {
      {
        :enable_snmp_keepalived => true
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /enable_snmp_keepalived$/
      )
    }
  end

  describe 'with parameter enable_snmp_checker' do
    let (:params) {
      {
        :enable_snmp_checker => true
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /enable_snmp_checker$/
      )
    }
  end

  describe 'with parameter enable_snmp_rfc' do
    let (:params) {
      {
        :enable_snmp_rfc => true
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /enable_snmp_rfc$/
      )
    }
  end

  describe 'with parameter enable_snmp_rfcv2' do
    let (:params) {
      {
        :enable_snmp_rfcv2 => true
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /enable_snmp_rfcv2$/
      )
    }
  end

  describe 'with parameter enable_snmp_rfcv3' do
    let (:params) {
      {
        :enable_snmp_rfcv3 => true
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /enable_snmp_rfcv3$/
      )
    }
  end

  describe 'with parameter enable_traps' do
    let (:params) {
      {
        :enable_traps => true
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /enable_traps$/
      )
    }
  end

  describe 'with parameter snmp_socket' do
    let (:params) {
      {
        :snmp_socket => '/path'
      }
    }

    it {
      should \
        contain_concat__fragment('keepalived.conf_globaldefs').with(
        'content' => /snmp_socket \/path$/
      )
    }
  end
end
