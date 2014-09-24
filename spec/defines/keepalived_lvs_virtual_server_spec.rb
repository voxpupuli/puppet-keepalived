
require 'spec_helper'

describe 'keepalived::lvs::virtual_server', :type => 'define' do
  let(:title) { '_TITLE_' }
  let(:facts) { debian_facts }
  let(:pre_condition) { '$concat_basedir = "/tmp"' }

  context 'without parameters' do
    let (:title) { '_TITLE_' }

    it do
      expect { should create_class('keepalived') }.to raise_error(Puppet::Error)
    end
  end

  context 'with bare minimum: ip address, lb_algo and port' do
    let(:params) {
      {
        :ip_address   => '10.1.1.1',
        :port         => '8080',
        :lb_algo      => 'lc',
      }
    }

    it {
      should contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with( {
        'content' => /^group _TITLE_ \{\s+virtual_server 10.1.1.1 8080\s+lb_algo lc\s+lb_kind NAT\s+protocol TCP\s+/
      })
      should contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_-footer').with( {
        'content' => /^\}/
      })
    }
  end

  context 'with optional parameters' do
    let(:params) {
      {
        :ip_address          => '10.1.1.1',
        :port                => '8080',
        :lb_algo             => 'lc',
        :lb_kind             => 'NAT',
        :protocol            => 'UDP',
        :delay_loop          => 60,
        :persistence_timeout => 5,
        :ha_suspend          => true,
        :virtualhost         => 'example.com',
        :alpha               => true,
        :omega               => true,
        :quorum              => 5,
        :hysteresis          => 9,
        :sorry_server        => { 'ip_address' => '10.1.1.3',
                                  'port'       => '999'}
      }
    }
    it { should contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with_content(
        /\s+delay_loop 60\s+lb_algo lc\s+lb_kind NAT\s+persistence_timeout 5\s+ha_suspend\s+virtualhost example.com/
    )}
    it { should contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with_content(
        /\s+alpha\s+omega\s+quorum 5\s+hysteresis 9\s+protocol UDP\s+sorry_server 10.1.1.3 999\s+/
    )}
  end

  context 'with invalid IP address' do
    let(:title) { '_TITLE_' }
    let(:params) {
      {
        :ip_address          => 'rubbish',
        :port                => '8080',
        :lb_algo             => 'lc',
      }
    }

    it do
      expect { should contain_concat__fragment() }.to raise_error(Puppet::Error, /Invalid IP/)
    end
  end

  context 'with invalid port' do
    let(:title) { '_TITLE_' }
    let(:params) {
      {
        :ip_address          => '10.1.1.1',
        :port                => 'something',
        :lb_algo             => 'lc',
      }
    }

    it do
      expect {
        should contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_')
      }.to raise_error(Puppet::Error, /Invalid port/)
    end
  end

  context 'with invalid delay_loop' do
    let(:title) { '_TITLE_' }
    let(:params) {
      {
        :ip_address          => '10.1.1.1',
        :port                => '80',
        :lb_algo             => 'rr',
        :delay_loop          => 'NaN',
      }
    }

    it do
      expect {
        should contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_')
      }.to raise_error(Puppet::Error, /Invalid delay_loop/)
    end
  end

  context 'with invalid lb_algo' do
    let(:title) { '_TITLE_' }
    let(:params) {
      {
        :ip_address          => '10.1.1.1',
        :port                => '80',
        :lb_algo             => 'rubbish',
      }
    }

    it do
      expect {
        should contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_')
      }.to raise_error(Puppet::Error, /Invalid lb_algo/)
    end
  end

  context 'with invalid protocol' do
    let(:title) { '_TITLE_' }
    let(:params) {
      {
        :ip_address          => '10.1.1.1',
        :port                => '80',
        :lb_algo             => 'rr',
        :protocol            => 'ICMP',
      }
    }

    it do
      expect {
        should contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_')
      }.to raise_error(Puppet::Error, /Invalid protocol/)
    end
  end

  context 'with invalid lb_kind' do
    let(:title) { '_TITLE_' }
    let(:params) {
      {
        :ip_address          => '10.1.1.1',
        :port                => '80',
        :lb_algo             => 'rr',
        :lb_kind             => 'BAT',
      }
    }

    it do
      expect {
        should contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_')
      }.to raise_error(Puppet::Error, /Invalid lb_kind/)
    end
  end

  context 'with a single real_server' do
    let(:params) {
      {
        :ip_address   => '10.1.1.1',
        :port         => '8080',
        :lb_algo      => 'lc',
        :real_servers => [ { 'ip_address' => '10.1.1.2',
                             'port'       => '8081'}]
      }
    }

    it {
      should contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with( {
        'content' => /real_server 10.1.1.2 8081 \{\s+\}/
      })
    }
  end

  context 'with a real_server with a TCP_CHECK' do
    let(:params) {
      {
        :ip_address   => '10.1.1.1',
        :port         => '8080',
        :lb_algo      => 'lc',
        :tcp_check    => { 'connect_timeout' => 5 },
        :real_servers => [ { 'ip_address' => '10.1.1.2',
                             'port'       => '8081'}]
      }
    }

    it {
      should contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with( {
        'content' => /real_server 10.1.1.2 8081 \{\s+TCP_CHECK \{\s+connect_port 8081\s+connect_timeout 5\s+\}\s+\}/
      })
    }
  end

  context 'with a real_server with a TCP_CHECK' do
    let(:params) {
      {
        :ip_address   => '10.1.1.1',
        :port         => '8080',
        :lb_algo      => 'lc',
        :tcp_check    => { 'connect_timeout' => 5 },
        :real_servers => [ { 'ip_address' => '10.1.1.2',
                             'port'       => '8081'}]
      }
    }

    it {
      should contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with( {
        'content' => /real_server 10.1.1.2 8081 \{\s+TCP_CHECK \{\s+connect_port 8081\s+connect_timeout 5\s+\}\s+\}/
      })
    }
  end

  context 'with a real_server without a port should default to VIP port' do
    let(:params) {
      {
        :ip_address   => '10.1.1.1',
        :port         => '8080',
        :lb_algo      => 'lc',
        :tcp_check    => { 'connect_timeout' => 5 },
        :real_servers => [ { 'ip_address' => '10.1.1.2'} ]
      }
    }

    it {
      should contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with( {
        'content' => /real_server 10.1.1.2 8080 \{\s+TCP_CHECK \{\s+connect_port 8080\s+connect_timeout 5\s+\}\s+\}/
      })
    }
  end

  context 'two real_servers' do
    let(:params) {
      {
        :ip_address   => '10.1.1.1',
        :port         => '8080',
        :lb_algo      => 'lc',
        :real_servers => [ { 'ip_address' => '10.1.1.2',
                             'port'       => '8081'},
                           { 'ip_address' => '10.1.1.3',
                             'port'       => '8082'}]
      }
    }

    it {
      should contain_concat__fragment('keepalived.conf_lvs_virtual_server__TITLE_').with( {
        'content' => /real_server 10.1.1.2 8081\s+\{\s+\}\s+real_server 10.1.1.3 8082\s+/
      })
    }
  end
end
