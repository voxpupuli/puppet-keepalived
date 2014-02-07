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

end
